Received: from e6.ny.us.ibm.com ([32.97.182.146])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IJB2N-0006Ne-7x
	for linux-mtd@lists.infradead.org; Thu, 09 Aug 2007 17:39:04 +0100
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e6.ny.us.ibm.com (8.13.8/8.13.8) with ESMTP id l79GdlMp028748
	for <linux-mtd@lists.infradead.org>; Thu, 9 Aug 2007 12:39:47 -0400
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay04.pok.ibm.com (8.13.8/8.13.8/NCO v8.4) with ESMTP id
	l79GcS9d558260
	for <linux-mtd@lists.infradead.org>; Thu, 9 Aug 2007 12:38:28 -0400
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l79GcSQE025648
	for <linux-mtd@lists.infradead.org>; Thu, 9 Aug 2007 12:38:28 -0400
Date: Thu, 9 Aug 2007 11:38:22 -0500
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: Saravanan Chanemouganandam <schane@osmozis.com>
Subject: Re: mkfs.jffs2.c not compiling for arm
Message-ID: <20070809113822.0bfbcbfc@zod.rchland.ibm.com>
In-Reply-To: <200708091734.24054.schane@osmozis.com>
References: <200708091734.24054.schane@osmozis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 9 Aug 2007 17:34:23 +0200
Saravanan Chanemouganandam <schane@osmozis.com> wrote:

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

You need the zlib-devel package installed.  That puts zlib.h
in /usr/include/

josh
