Received: from 17.mo5.mail-out.ovh.net ([46.105.56.132])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cGMkn-000364-Ny
 for linux-mtd@lists.infradead.org; Mon, 12 Dec 2016 09:18:41 +0000
Received: from player760.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id CC63654D71
 for <linux-mtd@lists.infradead.org>; Mon, 12 Dec 2016 10:18:13 +0100 (CET)
Subject: Re: [PATCH v3 3/5] mtd: aspeed: used a label property
To: Marek Vasut <marek.vasut@gmail.com>, Joel Stanley <joel@jms.id.au>
References: <1481302167-28044-1-git-send-email-clg@kaod.org>
 <1481302167-28044-4-git-send-email-clg@kaod.org>
 <CACPK8Xcj4P34-4krGbnimVG89wMcHoRX4XJ66-_7KtAt6-vTkA@mail.gmail.com>
 <d8a6f699-3ee2-07b1-f0f5-478b0d8dd259@gmail.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <cacb6e39-8053-6f0e-69bb-642359a7d217@kaod.org>
Date: Mon, 12 Dec 2016 10:18:00 +0100
MIME-Version: 1.0
In-Reply-To: <d8a6f699-3ee2-07b1-f0f5-478b0d8dd259@gmail.com>
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

On 12/12/2016 03:27 AM, Marek Vasut wrote:
> On 12/12/2016 12:46 AM, Joel Stanley wrote:
>> On Sat, Dec 10, 2016 at 3:49 AM, Cédric Le Goater <clg@kaod.org> wrote:
>>> This can be used to easily identify a chip on a system with multiple
>>> chips.
>>>
>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>
>> Our userspace benefits from having this.
>>
>> Acked-by: Joel Stanley <joel@jms.id.au>
> 
> Shouldn't such thing be part of core code then ?

yes. I will merge it in the next version. 

we already have the jedec,spi-nor label patch to discuss about
the binding change.

Thanks,

C. 

>>> ---
>>>  drivers/mtd/spi-nor/aspeed-smc.c | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
>>> index 99302b0d7786..9119c0ca86b6 100644
>>> --- a/drivers/mtd/spi-nor/aspeed-smc.c
>>> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
>>> @@ -676,6 +676,8 @@ static int aspeed_smc_setup_flash(struct aspeed_smc_controller *controller,
>>>                 nor->prepare = aspeed_smc_prep;
>>>                 nor->unprepare = aspeed_smc_unprep;
>>>
>>> +               mtd->name = of_get_property(child, "label", NULL);
>>> +
>>>                 ret = aspeed_smc_chip_setup_init(chip, r);
>>>                 if (ret)
>>>                         break;
>>> --
>>> 2.7.4
>>>
> 
> 
