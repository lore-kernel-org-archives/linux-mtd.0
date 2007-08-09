Received: from [2002:53a0:b870::1] (helo=xi.wantstofly.org)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IJF9a-0003qN-2C
	for linux-mtd@lists.infradead.org; Thu, 09 Aug 2007 17:02:49 -0400
Date: Thu, 9 Aug 2007 23:02:39 +0200
From: Lennert Buytenhek <buytenh@wantstofly.org>
To: Saravanan Chanemouganandam <schane@osmozis.com>
Subject: Re: mkfs.jffs2.c not compiling for arm
Message-ID: <20070809210239.GA20038@xi.wantstofly.org>
References: <200708091734.24054.schane@osmozis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200708091734.24054.schane@osmozis.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Aug 09, 2007 at 05:34:23PM +0200, Saravanan Chanemouganandam wrote:

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

Considering that you are cross-compiling, what you need is not a host
version (e.g. i386 version) of zlib, but a target version (i.e. arm
version) of zlib.
