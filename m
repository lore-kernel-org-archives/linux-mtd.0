Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EEE6C3DA61
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jul 2024 08:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3KUUHB278Z/atPYo2OttT00vmxw96BbnRB6z5koEexg=; b=kFHXa6KHOnlkHtaLrGytZBJ2Eh
	lMaByMY1PMkAl6oUQxJUeI1sG88BMj7q5qohWn6hK1rzdgUX6Y1f3CBcgvaYhWiM13qC8m+YuUwct
	flu8O7GFHRwjZP9uT2qg401UdY1qoV9JR3xj0iQMQGEfQgywNfWIbvhp5EL4JaqFtdK8ba4KavDAt
	LRbvfNnCAWa1vVcsmKSVbi2x5ob0bzKOduEOTNo+j6EJ587YL5wepxjO5aswXazKWc0ESZPl+h7TO
	FAmHW+SoiguQdOZ8ifhPQ6ytr5O9bJK1ZIr7AONeCJFbBeAT5kRSdcqHAtzjKixWjNEL4FvqA9JZh
	7fIT8YrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYhmF-0000000E8wK-36O3;
	Tue, 30 Jul 2024 08:00:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYhmC-0000000E8vB-2HaC
	for linux-mtd@lists.infradead.org;
	Tue, 30 Jul 2024 08:00:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0CCCC61DBC;
	Tue, 30 Jul 2024 08:00:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38DF5C4AF09;
	Tue, 30 Jul 2024 08:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722326407;
	bh=CniaYDnRATpHlUBQAU6fUV84X3DZPceXVpYV08y62g4=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=C708Uhm5+PEhyeLz+K6SvIsqQUqE+wrv8CE1GSljfy3RE8XNoWeC+F5vv6Drkw2cp
	 zsFSTYkSidoHQ/II+QsNZk3RGiwZtAQWHcSm7m6qtof/fdptSs8IcSZugln+aghpFq
	 S/7kXZFFKHelPcTjyuW755H5MRdFb/zptFpGFTgEbvnVmfPFCY12Do9hnwGYJHXe+F
	 8ZO4Pq4Fx2ZvTtQcsz+d9a4gLGYFDxqHz5THXGc/y95Gqvtc3oTVCN+pvlqiw051D0
	 0I7Q8/bdGnm3XwIPdKAj49yncZ/u4tI9gmdGzEFrTS7DFzVZzaunIcmu61dJee4lVt
	 VRAv3v744arSQ==
Date: Tue, 30 Jul 2024 10:00:03 +0200
Message-Id: <D32PR6R1LENM.3RUPQVJ1HRWG7@kernel.org>
Subject: Re: Subject: [PATCH] mtd: spi-nor: add support for MRAM Everspin
 EM008LXB
Cc: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: <claus.fabig@emerson.com>, <tudor.ambarus@linaro.org>,
 <pratyush@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>
X-Mailer: aerc 0.16.0
References: <5bb5d445-e54c-48c3-b7f7-c07886af629e@usgdcecpmsgap03.emrsn.org>
In-Reply-To: <5bb5d445-e54c-48c3-b7f7-c07886af629e@usgdcecpmsgap03.emrsn.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_010008_692848_FFF2802D 
X-CRM114-Status: GOOD (  34.69  )
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0961377897086134437=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============0961377897086134437==
Content-Type: multipart/signed;
 boundary=95cb2f6b2372b8c8d1366bfc28389e4f6d080c4216470e4cd6558fd47f48;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--95cb2f6b2372b8c8d1366bfc28389e4f6d080c4216470e4cd6558fd47f48
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Fri Jul 26, 2024 at 2:04 PM CEST, claus.fabig wrote:
> > Hi,
> Hi Michael, thanks for your response resp. advices and apologies for the =
late response.
> >=20
> > There is something odd with your mail client, maybe have a look at
> > git send-email.
> Unfortunately I am only able to send/receive email from my windows machin=
e and=20
> therefore have some challenges within our company infrastructure.
> I still try to find the best way to get the formatting correct.

In that case you can also have a look at:
https://b4.docs.kernel.org/en/latest/contributor/send.html

> > Also we usually push back on the MRAM devices and refer the users to
> > the at25 driver. But as this doesn't use the NO_ERASE flag.. I'll
> > let Tudor and Pratyush decide.
> I am aware that using at25 driver works but have the task to integrate th=
at in mtd
> since another used MRAM Everspin flash MR25H10 on our board is also acces=
sed=20
> in that way and already part of the mainline. That will lead to confusion=
 on user side.

I suggest that you'll look into evaluating and converting your
existing boards to nvmem (which is the interface at25 exposes)
instead.

The MTD maintainers agreed that new fram/mram won't likely be added
anymore. As I said, this patch might be an exception, because you
are actually emulating a flash device (because you *don't* have the
NO_ERASE flag). Otherwise, the m/fram are more like an EEPROM and
thus should use the at25 driver.

> > > From: Claus Fabig <claus.fabig@emerson.com>
> > > Date: Thu, 18 Jul 2024 09:53:36 +0200
> > > Subject: [PATCH] mtd: spi-nor: add support for MRAM Everspin EM008LXB
> > >
> > > The Everspin EM008LXB MRAM has 8Mb and is populated on a custom
> > board
> > > using Microchip's PCI12000 spi host controller running on low 30MHz c=
lock.
> > > According to Everspin Read Fast (0xb) command below 60MHz is neither
> > > specified and nor tested. Test shows that using Read Fast (0xb) will
> > > result in reading inconsistent data in this setup but writing is fine=
, so
> > > only supporting Read (0x3) command should be acceptable for the momen=
t.
> >=20
> > This is really odd. Is there an explanation for that? Usually, fast
> > read will just add dummy cycles in between. Also the datasheet just
> > mentions a "maximum frequency" which actually makes sense. Do the
> > dummy cycles for our fast read operation match the number of dummy
> > cycles in your device?
> >=20
> Yes, at first I configured the chip with 8 dummy cycles to match with pla=
tform
> dummy cycles with the result of reading inconsistent data.=20
> The answer from Everspin product engineering was:
> "Read fast has only been tested down to 66 Mhz. If you are only running a=
t 30 Mhz,=20
> you should be using the Read command instead. Read Fast is designed for H=
igher=20
> speed operation". Unfortunately no more explanation.

I guess you cannot use it with at least 66MHz?

> > > The device is JEDEC compatible (JESD251 and JESD251-1) but not able t=
o
> > > provide SFDP information.
> >=20
> > There is no SFDP data for this chip is it? But it has a READ_ID
> > command.
> For my understanding reading SFDP works with command 0x5A which is not=20
> supported, reading ID is command 0x9F and supported. I don't understand y=
our point.
> Maybe you could give me a hint to better understand.

Please see my comments on the code in my first reply. You basically
don't probe the driver by the name, but by it's ID.

-michael

--95cb2f6b2372b8c8d1366bfc28389e4f6d080c4216470e4cd6558fd47f48
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZqidgxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jHRQF+O2Tp2yymNM81QCMqmznfxfBIfi6OjCWD
PXij072XPxSy0DLrC+I1IkoxaV4DXCemAYD4Bp6go3cilHA545XnLXyR0lfuaAIb
F2NuZbR818FQ8NdTvGVsKNSGifUHyahLzoU=
=3Ucz
-----END PGP SIGNATURE-----

--95cb2f6b2372b8c8d1366bfc28389e4f6d080c4216470e4cd6558fd47f48--


--===============0961377897086134437==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0961377897086134437==--

