Received: from web13608.mail.yahoo.com ([216.136.175.119])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17zBpQ-0000o0-00
	for <linux-mtd@lists.infradead.org>; Wed, 09 Oct 2002 09:04:24 +0100
Message-ID: <20021009080422.38779.qmail@web13608.mail.yahoo.com>
Date: Wed, 9 Oct 2002 10:04:22 +0200 (CEST)
From: =?iso-8859-1?q?Carlos=20Mateo?= <otepas@yahoo.es>
Subject: Re: Booting from DOC2000
To: mateo@posta.star.si
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <20021008084121.4016C430D@sitemail.everyone.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
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

Thank you very much for your answer.  Now I have my
PC104 booting from the DOC2000!!

I have used grub-0.92 patched with
grub-0.92-doc.patch.  Initially it didn't work,
because I have a DiskOnChip with UnitSizeFactor =
0x00.

To make it work, I have commented out the
UnitSizeFactor check that is done in
stage2/bdev_diskonchip.c.  Since I am not an expert, I
don't know if this could work with other DOC, but it
works fine with mine so far.

--
Carlos Mateo

 --- Mateo Anderson <mateo@posta.star.si> escribió: >
Hi Mateo
> 
> >Hi,
> >I have a DOC2000 working with the latest CVS
> version
> >of MTD.
> >If I use lilo in a hard disk I can load the kernel
> and
> >the root fs from the DOC, but if I try to boot
> >directly from the DOC, Lilo hangs:
> >L 40 40 40 40 ......
> 
> Well, I tried with n different (where n is greater
> than 4) 
> versions of lilo, but I could not get it to work.
> See:
>
http://lists.infradead.org/pipermail/linux-mtd/2002-September/005864.html
> 
> I finally switched to GRUB and it worked!
> Since then I am using GRUB.
> 
> See:
>
http://lists.infradead.org/pipermail/linux-mtd/2002-September/005944.html
> 
> and all the replies from others for the whole
> description
> of the problem. 
> Just make sure, you don't make the same mistake I
> did. :(
> 
> Regards,
> Mateo


_______________________________________________________________
Yahoo! Messenger
Nueva versión: Webcam, voz, y mucho más ¡Gratis! 
Descárgalo ya desde http://messenger.yahoo.es
