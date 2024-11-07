Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF06D5D67D
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Nov 2024 18:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l6ULTe7ronvdypdl6Z7djM9ZUDeDEUvrJqz2397pdEc=; b=J55U5oRdhxiYB1OrmpPymMsEQg
	lFzKPScYGjMPTETEh57m829eK4IBu2OrQim9zA+QzUMZC8vtBhbgdRNpuzW6UYDXi1Rn+GyyEE2uf
	gjpU48ztzUK4AvMH1UeSTgBFzyOoE0midS8MlyujEuzYHGZPjwYRBgxNqSBqu7bqf9+j2Xs+k5v2E
	MnbSUAtS3am0HRMnFgpFwC9XaDPwH9grKiYZ8XfdbN0oxDy1OV0o1Cb3FGynB/Bwi/Ga3u7hHwYPU
	50Kly0FkOFeLXes9UXbbbd4ENNUmE3rTiBO/RrANtO9Z+pf1TDS3jbQSlxN5KBQKwcclOL9v/GZFG
	8uqLka1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t96qg-00000007tLo-3NCE;
	Thu, 07 Nov 2024 18:03:14 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t96oa-00000007svF-1ZUM
	for linux-mtd@lists.infradead.org;
	Thu, 07 Nov 2024 18:01:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CC501A4483D;
	Thu,  7 Nov 2024 17:59:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66E14C4CECC;
	Thu,  7 Nov 2024 18:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731002463;
	bh=OJ28I0PlrfDGsM6GmEbYmkXlZzDvc4e7sr48tLGE4N4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UxzJ7e9QjvO/I1j2hWY+0GGF7em0kT08NpIA6x7rsC6EvHWCgkINyq3DVqJX15Tup
	 xFpnF8Fzc2lnHPmsubtYMm2D7Rkv3FjBJxEGqKyoQp0WjBHXCEJdG0IjGuLrD5naF5
	 Py3FVpgewow9h/nphteyLpyQ2VosR14VO15XBbst0yiR/B/w2UT+RxfNUXuoLGP10j
	 juiyrYQFhGqRc4TzIvwst2QxlwDSLddqkTsD+vjMpWNJfTacVoGql1YLgXonE4d4On
	 s3hX+XIpH24JpzpsMYrWoE/4aZ3TV/Uk6gmr/hK03z3ogzjE1yLGou4wtr//hIMw78
	 WgtJHPzWo5JbQ==
Date: Thu, 7 Nov 2024 18:00:59 +0000
From: Conor Dooley <conor@kernel.org>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 2/2] dt-bindings: mtd: davinci: convert to yaml
Message-ID: <20241107-hankie-stadium-a664fc460776@spud>
References: <20241107-ondie-v7-0-98829fc8a958@gmail.com>
 <20241107-ondie-v7-2-98829fc8a958@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20241107-ondie-v7-2-98829fc8a958@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_100105_389125_9E8BA5E2 
X-CRM114-Status: UNSURE (   8.01  )
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
Content-Type: multipart/mixed; boundary="===============4547543887897412342=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============4547543887897412342==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kOaLo4DZsENTEN9l"
Content-Disposition: inline


--kOaLo4DZsENTEN9l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 07, 2024 at 02:47:08PM +0100, Marcus Folkesson wrote:
> Convert the bindings to yaml format.
>=20
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--kOaLo4DZsENTEN9l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZy0AWgAKCRB4tDGHoIJi
0oiPAQDSCtDLCED8EAoTptq5tkbjjT0G8TcgQnM388R0Vci7WgEA7mDZkTVF3Xay
eySyrZhk3/YsgTE3xjB4qFV1xvlZJQQ=
=LSHt
-----END PGP SIGNATURE-----

--kOaLo4DZsENTEN9l--


--===============4547543887897412342==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4547543887897412342==--

