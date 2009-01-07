Received: from mail.karo-electronics.de ([213.146.116.110])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LKUHk-0002gN-J7
	for linux-mtd@lists.infradead.org; Wed, 07 Jan 2009 09:01:09 +0000
Message-ID: <18788.28493.320590.496280@ipc1.ka-ro>
Date: Wed, 7 Jan 2009 10:01:01 +0100
From: =?iso-8859-15?q?Lothar_Wa=DFmann?= <LW@KARO-electronics.de>
To: "Eric Miao" <eric.y.miao@gmail.com>
Subject: Re: [PATCH 2/3] Coding style clean-up
In-Reply-To: <f17812d70901061918i6e39893ue7ac9e15fa4654d3@mail.gmail.com>
References: <1231296053-2378-1-git-send-email-marcel@ziswiler.com>
	<1231296053-2378-2-git-send-email-marcel@ziswiler.com>
	<1231296053-2378-3-git-send-email-marcel@ziswiler.com>
	<f17812d70901061918i6e39893ue7ac9e15fa4654d3@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org, Marcel Ziswiler <marcel@ziswiler.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> > -	dev_warn(&info->pdev->dev,
> > -		 "failed to detect configured nand flash; found %04x instead of\n",
> > -		 id);
> > +	dev_warn(&info->pdev->dev, "failed to detect configured nand flash; "
> > +			"found %04x instead of\n", id);
> 
> This is OK.
> 
I personally don't like strings being split up to fit the line length
limitation. It makes it just harder to locate a certain kernel message
in the source code. Anyway the message text seems to be incomplete:
'found %04x instead of' what?


Lothar Waßmann
-- 
___________________________________________________________

Ka-Ro electronics GmbH | Pascalstraße 22 | D - 52076 Aachen
Phone: +49 2408 1402-0 | Fax: +49 2408 1402-10
Geschäftsführer: Matthias Kaussen
Handelsregistereintrag: Amtsgericht Aachen, HRB 4996

www.karo-electronics.de | info@karo-electronics.de
___________________________________________________________
