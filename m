Received: from qw-out-1920.google.com ([74.125.92.145])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MSlDf-0003xO-Gl
	for linux-mtd@lists.infradead.org; Mon, 20 Jul 2009 05:15:27 +0000
Received: by qw-out-1920.google.com with SMTP id 5so880883qwf.24
	for <linux-mtd@lists.infradead.org>;
	Sun, 19 Jul 2009 22:15:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <bc64b4640907190908m209572e8od16ac648f19503e@mail.gmail.com>
References: <20090714.230503.162167450.anemo@mba.ocn.ne.jp>
	<20090719001127.GA6449@doriath.ww600.siemens.net>
	<20090720.001426.102579925.anemo@mba.ocn.ne.jp>
	<bc64b4640907190908m209572e8od16ac648f19503e@mail.gmail.com>
Date: Mon, 20 Jul 2009 10:45:20 +0530
Message-ID: <ce9ab5790907192215q148e194ale4a509112b1b40aa@mail.gmail.com>
Subject: Re: abuse of nand_correct_data in tmio_nand driver
From: vimal singh <vimal.newwork@gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Atsushi Nemoto <anemo@mba.ocn.ne.jp>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Jul 19, 2009 at 9:38 PM, Dmitry
Eremin-Solenikov<dbaryshkov@gmail.com> wrote:
> 2009/7/19, Atsushi Nemoto <anemo@mba.ocn.ne.jp>:
>> On Sun, 19 Jul 2009 04:11:27 +0400, Dmitry Eremin-Solenikov
>> <dbaryshkov@gmail.com> wrote:
>>> > The current nand_correct_data() can be used for ecc.bytes =3D 3 case
>>> > only. =A0The tmio_nand driver uses ecc.bytes =3D 6.
>>>
>>> IIRC, tmio_nand driver accesses two ecc "sectors" at once, so this is
>>> most probably ok. I'll look into it though, when I have some time.
>>
>> Yes, tmio_nand driver read 512 byte data and calculate 6 byte ecc at
>> once, but nand_correct_data only references first 3 byte of ecc.
>>
>> I doubt the driver cannot detect errors in the second 256 byte sector
>> of the 512 byte block.

Seems like this driver may be reading 512 bytes at a times, but still
calculates 256-byte sector ECC. (1-bit error correction for each 256
bytes of data).
In that case, nand_correct_data() should be called twice, once for
each 256 byte data.

This can be handled by overriding 'chip->ecc.correct' in driver. You
may reuse 'nand_correct_data()' code in the driver of 256 byte sector
ECC.

>
> Hmm. That's strange: nand_correct_data() seems to support 512-byte sector=
s,
> however it assumes that ECC is still 3 bytes. I'll have to check specs to=
 see
> who is wrong...

Yes, nand_correct_data() supports 512-byte sector ECC. 3 bytes of ECC
are not assumed one, but are required by Hamming algo for 512 byte
sector. Which gives 1 bit error correction capability over 512 bytes
of data.


>
> --
> With best wishes
> Dmitry
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>



--=20
---
Regards,
\/ | |\/| /-\ |_

____      __o
------   -\<,
-----  ( )/ ( )
