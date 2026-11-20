Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E294606A33E
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2026 13:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=odmlHXdr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IHosfg7+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZLLqMShBEvsgMdyvXjo9prbzVML7ZDpqgIdgr0ebo6Q=; b=odmlHXdr9CkQmBV3jpdq5+hdRP
	2FgndNGD4D7KrpQG9Ji/VhC9YO3LbWeqK/40IQJbRFxSUpx4cLaVded7mZQOKY/5VMXF/dz1kjVkj
	85eySJtW620tIvBKOaZGZHZ4BimHHjkr9l49GIZTMh4nWUZWLiKYMAdnJigkkd4Ny2Nu+4MKaTADc
	vHp30QjbA6ys4Tvqq+ZMjg3H0WHwtVChq0w7XTwryQU1GkZkd+X2yhvcCaId2eZMmgqKe5A/kcWMb
	+FqCVrWZoYSp8/AySc+1YRyIF7DZ/Z6YGf+NCCDP/n5FNGzy+2bfVuquOFxB58ZPwTAFUKQv/yGtb
	nCz0WiJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOFT-0000000F2cy-3vwN;
	Fri, 20 Nov 2026 13:01:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOFS-0000000F2cn-0RVT
	for linux-mtd@lists.infradead.org;
	Fri, 20 Nov 2026 13:01:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 5FDE061D38;
	Fri, 20 Nov 2026 13:01:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 3B14B1F000CF;
	Fri, 20 Nov 2026 13:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795179708;
	bh=jq9pSyaHWv4Kw1kTqN25StxuWddRltV8xaspOL8DIDE=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=IHosfg7+6ijOk2GwdsFMmLJ1yBRba7t1SKiEEdiEm01ZHolStTd2Iqghhq6HPaTsm
	 xSqi18IYvqZ1dGxJr/ZuXdixJbetPmHLrLIEzmF5PpIAUt8tNp61r+xpxQM4fJ5C7U
	 MlghUPc3xbIqXf3pouEmMZyXe+amw6T7LpJ9gk/UAJRE9esBLJ4Zj2byQnTHQ5czQw
	 rhZgCB59rHy23KZGi+AcWbi6zYaYP6rjhCqF1pMs53rw51E7/WMVw5WHLpFo/pU33c
	 KuKn6Uh9YllPfr7wpouLI7quSFB7bI+pCG+/8OBTHotlQ+Q4uGjMv8k8YgvIpIGW+4
	 MlAHqXxNZqHLw==
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Fri, 20 Nov 2026 14:01:44 +0100
Message-Id: <DN023FDVIQ73.3GZDRYY1ZVBAB@kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: winbond: W25Q512NW-Q/N/M: Fill locking
 information
Cc: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Archit More" <architmore303@gmail.com>, "Pratyush Yadav"
 <pratyush@kernel.org>
X-Mailer: aerc 0.20.0
References: <20261108192518.46803-1-architmore303@gmail.com>
In-Reply-To: <20261108192518.46803-1-architmore303@gmail.com>
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2756494661494549542=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2756494661494549542==
Content-Type: multipart/signed;
 boundary=b5160585304d341154d80d171af328992a125d9bc978c8ccad6ae73a7f56;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--b5160585304d341154d80d171af328992a125d9bc978c8ccad6ae73a7f56
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Sun Nov 8, 2026 at 8:25 PM CET, Archit More wrote:
> The W25Q512NW chips support standard Block Protection (BP0-BP3),
> Top/Bottom selection (TB in Status Register 1 bit 6), and Complement
> protection (CMP in Status Register 2 bit 6), matching the layout of
> other NW-family parts (such as W25Q01NW and W25H512NW).
>
> Add the missing flags so that software write protection and complement
> features are properly enabled.

Did you test this? We have a requirement for that, see [1].

-michael

[1] https://docs.kernel.org/driver-api/mtd/spi-nor.html

--b5160585304d341154d80d171af328992a125d9bc978c8ccad6ae73a7f56
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCawBEuRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jsbgGAvgIgrGvnmz97qRwriGfJXgnP/ORGtOJd
qmLagh2CEtWqj68dzFnEno5+RNY41+trAX9LyBl+/txrVGm6NRmI9Q+ILkMTviX9
GrCnbf0V7Ce4NC13w10CQDIMYHB5vHxUL/c=
=7+uI
-----END PGP SIGNATURE-----

--b5160585304d341154d80d171af328992a125d9bc978c8ccad6ae73a7f56--


--===============2756494661494549542==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2756494661494549542==--

