Message-ID: <537DB292.1050806@ti.com>
Date: Thu, 22 May 2014 11:17:22 +0300
From: Roger Quadros <rogerq@ti.com>
MIME-Version: 1.0
To: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [RFC PATCH 08/16] mtd: nand: omap: Fix build warning
References: <1400671264-10702-1-git-send-email-rogerq@ti.com>
 <1400671264-10702-9-git-send-email-rogerq@ti.com>
 <02cd01cf7558$7500eb00$5f02c100$%han@samsung.com>
In-Reply-To: <02cd01cf7558$7500eb00$5f02c100$%han@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, linux-omap@vger.kernel.org, 'Christian
 Engelmayer' <cengelma@gmx.at>, tony@atomide.com, robertcnelson@gmail.com,
 nsekhar@ti.com, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 pekon@ti.com, ezequiel.garcia@free-electrons.com, javier@dowhile0.org,
 computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/22/2014 03:54 AM, Jingoo Han wrote:
> On Wednesday, May 21, 2014 8:21 PM, Roger Quadros wrote:
>>
>> Fix the following warning when CONFIG_MTD_NAND_OMAP_BCH is disabled.
>> warning: ‘erased_sector_bitflips’ defined but not used [-Wunused-function]
>>
>> Signed-off-by: Roger Quadros <rogerq@ti.com>
> 
> (+cc Christian Engelmayer)
> 
> The same patch was already sent by Christian Engelmayer. [1]
> Also, it was applied to mtd tree by Brian Norris. [2]
> Thank you.
> 
> [1] http://lists.infradead.org/pipermail/linux-mtd/2014-April/053330.html
> [2] http://git.infradead.org/users/dedekind/l2-mtd.git/commit/9fd6c6c18c1a4a3220473c76fd447c5708b5ecf9

Great! thanks for the information.

I'll drop this patch from my series.

cheers,
-roger

> 
>> ---
>>  drivers/mtd/nand/omap2.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
>> index 1ff49b8..1b800bc 100644
>> --- a/drivers/mtd/nand/omap2.c
>> +++ b/drivers/mtd/nand/omap2.c
>> @@ -1237,6 +1237,7 @@ static int __maybe_unused omap_calculate_ecc_bch(struct mtd_info *mtd,
>>  	return 0;
>>  }
>>
>> +#ifdef CONFIG_MTD_NAND_OMAP_BCH
>>  /**
>>   * erased_sector_bitflips - count bit flips
>>   * @data:	data sector buffer
>> @@ -1276,7 +1277,6 @@ static int erased_sector_bitflips(u_char *data, u_char *oob,
>>  	return flip_bits;
>>  }
>>
>> -#ifdef CONFIG_MTD_NAND_OMAP_BCH
>>  /**
>>   * omap_elm_correct_data - corrects page data area in case error reported
>>   * @mtd:	MTD device structure
>> --
>> 1.8.3.2
> 
