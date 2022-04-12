Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0578AC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Apr 2022 09:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N7UGIz7fVB2pmPRNXMeDg9ZNdjSNX5E83L/XGN8PgEg=; b=JpSxvHW6sXnmCam9tsEBfl5oPt
	E9eQMqJCpS+q4qHYX197XDMt1h0GvR7hcfgT2jGbfmbG9JJDCVEP53twPUrUZsps4VYrvvz4vX1IC
	iaGc2NToNNEn46d2SJLtFX9u1oCW+EllW3sg5ZF42jm6WNwZ4/6Btmgsv+v3NYC3xHi+UK7xMxpFd
	u9rIy0xDh+LzmKafiWmBQewCUiOyvQbZ26xgsxJXPte9n+O68RzzVNGqWn/2VdyLdEgpzzDFg3vL1
	aDxGqjdWc0HFcpzwC1sP4tmvQ3HYW66MFInUNHVf4DwfSz7MEvn11B1MsLWr9Lm/sTeRQsZNkkjps
	0QVBpplA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neD2Y-00D03k-Nd; Tue, 12 Apr 2022 09:42:26 +0000
Received: from www.zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neD2U-00Czzf-Rl
 for linux-mtd@lists.infradead.org; Tue, 12 Apr 2022 09:42:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=k1; bh=/gXUO03nZs5ebrOzcOsVdIdl53Fr
 WrU9ROXrk54ZXmQ=; b=y8fK2ZqQ0qZhKrAAy0b8yau0wzvfPfhqtXNe8mTnTQlp
 +Q4R/TpV+XThrTJMk3fWmqRRo+d8qI08xvc2HvMQoszleAmz8KC9kEXPBfCR7lwZ
 JkwYJT+J9z2hDI7kFNQ2TqbXgXQ3EYCfAYNmRNY3VnLWfiY0YF6fUgguF5SQSow=
Received: (qmail 985089 invoked from network); 12 Apr 2022 11:42:11 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 12 Apr 2022 11:42:11 +0200
X-UD-Smtp-Session: l3s3148p1@aYgJ4HHcCucgAQnoAGZ4AFi7qjeMIP6q
Date: Tue, 12 Apr 2022 11:42:11 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 Duc Nguyen <duc.nguyen.ub@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Andrew Gabbasov <andrew_gabbasov@mentor.com>,
 linux-renesas-soc@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] memory: renesas-rpc-if: Simplify single/double data
 register access
Message-ID: <YlVJc3z1xXT2emIc@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sergey Shtylyov <s.shtylyov@omp.ru>,
 Duc Nguyen <duc.nguyen.ub@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Andrew Gabbasov <andrew_gabbasov@mentor.com>,
 linux-renesas-soc@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <19358863deae03b1b26f473e878305a1c6e40d19.1649681638.git.geert+renesas@glider.be>
MIME-Version: 1.0
In-Reply-To: <19358863deae03b1b26f473e878305a1c6e40d19.1649681638.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_024224_001259_A26D35BC 
X-CRM114-Status: GOOD (  10.59  )
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
Content-Type: multipart/mixed; boundary="===============5975333972635873256=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============5975333972635873256==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OELpkJhUqDCsaz5D"
Content-Disposition: inline


--OELpkJhUqDCsaz5D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 11, 2022 at 02:55:29PM +0200, Geert Uytterhoeven wrote:
> For manual write and read, factor out the common access to the first
> data register by keeping track of the current data pointer.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Works fine with reading/writing on a V3U, so:

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

I agree the code is more concise. I am not sure, though, if it is really
more readable. But I don't mind very much, so except for a small nit:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

> +			if (nbytes =3D=3D 8)
> +				regmap_write(rpc->regmap, RPCIF_SMWDR1, *p++);
> +			regmap_write(rpc->regmap, RPCIF_SMWDR0, *p++);

Last '++' can be omitted?


--OELpkJhUqDCsaz5D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJVSW8ACgkQFA3kzBSg
KbYcQw//didRmuvAcnLljb4mtQ3VPVMZBcqWDjRgDKtOO8dvvB1ikHVUDTCWDQbS
++a0GC/UfJ9vlC+1Q7Qi6+QeRfA9UEE7BWjGpleY25NNW+BHqAidlG8vYQYQRW8v
axaCY+ifH5k4ui1j3w0peVy2HZp4ruVROEKhOSZP06gHGIg+rTG27ZUPW1/koKd8
4uvyZxaFkv6eqsWUOp7wy3SYBv6lwaNl111u6DdmxMRW/iSYlC220HQKmDFlIr94
aNcHTOjFHyuP3RqNoxqPTKEilUKnaM6Brvu9f2RxThL6qt+Mks6AvkMwvbYxnzan
7X7PWhj8NNiW0BxmoCPgqAp6GMSq0saZr4zO7cXeEa5Kxf5gyb2u+qM+V1bK+WpK
Io4RgYLSss3zONMx8dB4EApzBHga1pk0Z7bssK23GrMHhq52w40ntbLhpg0Ep7PS
NEQ2HhyGi43iH3/hufjAbX+tkmeRmUjrPC4xEA9QGGDyMVoVx379KmYhXQjixAar
B6b675RYUQ7zFZ5bd3sgZaTTsOlhEq7a5tdzesC7b1w2dPTFGXnBeRg8IniSsP/R
rsZFmvPEVb39UlvqoEoKgjDI+EJqfVVo5RhacONnCVYAuyN8oJn2ObtOoe31Y8rn
Lg6exmSkJlMZsFnHzG1GBjOtUtXzk8cyuVSN1Vzv6SR30EfnoS8=
=Kp1i
-----END PGP SIGNATURE-----

--OELpkJhUqDCsaz5D--


--===============5975333972635873256==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5975333972635873256==--

