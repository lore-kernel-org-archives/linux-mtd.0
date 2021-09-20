Return-Path: <SRS0=k7nY=OK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6E35C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Sep 2021 14:45:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A88F360F46
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Sep 2021 14:45:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A88F360F46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MscncQWceFFX79x09EwKPD3qOyy7yZBzaksgiLvA278=; b=gQH9NG4kASfO2rmXRc3UvhGh+0
	cb/uTg2h1lQ0mhy0f+WJ0P4ZmFfaX5yB6RPdZomuFzJiQdz8W0u3V1KQuUHLq/F9GABOHQNVXuEkC
	VDSI8cuEPMMvpD74NOWuWj65gR/2tQvSBaEROKCicSdOBkFbMdsgXt+lBtgd7n43rHvYp+C3KaTyb
	Hn+czn3cMDU7Lo7wNFLg0uT8L+9XQew+Y4izlyxoqGLx8mt1X258B/aNX8bIPiiRNmanZqU9fcBNE
	3YO1SkQ+NgHsiZoWucdTyALqK9fiFJhvMZ3rYcBYlV7H8NOnjmJzd7cw3y3K2NqJlnJmlXxvudhRM
	kMwnStaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSKXZ-00216M-2u; Mon, 20 Sep 2021 14:45:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSKXW-00215O-Dn
 for linux-mtd@lists.infradead.org; Mon, 20 Sep 2021 14:45:03 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 83BC760F6B;
 Mon, 20 Sep 2021 14:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632149102;
 bh=7cDcGS8H3dVH16lHnrmM5SjCWdPr+91GxGQ+fdE0o4o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H4pyCnG33eGm6pwYU4CfGQyxRPxkIWjJD/Hl4BrjL+/FG3RuRGoXE3Vc4LmzOClR2
 nZrdyOSYKZecUwPaJNfYA62XbP8KTgeNulG6YZwtCTeoYX490WAyUPt5dyolG4ShXF
 UcYgwJRwcQUqqQGc4arypKSeP9MblRKHv+hBJaPZVEZA9sL8cUct0l6uYBIJ6O7oMW
 fq1l7GzJnQoZ9rHzG1J3hK2CMSuMvgkZHTS4NnlxcXCSxffnMrifZ9jA1Cv5ohJUd9
 EbYCMmd2fVmWsEycF5XI9bDl0xaNrqruag0dRfxYYwgkuvfdxy91Uf3lesM+sLK17k
 Zj6909SBS+dBA==
Date: Mon, 20 Sep 2021 15:44:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Apurva Nandan <a-nandan@ti.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, michael@walle.cc
Subject: Re: [PATCH v2 2/2] dt-bindings: snps,dw-apb-ssi: Use 'flash' node
 name instead of 'spi-flash' in example
Message-ID: <20210920144418.GI4192@sirena.org.uk>
References: <20210920142713.129295-1-a-nandan@ti.com>
 <20210920142713.129295-3-a-nandan@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210920142713.129295-3-a-nandan@ti.com>
X-Cookie: diplomacy, n:
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_074502_590318_E17B5454 
X-CRM114-Status: GOOD (  11.27  )
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
Content-Type: multipart/mixed; boundary="===============2684561985262223653=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============2684561985262223653==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lrvsYIebpInmECXG"
Content-Disposition: inline


--lrvsYIebpInmECXG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 20, 2021 at 07:57:13PM +0530, Apurva Nandan wrote:
> Change the nodename in the example with spi-nand from 'spi-flash@1'
> to 'flash@1' to make the schema uniform with both spi-nand and spi-nor
> flashes. jedec,spi-nor.yaml uses 'flash@' nodename for spi-nor flashes,
> so make the spi-nand examples in dt-bindings use it too for uniformity.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--lrvsYIebpInmECXG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFInkEACgkQJNaLcl1U
h9B3kgf8C0+e9onyf5hzlsH/Wy+bz8cm0v2pE7e7Jmbmb9T+l6SG5uVDV5XFg+hT
TRA+OdGbxzmVJmozgcBeJW3rZHyfcv38uWuAJp7iQx6HjtOB5zRskChX76HvZUHE
IlFilNB2KEW33E3eC+vBV8fzzwoG2Uu22OAHLAEIwZJmb+GdeQ5xPeGMuzjhdfva
QCTEAOSopxfcphryTUeWGGLl5roXvR/8QCuySX/SOD7/5IIPmPnNo2mxmc+AdlfL
rMAVTMBlzNvxY7MU2/zv75OEp2dgAixWaw+BhNKA5ns2HaNNTxGpJ1t3/oY0+3H7
VXHvTG5vturPUxiDm/v7b9D5RDzHrw==
=4fpd
-----END PGP SIGNATURE-----

--lrvsYIebpInmECXG--


--===============2684561985262223653==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2684561985262223653==--

