Return-Path: <SRS0=CeWw=7D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1CE0C433DF
	for <linux-mtd@archiver.kernel.org>; Thu, 21 May 2020 12:37:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95EF32070A
	for <linux-mtd@archiver.kernel.org>; Thu, 21 May 2020 12:37:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qnfnUSIo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="1Hh7R91M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95EF32070A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WTsGiZqL31CUIa8AzGKgzsVtIRCpPXCBWuI0Bf3ghzY=; b=qnfnUSIoNWfQQWoexgXm5NzVs
	E+/sOsHizHXjaU03mZB2P2qlLjFnT9iOoW3iak+jDCWRZAsinIvBVuLGbyT37+MqQOsWcwNQGduJc
	ZvmHLQEkiy3xF/xYT88T+99Q7AwZk5ZaIGh5cF2UN3DFB0gNuqYmY8xAvXAS/cJ6WYh5wtWTCOTHW
	EgcMge2RX74+n9uF2AwTtRUfqI6ykP/Ax4dpAGWkxRIaMOJPkSGsgP0HB4ynftQc66C6RlR2dPBFV
	Wj/vFdsIJtp7anYEqYPa+qAHLU15N3kz2WFb3GXOpxAcWQdueCbXWYNIMrCsxDdl//cOG+DJI/IGI
	oaLddkc2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbkSC-00008V-Ij; Thu, 21 May 2020 12:37:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbkSA-00007k-GH
 for linux-mtd@lists.infradead.org; Thu, 21 May 2020 12:37:39 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 547DD2070A;
 Thu, 21 May 2020 12:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590064657;
 bh=XzY9Vu3vZDIMRqhC2Uec8ljVnAJkU8kHTGL8ax+6XUw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=1Hh7R91MXepY8cJaTBq4r9BBHcCknRHA4kdtVwWZGAoahyEhDYtZUpVhR2+huC2ip
 hR/cvCRBcGfdmuFUvqWfmOB6yYDafJQcIKkuSdnmwxQEdI7Lc6ZJ8WOZVPHkTiFu+6
 zXB74atNrHZCB3MQ5YyiYn7J01c7AwODVBRHTw8M=
Date: Thu, 21 May 2020 13:37:35 +0100
From: Mark Brown <broonie@kernel.org>
To: "Ramuthevar,
 Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>
Subject: Re: [PATCH v2 1/1] dt-bindings: spi: Add schema for Cadence QSPI
 Controller driver
Message-ID: <20200521123735.GC4770@sirena.org.uk>
References: <20200520123612.11797-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200520124329.GF4823@sirena.org.uk>
 <fd086da7-7e18-83bc-d423-56095b0cff96@linux.intel.com>
 <20200521105646.GA4770@sirena.org.uk>
 <24b0297c-5c33-f690-9514-68b76fc2c9ea@linux.intel.com>
 <20200521122035.GB4770@sirena.org.uk>
 <463b24a4-0a6a-9fcf-7eb9-8fde602c0c13@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <463b24a4-0a6a-9fcf-7eb9-8fde602c0c13@linux.intel.com>
X-Cookie: Keep your laws off my body!
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200521_053738_560118_9EF60113 
X-CRM114-Status: GOOD (  10.87  )
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
Cc: cheol.yong.kim@intel.com, robh@kernel.org, vigneshr@ti.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, qi-ming.wu@intel.com
Content-Type: multipart/mixed; boundary="===============1891523160937874559=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============1891523160937874559==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Bu8it7iiRSEf40bY"
Content-Disposition: inline


--Bu8it7iiRSEf40bY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 21, 2020 at 08:34:43PM +0800, Ramuthevar, Vadivel MuruganX wrote:
> On 21/5/2020 8:20 pm, Mark Brown wrote:

> > I mean that any changes to the bindings ought to be split out into
> > separate patches, if there's multiple changes it may make sense for
> > there to be multiple patches.

> Got it, we do not have multiple changes since it is new YAML file.
> in case if we feel anything to be added , we add as separate patches.

If this is just a conversion to YAML then your changelog is wildly
inaccurate and needs to be improved, your changelog says you are adding
new things.

--Bu8it7iiRSEf40bY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7Gdg4ACgkQJNaLcl1U
h9CEowf/QMYDfB1WRpIHtE540R46+Mt+m6ieiujeMi72a0tdEVaExwPeBNHvHAfr
JeVWeL+H6//8H2NcR5NwR6kVDFYNlx7h1JSNKhOpMedxsT72sJxj62hadMgF18Nm
laUg+q/bz+kPN6qOpAb6iY9ocf6vo9qWcYcKK00DDrrEfkLVF2KbLdft9dGzs75O
VApz+3bfiMY4ROV3Kc08V7xEGyJbXRWnAtiA21+9XrWjiuqYtfuLue+2qeFiE9Hu
3eacgVdd0pGiBjrEi/WbwRUoAnbQBFpRisqkNz/OGtt3d/8mvjF2prNW9QwsPH+g
zugQEeTYSCDR4Nm36ZHyuqzau9hAvA==
=zxZ7
-----END PGP SIGNATURE-----

--Bu8it7iiRSEf40bY--


--===============1891523160937874559==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1891523160937874559==--

