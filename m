Received: from n25.bullet.mail.mud.yahoo.com ([68.142.206.220])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MRtOO-0003iM-Pa
	for linux-mtd@lists.infradead.org; Fri, 17 Jul 2009 19:46:57 +0000
From: David Brownell <david-b@pacbell.net>
To: Troy Kisky <troy.kisky@boundarydevices.com>
Subject: Re: [PATCH V5 1/2] mtd: nand: move layout structure into nand_ecc_ctrl
Date: Fri, 17 Jul 2009 12:46:49 -0700
References: <1247789948-5764-1-git-send-email-troy.kisky@boundarydevices.com>
In-Reply-To: <1247789948-5764-1-git-send-email-troy.kisky@boundarydevices.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Message-Id: <200907171246.49342.david-b@pacbell.net>
Cc: tglx@linutronix.de, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 16 July 2009, Troy Kisky wrote:
>                 case 2048:
> -                       nand_chip->ecc.layout = &atmel_oobinfo_large;
> +                       memcpy(&nand_chip->ecc.layout, &atmel_oobinfo_large,
> +                                       sizeof(nand_chip->ecc.layout));
>                         ecc_writel(host->ecc, MR, ATMEL_ECC_PAGESIZE_2112);
>                         break;

Surely using structure assignment

			nand_chip->ecc.layout = atmel_oobinfo_large;

would be better, everywhere?
