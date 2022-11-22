Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB24DC433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Nov 2022 13:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EbjGYRZ9dr5XBJwkVb/zQZlgtPWvSi/HB86X4SEwmKg=; b=X+S0d40Pr9ev6mc7X7aNd+P3Fj
	t9fo81a5V2GV955q1UmQrEioq83a6vERFewxItajzfDFh6kVrOVb3dxsRuk24b+gnyXZ38yIQBgEu
	vKBVrNBvpODn3VC4tq+sEbc2ENVwsSBbegnS69zztLioYON8bTWxQtw6wuDka9JfcwmxFN6HLp5ht
	o7sZoVXlgWa5/7RRga9J3fO3uxNAbsTvxTKoENpMATozPxLQMBU+QQ++IbMnb6mDHgd1I/a1sBRYU
	mQOK6DXCBKZTRGO7249OkkNlomL7J2vOHDAQ5h1A3bx7RdIJFgG0/fh/livnouOPm8zdtgxoj2nJt
	gvUnD3rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxTG0-009cuT-N3; Tue, 22 Nov 2022 13:24:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxTFh-009cmZ-Lm; Tue, 22 Nov 2022 13:23:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1C6B16170A;
	Tue, 22 Nov 2022 13:23:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CABF6C433C1;
	Tue, 22 Nov 2022 13:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669123432;
	bh=TrGdsxnKmIHui2RRQxMhxRK2ImgyiQwSaHZqW+YNmIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MvtBuuIhZ9MXhAtyelT3qJeVn0jV6ooN4SV3AMj6P8SlruA5ifGJDiWcAITsU09gD
	 neeH8ueUlV6ZkhM68xuzfizub6xLat+h1RUNo93+6auouYEa2IonTaa7GmvE+Y+Enn
	 C3QTLV1JwmCBoSLlYKWDszPK+ARaaqt5Hy7RWcXPjOkUs0mek/z9G6OtoFTqdwPHb1
	 aXmtvVAHyScVdRa2L2z8f8/EWQ9bmmmwd2Sp6UfwUCZIdTAmFQ742eyyk9fo6b1FeM
	 hIFrK4iovn4SxlEMDtt+rB3FoOAcOcKkvPK+jSzkWH9tAiPTuZloTqDNFHfoXT8MHE
	 T5OCMrBgL1S4w==
Date: Tue, 22 Nov 2022 13:23:42 +0000
From: Mark Brown <broonie@kernel.org>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: robh+dt@kernel.org, akpm@linux-foundation.org,
	herbert@gondor.apana.org.au, krzysztof.kozlowski+dt@linaro.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@microchip.com, qyousef@layalina.io, arnd@arndb.de,
	atishp@atishpatra.org, anup@brainfault.org, tkhai@ya.ru,
	quic_abhinavk@quicinc.com, vasily.averin@linux.dev,
	baolin.wang@linux.alibaba.com, colin.i.king@gmail.com,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
	pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
	richard@nod.at
Subject: Re: [PATCH] MAINTAINERS: Update email of Tudor Ambarus
Message-ID: <Y3zNXjoraLeugNzS@sirena.org.uk>
References: <20221122125244.175295-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20221122125244.175295-1-tudor.ambarus@microchip.com>
X-Cookie: That's what she said.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_052353_782267_96602724 
X-CRM114-Status: UNSURE (   9.35  )
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
Content-Type: multipart/mixed; boundary="===============1749694722696803435=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============1749694722696803435==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8Vur0n2Nqa/eczlq"
Content-Disposition: inline


--8Vur0n2Nqa/eczlq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 22, 2022 at 02:52:44PM +0200, Tudor Ambarus wrote:
> My professional email will change and the microchip one will bounce after
> mid-november of 2022.

Acked-by: Mark Brown <broonie@kernel.org>

--8Vur0n2Nqa/eczlq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmN8zV0ACgkQJNaLcl1U
h9ClDAgAgIY214kn4I7zM3+oaKJO2vk03Oi6WrlTHYaDO3jmE1HH3SUPdPeio9u+
QaaYSZYfnuJqGiq8CN8DygTvB6kOObFY4hYGD+dL6i9kjurhSTNW5NB1Km5FTTvS
Vs3fS7GOmvkzrOKBPSV6AJoEKB8sNJbtPYS/xC1s5d2ydhVtA2bOjzfGTBL2FZfs
TzFjy68JLcB3avXPCJrZ4IB07/TdOj4V3DRHx4G1kbJ+HQO3eREYGClg5e9RHzY8
GIyfRoPiC+PHAQADviznqrgypRL/RM5NZrv3miQTINs58zH6hMvYqZRJelXlyWXb
BzBf4yMOpCU/P2IKnPOppRYXIhK8Dw==
=QKj9
-----END PGP SIGNATURE-----

--8Vur0n2Nqa/eczlq--


--===============1749694722696803435==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1749694722696803435==--

