Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cGGLO-0004yg-A2
 for linux-mtd@lists.infradead.org; Mon, 12 Dec 2016 02:27:59 +0000
Received: by mail-wm0-x242.google.com with SMTP id m203so8167801wma.3
 for <linux-mtd@lists.infradead.org>; Sun, 11 Dec 2016 18:27:37 -0800 (PST)
Subject: Re: [PATCH v3 3/5] mtd: aspeed: used a label property
To: Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>
References: <1481302167-28044-1-git-send-email-clg@kaod.org>
 <1481302167-28044-4-git-send-email-clg@kaod.org>
 <CACPK8Xcj4P34-4krGbnimVG89wMcHoRX4XJ66-_7KtAt6-vTkA@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <d8a6f699-3ee2-07b1-f0f5-478b0d8dd259@gmail.com>
Date: Mon, 12 Dec 2016 03:27:00 +0100
MIME-Version: 1.0
In-Reply-To: <CACPK8Xcj4P34-4krGbnimVG89wMcHoRX4XJ66-_7KtAt6-vTkA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/12/2016 12:46 AM, Joel Stanley wrote:
> On Sat, Dec 10, 2016 at 3:49 AM, Cédric Le Goater <clg@kaod.org> wrote:
>> This can be used to easily identify a chip on a system with multiple
>> chips.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> 
> Our userspace benefits from having this.
> 
> Acked-by: Joel Stanley <joel@jms.id.au>

Shouldn't such thing be part of core code then ?

>> ---
>>  drivers/mtd/spi-nor/aspeed-smc.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
>> index 99302b0d7786..9119c0ca86b6 100644
>> --- a/drivers/mtd/spi-nor/aspeed-smc.c
>> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
>> @@ -676,6 +676,8 @@ static int aspeed_smc_setup_flash(struct aspeed_smc_controller *controller,
>>                 nor->prepare = aspeed_smc_prep;
>>                 nor->unprepare = aspeed_smc_unprep;
>>
>> +               mtd->name = of_get_property(child, "label", NULL);
>> +
>>                 ret = aspeed_smc_chip_setup_init(chip, r);
>>                 if (ret)
>>                         break;
>> --
>> 2.7.4
>>


-- 
Best regards,
Marek Vasut
