Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 188A5C83032
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Jun 2025 12:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:Subject:To:From:Cc:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1bknWZvGH1AEAZxEy7+F32IQNc+JBI5DhhE74ElKHcQ=; b=SJ7F0wLROMDP2J8stDuIXw/EM9
	rs/HuiiMlvX3yD0l4lc3xKEilYtOFsofOuFL6KEVVa1YTbXGemzwUbqNrq/Cgwm1df31nJOC4H5WC
	UKx7EQA+ePY0BMRIp3sgvqOMj7eKm+ivVxe26eOPYi3Omlj5fJHEvA5T7bA+S/iE06pmjX7Yh+Uh4
	f99TCFqxVXxoYTPvqOs51S39YCq017+8sYbaczg0tBN22pfxwa/X2vUWUp7Rdai2WxzXQTEaRJjch
	BjH+7MEEQXKwk3dZwuFFFBkkDMb3/vZQEtCBIBLQehbYjjyS5vD/Qk6/WRMIuPO7GRyS7stcswi46
	M/SIelOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWDfp-00000002Bg5-1IRQ;
	Mon, 30 Jun 2025 12:31:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWDAW-000000027Xd-1XgV
	for linux-mtd@lists.infradead.org;
	Mon, 30 Jun 2025 11:59:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E863B45926;
	Mon, 30 Jun 2025 11:59:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71C0CC4CEE3;
	Mon, 30 Jun 2025 11:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751284767;
	bh=DQt1On5C3yb7MU1h31UXNttYeY/8Dh0cUT5vA2GmCLA=;
	h=Date:Cc:From:To:Subject:References:In-Reply-To:From;
	b=kXcp9OauuLJxjMuKOWX5cfhOpr/gUw4Q6zwvTPfX72fOTKe4Q+1EQjEQ9HSxuuAuc
	 DdeAWhwgw7owfz6c/8lxH4Qdwjz2WrkSBfEUxgOXiIP9v48X3SooJAyDlSLZFmosm1
	 Bd0mDKNpO79kZu8eo89a3YmO/mf9kAqN1WnTs5FdRoHOPEEvbGuu95mPUQ/GA3UBA0
	 i5kD/X5SGIsN5CaJfYsBUyR2J1R+kn9x/kF1v241tmN1QzYymBYPAfS1yXbWcRe8fQ
	 1Vj33u+naT8qY/bIMia+PzUNJi7/wmxwNnQCZWry3WvdWDsI3NkYuKY6r7oe7Gj6BL
	 UO4az0KaEjrgw==
Date: Mon, 30 Jun 2025 13:59:23 +0200
Message-Id: <DAZUMXW900R8.196NNPD9CWDCJ@kernel.org>
Cc: <hhlee@google.com>, <linux-mtd@lists.infradead.org>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <roccochen@google.com>,
 <tudor.ambarus@linaro.org>, <vigneshr@ti.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "Ssunk" <ssunkkan@gmail.com>, <pratyush@kernel.org>
Subject: Re: [PATCH v2] Add support for XM25LU64C
X-Mailer: aerc 0.16.0
References: <mafs0ecwarovz.fsf@kernel.org>
 <20250630105503.4673-1-ssunkkan@gmail.com>
In-Reply-To: <20250630105503.4673-1-ssunkkan@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_045928_427693_A50E1A1E 
X-CRM114-Status: GOOD (  19.68  )
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
Content-Type: multipart/mixed; boundary="===============5563173435588349913=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============5563173435588349913==
Content-Type: multipart/signed;
 boundary=6d3251704dca1acc7ad568c44463856c1abdde0a293ec8928df8bb1e3edf;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--6d3251704dca1acc7ad568c44463856c1abdde0a293ec8928df8bb1e3edf
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Jun 30, 2025 at 12:55 PM CEST, Ssunk wrote:
> The device is produced by Wuhan Xinxin Semiconductor Manufacturing Corp. =
(XMC)
> and found on some routers from Chinese manufactures.
> We need to add this chip to google's AVL

What is google AVL?

> The flash ID was incorrectly set to 0x16 0x41 0x17.
> Update to 0x20 0x41 0x17 as per the datasheet.

This is not something what you put into the commit message.

> The data sheet can be found here:
> https://www.xmcwh.com/uploads/954/XM25LU64C%20_%20Ver1.5.pdf

I get a 404 here.

> Signed-off-by: Kankan Sun <ssunkkan@gmail.com>
> ---
> Changes in v2:=20
>  - Fix flash ID from 0x16 0x41 0x17 to 0x20 0x41 0x17 (datasheet confirme=
d).
>  drivers/mtd/spi-nor/xmc.c | 5 +++++
>  1 file changed, 5 insertions(+)

NAK.

This flash probably supports SFDP. Pratyush and Tudor have
already asked that and there was no answer as far as I can tell.

That is also probably why the flash was working with your v1
although the ID was wrong. Or you don't even test your patches which
would be even worse.

-michael

>
> diff --git a/drivers/mtd/spi-nor/xmc.c b/drivers/mtd/spi-nor/xmc.c
> index d5a06054b0dd..bc7b1a2afa9b 100644
> --- a/drivers/mtd/spi-nor/xmc.c
> +++ b/drivers/mtd/spi-nor/xmc.c
> @@ -19,6 +19,11 @@ static const struct flash_info xmc_nor_parts[] =3D {
>  		.name =3D "XM25QH128A",
>  		.size =3D SZ_16M,
>  		.no_sfdp_flags =3D SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
> +	}, {
> +		.id =3D SNOR_ID(0x20, 0x41, 0x17),
> +		.name =3D "XM25LU64C",
> +		.size =3D SZ_8M,
> +		.no_sfdp_flags =3D SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
>  	},
>  };
> =20


--6d3251704dca1acc7ad568c44463856c1abdde0a293ec8928df8bb1e3edf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaGJ8HBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hfWQGA0Yg8ppE0P4UQ8vjMxgHQ10/4h9jsfsEI
Lc8AStb7zINE2yHEXhrRcJKi2DO5YVD0AX9XWTK4I5nc+sN4Y3rrkbZzjGzoUba5
d/e0J4J0SP6jjd1xD1ISdSF8pU0C1Ad2ung=
=cV4X
-----END PGP SIGNATURE-----

--6d3251704dca1acc7ad568c44463856c1abdde0a293ec8928df8bb1e3edf--


--===============5563173435588349913==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5563173435588349913==--

