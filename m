Received: from mf00.sitadelle.com ([212.94.174.67] helo=smtp.cegetel.net)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IJA1s-00072j-Dn
	for linux-mtd@lists.infradead.org; Thu, 09 Aug 2007 11:34:52 -0400
Received: from [10.1.111.252] (80-124-168-196.adslgp.cegetel.net
	[80.124.168.196])
	by smtp.cegetel.net (Postfix) with ESMTP id 4DB9B1A41B3
	for <linux-mtd@lists.infradead.org>;
	Thu,  9 Aug 2007 17:34:25 +0200 (CEST)
From: Saravanan Chanemouganandam <schane@osmozis.com>
To: linux-mtd@lists.infradead.org
Subject: mkfs.jffs2.c not compiling for arm
Date: Thu, 9 Aug 2007 17:34:23 +0200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200708091734.24054.schane@osmozis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I am a newbie to use MTD tools. I have downloaded the latest version of the 
mtd tools and when I try to cross compile mtd-utils-1.0.0 for the Xscale 
platform, I am getting the following make error. 

sara:/home/sara/mtd-utils-1.0.0#make 
CROSS=/scratchbox/compilers/arm-gcc-3.3.4-glibc-2.3.2/bin/arm-linux-
....
/scratchbox/compilers/arm-gcc-3.3.4-glibc-2.3.2/bin/arm-linux-gcc -I./include 
-O2 -Wall -g -c -o mkfs.jffs2.o mkfs.jffs2.c -g -Wp,-MD,.mkfs.jffs2.c.dep
mkfs.jffs2.c:68:18: zlib.h : No such file or directory
make: *** [mkfs.jffs2.o] Error 1
rm ftl_check.o mkfs.jffs.o flash_erase.o ftl_format.o nanddump.o 
doc_loadbios.o

The host development machine has already installed with supporting Zlib 
libraries but still it couldn't find the file. 

Can anyone precise me, is there any missing build options ?

thanks
Sara

 
