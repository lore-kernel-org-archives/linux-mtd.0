Return-Path: <SRS0=z1Oh=HZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16C67C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Feb 2021 13:38:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B20D464E3F
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Feb 2021 13:38:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B20D464E3F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fOrTxRPFmyQbRLb9FM1W/g6ecEr5rwYnj9UpIuFxjU8=; b=IC3A5Yc5dFo845ybD/yg8SdNX
	8hB4zlF1ZdtCTcatSGb4pHsGWV547+VSoU1Gaeb99f9rkULvaX1YQsPepgvK6VnMY1HN2u33WibTC
	iHjcMto1t5tb5jmYmU50QVQGdPS7TIBDbYaXWjFNQ54MP8iwBz2evgTFemxKeCLWMwb4k8rcglYha
	lmM2QV2l+nXPgIECAAY0nX14qS8HBHmFBQYFrlV6AxFfP4wEDsS9Px3FQhfLjViRCgJz38E632qMC
	Gqoi5oNbyQMALCqJ8MCurqdiOs73c2Dwua2crNegGXzpe4biOmXXeDobIOVboSNqxrqhX72CFN/tw
	h5eyqkQOQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEXsx-0008M3-G9; Tue, 23 Feb 2021 13:37:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEXsu-0008LG-E2
 for linux-mtd@lists.infradead.org; Tue, 23 Feb 2021 13:37:53 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 20D3464E21;
 Tue, 23 Feb 2021 13:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614087471;
 bh=TrmcXwd6Asf9iet05nKyNMTdpH2GzJ4UvZzgOYSjMGo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JIzBjlq/MqTnF/tBiKpAGOFBRjbzud57lq7alZ37pVMk1xm8WAcF5bs9aa4oXNFYe
 PRHCARvjrRNW18qx0Qk3iCC5B8u6tpcyP29JzfSW+Na7XgAicRxhEl5ckB1s4KNcLS
 ddDGifVV4RYerxMocnqGgUrByW4Xh+HkAEPQzJAcMEuw4Glr0WSJRv5iGQXHW4IQDM
 EMcPmCDXLbNEVg4kSuhBDmFDQWCnaTQRi9KhFHHumgXmAX4mWBjdJQYq7z5cDZ0wQR
 wiqDS/ud38ypfiOmOMhSNrPSp4Pi3f8Ca6aKoWOrW0KIu/hXBPyKzoJa75btXe9+63
 SPi/5hpBuay2A==
Date: Tue, 23 Feb 2021 13:36:49 +0000
From: Mark Brown <broonie@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: macronix: add support for Macronix
 octaflash
Message-ID: <20210223133649.GD5116@sirena.org.uk>
References: <1612517808-10010-1-git-send-email-zhengxunli@mxic.com.tw>
 <1612517808-10010-2-git-send-email-zhengxunli@mxic.com.tw>
 <20210205104736.2771074c@xps13>
 <20210205133404.esqqeokhlp4askpq@ti.com>
 <20210223141344.7ad25831@xps13>
MIME-Version: 1.0
In-Reply-To: <20210223141344.7ad25831@xps13>
X-Cookie: Kilroe hic erat!
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210223_083752_543533_74EBD7C6 
X-CRM114-Status: GOOD (  12.43  )
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
Cc: vigneshr@ti.com, juliensu@mxic.com.tw, ycllin@mxic.com.tw,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 Pratyush Yadav <p.yadav@ti.com>, zhengxunli <zhengxunli@mxic.com.tw>
Content-Type: multipart/mixed; boundary="===============4592345047383213155=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============4592345047383213155==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SFyWQ0h3ruR435lw"
Content-Disposition: inline


--SFyWQ0h3ruR435lw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 23, 2021 at 02:13:44PM +0100, Miquel Raynal wrote:
> Pratyush Yadav <p.yadav@ti.com> wrote on Fri, 5 Feb 2021 19:04:04 +0530:

> > [0] Since SPI NOR has no way of knowing what speed the controller is=20
> > running at, assume the fastest speed the flash can run at.

> Ok, I am not entirely clear about what is available/not available from
> the SPI core.

> If this is true then I guess we can't do better with the current code
> base and this can be improved in the future if needed. So I'm fine with
> the current implementation.

For normal SPI operations you can set the speed (really, top speed) on a
per transfer basis.

--SFyWQ0h3ruR435lw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmA1BPEACgkQJNaLcl1U
h9DrGQf+PfSnj4LMXv1cdILxA6rPcwpI8poO9ee+xTB1qoWn7L+NaYzwN/38IruP
NC9mAhUPDv55fTRU/aq1Bu1C4Eiv0IO+Z9XctxYFfdy+rdkX7jP97JQ6Ukj3GN9A
DUDnwZfYEydP6TEeqFqXKxC24J8msCAJ0oXUBfjV4NiOah2FvRCFa8Yszc/gXjvX
JUmHMmKRyPfy80OWcMzu6tdFl3xZeXpzYCQEZjIKhJtJgQ1ZdJC9y0eUE3+nls/m
mxXlnoj9WWrWQGjiEv8aPpQDIswvH9yMWFozIrirPNxkbNpcy9Jl+5mg5DGEVwyC
Yt/uy/i48Apw72riwaBkQ0LRvebuuA==
=fOpH
-----END PGP SIGNATURE-----

--SFyWQ0h3ruR435lw--


--===============4592345047383213155==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4592345047383213155==--

