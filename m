Received: from bear.ext.ti.com ([192.94.94.41])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IFODS-0005JY-Hg
	for linux-mtd@lists.infradead.org; Mon, 30 Jul 2007 01:54:52 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: Testing of CPRM on SD Card
Date: Mon, 30 Jul 2007 11:20:58 +0530
Message-ID: <0A50DBE80DD6674E94F7269DC964A7B6440EDA@dbde01.ent.ti.com>
In-Reply-To: <e1d5030b0707280108v236cc522m454c58e1044f1996@mail.gmail.com>
From: "Sriram, Kannan" <ksriram@ti.com>
To: "Midhun A" <midhunagni@gmail.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.arm.linux.org.uk>, <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Midhun,

 There is no open-source implementation of CPRM (SD-Audio/ SD-Bind
standards). So first of all, you need to license keys from 4C (device
keys, media keys etc) and do your own implementation.

 The keys that you can download from 4C site are for test purposes only,
and you can't use them to test on a real COTS SD-card. If you really
want to try those dummy keys on an SD-card, I suggest you purchase a few
"development/ test only" SD-cards from popular SD-Card manufacturers
that have been specifically encrypted using those 4C dummy keys.

Regards,
Sriram.

> -----Original Message-----
> From: linux-arm-kernel-bounces@lists.arm.linux.org.uk
[mailto:linux-arm-
> kernel-bounces@lists.arm.linux.org.uk] On Behalf Of Midhun A
> Sent: Saturday, July 28, 2007 5:08 PM
> To: linux-kernel@vger.kernel.org;
linux-arm-kernel@lists.arm.linux.org.uk;
> linux-mtd@lists.infradead.org
> Subject: Testing of CPRM on SD Card
>=20
> Hi All,
>=20
>     Our product development requires that we use the CPRM security
> feature of SD card for protecting our material. I have been searching
> the web for a SD host controller / Software which is CPRM capable, so
> that we can write/read an encrypted SD card with the testing keys
> provided by the 4C Entity) and test our prototype. But I could find
> none. There are IP cores but no manufactured chips.
>=20
>    Has anybody of you done similar stuff ? How do I go about testing
> the CPRM feature of the SD card on our prototype ?
>=20
> Thanks,
> Midhun.
>=20
> -------------------------------------------------------------------
> List admin: http://lists.arm.linux.org.uk/mailman/listinfo/linux-arm-
> kernel
> FAQ:        http://www.arm.linux.org.uk/mailinglists/faq.php
> Etiquette:  http://www.arm.linux.org.uk/mailinglists/etiquette.php
