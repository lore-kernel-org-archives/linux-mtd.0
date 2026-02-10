Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C508EA3F16
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Feb 2026 07:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Subject:Message-Id:Date:Mime-Version:Reply-To:
	Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pp3HrYDUbiDaOUwkx3Xm6ZTAFtoMmOtL0smUmwF+5e8=; b=2nU4ZIpKtj6lBQ2zwshB+ImdAj
	jkGpSxL+r7ehQCl1Is3XwBQWDJ/byyUw/rp+/Ju7Vf37a61aNiYz01E3Nr9+7Il/qCqJ59aA6P4od
	01VLIYn9Buo5jKRCCdVaZ5iCaFqGxXjn4g3OR6Urldszx6t6U06pLrzXXGRWEdvPGtaUlhxROgmN+
	VFfFciaITZkjP+zsIEivGBkX74//LuoDtwP/t9ij4m2y+2pS1+hdYzqKcEOVGBOW83lCB4+jU5HYI
	m2FPDV4zqW2TO8x9507COX4Ohx1/8ocWVJv0EeWpGCZrcFIlpuOGcHQjY0OyMybFkPO9nMMup7Uf4
	Ic7XYKmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpiJ2-0000000Gdkv-06VY;
	Tue, 10 Feb 2026 07:37:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpiIz-0000000GdkU-3RMu
	for linux-mtd@lists.infradead.org;
	Tue, 10 Feb 2026 07:37:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0ED81434DA;
	Tue, 10 Feb 2026 07:37:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64092C19424;
	Tue, 10 Feb 2026 07:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770709024;
	bh=HmJ7OijHDPgsC5trPZ9j8lShrJlC7K9JlcZxWROVB4o=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=uVq7lokh9jJqQCMvKaYLm9zbGtPRZQEtPY90Ir+a2La1SIgaHCIZOjyHl+Zgjgr6e
	 TWaIMfMy3sR9AjvZ1trX8oQihHHEHc4VbxJsAUXRUACK3xHlxEEgY2Igt1+/gu2XgO
	 mCHwBINDBrSJoP6+w+4ROm44jqzmpoqxq4VcHYp51LPb7A7ZX2ntmoLUb9qB/p6i4u
	 MRuM2+QpUY7B6GvvohO3tT2bMvrZWW3dsITlSsZbbK6zmi2yoYi5a4PplIW7jOHrPJ
	 Dj5oajiFbl9sfO1fbGrW1NiNhm3XL2lGEVDSYpDMBtdKG9M65dS+KQX6GcfLVuGJN6
	 5luQV2tHFZdwA==
Mime-Version: 1.0
Date: Tue, 10 Feb 2026 08:37:00 +0100
Message-Id: <DGB3YMAGZPPF.3OZ1TGVVNJ5TI@kernel.org>
Subject: Re: [PATCH 0/4] mtd: spi-nor: winbond: Fix protection handling and
 enable dual/quad reads
From: "Michael Walle" <mwalle@kernel.org>
To: "Eliav Farber" <farbere@amazon.com>, <tudor.ambarus@linaro.org>,
 <pratyush@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20260208061919.30498-1-farbere@amazon.com>
In-Reply-To: <20260208061919.30498-1-farbere@amazon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_233705_880802_A5551F9C 
X-CRM114-Status: GOOD (  12.25  )
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
Content-Type: multipart/mixed; boundary="===============3706685131464721396=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============3706685131464721396==
Content-Type: multipart/signed;
 boundary=9085e451e96b7c81c2ccf1cb3c65a6a29e9f6a7092163991673c021d5645;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--9085e451e96b7c81c2ccf1cb3c65a6a29e9f6a7092163991673c021d5645
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Sun Feb 8, 2026 at 7:19 AM CET, Eliav Farber wrote:
> This series fixes block protection handling for the following Winbond
> SPI-NOR devices:
>  - w25q256jwm
>  - w25q256jw
>  - w25q64jvm
>
> The devices do not correctly describe their Status Register layout and
> protection capabilities (locking flags, TB bit, BP bit configuration).
> As a result, the spi-nor core rejects protection requests and locking
> operations fail with -EINVAL, e.g.:
>
>   flash_lock -l /dev/mtd29
>   flash_lock: error!: could not lock device: /dev/mtd29
>   error 22 (Invalid argument)
>
> Update the device flags to match the actual hardware behavior so that
> locking and unlocking regions work correctly.
>
> Additionally, enable Dual and Quad read support for w25q64jvm when SFDP
> is not used.

Do you really have devices without SFDP tables?

>
> All changes were validated using flash_lock on the affected devices.

Great thanks!

Could you also please dump the SFDP tables from all these devices,
see [1].

Thanks,
-michael

[1] https://docs.kernel.org/driver-api/mtd/spi-nor.html

--9085e451e96b7c81c2ccf1cb3c65a6a29e9f6a7092163991673c021d5645
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaYrgHRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/juWQGAx2h6X0tbeOrOS1w3iFc0qNBUmMysW3Zq
9jlvQ8i1JpgouqCNlY9MnYKwXKBb+AEVAX0Wi/7nwzMz6Bwqx349XpE62HVZFlrY
kNXaHtURBMdbWvsCWc6WwRku0f7euE6qywA=
=rJ5H
-----END PGP SIGNATURE-----

--9085e451e96b7c81c2ccf1cb3c65a6a29e9f6a7092163991673c021d5645--


--===============3706685131464721396==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3706685131464721396==--

