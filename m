Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18733C48BF8
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Feb 2024 14:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SFaoOGEVBX4qezXz/US0/ZnVBAa/IbfArdsdizVsZ+0=; b=1zo7HeRfaq7q5B1LNdFNSdbM5f
	VChKHGC9er2qfibrayYwsKNN9YWcg5V+VC9c/IykQ0m0mOdYQnGrXgy8UuYrRnQIIrzcZHcyeUt3p
	L7thBRcZWFTlkMEfAS57Q1hIR3hP1md+3Rfl4eCrS8Z1Em3yNvi6xEemkjz/K62yPDBQgHaeH0Zur
	sunL87KXYOx612gvs6OrG3RuZEfjDZRerJI1PoIdcxbfRIrmqMsXfZbKoj7IlzFe/tMjI8wrwu3wk
	ZNUy4IEESWzA/D23RXy1e4qjaLL/luX+AfqxoFJr9ZO4K2UsGCOgFHWnwBJyuXYPMYg38HSNkBc4j
	Blc0skTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd9iq-00000005B0q-19Ov;
	Thu, 22 Feb 2024 14:06:48 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd9il-00000005AuG-3gT0
	for linux-mtd@lists.infradead.org;
	Thu, 22 Feb 2024 14:06:45 +0000
Received: from localhost (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 56376BC9;
	Thu, 22 Feb 2024 15:06:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1708610789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
	 references:references; bh=3kh4OV/bLJk91FwAHSO6KCFXj2wWJIqWfKaQoZdCyBA=;
	b=IYsvWVA/Xef7vml+/VyoJx0pLNMUfOKruatHfpfxwLORUvhVej9C0CvoeECzwsVoUh92KJ
	xxNBG7PEys6s8WwCJxC3DhqWl2IQZaZyPxXJ00EglQvfHaTp5aMOYl/YxRLuUW9ptDVlBz
	TZ0JNhKptuUvaTHF7TtzFAhT7R9aJFcdrqcLZGN1aSOnIXdcaKTUzQViNkHen1N94yItGN
	nrPWvY+1y2FQOIj0NExRwhWR12d3WojnG9MU8It4UQ5GXXyyXXyKgAZHEt/a613uW5gYel
	Gb0SXflWiSx8R7/ybwvbFFPP9Plxg14Dz1kgHJDCXaZpEVH8IqZws/S9uhBFlw==
Date: Thu, 22 Feb 2024 15:06:18 +0100
Message-Id: <CZBNYZNF9NIW.3MMZ5UFP3KN2G@walle.cc>
Subject: Re: [PATCH] mtd: spi-nor: macronix: Add support for mx66l2g45g
Cc: <linux-mtd@lists.infradead.org>, "Sebastian Falbesoner"
 <s.falbesoner@schrack-seconet.com>
From: "Michael Walle" <michael@walle.cc>
To: "Michael Walle" <mwalle@kernel.org>, "Sebastian Falbesoner"
 <sebastian.falbesoner@gmail.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Pratyush Yadav" <pratyush@kernel.org>
X-Mailer: aerc 0.16.0
References: <20240215155520.68159-1-sebastian.falbesoner@gmail.com>
 <CZ5SA85G1KD9.THX8OJP3NY43@kernel.org>
In-Reply-To: <CZ5SA85G1KD9.THX8OJP3NY43@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_060644_331703_E8F3A80B 
X-CRM114-Status: GOOD (  13.92  )
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
Content-Type: multipart/mixed; boundary="===============3885989617918272381=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============3885989617918272381==
Content-Type: multipart/signed;
 boundary=52ae76bdb3242d139b9cd90816394532086fbea318665e9db489edf2215c;
 micalg=pgp-sha256; protocol="application/pgp-signature"

--52ae76bdb3242d139b9cd90816394532086fbea318665e9db489edf2215c
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

> I'm pretty sure, this flash will work without any modification by
> using the generic driver (and maybe using the vendor fixups). See
> also previous discussions [2]. Thus, I think the following should be
> enough:
> +	{ .id =3D SNOR_ID(0xc2, 0x20, 0x1c) }
>
> *But* there is already a patchset under review to add SNOR_ID(0xc2)
> to match any macronix flashes. Therefore, with the patch in [2]
> applied, this flash should work without any further entries.

It looks like that series it taking a while. If you want to speed
things up, add this to the macronix_nor_parts[], test whether it
works for your flash and submit a patch for it.

+    /* Need the manufacturer fixups. Keep this last */
+    { .id =3D SNOR_ID(0xc2) }

-michael

> [1] https://docs.kernel.org/driver-api/mtd/spi-nor.html
> [2] https://lore.kernel.org/linux-mtd/?q=3Dmx66l2g45g
> [3] https://lore.kernel.org/r/8b80cf233ea0065adf9841408e59f6a2@kernel.org=
/

--52ae76bdb3242d139b9cd90816394532086fbea318665e9db489edf2215c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIcEABYIAC8WIQQCnWSOYTtih6UXaxvNyh2jtWxG+wUCZddU2hEcbWljaGFlbEB3
YWxsZS5jYwAKCRDNyh2jtWxG+ym1AQCtgVSN1siRfKBt/ecZyFH/zM3mTitZQpHx
YLGcCX7LAgEA0778KLIAnTMmVt8ALq4aXM9OgL129StWTXvUFRfwoQw=
=PSJA
-----END PGP SIGNATURE-----

--52ae76bdb3242d139b9cd90816394532086fbea318665e9db489edf2215c--


--===============3885989617918272381==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3885989617918272381==--

