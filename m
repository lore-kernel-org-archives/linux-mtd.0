Received: from mail-gw2-out.broadcom.com ([216.31.210.63])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XpU4b-0002aT-7a
 for linux-mtd@lists.infradead.org; Sat, 15 Nov 2014 03:30:54 +0000
Message-ID: <5466C8D5.5060906@broadcom.com>
Date: Fri, 14 Nov 2014 19:30:29 -0800
From: Scott Branden <sbranden@broadcom.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: suspect UBIFS async operations causing issues during reboot
References: <5459E090.1010300@broadcom.com>
 <1415791229.22887.206.camel@sauron.fi.intel.com>
In-Reply-To: <1415791229.22887.206.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

Thanks for your response.  We have completed our testing and solved the 
issue by adding a reboot notifier - one was added to 
chips/cfi_cmdset_0002.c and chips/cfi_cmdset_0001.c to solve the problem 
5 years ago on NOR devices.

See comments inline and proposed fix at bottom - I can then send out an 
patch for review.

On 14-11-12 03:20 AM, Artem Bityutskiy wrote:
> Hi Scott,
>
> sorry for late reply, but better later than never.
>
> On Wed, 2014-11-05 at 00:32 -0800, Scott Branden wrote:
>> Over 1000's of reboots we eventually find that the NAND has
>> uncorrectable ECC errors reported on a random page when it is mounted.
>
> How do you find the uncorrectable errors? Do you scan the entire NAND
> chip after you boot up? Or do you read all files stored in the UBIFS
> file-system, or you do not do anything special, just mount and notice
> ECC error messages in dmesg? Does UBIFS fail to mount?
We just mount and notice the ECC error messages.  UBIFS does not fail to 
mount, it handles the situation.  But there shouldn't be error messages 
generated in the first place due to a reboot.
>
> What is the time-window where power cut may lead to problems in your
> NAND. And how these problems are seen by the software? I mean, what
> happens to the data? Can it become "mostly OK", except of one or few
> pages with too many bit-flips? I understand that during erase all 0 bits
> "become 1s", but not instanteneously, so in case of an interrupt they
> may read as 1 or 0 randomly. But the bits which were 1s - nothing
> happens, they stay to be 1s?
Yes, the bits are in the middle of erase so most are 1's and some are 
still 0.
>
>> We suspect the problem is the asynchronous nature of the UBIFS
>> operations.  Perhaps the small write buffer that can take 3-5 seconds to
>> be written or some other operation occuring in UBI/UBIFS?  I don't think
>> the shutdown of the filesystem is dealing with all the threads properly.
>
> Yes, writes are asynchronous. There is the write-buffer of the NAND page
> size, and there is Linux write-back, which flushes dirty data in
> background (standard stuff for all file-systems)
>
>> <REBOOT happens here with NAND ERASE COMMAND in progress corrupting
>> 0x18700000 NAND Addresses!>  Corrupted NAND only happens when erase
>> operation in progress when restarting system happens.
>
> I acknowledge that there may be problems with interrupted erase. We saw
> them in case of NOR, where erase is very slow and it is easy to
> interrupt it. We never saw this for NAND, but I may well imagine that
> this may be an issue in case of NAND.
Yes, we hit the situation.
>
> For NOR, we mitigated the issue by "invalidating" the PEB before
> erasing. Check the 'nor_erase_prepare()' function in
> 'drivers/mtd/ubi/io.c' and its commentaries.
>
> The first thing you may try is - add a similar quick hack to UBI and
> invalidate the first NAND page or the first 2 NAND pages (depends on
> whether you use sub-pages or not).
>
> You can just write all zeroes. The point is to corrupt data, so that the
> subsequent read results in a CRC check failure.
>
> See what happens.
>
>
> Some general notes.
>
> In general, if UBI or UBIFS decided to erase an LEB, the data in there
> are not longer needed. E.g., when GC of UBIFS moves all the valid data
> to another PEB, the older PEB is not needed, it is scheduled for
> erasure. The erasure happens asynchronously. If you have a power cut,
> and the PEB erase operation was interrupted, and you end up with a PEB
> which is "mostly fine", son next time you mount UBIFS it may start
> reading from it (e.g., if this was a journal PEB), and get errors.
>
> Now, my point is that this should not be a fundamental problem for
> UBIFS. This should be fixable. It may need good UBIFS knowledge to fix,
> and time, though.
>
> One way to deal with this is to emulate erase interruptions at UBI
> level. Similarly how we implemented the power cut testing infrastructure
> in UBIFS.
>
> On the other hand, if you can invalidate the PEB before you start
> erasing, this should just solve the problem. So I'd start with this, and
> see what happens. You may have more than one type of issues, so fixing
> the erase interrupt issue this way quickly may let you exlculde this
> type of problems. And generally, I am not opposed to this solution in
> upstream too, if it works for everyone.
We add nand_shutdown to nand_base:

+/**
+ * nand_shutdown - [NAND Interface] finish the current nand operation and
+ *                 prevent further operations
+ * @mtd: MTD device structure
+ */
+int nand_shutdown(struct mtd_info *mtd)
+{
+	return nand_get_device(mtd, FL_SHUTDOWN);
+}
+EXPORT_SYMBOL_GPL(nand_shutdown);

We call nand_shutdown routine from the reboot notifier we add in our 
iproc driver (to be upstreamed soon).

+static int iproc_nand_reboot_notifier(struct notifier_block *n,
+				      unsigned long state,
+				      void *cmd)
+{
+	struct mtd_info *mtd;
+
+	mtd = container_of(n, struct mtd_info, reboot_notifier);
+	nand_shutdown(mtd);
+	return NOTIFY_DONE;
+}

If the reboot notifier can always be added somewhere in mtd it could be 
moved out of driver and always called?
