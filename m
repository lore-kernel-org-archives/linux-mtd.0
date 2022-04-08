Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14064C433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Apr 2022 13:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lDVfYbXYX1YX8GxQcom4iRGCkhuSA4t3Ja2JO8EhJA8=; b=IxrIhTMjPpuBrmjXZw4kk56wyb
	EVEzGrl+0wWNGikSJjvk/TxG5ZPlGfmZlYeyYhajnWHUAczvKw5paFsDvv+1gCaHSxFIK9YXjBmfW
	yZ7C5XUsXkPdwRi6oXzM/RiJA4d+lKwIorElu7+R51YWhuF6xDb0I8wpYJwSeeaXG/L8J8tI2dLdB
	N9338xhGpqODPFnwBkNZKYWihTRoVyUN2pZWOxNLrKCX1JXOqGXgi7r5AgZvZDnbq41Ok6AZgwXIW
	69AkED/Y2oyxLtDywPFyqf1VxoZb1XbHKSfsguowdBYJTWem1tl3iNKFbxfD8YD+jOsYUUmRFZT9r
	G0esRSfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncoH4-00HEwR-PV; Fri, 08 Apr 2022 13:03:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncnic-00GzsA-81; Fri, 08 Apr 2022 12:28:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 71EBA620E6;
 Fri,  8 Apr 2022 12:28:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76F3EC385A3;
 Fri,  8 Apr 2022 12:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649420880;
 bh=N5V72NGw/oH3V7jhL2eqxDT7AtT93lmGpSFjPpUk84o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XseQyrskrKHG2ZYifsSWw4C0ORCYktjrfjWSS39eovOSoMO70/BK0nmdZOGe8uAF7
 nKHlITp70+P8S0fd+qQJKPAgFNDqnYWtysO05tDP6ghJh2fYhJPqQ6GgRtHFwy3rPu
 bseVljcG6Btzk+eq4LvPQqWFKCdu63bpDcbMiXjEUtkTnZKsNitovhrBcQNiTI1fXl
 rw65czT4wA2biLWos9N6btp2k8Qwm1fuY8d8ndxnc/DNxkMSdUOwyCip/QzvW0HLo6
 uQywsCY3cal71kllpexhjuoo/Re0tlIlEPRLL4/IMR/dXK3oeND7VV5XRw95GdGJZH
 dlRqLt/vN92aw==
Date: Fri, 8 Apr 2022 13:27:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Chuanhong Guo <gch981213@gmail.com>, linux-spi@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Roger Quadros <rogerq@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Cai Huoqing <cai.huoqing@linux.dev>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Colin Ian King <colin.king@intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Pratyush Yadav <p.yadav@ti.com>, Yu Kuai <yukuai3@huawei.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:NAND FLASH SUBSYSTEM" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v4 1/5] mtd: nand: make mtk_ecc.c a separated module
Message-ID: <YlAqSQ5w3y39aOy+@sirena.org.uk>
References: <20220407150652.21885-1-gch981213@gmail.com>
 <20220407150652.21885-2-gch981213@gmail.com>
 <20220408083214.1473e88a@xps13>
MIME-Version: 1.0
In-Reply-To: <20220408083214.1473e88a@xps13>
X-Cookie: Look ere ye leap.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_052802_399024_C6F1BE73 
X-CRM114-Status: GOOD (  14.58  )
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
Content-Type: multipart/mixed; boundary="===============2810515623368302396=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============2810515623368302396==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZqHgdsk0cLf7iTJ6"
Content-Disposition: inline


--ZqHgdsk0cLf7iTJ6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 08, 2022 at 08:32:14AM +0200, Miquel Raynal wrote:

> Otherwise on the MTD side the series looks good (besides the two
> comments you already received).

What's the plan for merging then?

> I don't know if something changed regarding the comments style in the
> spi subsystem, but using // everywhere looks strange, it's usually
> reserved for the SPDX tag, but I'll let Mark comment on it.

I generally request that, it looks messy if the comment block at the top
mixes styles.

--ZqHgdsk0cLf7iTJ6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJQKkgACgkQJNaLcl1U
h9CYWQf/aDU1pdMHOR+7llwkDyWQ1V82hUYybIHSsJissvDGWXzsR2f07fHLNOFM
euloPRzwBaIkluvEtWUg48dvzNObDlNeV93OL5Fx+GQiYlHUq+X4GyfDaLuLGb7o
cLvaD9w6MuQ33+vUy5/+yHIFymOVH7gqcTo2yXe4U23naTjMP4fedx8VW9BcztrQ
kcQ7315oY/dOUy/We5tewUENw4MaXshvpPdaMAue4qU+C1vxygPIMdze3oPi6t3R
YC1PjdjMaAC7HDqENoCzW97DuTNb43yj5Upg+9ZaRA/na0G2e/Q29+R7t5kuEYRx
jOOZiAm5s7dtfFVI5Xy0BYSh/5sysA==
=WOzd
-----END PGP SIGNATURE-----

--ZqHgdsk0cLf7iTJ6--


--===============2810515623368302396==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2810515623368302396==--

