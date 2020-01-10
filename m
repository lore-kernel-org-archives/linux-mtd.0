Return-Path: <SRS0=enRf=27=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0522C282DD
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jan 2020 15:12:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B42CE2077C
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jan 2020 15:12:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GAjATf6U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B42CE2077C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HOxLIIXaOWE6bWBF8/hoPXQL8KSV50o/1T5ZKfPpOjo=; b=GAjATf6U+Mhn72Fa3N3JMKMuX
	ohamANM0xgnwJQNj0IxnCJOo1QGOIUNV23WyANR9MB6+71EvtMtt5gmIYD4owOz3mkDchjXqSesxu
	lb59Wd1ZSqJnSbnznnVJe4JcwaNs060AYPCzrYPgNMFvd6OytbdlGIEQwhcUax4SRdxOyx8mDuWON
	qVU4FhoJDJE82UnkTVOGo8Y6+lUnCP1qOmPxO64FYjKTfcRUEfqzoUg+F3rj1bJ/yRwleJt/ckSM9
	VxhHg2CHzBHt9skd4Gpz3puAGrw581jBbb4FM3YrJN3pRsoa9l7df0UG6/FqsFWDwEx2OJqX+DAQo
	UVN5avg0w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipvxZ-0000kX-Tg; Fri, 10 Jan 2020 15:12:25 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipvxX-0000k0-Ab
 for linux-mtd@lists.infradead.org; Fri, 10 Jan 2020 15:12:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D1E0430E;
 Fri, 10 Jan 2020 07:12:22 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 579DC3F6C4;
 Fri, 10 Jan 2020 07:12:22 -0800 (PST)
Date: Fri, 10 Jan 2020 15:12:20 +0000
From: Mark Brown <broonie@kernel.org>
To: John Garry <john.garry@huawei.com>
Subject: Re: [PATCH v2 2/3] spi: Add HiSilicon v3xx SPI NOR flash controller
 driver
Message-ID: <20200110151220.GC5889@sirena.org.uk>
References: <1575900490-74467-1-git-send-email-john.garry@huawei.com>
 <1575900490-74467-3-git-send-email-john.garry@huawei.com>
 <0dc5cb2e-b765-9e13-b05e-9e3c835c5985@huawei.com>
 <20200109212842.GK3702@sirena.org.uk>
 <df67b562-7d82-19f6-7581-680190a7772d@huawei.com>
 <20200110140726.GB5889@sirena.org.uk>
 <6db83881-927c-d11c-9c77-23a45892ddab@huawei.com>
MIME-Version: 1.0
In-Reply-To: <6db83881-927c-d11c-9c77-23a45892ddab@huawei.com>
X-Cookie: A little pain never hurt anyone.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200110_071223_412949_330DE9F3 
X-CRM114-Status: GOOD (  14.20  )
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
Cc: chenxiang66@hisilicon.com, linux-kernel@vger.kernel.org,
 tudor.ambarus@microchip.com, liusimin4@huawei.com, linuxarm@huawei.com,
 linux-spi@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, xuejiancheng@hisilicon.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 wanghuiqiang <wanghuiqiang@huawei.com>, fengsheng5@huawei.com
Content-Type: multipart/mixed; boundary="===============4660710561426883816=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============4660710561426883816==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IpbVkmxF4tDyP/Kb"
Content-Disposition: inline


--IpbVkmxF4tDyP/Kb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 10, 2020 at 02:58:54PM +0000, John Garry wrote:
> On 10/01/2020 14:07, Mark Brown wrote:
> > On Fri, Jan 10, 2020 at 11:55:37AM +0000, John Garry wrote: >

> > OK, so that's just reusing the DT binding in which case everything
> > that's valid for the DT binding should also be valid for ACPI - I
> > thought that actually worked automatically without you having to do
> > anything in the code but ICBW.

> I thought that it would be improper as we could be mixing ACPI methods to
> describe the serial bus (SPI Serial Bus Connection Resource Descriptor) and
> also DT properties which could conflict, like CS active high.

Yes, that's one of the issues with importing bits of DT into ACPI
unfortunately - you will get conflicts, it's not clear it's a good idea
to be using PRP0001 for SPI stuff given that there's bus level bindings
for both ACPI and SPI and they don't line up exactly.

> However I do see extra properties than "compatible" being added in DSD for
> PRP0001:
> https://patchwork.ozlabs.org/patch/662813/ (see EEPROM part)

> And if we were to do this, I think that we would need to add some
> device_property_read_u32("spi-rx-bus-width", ...), etc calls in the SPI FW
> parsing for ACPI path - I couldn't see that.

You'd need parsing code, yes.

--IpbVkmxF4tDyP/Kb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4YlFQACgkQJNaLcl1U
h9DU0wf/cpuyMTPeqHgaoFffl4krOOM3hfXblBAMhK6+GSCaI+NHD9p+xBGAaDgh
u5+Q4+l4lI6IRJ2N5oJNKdQ/GY4B9H05yQuk2ary3bjM5qqMlWgeZq5aHVVCmti5
mgR3LyAbd93rRX17hhiA7uS04pnikKJYuaS5XHcCZq7uodBz5NZYpt6mskG9uLPA
MySZb/aJ0otKvk0VFNqD1OhEgvEUz//uxDi/WUdfxtW9salpX/iWRQdmfLGM9k0x
JIbDUSkGGygpk5mezausd0nIAhkMifXJcfxffl8l2YomnBq8pQdQtYc3rW+CfFKf
DFTps48PEHxHBrozpUOjXESU39kRpQ==
=9PoE
-----END PGP SIGNATURE-----

--IpbVkmxF4tDyP/Kb--


--===============4660710561426883816==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4660710561426883816==--

