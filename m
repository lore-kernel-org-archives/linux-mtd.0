Received: from mail-gy0-f177.google.com ([209.85.160.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QKV64-0001p2-4K
	for linux-mtd@lists.infradead.org; Thu, 12 May 2011 12:34:32 +0000
Received: by gyh20 with SMTP id 20so576074gyh.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 May 2011 05:34:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4DCB908C.80505@parrot.com>
References: <BANLkTi=e1mUTX4X7ui+HVCGh=sZ=HLoNCw@mail.gmail.com>
	<20110511183322.da0739c9.akpm@linux-foundation.org>
	<BANLkTikrqzpU8qZ5FUgG4HaBgZAvmbOHrQ@mail.gmail.com>
	<BANLkTinGFDHj4s6nAXMiq8dYW_UO6W+YXg@mail.gmail.com>
	<BANLkTin5X7d+_b5+7N5g941bz12jc+zMZA@mail.gmail.com>
	<4DCB908C.80505@parrot.com>
Date: Thu, 12 May 2011 07:34:26 -0500
Message-ID: <BANLkTik37R8tSxc9_qmBT5a2m9mAA_2XKQ@mail.gmail.com>
Subject: Re: Bug in MTD NAND ONFI chipsize detection
From: Nitin Garg <nitingarg98@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <dwmw2@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I do not see any diff for mtd.

Regards,
Nitin

On Thu, May 12, 2011 at 2:47 AM, Matthieu CASTET
<matthieu.castet@parrot.com> wrote:
> Hi,
>
>
> What's the difference between one lun and multiple lun for mtd ?
>
> Aren't any command to select the current lun ?
>
> Matthieu
>
>
> Nitin Garg a =E9crit :
>> Why isn't my patch going through? re-sending again,
>>
>> Signed-off-by: Nitin Garg <nitingarg98@xxxxxxxx>
>> ---
>> =A0drivers/mtd/nand/nand_base.c | =A0 =A02 +-
>> =A01 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
>> index c54a4cb..cdf6015 100644
>> --- a/drivers/mtd/nand/nand_base.c
>> +++ b/drivers/mtd/nand/nand_base.c
>> @@ -2892,7 +2892,7 @@ static int nand_flash_detect_onfi(struct
>> mtd_info *mtd, struct nand_chip *chip,
>> =A0 =A0 =A0 mtd->writesize =3D le32_to_cpu(p->byte_per_page);
>> =A0 =A0 =A0 mtd->erasesize =3D le32_to_cpu(p->pages_per_block) * mtd->wr=
itesize;
>> =A0 =A0 =A0 mtd->oobsize =3D le16_to_cpu(p->spare_bytes_per_page);
>> - =A0 =A0 chip->chipsize =3D (uint64_t)le32_to_cpu(p->blocks_per_lun) * =
mtd->erasesize;
>> + =A0 =A0 chip->chipsize =3D (uint64_t)le32_to_cpu(p->blocks_per_lun) *
>> le32_to_cpu(p->lun_count) * mtd->erasesize;
>> =A0 =A0 =A0 busw =3D 0;
>> =A0 =A0 =A0 if (le16_to_cpu(p->features) & 1)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 busw =3D NAND_BUSWIDTH_16;
>
