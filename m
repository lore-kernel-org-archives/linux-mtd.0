Received: from mail-wi0-x232.google.com ([2a00:1450:400c:c05::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZKlEd-0007gk-BC
 for linux-mtd@lists.infradead.org; Thu, 30 Jul 2015 10:38:48 +0000
Received: by wicmv11 with SMTP id mv11so15505494wic.0
 for <linux-mtd@lists.infradead.org>; Thu, 30 Jul 2015 03:38:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20150730091730.1774291d@bbrezillon>
References: <1438192434-18363-1-git-send-email-hdegoede@redhat.com>
 <1438192434-18363-4-git-send-email-hdegoede@redhat.com>
 <20150730091730.1774291d@bbrezillon>
From: Michal Suchanek <hramrach@gmail.com>
Date: Thu, 30 Jul 2015 12:37:46 +0200
Message-ID: <CAOMqctSvTiDgbmjvkpF=GiJa6Zi8avaAqoRmvgJvYuhaDHuwPw@mail.gmail.com>
Subject: Re: [PATCH 4/4] mtd: nand: print full chip ID
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Hans de Goede <hdegoede@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On 30 July 2015 at 09:17, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> Hans, Michal,
>
> On Wed, 29 Jul 2015 19:53:54 +0200
> Hans de Goede <hdegoede@redhat.com> wrote:
>
>> From: Michal Suchanek <hramrach@gmail.com>
>>
>> Full chip ID is printed so user has data to paste from syslog in case
>> of chip misidentification.
>>
>> Signed-off-by: Michal Suchanek <hramrach@gmail.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/mtd/nand/nand_base.c | 28 +++++++++++++++++++++++-----
>>  1 file changed, 23 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
>> index e2e2690..13e9938 100644
>> --- a/drivers/mtd/nand/nand_base.c
>> +++ b/drivers/mtd/nand/nand_base.c
>> @@ -4243,7 +4243,7 @@ static inline bool is_full_id_nand(struct nand_flash_dev *type)
>>  }
>>
>>  static bool find_full_id_nand(struct mtd_info *mtd, struct nand_chip *chip,
>> -                struct nand_flash_dev *type, u8 *id_data, int *busw)
>> +                struct nand_flash_dev *type, const u8 *id_data, int *busw)
>>  {
>>       if (!strncmp(type->id, id_data, type->id_len)) {
>>               mtd->writesize = type->pagesize;
>> @@ -4269,6 +4269,26 @@ static bool find_full_id_nand(struct mtd_info *mtd, struct nand_chip *chip,
>>  }
>>
>>  /*
>> + * Print full detail of chip ID read from chip.
>> + */
>> +static void print_nand_chip_info(int maf_id, int dev_id, u8 id_data[8])
>> +{
>> +     u8 delim[8] = { [0 ... 7] = ',' };
>> +
>> +     pr_info("device found, Manufacturer ID: 0x%02x, Chip ID: 0x%02x\n",
>> +             maf_id, dev_id);
>> +
>> +     delim[7] = ' ';
>> +     delim[nand_id_len(id_data, 8) - 1] = ';';
>> +
>> +     pr_info("chip id data: 0x%02x%c 0x%02x%c 0x%02x%c 0x%02x%c 0x%02x%c 0x%02x%c 0x%02x%c 0x%02x%c\n",
>> +             id_data[0], delim[0], id_data[1], delim[1],
>> +             id_data[2], delim[2], id_data[3], delim[3],
>> +             id_data[4], delim[4], id_data[5], delim[5],
>> +             id_data[6], delim[6], id_data[7], delim[7]);
>
> This looks like debug information to me, how about using pr_debug ?
>

This is informative message saying that a device was detected. The
only change is that full id is printed as part of the message. The
same message is printed when the device fails to identify so it should
probably be shown by default. Maybe joining it into one line to avoid
excessive spam would be better.

Thanks

Michal
