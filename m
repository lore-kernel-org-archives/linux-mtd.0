Return-Path: <SRS0=4jNj=J3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9535DC433ED
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Apr 2021 15:58:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0F46613ED
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Apr 2021 15:58:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0F46613ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ozlsbo57eHJRqjhtwGivi8fTOVM6PtnP60QTc4wKK4k=; b=G8EcF4SQifcFjRQ2PQBCCGhxp
	yRco2gTl84M6MZLEsBf3ViYbH6+bZRf2XZQkc6yhfyxZBGHwqhSV+/lTGWLDJgoGqt8rOXC/XoN3E
	mzO3hl9DQz8SG0/PjFPaTnnLaBI6fYIdWQHky6vdZuDgsUX7hrrn8TG46twFtHY60u6SYxSjJAWWk
	+61Qz2f0H+Gnj053NLj83GR+TFm1tpwMnIiSvxa64DdOVCHKoyNcF+RELO6+2O3Fpdsy84V/lZlYD
	hBRnCaii24liaQFPC7fmINpo5SJ1vyyv//hBIjOZ8MeQDFoJQXPpMpssQQjVGOfTqfUcFdQbtRamg
	2jgJF4oug==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcVVz-00887Y-0f; Fri, 30 Apr 2021 15:57:15 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcVVj-00886R-6M; Fri, 30 Apr 2021 15:56:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=OWDOKLuluZpl4epmSDuGAVv8IdZftXOzn6Q89awu0V8=; b=WtDbhPhSlRT3bZzJcf2o+v3b9u
 aTlIVq9uD8dmz5Qs2gTXtUTl1BZrGeDsnXLzP6wGc1C6gPO3WC6SofQOseqc4K9IS8OkDbwoOGce2
 og931XTxL+tRtMa9mAx74HVtgVYEsgr1UeZQ0NuORugNlidCKcc8RArQIXIJqI64yCKhACKB0hcFG
 LMWPKYfrh6p8qmvPfcxd0IcreTrVGqgMIzTCcUvSs84UOWzQtC10dXN2I1VSOHvwCSn33Vc1I3UJ+
 d53+GoQjf+SLhA3r1jQtIx2JdYiaRNAE+I2mXSefV1Dm5q229cYLJC3YmIHCKWdaO3uuk91oTrsoB
 MhGWcO5Q==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcVVg-001V0A-L8; Fri, 30 Apr 2021 15:56:57 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9813D61107;
 Fri, 30 Apr 2021 15:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619798216;
 bh=Nfc0HJne/30VyMJlu8UUpYSryGNC1CXdu+AlSzucchs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OaGQZ0Ro2H0wftqmIEXleFYY8xSr+hKdEkdmhsD7o5/6XuyRCWHMev7yqsI0tvkpP
 zOuk+6ytcNNBqFm6bwbGr2yl3/J5+BmzLhNpJn0sACPor6pHKb+th5XftBM0E79JxM
 prAIvFme4r1VAlhjwyQnBrC32hQHchixUv2ud5OCDYyYD3fUUxr7BnAYJg7Ad9frvH
 1Y1qn/Xh2G7+fllViqaeDTL5iuh4NsOqgVU2yJSqXCynTnaYiImVjgviqX39Hwde/G
 sftiD/trHVBKKVmjODEjnFWfDJDvfiSZF2itubKZ+8W0xTHs5hq9CiECOtG6z83lHx
 OxhYM0MrJh02A==
Date: Fri, 30 Apr 2021 16:56:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
Cc: Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd@lists.infradead.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 christophe.kerello@foss.st.com
Subject: Re: [PATCH 1/3] spi: spi-mem: add automatic poll status functions
Message-ID: <20210430155623.GD5981@sirena.org.uk>
References: <20210426143934.25275-1-patrice.chotard@foss.st.com>
 <20210426143934.25275-2-patrice.chotard@foss.st.com>
 <20210426162610.erpt5ubeddx7paeq@ti.com>
 <20210426165118.GH4590@sirena.org.uk>
 <28acedfd-6cd5-a8ad-0182-e61c3c30c27d@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <28acedfd-6cd5-a8ad-0182-e61c3c30c27d@foss.st.com>
X-Cookie: QOTD:
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210430_085656_774789_D4476320 
X-CRM114-Status: GOOD (  22.62  )
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
Content-Type: multipart/mixed; boundary="===============7198968156433662027=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============7198968156433662027==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GpGaEY17fSl8rd50"
Content-Disposition: inline


--GpGaEY17fSl8rd50
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 30, 2021 at 04:22:34PM +0200, Patrice CHOTARD wrote:
> On 4/26/21 6:51 PM, Mark Brown wrote:
> > On Mon, Apr 26, 2021 at 09:56:12PM +0530, Pratyush Yadav wrote:

> > Is it possible there's some situation where you're waiting for some bits
> > to clear as well?

> Yes, we are waiting STATUS_BUSY bit to be cleared, see patch 2 which is m=
aking=20
> usage of this API.

Then the inverse question applies - is there no circumstance where we
might be waiting for a bit to be set?

> > We already have the core handling other timeouts.  We don't pass around
> > completions but rather have an API function that the driver has to call
> > when the operation completes, a similar pattern might work here.  Part

> So, if i correctly understood, you make allusion to what is already done
> in SPI core framework with spi_finalize_current_transfer() right ?

Yes, and _current_message().

> > of the thing with those APIs which I'm missing here is that this will
> > just return -EOPNOTSUPP if the driver can't do the delay in hardware, I
> > think it would be cleaner if this API were similar and the core dealt
> > with doing the delay/poll on the CPU.  That way the users don't need to
> > repeat the handling for the offload/non-offload cases.

> Sorry, i didn't catch what you mean here. In PATCH 2, that's the case,
> if spi_mem_poll_status() is not supported, the core is dealing with=20
> the delay/poll on the CPU in spinand_wait().

That's in the NAND core, not in spi-mem.  Any other users of spi-mem
will also need to open code stuff.

--GpGaEY17fSl8rd50
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCMKKcACgkQJNaLcl1U
h9BnTgf9GjZoUqirpCoBPIQR86s2iqmzPr65s1+q3eChglLC4wjowsyrHWAGwVtq
nBgwxYF73lOPoum2okii05Jr8l5eSY/DVeUQApdLAVpZ68p2zdqx30NY5oxm1SeX
znj8hwmDKd6gabz9J5vBZ1mJr6OnIU/0noPe33s7sq3TdMa+0efV9v/uIG5Z+y/N
OW6ot8IyF8bhrg1E7I9YijsqeFcHuLlswP3w/vs8x8IbkIhfoVZi2EVmmdDKa7ni
e5rqCNafXMHwSRKe2qxaE/wv5NWYcxCVdcObqvvrfDinOvhbSw0kUQt4XjrEfcOP
o1Du7yptlLeUxurvc9FvZfTlWfffpQ==
=I/xG
-----END PGP SIGNATURE-----

--GpGaEY17fSl8rd50--


--===============7198968156433662027==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7198968156433662027==--

