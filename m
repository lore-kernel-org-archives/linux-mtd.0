Received: from sitemail3.everyone.net ([216.200.145.37] helo=omta01.mta.everyone.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17nDUJ-00061d-00
	for <linux-mtd@lists.infradead.org>; Fri, 06 Sep 2002 08:25:07 +0100
Content-Type: text/plain
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Date: Fri, 6 Sep 2002 00:15:16 -0700 (PDT)
From: Mateo Anderson <mateo@posta.star.si>
To: mal@komcept.com
Cc: linux-mtd@lists.infradead.org
Subject: Re: DOC 2000 and GRUB
Reply-To: mateo@posta.star.si
Message-Id: <20020906071516.F14E3395C@sitemail.everyone.net>
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

Hi MAL

>I have exactly the same scenario, (same DOC size and everything).
>
>When I boot with the firmware loaded and a HDD attached, it displays 
>Jumping to Grub for about 15 seconds, then finally displays the grub>
>prompt. Have you tried waiting?

Yes, I did (I took a shower in the mean time, but nothing ).

>However, once i've got to the grub> prompt, it doesn't recognise the dc
>device.

Well, I do not get the grub> prompt.
I tried typing something in without the prompt and sometimes it
reboots, sometimes it does nothing...

>Did you run aclocal, automake and autoconf as specified in the
>README_DiskOnChip in patched grub?  I overlooked it first time, (but it
>still worked as far as booting grub, just couldn't find the dc0 device),
>so i'm about to try it again.

I read the doc (aclocal && automake --add-missing && autoconf).
At first I had some problems with aclocal, automake and autoconf.
It complained about undefined macros, etc...
I downloaded the latest version of automake in autoconf and 
then it worked.
I compiled GRUB without any errors.

>If you want to boot linux from the HDD again, remove the DOC address
>selection jumper for your mainboard, boot, and put it back while the
>system is at it's bootloader.

This jumper is on the PC104+ board?
(http://www.tri-m.com/products/tri-m_engineering/mz104+.html)
I'll have to read the documentation again.

Thanks for the tip.

One other thing I forgot to mention.
When I ran the fdisk, I could only create one partition,
and the fdisk shows the start and the end as 1!!!
Maybe this has something to do with the problem???

Regards,
Mateo

_____________________________________________________________
Brezplacen E-mail - http://email.star.si
Brezplacen prostor 100 MB,lastna domena - http://www.slohosting.com

_____________________________________________________________
Promote your group and strengthen ties to your members with email@yourgroup.org by Everyone.net  http://www.everyone.net/?btn=tag
