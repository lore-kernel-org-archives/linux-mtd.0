Received: from mail-bw0-f218.google.com ([209.85.218.218])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NmK8o-0004VK-LT
	for linux-mtd@lists.infradead.org; Tue, 02 Mar 2010 04:55:35 +0000
Received: by bwz10 with SMTP id 10so2679057bwz.2
	for <linux-mtd@lists.infradead.org>;
	Mon, 01 Mar 2010 20:55:28 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1267188460.30247.10811.camel@macbook.infradead.org>
References: <ce9ab5790912020624k28bc1e63le0f7e713f70d78a8@mail.gmail.com>
	<ce9ab5790912062248i41e2f7bh996064518e043369@mail.gmail.com>
	<1260178153.25784.28.camel@localhost>
	<ce9ab5790912070306l1a973445vc4eab91b0e2d2ebb@mail.gmail.com>
	<1260185336.3047.0.camel@localhost>
	<ce9ab5790912170141s557342d5l4fced74a46a96e5c@mail.gmail.com>
	<ce9ab5791001060548g6075dcd5tb15bcd18c9a4b458@mail.gmail.com>
	<1263372005.2917.21.camel@localhost>
	<ce9ab5791001130125ka4bfa26s906758545e679792@mail.gmail.com>
	<1267188460.30247.10811.camel@macbook.infradead.org>
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Tue, 2 Mar 2010 10:25:08 +0530
Message-ID: <ce9ab5791003012055o63d0fd8ejdead7fe5a31ceae4@mail.gmail.com>
Subject: Re: [PATCH - V2] Add NAND lock/unlock routines
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Linux MTD <linux-mtd@lists.infradead.org>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Feb 26, 2010 at 6:17 PM, David Woodhouse <dwmw2@infradead.org> wrot=
e:
> On Wed, 2010-01-13 at 14:55 +0530, Vimal Singh wrote:
>>
>> >> @@ -2999,8 +3211,8 @@ int nand_scan_tail(struct mtd_info *mtd)
>> >> =A0 =A0 =A0 mtd->read_oob =3D nand_read_oob;
>> >> =A0 =A0 =A0 mtd->write_oob =3D nand_write_oob;
>> >> =A0 =A0 =A0 mtd->sync =3D nand_sync;
>> >> - =A0 =A0 mtd->lock =3D NULL;
>> >> - =A0 =A0 mtd->unlock =3D NULL;
>> >> + =A0 =A0 mtd->lock =3D nand_lock;
>> >> + =A0 =A0 mtd->unlock =3D nand_unlock;
>> >
>> > What makes you believe it is safe to assign these call-backs here?
>> >
>> > AFAICS, this means it will be done for all flashes. Do all of them
>> > support lock/unlock? I did not investigate this, but I think that
>> > probably not.
>>
>> OK. In that case I'll rather not do it here and do it in my specific
>> driver.
>
> Hm, I'm not sure that's the best approach. It's a function of the NAND
> chip, not the controller. We should detect the presence of the feature
> from the chip ID, if at all possible.
>
> I'm happy with your first two patches as part of a three-patch set
> though. Thanks.
>
Thanks David. I'll see the datasheet if chip ID has this information.

--=20
Regards,
Vimal Singh
