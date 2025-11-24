Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD086CFA466
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Nov 2025 08:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AUTtONdtjfY3rt0wV7DBPblaBtNEN0UrQ0pyzNFEKlA=; b=AOScVUvNFNgotquKyPSQrJ8qYh
	vRIGndugvCOjxHvLUus1jhkpb1Ib2IJPAuht55V7cIaUHbsFzVNcJ7o8OOD2K0kwgKItrPgA6t+qO
	Ei1SuZnmOaybE6RyMKLIYOBLid277+mqw+0IBFYP7a5Kq09Ai+ft/ZpIuQmDa0/6freRvKwCI8xBh
	tMKKQKNtIQsVk965O2V8/x259ZQ3CxApwBogx3SwrhEZtBBOVY8Lmr/8DGGN2gLMBxY+vMsUh5qi2
	k3w0uHJ01/r2kQiyNMTweHL7TFEPw49JX0RXDVaiGRRv9F2gJDbRfy2LZIec9KKQDgZLdSM2Czwcz
	DBbLAXEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNRgs-0000000BGof-3KTh;
	Mon, 24 Nov 2025 08:12:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNRgq-0000000BGoC-2wkp
	for linux-mtd@lists.infradead.org;
	Mon, 24 Nov 2025 08:12:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1C31B442DB;
	Mon, 24 Nov 2025 08:12:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D738C4CEF1;
	Mon, 24 Nov 2025 08:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763971969;
	bh=NqKds7QMWLKQX4MjOjMkz4dJXq2wzV037b+Ld3Y8wkw=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=HPTQ5KXy3EdnDwONZELSRl+kjQRij63MYGaHJ2fFSUarsPOtS/1rJL4uurk57rXME
	 V5BgCXE6GbW1Ju259wzTpqW793Zun28jbuFbB/lIa8Vw5H+n8l0e9vQuvneBdBp/DE
	 AHdpn0VOX2UQ80o9Mwfj43RfkjKVs3CKf7+sCbol6KY3mVmCg/G8XozRGRldqA0vFC
	 LNiH0pfncsAXNkXd05kal4PrmiaXnMt7GA1EmgbEDgiYjv69xzJwQje8RCi5uPtp/b
	 mWns+XmEX//A5Ku4pHQQAOvMQASp9/qGkPMEmRuh71nZvKDZsbF7BuCiWjCx519M2m
	 Os3bYZ9/aB71Q==
Mime-Version: 1.0
Date: Mon, 24 Nov 2025 09:12:38 +0100
Message-Id: <DEGRVEN1ZNUY.OCJLFWDG8XD4@kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: Fix w25q01jv flags
Cc: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Richard Weinberger" <richard@nod.at>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Marc Olberding"
 <molberding@nvidia.com>
X-Mailer: aerc 0.20.0
References: <20251121-w25q01jv_fixup-v1-1-3d175050db73@nvidia.com>
 <87jyzfzwpw.fsf@bootlin.com>
In-Reply-To: <87jyzfzwpw.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_001252_764591_CDBB8FCE 
X-CRM114-Status: GOOD (  10.85  )
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
Content-Type: multipart/mixed; boundary="===============2973832938762960799=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============2973832938762960799==
Content-Type: multipart/signed;
 boundary=b172061d775e4b39b2e4c48db751ee06c10ef74f4a535a36d0cd7a199c48;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--b172061d775e4b39b2e4c48db751ee06c10ef74f4a535a36d0cd7a199c48
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

>> +		.no_sfdp_flags =3D SECT_4K,
>
> This one is the right fix and should stand alone in its own patch (first
> in the series if you add support for the block protection).

Only if that flash really doesn't have SFDP. But since the entry
didn't have a size property the flash *must* have SFDP in the first
place.  Otherwise it won't even be probed. Please provide a dump of
the SFDP tables, see [1]. Also please provide the contents of
/sys/kernel/debug/spi-nor/spiN.N/params.

-michael

[1] https://docs.kernel.org/driver-api/mtd/spi-nor.html#minimum-testing-req=
uirements

>
>>  		.fixups =3D &winbond_nor_multi_die_fixups,
>>  	}, {
>>  		.id =3D SNOR_ID(0xef, 0x50, 0x12),
>
> Thanks,
> Miqu=C3=A8l


--b172061d775e4b39b2e4c48db751ee06c10ef74f4a535a36d0cd7a199c48
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaSQTdxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jMEAF/WCmUpLl2HfzStyMsSt4SFDzS3r2PIbw3
S6TXBTI7687Z+lLxcAPTC55lv8qAmiwzAYC1bJJGQZ78zVFwl3CeVTAbu0zNltN8
wst4p2tpdokvU7PHSfcE9RpyBDvqkkxmUZc=
=azcR
-----END PGP SIGNATURE-----

--b172061d775e4b39b2e4c48db751ee06c10ef74f4a535a36d0cd7a199c48--


--===============2973832938762960799==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2973832938762960799==--

