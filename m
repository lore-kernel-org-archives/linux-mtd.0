Received: from sitemail3.everyone.net ([216.200.145.37] helo=omta02.mta.everyone.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17qrXU-0007nG-00
	for <linux-mtd@lists.infradead.org>; Mon, 16 Sep 2002 09:47:28 +0100
Content-Type: text/plain
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Date: Mon, 16 Sep 2002 01:47:24 -0700 (PDT)
From: Mateo Anderson <mateo@posta.star.si>
To: erich@debian.org
Cc: linux-mtd@lists.infradead.org
Subject: Re: another question: what can break?
Reply-To: mateo@posta.star.si
Message-Id: <20020916084724.9BF1F394B@sitemail.everyone.net>
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

Hi Erich

>The real danger (as others can attest to as well) is *not* using the 
>biosnetboot option.  In this case, GRUB installs an INT 19h (bootstrap) 
>handler.  This completely takes over the booting process, making it
>necessary to remove (or erase) the DoC to restore the BIOS boot
>sequence.

>In other words, the biosnetboot option -- if your BIOS supports it --
>is the most flexible, least risky way to boot from the DoC with GRUB.
>
>There is an additional GRUB patch that allows you to bypass the DoC
>boot entirely -- by pressing the CTRL key while booting:
>
>http://lists.infradead.org/pipermail/linux-mtd/2002-August/005730.html

I STRONGLY recommend that you install this patch, because I didn't and
had a lot of problems after:

http://lists.infradead.org/pipermail/linux-mtd/2002-September/005944.html

Regards,
Mateo

_____________________________________________________________
Brezplacen E-mail - http://email.star.si
Brezplacen prostor 100 MB,lastna domena - http://www.slohosting.com

_____________________________________________________________
Promote your group and strengthen ties to your members with email@yourgroup.org by Everyone.net  http://www.everyone.net/?btn=tag
