Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0678CC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Apr 2022 09:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q66xm9LeWyriSsB80MKCRuGLrLozpZ0sQLJE/8EtjUw=; b=WTQayhGFnLuWno4bbm67dkCvPA
	KQNS++nnR/IiX01bO04uybIJ7tceHtOxIRz1oPUJIbeWVAZIKLeCAB99JaB0xeK8viXXHUFdnzeWD
	ylYn7Wl28FeVQ5Vnk0wZ65pb+bujN37O110LFe8nO8SVAygHV5Wnvy+MEQ/KLFsATHa4tv9qCgUsU
	NuHhgU+1veLU2BvCY6Xhesjl8BmyoAtT29nVCEUGvKpXawN1Zy+Jxsj6XHlp6EnCRsJGnA10MP6La
	8rVqNrAZCI8lQB2202Nmwzfyfas1gDhDDBXxSBliD1F4FBK7ctEsH/C3nfh5HrUoNY5FXXpFENVvm
	cbnYxuDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neD9h-00D2qN-Ks; Tue, 12 Apr 2022 09:49:49 +0000
Received: from www.zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neD93-00D2Wf-VV
 for linux-mtd@lists.infradead.org; Tue, 12 Apr 2022 09:49:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=k1; bh=Fj8VO6yUX/TG+ZwJZmOwkh7zNQnO
 gn90D0zMWyzIvnU=; b=lKHbOYSHXrHXzoAU0xuLD4BzV2ze1u63QPuRIEgJhIFL
 X9sTyU4Jv8qE7LzoB5wW7DmVxTNj/YMhzpZPyjjxhmEvSH8SsSa1hEFGO0hui6E4
 muRRWsVrk2hjNF6YzGn6AJdgDFATY/OvX2Y6/FXb1q4LJNtUyVS9zpT0lJBDmjU=
Received: (qmail 987440 invoked from network); 12 Apr 2022 11:49:07 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 12 Apr 2022 11:49:07 +0200
X-UD-Smtp-Session: l3s3148p1@WEzI+HHcDucgAQnoAGZ4AFi7qjeMIP6q
Date: Tue, 12 Apr 2022 11:49:06 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 Duc Nguyen <duc.nguyen.ub@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Andrew Gabbasov <andrew_gabbasov@mentor.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] memory: renesas-rpc-if: Simplify single/double data
 register access
Message-ID: <YlVLEnRaARVmWZnZ@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sergey Shtylyov <s.shtylyov@omp.ru>,
 Duc Nguyen <duc.nguyen.ub@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Andrew Gabbasov <andrew_gabbasov@mentor.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <19358863deae03b1b26f473e878305a1c6e40d19.1649681638.git.geert+renesas@glider.be>
 <YlVJc3z1xXT2emIc@ninjato>
 <CAMuHMdUGkba3hiRJPEw26oBdc6_MK_eBO==Z9QeinaoeZv8Qbw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUGkba3hiRJPEw26oBdc6_MK_eBO==Z9QeinaoeZv8Qbw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_024910_390559_F6BE0526 
X-CRM114-Status: UNSURE (   8.82  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============4410742077021999967=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============4410742077021999967==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="S735XdVRzV/i3nen"
Content-Disposition: inline


--S735XdVRzV/i3nen
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > +                     regmap_write(rpc->regmap, RPCIF_SMWDR0, *p++);
> >
> > Last '++' can be omitted?
>=20
> I know. But I think it looks nicer this way ;-)

I have to admit it looks a little like "I copy&pasted without thinking"
to me :)


--S735XdVRzV/i3nen
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJVSxIACgkQFA3kzBSg
KbYQCw//Tg4IDheuIWgzV7n9xNtp7Dk17Iz4LggQVlK/eKuuSJbsCwoapbtTVzGi
tM+BG5tigk87t1bjkhUzbjK9vxclhEcLmi80UquzPswl4frW4nM/1SBFCuIlXmV9
YqZnJlyM2e7RXjiftKfvmZO85x2eyvjv4nqEtj8b4tzog6HaPACQdQJYuxMxBz+Q
635MoH0kP20jKL/7u+2lyAq97IkuR0sSXngakNiAB92T2WGJUTUcmBJaVGV7qQNG
Zh0FH96JrX2RIq1Yl+s6Tfipsfgivw+l2gsgxQOKwuvcTyUZcuvWkZtL1A1tf0d4
crws5bMBIxXJV1oKU/gU/azoy3xoGDOoz2TFn9dulprQSogW+/5sx2mA/usdU2j/
IpbjZ4wiS6piDlXzplqXQDZjfVMSfnncfGjqmWRAmBVV0KV6BdSzEFBNsDqnx31D
PkcY8ezxBL34YzKRJ2N+CwdozzAAxisA6DtuvK5nLdNbjz0P6tQsYYZjJUSsE587
4g5cUbCpV72ZFYCuqNbcQFvuYA9/+fJQDdf/IrF4kvYP6LudwXRsIp0Nb79Xo4Z9
9QQ/TmDDv6wQ4cEhDobBY/DcVhbvB+SOZ5dbPMJhIKooi0YWhNw7MikbVMmmDzRD
jBXKkFQRfM8aShBo+dTG+Fs1MmZWiKoNLhYGpG3+9If+aZBcd/0=
=C8Jw
-----END PGP SIGNATURE-----

--S735XdVRzV/i3nen--


--===============4410742077021999967==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4410742077021999967==--

