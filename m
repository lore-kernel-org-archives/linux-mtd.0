Return-Path: <SRS0=11H7=KC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE82DC433B4
	for <linux-mtd@archiver.kernel.org>; Fri,  7 May 2021 12:56:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02E936143F
	for <linux-mtd@archiver.kernel.org>; Fri,  7 May 2021 12:56:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02E936143F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=L9bPfZI2J0Avr8xQxfEPefVtYgcjc1d6TGjRR2bh+PI=; b=iF7Aq2oT+YxmKZFQ0YvuWIRe/
	8tY7UFqOR3N+nF2e9LfGWiOyQXEbMKc1OSQ8+LNK4QGZZrJM6PYJRs9+dCRrOf4ffyRGUC+e3eGSu
	ePEdAVJHNQG95ioYTShpx7iStUNUEVTzDbT8nvodqi7IoJHIVo2D6NrcbRQBewEz6QboDA852wWxm
	qdcrGEAgiAA+w1Xwhbku9+T37Kad5aS1G8RL3BIYZdqDIu/b+Ry75rN8aAOGG+F9Kwd5sY80K5mgf
	payHRQtv2dK2UfZUYVESua2MJZpaJlfk+sJge1Q0URWGgdUIv2Zg6MDEXvQD3JS+pQTot8oBq9Jim
	3w94YtGfw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lf01j-00761F-Hp; Fri, 07 May 2021 12:56:19 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lf01f-00760r-9d
 for linux-mtd@desiato.infradead.org; Fri, 07 May 2021 12:56:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=q+t/g69Ga1Vu9GXbKxFPwuNXXK8YKZ8Mnhj1z5Yx9HU=; b=S0MW2TeeCE3Y7je/LgdX23l4Uu
 KVwxdlevlIZALRyzwtz8ixbw5oDPSF1LvuAyASF6WBcOVE9+lnDpTFQmfjIjaKxZhLj5NavC9O8FH
 fTqlfaCGJyoZz4ukCJIkk80nxx9Q9LYu+Kujc/jOBczjZZ8DoFR6KHZC7a+ztqxPZ3lPcRQeUM107
 i20Se6RYg8MN708R7Ud/+c8ZCC2kF2HUDI2wop6eKbRWsStzEl4uQksSgDHhUrSnn3XGinqs7+mn8
 EtNbdxpLAYxJXPjzoLd2t01tcppDdb0oHNj2H57A6H8n7QVkjz6QLULG9xalvYNSLEkyiN+U/PQEK
 O5lMcOKQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lf01c-006rq7-Dg
 for linux-mtd@lists.infradead.org; Fri, 07 May 2021 12:56:13 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8E43D6145D;
 Fri,  7 May 2021 12:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620392171;
 bh=y32fV8IFsyNahCaWCck8Bgsb71MrZYwbNZlgtBX60W8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FIdbOw5mDlCaJq1WudfCM96/pMNiqnxJI0g3Y7ecuhXwxekGLGwhhPFiETS7smMia
 oAYKfCnDnK2zLIqSMWwoAl2nAmvC2iHkVwmbEBf8NQeWNNtKnPEQKQ8fuPiiQc0NsK
 NchlyUHjMTDhy3Ujt+ANC/3tMnpv98l1BkU2wSAdXowwjhSH1+KPBkR2zyMQ7FyJ0R
 RzPUgqtW8DMteVCpZb/lX1Jxj1B8p4fvA5zIXoyd0uOkRi9RLp50KzQQIKD43UY1LG
 AlE/2ODqzBT/3aTDKjkGXyRcWBjaIIhj83Acik+3IJBv9LhLIGeNbroSdhNSPipNUn
 DEIKilL/ZyyGA==
Date: Fri, 7 May 2021 13:55:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org
Subject: Re: [PATCH 4/6] spi: spi-mem: reject partial cycle transfers in
 8D-8D-8D mode
Message-ID: <20210507125533.GA6383@sirena.org.uk>
References: <20210506191829.8271-1-p.yadav@ti.com>
 <20210506191829.8271-5-p.yadav@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210506191829.8271-5-p.yadav@ti.com>
X-Cookie: Postage will be paid by addressee.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210507_055612_518159_B2777A31 
X-CRM114-Status: GOOD (  12.54  )
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
Content-Type: multipart/mixed; boundary="===============7751948475497723613=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============7751948475497723613==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="x+6KMIRAuhnl3hBn"
Content-Disposition: inline


--x+6KMIRAuhnl3hBn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 07, 2021 at 12:48:27AM +0530, Pratyush Yadav wrote:
> In 8D-8D-8D mode two bytes are transferred per cycle. So an odd number
> of bytes cannot be transferred because it would leave a residual half
> cycle at the end. Consider such a transfer invalid and reject it.
>=20
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
>=20
> ---
> This patch should go through the SPI tree but I have included it in this
> series because if it goes in before patches 1-3, Micron MT35XU and
> Cypress S28HS flashes will stop working correctly.

It seems like this should probably even go in as a fix even if nothing
is broken with mainline right now, it's the sort of thing some out of
tree patch could easily trigger.  Unless anyone objects I'll do that.

--x+6KMIRAuhnl3hBn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCVOMQACgkQJNaLcl1U
h9C9uQf9F7iIYJsr5r7vlcQFtN6JRxQBAT7SQrYpZGKtFrmxVr0ct5rCpwPxCDm6
TihuJQd9vVim/gn+GfjZvLLrbgf+QpDE8dR8l3kcUFqDBbG2LpxNBkAKvrDhc0O6
jX89AjpNdoI772ZaEFXSyexyN8jOLn3dZoWX+G+fVGaIpbbYDDn+T3CC1TPPs3hG
05o0WvEsUF/Sdl4O2GoqV7EeLIoa7ViZuhzGyzMFTGMyPvjte3ZK6lne164UZGax
lSnLoTCki6lRxiqhwsfuCRsH9VA3U9rZvAR0Slly7EkmDhkgQDgR4AkKZwK7wB9X
fTQrLj2BgqbZWIkih68wRH9AxHo6ig==
=YstS
-----END PGP SIGNATURE-----

--x+6KMIRAuhnl3hBn--


--===============7751948475497723613==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7751948475497723613==--

