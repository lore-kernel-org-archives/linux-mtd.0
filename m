Received: from ch1ehsobe005.messaging.microsoft.com ([216.32.181.185]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UUA9W-00073F-1W
 for linux-mtd@lists.infradead.org; Mon, 22 Apr 2013 06:23:04 +0000
Message-ID: <5174D7A2.2050203@freescale.com>
Date: Mon, 22 Apr 2013 14:24:34 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 04/11] mtd: add data structures for Extended Parameter Page
References: <1363605534-24776-1-git-send-email-b32955@freescale.com>	<1363605534-24776-5-git-send-email-b32955@freescale.com>
 <CAN8TOE8k8gOWxTeBv3N41Jfsh1Zo-2GfUEAvq0vFsGMJ-rz2hA@mail.gmail.com>
In-Reply-To: <CAN8TOE8k8gOWxTeBv3N41Jfsh1Zo-2GfUEAvq0vFsGMJ-rz2hA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 matthieu.castet@parrot.com, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B404=E6=9C=8822=E6=97=A5 12:24, Brian Norris =E5=86=99=
=E9=81=93:
> On Mon, Mar 18, 2013 at 4:18 AM, Huang Shijie<b32955@freescale.com>  wr=
ote:
>> Since the ONFI 2.1, the onfi spec adds the Extended Parameter Page
>> to store the ECC info.
>>
>> The onfi spec tells us that if the nand chip's recommended ECC codewor=
d
>> size is not 512 bytes, then the @ecc_bits is 0xff. The host _SHOULD_ t=
hen
>> read the Extended ECC information that is part of the extended paramet=
er
>> page to retrieve the ECC requirements for this device.
>>
>> This patch adds
>>      [1] the neccessary fields for nand_onfi_params{},
>>      [2] and adds the ext_ecc_info{} for Extended ECC information,
>>      [3] adds ext_section{} for extended sections,
>>      [4] and adds ext_param_page{} for the Extended Parameter Page.
>>
>> Signed-off-by: Huang Shijie<b32955@freescale.com>
>> ---
>>   include/linux/mtd/nand.h |   39 ++++++++++++++++++++++++++++++++++++=
++-
>>   1 files changed, 38 insertions(+), 1 deletions(-)
>>
>> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
>> index 9779e3e..94ae957 100644
>> --- a/include/linux/mtd/nand.h
>> +++ b/include/linux/mtd/nand.h
>> @@ -217,7 +217,10 @@ struct nand_onfi_params {
>>          __le16 revision;
>>          __le16 features;
>>          __le16 opt_cmd;
>> -       u8 reserved[22];
>> +       u8 reserved0[2];
>> +       __le16 ext_param_page_length; /* since onfi 2.1 */
>> +       u8 num_of_param_pages;        /* since onfi 2.1 */
>> +       u8 reserved1[17];
>>
>>          /* manufacturer information block */
>>          char manufacturer[12];
>> @@ -274,6 +277,40 @@ struct nand_onfi_params {
>>
>>   #define ONFI_CRC_BASE  0x4F4E
>>
>> +/* Extended ECC information Block Definition (since onfi 2.1) */
>> +struct ext_ecc_info {
> Should include NAND and/or ONFI in the name (e.g., onfi_ext_ecc_info)
>
>> +       u8 ecc_bits;
>> +       u8 codeword_size;
>> +       __le16 bb_per_lun;
>> +       __le16 block_endurance;
>> +       u8 reserved[2];
>> +} __attribute__((packed));
>> +
>> +#define SECTION_TYPE_0 0       /* Unused section. */
>> +#define SECTION_TYPE_1 1       /* for additional sections. */
>> +#define SECTION_TYPE_2 2       /* for ECC information. */
> Should prefix these with ONFI_
>
>> +struct ext_section {
> Also needs an ONFI prefix, e.g., onfi_ext_section
>
>> +       u8 type;
>> +       u8 length;
>> +} __attribute__((packed));
>> +
>> +#define EXT_SECTION_MAX 8
> Also should be prefixed ONFI_
>
>> +
>> +/* Extended Parameter Page Definition (since onfi 2.1) */
>> +struct ext_param_page {
> onfi_ext_param_page
>
>> +       __le16 crc;
>> +       u8 sig[4];             /* 'E' 'P' 'P' 'S' */
>> +       u8 reserved0[10];
>> +       struct ext_section sections[EXT_SECTION_MAX];
>> +
>> +       /*
>> +        * The actual size of the Extended Parameter Page is in
>> +        * @ext_param_page_length of nand_onfi_params{}.
>> +        * The followings are the unknown length sections.
> s/followings/following/
> s/unknown /variable-/
>
>> +        * So we do not add any fields below. Please see the onfi spec=
.
> s/onfi/ONFI/
>
>> +        */
>> +} __attribute__((packed));
>> +
>>   /**
>>    * struct nand_hw_control - Control structure for hardware controlle=
r (e.g ECC generator) shared among independent devices
>>    * @lock:               protection lock
>
thanks Brian.

I will fix it in next version.

Huang Shijie
