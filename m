Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A56CC43458
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Jul 2026 08:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qFYHhf2kx/QofcregO1q/izYBv+SDctm3T3gekCbTh8=; b=jITJiiOltXmWAhOygpo31RSF/I
	J1LljIVR/1/4w43021ORX6E/DhStisKj5WKpptunJ5XAWpqD8aQTyKTBhVrgvm4US4Xbs5Oq15DhM
	Zz4G/8vLHPRz1bYJFzTgjKfXNo/DnOuGdmA40w7JHsWEqU3tRp8w9aBe/UShqxw7XYv4o6WvEleAS
	EWIjbxa39yai0YTeEzBYZyqzeyEWlMGgd6v4UsPG/XY1JZkQ1isc80+puM5IbJAp6s0aW6BjxXdvP
	7/3ReRAoQK21MCqAqOP5euEBUcfL0YyqxS4IQ2QN2OaXp7l71xll5FwiFpwBYTimuu+wx+V4jsTCt
	nVId7d8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weq3b-0000000100T-3n8e;
	Wed, 01 Jul 2026 08:12:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weq3a-00000001000-0tzx
	for linux-mtd@lists.infradead.org;
	Wed, 01 Jul 2026 08:12:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id A680E601D7;
	Wed,  1 Jul 2026 08:12:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id D70B11F000E9;
	Wed,  1 Jul 2026 08:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782893549;
	bh=gHxc/Q4UrjTqx7aoWFRjf3eI8VSOV0mM+Oq/+8eC0BU=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=jDpZoKjWdmaPa98A1Wqe3i87VTbgvdTaILYr3LF9pru5MEQmmVtIPduMRS4YDTRRr
	 rI8WUH687tzZtSwt8IPRcpEqcVpxYhP/97dui3UuwJgP3YQJ6nKkPIYR1oOSvRlhhn
	 h64j3yQBBgYh7yc7y+3jAsyGFHIMXhWYMMD30yM5NNnW/+lpLxYsObPwm25RyjZMTJ
	 SKnLk/yZ6/gKJR/R3hcyaaoGljPaEvOJRgkY9PGNgj2u2oEXldh21CBEMrVeU4ZjPh
	 gHu1o9sQq+bb8s4oXYaHz5N2dga/2cs6WBUP+RfZwlSbuaMT4T6UlesK5cyAU7SQx1
	 MXPx7JeQLbduw==
Mime-Version: 1.0
Date: Wed, 01 Jul 2026 10:12:25 +0200
Message-Id: <DJN30JTAW4NY.28G7HNY6QS299@kernel.org>
Subject: Re: [PATCH v2 1/3] Revert "mtd: spi-nor: remove Fujitsu MB85RS1MT
 support"
Cc: <Aryan.Srivastava@alliedtelesis.co.nz>,
 <Chris.Packham@alliedtelesis.co.nz>, <Ronan.Dalton@alliedtelesis.co.nz>,
 <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <miquel.raynal@bootlin.com>, <pratyush@kernel.org>, <richard@nod.at>,
 <vigneshr@ti.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "Ronan Dalton" <ronan.dalton@alliedtelesis.co.nz>,
 <takahiro.kuwano@infineon.com>
X-Mailer: aerc 0.20.0
References: <2b8390c0aaae4203af318f9a5edbb0eb@infineon.com>
 <20260701020856.217664-1-ronan.dalton@alliedtelesis.co.nz>
In-Reply-To: <20260701020856.217664-1-ronan.dalton@alliedtelesis.co.nz>
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
Content-Type: multipart/mixed; boundary="===============5583728076944829794=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============5583728076944829794==
Content-Type: multipart/signed;
 boundary=1120bef0ddc8abd44d357446034fe7dcac59b77e2b6d3535f8b9f4ee624d;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--1120bef0ddc8abd44d357446034fe7dcac59b77e2b6d3535f8b9f4ee624d
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Jul 1, 2026 at 4:08 AM CEST, Ronan Dalton wrote:
> Hi Takahiro,
>
>> We don't add any FRAM chips in SPI-NOR...
>
> The SPI-NOR subsystem has support for the cy15x104q chips, which are
> FRAM chips. There is also support for Everspin MRAM chips, which are
> comparible to FRAM (and are also of small size).

Yeah, these are mostly old parts, (except for the newer cypress thing, whic=
h
was a mistake to add). But there is little we can do, but to
eventually remove them in the future when it's likely no boards are
using them anymore. Thus, we don't want to add newer parts to this
list and make it even harder for us to get rid of these.

> Because of this, we thought there was precident to add support for this
> chip. I was under the impression that the opcodes used to interact with
> the chip had a greater significance than the underlying technology used,
> and this chip fits in with the other spi-nor chips based on that. Feel
> free to correct me if I'm wrong here.

I'd argue, if they really wanted to emulate a flash device, they
would have added an (emulated) erase opcode. Without it, it behaves
like an EEPROM which has byte granularity access.

-michael

>> > The use is for a small amount of additional storage separate to the ma=
in
>> > system NAND flash for some small "critical" files that we don't want t=
o
>> > lose. We've been using devices like the mchp23lcv1024 and mr25h40 on
>> > other products for some time.
>> >=20
>> For that use, how about using tmpfs with NVMEM backup?
>
> Could you elaborate on this? I'm familiar with tmpfs but not with using
> NVMEM as a backup for it. Is there some method of syncing a tmpfs to
> NVMEM that the kernel provides?
>
> Thanks,
> Ronan.


--1120bef0ddc8abd44d357446034fe7dcac59b77e2b6d3535f8b9f4ee624d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCakTL6hIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/iR4AGA/PtPpUX3Nayj5rvpUN/8azknrkxVwwkK
cZBQH+XGrehbHIn+phERLv77o8ENPMGeAYDesoEFxeV8mCuZ0iTppXi7d1FQRnwU
c3e3uGLdHMHL5xsH4CNzuZWDbNrrX85/TuU=
=q2bM
-----END PGP SIGNATURE-----

--1120bef0ddc8abd44d357446034fe7dcac59b77e2b6d3535f8b9f4ee624d--


--===============5583728076944829794==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5583728076944829794==--

