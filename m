Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3000AC5AC82
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Aug 2026 07:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=juVHT/Fh1YUyHCLCqq2i8RwS+Vpb43WPv0hq4CoBi+g=; b=zq1Cnfz3raSFraGu2Y5/aFSUT0
	gcQfqOZIylT+Gerb67Dq7ED5+I+1yfvATozeBVnwkrbjTVhsXb72/6dKDI5i86ciW/QD4DskR8gqc
	e/a9mP9NPFx1whlWYeuK2syTA6lEcuTO3d+jm4MQ/YnZQKcgTcc3oUbphfBILUj5HwYJG+3NyQjSI
	jGacG9QfGquuwmuv2lnVGPAhNl3yGFiIxUmbqTbLWGAEsEOoaPL2kJJYvWk3nx5h/MX8RPBduGVcU
	g2EE/7TYvlk3LBxxzJBca3tQXHs0xaXcz3WmEKcIwaDxoJXjwNl1CGozHfFVqCQSfqgoexlU/JU2L
	iXsn5E1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtKLT-0000000BC7d-3Qo2;
	Mon, 10 Aug 2026 07:22:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtKLS-0000000BC7D-0Bmd
	for linux-mtd@lists.infradead.org;
	Mon, 10 Aug 2026 07:22:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 7D94D600AB;
	Mon, 10 Aug 2026 07:22:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id AD01B1F000E9;
	Mon, 10 Aug 2026 07:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786346569;
	bh=Ts9j3PFRTHUDqD3+q/23WEOQQbhCSrKAJ60bv7W+pzQ=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=eW2+RFOSD+ksghpOO6Wp4y4lO1HrwPyr3wURzbdV8oyPOURUFBLcwPz7bzgtzLl2L
	 Gvg5bAyzzxOfqNkHPG7tnl7BmUZ8dV5UIp9xgbM74o5bvuiG5pmloDnX9lmA3saZSx
	 Wd37mhtwiKTUjmMGPAQYFIWlBAqM3FHYvl0Mm2iapeWiqgQi4hUvNa7MJ7QG7zfQ7S
	 243tuMMOF5OnlUknatJPyy+0wxw/EXPGvovWU9DTt0wuUuz1LAN8VdOfyy1KJo26+f
	 rDmTN+K2g2eIEdiO76iWrd37gvMj2mxxuBSJGEQs0M+9aCbgsIrz2UQYRe6xBEh3eh
	 zykjL6O+8CObw==
Mime-Version: 1.0
Date: Mon, 10 Aug 2026 09:22:45 +0200
Message-Id: <DKL30B77Z7QJ.IXPI630PUWTV@kernel.org>
Subject: Re: [PATCH 03/30] mtd: spi-nor: winbond: Stop filling the .name
 entry
Cc: "Pratyush Yadav" <pratyush@kernel.org>, "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Steam Lin" <STLin2@winbond.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
X-Mailer: aerc 0.20.0
References: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-0-87e5d3122244@bootlin.com> <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-3-87e5d3122244@bootlin.com> <DJRJJB4NEUEP.168MF88DBSFDF@kernel.org> <87mruzeg1p.fsf@bootlin.com>
In-Reply-To: <87mruzeg1p.fsf@bootlin.com>
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
Content-Type: multipart/mixed; boundary="===============7824944751159943307=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============7824944751159943307==
Content-Type: multipart/signed;
 boundary=0784765577beb3a889a54cebdddc9a0743cff40c3942e542a2b82e7923c6;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--0784765577beb3a889a54cebdddc9a0743cff40c3942e542a2b82e7923c6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Aug 6, 2026 at 11:47 AM CEST, Miquel Raynal wrote:
> Hello,
>
>>> Replace the names with a comment above the entry with the newly instate=
d
>>> naming scheme to indicate what chips are covered by each entry.
>>
>> This is exported via sysfs, so this could be a regression.
>
> Well, actually names are not exported through sysfs. Only the mtd name
> is available through sysfs, and it is set to `spiX.Y`. That name is only
> available through debugfs, which is not part of the stable API.
>
> I should have checked before dropping all my patches...

That's not correct, see

https://elixir.bootlin.com/linux/v7.1.7/source/drivers/mtd/spi-nor/sysfs.c#=
L21

-michael

--0784765577beb3a889a54cebdddc9a0743cff40c3942e542a2b82e7923c6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCanl8RRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jhOgF9H3WqxZwYmkCI2xW1paqsyB36z83UiJER
/USZT29+mvjcvnew3cSnknAeVGX6OkaDAX0ec83mVk9/RHJx9W84z7AF3fRllu34
NuXJcbI+R+hD9GkCSt11CXKLHH21udp46Nc=
=8MRV
-----END PGP SIGNATURE-----

--0784765577beb3a889a54cebdddc9a0743cff40c3942e542a2b82e7923c6--


--===============7824944751159943307==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7824944751159943307==--

