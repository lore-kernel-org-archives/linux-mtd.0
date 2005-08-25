Received: from webapps.arcom.com ([194.200.159.168])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E8IOv-0003mL-Hh
	for linux-mtd@lists.infradead.org; Thu, 25 Aug 2005 10:08:29 -0400
From: Ian Campbell <icampbell@arcom.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Thu, 25 Aug 2005 15:08:14 +0100
Message-Id: <1124978894.17190.40.camel@icampbell-debian>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: problem with strataflash after suspend and resume
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have a PXA255 (Xscale/ARM) platform with a strataflash part on it
(28F128J3). With 2.6.11.11 (the only previous version I have convenient
access to) I can suspend and resume repeatedly just fine, however with
2.6.13-rc7 I occasionally get something like this just after resume:

        Waiting for chip to be ready timed out. Status 0
        Write of 68 bytes at 0x00b99f3c failed. returned -5, retlen 0
        Not marking the space at 0x00b99f3c as dirty because the flash driver returned retlen zero

Any attempt to write a file results in a similar message.

Once it has occurred it seems to happen every time unless I do an
mtd-unlock. Doing an mtd-unlock on the device seems to fix it (most of
the time) even though I don't think the device is locked (I didn't lock
it and J3 parts don't reset locked). I've occasionally observed that
just doing "dd if=/dev/mtd1 of=/dev/null bs=1 count=0" seems to work
too. Other times it seems to sort itself out if left alone for a bit
(but not consistently).

The error originates in drivers/mtd/chips/cfi_cmdset_0001.c get_chip()
which is returning EIO at line 659. The call is made via
cfi_intelext_write_buffers() which calls do_write_buffer() which calls
get_chip().

I've seen status 0 as well as 0xF018, 0xFF0A, 0x203A, 0x4946, 0x7465,
0x312e -- none of which appear to make much sense and I suspect they are
just garbage.

I also occasionally see "SR.4 or SR.5 bits set in buffer write (status
8dff). Clearing." after resume but they don't appear to be a problem...

The flash would appear to be readable, since resuming involves running
the very early parts of the bootloader, which is stored in flash.

I've also tried using the latest MTD CVS stuff on top of 2.6.13-rc7 but
have the same problem.

Any ideas? I'd blame hardware if 2.6.11.11 didn't appear to work
flawlessly... (I can do 30+ suspend resume iterations with 2.6.11.11,
with 2.6.13-rc7 I'm lucky to get 4).

Thanks,
Ian.
-- 
Ian Campbell, Senior Design Engineer
                                        Web: http://www.arcom.com
Arcom, Clifton Road,                    Direct: +44 (0)1223 403 465
Cambridge CB1 7EA, United Kingdom       Phone:  +44 (0)1223 411 200
