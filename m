Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D3B1C4829B
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Feb 2024 12:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:Mime-Version:From:Cc:Subject:To:Message-Id:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VJkYQsHRp+aeVo+XsSmdLtI4M1ytLQyOgMuGhsTzDWQ=; b=uGXUcpGfFYHazkIG9zF9olX2OW
	VfGMv3YGQ7Y5ozvIxVAcQnpdIlafNLXUSAIM0IlLElp7w63nDUmTqU9QJhSTf3dxmS4AdscVdkwkP
	QzQoervseYdtCNisUYzMaaq42dKJBD9K4UWO+jO6XLY3D+fQkLa5bEosL3Y6423nou8D/9dvPVq2U
	EOIYa4zM5AbMBzA8K44JhgBuLSOCqHdi3Ywsr5DTBPrGAgEQMygK+USuqGBrQtiXFyyTqG/1jRUY1
	KDV9RUEqBVjrX0GKFroRX49Hw7Y1pCOQ9nuMgAWdadtndTSeP+nUxaUVWX8s4cKHoLsQeaQI+Anhd
	M4PxYDEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZVYu-00000005IYe-2gLR;
	Mon, 12 Feb 2024 12:37:28 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZVYr-00000005IXN-0MDc
	for linux-mtd@lists.infradead.org;
	Mon, 12 Feb 2024 12:37:26 +0000
Received: from localhost (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 3EE1DB1A;
	Mon, 12 Feb 2024 13:37:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1707741434;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e9wbQJfxZvfJU/Q19/M/h4h4Fxppjca2MDOnsiKZCEQ=;
	b=gX60cn83sBnpZYDUidD4E5iRhTRIn1Jz8tOfUoXPIoZC9lq63Zz1np9fHGYPjo9lQw1rBq
	ldz72aO8Zd0MbTFe5L4zx/Bv5iORrZapdea/uaY5HrpQZhLGfAYkqcxzOvv13bs7sWxja3
	Fo8cEWNW2AaO/b8R73FBc9wIyG8CX6+aQY9fdnk94ng+NhRFHflvgSauVF2G3FXfsUojBx
	O82t6JNlH1pH/XZx45zoDkCjn3kj+fakDnd/T5b05of0b15bg81OSy2eFLFpv60uhjcZTp
	Wa7EbIyxsI681PhhRfXyqROptGPtaPkDkvZHNvcs4o0VWRkoCohKffMFe94KdA==
Date: Mon, 12 Feb 2024 13:37:13 +0100
Message-Id: <CZ33TC3K8N3R.1PZHTE7ERTQB8@walle.cc>
To: <tkuw584924@gmail.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v3 1/2] mtd: spi-nor: core: rework erase map and erase
 region structures
Cc: <tudor.ambarus@linaro.org>, <pratyush@kernel.org>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <Bacem.Daassi@infineon.com>, "Takahiro Kuwano"
 <Takahiro.Kuwano@infineon.com>
From: "Michael Walle" <michael@walle.cc>
Mime-Version: 1.0
X-Mailer: aerc 0.16.0
References: <cover.1707193538.git.Takahiro.Kuwano@infineon.com>
 <028070a1a02fe6db3c9bc0c2e0ac93116ecb0c0d.1707193539.git.Takahiro.Kuwano@infineon.com>
In-Reply-To: <028070a1a02fe6db3c9bc0c2e0ac93116ecb0c0d.1707193539.git.Takahiro.Kuwano@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_043725_319533_A0AAFD7A 
X-CRM114-Status: UNSURE (   8.24  )
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
Content-Type: multipart/mixed; boundary="===============1470907072372235298=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============1470907072372235298==
Content-Type: multipart/signed;
 boundary=df2007e658a2f83324cf3d7bc1854bceb2d1922659a06982d556d231da01;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Content-Transfer-Encoding: quoted-printable

--df2007e658a2f83324cf3d7bc1854bceb2d1922659a06982d556d231da01
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Tue Feb 6, 2024 at 5:37 AM CET,  wrote:
> -spi_nor_region_next(struct spi_nor_erase_region *region)
> +spi_nor_region_next(const struct spi_nor_erase_map *map,
> +		    struct spi_nor_erase_region *region)
>  {
> -	if (spi_nor_region_is_last(region))
> +	unsigned int region_idx =3D region - map->regions;

I really don't like this pointer arithmetic. Also it implicitly
assumes that region is part of the array map->regions.

Can we drop spi_nor_region_next() altogether and let the outer loop
just use an index into map->regions? We have n_regions now, so that
should be possible.

-michael

--df2007e658a2f83324cf3d7bc1854bceb2d1922659a06982d556d231da01
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIcEABYIAC8WIQQCnWSOYTtih6UXaxvNyh2jtWxG+wUCZcoQ+REcbWljaGFlbEB3
YWxsZS5jYwAKCRDNyh2jtWxG+3OVAQDbDIRsteBPyy5kiLmGVTSjqXjMbQQyHuuL
5FdTqh6yCAD/TrnBFwB+KlAq//X+2eA+9WNxVrIJplqTgR4W09q9Nwk=
=y+xY
-----END PGP SIGNATURE-----

--df2007e658a2f83324cf3d7bc1854bceb2d1922659a06982d556d231da01--


--===============1470907072372235298==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1470907072372235298==--

