Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P75w9-00018J-W1
	for linux-mtd@lists.infradead.org; Sat, 16 Oct 2010 12:32:37 +0000
Received: by wwd20 with SMTP id 20so1550140wwd.18
	for <linux-mtd@lists.infradead.org>;
	Sat, 16 Oct 2010 05:32:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20101016100744.GA10815@pengutronix.de>
References: <AANLkTinaRHUmLHeTqcDeVMDQyHfYm7B6vPbUGVkebK2_@mail.gmail.com>
	<20101016100744.GA10815@pengutronix.de>
Date: Sat, 16 Oct 2010 20:25:44 +0800
Message-ID: <AANLkTikOKx7hhF9jffRF+HvfwYFDghZAzNBgO-pZpAFv@mail.gmail.com>
Subject: Re: Re :Re: [Help] SST39VF6401B Support
From: yidong zhang <zhangyd6@gmail.com>
To: Wolfram Sang <w.sang@pengutronix.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, taliaferro62@gmail.com,
	David.Woodhouse@intel.com, yegorslists@googlemail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi
  Thanks for your reply. In the cfi_nopri_fixup_table, i added the
below code as you did.
{ CFI_MFR_SST, 0x236D, fixup_sst39vf_rev_b, NULL, }, // SST39VF6401B
And the flash can get detected. But i still have one confusion.
According to the  data sheets Table 6, in the 6th bus write cycle.
39VF6401B uses 0x50 and 39VF6401 uses 0x30. If 39VF6401B uses 0x30 in
the 6th bus write cycle, it will erase a block-size(64KByte). When you
want to erase one sector-size(4KByte), the driver actually erases one
block-size(64KByte).

On Sat, Oct 16, 2010 at 6:07 PM, Wolfram Sang <w.sang@pengutronix.de> wrote=
:
> Hi,
>
> On Sat, Oct 16, 2010 at 03:08:46PM +0800, yidong zhang wrote:
>> hi
>>
>> >Just to apply the patch and see what happens. The most important part
>> >of this patch is:
>> >
>> >Please refer to the data sheets Table 6:
>> >39VF6401B data sheet http://www.sst.com/downloads/datasheet/S71288.pdf
>> >39VF6401 data sheet http://www.sst.com/downloads/datasheet/S71223-03.pd=
f
>> >
>> >The difference in the 6th bus write cycle. 39VF6401B uses 0x50 and
>> >39VF6401 uses 0x30.
>> >
>> >Without this even if the chip gets detected you cannot write to it.
>> >
>> >I haven't look at this since my try to submit this patch, so I don't
>> >know how to fix the stuff for cfi_probe.
>>
>> =A0Recently, i use the 39VF6401B flash, and i apply your patch. The chip
>> can be get detected. But when i erase one sector, it use 0x30 to erase
>> one block. The size of a block is much bigger than a sector as we
>> know.So i use the JEDEC probe to detect the flash. And i make the
>> erase size to one block-erase size. And it works fine. So i think
>> the =A0chip(39VF6401B) =A0should not be CFI compliant, maybe the =A0JEDE=
C
>> mode is better.
>
> Please have a look at cfi_cmdset_0002.c, especially the table
> cfi_nopri_fixup_table. Without verifying the details, I assume you just h=
ave to
> add the IDs there and then you can have CFI.
>
> Kind regards,
>
> =A0 Wolfram
>
> --
> Pengutronix e.K. =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | Wo=
lfram Sang =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0|
> Industrial Linux Solutions =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | http://www.p=
engutronix.de/ =A0|
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.9 (GNU/Linux)
>
> iEYEARECAAYFAky5eXAACgkQD27XaX1/VRs0SwCfe5vFN1rR5mJ+c6agYoJPRYw2
> OksAoJy1j0EZTRN0FYHyfWRONIbaOSZj
> =3DMipu
> -----END PGP SIGNATURE-----
>
>
