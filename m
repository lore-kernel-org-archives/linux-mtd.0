Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f16No-0008CG-DC
 for linux-mtd@lists.infradead.org; Wed, 28 Mar 2018 08:24:38 +0000
Received: by mail-wr0-x242.google.com with SMTP id z73so1388119wrb.0
 for <linux-mtd@lists.infradead.org>; Wed, 28 Mar 2018 01:24:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5e92b50c-c0d7-c505-b4e0-8a1698371b2a@microchip.com>
References: <20180327170158.3351-1-boris.brezillon@bootlin.com>
 <5e92b50c-c0d7-c505-b4e0-8a1698371b2a@microchip.com>
From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Wed, 28 Mar 2018 10:24:24 +0200
Message-ID: <CALdGskLQFntjeRFHM+JsRCijTN7ArBd2Mp8wdEX0RmoE1f0Esg@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: atmel: Fix get_sectorsize() function
To: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 stable@vger.kernel.org, Tudor Ambarus <Tudor.Ambarus@microchip.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 28, 2018 at 10:17 AM, Nicolas Ferre
<nicolas.ferre@microchip.com> wrote:
> On 27/03/2018 at 19:01, Boris Brezillon wrote:
>>
>> get_sectorsize() was not using the appropriate macro to extract the
>> ECC sector size from the config cache, which led to buggy ECC when
>> using 1024 byte sectors.
>>
>> Fixes: f88fc122cc34 ("mtd: nand: Cleanup/rework the atmel_nand driver")
>> Cc: <stable@vger.kernel.org>
>> Reported-by: Olivier Schonken <olivier.schonken@gmail.com>
>> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
>
>
> Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> Thanks Boris.
>
> Best regards,
>   Nicolas
>
>
>> ---
>>   drivers/mtd/nand/atmel/pmecc.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/nand/atmel/pmecc.c
>> b/drivers/mtd/nand/atmel/pmecc.c
>> index 8268636675ef..4124bf91bee6 100644
>> --- a/drivers/mtd/nand/atmel/pmecc.c
>> +++ b/drivers/mtd/nand/atmel/pmecc.c
>> @@ -426,7 +426,7 @@ static int get_strength(struct atmel_pmecc_user *user)
>>     static int get_sectorsize(struct atmel_pmecc_user *user)
>>   {
>> -       return user->cache.cfg & PMECC_LOOKUP_TABLE_SIZE_1024 ? 1024 :
>> 512;
>> +       return user->cache.cfg & PMECC_CFG_SECTOR1024 ? 1024 : 512;
>>   }
>>     static void atmel_pmecc_gen_syndrome(struct atmel_pmecc_user *user,
>> int sector)
>>
>
>
> --
> Nicolas Ferre

Tested-by: Olivier Schonken <olivier.schonken@gmail.com>
Thanks again.

Regards

Olivier
