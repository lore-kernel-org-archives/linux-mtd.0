Received: from mail.ss7-link.com ([209.204.106.218] helo=slink12.ss7-link.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14ucDv-0005UF-00
	for <linux-mtd@lists.infradead.org>; Tue, 01 May 2001 16:38:00 +0100
Message-ID: <F1BD619B2A58D41197990050DA2C08E40258DF@SLINK12>
From: Jan Rovins <Jan.Rovins@radisys.com>
To: 'David Woodhouse' <dwmw2@infradead.org>, Jan Rovins
	 <Jan.Rovins@radisys.com>
Cc: MTD Mailing List <linux-mtd@lists.infradead.org>
Subject: RE: MTD compile on 2.2.17 kernel 
Date: Tue, 1 May 2001 11:38:11 -0400 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

I guess I am missing something here.

In the header files that I have, there is no member called
map->fldrv_destroy
so that file doesn't compile. Now I'm getting curious as to what the right
fix would be.
(But since I'm not using modules, I wont worry about it too much).

Here is the other build issue that I came across,
(and possibly an other wrong fix :-)
at line # 336 in mtdcore.c we have:
#if LINUX_VERSION_CODE < 0x20212
        init_mtd_devices();
#endif

my LINUX_VERSION_CODE is 131601 = 0x20211,
so the call to init_mtd_devices() gets compiled in.

with the existing Makefiles I get the following link error:
drivers/mtd/mtdlink.o: In function `init_mtd':
drivers/mtd/mtdlink.o(.text.init+0x3c): undefined reference to
`init_mtd_devices

If I change GNUmakefile 
ifeq ($(VERSION),2)
 ifeq ($(PATCHLEVEL),0) <<<changed this to:>>>  ifeq ($(PATCHLEVEL),2)
   obj-y += initcalls.o
  endif
endif 

Then it compiles.
Should I be pulling in all the stuff in init_mtd_devices() when building a
2.2.17 kernel?

Jan

-----Original Message-----
From: David Woodhouse [mailto:dwmw2@infradead.org]
Sent: Tuesday, May 01, 2001 10:43 AM
To: Jan Rovins
Cc: MTD Mailing List
Subject: Re: MTD compile on 2.2.17 kernel (compile syntax error) 



Jan.Rovins@radisys.com said:
>  I've been struggling with getting the new source tree to build with
> my 2.2.17 ppc kernel. one thing that I am sure of is a typo at line #
> 211 of cfi_cmdset_0002.c map->fldrv_destroy should be changed to map->
> fldrv->destroy . Could someone with CVS access please fix this? 

Wrong fix, but it'll work if you're not using modules.

--
dwmw2
