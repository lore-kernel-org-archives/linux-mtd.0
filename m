From: tglx@linutronix.de (Thomas Gleixner)
Date: Wed, 26 Feb 2003 09:54:39 +0100
Subject: Fw: how to setup jffs2 on NAND
In-Reply-To: <017201c2dc9e$b8c72e80$1e0da8c0@skumar>
References: <017201c2dc9e$b8c72e80$1e0da8c0@skumar>
Message-ID: <200302260954.39980.tglx@linutronix.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Tuesday 25 February 2003 08:22, Skumar wrote:
>  i am sharath kumar. i am trying to mount jffs2 on NAND flash.
>  i am working on s3c2410 arm9 processor. i have booted linux using 2.4.18
>  kernel pathced with rmk6-sw5 patch.
>  i have mounted yaffs on NAND flash now i am trying jffs2
>  from one of the documnt
>  The following config switches have to be set. JFFS2 on NAND does not work,
>  if one of these settings is missing.
>
>  CONFIG_MTD=y
>  CONFIG_MTD_PARTITIONS=y
>  CONFIG_MTD_CHAR=y
>  CONFIG_MTD_BLOCK=y
>  CONFIG_MTD_NAND=y
>  CONFIG_MTD_NAND_YOURBOARD=y
>  CONFIG_JFFS2_FS=y
>  CONFIG_JFFS2_FS_DEBUG=0
>  CONFIG_JFFS2_FS_NAND=y
>
>  when i do make makeconfig i am not able to see component
>  CONFIG_JFFS2_FS_NAND
>
>  do i need to patch the kernel
Yes, get the latest MTD-Sources from linux-mtd.infradead.org. Read and follow 
INSTALL. Enjoy.

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx at linutronix.de
