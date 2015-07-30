Received: from mail-wi0-x22c.google.com ([2a00:1450:400c:c05::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZKfKi-0005dM-4S
 for linux-mtd@lists.infradead.org; Thu, 30 Jul 2015 04:20:40 +0000
Received: by wibxm9 with SMTP id xm9so226926391wib.0
 for <linux-mtd@lists.infradead.org>; Wed, 29 Jul 2015 21:20:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAGRGNgUKU5y+qN+dJ0YhGzMPKxTfJMSrqnmniMZ1831SY_Ty5A@mail.gmail.com>
References: <1438192434-18363-1-git-send-email-hdegoede@redhat.com>
 <1438192434-18363-4-git-send-email-hdegoede@redhat.com>
 <CAGRGNgUKU5y+qN+dJ0YhGzMPKxTfJMSrqnmniMZ1831SY_Ty5A@mail.gmail.com>
From: Michal Suchanek <hramrach@gmail.com>
Date: Thu, 30 Jul 2015 06:19:39 +0200
Message-ID: <CAOMqctSVCNzxp86TW3qJ4jpjzdxPmscjOf9z67cj7GZzzoXGjg@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH 4/4] mtd: nand: print full chip ID
To: Julian Calaby <julian.calaby@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris BREZILLON <b.brezillon.dev@gmail.com>,
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

On 30 July 2015 at 01:37, Julian Calaby <julian.calaby@gmail.com> wrote:
> Hi Hans, Michal,
>
> On Thu, Jul 30, 2015 at 3:53 AM, Hans de Goede <hdegoede@redhat.com> wrote:
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
>> -                  struct nand_flash_dev *type, u8 *id_data, int *busw)
>> +                  struct nand_flash_dev *type, const u8 *id_data, int *busw)
>
> Should this be in another patch?
>

Yes, that's not needed here.

Thanks

Michal
