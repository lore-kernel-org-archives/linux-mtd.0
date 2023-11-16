Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00234C54FB9
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Nov 2023 15:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dmhZKzkUmvTytVrCVdRu9Fqevm9GT+k8IjNz1pumhfw=; b=dG7ev59GBkyLCoiuET9426BdG7
	7/vRsNVx0/Kmxl9iE71wcY9q/9hMCZQcrA6Y5d+wju1i4mgKaPvm6CSvwQPEYQpcee75g9T601hzI
	rqApHl1t8QRhPuNCVA26rpbuMnKK5msM9t+F7ADotEeepFsXF171XhopPJfO+YdHbGy2zrrMTI7Zz
	f0v95XHlRK3oTWs37Uc7Njmd3yylEn3MzTbl47z3mwwnBdn46P0pp6Oc04rqjFHK/dVV/Hse8279t
	tMYR8IfEGsnKuV9ymgjXmE2QHkNHEK+NlbdoPBeIHFq/j80I5oakZxcp1PKZpuJIj0sPKZRoArw91
	J7PWQPTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3eB9-003nKz-1H;
	Thu, 16 Nov 2023 15:21:15 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3eB6-003nKY-16
	for linux-mtd@lists.infradead.org;
	Thu, 16 Nov 2023 15:21:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id C42A7B81CB9;
	Thu, 16 Nov 2023 15:21:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BD24C433C7;
	Thu, 16 Nov 2023 15:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700148068;
	bh=8zlYWy/9GrwiD4xbJy7aGkZiO1aytlOU0+w/a72MJkA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mx5wkoTklAbDN9BqccT/xK73eraVqp/wGEI6YLTsPr6rUcrZj+pkTnkv7UXwfjVIx
	 sX0QEJjvWuwIDPm65JzD8V1nIjskNAMgssWDTj5dNKAKwNb3vWY4snuiJP50s7lDxM
	 7LuRk0puHOB4SSiOZaSVlKk04lQviHcGZwA0QP3JjwTKUMkMJGzPLNq9bFVVdCpLiZ
	 06sm63zUJKjwhrTK2JApoZ7r3kYQH0VB6EfZBk6EI79UhRmCjEyBnCB411JNc8EnIL
	 cIvSJXqlSey62Pmzg8J8kzXE4M8pJ9iDmu13QoE8yqhtJUWWXItb/EquSIYEQ2hxhp
	 lG+ooEUDd5gQA==
Date: Thu, 16 Nov 2023 15:21:01 +0000
From: Mark Brown <broonie@kernel.org>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Dhruva Gole <d-gole@ti.com>, linux-mtd@lists.infradead.org,
	Kamal Dasu <kamal.dasu@broadcom.com>,
	Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	Mario Kicherer <dev@kicherer.org>,
	Chuanhong Guo <gch981213@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/2] spi: Replace -ENOTSUPP with -EOPNOTSUPP in op
 checking
Message-ID: <401df72f-9255-4da3-b97e-93d3f38d352c@sirena.org.uk>
References: <20231116024338.337304-1-acelan.kao@canonical.com>
MIME-Version: 1.0
In-Reply-To: <20231116024338.337304-1-acelan.kao@canonical.com>
X-Cookie: micro:
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_072112_538760_39EC39EC 
X-CRM114-Status: UNSURE (   9.64  )
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
Content-Type: multipart/mixed; boundary="===============6906726961696141172=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============6906726961696141172==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dP03VA4Totf7dmr2"
Content-Disposition: inline


--dP03VA4Totf7dmr2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 16, 2023 at 10:43:37AM +0800, AceLan Kao wrote:

> The purpose of this patch is to distinguish the "operation not support"
> error from the generic "not support", so that drivers could better
> handle different errors.

What is the intended distinction between the two?

--dP03VA4Totf7dmr2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVWM1wACgkQJNaLcl1U
h9DVoAf9FsYgJbRkewWfJj4CYQNTj+v2sw4dP9JH34SqOtdUAGb6bv3gs8u0nN5M
Isbda5lciCIG+R+CD1Qr0O5EtcIQjDbCi0NNUSYSwUiAR/7tXA48IDREmW9A+YH6
alQg11NNogCzP/r+jt0ODempK/G0LkwbBpQxhuNOEbXARDr2KNljx48eyayikbAJ
44fwGEg+E/7z2XCmdIJcZBGNmUP1gCEGZF/qP1axHyAkiTvCBsLSg+cRFjO62RZK
tvgetbmtDhymAUyHmigrro4+VG1uKz3/voob4Hs9VaH/ihS6Eg3w1BV52r+tOQ8L
pDBoZvuYqywEEHoTTL11h2/MNc7hSA==
=Jqhu
-----END PGP SIGNATURE-----

--dP03VA4Totf7dmr2--


--===============6906726961696141172==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6906726961696141172==--

