Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F21C73C66
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Jun 2025 16:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z6YwexQeN9FfWZN9YoburMNaWUJCD+TAmqBbKA2Qp/k=; b=yvHMZldrVgyU5UkAd8r76m9YU3
	cbKoDZYYTWD11QQ+WXOOKXvfK7LgLEfGysV4VSSGol/lF2+i7KK1TBQqDY6h4MVj/Fkx+AHlZKtmm
	Au8oiEtjW2L/0IhB4e4k4crVpQFh9gK3v6m8RVfvcHuSRg2yQj54Aya+wAOJHowCIcg5CDSViV4n+
	2VgbjAG6swRb1Z3GmrJmdbiti+BP/5wDTFwHvxHVSZuM4X/HL3kF1fV8XzIXil800aRhNT6m/4aUP
	FFKaPw55Q4Xuj2KyQnUJBP36d9J1ghW9mojwiPE7rSNSnEs4jYdw62PrAP+DQhqcgXTHHazHacElG
	0UcUeFCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRvET-0000000Afb5-3DRj;
	Wed, 18 Jun 2025 16:01:49 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrvy-0000000A8NY-1W3l
	for linux-mtd@lists.infradead.org;
	Wed, 18 Jun 2025 12:30:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AD29BA525D7;
	Wed, 18 Jun 2025 12:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74FA8C4CEE7;
	Wed, 18 Jun 2025 12:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750249829;
	bh=D4rfI/dgpwr4p8/1Ep8pqKrbCEmpB4WZJuBHlVP4Le4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nMzFDvsPqxLn1B9i3oamFf9T0SmQ9lxFf85hW0ar7mgg/euMF6HKelkctIIKfhypP
	 lEGHTTwlXhFmQdwLqAR1uPg0p2i9N3uRgcA+I7Ib7vhZevLLLuaJGD9FDWZfBsmrEO
	 XqnnTzTGwQ1p5+NV0RD9k/ZlsHY/JSkVXultVPRAsf1+/VBNWO+WOreuWShujmZ9w7
	 u2jArgUGYApvsx8TLqCj6T73EYiAlVQySCEYQOPRS8K66Y2bjxChYSjDom0STHp3hz
	 S/YgtQw7jBxTHfqqcMxtilue9twIbYg2GseKjRtTIvy9qJBndERtLcSTpS6Ii0APPl
	 2LQLRR/SghWtA==
Date: Wed, 18 Jun 2025 13:30:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Yogesh S <yogeshs@ti.com>,
	Santhosh Kumar K <s-k6@ti.com>, Steam Lin <STLin2@winbond.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH 2/8] spi: spi-mem: Take into account the actual maximum
 frequency
Message-ID: <89c8da9d-8e4c-4e68-b306-5645154b4d60@sirena.org.uk>
References: <20250618-winbond-6-16-rc1-octal-phy-upstream-v1-0-513202126013@bootlin.com>
 <20250618-winbond-6-16-rc1-octal-phy-upstream-v1-2-513202126013@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20250618-winbond-6-16-rc1-octal-phy-upstream-v1-2-513202126013@bootlin.com>
X-Cookie: This bag is recyclable.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_053030_460020_9A373DFC 
X-CRM114-Status: GOOD (  10.26  )
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
Content-Type: multipart/mixed; boundary="===============7320096387740069903=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============7320096387740069903==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RW5FZxWRZH+m65mW"
Content-Disposition: inline


--RW5FZxWRZH+m65mW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 18, 2025 at 02:14:19PM +0200, Miquel Raynal wrote:
> In order to pick the best variant, the duration of each typical
> operation is derived and then compared. These durations are based on the
> maximum capabilities of the chips, which are commonly the limiting
> factors. However there are other possible limiting pieces, such as the
> hardware layout, EMC considerations and in some cases, the SPI controller
> itself.

Reviewed-by: Mark Brown <broonie@kernel.org>

--RW5FZxWRZH+m65mW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhSsWAACgkQJNaLcl1U
h9BIRgf/ezr5jf2vKiJJqpU8isR3/C6aRXPA41Id7IowObzRPOdEL9epIfalMmCp
YMAC1Om50TEUuBWM7CnMYiyDJV4EdXSpUpmlHlF/G4Akx8aF9Lf5K/KAWE3m99sU
xe1rcn/TSU/RPGhFhF5IdLapcXvKsKWFoBIHY6i5kn7QvNydi3yUQEo+SQiYLSIp
tmhnPhveSC9JxKAWuRJiGU+n9VKfh0zPSgXKgnG2ZTUIILHOYlUfEnYEG8vK/Wxg
7cTRWmiWGf+Q3lZHycNl01PuziSPH/ZxnD5uk7dp1Kh1pcc5H+fPovTFJVDNu8s9
ztFngOPei544anpJxOtsmFcJ69H+AA==
=ZKto
-----END PGP SIGNATURE-----

--RW5FZxWRZH+m65mW--


--===============7320096387740069903==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7320096387740069903==--

