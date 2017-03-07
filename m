Received: from 7.mo2.mail-out.ovh.net ([188.165.48.182])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1clMW6-0007uf-4O
 for linux-mtd@lists.infradead.org; Tue, 07 Mar 2017 21:19:37 +0000
Received: from player718.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id A82055F61D
 for <linux-mtd@lists.infradead.org>; Tue,  7 Mar 2017 22:19:10 +0100 (CET)
Subject: Re: [PATCH] mtd: spi-nor: intel: use ERR_CAST in return statement
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Nicholas Mc Guire <der.herr@hofr.at>
References: <1486973661-1164-1-git-send-email-der.herr@hofr.at>
 <20170214110909.4338987d@bbrezillon>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <73fac7b3-5791-dd23-289b-339b8c6ce0e0@wedev4u.fr>
Date: Tue, 7 Mar 2017 22:19:00 +0100
MIME-Version: 1.0
In-Reply-To: <20170214110909.4338987d@bbrezillon>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 14/02/2017 à 11:09, Boris Brezillon a écrit :
> On Mon, 13 Feb 2017 09:14:21 +0100
> Nicholas Mc Guire <der.herr@hofr.at> wrote:
> 
>> This fixes a sparse warning about incorrect type in retrun expression
> 
> 						      ^return
> 
> and you miss a comma at the end of this sentence.
> 
>>
>> Signed-off-by: Nicholas Mc Guire <der.herr@hofr.at>
> 
> You forgot to add my ack (same comment on your other patches).

Applied to spi-nor/next with the following changes:
- fix typo s/retrun/return/ in commit message.
- add missing comma at the end of the sentence.
- add Acked-by tag for Boris.

Thanks!

> 
>> ---
>>
>> V2: fixed prefix and the truncated commit message noted by Boris Brezillon
>>     <boris.brezillon@free-electrons.com> - thanks!
>>
>> sparse complained about:
>> drivers/mtd/spi-nor/intel-spi.c:731:28: warning: incorrect type in return expression (different address spaces)
>> drivers/mtd/spi-nor/intel-spi.c:731:28:    expected struct intel_spi *
>> drivers/mtd/spi-nor/intel-spi.c:731:28:    got void [noderef] <asn:2>*base
>>
>> Patch was compile tested with: multi_v7_defconfig (implies CONFIG_MTD_SPI_NOR=y)
>>
>> Patch is against 4.10-rc7 (localversion-next is next-20170213)
>>
>>  drivers/mtd/spi-nor/intel-spi.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/spi-nor/intel-spi.c b/drivers/mtd/spi-nor/intel-spi.c
>> index 2956f2c..1a6de4b 100644
>> --- a/drivers/mtd/spi-nor/intel-spi.c
>> +++ b/drivers/mtd/spi-nor/intel-spi.c
>> @@ -728,7 +728,7 @@ struct intel_spi *intel_spi_probe(struct device *dev,
>>  
>>  	ispi->base = devm_ioremap_resource(dev, mem);
>>  	if (IS_ERR(ispi->base))
>> -		return ispi->base;
>> +		return ERR_CAST(ispi->base);
>>  
>>  	ispi->dev = dev;
>>  	ispi->info = info;
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
