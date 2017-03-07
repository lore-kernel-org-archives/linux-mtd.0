Received: from mo2.mail-out.ovh.net ([178.32.228.2])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1clMB7-0003xp-L1
 for linux-mtd@lists.infradead.org; Tue, 07 Mar 2017 20:57:57 +0000
Received: from player718.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id 0550A5F600
 for <linux-mtd@lists.infradead.org>; Tue,  7 Mar 2017 21:57:26 +0100 (CET)
Subject: Re: [PATCH] mtd: spi-nor: hisi: do not ignore clk_prepare_enable()
 failure
To: Marek Vasut <marek.vasut@gmail.com>,
 Alexey Khoroshilov <khoroshilov@ispras.ru>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
References: <1487369297-5810-1-git-send-email-khoroshilov@ispras.ru>
 <0066fec2-492a-52de-3c2e-ebce4b9f452a@gmail.com>
Cc: ldv-project@linuxtesting.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <483ebb87-1b22-be6a-780d-66b73cdaff72@wedev4u.fr>
Date: Tue, 7 Mar 2017 21:57:14 +0100
MIME-Version: 1.0
In-Reply-To: <0066fec2-492a-52de-3c2e-ebce4b9f452a@gmail.com>
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

Le 18/02/2017 à 16:23, Marek Vasut a écrit :
> On 02/17/2017 11:08 PM, Alexey Khoroshilov wrote:
>> hisi_spi_nor_probe() ignores clk_prepare_enable() error code.
>> The patch fixes that.
>>
>> Found by Linux Driver Verification project (linuxtesting.org).
>>
>> Signed-off-by: Alexey Khoroshilov <khoroshilov@ispras.ru>
> 
> Acked-by: Marek Vasut <marek.vasut@gmail.com>
> 
Applied to spi-nor/next

Thanks!

>> ---
>>  drivers/mtd/spi-nor/hisi-sfc.c | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/spi-nor/hisi-sfc.c b/drivers/mtd/spi-nor/hisi-sfc.c
>> index 20378b0d55e9..a286350627a6 100644
>> --- a/drivers/mtd/spi-nor/hisi-sfc.c
>> +++ b/drivers/mtd/spi-nor/hisi-sfc.c
>> @@ -448,8 +448,11 @@ static int hisi_spi_nor_probe(struct platform_device *pdev)
>>  	if (!host->buffer)
>>  		return -ENOMEM;
>>  
>> +	ret = clk_prepare_enable(host->clk);
>> +	if (ret)
>> +		return ret;
>> +
>>  	mutex_init(&host->lock);
>> -	clk_prepare_enable(host->clk);
>>  	hisi_spi_nor_init(host);
>>  	ret = hisi_spi_nor_register_all(host);
>>  	if (ret)
>>
> 
> 
