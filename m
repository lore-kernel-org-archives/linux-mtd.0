Received: from yw-out-1718.google.com ([74.125.46.152])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JpIQ3-0007f0-N5
	for linux-mtd@lists.infradead.org; Fri, 25 Apr 2008 07:32:32 +0000
Received: by yw-out-1718.google.com with SMTP id 9so2314483ywk.72
	for <linux-mtd@lists.infradead.org>;
	Fri, 25 Apr 2008 00:32:26 -0700 (PDT)
Message-ID: <80b317760804250032r117fa1f8ge72b9fc0792dc355@mail.gmail.com>
Date: Fri, 25 Apr 2008 09:32:26 +0200
From: "Richard Genoud" <richard.genoud@gmail.com>
To: "David Brownell" <david-b@pacbell.net>
Subject: Re: [PATCH] NAND hardware ECC controller on at91sam9263 / at91sam9260
In-Reply-To: <200804241202.04290.david-b@pacbell.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <47BABA0C.8070500@gmail.com>
	<1208964556.9212.809.camel@pmac.infradead.org>
	<1208973075.7471.6.camel@ubuntu>
	<200804241202.04290.david-b@pacbell.net>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	Haavard Skinnemoen <hskinnemoen@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2008/4/24, David Brownell <david-b@pacbell.net>:
> My copy of the sam9263 docs doesn't list an "ECC_PARITY" field
>  in the PR register ... just two masked fields, 0xfff0 and 0x000f
>  labeled WORDADDR and BITADDR respectively.  (Which evidently are
>  combined into a single opague 0xffff mask on block writes, and
>  are interpretable only on block reads.)
>
>  And the system header doesn't have an ECC_PARITY mask ... so I
>  get build errors with current GIT.
>
>  - Dave
>

you're right, this is my bad. Thanks for pointing this out.

David W., could you apply the patch bellow to make things right again ?

The AT91_ECC_PARITY mask does not exist (and masking with it was useless).
kernel version : mtd-2.6 current git
Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
--- drivers/mtd/nand/at91_nand.c.orig
+++ drivers/mtd/nand/at91_nand.c
@@ -199,7 +199,7 @@ static int at91_nand_calculate(struct mt
 	unsigned int ecc_value;

 	/* get the first 2 ECC bytes */
-	ecc_value = ecc_readl(host->ecc, PR) & AT91_ECC_PARITY;
+	ecc_value = ecc_readl(host->ecc, PR);

 	ecc_code[eccpos[0]] = ecc_value & 0xFF;
 	ecc_code[eccpos[1]] = (ecc_value >> 8) & 0xFF;
