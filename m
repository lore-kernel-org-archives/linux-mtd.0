Received: from wa-out-1112.google.com ([209.85.146.178])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jtgqh-00057L-U2
	for linux-mtd@lists.infradead.org; Wed, 07 May 2008 10:26:12 +0000
Received: by wa-out-1112.google.com with SMTP id v33so303595wah.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 07 May 2008 03:26:10 -0700 (PDT)
Message-ID: <8bf247760805070326h2512080bi5dcb61456920f6fb@mail.gmail.com>
Date: Wed, 7 May 2008 15:56:08 +0530
From: Ram <vshrirama@gmail.com>
To: Sameer <x0081444@ti.com>
Subject: Re: JFFS2 mount problem on NAND flash
In-Reply-To: <00dc01c84e0b$b10fab20$ec8818ac@ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <AchOC7Aeq8/iWL2SSKmE/WuZCJ0fIw==>
	<00dc01c84e0b$b10fab20$ec8818ac@ent.ti.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sameer,

I am facing a similar problem.

With Software ECC, i am able to mount without any issues.
With hardware ECC, i get "Cowardly refusing to erase blocks on
filesystem with no valid JFFS2 nodes" messages.


Were you able to fix this issue?


Regards,
sriram

On 1/3/08, Sameer <x0081444@ti.com> wrote:
> Hi,
> I am working on omap based board with 16bit, small page Samsung NAND of size 64MB.
> I have enabled hardware ecc functionality in the driver code. To test the functionality I run the
> Following tests.
> 1. When the kernel comes up, >>cat /proc/mtd
>        mtd0: 00040000 00020000 "bootloader"
>        mtd1: 00020000 00020000 "params"
>        mtd2: 00200000 00020000 "kernel"
>        mtd3: 03da0000 00020000 "filesystem"
>        mtd4: 00080000 00004000 "NAND-X-Loader"
>        mtd5: 00080000 00004000 "NAND-U-Boot"
>        mtd6: 00040000 00004000 "NAND-U-Boot Environment"
>        mtd7: 00400000 00004000 "NAND-Kernel"
>        mtd8: 03ac0000 00004000 "NAND-File System"
> 2. I erase the NAND flash filesystem partition
>        ./flash_eraseall /dev/mtd8
>        This function passes. I have verified the erase functionality using the debugger.
> 3  mount -t jffs2 /dev/mtdblock8 /mnt/nand. I have enabled the low level jffs2 fs debugging
>        Following is the error message
>
>        JFFS2: Erase block at 0x00000000 is not formatted. It will be erased
>        JFFS2: Erase block at 0x00004000 is not formatted. It will be erased
>        JFFS2: Erase block at 0x00008000 is not formatted. It will be erased
>        JFFS2: Erase block at 0x0000c000 is not formatted. It will be erased
>        JFFS2: Erase block at 0x00010000 is not formatted. It will be erased
>        JFFS2: Erase block at 0x00014000 is not formatted. It will be erased
>        JFFS2: Erase block at 0x00018000 is not formatted. It will be erased
>        JFFS2: Erase block at 0x0001c000 is not formatted. It will be erased
>                                             -----
>                                                =----
>                                        upto--
>
>        JFFS2: Erase block at 0x03a9c000 is not formatted. It will be erased
>        JFFS2: Erase block at 0x03aa0000 is not formatted. It will be erased
>        JFFS2: Erase block at 0x03aa4000 is not formatted. It will be erased
>        JFFS2: Erase block at 0x03aa8000 is not formatted. It will be erased
>        FFS2: Erase block at 0x03aac000 is not formatted. It will be erased
>        JFFS2: Erase block at 0x03ab0000 is not formatted. It will be erased
>        JFFS2: Erase block at 0x03ab4000 is not formatted. It will be erased
>        JFFS2: Erase block at 0x03ab8000 is not formatted. It will be erased
>        JFFS2: Erase block at 0x03abc000 is not formatted. It will be erased
>        Cowardly refusing to erase blocks on filesystem with no valid JFFS2 nodes
>        mpty_blocks 0, bad_blocks 0, c->nr_blocks 3760
>        mount: Mounting /dev/mtdblock8 on /mnt/nand failed: Input/output error
>
> But when I enable the SW_ECC functionalilty I am able to mount the jffs2 fs and perform the fs operations
>
> I am beginner for JFFS2 fs.Could you please let me know what causes this error.
>
>
> Regards,
> -Sameer
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
