Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZJIWt-0003BC-8f
 for linux-mtd@lists.infradead.org; Sun, 26 Jul 2015 09:47:35 +0000
Received: by padck2 with SMTP id ck2so35791742pad.0
 for <linux-mtd@lists.infradead.org>; Sun, 26 Jul 2015 02:47:14 -0700 (PDT)
Subject: Re: [PATCH V2 2/4] mtd: bcm47xxpart.c: Adding Xaiomi board support
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
References: <1437835063-58407-1-git-send-email-eastyjr@gmail.com>
 <1437835063-58407-3-git-send-email-eastyjr@gmail.com>
 <CACna6rxvk0pOSotaErMuhCU_-qd+e6PV+3osx9dOe-GgsiH4zQ@mail.gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Joseph East <eastyjr@gmail.com>
Message-ID: <55B4AC57.3070308@gmail.com>
Date: Sun, 26 Jul 2015 19:15:59 +0930
MIME-Version: 1.0
In-Reply-To: <CACna6rxvk0pOSotaErMuhCU_-qd+e6PV+3osx9dOe-GgsiH4zQ@mail.gmail.com>
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

On 26/07/2015 4:35 PM, Rafał Miłecki wrote:
> On 25 July 2015 at 16:37, Joseph East <eastyjr@gmail.com> wrote:
>> ---
> 
> Oh and now you're sending my patch pretending its your. NACK!
> 

The cover letter [PATCH 0/4] clearly states the origin of these patches.

The sign-off indicates that I am compliant with http://developercertificate.org/, in particular clause b)

I do not take credit for the creation for all of these patches, but I am pushing them.

I apologise if it appears anything was untoward, but I could not find any trace of these patches being pushed elsewhere.

>>  drivers/mtd/bcm47xxpart.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/bcm47xxpart.c
>> index 55a1462..a27d185 100644
>> --- a/drivers/mtd/bcm47xxpart.c
>> +++ b/drivers/mtd/bcm47xxpart.c
>> @@ -33,6 +33,7 @@
>>  /* Magics */
>>  #define BOARD_DATA_MAGIC               0x5246504D      /* MPFR */
>>  #define BOARD_DATA_MAGIC2              0xBD0D0BBD
>> +#define BOARD_DATA_XIAOMI_MAGIC        0x474D4442      /* GMDB */
>>  #define CFE_MAGIC                      0x43464531      /* 1EFC */
>>  #define FACTORY_MAGIC                  0x59544346      /* FCTY */
>>  #define NVRAM_HEADER                   0x48534C46      /* FLSH */
>> @@ -263,7 +264,8 @@ static int bcm47xxpart_parse(struct mtd_info *master,
>>                 }
>>
>>                 /* Some devices (ex. WNDR3700v3) don't have a standard 'MPFR' */
>> -               if (buf[0x000 / 4] == BOARD_DATA_MAGIC2) {
>> +               if (buf[0x000 / 4] == BOARD_DATA_MAGIC2 ||
>> +                   le32_to_cpu(buf[0x000 / 4]) == BOARD_DATA_XIAOMI_MAGIC) {
> 
> le32_to_cpu won't work here obviously, so it seems you didn't even
> test it on a proper device. Nack.

This patch has been in OpenWrt for 6 months which you apparently signed off.

https://dev.openwrt.org/browser/trunk/target/linux/generic/patches-3.18/431-mtd-bcm47xxpart-support-for-Xiaomi-specific-board_da.patch

While true I have not tested this code path, why has this not been raised earlier?

At the very least it does not prevent compilation for other brcm47xx targets.

That does not justify its inclusion however, and I have no issues with this patch being dropped.

Regards,
Joseph
