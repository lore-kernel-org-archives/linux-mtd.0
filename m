Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 196E32-0001hH-24
	for <linux-mtd@lists.infradead.org>; Thu, 17 Apr 2003 19:23:48 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
	21 2002)) with SMTP id <0HDI000N4330TR@smtp-out.bhp.t-online.de> for
	linux-mtd@lists.infradead.org; Thu, 17 Apr 2003 20:23:24 +0200 (MEST)
Date: Thu, 17 Apr 2003 21:23:17 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <3E9EDF93.9070700@psilongbeach.com>
To: crowe@psilongbeach.com, linux-mtd@lists.infradead.org
Message-id: <200304172123.17395.tglx@linutronix.de>
MIME-version: 1.0
References: <3E9EDF93.9070700@psilongbeach.com>
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
Subject: Re: CVS patch breaks zlib
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 17 April 2003 19:08, crowe@psilongbeach.com wrote:
> Hi I'm new to the list
> I'm designing with the Altera EPXA10.
> I got the CVS version of mtd and applied the patch
> patchin.sh -c -j /home/crowe/aacSpva/linux-2.4.17_zlibBusted
>
> Here is a snippit of what happened
> make modules
> ....
> make[1]: Entering directory
> `/home/crowe/aacSpva/linux-2.4.17_zlibBusted/lib' arm_920t_le-gcc
> -D__KERNEL__ -I/home/crowe/aacSpva/linux-2.4.17_zlibBusted/include -Wall
> -Wstrict-prototypes -Wno-trigraphs -O2  -fno-strict-aliasing -fno-common
> -fno-common -pipe -g -mapcs-32 -march=armv4 -mtune=arm9tdmi
> -mshort-load-bytes -msoft-float -DMODULE   -DEXPORT_SYMTAB -c zlib.c
> zlib.c:72: `deflate' undeclared here (not in a function)
> zlib.c:72: initializer element is not constant
There is no file zlib.c in lib. At least it should be not there. Did you apply 
any other patches , which modify lib directory ?

MTD patchin.sh is know to work on vanilla kernels 2.4.17-2.4.20, ARM kernels 
2.4.17-rmkx - 2.4.19-rmkx and PPC kernels 2.4.19 and 2.4.20.

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
