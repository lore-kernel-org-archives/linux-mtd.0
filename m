Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2075CC982DE
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2026 06:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Subject:Message-Id:Date:Mime-Version:Reply-To:
	Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3AWiWUxsI7+VjIB21+mU5FBxsgRTHLHqSVYwn+WUgQY=; b=tXadfWNP/cMMcipDP92KOLXMjJ
	vSHAh/hk9Do4Ypgf3OPhJ57EjaFQmqDl/4EsVN2ttOmRtrA59pWlBum9nUWgp2IRUnS48dT2Sybkp
	8pozGOhsAkkp46v51vy39Ef6GxPuAxHC0SQYLIy4E2EGTkz9IJVFtDRl1yiP+ovaPNJyzHrx+hh3p
	SFcsGfN/QqG5c6gkMOH53k6dw+QRortcXJwm2j6x3OK4v0QoXsudd7pwmgolAliu4ySMQrR8qkrPz
	eZgwJTHs+X1cC16wbxch1GJFbQqs0hDAvcdgxi/p0dMhaGfcaYIyVm7AEhQzJW9xKSH82dqVlrgzg
	jDHm+OaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Xz1-000000018e4-0SFQ;
	Mon, 21 Sep 2026 06:58:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Xz0-000000018dp-0O8T
	for linux-mtd@lists.infradead.org;
	Mon, 21 Sep 2026 06:58:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 895D2600D1;
	Mon, 21 Sep 2026 06:58:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id BCE2F1F000FF;
	Mon, 21 Sep 2026 06:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789973913;
	bh=39Wr/PjY0LpPMtrUwiFipvqyxU/kZQjZHYX4fAC/ssM=;
	h=Date:Subject:From:To:References:In-Reply-To;
	b=kY52ZX2n2VjUVcmtbfMDjdl/1hGGMsdFNhe/SqkHVJ+tdFRDqA5khE/HB4E/jTyGB
	 hyd1ow6avwf7ee0tjG+6rOuvOt2slnN580/HXeo2Uy/AsXmcl/wbxPeJbpWypvihxl
	 +UzyRZHz+yXd+B7Xd6sCgGwYurLwRZNTUHzDyFJ5Mnkl2uhM1ZEZS/rmaNpBCQAZTY
	 MaVMi624nTDC+T8pPlCPWOivAoN1GwgVIb7HznmywTSPxTPDu5QrwjvXiz79HXJl1t
	 ip+zS2uVd+De0SZDW21Bt2albVQBxwoCU+yR62VjDtwkEkqSYh8iupjYgTPF4qp3G5
	 jVlC4Vd2D398g==
Mime-Version: 1.0
Date: Mon, 21 Sep 2026 08:58:29 +0200
Message-Id: <DLKSSLURXYDB.2VSDOA0K7U9MN@kernel.org>
Subject: Re: [PATCH 1/2] mtd: spi-nor: Fix deadlock in
 spi_nor_rww_start_exclusive()
From: "Michael Walle" <mwalle@kernel.org>
To: <tze.yee.ng@altera.com>, "Pratyush Yadav" <pratyush@kernel.org>,
 "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <cover.1788404586.git.tze.yee.ng@altera.com>
 <46e4e2e31f051f64c120307216ce2766c004d9af.1788404586.git.tze.yee.ng@altera.com>
In-Reply-To: <46e4e2e31f051f64c120307216ce2766c004d9af.1788404586.git.tze.yee.ng@altera.com>
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
Content-Type: multipart/mixed; boundary="===============6775060649213079429=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============6775060649213079429==
Content-Type: multipart/signed;
 boundary=1644aa1539b208b61d8d7ad79432b625f9c7c0e6b8f3d4b02bcb4c386c55;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--1644aa1539b208b61d8d7ad79432b625f9c7c0e6b8f3d4b02bcb4c386c55
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Sep 3, 2026 at 5:14 AM CEST, tze.yee.ng wrote:
> From: Tze Yee Ng <tze.yee.ng@altera.com>
>
> spi_nor_rww_start_exclusive() takes nor->lock with a bare mutex_lock()
> and returns with it held, while its counterpart
> spi_nor_rww_end_exclusive() re-acquires nor->lock via guard(mutex). Any
> exclusive operation on a read-while-write (SNOR_F_RWW) part thus
> deadlocks against itself.
>
> The exclusive section is serialized by the rww ongoing_io/rd/pe flags,
> so take nor->lock with guard(mutex) like the sibling start helpers.
>
> Fixes: 03e7bb864d9a9 ("mtd: spi-nor: use scope-based mutex cleanup helper=
s")
> Cc: stable@vger.kernel.org
> Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>

This was already fixed in:
https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/commit/?id=3D=
44b8a0bf5f96e8393312fc34b956766882341f16

-michael

--1644aa1539b208b61d8d7ad79432b625f9c7c0e6b8f3d4b02bcb4c386c55
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCarDVlRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/g0sQGAlsSS3WYcLwNiLX+kgQnKmAmPudCLHyeg
Dgy48x9NAsKlkpD9I/G/O2jrMH8fqZKGAYDEaPAZPlk6MKfWhqhDuRVkqCjB6jT/
86kPLw+Lf8h17KqFdv72zmW31hZiysACbq8=
=qayW
-----END PGP SIGNATURE-----

--1644aa1539b208b61d8d7ad79432b625f9c7c0e6b8f3d4b02bcb4c386c55--


--===============6775060649213079429==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6775060649213079429==--

