Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21B2010F92E9
	for <linux-mtd@archiver.kernel.org>; Tue, 31 Mar 2026 18:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0kJFT11IgailFAAFK55eYqW/kKlfHhzYcMCrgH2mN50=; b=Yjax8AqttArnDfNH7pP+aR34eB
	hcLl7WkG744kM9+n1WA5EQf+OvcwYc5TwrwrWHQNFgT4F4laEHnAQ6WDTvOfJYWXlXuXufEao+duw
	koVYnmTgFLOW2q7gNLTvqK7gR//XWwPlF9npbTd+lXENluMJIpTQo02PxZHS/x8E438KgSr4+UzKo
	nrnWOvSLN9FE+2OFWAZ18aPBY+ZJB+pZbYzeou3RpunOjrth2Gt0/cy0cZlnAZdZPipC0XE0J837k
	FF1Hhqcv2I1HUe5SBjGSRVRFtQYyu1GCUdqyneaW70qgHdXiQq906B15oQcZmmxNMJ7Q6vVS72XxG
	bDzI+vyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7di0-0000000DPWb-1UEL;
	Tue, 31 Mar 2026 18:21:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7dhy-0000000DPWD-0EHB
	for linux-mtd@lists.infradead.org;
	Tue, 31 Mar 2026 18:20:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5A35C4042F;
	Tue, 31 Mar 2026 18:20:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51CCBC19423;
	Tue, 31 Mar 2026 18:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774981257;
	bh=CBgARRlVWed3kCKDRoyC8jPqo4/RyFJxFCWwBT5dEwo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VYDtD0tESu+d3r8edy+MqAy86myDyr2EF6gnBXcTwBqE621YlXRUck25opQwx0gUI
	 cTxCGxrKXooe5Pr1dnBxATt2K0L1DXjPFxAPpZhPXQC5io1KecJMuDW/53NFBqjCZq
	 msblwZ1+pJ9UXyU4Oitv48DX9aelrnypCKy/iae3BQl8L+6AISAtP64anipzWCWaxN
	 2mznUIdmTCzDa66+RARdwTYyDBSYur5CWePBYqIVciV+BrT2OgET3xEo8JVkQ91blg
	 ftI1+/Vddt3z1AdB9syRPs8KHuYbbVpPZvNESB78MOgooPONm8Mj/3Wj6qOSNxxhYN
	 kGbKmU1caqJ1g==
Date: Tue, 31 Mar 2026 19:20:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Frieder Schrempf <frieder@fris.de>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Han Xu <han.xu@nxp.com>,
	Eberhard Stoll <eberhard.stoll@kontron.de>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	imx@lists.linux.dev, Santhosh Kumar K <s-k6@ti.com>
Subject: Re: [PATCH RFC 6/7] spi: spi-mem: Call spi_set_rx_sampling_point()
 for each op
Message-ID: <e1c26f7f-4b42-472a-9277-4137bab3a068@sirena.org.uk>
References: <20260303-fsl-qspi-rx-sampling-delay-v1-0-9326bbc492d6@kontron.de>
 <20260303-fsl-qspi-rx-sampling-delay-v1-6-9326bbc492d6@kontron.de>
 <87wlzlnioh.fsf@bootlin.com>
 <a1a711c4-d9df-4bba-8831-2ec787f84cc4@kontron.de>
 <87ecl09wtv.fsf@bootlin.com>
 <633fee13-a397-410f-a595-db95e04b8110@kontron.de>
 <87ldf881gr.fsf@bootlin.com>
 <fed5fba7-0536-4f92-8372-f4b47c89b1c2@kontron.de>
MIME-Version: 1.0
In-Reply-To: <fed5fba7-0536-4f92-8372-f4b47c89b1c2@kontron.de>
X-Cookie: I just had a NOSE JOB!!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_112058_115960_B02EB6E1 
X-CRM114-Status: GOOD (  14.49  )
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
Content-Type: multipart/mixed; boundary="===============0496979249357178594=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============0496979249357178594==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LGSmH2tZI7RnT4J+"
Content-Disposition: inline


--LGSmH2tZI7RnT4J+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 31, 2026 at 07:57:21PM +0200, Frieder Schrempf wrote:
> On 31.03.26 17:26, Miquel Raynal wrote:

> > I am sorry this is not going to work out. There is no such harmonized
> > speed, differences can be an order (or two) of magnitude different, we
> > do not want to pay the penalty of a very slow identification on all
> > designs. We currently do the read several times with different
> > parameters. What if we were trying one more time by cutting the speed by
> > 2 (completely random proposal)?

> If we try with reduced clock as a fallback after the other attempts,
> there would be a slight chance of one of the earlier attempts with
> normal clock rate returning some invalid data that matches an existing
> chip ID, no? Isn't this a bit flaky?

I'd worry about single bit errors causing confusion between related
parts from a single manufacturer...

--LGSmH2tZI7RnT4J+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnMEIIACgkQJNaLcl1U
h9ArkQf/f6yrd48WurJb0BOBvOmHaKF6dQhorCA8m0joU28cLq5oHLG/FGMH9ArA
7AWglFhekbHcJcwdhWOyF0YfVYeMMCACUgzwonnX9H3FID1wiugRQwHafRgThazL
Svu/ffYJsu2/wPyXBdL1YKdBOw1izqqr9viYJYcJX87eUnbr9yhw4lTFctAdG0GQ
oaVAilcutmC56yl3+I3m9CedvcIeY3lwSx7TO/C51MQ0t3WFJAhlpjCBOMvqSEfS
080e6pduhnuivP1ZiOVF9GEuDbBYvRBBX2WdHbUqQ9Mo1KxR9UKwiodIDSWPpSr5
BlDYbNEm5xuDQB8Q15fbZfu0uIgVUw==
=xbfN
-----END PGP SIGNATURE-----

--LGSmH2tZI7RnT4J+--


--===============0496979249357178594==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0496979249357178594==--

