Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4692C83F14
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Jul 2025 13:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zGa27RzezpsZXCiAIyTDMhpO6kMJZNGd5W4jfT3EFNM=; b=AO9Gzal32+kZCx+jyaFJaOxcER
	kRqLHp5bMNrGm0eBHQO+WOdDfJoO2OQIYpDWiSc7j4yPjzBdoUxoznHMujjfszp9z3zcftswwIVl4
	qMBmIbySdwkXT6LktYUhNqnOsEXfilsf+2+Q5b2i1bgQGar4fgMz80dh8/lxJKKxQdhqNiEh92MtO
	hTvOqnvdn3FVo+gG8g9MPDz7UWkljbqkXgK80b0f+WMd0CMIu10aN8n44hDHcgrpQHhbFfdRy/UMm
	rG6x+VuTK+DcdzVEZb/gbUZziR0gpU/RocNyMFW6+GNAM4JVJqCl23Zw+XaSuS1HbjBCb/Z8lxsg/
	bKZFkwKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYlS1-00000002Tg5-3PpH;
	Mon, 07 Jul 2025 13:00:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYlPr-00000002T1U-2Gv0
	for linux-mtd@lists.infradead.org;
	Mon, 07 Jul 2025 12:57:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5D797447D4;
	Mon,  7 Jul 2025 12:57:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE403C4CEE3;
	Mon,  7 Jul 2025 12:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751893070;
	bh=S2TNQXJfSlrDZCPEqs8S6d/kJI+VQhACHx3Gr5hNCIQ=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=M8uDdPxsg1vGmf7VTc4DxURwSJ2kMgEksyR02S0MM+iw5GCneDrQnZ90xoel8B714
	 cv+TOW1oQkn22P3sVitcUklPSvP5VOtNVOd84+jvvsY3ztT9irG+ubCY0RHlvn7Yfj
	 rwwGA7jf/a6sucWARFcAdu/SPL48mV0f2hAQLncoPS1EhqrEUwNwpaH4oODJEEEnRd
	 2OF58D7iPw49W8OcrDT3sDAYDglW6BrsbJt7pkqVMcjB/tCSdneYCsNkT29jTrxmp4
	 vbJf518K9i9WEiL2tS+H5L7NkZuLRzL69YKbqEq2rKm/m6En7Mg65DxyuMiqt3KlBE
	 5vRkqvx2m6nAA==
Date: Mon, 07 Jul 2025 14:57:46 +0200
Message-Id: <DB5U9G0LN7VG.S20GFFWQI81K@kernel.org>
Subject: Re: [PATCH v3] Add support for XM25LU64C
Cc: <hhlee@google.com>, <linux-mtd@lists.infradead.org>,
 <miquel.raynal@bootlin.com>, <pratyush@kernel.org>, <richard@nod.at>,
 <roccochen@google.com>, <tudor.ambarus@linaro.org>, <vigneshr@ti.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "Ssunk" <ssunkkan@gmail.com>
X-Mailer: aerc 0.16.0
References: <DAZUMXW900R8.196NNPD9CWDCJ@kernel.org>
 <20250707121428.3683-1-ssunkkan@gmail.com>
In-Reply-To: <20250707121428.3683-1-ssunkkan@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_055751_610040_DD066327 
X-CRM114-Status: GOOD (  10.73  )
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
Content-Type: multipart/mixed; boundary="===============2723615725866673352=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============2723615725866673352==
Content-Type: multipart/signed;
 boundary=d163b8f71f8eac9d85d6795bcba1e76dc921b09347bde9b801fad9d898fc;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--d163b8f71f8eac9d85d6795bcba1e76dc921b09347bde9b801fad9d898fc
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Jul 7, 2025 at 2:14 PM CEST, Ssunk wrote:
> The device is produced by Wuhan Xinxin Semiconductor Manufacturing Corp. =
(XMC)
> and found on some routers from Chinese manufactures.
> We need to add this chip to google's AVL
> The flash ID was incorrectly set to 0x16 0x41 0x17.
> Update to 0x20 0x41 0x17 as per the datasheet.
>
> The data sheet can be found here:
> https://www.xmcwh.com/uploads/954/XM25LU64C_V1.5.pdf
>
> Signed-off-by: Kankan Sun <ssunkkan@gmail.com>

NAK.

Please read the former responses. Until there are any answers to
the open questions I'll going to ignore any further patches.

-michael

--d163b8f71f8eac9d85d6795bcba1e76dc921b09347bde9b801fad9d898fc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaGvEShIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gSMQGA+r4mQLh/26aUmvk+Z2LzlWD4zZZJ8maQ
cdbgG7j4m3qqi80g8k2teZR19pFBc8f+AYD1M1irvPUn9yJ4JFlV+3p7r9OCJksV
rHZR2k4eCNeDMO5tis7qx2gxm/15NPmrZ/8=
=O15U
-----END PGP SIGNATURE-----

--d163b8f71f8eac9d85d6795bcba1e76dc921b09347bde9b801fad9d898fc--


--===============2723615725866673352==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2723615725866673352==--

