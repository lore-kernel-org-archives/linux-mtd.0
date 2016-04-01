Received: from mail-ig0-x232.google.com ([2607:f8b0:4001:c05::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1am4oY-0003tx-6n
 for linux-mtd@lists.infradead.org; Fri, 01 Apr 2016 19:33:02 +0000
Received: by mail-ig0-x232.google.com with SMTP id sy18so3999256igc.1
 for <linux-mtd@lists.infradead.org>; Fri, 01 Apr 2016 12:32:41 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160401160722.GC117117@google.com>
References: <1455300685-27009-1-git-send-email-zajec5@gmail.com>
 <1455300685-27009-2-git-send-email-zajec5@gmail.com>
 <20160401160722.GC117117@google.com>
Date: Fri, 1 Apr 2016 21:32:40 +0200
Message-ID: <CACna6rz6mYSxAr1oSjcLc__sSKM1XdUf-cGOFanGvuij0nNC5Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] mtd: nand: read (from DT) and store ECC algorithm
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Hauke Mehrtens <hauke@hauke-m.de>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 1 April 2016 at 18:07, Brian Norris <computersforpeace@gmail.com> wrote:
> On Fri, Feb 12, 2016 at 07:11:24PM +0100, Rafa=C5=82 Mi=C5=82ecki wrote:
>> This will allow drivers handle ECC properly.
>>
>> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
>> ---
>>  drivers/mtd/nand/nand_base.c | 6 +++++-
>>  include/linux/mtd/nand.h     | 1 +
>>  2 files changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
>> index f2c8ff3..ef977f3 100644
>> --- a/drivers/mtd/nand/nand_base.c
>> +++ b/drivers/mtd/nand/nand_base.c
>> @@ -3979,7 +3979,7 @@ ident_done:
>>  static int nand_dt_init(struct nand_chip *chip)
>>  {
>>       struct device_node *dn =3D nand_get_flash_node(chip);
>> -     int ecc_mode, ecc_strength, ecc_step;
>> +     int ecc_mode, ecc_algo, ecc_strength, ecc_step;
>>
>>       if (!dn)
>>               return 0;
>> @@ -3991,6 +3991,7 @@ static int nand_dt_init(struct nand_chip *chip)
>>               chip->bbt_options |=3D NAND_BBT_USE_FLASH;
>>
>>       ecc_mode =3D of_get_nand_ecc_mode(dn);
>> +     ecc_algo =3D of_get_nand_ecc_algo(dn);
>>       ecc_strength =3D of_get_nand_ecc_strength(dn);
>>       ecc_step =3D of_get_nand_ecc_step_size(dn);
>>
>> @@ -4003,6 +4004,9 @@ static int nand_dt_init(struct nand_chip *chip)
>>       if (ecc_mode >=3D 0)
>>               chip->ecc.mode =3D ecc_mode;
>>
>> +     if (ecc_algo >=3D 0)
>> +             chip->ecc.algo =3D ecc_algo;
>> +
>
> While this might appear to handle the absence of the nand-ecc-algo
> property correctly, this isn't safe. This means that any existing DT
> without the property will get treated as Hamming ECC. Perhaps we need
> the enum to have a 0 value of 'NAND_ECC_ALGO_UNKNOWN' or something like
> that?

You're commenting on an old series. If you take a look at:
https://patchwork.ozlabs.org/patch/601180/
that also got applied to the:
https://github.com/linux-nand/linux/commits/nand/next
repo, you'll see we have NAND_ECC_UNKNOWN there.
