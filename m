Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A24DC54E60
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Mar 2024 09:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:From:Cc:Subject:To:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DeRKpGFAnQsOaRuhd4dn8phCrrVO2P//w9SnPgLNp8w=; b=NI0upig7yx5nMuDXAnj2aPjvlp
	DvONCXHJUUi+cu27elBnyk45CmTIc28nBs89CP8dx1ZsZmEFlOgtEGMg7R1m+h8AxTDhpf9YxrgRY
	fzM2sVbLLZUiUFVQHEPvVIkowwjb0odW3fX8u1zypdnaCgBls8t8akrR9aHpQet9vJhkAiwzwNeAh
	aZs672rhfd74hNN5ypc0qR4H0WawdwPzBWeOObwexnJveswrI4OwTU2y/i0oE+o9FHdECVVvl1GPD
	wverhgTzbCNt4NkICVIp56MKFi+TPH5ecsFlkQKHy9WwFSe7ZGuiCrNLlRfGxHA6DZ3IHaE0n0MaY
	/fIc0G5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkKqZ-00000009UcD-1Cjk;
	Wed, 13 Mar 2024 09:24:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkKqW-00000009Ub9-3kVi
	for linux-mtd@lists.infradead.org;
	Wed, 13 Mar 2024 09:24:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 71F6061405;
	Wed, 13 Mar 2024 09:24:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7E18C43390;
	Wed, 13 Mar 2024 09:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710321862;
	bh=cEc1lGHAzmhktzZB3LfkyJVWkCDMr1m6qmRcF67PJgE=;
	h=Date:To:Subject:Cc:From:References:In-Reply-To:From;
	b=u3QdwIqSRNu5/om0tD9SwyuK8cIYuVYHvLvUNW53DAa0NROSmvucitQ0yLnmqIenD
	 qm103QJ3GGn182nkchaA8rvdEZN7PyRVUATcM+NkKbQt/9eNOLqLcOmgwu9Mi6anUG
	 QIz+5CYzNn6l9I9aFozmhbzkn1zzRDJlnFK0Nvulx306itgLhsiyeSXgNGwI99p9sU
	 sSwW72KfNh3CZyyRgJX0HqpWHIwHVGO/bm9wDU1tjLY9a3/Hf7MemvYdMETTve3Kra
	 x9xYQvQhbZKfb8Ei2CshzKn6BRU9Bz01hcCnnhFw340Dyjizo0+4I731zwV7fyDOwZ
	 2Arl373zckpQQ==
Date: Wed, 13 Mar 2024 10:24:13 +0100
Message-Id: <CZSIHWU6IYXB.2DUCUUYFTAB2X@kernel.org>
To: "Aapo Vienamo" <aapo.vienamo@linux.intel.com>
Subject: Re: [PATCH 2/2] mtd: core: Don't fail mtd_device_parse_register()
 if OTP is unsupported
Cc: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger"
 <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Mika
 Westerberg" <mika.westerberg@linux.intel.com>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.16.0
References: <20240307130418.3131898-1-aapo.vienamo@linux.intel.com>
 <20240307130418.3131898-3-aapo.vienamo@linux.intel.com>
 <CZQZXAB2GOCY.12YVJ6CRGG26B@kernel.org>
 <xeqscncwirfaz77mtpcvkueo5xto7vis5khr3uwclcx4sfx6eb@35j3grcqrzo2>
In-Reply-To: <xeqscncwirfaz77mtpcvkueo5xto7vis5khr3uwclcx4sfx6eb@35j3grcqrzo2>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_022425_051265_F0002400 
X-CRM114-Status: GOOD (  33.41  )
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
Content-Type: multipart/mixed; boundary="===============2623757657908539603=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============2623757657908539603==
Content-Type: multipart/signed;
 boundary=8d4e32d90b12bddb067516627e24c977e5b2bdef96f77024fb6ad523e783;
 micalg=pgp-sha256; protocol="application/pgp-signature"

--8d4e32d90b12bddb067516627e24c977e5b2bdef96f77024fb6ad523e783
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Mon Mar 11, 2024 at 5:20 PM CET, Aapo Vienamo wrote:
> On Mon, Mar 11, 2024 at 03:38:17PM +0100, Michael Walle wrote:
> > On Thu Mar 7, 2024 at 2:04 PM CET, Aapo Vienamo wrote:
> > > Handle the case where -EOPNOTSUPP is returned from OTP driver.
> > > +	/*
> > > +	 * Don't abort MTD init if OTP functionality is unsupported. The
> > > +	 * cleanup of the OTP init is contained within mtd_otp_nvmem_add().
> > > +	 * Omitting goto out here is safe since the cleanup code there
> > > +	 * should be no-ops.
> > > +	 */
> >=20
> > Only if that's true for both the factory and user OTP area.
>
> I'm not sure I follow. I'm not seeing a path in mtd_otp_nvmem_add()
> that would result in either mtd->otp_user_nvmem or mtd->otp_factor_nvmem
> needing to be cleaned up by the caller, if an error is returned, if
> that's what you are referring to.

Yes you're right, sorry for the noise.
>
> > Also, you'll print an error message for EOPNOTSUPP, although that is
> > not really an error. Is that intended?=20
>
> Well, when we hit this, the functionality of the SPI memory itself is
> degraded in the sense that the OTP functionality is not available. What
> would you suggest?

But it's not really an error, I mean, we are ignoring that one on
purpose now :) I'd just guard it with "if (ret !=3D -EOPNOTSUPP)".

> >=20
> > >  	ret =3D mtd_otp_nvmem_add(mtd);
> > > -	if (ret)
> > > +	if (ret && ret !=3D -EOPNOTSUPP)
> >=20
> > Maybe there is a better way to handle this, like controller
> > capabilities instead of putting these EOPNOTSUPP checks
> > everywhere? I'm not sure.
>
> Trying to come up with clear semantics for a capabilities flag to solve
> this is difficult. The issue is that on the SPI controller side, the
> limitation stems from the really strict set of opcodes that are allowed.
> For example, we already hit an error with the 0x35 (read configuration
> register) not being on the set of allowed opcodes. While this
> instruction is used by the OTP code, it's not a strictly OTP specific
> operation.

I see. It's just that due to this (very) restricted SPI contoller
all this EOPNOTSUPP handling is creeping into more an more places in
spi-nor core and now mtdcore :)

Anyway, I don't have any better idea right now. So I think this is
fine.

-michael


> If there was a flag that would signal OTP support, I think it would have
> be defined as "the controller supports all operations that are
> performed by the OTP code", which sounds brittle. The other way around
> would be to have a really fine-grained set of flags that the MTD core
> would check, but that feels tedious and error prone as well.


--8d4e32d90b12bddb067516627e24c977e5b2bdef96f77024fb6ad523e783
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIgEABYIADAWIQQCnWSOYTtih6UXaxvNyh2jtWxG+wUCZfFwvRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQzcodo7VsRvtCSAD/YJkNHNj/CVCUeVVMRLzNJTsb131beCFk
kGoenLQ4aE8BAJpLL0syl9RnrQOhboV6hPopHwley8DRc9x7jlNUn0ED
=5+gS
-----END PGP SIGNATURE-----

--8d4e32d90b12bddb067516627e24c977e5b2bdef96f77024fb6ad523e783--


--===============2623757657908539603==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2623757657908539603==--

