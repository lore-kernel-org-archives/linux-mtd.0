Received: from smtp.nokia.com ([147.243.128.26] helo=mgw-da02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q5eXT-0001SG-FG
	for linux-mtd@lists.infradead.org; Fri, 01 Apr 2011 13:37:24 +0000
Subject: Re: UBI: why was UBI reboot notifier removed
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Jose Nimni <jose_nimni@yahoo.com>
In-Reply-To: <581860.7993.qm@web114007.mail.gq1.yahoo.com>
References: <581860.7993.qm@web114007.mail.gq1.yahoo.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 01 Apr 2011 16:34:53 +0300
Message-ID: <1301664893.2789.74.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: cernekee@gmail.com, linux-mtd@lists.infradead.org
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Wed, 2011-03-30 at 07:43 -0700, Jose Nimni wrote:
> I wanted to ask you a question regarding the change you made in UBI, when you 
> removed the UBI reboot notifier. (commit "UBI: remove reboot notifier")
> 
> I have omap3530 processor, working with numonyx NOR flashe PF2800AP33EF (intel 
> command set).
> I am working with linux omap kernel 2.6.34, but patched it with the newest UBI 
> directory (i needed the new patches for NOR PEBs).
> 
> i have seen that if i write a lot data to the NOR flash, 2 things happen:
> 1. UBIFS thread are flushing the data to the flash for quite some time.
> 2. ubi_bgt0d is working after that, cleaning up some PEBs.
> 
> if i reboot just after the write process returned, the flashed are unmounted 
> (after waiting for ubifs to finish flushing).
> but when the sigkills are sent,  a UBI error is occuring:
> UBI error: ubi_io_read: error -5 while reading 64 bytes from PEB x:y, read 0 
> bytes.
> UBI error: nor_erase_prepare: cannot invalidate PEB X, write returned -5 read 
> returned -5
> ....
> ubi_thread: ubi_bgt0d: work failed with error code -5.

OK, reboot notifiers again :-)

About the question why they were removed? I think the primary driver was
that they cause issues with suspend, see here:

http://thread.gmane.org/gmane.linux.drivers.mtd/29143/focus=29681

Kevin provided an excellent description in the corresponding NOR commit
message:

https://groups.google.com/group/fa.linux.kernel/browse_thread/thread/cbe1baeb0cc906f9?fwc=1&hl=en&pli=1

> after some research, i saw that you removed the UBI reboot notifier, that used 
> to kill ubi_bgt thread.
> now, during shutdown, the cfi_cmdset_0001.c driver does not allow any 
> communication with the flash - but the bgt thread is still alive, so it gets a 
> read/write error (-EIO).

Well, in your case these messages are harmless, but I agree that this is
not nice. I think the best way to fix this would be to make the CFI code
return a special error code in this case, e.g., -EBUSY. Then UBI thread
could wait and re-try without printing warnings.

Could you do this?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
