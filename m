Received: from main.gmane.org ([80.91.224.249])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AHL40-0001f9-BF
	for <linux-mtd@lists.infradead.org>; Wed, 05 Nov 2003 10:39:00 +0000
Received: from list by main.gmane.org with local (Exim 3.35 #1 (Debian))
	id 1AHL2m-000387-00
	for <linux-mtd@lists.infradead.org>; Wed, 05 Nov 2003 11:37:44 +0100
To: linux-mtd@lists.infradead.org
From: Miernik <miernik@ctnet.pl>
Date: Wed, 5 Nov 2003 11:37:44 +0100
Message-ID: <slrnbqhkno.2rl.miernik@tarnica.ctnet.pl>
References: <slrnbqgacq.1t2.miernik@tarnica.ctnet.pl>
Sender: news <news@sea.gmane.org>
Subject: Re: in CVS: drivers/mtd/mtdchar.c:65: called object is not a
	function
Reply-To: Miernik <miernik@ctnet.pl>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2003-11-04, Miernik <miernik@ctnet.pl> wrote:
> I tried patching 2.6.0-test9 kernel with CVS code fetched today at ~ 
> 22:30 CET, and I ended with this:

And another problem: 

  CC [M]  drivers/mtd/chips/sharp.o
drivers/mtd/chips/sharp.c: In function `sharp_do_wait_for_ready':
drivers/mtd/chips/sharp.c:447: warning: comparison of distinct pointer types lacks a cast
  CC [M]  drivers/mtd/maps/map_funcs.o
  CC [M]  drivers/mtd/maps/pcmciamtd.o
drivers/mtd/maps/pcmciamtd.c: In function `pcmciamtd_event':
drivers/mtd/maps/pcmciamtd.c:724: structure has no member named `release'
drivers/mtd/maps/pcmciamtd.c: In function `pcmciamtd_detach':
drivers/mtd/maps/pcmciamtd.c:765: structure has no member named `release'
drivers/mtd/maps/pcmciamtd.c: In function `pcmciamtd_attach':
drivers/mtd/maps/pcmciamtd.c:804: structure has no member named `release'
drivers/mtd/maps/pcmciamtd.c:805: structure has no member named `release'
drivers/mtd/maps/pcmciamtd.c:806: structure has no member named `release'
make[4]: *** [drivers/mtd/maps/pcmciamtd.o] Error 1
make[3]: *** [drivers/mtd/maps] Error 2
make[2]: *** [drivers/mtd] Error 2
make[1]: *** [drivers] Error 2
make[1]: Leaving directory `/usr/src/kernel-source-2.6.0-test9'
make: *** [stamp-build] Error 2
miernik@debina:/usr/src/kernel-source-2.6.0-test9$

-- 
    Miernik         ________________________ jabber:miernik@amessage.info
___________________/__ tel: +48608233394 __/      mailto:miernik@ctnet.pl
Sing a declaration against US invasion in Iraq:
http://www.moveon.org/declaration/
