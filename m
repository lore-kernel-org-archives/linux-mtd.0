Return-Path: <SRS0=dwdD=7Y=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58EFBC433DF
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Jun 2020 15:21:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B6A12067B
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Jun 2020 15:21:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Jp3wx0O+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="N5Tn1Zgb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B6A12067B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9IlGEDdiw7xnZiJvVf6EuuhLIcyj539FGWoQa/8Ii98=; b=Jp3wx0O+gm5dLcbOcF5DoBjlq
	xsyKXmcDWl7hIPIOOgP7PHS7da2ekEdRRIqOWU8HR8rEtkrmAryP7eG9SrORK5r/2Ed1/+uIPnPK1
	HtMJDvDmT4Uk+mdyZDWcqMHZbFUL7NwxntWwwt9qcITQgot28v2MJaNxaHNYu3CbDFVYGf6tqBeCk
	c8XejCMQLsrBEklMWCDK0kGo7TpLgq5o057tdDE4/3pWv6mz9CqZoEsNzezrQrT9C8bbRIqnMW74r
	zqFu1bDWUYEZ7mfrLlLkUbTFW0cClh6mkf+ylJrKU6SQ9F0lv95fMdweRT+Nrg3/u7iXuVl44dytA
	IC4iFoI4g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jjP0v-0008Ql-Vy; Thu, 11 Jun 2020 15:21:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjP0s-0008Os-9F; Thu, 11 Jun 2020 15:21:08 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2DDE22067B;
 Thu, 11 Jun 2020 15:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591888865;
 bh=fU4053E/gEMjOvm/1ax+QwbZU9nEqKq0J4A2Bf6dWHQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N5Tn1ZgbQacjixDiubcV1IE5JEiq9iPEMWmGtJ2uM8xzzrHlI2gqPF2Q5iGG1JqLI
 A52kNMFN/6DvyS/5oAyXPU5yFTgGxFM4wQGGa3Q8/cyJWLM0NjP0KLKhMCXgaEEl3/
 wxbew7LG7ar+YC4EVflLnlWgU9cUn3sgLjAXk7+8=
Date: Thu, 11 Jun 2020 16:21:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Fix more incorrect 'reg' property sizes in
 examples
Message-ID: <20200611152103.GJ4671@sirena.org.uk>
References: <20200611151923.1102796-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200611151923.1102796-1-robh@kernel.org>
X-Cookie: I like your SNOOPY POSTER!!
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200611_082106_349031_327979DE 
X-CRM114-Status: UNSURE (   9.70  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Kishon Vijay Abraham I <kishon@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-rockchip@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
 netdev@vger.kernel.org, linux-mtd@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 "David S. Miller" <davem@davemloft.net>, linux-media@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============7549151779807791734=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============7549151779807791734==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pMCBjikF2xGw87uL"
Content-Disposition: inline


--pMCBjikF2xGw87uL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 11, 2020 at 09:19:23AM -0600, Rob Herring wrote:
> The examples template is a 'simple-bus' with a size of 1 cell for
> had between 2 and 4 cells which really only errors on I2C or SPI type
> devices with a single cell.

Acked-by: Mark Brown <broonie@kernel.org>

--pMCBjikF2xGw87uL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7iS94ACgkQJNaLcl1U
h9ALwgf9FJflzTQOP828gD9dhJPBLf9uqdG6GFRFf/iGqCG+0EHh1MxRNIBXMNFU
pFc2qOrOXnTCvFmSwYib4Ic2S+mc1j9JMhrEjEp6ybbJzWwTmqImDlCydJ81it+0
mJ2ohVbaOo8OsZprM11pEL6wflKweqzJgzQWsg7IgWJUebFsrzEXOKt0nElgxHwM
DxIkj39TRFocuWU1NqkIBefPYWejxr1I8DppfhMBZnAI74UaODz+zAo+EYGPsj+a
OFde9BISP8NNn/skIz7L+4sPP/vkKIw4NoG376dcODKCA88n9Z1clhYE5CkYLhlx
c/Of3H7INUOo4nh6sqkC+DMhtfn58g==
=GWWY
-----END PGP SIGNATURE-----

--pMCBjikF2xGw87uL--


--===============7549151779807791734==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7549151779807791734==--

