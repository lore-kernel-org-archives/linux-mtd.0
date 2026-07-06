Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB393C43458
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jul 2026 07:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:Cc:Subject:To:From:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+5xU23T2Wonl1GVWxHwOf7uPNiMKQWAtFDnu//4R6lg=; b=MpO1ClpQ66+CBwB4BPbx7KELuW
	Kyl6Vf4oI6hTcX7Fguk1S9EW/ogUchx96cRhueVVC28B5YlMoGZ1mtu8AbErmBbXdaxVjpCp+3nuX
	xkDMOrLbRjSRzGuqSPR664CxbbgqyToSrW/Br2aYDj3h0zehT4jvtibNM9zuMOUbXb57Gi6JY9g4r
	bxE9dYRe4lwAUjFNnA1SiVU+CXecPlFRpVkY0QHvCqF0JozW436igygNju6tYAy3aPVhBlMvkkjjb
	aaHezFZ75AWIU8AgIdflXmtUhKmJMmcgY3GN6rDTaGSilACYOLcBr4LM21tS1SSPNvEGrrf4+dXCA
	Nfwa2iMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgdpo-0000000Bk4Z-40d7;
	Mon, 06 Jul 2026 07:33:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgdpn-0000000Bk4H-2nya
	for linux-mtd@lists.infradead.org;
	Mon, 06 Jul 2026 07:33:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id 26547418C3;
	Mon,  6 Jul 2026 07:33:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 86F5A1F000E9;
	Mon,  6 Jul 2026 07:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783323223;
	bh=1ukOqhUIyhqwzYEErT0FIxxuwMebK40CW0OY3I/ZcfY=;
	h=Date:From:To:Subject:Cc:References:In-Reply-To;
	b=NCgOjEL2AaoP1dShSVmWQDDm23Jds8hNFrLSMge/9cpmsa+O2KZyhgV3bJj1moMDz
	 wT+s8tPFk//MOg2yBsRki+mX35QM3jOfWWkWLZnm7MOF6HEUTS5wsltO6nfDJfn1eI
	 /0gPF5Y3brfw39VqppdS/nj7ZYaGFkcLpoXE/Qu7uHsR6vpgR8hg3LJbM3hgj9wcBe
	 6xeHF8zNBm5TW6T7stZSQ2ZNTbLPz2oj4HClLr9ZjkXQcVCzgZkAM+KfL8H9bO2480
	 7+/0I/yCUl3eu79muIiiAj3dhDn+pHA95q6haQkq6q1c4XRFDPQ8mamc0ZjdVH3qmJ
	 udy7xHLtF8QFw==
Mime-Version: 1.0
Date: Mon, 06 Jul 2026 09:33:38 +0200
Message-Id: <DJRBBKVZJCK1.31E3LISI9XG5L@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, "Tudor Ambarus" <tudor.ambarus@linaro.org>
Subject: Re: [RFC PATCH 0/3] mtd: spi-nor: Rework flash parameter
 initialization
Cc: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20260601125438.3481722-1-mwalle@kernel.org>
 <178331904816.868671.4599503585231715805.b4-ty@bootlin.com>
In-Reply-To: <178331904816.868671.4599503585231715805.b4-ty@bootlin.com>
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
Content-Type: multipart/mixed; boundary="===============5671261663188350674=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============5671261663188350674==
Content-Type: multipart/signed;
 boundary=36999bf6262f04d5582998dd6acb24b4eca9920076ee79a221b98ace3f0a;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--36999bf6262f04d5582998dd6acb24b4eca9920076ee79a221b98ace3f0a
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Jul 6, 2026 at 8:24 AM CEST, Miquel Raynal wrote:
> On Mon, 01 Jun 2026 14:52:42 +0200, Michael Walle wrote:
>> Try to simplify the flash initialization and get rid of the legacy
>> handling. As default, all the flags of the in-kernel database are
>> taken and amended with the SFDP data.
>>=20
>> This might have the consequence that all the flashes now get a
>> RDSFPD opcode which might be an unknown opcode. But that was already
>> the case for any flashes which were unknown to the linux kernel. So
>> far, there was not a single complaint.
>>=20
>> [...]
>
> Applied to mtd/fixes, thanks!
>
> [1/3] mtd: spi-nor: spansion: s25fl256s0: remove SKIP_SFDP flag
>       (no commit info)
> [2/3] mtd: spi-nor: don't clear the SNOR_F_4B_OPCODES flag on failure
>       (no commit info)
> [3/3] mtd: spi-nor: rework flash parameter initialization
>       (no commit info)
>
> Patche(s) should be available on mtd/linux.git and will be
> part of the next PR (provided that no robot complains by then).

Did you see, that there was a v1 of this series? There wasn't many
changes for these three patches. Just what Tudor mentioned that the
unsupported RDSFDP opcode should be mentioned in the commit message,
too.

Apart from that, the series now includes fixes that Sashiko found,
that is, the rollback in case of a failed SFDP parsing is broken. I
can also rebase that on top of these three patches.

-michael

--36999bf6262f04d5582998dd6acb24b4eca9920076ee79a221b98ace3f0a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaktaUxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hjSQF/WHZ+eUDa7zpaqSEal9vD7Tc3gtkuz3/V
8bxySWZd+JSuc3Mi9DjnGIQzVrVUtUZCAX9TsmwU0BluqCa8RnhLB22NJWhZQqec
Tc2yxtsvdKAfiBEoCOK+I2z6gp5KeIwoiqM=
=+69i
-----END PGP SIGNATURE-----

--36999bf6262f04d5582998dd6acb24b4eca9920076ee79a221b98ace3f0a--


--===============5671261663188350674==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5671261663188350674==--

