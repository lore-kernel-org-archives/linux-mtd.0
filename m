Received: from sitemail3.everyone.net ([216.200.145.37] helo=omta03.mta.everyone.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17kmNk-0006TA-00
	for <linux-mtd@lists.infradead.org>; Fri, 30 Aug 2002 15:04:17 +0100
Content-Type: text/plain
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Date: Fri, 30 Aug 2002 07:04:07 -0700 (PDT)
From: Mateo Anderson <mateo@posta.star.si>
To: leland@sway.org
Cc: linux-mtd@lists.infradead.org
Subject: Re: 48meg DOC
Reply-To: mateo@posta.star.si
Message-Id: <20020830140409.A7B5B11DE6@sitemail.everyone.net>
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

Hi Leland

Thanks for the reply.

>But it sounds like you are getting further than i am... 

I wish I could get to the end.

>here is what i know... 
>
>I am using:
> 2.4.18 kernel

I am using 2.4.7-10 (from RH 7.2)

> 22.2 lilo

I am using mtd pacthed 21 version of lilo.

I was thinking to try the version 22.
I'll try this tonight, and I'll let you know if I
get any further.


>...***...
>The latest revision (as of Jan 2002) of the M-Systems DOC firmware is version 
>5.0.  
>This newest version is currently incompatible with the open source MTD 
>drivers.  The 
>previous version (4.2) seems to work fine.
>...***...

Yep. On mine is written 4.2 (But I'll double chek it agian tonight
on the boot screen).

>   LI   The first stage boot loader was able to load the second stage boot 
>    loader, but has failed to execute it. This can either be caused by a 
>    geometry mismatch or by moving /boot/boot.b without running the map 
>    installer. 

I am not sure, what is map installer?
I think I should have a map= line in the lilo.conf.
Is this correct?
What is in this map file?

>hope this helps... and let me know if you can think of anything that i 
>might be doing wrong... 

Are you using the version 5 of the M-Sys firmware?
Maybe this is the problem?

Regards,
Mateo


_____________________________________________________________
Brezplacen E-mail - http://email.star.si
Brezplacen prostor 100 MB,lastna domena - http://www.slohosting.com

_____________________________________________________________
Promote your group and strengthen ties to your members with email@yourgroup.org by Everyone.net  http://www.everyone.net/?btn=tag
