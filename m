Received: from smtp109.sbc.mail.gq1.yahoo.com ([67.195.14.39])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MRuqI-0005Xi-Ko
	for linux-mtd@lists.infradead.org; Fri, 17 Jul 2009 21:19:51 +0000
From: David Brownell <david-b@pacbell.net>
To: Troy Kisky <troy.kisky@boundarydevices.com>
Subject: Re: [PATCH V5 1/2] mtd: nand: move layout structure into nand_ecc_ctrl
Date: Fri, 17 Jul 2009 14:19:43 -0700
References: <1247789948-5764-1-git-send-email-troy.kisky@boundarydevices.com>
	<200907171246.49342.david-b@pacbell.net>
	<4A60DD16.5070804@boundarydevices.com>
In-Reply-To: <4A60DD16.5070804@boundarydevices.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Message-Id: <200907171419.43820.david-b@pacbell.net>
Cc: tglx@linutronix.de, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 17 July 2009, Troy Kisky wrote:
> 
> > Surely using structure assignment
> > 
> >                       nand_chip->ecc.layout = atmel_oobinfo_large;
> > 
> > would be better, everywhere?
>
> Certainly would be easier to understand, but I thought it would generate
> larger code, no?

If it did, that would be a bug...
