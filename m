Received: from ext-ch1gw-1.online-age.net ([216.34.191.35])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BE2i6-0007LR-6p
	for linux-mtd@lists.infradead.org; Thu, 15 Apr 2004 09:59:02 +0100
Received: from int-ch1gw-3.online-age.net (int-ch1gw-3 [3.159.232.67])
	id i3F8wu4C002646	for <linux-mtd@lists.infradead.org>;
	Thu, 15 Apr 2004 04:58:56 -0400 (EDT)
Received: from cinmlef03.e2k.ad.ge.com (localhost [127.0.0.1])
	id i3F8wt3j007033	for <linux-mtd@lists.infradead.org>;
	Thu, 15 Apr 2004 04:58:56 -0400 (EDT)
From: Martin Donnelly <martin.donnelly@ge.com>
To: Tobias Arp <tobiasarp@web.de>
In-Reply-To: <1193074139@web.de>
References: <1193074139@web.de>
Content-Type: text/plain
Message-Id: <1082019533.16750.35.camel@scapa.ramix-uk.cho.ge.com>
Mime-Version: 1.0
Date: Thu, 15 Apr 2004 09:58:53 +0100
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: patch kernel 2.4.21 (including the arm-linux patch rmk2) with
	the latest CVS snapshot
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-04-15 at 08:57, Tobias Arp wrote: 
> i tried to patch my arm linux kernel 2.4.21 (rmk2 patch) with the latest CVS snapshot. I had 
> follwing errors: 
>  
> 1. While making xconfig after patching the kernel (Options: Copy files, update fs) i had a 
> problem making xconfig. This kernel release seems not to support elif in Config-files. I 
> comment these lines out because they don't affect my configuration. After this it works. 
>  

Apply the two attached patches chips-config.patch to
'drivers/mtd/chips/Config.in' and nand-config.patch to
'drivers/mtd/nand/Config.in' which should sort out a couple of syntax
errors. e.g `cd linux-2.4.21; patch -p1 -i chips-config.patch`

Maybe someone can apply these to CVS?

> 2. I get some warnings and errors messages while make zImage: 
>  

<snip warnings>

> fs.c: In function `jffs2_gc_fetch_inode': 
> fs.c:550: warning: implicit declaration of function `ilookup' 
> fs.c:550: warning: assignment makes pointer from integer without a cast 
> fs/fs.o: In function `jffs2_gc_fetch_inode': 
> fs/fs.o(.text+0x61f10): undefined reference to `ilookup' 
> make: *** [vmlinux] Fehler 1 
>  
> Has someone made the same experience ? 

You need a patch to the kernel for this you can download it from
http://linux.bkbits.net:8080/linux-2.4/cset@1.1136.44.19?nav=index.html|ChangeSet@-9M

HTH
-- 
Martin Donnelly
