Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IJVCq-0008Dk-PS
	for linux-mtd@lists.infradead.org; Fri, 10 Aug 2007 10:11:17 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1IJVCd-0000EK-3A
	for linux-mtd@lists.infradead.org; Fri, 10 Aug 2007 16:10:59 +0200
Received: from 57.66.65.38 ([57.66.65.38])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Fri, 10 Aug 2007 16:10:59 +0200
Received: from mw_phil by 57.66.65.38 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Fri, 10 Aug 2007 16:10:59 +0200
To: linux-mtd@lists.infradead.org
From: MikeW <mw_phil@yahoo.co.uk>
Subject: Re: mkfs.jffs2.c not compiling for arm
Date: Fri, 10 Aug 2007 14:10:48 +0000 (UTC)
Message-ID: <loom.20070810T160837-882@post.gmane.org>
References: <200708091734.24054.schane@osmozis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Saravanan Chanemouganandam <schane <at> osmozis.com> writes:

> 
> Hello,
> 
> I am a newbie to use MTD tools. I have downloaded the latest version of the 
> mtd tools and when I try to cross compile mtd-utils-1.0.0 for the Xscale 
> platform, I am getting the following make error. 
> 
> sara:/home/sara/mtd-utils-1.0.0#make 
> CROSS=/scratchbox/compilers/arm-gcc-3.3.4-glibc-2.3.2/bin/arm-linux-
> ....
> /scratchbox/compilers/arm-gcc-3.3.4-glibc-2.3.2/bin/arm-linux-gcc -I./include 
> -O2 -Wall -g -c -o mkfs.jffs2.o mkfs.jffs2.c -g -Wp,-MD,.mkfs.jffs2.c.dep
> mkfs.jffs2.c:68:18: zlib.h : No such file or directory
> make: *** [mkfs.jffs2.o] Error 1
> rm ftl_check.o mkfs.jffs.o flash_erase.o ftl_format.o nanddump.o 
> doc_loadbios.o
> 
> The host development machine has already installed with supporting Zlib 
> libraries but still it couldn't find the file. 
> 
> Can anyone precise me, is there any missing build options ?
> 
> thanks
> Sara

Your crosscompiler toolchain ought to have supplied this file
in one of its include directories.

For example using ELDK/mips it's in /opt/eldk/mips_4KCle/usr/include .

Regards,
MikeW
