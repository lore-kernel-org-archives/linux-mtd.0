Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B1E5CED24E
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Nov 2025 09:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=icCWFJVT2HO2AVwbybkyQuzjJ7rQpn+cBJCnULAUsig=; b=zrFk9LLDCUVd7Rio8XfucUXYI5
	dbloNXJjyW6BlAUUUm5VboqJYScexH/bVdei94Y3tbQuYjYQa9bMzYnTv+Rchi064FFNlFunYPqUX
	EZ6uJ8qz72RxYDVWN5Wojk3B2pHQ5SrkNVmtLWWVsQR/vW4OBHm4GVhoxOCWWQ1Es56tMZhS4K6ch
	QFDBPZ6igytf5d4VHgX2ylaP5/tMkHCRofA1V2vZ3khS88MmkAAmenW3Cc4fd19ufFVmZbFrYV+vX
	+E24LVKcgvhr8sKT/Fp7EMJCVMethnivhzo5JBlGjlQwI0AmUMgE1rS94vrLJN+K0nU8JafhKpWK3
	j5LzKELQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLHxN-000000009eO-3UDf;
	Tue, 18 Nov 2025 09:25:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLHxK-000000009dn-3dbz
	for linux-mtd@lists.infradead.org;
	Tue, 18 Nov 2025 09:24:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1E1D443347;
	Tue, 18 Nov 2025 09:24:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FF5BC19422;
	Tue, 18 Nov 2025 09:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763457897;
	bh=NmJNOSPJoqOqMza75S2PgQtIk72/yiCwXMHlkRZYGWE=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=NtbUjVb8rrlBf6MXAIYYLQfYyFh+rhiGBa51AcdEisXxuRRijzaUh0rw8UHvw5v+W
	 kMVFqw8gEeTkXnlJBRLqeiCaqEI27qCCJXEihpcrXT/vqYRgrcYvwyLbnYOdX0r/9H
	 C4A71GlwrmyeX2qqiEtcovVrCs336gO5khnVqg7u/hQm3/8ezOdKRQW0FHjCBXWq5m
	 TqqdRN4J8uElEXKjdxFohC4YquXzWuGZaV8VS3dhiLsIf6Cjv0Y5Q0ydiEgODRSEMj
	 OfIiR50dhXGvh0v4oM+7Uuq4W721O24biO68olRSHisOtbVel/5T13QNrMlZmHqNDU
	 sqpapZKxszWTA==
Mime-Version: 1.0
Date: Tue, 18 Nov 2025 10:24:52 +0100
Message-Id: <DEBPNG5QO9WW.317J3UWHKAXPU@kernel.org>
Subject: Re: [PATCH 05/19] mtd: spi-nor: debugfs: Enhance output
Cc: "Sean Anderson" <sean.anderson@linux.dev>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Steam Lin" <STLin2@winbond.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Pratyush Yadav" <pratyush@kernel.org>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, "Jonathan Corbet" <corbet@lwn.net>
X-Mailer: aerc 0.20.0
References: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-0-487bc7129931@bootlin.com> <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-5-487bc7129931@bootlin.com>
In-Reply-To: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-5-487bc7129931@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_012458_929977_AEBE0E39 
X-CRM114-Status: UNSURE (   8.06  )
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
Content-Type: multipart/mixed; boundary="===============4153813324202702111=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============4153813324202702111==
Content-Type: multipart/signed;
 boundary=7d919a8f622e2132df4478c38a1eb54d3beb7198213541a56b711828366a;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--7d919a8f622e2132df4478c38a1eb54d3beb7198213541a56b711828366a
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Nov 14, 2025 at 6:53 PM CET, Miquel Raynal wrote:
> Align the number of dashes to the bigger column width (the title in this
> case) to make the output more pleasant and aligned with what is done
> in the "params" file output.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Michael Walle <mwalle@kernel.org>

--7d919a8f622e2132df4478c38a1eb54d3beb7198213541a56b711828366a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaRw7ZRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jY4AF+NjlRLWAEdX5RbxeyDY5tOP9e02LqsT2r
BMoY360YGTt5jF2d//ezdS9KC0gBNTWoAYCZsZb7CCBcHm+7XzcFhxm8PHGCRAiI
DoKPRW5CM3U3O9883ZcLW7I1EprZRBK3wTE=
=vcqo
-----END PGP SIGNATURE-----

--7d919a8f622e2132df4478c38a1eb54d3beb7198213541a56b711828366a--


--===============4153813324202702111==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4153813324202702111==--

