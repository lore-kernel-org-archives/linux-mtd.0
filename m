Return-Path: <SRS0=hwCG=3C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79EF7C33CAF
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 11:43:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C88821569
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 11:43:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q5kGNmma";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk header.b="GTD5rauE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C88821569
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OGzR5y8zCwkJ8LdPyxAI/7twAKXyF0TBs3p/JPbYonw=; b=q5kGNmmahbJH2e52gC3ByikzG
	wXATnPKvXInX5gnQQmj1uEOLbvD4qzisLTfd+a0eLst3dkXYWx1EKFHw/Eu1NTblEaU8cRQBY+jdr
	rxfAexX40NlFq0HwHQRs0rlnE/yKcM/oJ+TVffOmGoTneYPPH+CIGdtb359OIzIWnabXMcf3XoNth
	M75Tv5ICxdeIIOVUdcIeM0wqB2gUAYWUpyQ+x67p77CJTx9dVR8d4enL2GiAaA4ZS8O8nHyPEBAhF
	WBGwK+kK5lY/QI0i8fahZi0Ev9dB7goZGL+f/YsdSwb4RI0hX9OmNZLkdKqIUcNsMWs3E6R3pZKQR
	yez54pblg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iqy7p-000850-NB; Mon, 13 Jan 2020 11:43:17 +0000
Received: from heliosphere.sirena.org.uk ([172.104.155.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iqy7m-00084P-5q
 for linux-mtd@lists.infradead.org; Mon, 13 Jan 2020 11:43:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g2n49SGBTNUtqISjbMsN587xlnonpg3/x81aMuFYk+w=; b=GTD5rauEfghSV4/oUex1iEqWr
 bX8wCRdUTchQ9oIAMcrz4sIGn3JnxNCtq+wW60KqPFqZSICTwL3tIrQ7F6KujZQnv/KIr+dTFxgEx
 2RnydC2JGjuxtyhPcvTjXyDaBRFVz9nAE/nUW1P3drRG5QBr2MLXfRghZC11aZPsOJUs8=;
Received: from fw-tnat-cam7.arm.com ([217.140.106.55]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1iqy7V-0001fp-Lj; Mon, 13 Jan 2020 11:42:57 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id EF79BD00AD6; Mon, 13 Jan 2020 11:42:56 +0000 (GMT)
Date: Mon, 13 Jan 2020 11:42:56 +0000
From: Mark Brown <broonie@kernel.org>
To: John Garry <john.garry@huawei.com>
Subject: Re: [PATCH v2 2/3] spi: Add HiSilicon v3xx SPI NOR flash controller
 driver
Message-ID: <20200113114256.GH3897@sirena.org.uk>
References: <1575900490-74467-1-git-send-email-john.garry@huawei.com>
 <1575900490-74467-3-git-send-email-john.garry@huawei.com>
 <0dc5cb2e-b765-9e13-b05e-9e3c835c5985@huawei.com>
 <20200109212842.GK3702@sirena.org.uk>
 <df67b562-7d82-19f6-7581-680190a7772d@huawei.com>
 <20200110140726.GB5889@sirena.org.uk>
 <6db83881-927c-d11c-9c77-23a45892ddab@huawei.com>
 <20200110193119.GI32742@smile.fi.intel.com>
 <612a3c5d-69a4-af6b-5c79-c3fb853193ab@huawei.com>
MIME-Version: 1.0
In-Reply-To: <612a3c5d-69a4-af6b-5c79-c3fb853193ab@huawei.com>
X-Cookie: Programming is an unnatural act.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200113_034314_224605_3A6E1A5B 
X-CRM114-Status: GOOD (  10.52  )
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
Content-Type: multipart/mixed; boundary="===============4614124441640753303=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============4614124441640753303==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="X+8siUETKMkW99st"
Content-Disposition: inline


--X+8siUETKMkW99st
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 13, 2020 at 10:09:27AM +0000, John Garry wrote:
> On 10/01/2020 19:31, Andy Shevchenko wrote:

> > PRP method is only for vendors to *test* the hardware in ACPI environment.
> > The proper method is to allocate correct ACPI ID.

> Yes, that would seem the proper thing to do. So the SPI NOR driver is based
> on micron m25p80 and compatible string is "jedec,spi-nor", so I don't know
> who should or would do this registration.

The idiomatic approach appears to be for individual board vendors
to allocate IDs, you do end up with multiple IDs from multiple
vendors for the same thing.

> BTW, Do any of these sensors you mention have any ACPI standardization?

In general there's not really much standardizaiton for devices,
the bindings that do exist aren't really centrally documented and
the Windows standard is just to have the basic device
registration in the firmware and do all properties based on
quirking based on DMI information.

--X+8siUETKMkW99st
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4cV8AACgkQJNaLcl1U
h9C/cAf/f3KqQoM3kgbWl0MgRMi2T0mY02dvLgcINSfWU08s8WPRzo3zWZ+2Bnwy
EtoOy7yu9z4hC9RVNYaA3/FibeE10MJHizzwRnxzzxmu3MjPDixmON8GO+hsKPd6
DYhpptH+23ceLUX3O7l8v34vvslFYKaUeSJkTlCR0OxxEkTCxwnWnWo/wKBYTRer
T58Cj6e/WnAl2qZ4Yl4qJF2TpNTC7T5tHki/I72eEZfiaNylIKxERV27zddbrgHE
dyOKFqftALoJvu2cf/ddKpXKNt1ceMDNGhu3bIBJuoSdYAedtvWRs9TPRigY5bvZ
IiypAujroXyiqSqmQq+3FBBNH9tTXw==
=w5W/
-----END PGP SIGNATURE-----

--X+8siUETKMkW99st--


--===============4614124441640753303==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4614124441640753303==--

