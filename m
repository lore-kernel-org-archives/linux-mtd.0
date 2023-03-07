Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E7FC678D5
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Mar 2023 14:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p4jCcqPq4QAK6Sa6VISUL66G6hjfvBYHXu0i3cbBldM=; b=rDk+DKULxHEHCaTMWKHHNGEzHq
	HpBmkXyd+h6qcB2kPErFeSxOnIFUPg6GhdpQpAGj8LgFm31t1JEiB+6dtJ7P+CQgYgBHC54kkKDFl
	ZDGMgOljS3CaMD8UHsDJzpukcFJA9Wj/uOfBvhc9pHcQnpvCilfm1Eiwy15hamNsynp8JUtvlgccv
	DgkG9wjswWhrl6w/cNL4xoQ4wM8J7WHnw9/fQsPLNQnZaHCxK7b2xwIMmrQSeuEC80/SgPL9kRuX0
	RVKyxGmw6qL+9PNWRgQm/4JTAsUd6ANo7KA5FmatwD4mvpiarXftKtHNHNA++bPBYS8Q7cRZ1IcZZ
	2CEj3rAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZXxJ-000dY6-Lb; Tue, 07 Mar 2023 14:06:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZXst-000bGL-C0
	for linux-mtd@lists.infradead.org; Tue, 07 Mar 2023 14:01:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E79E06144C;
	Tue,  7 Mar 2023 14:01:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D1D3C433A7;
	Tue,  7 Mar 2023 14:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678197702;
	bh=2mGQZRLNoz0yS+ALWl4LpTGIySLxfDySlk84qGzNyi0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jzmLHiAmPX31HQtQOy+HM9KJ9obz6dJTBjrHwwhMPwwIUqF+2zqHRyh2ritZ8WvAU
	 nsshCDj8eIGaPsds5IH7p67yqQngPnUBvAQdULwp056/turtof42t/jvR7OltjfwbQ
	 d+vxW1UMjwVW2afGzvu2rD9cxjtX801ItzSrsTMC4DrN+PIlC7KAUrSJrNDa+WBVy5
	 2LZfKGwj+++PZyKJ9Wq03bInMa44dQiajhRdIQWe8uQjBVANVqBmO02WYMRYqK3eUF
	 l90IY3hn36/cl74ms1pVX6x/ilGY7Rur5j86/ZZBMnau4TI+OrLtNug1cU0bBUxb0K
	 86AlgkUU1JgrA==
Date: Tue, 7 Mar 2023 14:01:37 +0000
From: Mark Brown <broonie@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: "Mahapatra, Amit Kumar" <amit.kumar-mahapatra@amd.com>,
	"miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
	"richard@nod.at" <richard@nod.at>,
	"vigneshr@ti.com" <vigneshr@ti.com>,
	"jic23@kernel.org" <jic23@kernel.org>,
	"pratyush@kernel.org" <pratyush@kernel.org>,
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V5 09/15] spi: Add stacked and parallel memories support
 in SPI core
Message-ID: <560c01eb-7166-4b56-b9e0-77cacf83cf69@sirena.org.uk>
References: <20230306172109.595464-1-amit.kumar-mahapatra@amd.com>
 <20230306172109.595464-10-amit.kumar-mahapatra@amd.com>
 <1bbda9e6-37fb-195b-fd62-0e437847c636@linaro.org>
 <BN7PR12MB2802992D71DDA252B008AFDADCB79@BN7PR12MB2802.namprd12.prod.outlook.com>
 <f88b7164-881b-5ada-0d52-05fe418f7b85@linaro.org>
MIME-Version: 1.0
In-Reply-To: <f88b7164-881b-5ada-0d52-05fe418f7b85@linaro.org>
X-Cookie: A rolling stone gathers momentum.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_060143_473165_59909845 
X-CRM114-Status: GOOD (  15.25  )
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
Content-Type: multipart/mixed; boundary="===============7206302246031358823=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============7206302246031358823==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+lqAPw/yMTRaWbuS"
Content-Disposition: inline


--+lqAPw/yMTRaWbuS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 07, 2023 at 11:47:27AM +0000, Tudor Ambarus wrote:
> On 3/7/23 11:37, Mahapatra, Amit Kumar wrote:

> > > On 3/6/23 17:21, Amit Kumar Mahapatra wrote:=09
> > > > Multi CS support using GPIO is not tested due to unavailability of
> > > > necessary hardware setup.

> > > Please don't add code that is not used or tested.

> > During our discussion on the RFC, Mark had suggested to add multi-cs su=
pport
> > via GPIO as well. We had agreed to add multi-cs support via GPIO, but h=
ad also
> > mentioned that we don't have a hardware setup to test the CS GPIO use c=
ase.
> > https://lore.kernel.org/linux-arm-kernel/BN7PR12MB2802E2A9079E505932832=
270DC979@BN7PR12MB2802.namprd12.prod.outlook.com/

> Ok, his call then.

As well as hopefully working if anyone does need it GPIO implementations
also serve as documentation of what we're expecting hardware to do when
it implements things.

--+lqAPw/yMTRaWbuS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQHQ8AACgkQJNaLcl1U
h9DWMAf/dqUtzrGMgRBoWLFJUBQD5J+eu4PmFpPDZJETNqwSazPcVa97COLuA/xh
Wxc4iP5Kot8o2WJlHei50Pbxv1iMrEoWbUCCd3y7Rh27gxzdDUNxzESmduZZx3lt
EIw5UhModB6CBqa8J7/0983QxIxDirGnzA63WM5jaNLOZLmQCgvPXXJJSeokTsn4
F8IvC0ECKlKQOYYgsXImnbxoDV1mrNkeVhaJ0+IEwp3var83U5cDWGhoX/b/Ns3l
uQNlkmMIKNty6+tvtzrrBPsxFUnvBbC4VsjxLxk85Jq8JsWTUA3SGvsMoN1jH2JW
5cfkBKfg3YEuyCspeCUoDCL1l9DwIA==
=YbJC
-----END PGP SIGNATURE-----

--+lqAPw/yMTRaWbuS--


--===============7206302246031358823==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7206302246031358823==--

