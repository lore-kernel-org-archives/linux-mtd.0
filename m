Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA68CAC5A5
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Sep 2025 12:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zemjHvHYjhWEdjcJ9GdKIt/kEeLs+GiOIJMD1Ce9wfg=; b=r4+1R7z8Sf75j3uD6LJHJr7xS1
	RbwmdaUdvW7iM+C/txCV0BWBJHxqREs/tLevmiX5m91haEmeu2+ARxf2Z3+/9A+Sw6t94jQIAbSVG
	cPMhV/fhTMSeuhQ2Mp7rt8DVsxvJUcXB3PpQs/Z0L70PGSwjYZJhgYNjd4aX4Jc6bS5taoQjvPy70
	zOmGD9ffYzISU2JHtd0F796CNNRNnw1pmkQ7yYFwACs3o31NoM3aurO0nkpIpCfXAWXQyD2H8M7x2
	PpXnCxw3ovvHOTW+pETJI5gmB+oWe450fMT6hrfMVRzapWG22tGapovV820U+zi02JJj5PSIRcu+w
	mDkn7c2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1OKt-0000000HFpR-325e;
	Wed, 24 Sep 2025 12:11:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1OKr-0000000HFoN-0Qcf
	for linux-mtd@lists.infradead.org;
	Wed, 24 Sep 2025 12:11:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C529843A6C;
	Wed, 24 Sep 2025 12:11:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20762C4CEE7;
	Wed, 24 Sep 2025 12:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758715860;
	bh=NyeYSFx1kQDZbzJ3RfjmVhe8icCQd9sfzVXgN3YTbwk=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=rvWns/anr0sgMmaaqe43oMV6Kk1+Sq+6Az1SPnyj1WdJouGQXLenyRXA8UUF/0zg7
	 EDeCNpw8kieA7rZ4mHZCwJ70S2TCjZcT7dqwlIoglxtiHhaUrHKXNjip+2h82jcpPo
	 oICFkGySlcCbr10IcTbcX1mjIS9Ek75FzUu+SP/LuXFhqPvUe8TSNzOcbnAjtQfX4U
	 5butg7sGyU/iODGVdNp0Nr9ZCm4QFEZM7nTecmDR8r4kojPwTQ6f/spJrm8htB9HPY
	 b4O6isFawl1ZFEVNfoCnHWB4K0ccaAOEGt23yXmZHU1PHvthaApO7igqhrrwgljsxU
	 d1p5RBy1iY9aw==
Date: Wed, 24 Sep 2025 14:10:56 +0200
Message-Id: <DD10QMSJVZ2K.26U45JAXV5EY7@kernel.org>
Subject: Re: [PATCH v2 1/3] mtd: spi-nor: macronix: Drop the redundant flash
 info fields
Cc: "Guenter Roeck" <linux@roeck-us.net>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Cheng Ming Lin" <chengminglin@mxic.com.tw>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <alvinzhou@mxic.com.tw>, <leoyu@mxic.com.tw>, "Maarten Zanders"
 <maarten@zanders.be>
From: "Michael Walle" <mwalle@kernel.org>
To: "Cheng Ming Lin" <linchengming884@gmail.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>
X-Mailer: aerc 0.16.0
References: <20250407075400.1113177-1-linchengming884@gmail.com>
 <20250407075400.1113177-2-linchengming884@gmail.com>
 <d98f6eee-d5f7-43b7-bbc8-d6e7e274723a@roeck-us.net>
 <mafs05xh6pf7s.fsf@kernel.org>
 <da58fc81-3c99-4951-85bc-e3c139283b5a@roeck-us.net>
 <a2a0c40e-69d7-4408-add2-88616c92b0ca@roeck-us.net>
 <aa2a4480-9b78-4ed9-8f9d-b18a87eb01e9@linaro.org>
 <CAAyq3SYybDgBvkTKh2ZB4UdKq1XV_nnzx3Tj1P915W5x_7_nNA@mail.gmail.com>
In-Reply-To: <CAAyq3SYybDgBvkTKh2ZB4UdKq1XV_nnzx3Tj1P915W5x_7_nNA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_051101_163398_7D6736B5 
X-CRM114-Status: UNSURE (   9.14  )
X-CRM114-Notice: Please train this message.
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3917442660587247723=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============3917442660587247723==
Content-Type: multipart/signed;
 boundary=1a5f7e5a91512f293e90383dc31ec41b3d82ae75e36c13b11b72ffba2487;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--1a5f7e5a91512f293e90383dc31ec41b3d82ae75e36c13b11b72ffba2487
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

> The root cause of this problem lies in the failure of parsing the SFDP
> data for the flash, rather than an issue with the patch itself. I believe
> we should not revert this patch.

I disagree. There are Macronix flashes with that ID which doesn't
have SFDP.  And this patch is dropping support for them. See also
[1]. Now I'm not sure it is worth reverting this commit. Nobody,
except Guenter complained, but only *so far* (and that patch is in
since 6.16). Any opinions?

-michael

[1] https://lore.kernel.org/r/DD10GE4EOCD7.CPTN7198QFUV@kernel.org/=20

--1a5f7e5a91512f293e90383dc31ec41b3d82ae75e36c13b11b72ffba2487
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaNPf0RIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hmpQF/fyclsXnsAeDOlfobCgo2UCFlVNWwybOt
bZOJ8Yh7jm5W69/keuc/ZKcN0dxqpze+AX9Ph1IPnR1Dd76DHIy+jZBgjryCnAVO
7r0jiQ40LR/OOkdZuYUzI9NkgMZbSpmRT54=
=DMTC
-----END PGP SIGNATURE-----

--1a5f7e5a91512f293e90383dc31ec41b3d82ae75e36c13b11b72ffba2487--


--===============3917442660587247723==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3917442660587247723==--

