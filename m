Received: from sitemail3.everyone.net ([216.200.145.37] helo=omta02.mta.everyone.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ypvn-0007IT-00
	for <linux-mtd@lists.infradead.org>; Tue, 08 Oct 2002 09:41:31 +0100
Content-Type: text/plain
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Date: Tue, 8 Oct 2002 01:41:21 -0700 (PDT)
From: Mateo Anderson <mateo@posta.star.si>
To: otepas@yahoo.es
Cc: linux-mtd@lists.infradead.org
Subject: Re: Booting from DOC2000
Reply-To: mateo@posta.star.si
Message-Id: <20021008084121.4016C430D@sitemail.everyone.net>
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

Hi Mateo

>Hi,
>I have a DOC2000 working with the latest CVS version
>of MTD.
>If I use lilo in a hard disk I can load the kernel and
>the root fs from the DOC, but if I try to boot
>directly from the DOC, Lilo hangs:
>L 40 40 40 40 ......

Well, I tried with n different (where n is greater than 4) 
versions of lilo, but I could not get it to work.
See:
http://lists.infradead.org/pipermail/linux-mtd/2002-September/005864.html

I finally switched to GRUB and it worked!
Since then I am using GRUB.

See:
http://lists.infradead.org/pipermail/linux-mtd/2002-September/005944.html

and all the replies from others for the whole description
of the problem. 
Just make sure, you don't make the same mistake I did. :(

Regards,
Mateo

_____________________________________________________________
Brezplacen E-mail - http://email.star.si
Brezplacen prostor 100 MB,lastna domena - http://www.slohosting.com

_____________________________________________________________
Select your own custom email address for FREE! Get you@yourchoice.com w/No Ads, 6MB, POP & more! http://www.everyone.net/selectmail?campaign=tag
