Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 248FDC43334
	for <linux-mtd@archiver.kernel.org>; Sat, 23 Jul 2022 19:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/AkXYrJJTl7+vzmKXsA3aH57AII29tyKzNJfUAaJQ2I=; b=cBR5TW4LFlt3pPOidJAj/vfH5w
	W8QdeSCZy10Yg3SQYccHGYmotQcBnvPndi4y6Bn43KUG5Axo7l8t6kI5EbIIWL/t1Wfcgy+6cLa3S
	rMaz10iJeIv4y2beEH0+quBTZzGyuZJAcRkdpU3Zuu4C4FKimqzvvTbFPHEpoWokhk6Oox7AwDI7M
	dlRdpipxHucdOtxHeSrKPxyQNZx6bV9Y1RbCABBhkOE8ixN3qxk5FEoP87k/iQAM0+4I4ITNPYPoN
	j/mzhao4kplMQEkfD+ODR02K1IiLkf6LWvsCgKMy++VL/Ibsw1aPcKN3NB8Nbgc1MIhpGI/9A2hF0
	kFoe1XYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFKrU-006kDK-AV; Sat, 23 Jul 2022 19:32:28 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFKrR-006kBb-Mo
	for linux-mtd@lists.infradead.org; Sat, 23 Jul 2022 19:32:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0A736B80AEF;
	Sat, 23 Jul 2022 19:32:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ABA4C341C0;
	Sat, 23 Jul 2022 19:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658604742;
	bh=r76yhUR7QKLJMAoy6hSEb7FVeJ3UbPDQ0zjweE5Xi7c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CbCcUVRVkjXPWali+tO0le/YmpX51kLQ4oWzUFmBExYjbQC7O1nmjM8fAt2liyx10
	 c2/cunLWptyOx1cS6vkIUrjkFL+eNFHuOTMtSvwxvN0kYoba1eC+hcnGX9taFMJjJE
	 iNDaUsstaZsBr2m0Wsg+vs/hLO3k8hbLELgDPWrxM3Kzf4VEOYE1BCiUQQh265U4R+
	 2xvrgFZTGkSxSXwKvhPjOyCOE93CUKs1sqy0WoCHFD2mAIpgWwl028tVq8fvFUNt5c
	 ECpvhJ5ZCTkARqs53RovCFNakByC1TTefUmD4v88UIP4euaUJXxNeZVdNbIvIdKbiI
	 xpdfhkjtWCu7g==
Date: Sat, 23 Jul 2022 20:32:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Zhou Yanjie <zhouyanjie@wanyeetech.com>
Cc: tudor.ambarus@microchip.com, p.yadav@ti.com, michael@walle.cc,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, aidanmacdonald.0x0@gmail.com,
	tmn505@gmail.com, paul@crapouillou.net, dongsheng.qiu@ingenic.com,
	aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
	jinghui.liu@ingenic.com, sernia.zhou@foxmail.com,
	reimu@sudomaker.com
Subject: Re: [PATCH 3/3] SPI: Ingenic: Add SFC support for Ingenic SoCs.
Message-ID: <YtxMwyRghFKS/vu5@sirena.org.uk>
References: <1658508510-15400-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1658508510-15400-4-git-send-email-zhouyanjie@wanyeetech.com>
 <YtrukeLk9fInqQIL@sirena.org.uk>
 <89d22457-8c62-e441-3bf4-2734ec2a45e1@wanyeetech.com>
MIME-Version: 1.0
In-Reply-To: <89d22457-8c62-e441-3bf4-2734ec2a45e1@wanyeetech.com>
X-Cookie: Necessity is a mother.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220723_123226_079727_92AF5C41 
X-CRM114-Status: GOOD (  22.49  )
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
Content-Type: multipart/mixed; boundary="===============4370541841042909906=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============4370541841042909906==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kkIhzO/ccCxeVEBm"
Content-Disposition: inline


--kkIhzO/ccCxeVEBm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 24, 2022 at 01:06:16AM +0800, Zhou Yanjie wrote:
> On 2022/7/23 =E4=B8=8A=E5=8D=882:38, Mark Brown wrote:

> > > +++ b/drivers/spi/spi-ingenic-sfc.c
> > > @@ -0,0 +1,662 @@
> > > +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +/*
> > > + * Ingenic SoCs SPI Flash Controller Driver

> > Please make the entire comment a C++ one so things look more
> > intentional.

> I'm sorry, I didn't understand well what you meant :(
> Could you please explain a little more detail?

The above comment block uses both C /* */ and C++ // style comments,
please make it just use the C++ style.

> > > +static irqreturn_t ingenic_sfc_irq_handler(int irq, void *data)
> > > +{
> > > +	struct ingenic_sfc *sfc =3D data;
> > > +
> > > +	writel(0x1f, sfc->base + SFC_REG_INTC);
> > > +
> > > +	complete(&sfc->completion);
> > > +
> > > +	return IRQ_HANDLED;
> > > +}

> > This doesn't pay any attention to any status registers in the chip so
> > won't work if the interrupt is shared and won't notice any error reports
> > from the device...

> This interrupt is exclusively owned by SFC, do we still
> need to perform the operation you said? I haven't done
> these operations before because I want to minimize the
> overhead and avoid affecting performance.

Even if the device is not shared is there no possibility that the
device can report an unexpected interrupt status?  It's not just
the sharing case, it's also the fact that it looks like there's a
status being reported but we're not checking it so if anything
goes wrong then we're less likely to notice.  I'd worry about
data corruption.

--kkIhzO/ccCxeVEBm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLcTMIACgkQJNaLcl1U
h9BGtQgAggYv7Qn1OTgVIXH8mGUCfK3TknrnNuKFde/MvOziGFcDFwDuHzjYQZa3
00276bM4+r3UL3UZqxzUBDDUfDrjD++d40lyIBtMOiSoTdMAM6IAXYmrVkPwe/0D
4A9fXEdkuFEQAB/aaQGHhlHVFSHhJG20/vTZ5n0DFVUFnT1O134ido7AZU6RUQZ3
/9g92pmE3u8sNn0OFpGRsNoOdK1pZtrd9D0ByyY3PJy9QeM3gkGtkhdC4DISvB0U
234iv6TDKZ/sfHTPZ7lnifdxuEKFzqVlYlPAchiu0xY0sEzq0JbxeZLCkjS3s8de
1QRQhBSwCyXFQPsacWETl7fHXwO+2A==
=AxAB
-----END PGP SIGNATURE-----

--kkIhzO/ccCxeVEBm--


--===============4370541841042909906==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4370541841042909906==--

