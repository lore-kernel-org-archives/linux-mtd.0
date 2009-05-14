Received: from smtpauth03.csee.onr.siteprotect.com ([64.26.60.137])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M4fMb-0000Qm-8i
	for linux-mtd@lists.infradead.org; Thu, 14 May 2009 18:09:07 +0000
Message-ID: <4A0C5E34.8080100@boundarydevices.com>
Date: Thu, 14 May 2009 11:08:52 -0700
From: Troy Kisky <troy.kisky@boundarydevices.com>
MIME-Version: 1.0
To: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
Subject: Re: [PATCH 3/5] mtd: nand: atmel: use default ecc layout
References: <1242270008-1552-2-git-send-email-troy.kisky@boundarydevices.com>	<1242270008-1552-3-git-send-email-troy.kisky@boundarydevices.com>	<200905132212.11923.david-b@pacbell.net>
	<20090514102311.56495bb0@hskinnemoen-d830>
In-Reply-To: <20090514102311.56495bb0@hskinnemoen-d830>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: David Brownell <david-b@pacbell.net>,
	Nicolas Ferre <nicolas.ferre@rfo.atmel.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Haavard Skinnemoen wrote:
> David Brownell wrote:
>> On Wednesday 13 May 2009, Troy Kisky wrote:
>>> atmel should not need to override default  
>> Doesn't this break compatibility with every system now
>> in the field?  As in, "install a new kernel, trash all
>> the data now in your NAND flash"??
> 
> I also suspect it will break hardware ECC. The ECC controller is a bit
> picky about the OOB layout, which is why the defaults were overriden in
> the first place.
> 
> Haavard
> 
Thanks for responding.


This patch by itself would break ECCs. But with the 1st two patches
it shouldn't. I would love to have that assertion tested however.

Troy
