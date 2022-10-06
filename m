Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD392C433FE
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Oct 2022 20:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bRfNlATyIzcraoikYvuimZjB9yYmk5IUMrsKqezvZ/w=; b=MaxaCTcxYIoTBbaL3Bv4qbpeI4
	iWzeB4pcmgTu/FHA3OCeyE3Z1Lvl9PVeS9fQ4tNNfwKJk3W+3a2IV6Cb1chQMPV5AnwK8A5VML+1p
	QuqyH4dzKgftAIwNzVZV9cZ+79WUoMBfYyNp6uSxDxDIyRbT8ypunXOGcbH9j5CfUDvETHaGyCmzJ
	qSjqD0s9SGy2CxfAuYAv0QY4KwMXezdVwK94uJ8pI8/WsF4SuVG66pW1Eu+AFrU5rc7SH/zueNf0Q
	6ALNQHh6YZn6XyamfHCYXffwndxjCRsgurpOK3B6OnrKsgsX3i99eCzltW1Dq0XH+2McX/jKjjHzq
	Nn1Hc/sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogXSX-0052z7-T3; Thu, 06 Oct 2022 20:27:09 +0000
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogXST-0052vR-Uq
	for linux-mtd@lists.infradead.org; Thu, 06 Oct 2022 20:27:08 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 339CF5C00C8;
	Thu,  6 Oct 2022 16:26:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Thu, 06 Oct 2022 16:26:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1665088019; x=1665174419; bh=2Vt43tPiKB
	fkhja3fpNj7tuMYpusFW0Gr3lyy/nnqpE=; b=isN/OcZ30egd/brU/i9wevQDZE
	NFortLRxoILVYQucVp2l30Iu5/6e9cuJf+/C1bF8xtUafAzZTJHOwhdJ1BcQaT32
	tXe3uXSXK5ztiad9OG4dVwvcPguOHRgA3e/NHqhxLmqO47OeW7pXVWlXKLHWFKqD
	3YHVqorYpnmVYPz7hS0cyeJ6VhQjKg6xT2ql3FhVKDXuYhN0TsQNHsdzgXDKBnkE
	Ue5dy+JZplVhgaWDiF+t29ZqAdaXu9JXRtjMIEWUMIiZB5qqRvqKgL9nCULrTaCM
	yuIYxUkMUfqfqnAkNrgwRz9WM/kTYTYy33JbMj7Z513jxgyttWulIdfNsYKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1665088019; x=1665174419; bh=2Vt43tPiKBfkhja3fpNj7tuMYpus
	FW0Gr3lyy/nnqpE=; b=UeNEiJMc8szVAqSurCfeC9sTM37agieoILOYR4BBEwfI
	iKO0MXTgi2PTWVVk9gJTibVOq5U19AVcFW/4L7fqBBCb0jw1OZ424GpZ7ACi0oF/
	9eAW0Sl/oicqhgp57de1OfjSfOnunVY+MBu7yIkLCSi0rebq0Sx/i7L4XjlwndCa
	2GgPR8ULfc820z04T7RGsCQJuj/B9YyDTz/dnMS/L4U20xTdvwlqVmdxgb3RvCn2
	AvxcBuDLhFeybCf2twM5X6thNrc+JQe3qz/QS0Xu/Lb/GSb9/LBw5XlLArxun9If
	8f3WRxImyYXRw4LXfbTEzMiEx2Snei67YV8I08ZByA==
X-ME-Sender: <xms:Ejo_YzV2K8Iq3ulira5uw_Dn0pbWhhR5Ie6MLdPQpQJ5hAwj_W9Icw>
    <xme:Ejo_Y7kOh-9ofkwx0V67A6WCYWSYsI7qiUDwVDelhurI2fAX88R6f78t-52Y_O_hE
    ydiB1G3mGF7_8gPSlQ>
X-ME-Received: <xmr:Ejo_Y_bSp0sP07Bz6rxidPcphMOHqD_pwjHE7Psit7KiwNXd-sFsXqUcJO8qLm46W0YrlAVStdZNL5ICXe8mbaqWsksiFYVk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeihedgudeglecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enfghrlhcuvffnffculddvfedmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreer
    tddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkh
    esshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepjefgtdelledvfedtgeegffef
    ueefveegjeekleegueejveevueefiefgiedvjeejnecuffhomhgrihhnpehkvghrnhgvlh
    drohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:Ejo_Y-VCqRH_XbtXF0nac3-HjasYWzqftYdB5aIZCrPFA959_10yCA>
    <xmx:Ejo_Y9n9ihQ7zKZCFBkoK0cq4HjNzKzuIuBDeqcHSixMwmrfOA6Ekw>
    <xmx:Ejo_Y7enMVJ4Ak8R7YGz253_W9IoaWhuGxeiUWXDKNO4vRy-NhhCPQ>
    <xmx:Ezo_Y2e4AESa5trSxo_rWMGQTwVMcGfayHiSp2tCTTnRIbCQCP1tng>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Oct 2022 16:26:57 -0400 (EDT)
Date: Thu, 6 Oct 2022 15:26:56 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Michael Walle <michael@walle.cc>, Potin Lai <potin.lai@quantatw.com>
Cc: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	~sircmpwn/email-test-drive@lists.sr.ht, garnermic@fb.com,
	Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: winbond: add support for w25q01jv-im
Message-ID: <Yz86ECK3pRyJjAo5@heinlein>
References: <20221006070841.2106194-1-Delphine_CC_Chiu@Wiwynn.com>
 <0dde4fa6ddeefa23314dbdcd1dd1b28b@walle.cc>
MIME-Version: 1.0
In-Reply-To: <0dde4fa6ddeefa23314dbdcd1dd1b28b@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_132706_633976_5C9DEEC2 
X-CRM114-Status: GOOD (  19.01  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5335539940033378200=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============5335539940033378200==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="L+AQa5HFPPMOr8/v"
Content-Disposition: inline


--L+AQa5HFPPMOr8/v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 06, 2022 at 01:52:33PM +0200, Michael Walle wrote:
> Hi,
>=20
> Am 2022-10-06 09:08, schrieb Delphine CC Chiu:
> > Add support for winbond w25q01jv-im chip.
> >=20
> > Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> > ---
> >  drivers/mtd/spi-nor/winbond.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >=20
> > diff --git a/drivers/mtd/spi-nor/winbond.c=20
> > b/drivers/mtd/spi-nor/winbond.c
> > index ffaa24055259..2b02b05ceb0a 100644
> > --- a/drivers/mtd/spi-nor/winbond.c
> > +++ b/drivers/mtd/spi-nor/winbond.c
> > @@ -139,6 +139,9 @@ static const struct flash_info winbond_nor_parts[]=
=20
> > =3D {
> >  	{ "w25q512jvq", INFO(0xef4020, 0, 64 * 1024, 1024)
> >  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
> >  			      SPI_NOR_QUAD_READ) },
> > +	{ "w25q01jv-im", INFO(0xef7021, 0, 64 * 1024, 2048)
>=20
> The name should be w25q01jvm.
>=20
> > +		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
> > +			      SPI_NOR_QUAD_READ) },
>=20
> That flash should support SFDP, so please try the following:
> +	{ "w25q01jvm", INFO(0xef7021, 0, 0, 0) PARSE_SFDP },
>=20
> Also, we require an SFDP dump for new flash submissions, see [1].
>=20
> -michael
>=20
> [1]=20
> https://lore.kernel.org/linux-mtd/4304e19f3399a0a6e856119d01ccabe0@walle.=
cc/

It looks like this was already attempted to be added:

https://lore.kernel.org/all/20220222085148.21594-1-potin.lai@quantatw.com/

Potin, do you have an update?

--=20
Patrick Williams

--L+AQa5HFPPMOr8/v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmM/Og4ACgkQqwNHzC0A
wRnafA/+NMv98UWc9p5+yhEAkMiT7KoYEODS+j/IJFnkAO/mhqQXRKpOi+lu9y/m
qVWP0wKzFxlTlCuDpx3GqRgR8u2q5XrWw8FODEd1GjjCm31GQO+6Dk5/GB39rpWW
KKfGBoXTl613No3K0oB93ZlA9mPL16ZRli7pulrCugND62VfAqqhRBfuPkRG6zhj
o92osIFJg8uTa7uUs0SfqRoW/YGDfhj4zLzPabrnWEiYeJ6InVl0KCWzIHrYSgYa
3cK0n+zLRkZ445OW50LsCuoqTQ4VbmKP5sKHvBETZLiSuWGA8cZt9GeZXZXN67Jb
7TjRPvzY51l4I7VAWDFIvo+TifETbZ9TGcoxvYqdX3hLqcxJuPHoFiwJq556jYWp
GJiROykvfOC/Vny/vhkPv/CcAFtbBOFYO3T3zgMWjlhVcjl5AHEKHJZJtB44qy2V
vR4e+kK/RM3ONrEKE/sOpAVgj7gReBWIHoW6GIRXU0TdljsRzJOFeVb45bTgAM4T
ap4lqiJQ6VZwtJ/XrgjvRojKOv/NBvqSH7bgBr5hxfaL3mZrN7/cvKswrSNFPjsG
EJK6rg9mu7UgbpiuN6n12/LhXQq4Iash1uZHX8nngvXRgQmJOiMX8FcIRxmPcn6I
aOMClErigDGCILguFGDWqCb7yfT5hlf7k5TwF6CvFgX4OgMR6cE=
=OlUA
-----END PGP SIGNATURE-----

--L+AQa5HFPPMOr8/v--


--===============5335539940033378200==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5335539940033378200==--

