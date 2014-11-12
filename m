Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XoVyp-00089V-OP
 for linux-mtd@lists.infradead.org; Wed, 12 Nov 2014 11:20:56 +0000
Message-ID: <1415791229.22887.206.camel@sauron.fi.intel.com>
Subject: Re: suspect UBIFS async operations causing issues during reboot
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Scott Branden <sbranden@broadcom.com>
Date: Wed, 12 Nov 2014 13:20:29 +0200
In-Reply-To: <5459E090.1010300@broadcom.com>
References: <5459E090.1010300@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
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

Hi Scott,

sorry for late reply, but better later than never.

On Wed, 2014-11-05 at 00:32 -0800, Scott Branden wrote:
> Over 1000's of reboots we eventually find that the NAND has 
> uncorrectable ECC errors reported on a random page when it is mounted.

How do you find the uncorrectable errors? Do you scan the entire NAND
chip after you boot up? Or do you read all files stored in the UBIFS
file-system, or you do not do anything special, just mount and notice
ECC error messages in dmesg? Does UBIFS fail to mount?

What is the time-window where power cut may lead to problems in your
NAND. And how these problems are seen by the software? I mean, what
happens to the data? Can it become "mostly OK", except of one or few
pages with too many bit-flips? I understand that during erase all 0 bits
"become 1s", but not instanteneously, so in case of an interrupt they
may read as 1 or 0 randomly. But the bits which were 1s - nothing
happens, they stay to be 1s?

> We suspect the problem is the asynchronous nature of the UBIFS 
> operations.  Perhaps the small write buffer that can take 3-5 seconds to 
> be written or some other operation occuring in UBI/UBIFS?  I don't think 
> the shutdown of the filesystem is dealing with all the threads properly.

Yes, writes are asynchronous. There is the write-buffer of the NAND page
size, and there is Linux write-back, which flushes dirty data in
background (standard stuff for all file-systems)

> <REBOOT happens here with NAND ERASE COMMAND in progress corrupting 
> 0x18700000 NAND Addresses!>  Corrupted NAND only happens when erase 
> operation in progress when restarting system happens.

I acknowledge that there may be problems with interrupted erase. We saw
them in case of NOR, where erase is very slow and it is easy to
interrupt it. We never saw this for NAND, but I may well imagine that
this may be an issue in case of NAND.

For NOR, we mitigated the issue by "invalidating" the PEB before
erasing. Check the 'nor_erase_prepare()' function in
'drivers/mtd/ubi/io.c' and its commentaries.

The first thing you may try is - add a similar quick hack to UBI and
invalidate the first NAND page or the first 2 NAND pages (depends on
whether you use sub-pages or not).

You can just write all zeroes. The point is to corrupt data, so that the
subsequent read results in a CRC check failure.

See what happens.


Some general notes.

In general, if UBI or UBIFS decided to erase an LEB, the data in there
are not longer needed. E.g., when GC of UBIFS moves all the valid data
to another PEB, the older PEB is not needed, it is scheduled for
erasure. The erasure happens asynchronously. If you have a power cut,
and the PEB erase operation was interrupted, and you end up with a PEB
which is "mostly fine", son next time you mount UBIFS it may start
reading from it (e.g., if this was a journal PEB), and get errors.

Now, my point is that this should not be a fundamental problem for
UBIFS. This should be fixable. It may need good UBIFS knowledge to fix,
and time, though.

One way to deal with this is to emulate erase interruptions at UBI
level. Similarly how we implemented the power cut testing infrastructure
in UBIFS.

On the other hand, if you can invalidate the PEB before you start
erasing, this should just solve the problem. So I'd start with this, and
see what happens. You may have more than one type of issues, so fixing
the erase interrupt issue this way quickly may let you exlculde this
type of problems. And generally, I am not opposed to this solution in
upstream too, if it works for everyone.
