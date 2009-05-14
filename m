Received: from smtpauth02.csee.onr.siteprotect.com ([64.26.60.136])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M4fIM-000814-Ls
	for linux-mtd@lists.infradead.org; Thu, 14 May 2009 18:04:45 +0000
Message-ID: <4A0C5D2D.8030303@boundarydevices.com>
Date: Thu, 14 May 2009 11:04:29 -0700
From: Troy Kisky <troy.kisky@boundarydevices.com>
MIME-Version: 1.0
To: David Brownell <david-b@pacbell.net>
Subject: Re: [PATCH 3/5] mtd: nand: atmel: use default ecc layout
References: <>
	<1242270008-1552-2-git-send-email-troy.kisky@boundarydevices.com>
	<1242270008-1552-3-git-send-email-troy.kisky@boundarydevices.com>
	<200905132212.11923.david-b@pacbell.net>
In-Reply-To: <200905132212.11923.david-b@pacbell.net>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Nicolas Ferre <nicolas.ferre@rfo.atmel.com>, linux-mtd@lists.infradead.org,
	Haavard Skinnemoen <hskinnemoen@atmel.com>
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
>> atmel should not need to override default
> 
> Doesn't this break compatibility with every system now
> in the field?  As in, "install a new kernel, trash all
> the data now in your NAND flash"??
> 
> 
This patch relies on the 1st two patches. I should have said

atmel no longer needs to override the default. The layout specified
IS now the default layout for

nand_chip->ecc.bytes = 4

Troy
