Received: from sitemail3.everyone.net ([216.200.145.37] helo=omta01.mta.everyone.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17nHFT-0006Z2-00
	for <linux-mtd@lists.infradead.org>; Fri, 06 Sep 2002 12:26:03 +0100
Content-Type: text/plain
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Date: Fri, 6 Sep 2002 04:25:52 -0700 (PDT)
From: Mateo Anderson <mateo@posta.star.si>
To: mark@lakeshoremicro.com, dwmw2@infradead.org, hno@marasystems.com
Cc: Russ.Dill@asu.edu, linux-mtd@lists.infradead.org
Subject: Re: DOC 2000 and GRUB
Reply-To: mateo@posta.star.si
Message-Id: <20020906112553.896FB394E@sitemail.everyone.net>
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

Hi

Thank you all for replys and all the help.

>After slightly modifying the Grub stage 2 code (bdev_diskonchip.c), 
>I was able to get Grub to boot from a freshly 5.x dformatted DoC. 

Is this modified version comitted in the cvs?

>I haven't tried any DoC 2000's that have a UnitSizeFactor that is 
>not 0 or FF, but it looks like this should work as well, with 
>the appropriate changes to bdev_diskonchip.c.

>I'm guessing that many problems are caused by having the nftl 
>module loaded during a fdisk, nftl_format, and/or doc_loadbios.

Are you referring to kernel modules?
If so, I have these build in (no modules), as suggested by 
DOC and GRUB HOW-TO.

>Following Henrik's advice to use DFORMAT to install GRUB, plus being 
>*very* careful to make sure nftl is not loaded at inopportune times,
>seems to help.

Now I have so much information that I need to sort them out.

Steps:
1) Boot DOS and use DFORMAT 5.x to format the DOC, with 
   the appropriate space for the GRUB firmware (check the
   size of the stage1 file).
2) Boot to Linux, use the doc_loadbios to load the GRUB 
   firmware (or use DFORMAT - what parameters??).
3) Format the /dev/nftla.
4) Copy everything to the /dev/nftla1.
5) Boot from DOC.

Is this correct?

Regards,
Mateo

_____________________________________________________________
Brezplacen E-mail - http://email.star.si
Brezplacen prostor 100 MB,lastna domena - http://www.slohosting.com

_____________________________________________________________
Promote your group and strengthen ties to your members with email@yourgroup.org by Everyone.net  http://www.everyone.net/?btn=tag
