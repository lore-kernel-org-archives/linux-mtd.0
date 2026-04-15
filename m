Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A15D1F41986
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Apr 2026 10:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b4WQg7nEAYQfVurVv6/kPedEfMMmBnYKuF5D5FhGsMk=; b=yFeGtGCiKOVKPg/xkDdRuzGRzE
	2DeIrVbvUtzhj8pVnHJuG7uBCWLHeNXMTwy/p3USwurwSq8zA0pn7eU/wVBPFeXbdWy6gTup/8dEk
	LeMgc2+DU3klWKDjqeEhSqRni+l7pa/Uo81eBDjc4Bv/0eLjUw9tMnB936g/cVCLlAUxtqxRiG7/t
	X4GRBHbCiZjnL/8bWcik27H0qla52rLEZLwOlGwOPu6n2xFeH7+hqa3JKYH0BiCbYaOu8svmle/qA
	KcelT8933rvUVbjgFmsO0eNhO7Blf3heI7wzBhPDZPuv35ZteWjZnk2C2aTWZDKC7uDnCeSqzTcpQ
	P4ttRzCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCxAC-00000000x73-3EYY;
	Wed, 15 Apr 2026 10:08:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCxA9-00000000x6c-02kg
	for linux-mtd@lists.infradead.org;
	Wed, 15 Apr 2026 10:08:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9DC7743D0F;
	Wed, 15 Apr 2026 10:07:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A221C19424;
	Wed, 15 Apr 2026 10:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776247679;
	bh=aUwaJptVs33Hoj1V7He3D+SI134FNzm8HENeUyJiyUs=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=WEMaoie+3XU/z9j/KwJ9RCAifk46bFk5PJHtR1cxwYOXavwrhq8ypQhrvPIbR5RHh
	 FurHJ20cYF7yJ7KBQ+S6q9jaMffyABPVx/KxTm5ChIl4eeunCo3cPuoWwrzTd2zGhb
	 fxJUpOzC2z4ijv8ONK7AnwZ4gEeRS89eLQh3XddwKYwlok/sulr+kC6Wre+eqYbjXv
	 LtUQxErrk/6gGyqm2O/+h+hNWTnL/CuQSLTpBBiwu6OL4iWDcRgKAlmA2oD0A28y91
	 mpSRowjt8i2aFMQhL/yjyKEcevTwpblf+yOdnFtZ9molbzgYO+VpmVYTnuU0ZpRe7k
	 ubTM9+Yok2Bcg==
Mime-Version: 1.0
Date: Wed, 15 Apr 2026 12:07:55 +0200
Message-Id: <DHTN915DJBSP.15QT83JYA4LWA@kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: macronix: Document support for additional
 flash aliases
Cc: "Pratyush Yadav" <pratyush@kernel.org>, "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <alvinzhou@mxic.com.tw>, "Cheng Ming Lin"
 <chengminglin@mxic.com.tw>
From: "Michael Walle" <mwalle@kernel.org>
To: "Cheng Ming Lin" <linchengming884@gmail.com>
X-Mailer: aerc 0.20.0
References: <20260410091039.389911-1-linchengming884@gmail.com>
 <DHPD8DFIQCMM.13NPOBDQOSXL2@kernel.org>
 <CAAyq3SbbyT_wYmVNqgyK4J7C34q2beXGOa+hN0hpi5JNUBfrjw@mail.gmail.com>
In-Reply-To: <CAAyq3SbbyT_wYmVNqgyK4J7C34q2beXGOa+hN0hpi5JNUBfrjw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_030801_091000_4288E985 
X-CRM114-Status: UNSURE (   7.26  )
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
Content-Type: multipart/mixed; boundary="===============3266870448866720653=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============3266870448866720653==
Content-Type: multipart/signed;
 boundary=0841a41031df2269291596afdfdff64d5d5d3341d99f2cab1d8ce3e79068;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--0841a41031df2269291596afdfdff64d5d5d3341d99f2cab1d8ce3e79068
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi

thanks for providing the dumps.

> 1. MX25L51245G
..
> zynq> sha256sum /sys/bus/spi/devices/spi2.0/spi-nor/sfdp
> 7281b0a355a4497ec6256c57b81c3d2b303bc34220cb77790278d719d7465276
> /sys/bus/spi/devices/spi2.0/spi-nor/sfdp
>
> 2. MX25L51273G
..
> zynq> sha256sum /sys/bus/spi/devices/spi2.0/spi-nor/sfdp
> 7281b0a355a4497ec6256c57b81c3d2b303bc34220cb77790278d719d7465276
> /sys/bus/spi/devices/spi2.0/spi-nor/sfdp

Different parts, same ID, same SFDP :(( Are they the same from a
software perspective? With Macronix reusing the same ID for
different flash chips it makes software support for different
features really hard.  And with even with the SFDP being the very
same, it's impossible to distinguish them during auto probing.

-michael

--0841a41031df2269291596afdfdff64d5d5d3341d99f2cab1d8ce3e79068
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCad9jexIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hQ4AGAhv7ADzlPatwb7nsE3KXxWsIOPAkA/RLM
VSbJW1+OabkBm1oqr2gR9bOAajOeA2R/AX9Z2ab7ZCeODBX4LCCQX+w+hG2ZF6T5
3JJUwoNcte4unjUd3P4tfwDkWfCEdE2Q254=
=o8Xe
-----END PGP SIGNATURE-----

--0841a41031df2269291596afdfdff64d5d5d3341d99f2cab1d8ce3e79068--


--===============3266870448866720653==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3266870448866720653==--

