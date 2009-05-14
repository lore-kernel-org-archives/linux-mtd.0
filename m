Received: from smtpauth00.csee.onr.siteprotect.com ([64.26.60.144])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M4iKH-0004li-6h
	for linux-mtd@lists.infradead.org; Thu, 14 May 2009 21:18:56 +0000
Message-ID: <4A0C8AAE.1040601@boundarydevices.com>
Date: Thu, 14 May 2009 14:18:38 -0700
From: Troy Kisky <troy.kisky@boundarydevices.com>
MIME-Version: 1.0
To: David Brownell <david-b@pacbell.net>
Subject: Re: [PATCH 4/5] mtd: nand: cafe_nand: use default ecc layout
References: <>
	<1242270008-1552-3-git-send-email-troy.kisky@boundarydevices.com>
	<1242270008-1552-4-git-send-email-troy.kisky@boundarydevices.com>
	<200905132218.28687.david-b@pacbell.net>
In-Reply-To: <200905132218.28687.david-b@pacbell.net>
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
>> The bad block marker is at 14, but oobfree also
>> starts at 14. This doesn't make sense to me,
> 
> On-chip bad-block tables stick the "Bbt0" (etc)
> tags into the OOB data area, and don't need to
> share that area with anything else.  It's OK.
> 
> 
>> so I don't know if this patch is good or not.
> 
> Isn't this one of the drivers using NAND_ECC_HW_SYNDROME?
> So that the ecclayout is fully defined by prepad==0?
> 
> This is a case where you *could* safely generate the
> current ecclayout structs using simple rules.
> 
> 

Actually, cafe_nand overrides most everything and doesn't use
prepad or postpad or ecc.layout. But I think it still relies
on ecc.layout.oobfree to setup chip->oob_poi. So, I'm no closer
to understanding why oobfree and bad block marker start at 14.

Troy
