Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 255B2C10F1B
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Dec 2022 17:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0asklh7lRA25niqIHuEIodgfHVbg6w58a/ov7dNdSVE=; b=A6utzKiQixUJClKiw1JfMUMZe8
	RZwlSCQ004iJZ8BY/REXbq1c/ImUkT7/rxKR/86c4ZSv75usVj4ELBWLe4ePZN2kpSgPj68UjVsXz
	uSOy5Gkg1hYWcsgNBdLvAS59w7OYIWTVodT0uX44zDFNUcjYMIBknHLUJaF6idm+X6677l1E698Oh
	TKPotcT3mxLmS2I7z3B86BB74irqjA5S1/NzQ3yIehU8dALp6cRaHpwhgxL0M4qEQiWYIQmECyMPR
	1cgZTkbNr7bVPYb3JHzQ8NUOERTDQWh0HSkSStm1Tw86F744hIzX+rjCHQHouc4HCsbNIr9oqI3aF
	CpGaP7Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p58f5-003Iu0-71; Tue, 13 Dec 2022 17:01:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p58es-003Ifn-0y; Tue, 13 Dec 2022 17:01:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 61B70615E6;
	Tue, 13 Dec 2022 17:01:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E66EC433EF;
	Tue, 13 Dec 2022 17:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670950892;
	bh=uH0LYOSexEh5rmYdYN0yvY9zCHzaNdE5DduFSGRtqbs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KMVuCAzlQrQHOlsgTwtFZ+g2DaAoEPxa0+vuEZjFvdj6e/v79u0Kle9K+EB37sTht
	 bhP1tiiO+FoqeCieMeEcTS0vq1TtyipfxvUflLhdGnwp5xh68oULfypFNoywHnDSCm
	 /iA2G+keMD7peo0uOV1NSk6zf+DhsttgOoUGAvl7WpzIfnwzOJldQxrz5ccnixN+hw
	 CR0vpp9gmUKY7Nb9Rc4GAZ/ywx5wY6mx62VbO0AF2ZTgW/TobmW9yIPZmeN4LJV5F1
	 uTVIghQx24MF7a24ZgmhTDCiseGw1S612dXJFShK/W/3Uz55jO8i98n6tehWX0LjtM
	 25PbCqI2G18Hw==
Date: Tue, 13 Dec 2022 17:01:26 +0000
From: Mark Brown <broonie@kernel.org>
To: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chuanhong Guo <gch981213@gmail.com>, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org, benliang.zhao@mediatek.com,
	bin.zhang@mediatek.com
Subject: Re: [PATCH v4 1/9] spi: mtk-snfi: Change default page format to
 setup default setting
Message-ID: <Y5iv5kPsOFm0OQni@sirena.org.uk>
References: <20221209064317.2828-1-xiangsheng.hou@mediatek.com>
 <20221209064317.2828-2-xiangsheng.hou@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20221209064317.2828-2-xiangsheng.hou@mediatek.com>
X-Cookie: Edwin Meese made me wear CORDOVANS!!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_090134_123382_799C9EEE 
X-CRM114-Status: GOOD (  14.93  )
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
Content-Type: multipart/mixed; boundary="===============1819869798549773733=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============1819869798549773733==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jC3ytWRRxsiHrz4c"
Content-Disposition: inline


--jC3ytWRRxsiHrz4c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 09, 2022 at 02:43:09PM +0800, Xiangsheng Hou wrote:
> Change default page format to setup default setting since the sector
> size 1024 on MT7986 will lead to probe fail.
>=20
> Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
> ---
>  drivers/spi/spi-mtk-snfi.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Angelo, you've not reviewed this one - is there some problem with it or
was it just missed?

--jC3ytWRRxsiHrz4c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOYr+UACgkQJNaLcl1U
h9BU0gf+IvrSdMswYwsbTgS7DBClWKuOuNQAt7lGGUz71eyMXy9UAzCuEDoScV/w
pB+m2dTLcH79ILHq3hDSDj5S/DjmXwJi6Li/mHhYHvk02J0r6WDrU2zw3z2SECrc
fEB8quuER9gh7d9QInhiVNRbNoSL4WAE0B/qIhA4CxJEBximJKR8j0Z/tSSa7GK3
hQ9hudThr90bPE3ykzjPwygyt0uVMgqLHq3zuVX2azJ9yXmrbfWQn6xHvxGXfyt0
3eeRvgpqUL+FpIMvShXLit8oIoZ5tw/HEa5K2I9RlwAja/TnX1ph49NSRYE/swwk
8TCiI+HH1h0TM4w9Q6/TRJMSq91cxg==
=XCqN
-----END PGP SIGNATURE-----

--jC3ytWRRxsiHrz4c--


--===============1819869798549773733==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1819869798549773733==--

