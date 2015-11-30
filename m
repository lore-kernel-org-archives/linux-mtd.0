Received: from mail-lf0-x22a.google.com ([2a00:1450:4010:c07::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a3ULC-0007IH-6K
 for linux-mtd@lists.infradead.org; Mon, 30 Nov 2015 19:42:26 +0000
Received: by lffu14 with SMTP id u14so211940965lff.1
 for <linux-mtd@lists.infradead.org>; Mon, 30 Nov 2015 11:42:04 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <201511301746.29684.marex@denx.de>
References: <1448897111-30713-1-git-send-email-ricardo.ribalda@gmail.com>
 <201511301746.29684.marex@denx.de>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Mon, 30 Nov 2015 20:41:44 +0100
Message-ID: <CAPybu_19xK6Afq1j0NFT8EPRv448v3Xd-m5m-SAjKuugg-RTZQ@mail.gmail.com>
Subject: Re: [PATCH] spi/nor: Fix error message with unrecognized JEDEC
To: Marek Vasut <marex@denx.de>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Huang Shijie <shijie.huang@intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Gabor Juhos <juhosg@openwrt.org>,
 =?UTF-8?B?QmVhbiBIdW8g6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>,
 Furquan Shaikh <furquan@google.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Marek

On Mon, Nov 30, 2015 at 5:46 PM, Marek Vasut <marex@denx.de> wrote:
> On Monday, November 30, 2015 at 04:25:11 PM, Ricardo Ribalda Delgado wrote:
>> The error message was:
>>
>> m25p80 spi32766.0: unrecognized JEDEC id bytes: 00,  0,  0
>>
>> The new error message:
>>
>> m25p80 spi32766.0: unrecognized JEDEC id bytes: 00, 00, 00
>>
>> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
>> ---
>>  drivers/mtd/spi-nor/spi-nor.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>> index b7c038c75684..7d2b96d5f350 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -890,7 +890,7 @@ static const struct flash_info *spi_nor_read_id(struct
>> spi_nor *nor) return &spi_nor_ids[tmp];
>>               }
>>       }
>> -     dev_err(nor->dev, "unrecognized JEDEC id bytes: %02x, %2x, %2x\n",
>> +     dev_err(nor->dev, "unrecognized JEDEC id bytes: %.2x, %.2x, %.2x\n",
>
> You can change it to %02x to make it consistent, no ? What do you think ?

Sure, no problem, it is just that I am more used to %.2 than %02 :)


>
>>               id[0], id[1], id[2]);
>>       return ERR_PTR(-ENODEV);
>>  }
>
> Best regards,
> Marek Vasut



-- 
Ricardo Ribalda
