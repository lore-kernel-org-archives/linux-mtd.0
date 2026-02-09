Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F19C0E7E0C1
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Feb 2026 10:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6VL9djF4weveVBZDJCX19Z9hvf5RffhoswB2QhuohpY=; b=sc2tZuVnR7OZZr7o5vjC2i0UqB
	CogoRSuVrBXoXBpVypVHQQpSZa9R3dm6GvDzYx52VyBtFCaAwLkcCzVKmq+EVqTaylaRmzNi2gDAi
	CohTKuDl8UjGx8FXNu9Cy116EuKxTU7jxKgNYn7t7Y0DbyDsClgazDceOBq+FaFoQsYeCEQUQIWr/
	KVxuRz0zjxRkoAkuNIVQk6JOf39Pjd49QU1ZNHREFqCXTby26xxOYURNHB4TJ6tchD1GL+51DVNsr
	ADMKBcw1ZP1Nkxw3XvJnctsROH60JA9H5Myi1IvdO6lT3KwZHDAs/OtZUrx7+eUCBCxyxj52GzAuT
	EJ4C+gNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpOYF-0000000FF4n-30b8;
	Mon, 09 Feb 2026 10:31:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpOYE-0000000FF4h-3fV0
	for linux-mtd@lists.infradead.org;
	Mon, 09 Feb 2026 10:31:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F14BE60008;
	Mon,  9 Feb 2026 10:31:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B76EC116C6;
	Mon,  9 Feb 2026 10:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770633089;
	bh=TwBzdsVRrRybLDrsjk53rOG84qihoqSrcyNa1p9EUdI=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=bOJ1/z/cYdv86jCNXgWrawsbiYDjfW3JigQma1OyEPFuj9u7q0lgq0m5xPzm01TYQ
	 i9FcHzQ+F6xUKVXahi2LydOQZI1n8ppFRxUwCDqSkOJNN9JK9w4MK1r5NV6YCkcHIV
	 0PC9YZmcx5dKU6LZh+XI4vCZH+9xK2udQQJQZvRsy8T7HfMFoZ8NqXRfjj0GvETocN
	 aCUMx3/tvc32/dPXehz/Hm+foAp129A8onIgz7ss4CpNA9b7sAh3y7XD/CapdErCqJ
	 keb/mHKDngvAAufCsGRppBhjEYqBrEZfGYbr7cQ1wFbU5FNpTTh1xwGtJqCfm8qvCm
	 Ci5gEve6qgXLg==
Mime-Version: 1.0
Date: Mon, 09 Feb 2026 11:31:25 +0100
Message-Id: <DGAD1M64X2PO.3CLYHIAZQRLI7@kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: swp: check SR_TB flag when getting
 tb_mask
Cc: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Shiji Yang" <yangshiji66@outlook.com>, <linux-mtd@lists.infradead.org>
X-Mailer: aerc 0.20.0
References: <TYRPR01MB135884849485DE52A81D94965BC91A@TYRPR01MB13588.jpnprd01.prod.outlook.com>
In-Reply-To: <TYRPR01MB135884849485DE52A81D94965BC91A@TYRPR01MB13588.jpnprd01.prod.outlook.com>
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
Content-Type: multipart/mixed; boundary="===============0825786728717127767=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============0825786728717127767==
Content-Type: multipart/signed;
 boundary=3a0cbeae8d59140c80745bc1636a288489d9709fcbb5063fa72cad364e60;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--3a0cbeae8d59140c80745bc1636a288489d9709fcbb5063fa72cad364e60
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Jan 28, 2026 at 1:42 PM CET, Shiji Yang wrote:
> When the chip does not support top/bottom block protect, the tb_mask
> must be set to 0, otherwise SR1 bit5 will be unexpectedly modified.
>
> Signed-off-by: Shiji Yang <yangshiji66@outlook.com>

It goes all the way back to the very first commit..

Fixes: 3dd8012a8eeb ("mtd: spi-nor: add TB (Top/Bottom) protect support")
Reviewed-by: Michael Walle <mwalle@kernel.org>

-michael

--3a0cbeae8d59140c80745bc1636a288489d9709fcbb5063fa72cad364e60
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaYm3fRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/iKpAF8CDyRUYovF37XMeqHzzqdW33hta7ep+Ky
H/Oi/IwS07OPNZyBw7i+tlgl2ryxNHY8AYDCmvEf3rLCrHZX0UybMS4XmHP5/nWJ
qS8iTw4CtYqq5P5/c4EjUC0l4LsIaEsB3ik=
=JGHc
-----END PGP SIGNATURE-----

--3a0cbeae8d59140c80745bc1636a288489d9709fcbb5063fa72cad364e60--


--===============0825786728717127767==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0825786728717127767==--

