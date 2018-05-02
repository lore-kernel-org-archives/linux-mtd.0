Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fE002-000631-5M
 for linux-mtd@lists.infradead.org; Wed, 02 May 2018 22:13:25 +0000
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Steve deRosier <derosier@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "boris.brezillon@bootlin.com"
 <boris.brezillon@bootlin.com>, Tobi Wulff <Tobi.Wulff@alliedtelesis.co.nz>
Subject: Re: NAND timeout issues with blank chip and Marvell NFC
Date: Wed, 2 May 2018 22:12:45 +0000
Message-ID: <0cf52da157904ad4a7af5a9fddd92c23@svr-chch-ex1.atlnz.lc>
References: <cf834bbf9ac14cfc8ad07e4921245f6f@svr-chch-ex1.atlnz.lc>
 <CALLGbRJOGq_3xtWRojPtjVSgnxt-GhwYKUvwEgQKLct=XtEjAw@mail.gmail.com>
 <20180424180837.398957ba@xps13>
 <72ff5349ac6e48a9ab74986947572108@svr-chch-ex1.atlnz.lc>
 <7cd09dc2689643e9a8e0751e1cba3e11@svr-chch-ex1.atlnz.lc>
 <d9eff05a579344d9a569e5bc0e1ec6bf@svr-chch-ex1.atlnz.lc>
 <20180426090321.1a5dee5b@xps13>
 <7db679c90cc041c78a1eb1fadf505bcd@svr-chch-ex1.atlnz.lc>
 <20180502172830.7697e75f@xps13>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/05/18 03:28, Miquel Raynal wrote:=0A=
> Hi Chris,=0A=
> =0A=
> =0A=
>>>>>>>>> nand: device found, Manufacturer ID: 0xc2, Chip ID: 0xda=0A=
>>>>>>>>> nand: Macronix MX30LF2G18AC=0A=
>>>>>>>>> nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB siz=
e: 64=0A=
> =0A=
> When forcing the ONFI parameters in the core to match the=0A=
> characteristics of your chip, it looks like I hit the same problems:=0A=
> http://code.bulix.org/nun6tn-327366=0A=
> =0A=
> I will search for a fix and let you know.=0A=
> =0A=
=0A=
Thanks. Let me know if I can do anything on my end.=0A=
=0A=
Also I know our timezones don't exactly overlap but I can probably =0A=
arrange access to one of our systems or at the very least an interactive =
=0A=
debug session via irc. Feel free to contact me off-list if you want to =0A=
set something up.=0A=
=0A=
>>=0A=
>> --- 8< ---=0A=
>> Subject: [PATCH] mtd: rawnand: marvell: pass ms delay to wait_op=0A=
>>=0A=
>> marvell_nfc_wait_op() expects the delay to be expressed in milliseconds=
=0A=
>> but nand_sdr_timings uses picoseconds. Use PSEC_TO_MSEC when passing=0A=
>> tPROG_max to marvell_nfc_wait_op().=0A=
>>=0A=
>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>=0A=
>> ---=0A=
>>    drivers/mtd/nand/raw/marvell_nand.c | 4 ++--=0A=
>>    1 file changed, 2 insertions(+), 2 deletions(-)=0A=
>>=0A=
>> diff --git a/drivers/mtd/nand/raw/marvell_nand.c=0A=
>> b/drivers/mtd/nand/raw/marvell_nand.c=0A=
>> index 1d779a35ac8e..e4b964fd40d8 100644=0A=
>> --- a/drivers/mtd/nand/raw/marvell_nand.c=0A=
>> +++ b/drivers/mtd/nand/raw/marvell_nand.c=0A=
>> @@ -1074,7 +1074,7 @@ static int=0A=
>> marvell_nfc_hw_ecc_hmg_do_write_page(struct nand_chip *chip,=0A=
>>    		return ret;=0A=
>>=0A=
>>    	ret =3D marvell_nfc_wait_op(chip,=0A=
>> -				  chip->data_interface.timings.sdr.tPROG_max);=0A=
>> +				  PSEC_TO_MSEC(chip->data_interface.timings.sdr.tPROG_max));=0A=
>>    	return ret;=0A=
>>    }=0A=
>>=0A=
>> @@ -1494,7 +1494,7 @@ static int=0A=
>> marvell_nfc_hw_ecc_bch_write_page(struct mtd_info *mtd,=0A=
>>    	}=0A=
>>=0A=
>>    	ret =3D marvell_nfc_wait_op(chip,=0A=
>> -				  chip->data_interface.timings.sdr.tPROG_max);=0A=
>> +				  PSEC_TO_MSEC(chip->data_interface.timings.sdr.tPROG_max));=0A=
>>=0A=
>>    	marvell_nfc_disable_hw_ecc(chip);=0A=
>>=0A=
>> --- 8< ---=0A=
> =0A=
> Could you please send this patch officially with the proper Fixes:/Cc:=0A=
> tags?=0A=
=0A=
Sure will do.=0A=
=0A=
> =0A=
> Thanks,=0A=
> Miqu=E8l=0A=
> =0A=
> =0A=
=0A=
