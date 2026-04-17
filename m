Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48172F43682
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Apr 2026 08:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k7LyDOdy5AFNgAy21A5UlHCbj90wWsMRu3lf58zooMs=; b=p7a/yjm3A8RSe8bNNrHtkhzzQz
	qW9E6CSOtlY/ogiolxIifAgaDwjgMMdGmnM87A2I+y9YncoUv/mNWWvn0JTPOCQctnckXArP6Wv+4
	Vl7M6TkH4McWECFyYtf9hvFJ/59nZVSj0YPLng/IckcWOee5qYzgwggz+m8Yc3R7wGOg6wNlp4r7N
	Q4dqPkqSq5xN58a+rbjljwtHp+JyRboPJIPPi5TT3rCvOJ6OFXw16brdgFUk/H+SGSWWeJpeixH1K
	6G0n+rAw+/KEh/kKTh6ChYxa7YcKRj9vHEn/uhIME71kSz6Rztd6bJfQTThMbj7nffRNnDeL8fXYA
	AGGd71Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDeyX-00000003ihG-29lB;
	Fri, 17 Apr 2026 08:54:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDeyV-00000003igw-1NbO
	for linux-mtd@lists.infradead.org;
	Fri, 17 Apr 2026 08:54:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 58C3142D74;
	Fri, 17 Apr 2026 08:54:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D54E6C19425;
	Fri, 17 Apr 2026 08:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776416094;
	bh=6TrQKCjh4dQ2SnoddhWbtSZu3gzLo0fIkwSsJnp/b2E=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=ZuEQI+1DkTO2vtiEggUkzuRuKfDKzcN7BHRZYl5BWT9D/f9sBArh+NZMoPllvqQJo
	 TUvEv7DVQAZuI6pXgvVi6BTfd+bQ2Kt63GSJSMztsoujznfbrin9I+a4Omnz717yJ4
	 uGmu/FzNx1EP7ie3yvMzkDbuqVG8Uy3ZlE6WRaWyUwKwXpOWiLVeGAFXf9bcvANaQG
	 YFtMUI9hXEt8UeAidrypv/RSNgOfd3KvXhuI5BJR0Ewu/dbJ64yDk21Qs6uv8j/2UL
	 SYFqHmWBzjqeK6fYRVnqxVyMQLRD6T+Ha+DEy/xv02aMjm+t0WwzBNWq7nqSPk3dju
	 RGIIi9UL96S9A==
Mime-Version: 1.0
Date: Fri, 17 Apr 2026 10:54:50 +0200
Message-Id: <DHVAY5UJNGL7.A7WVJ8FHRWW0@kernel.org>
Subject: Re: [PATCH v2] mtd: spi-nor: remove unused NO_OP_CHIP_ERASE flag
Cc: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Takahiro Kuwano" <Takahiro.Kuwano@infineon.com>
From: "Michael Walle" <mwalle@kernel.org>
To: <tkuw584924@gmail.com>, "Tudor Ambarus" <tudor.ambarus@linaro.org>,
 "Pratyush Yadav" <pratyush@kernel.org>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>
X-Mailer: aerc 0.20.0
References: <20260417-die-erase-fix-v2-1-73bb7004ebad@infineon.com>
In-Reply-To: <20260417-die-erase-fix-v2-1-73bb7004ebad@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_015455_389105_9D50B03A 
X-CRM114-Status: UNSURE (   6.49  )
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
Content-Type: multipart/mixed; boundary="===============1725710838469743145=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============1725710838469743145==
Content-Type: multipart/signed;
 boundary=27ca0e393bffe5fcd753e42a441c90256d09b01a93982bf58ca1665671f3;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--27ca0e393bffe5fcd753e42a441c90256d09b01a93982bf58ca1665671f3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Apr 17, 2026 at 9:17 AM CEST, tkuw584924 wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>
> NO_OP_CHIP_ERASE flag is no longer used.
> Remove definition and references of the flag in core and debugfs.
>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

Reviewed-by: Michael Walle <mwalle@kernel.org>

--27ca0e393bffe5fcd753e42a441c90256d09b01a93982bf58ca1665671f3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaeH1WhIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/ivoAF/Uu0zI8m9EUTZSrr1oxrwyCTkf0OagKxS
OJgyHYKu4RSDDVb/LRa7/qSppKaIpB53AXsHpORhzFRDlvHAeFfo4JGddNMSoXUX
cUfkudkQUffNR/Jwk2R7TZt5Op8H1UCEnXQ=
=okT8
-----END PGP SIGNATURE-----

--27ca0e393bffe5fcd753e42a441c90256d09b01a93982bf58ca1665671f3--


--===============1725710838469743145==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1725710838469743145==--

