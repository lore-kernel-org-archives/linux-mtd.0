Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OvU8R-00060q-OD
	for linux-mtd@lists.infradead.org; Tue, 14 Sep 2010 11:57:16 +0000
Received: by iwn36 with SMTP id 36so5736894iwn.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 14 Sep 2010 04:57:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <3850A844E6A3854C827AC5C0BEC7B60A1FC299@zch01exm23.fsl.freescale.net>
References: <AANLkTik3ViwjmOFfm6GUwmuzMkO75+2pCUdnC0z8A7Jb@mail.gmail.com>
	<3850A844E6A3854C827AC5C0BEC7B60A1FC150@zch01exm23.fsl.freescale.net>
	<20100913112749.2fb32b3d@schlenkerla.am.freescale.net>
	<3850A844E6A3854C827AC5C0BEC7B60A1FC299@zch01exm23.fsl.freescale.net>
From: Timur Tabi <timur.tabi@gmail.com>
Date: Tue, 14 Sep 2010 06:56:44 -0500
Message-ID: <AANLkTim2HAnwF7wdbJb_Oc9rzPVe0Y-B7nOHiUVoWef=@mail.gmail.com>
Subject: Re: [PATCH v2 3/3][MTD] P4080/mtd: Fix the freescale lbc issue with
	36bit mode
To: Zang Roy-R61911 <r61911@freescale.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Wood Scott-B07421 <B07421@freescale.com>, dedekind1@gmail.com,
	Lan Chunhe-B25806 <B25806@freescale.com>, linuxppc-dev@ozlabs.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-mtd@lists.infradead.org, akpm@linux-foundation.org,
	dwmw2@infradead.org, Gala Kumar-B11780 <B11780@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Sep 13, 2010 at 11:09 PM, Zang Roy-R61911 <r61911@freescale.com> wr=
ote:

>> > > Shouldn't this be u32 or __be32, for consistency with the actual
>> > > comparisons below?
>> > __be32 is better.
>>
>> I disagree, the return from this function is native-endian. =A0It should
>> be u32.
> But the return of this value is ONLY used for br comparing. It is big end=
ia.
> Thanks.

No, Scott is right.  The return value is native-endian (NE).  You've
converted it from BE to NE already.

--=20
Timur Tabi
Linux kernel developer at Freescale
