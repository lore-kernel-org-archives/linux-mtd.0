Received: from mail-gw0-f49.google.com ([74.125.83.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P9F4k-00048t-E1
	for linux-mtd@lists.infradead.org; Fri, 22 Oct 2010 10:42:19 +0000
Received: by gwj17 with SMTP id 17so1024887gwj.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 22 Oct 2010 03:42:15 -0700 (PDT)
MIME-Version: 1.0
Sender: foxcore@gmail.com
In-Reply-To: <AANLkTi=NKDPhdoDYE0ZdM2tuqWdFBNbui1AHZw_wXx97@mail.gmail.com>
References: <AANLkTinaRHUmLHeTqcDeVMDQyHfYm7B6vPbUGVkebK2_@mail.gmail.com>
	<20101016100744.GA10815@pengutronix.de>
	<AANLkTikOKx7hhF9jffRF+HvfwYFDghZAzNBgO-pZpAFv@mail.gmail.com>
	<20101016131752.GA2676@pengutronix.de>
	<AANLkTim+RBZRsYFyqXRD65tPw69s3rKogEnBFBQr4E5q@mail.gmail.com>
	<20101018114104.GC15440@pengutronix.de>
	<AANLkTimcpMb6-VykL0jSsocVF4z19TLMUi4c6dvvbNtF@mail.gmail.com>
	<AANLkTi=jNvWZe-bED0fZa-XbvoLmpu7VcFN7nUN=4Tru@mail.gmail.com>
	<AANLkTinLTW25faUTBfKBVcpFXFrtv1UhWWDN9Dgm1jOH@mail.gmail.com>
	<AANLkTiknoWR_v-TfV5M5ZwsV3Lsk=EDDD185kXp4B96V@mail.gmail.com>
	<AANLkTin-4fGYzD8a9rDp9M7YEk1y7JbXmZVLjA=3iU3Q@mail.gmail.com>
	<AANLkTimwhvNmfz5rVjzCTc5_GaNzCg185v+NLD6bLgno@mail.gmail.com>
	<AANLkTinjcF_4wDGXN+Jg43Pjq=iM++1YQ9+evHrgxPaa@mail.gmail.com>
	<AANLkTinr5E2E4Nth_-XybNPKfHnrgSFPWtVqxkMdQa-Y@mail.gmail.com>
	<AANLkTi=NKDPhdoDYE0ZdM2tuqWdFBNbui1AHZw_wXx97@mail.gmail.com>
From: Guillaume LECERF <glecerf@gmail.com>
Date: Fri, 22 Oct 2010 12:41:40 +0200
Message-ID: <AANLkTikG5KWJwm2MFCX+-j2f4JiVTsiG1qsgh4T8aoZQ@mail.gmail.com>
Subject: Re: Re :Re: [Help] SST39VF6401B Support
To: yidong zhang <zhangyd6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: taliaferro62@gmail.com, yegorslists@googlemail.com,
	linux-mtd@lists.infradead.org,
	Wolfram Sang <w.sang@pengutronix.de>, David.Woodhouse@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2010/10/22 yidong zhang <zhangyd6@gmail.com>:
>> You didn't applied my latest patch, you would have only 1 erase region
>> if you did.
> =C2=A0It was printed by the print_cfi_ident function. And the region
> number is readed from the flash. So there was 2 erase region

OK, my bad :(

The datasheet is really f***ed up.

"Sector Information (y + 1 =3D Number of sectors; z x 256B =3D sector size)
y =3D 2047 + 1 =3D 2048 sectors (03FFH =3D 1023)
z =3D 32 x 256 Bytes =3D 8 KBytes/sector (0100H =3D 32)"

03FFH =3D 1023, so y =3D 1023 + 1 =3D 1024 sectors
0100H =3D 256 (not 32), so z =3D 256 x 256 =3D 64 KBytes/sector

I think we should modify the sector size on the fly, i.e. changing
0100h to 0020h (32).

Could you try setting cif->cfiq->EraseRegionInfo[0] to 0x02003FF in
fixup_sst39vf_rev_b() ?

--=20
Guillaume LECERF
GeeXboX developer - www.geexbox.org
