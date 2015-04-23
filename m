Received: from kiutl.biot.com ([31.172.244.210])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YlHIf-0006jk-7z
 for linux-mtd@lists.infradead.org; Thu, 23 Apr 2015 13:36:18 +0000
Received: from spamd by kiutl.biot.com with sa-checked (Exim 4.83)
 (envelope-from <bert@biot.com>) id 1YlHIF-0002LY-8j
 for linux-mtd@lists.infradead.org; Thu, 23 Apr 2015 15:35:51 +0200
Message-ID: <5538F530.60109@biot.com>
Date: Thu, 23 Apr 2015 15:35:44 +0200
From: Bert Vermeulen <bert@biot.com>
MIME-Version: 1.0
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] nand: Add NAND driver for Mikrotik RB4xx series boards
References: <1429624974-10335-1-git-send-email-bert@biot.com>
 <CAHp75VcKa1g_bt0+SwzOYjN9yyeKeYoZwPcMGpsjehyvCuDkyw@mail.gmail.com>
In-Reply-To: <CAHp75VcKa1g_bt0+SwzOYjN9yyeKeYoZwPcMGpsjehyvCuDkyw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/21/2015 04:55 PM, Andy Shevchenko wrote:

>> +static unsigned char rb4xx_nand_read_byte(struct mtd_info *mtd)
>> +{
>> +       struct nand_chip *chip = mtd->priv;
>> +       struct rb4xx_nand_info *info = chip->priv;
>> +       unsigned char data = 0;
>> +       int ret;
>> +
>> +       ret = rb4xx_cpld_read(info->spi_dev, &data, 1);
>> +       if (ret) {
>> +               pr_err("rb4xx_nand: read data failed, error %d\n", ret);
> 
> Is it possible to use dev_err() here and in other places?

Not having much luck with this... for some reason the mtd_info struct passed
in doesn't have a name on its device, and I'm not sure why. It doesn't match
the mtd_info structs created from the partitions either. Can anyone shed
some light on this?

>> +static int rb4xx_cpld_probe(struct spi_device *spi)
>> +{
>> +       struct rb4xx_cpld *cpld;
>> +       struct rb4xx_cpld_platform_data *pdata;
>> +       int ret;
>> +
>> +       pdata = dev_get_platdata(&spi->dev);
> 
> Hmm... do we have helper in SPI framework to do that?

Not that I can see.

I'll fix things according to your other comments.


-- 
Bert Vermeulen        bert@biot.com          email/xmpp
