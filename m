Return-Path: <SRS0=c1Ix=SF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02F3FC4360F
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Apr 2019 07:36:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C54C12084C
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Apr 2019 07:36:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B8Kc24Aj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C54C12084C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XrNXJY/543sHe6RpWX1L12S0r3VceeaXH+lAxngsKBI=; b=B8Kc24AjbhUC6XdWB6sZyZVDi
	HioVSZsKy3JhW4Fq/8WLdWIGFhWPLTNmUWW8vbzPGvlnF+gZVdZtcnwzLOM54wKzTWNkhYSlocFYb
	ZkzPe5Ak+AKpz1Ryy5aS7pOJv/9LXfHdbT5neR+bztZkpfeTcmAwL1C3IWseix0mNpr/aY8yqv5nI
	cpG2jBYkBmD+1kfwvJSwFGrUZb6i6uYhAcrgNZ2SGt3Q2G7lq+7ZsIVCwedDjA5zIbrCZ1fRzY735
	KMW5m9e3pa6ABXy/xMHqOP1Ozqh2Zj+/SADaZrEKRjQ45W2N4E3xTkJrW16CRHE8HIesdgkSnbjcu
	CAD9KlWAA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBaRJ-0004AW-II; Wed, 03 Apr 2019 07:36:05 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBaRA-00042D-3l; Wed, 03 Apr 2019 07:35:57 +0000
Received: from localhost (aaubervilliers-681-1-89-125.w90-88.abo.wanadoo.fr
 [90.88.30.125]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 54248100003;
 Wed,  3 Apr 2019 07:35:52 +0000 (UTC)
Date: Wed, 3 Apr 2019 09:35:51 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: mtd: Add YAML schemas for the
 generic NAND options
Message-ID: <20190403073551.ym7nbqwcdpicwo6e@flea>
References: <74b8a52ce98b09d7906f988c107793a86c0c5f6b.1554216856.git-series.maxime.ripard@bootlin.com>
 <CAL_JsqL9rOO8jUUVQ5MnD3GCvyyCDPsw=Kd=va3X-rAF60Wkzg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAL_JsqL9rOO8jUUVQ5MnD3GCvyyCDPsw=Kd=va3X-rAF60Wkzg@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190403_003556_341026_105720CF 
X-CRM114-Status: GOOD (  10.61  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Boris Brezillon <boris.brezillon@collabora.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Frank Rowand <frowand.list@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============4493884416193831659=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============4493884416193831659==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7jrsntgdy4khsrgx"
Content-Disposition: inline


--7jrsntgdy4khsrgx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rob,

On Tue, Apr 02, 2019 at 08:20:58PM -0500, Rob Herring wrote:
> > +      nand-ecc-strength:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        minimum: 1
>
> While I wished this worked, these 2 have to be under 'allOf'.
> Unfortunately, this will also silently pass validation in json-schema.

Unfortunately, I'm not sure I fully get how the ref system is supposed
to work yet. Can you elaborate a bit on why we should put the ref and
whatever constraint we have in an allOf?

Should we do the same in a separate schema that would reference
another entire schema (like the second patch does with the first
one)?

Thanks!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--7jrsntgdy4khsrgx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXKRiVwAKCRDj7w1vZxhR
xRftAP4gOwOHrQ42gDtK4z/l2QP1qkrHcR+4gv4h2w9jqy3upwEAxHJsybyBI6rp
+JNw/3x4TYPZfGVK2ilH9eycRhV9WwA=
=6tkC
-----END PGP SIGNATURE-----

--7jrsntgdy4khsrgx--


--===============4493884416193831659==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4493884416193831659==--

