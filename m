Received: from ch1ehsobe006.messaging.microsoft.com ([216.32.181.186]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UcWaQ-0001Fe-7c
 for linux-mtd@lists.infradead.org; Wed, 15 May 2013 07:57:23 +0000
Message-ID: <51934054.1080106@freescale.com>
Date: Wed, 15 May 2013 15:59:16 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH 1/4] mtd: add a new field to mtd_info{}
References: <1367562104-8955-1-git-send-email-b32955@freescale.com>	
 <1367562104-8955-2-git-send-email-b32955@freescale.com>
 <1368604064.13665.22.camel@sauron.fi.intel.com>
In-Reply-To: <1368604064.13665.22.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B405=E6=9C=8815=E6=97=A5 15:47, Artem Bityutskiy =E5=
=86=99=E9=81=93:
> On Fri, 2013-05-03 at 14:21 +0800, Huang Shijie wrote:
>> In order to implement the NAND boot for some Freescale's chips, such a=
s
>> imx23/imx28/imx50/imx6, we use a tool (called kobs-ng) to burn the ubo=
ot
>> and some metadata to nand chip. And the ROM code will use the metadata=
 to
>> configrate the BCH, and to find the uboot.
>>
>> The ECC information(ecc step size, ecc strength) which is used to conf=
igrate
>> the BCH is part of the metadata. The kobs-ng can gets the ecc strength=
 from
>> the sys node /sys/*/ecc_strength now. But it can not gets the ecc step=
 size.
>>
>> This patch adds a new field to store the ecc step size in mtd_info{}, =
and
>> it makes preparation for the next patches.
>>
>> Signed-off-by: Huang Shijie<b32955@freescale.com>
>> ---
>>   include/linux/mtd/mtd.h |    3 +++
>>   1 files changed, 3 insertions(+), 0 deletions(-)
>>
>> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
>> index 183a304..b93035f 100644
>> --- a/include/linux/mtd/mtd.h
>> +++ b/include/linux/mtd/mtd.h
>> @@ -173,6 +173,9 @@ struct mtd_info {
>>   	/* ECC layout structure pointer - read only! */
>>   	struct nand_ecclayout *ecclayout;
>>
>> +	/* the ecc step size. */
>> +	unsigned int ecc_size;
> It would really be nice to harmonize the naming and probably stick to
> ecc_step everywhere. To me things looks confusing, because ecc_size is
> actually ECC step size, and not the size of ECC codes.
>
ok. I will use ecc_step as the name.

thanks
Huang Shijie
