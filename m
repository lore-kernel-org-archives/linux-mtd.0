Received: from mail.utfors.se ([195.58.103.125])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15uGPb-0006Js-00
	for <linux-mtd@lists.infradead.org>; Thu, 18 Oct 2001 17:52:51 +0100
Received: from Win1 (hidden-user@[212.105.56.242])
	by mail.utfors.se (8.8.8/8.8.8) with SMTP id TAA15114
	for <linux-mtd@lists.infradead.org>; Thu, 18 Oct 2001 19:01:32 +0200 (MET DST)
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: <linux-mtd@lists.infradead.org>
Subject: RE: linux/completion.h
Date: Thu, 18 Oct 2001 19:01:38 +0200
Message-ID: <IGEFJKJNHJDCBKALBJLLMEKFEPAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <7C0E66E1B97BD5119B120002A50A63D22E419B@hasmsx101.iil.intel.com>
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

Hi 

I just upgraded MV's 2.4.2 kernel to the latest MTD CVS. I had
to apply the patch below to get it to compile. I am running it now
and it's working fine. I think it should be applied to CVS, comments?

 Jocke 

> -----Original Message-----
> From: linux-mtd-admin@lists.infradead.org
> [mailto:linux-mtd-admin@lists.infradead.org]On Behalf Of Kremer, Alex
> Sent: Monday, October 15, 2001 18:48
> To: 'Larry Doolittle'; linux-mtd@lists.infradead.org
> Subject: RE: linux/completion.h
> 
> 
> 
> | From: Larry Doolittle [mailto:ldoolitt@recycle.lbl.gov]
> | 
> | You did merge the part that protects the BLKGETSIZE64 cases 
> | with an #ifdef. All Alex has to do is disable the #define BLKGETSIZE64
> from 
> | compatmac.h.
> | There might be good reason for _some_ people to define BLKGETSIZE64 in
> | compatmac.h, but I don't think that's a robust default.
> 
> That is correct. It is already there. Maybe a CONFIG options are in place
> here.
> 
> I'm attaching a patch that did the trick for me.
> 
> 
> 
> diff -urN mtd/drivers/mtd/Config.in mtd-fix/drivers/mtd/Config.in
> --- mtd/drivers/mtd/Config.in   Wed Oct  3 13:38:38 2001
> +++ mtd-fix/drivers/mtd/Config.in       Mon Oct 15 18:31:34 2001
> @@ -11,6 +11,12 @@
>     if [ "$CONFIG_MTD_DEBUG" = "y" ]; then
>        int '  Debugging verbosity (0 = quiet, 3 = noisy)'
> CONFIG_MTD_DEBUG_VERBOSE 0
>     fi
> +   bool 'Compatibility with kernels older than 2.4.8' CONFIG_MTD_COMPATMAC
> +   
> +   if [ "$CONFIG_MTD_COMPATMAC" = "y" ]; then
> +      bool '     Enable 64 bit block operations'
> CONFIG_MTD_COMPATMAC_BLKGETSIZE64
> +   fi
> +   
>     dep_tristate '  MTD partitioning support' CONFIG_MTD_PARTITIONS
> $CONFIG_MTD
>     dep_tristate '  RedBoot partition table parsing'
> CONFIG_MTD_REDBOOT_PARTS $CONFIG_M
> TD_PARTITIONS
>  if [ "$CONFIG_ARM" = "y" ]; then
> diff -urN mtd/fs/jffs2/background.c mtd-fix/fs/jffs2/background.c
> --- mtd/fs/jffs2/background.c   Mon Oct  8 11:22:38 2001
> +++ mtd-fix/fs/jffs2/background.c       Mon Oct 15 18:31:20 2001
> @@ -43,7 +43,11 @@
>  #include <linux/jffs2.h>
>  #include <linux/mtd/mtd.h>
>  #include <linux/interrupt.h>
> +#ifdef CONFIG_MTD_COMPATMAC
> +#include <linux/mtd/compatmac.h>
> +#else
>  #include <linux/completion.h>
> +#endif
>  #include "nodelist.h"
>  
>  
> diff -urN mtd/include/linux/jffs2_fs_sb.h
> mtd-fix/include/linux/jffs2_fs_sb.h
> --- mtd/include/linux/jffs2_fs_sb.h     Tue Sep 18 23:15:18 2001
> +++ mtd-fix/include/linux/jffs2_fs_sb.h Mon Oct 15 18:31:20 2001
> @@ -5,7 +5,11 @@
>  
>  #include <linux/types.h>
>  #include <linux/spinlock.h>
> +#ifdef CONFIG_MTD_COMPATMAC
> +#include <linux/mtd/compatmac.h>
> +#else
>  #include <linux/completion.h>
> +#endif
>  #include <asm/semaphore.h>
>  #include <linux/list.h>
>  
> diff -urN mtd/include/linux/mtd/compatmac.h
> mtd-fix/include/linux/mtd/compatmac.h
> --- mtd/include/linux/mtd/compatmac.h   Tue Oct  2 11:13:53 2001
> +++ mtd-fix/include/linux/mtd/compatmac.h       Mon Oct 15 18:31:20 2001
> @@ -463,7 +463,7 @@
>                 }
>  }
>  #endif
> -#ifndef BLKGETSIZE64 /* LINUX_VERSION_CODE < KERNEL_VERSION(2,4,10-pre13)
> */
> +#ifdef CONFIG_MTD_COMPATMAC_BLKGETSIZE64
>  #define BLKGETSIZE64 _IOR(0x12,114,sizeof(u64)) /* return device size in
> bytes (u64 *a
> rg) */
>  #endif
> 
> 
> 
