Received: from tomts9.bellnexxia.net ([209.226.175.53] helo=tomts9-srv.bellnexxia.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16gcr6-0001JE-00
	for <linux-mtd@lists.infradead.org>; Fri, 01 Mar 2002 02:33:09 +0000
Date: Thu, 28 Feb 2002 21:44:11 -0500 (EST)
From: Ilguiz Latypov <ilatypov@superbt.com>
To: "Yoshinori K. Okuji" <okuji@enbug.org>
cc: GRUB mailing list <bug-grub@gnu.org>,
   David Woodhouse <dwmw2@infradead.org>,
   Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: DiskOnChip 2000 and Millenium support in GRUB bootloader
In-Reply-To: <87k7sxevml.wl@enter.planet.of.kuicr.kyoto-u.ac.jp>
Message-ID: <Pine.LNX.4.44.0202281551400.1054-100000@server.superbt.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Yoshinori,

1. I cleaned up the patch with regard to the debugging leftovers.  Do you 
think I need to remove extra debug information activated by the DOC_DEBUG 
switch (dprintf calls)?  What other adjustments are necessary?

2. Besides, I changed stage1/doc_stage1{,b}.S so that the GRUB firmware
will correctly replace the BIOS extension initialization code of DoC
Millennium.

DoC Millennium maps its BIOS extension initialization code to the
beginning of flash memory.  When --enable-diskonchip-ipl option is
supplied to the configure script in addition to --enable-diskonchip, the
necessary 3 byte BIOS signature will be generated in the beginning of the
code.

Unfortunately, the signature cannot be tolerated with DoC 2000 where IPL
is in ROM. This is because the ROM IPL will jump to offset 0 of GRUB
firmware.  The signature 0x55, 0xAA would be executed as "push bp; stosb"  
which is dangerous.

3. I wish to assign my copyright to FSF.  This refers only to the changes
that were not copyrighted by others, of course.  Hopefully, I didn't break
things in the existing code.

Most of the new code in the patch has a copyright notice.  The only
exception is stage2/bdev_diskonchip.c.

David, would you like to put your copyright notice in the above file?  I
can do this for you.

4. The updated patch is available at

http://savannah.gnu.org/patch/?func=detailpatch&patch_id=164&group_id=68

and through anonymous CVS access to Linux MTS repository:

cvs -d ":pserver:anoncvs@cvs.infradead.org:/home/cvs" login
cvs -d ":pserver:anoncvs@cvs.infradead.org:/home/cvs" co \
    mtd/patches/grub-2002-02-19-doc.patch

Thanks a lot for your comments,

Ilguiz

On Thu, 28 Feb 2002, Yoshinori K. Okuji wrote:

> You haven't written ChangeLog entries. Also, you need to add your name
> into the copyright notice in each file you modified (unless you would
> assign your copyright to the FSF).
> 
> Besides those above, you should clean your patch. For example, see
> the diff on "stage2/common.c".
> 
> Thanks,
> Okuji
