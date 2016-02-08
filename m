Received: from mail-wm0-x229.google.com ([2a00:1450:400c:c09::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aSrHf-0008BU-1V
 for linux-mtd@lists.infradead.org; Mon, 08 Feb 2016 19:15:39 +0000
Received: by mail-wm0-x229.google.com with SMTP id p63so128245328wmp.1
 for <linux-mtd@lists.infradead.org>; Mon, 08 Feb 2016 11:15:17 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CACna6rz9ppFXqhh6=m7cnmQ58y=4w4X8f_DM_8Y0ePZ71BoL3g@mail.gmail.com>
References: <CACna6rxZCkeCijReQDSr2Jc7m8q0J7qp=nhNgnkFFzk312wSdg@mail.gmail.com>
 <CACna6rz9ppFXqhh6=m7cnmQ58y=4w4X8f_DM_8Y0ePZ71BoL3g@mail.gmail.com>
Date: Mon, 8 Feb 2016 14:15:16 -0500
Message-ID: <CAC=U0a1vj1020X8BjvYGSOi7GrJCAad3A8wCeosuEo+7i4Rk3A@mail.gmail.com>
Subject: Re: brcmnand (iproc): bitflips and ECC errors due to ignored ECC
 config
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Hauke Mehrtens <hauke@hauke-m.de>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>
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

When SECTOR_SIZE =3D 512B, SPARE_AREA_SIZE  =3D 16, ECC_LEVEL =3D 15 enable=
s
1-bit Hamming ECC protection. So the ecc_level field is the SoC
internal representation for 1-bit hamming. If you mean by "removing
handling" you made strength=3Decc_level=3D1, then you are now using 1-bit
BCH.

Kamal

On Mon, Feb 8, 2016 at 4:54 AM, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> =
wrote:
> On 25 January 2016 at 13:59, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> w=
rote:
>> I've a D-Link DIR-885L router with following NAND:
>> nand: device found, Manufacturer ID: 0x01, Chip ID: 0xf1
>> nand: AMD/Spansion NAND 128MiB 3,3V 8-bit
>> nand: 128 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
>>
>> It uses ECC strength 1 with step size 512 so I created DT with:
>> nand-ecc-strength =3D <1>;
>> nand-ecc-step-size =3D <512>;
>>
>> Unfortunately all I get from mtd_read are -EUCLEAN (6%) and -EBADMSG
>> (94%) errors. It's becase of the following code in brcmnand_setup_dev:
>> if (chip->ecc.strength =3D=3D 1) /* Hamming */
>> cfg->ecc_level =3D 15;
>>
>> After removing this special handling of strength 1 I can use my NAND
>> as expected.
>>
>> Is there a good reason for this hamming condition? Can we add some way
>> of using strength 1?
>
> Ping?
>
> --
> Rafa=C5=82
