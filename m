Received: from smtpauth01.csee.onr.siteprotect.com ([64.26.60.145])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MRtvE-0002Zp-Qp
	for linux-mtd@lists.infradead.org; Fri, 17 Jul 2009 20:20:52 +0000
Message-ID: <4A60DD16.5070804@boundarydevices.com>
Date: Fri, 17 Jul 2009 13:20:38 -0700
From: Troy Kisky <troy.kisky@boundarydevices.com>
MIME-Version: 1.0
To: David Brownell <david-b@pacbell.net>
Subject: Re: [PATCH V5 1/2] mtd: nand: move layout structure into nand_ecc_ctrl
References: <1247789948-5764-1-git-send-email-troy.kisky@boundarydevices.com>
	<200907171246.49342.david-b@pacbell.net>
In-Reply-To: <200907171246.49342.david-b@pacbell.net>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: tglx@linutronix.de, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Brownell wrote:
> On Thursday 16 July 2009, Troy Kisky wrote:
>>                 case 2048:
>> -                       nand_chip->ecc.layout = &atmel_oobinfo_large;
>> +                       memcpy(&nand_chip->ecc.layout, &atmel_oobinfo_large,
>> +                                       sizeof(nand_chip->ecc.layout));
>>                         ecc_writel(host->ecc, MR, ATMEL_ECC_PAGESIZE_2112);
>>                         break;
> 
> Surely using structure assignment
> 
> 			nand_chip->ecc.layout = atmel_oobinfo_large;
> 
> would be better, everywhere?
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
Certainly would be easier to understand, but I thought it would generate
larger code, no?


No problem to change, I will next round, unless someone objects.

Thanks for the review.
Troy
