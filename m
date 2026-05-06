Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB92ECD342C
	for <linux-mtd@archiver.kernel.org>; Wed,  6 May 2026 08:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oMXzE2s29cy3a5t+hcZjg3pJCldm+qxkodX916KztmM=; b=lmBUTFUYwGwFziUWI3FZ5I6pZC
	LsDxNpbXa0fRUkqcDta6VU7GslWtcI+ldSawtZ9SjbYW9B8MKsC1O7+2IT6Dgfiz0VMBbaqgsLwqG
	6MohdyRAD7faZxz8eMxm/oeIun68EqFYxlKBb/xZVTpLXy+jWkfvEufFdRosDxFCDVSZaqfGMNK+k
	JESWVFHP7rL4CvpAtS5NMlDTJaEJWt8Dgwf4uQHNV3XcMIRcgaG+vT9Tei2/UiB+v4CbvXl6Aj2O5
	7snI+LAcndUv5niEXvaMZJx/9j8y7iIEcpKsmGKroq7pRqUusZFAPWMKfbds298CqW1BPvRmUSclz
	o/XRIuxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKXyY-00000000EN7-2uC3;
	Wed, 06 May 2026 08:51:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKXyX-00000000ELZ-1TMI
	for linux-mtd@lists.infradead.org;
	Wed, 06 May 2026 08:51:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7736A42DAB;
	Wed,  6 May 2026 08:51:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 059BBC2BCB8;
	Wed,  6 May 2026 08:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778057484;
	bh=x4Kzu3DSvB+xMkONDghyst4p2G5CH0NY5txEKz1Gx90=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=WcceAVYSZ12uRJJaHje+a5bxMGIQ1tnXWVnzlaPW+MWT+kPfPvlZegPXY9SCCeCCh
	 q9BSm5PZLCJh0rH9WN6zQoYr6XVVjkOAuv6A0EWIWmvJ8QOmAhahtTc8WYXAiutfyW
	 RxPLZrEb0mk72rUHPP0iP0x+Y2MJLivT9ZrmWuOyK6ccz183JPgdZVN1+I1sadbGZU
	 V34XgZOt/DhmKjXmIQL45poJNT0OuD+T5icrTc+Dtr+PTxOLUcFyz3RK4lV5a64nlk
	 Sj2YM7pq8eF+9x22vJE4HwDop8rWsMCG8lAxR27gcUDWq+LKDaxkHbfYKcytRAlhlg
	 inmo6FFd2sF0w==
Mime-Version: 1.0
Date: Wed, 06 May 2026 10:51:20 +0200
Message-Id: <DIBGRTZ3BUEE.1GIAWVBNNXUY5@kernel.org>
Subject: Re: [PATCH v4 16/27] mtd: spi-nor: Create a local SR cache
Cc: "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Richard Weinberger"
 <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Jonathan
 Corbet" <corbet@lwn.net>, "Sean Anderson" <sean.anderson@linux.dev>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Steam Lin"
 <STLin2@winbond.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Pratyush Yadav" <pratyush@kernel.org>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>
X-Mailer: aerc 0.20.0
References: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-0-833dab5e7288@bootlin.com> <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-16-833dab5e7288@bootlin.com> <2vxz7bph25qx.fsf@kernel.org>
In-Reply-To: <2vxz7bph25qx.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_015125_406708_9699EE7F 
X-CRM114-Status: GOOD (  12.79  )
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
Content-Type: multipart/mixed; boundary="===============4793362709635198318=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============4793362709635198318==
Content-Type: multipart/signed;
 boundary=a4c0add991cee5d4c94cd50ba1c744ab3647074d71e77d29746d9541a0c5;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--a4c0add991cee5d4c94cd50ba1c744ab3647074d71e77d29746d9541a0c5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue May 5, 2026 at 6:14 PM CEST, Pratyush Yadav wrote:
> On Fri, Apr 03 2026, Miquel Raynal wrote:
>
>> In order to be able to generate debugfs output without having to
>> actually reach the flash, create a SPI NOR local cache of the status
>> registers. What matters in our case are all the bits related to sector
>> locking. As such, in order to make it clear that this cache is not
>> intended to be used anywhere else, we zero the irrelevant bits.
>>
>> The cache is initialized once during the early init, and then maintained
>> every time the write protection scheme is updated.
>
> What is the reason for doing so? Do the reads have side effects?

I don't like that a debugfs read will issue a SPI transaction, at
least not these informational files.

If we ever want to access the registers in the flash, we should have
a separate debugfs file/interface.

-michael

--a4c0add991cee5d4c94cd50ba1c744ab3647074d71e77d29746d9541a0c5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCafsBCBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/iM2QGAodj/4y+LGqm9YV53c2/YGEkzVsrj3w+i
ZSJBiz7L5WD3XKx7Sk0eqi30Ua6/rNXAAX4xUXCEN7Aa9xEbN6KJYu5i4NPEHL9c
5M8DqAkASm6gWJKeJXmnWRzFrjL9IVizs50=
=f4lG
-----END PGP SIGNATURE-----

--a4c0add991cee5d4c94cd50ba1c744ab3647074d71e77d29746d9541a0c5--


--===============4793362709635198318==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4793362709635198318==--

