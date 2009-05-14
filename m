Received: from smtpauth03.csee.onr.siteprotect.com ([64.26.60.137])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M4f7a-0005vM-9T
	for linux-mtd@lists.infradead.org; Thu, 14 May 2009 17:53:41 +0000
Message-ID: <4A0C5A8F.10908@boundarydevices.com>
Date: Thu, 14 May 2009 10:53:19 -0700
From: Troy Kisky <troy.kisky@boundarydevices.com>
MIME-Version: 1.0
To: David Brownell <david-b@pacbell.net>
Subject: Re: [PATCH 1/5] mtd: nand: move layout structure into nand_ecc_ctrl
References: <>
	<1242270008-1552-1-git-send-email-troy.kisky@boundarydevices.com>
	<200905132142.29697.david-b@pacbell.net>
In-Reply-To: <200905132142.29697.david-b@pacbell.net>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Brownell wrote:
> On Wednesday 13 May 2009, Troy Kisky wrote:
>> +static const struct nand_ecclayout atmel_oobinfo_large __initdata = {
> 
> Doesn't this give you section warnings?  __initconst is what
> I usually end up needing in such cases...

Only if the same file has a non const __initdata variable.
Is __initconst the preferred method ?

> 
> Also, for the davinci_nand driver this is going to need to
> switch away from the ecclayout struct in the driver-private
> area ... that's in a patch that (still) hasn't merged into
> the MTD tree, but was stored there for the same reason that
> you're submitting this patch:  the original code, using the
> annoying ECC_HW_SYNDROME support, computed the layout.
> 
> - Dave

Is ECC_HW_SYNDROME only needed because the eccpos array is too small??

I'll have to review that prepad  and ECC_HW_SYNDROME
Thanks

Troy
