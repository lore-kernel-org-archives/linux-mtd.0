Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Iq5X-000470-00
	for <linux-mtd@lists.infradead.org>; Fri, 14 Jun 2002 13:21:59 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020614095923.98432.qmail@web21502.mail.yahoo.com> 
References: <20020614095923.98432.qmail@web21502.mail.yahoo.com> 
To: Studying MTD <studying_mtd@yahoo.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: why MTD model ? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 14 Jun 2002 13:21:56 +0100
Message-ID: <1358.1024057316@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

studying_mtd@yahoo.com said:
>  If some how i solve these issues :- 
> 1. sector size
> 2. erase/write
> 3. wear levelling

The core MTD API isn't there to solve those issues for you, only to
represent the raw hardware -- and we have existing drivers for many types of
raw hardware.

Those issues are solved by whatever _uses_ the MTD devices -- and there are 
a number of solutions already implemented in the MTD code base. The most
sensible way to put a file system on flash is to use a file system
especially designed for that purpose -- such as JFFS2. However, for legacy 
reasons we also have code which uses MTD devices to emulate hard drives, as 
for some strange and inexplicable reason you seem to want.

In the days of DOS, it was difficult to add a real file system, so instead 
people came up with a gross hack to make a flash device appear just like a 
normal BIOS-supported disk drive.

They designed a pseudo-filesystem which emulated a hard drive, and then
provided a BIOS extension which overrode the INT 13h (Disk BIOS) interrupt
handler. Then people would just use a FAT file system on it under DOS as if
it was a normal hard drive. 

When Windows started to gain its own 32-bit device drivers for hard drives, 
the pseudo-filesystems that emulated hard drives were rewritten to run 
under Windows, but people were so used to the idea of a pseudo-fs emulating 
a block device with a 'real' fs on top of that, that the opportunity wasn't 
taken to make the whole thing sane just by having a proper file system 
directly on the flash.

The only half-sane reason for using a translation layer to emulate a block 
device like this is on removable media -- if you need to be able to remove 
the flash device from your Linux box and read it in a DOS or Windows box. 

If your flash isn't going to be removable, then you really don't want to do 
it that way, for reasons which I've discussed at length quite recently.

You should be using a proper file system directly on the flash. This is not 
DOS, and you don't have to repeat DOS-based mistakes.

> Please let me know, which block device is closest to Flash memory :-
> 1. Hard Disk 2. Floppy drive 3. PCMCIA memory card 4. Ramdisk 5. or
> some other block device ? 

Your question is very ambiguous. You might as well ask which tropical fish 
is closest to flash memory. No block device is _similar_ to flash -- they are 
entirely different beasts.

I suppose the hard drive sitting on my desk with a pile of flash chips on 
top of it is 'closest to Flash memory' in one way, but I suspect that's not 
what you were asking.

If you mean which block device is most similar in performance and general 
operation to a system which uses flash to emulate a block device, then the 
answer would be PCMCIA-ATA or CompactFlash cards -- because they _are_ 
using precisely such a translation layer internally. The only difference is 
that they do it internally, in firmware (and generally quite unreliably).

If you mean which block device driver code is most similar to the code 
you'd have to write to implement yet another translation layer, then that 
would be something like the FTL or NFTL code -- they both use the 
underlying MTD drivers for the raw hardware, and perform their own magic 
to present a block device implementation to Linux.

--
dwmw2
