Received: from mail.actcom.co.il ([192.114.47.66] helo=smtp4.actcom.co.il)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IK5r3-00017l-4N
	for linux-mtd@lists.infradead.org; Sun, 12 Aug 2007 01:19:10 -0400
Message-ID: <46BE971D.1050305@compulab.co.il>
Date: Sun, 12 Aug 2007 08:14:05 +0300
From: Mike Rapoport <mike@compulab.co.il>
MIME-Version: 1.0
To: Saravanan Chanemouganandam <schane@osmozis.com>
Subject: Re: mkfs.jffs2.c not compiling for arm
References: <200708091734.24054.schane@osmozis.com>
In-Reply-To: <200708091734.24054.schane@osmozis.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
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

Saravanan Chanemouganandam wrote:
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

If you are using scratchbox, it might be better to compile the mtd-utils from 
within the scratchbox environment.

> thanks
> Sara
> 
>  
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 


-- 
Sincerely yours,
Mike.
