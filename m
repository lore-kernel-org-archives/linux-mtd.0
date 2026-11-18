Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F47606A335
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2026 12:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pNqutWGm;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256 header.s=mail2022082101 header.b=GB3KloGp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rbByhzJlbUoFQXWqUzG6Dw3J6aGpfd2Wtzys4WF7iGE=; b=pNqutWGmsRB4rRILBeNc30dOgD
	AbkVv1zC0f6P7RdWV34k2iG4A/26xxQ9UU60mcoryNDXRrdcLCCiopKVNRbiQP3e3DKqPercA4nxq
	DJyVIVZfdPwO1rnFCkHtFyQU07daibe1R0tihmB+T7pdpEOlCJ+YJJKxEtasy3iDF9B82/DERYsb4
	3yow5/klKNjI5ULkuopvF9dxR4nyRaYCuy8u/m2y2Th0wTjMsDOP4ApaWtKHqrYvVWfTBB5VabfX9
	6IZY1OiAo2+k0Zet9IonwFx0X+7i57tKmq7W+Ft35SSaMnMINlWc8wT+1dhUAMdYpCGmzH1JZ4HPr
	jmEtZ6gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTeV8-00000008oRp-0cz7;
	Wed, 18 Nov 2026 12:10:58 +0000
Received: from 0001.3ffe.de ([159.69.201.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTeV5-00000008oQ2-1sam
	for linux-mtd@lists.infradead.org;
	Wed, 18 Nov 2026 12:10:56 +0000
Received: from localhost (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 0E1816BD;
	Wed, 18 Nov 2026 13:10:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1795003842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QCr7roC1+1Ps5FfmFeUaWZRyJXGQJS+ufHB6t/Qd++U=;
	b=GB3KloGpCL6gKdNXfaVO5H/7pKTb6SOZqITMvkZhuonLM+5k4kQAHfh5+x5gI2nhmB5pu0
	2SFTkXO65uncnVBEjkAoqU2zZ4W788f0fo4bjLBwBwBQriZ951Twy58+qxc7GAnAfw1OrE
	WSz582V1+fObbZD5SvF4djjElLfQuIQ0c5lDED7QiH+jus7nNYceuWqUhMNz8D7E9iUOMf
	vtaopJHbD6QkhBp5yaYrtWQfv6JJrJmba1NzL+eWzvO5SoB6SOW2LxI8Mn3iS/qIrKb1gs
	PdjbEvzwGEkz4mzsEDqQ3QhbjFPF/wcxVKP4H7t6FiB3Cvqc9AN5YfmgrFVOMA==
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Wed, 18 Nov 2026 13:10:38 +0100
Message-Id: <DMYBR7I0R1PK.25FUNB24SPCFS@walle.cc>
Subject: Re: [PATCH v5] mtd: spi-nor: clear the default read_sr2 opcode for
 Octal DTR flashes
Cc: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <imx@lists.linux.dev>, "Haibo Chen" <haibo.chen@nxp.com>,
 <stable@vger.kernel.org>
From: "Michael Walle" <michael@walle.cc>
To: <haibo.chen@oss.nxp.com>, "Pratyush Yadav" <pratyush@kernel.org>,
 "Michael Walle" <mwalle@kernel.org>, "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>
X-Mailer: aerc 0.20.0
References: <20261023-spi-nor-fix-v5-1-bb6e0ce21169@nxp.com>
In-Reply-To: <20261023-spi-nor-fix-v5-1-bb6e0ce21169@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_041055_649650_088DA381 
X-CRM114-Status: GOOD (  17.85  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8201391412222810747=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8201391412222810747==
Content-Type: multipart/signed;
 boundary=eed9819ffa9d9d482d7f2e70e9c7fdf48b9e50eeb17e32951c98b41d269b;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--eed9819ffa9d9d482d7f2e70e9c7fdf48b9e50eeb17e32951c98b41d269b
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Oct 23, 2026 at 9:11 AM CEST, haibo.chen wrote:
> From: Haibo Chen <haibo.chen@nxp.com>
>
> The core defaults opcodes.read_sr2 to the legacy RDCR opcode (0x35), and
> spi_nor_cache_sr_lock_bits() reads SR2 during spi_nor_init(), i.e. after
> the flash has been switched to its runtime protocol. On an octal flash
> running in 8D-8D-8D mode the opcode is extended per cmd_ext_type (e.g.
> 0x3535), but RDCR is not a valid register read there: these parts access
> their status/configuration registers through a vendor-specific indirect
> space, if at all. The flash does not answer, the register read times out
> and probe (or resume) fails (on i.MX FlexSPI: -ETIMEDOUT and a controller
> WARN(), seen with a Micron MT35XU01G and a Macronix MX25UW51345G).
>
> Clear read_sr2 on every path that enables 8D-8D-8D, so that
> spi_nor_read_sr1_and_sr2() degrades to an SR1-only read and no
> unsupported command is issued. A manufacturer driver that genuinely
> needs an SR2 read in this mode can still install its own opcode in a
> later fixup.
>
> - spi_nor_parse_profile1(): the common case. The xSPI Profile 1.0 table
>   does not describe any SR2/RDCR read, and it runs before the
>   manufacturer late_init.
> - mt35xu512aba_post_sfdp_fixup(): some mt35xu512aba batches lack the
>   Profile 1.0 table and enable 8D here instead, with the BFPT QER field
>   left at a reserved value so read_sr2 keeps its RDCR default.
> - spi_nor_no_sfdp_init_params(): non-SFDP parts that enable 8D via
>   SPI_NOR_OCTAL_DTR_READ keep the RDCR default too.
>
> CMP (the only user of SR2 beyond quad-enable in the locking code) is
> Winbond-specific and is not placed in SR2 on their 8D-capable parts, so
> no octal flash loses a usable SR2 read because of this change.
>
> Fixes: 63489002d397 ("mtd: spi-nor: Refactor Read Status/Write Status sup=
port")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>


Miquel, if you want to pick it yourself for fixes, otherwise I can
also push it there.

In any case,

Acked-by: Michael Walle <mwalle@kernel.org>

--eed9819ffa9d9d482d7f2e70e9c7fdf48b9e50eeb17e32951c98b41d269b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKcEABMJAC8WIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCav2VvhEcbWljaGFlbEB3
YWxsZS5jYwAKCRASJzzuPgIf+CFJAYDxLl7cPQOrF+auKE+a+zNjZULEGQOubSo+
GmacBs7M11Hw9NG1fXImSX6CntrT/sUBf2mG9P1sp3kZlSnIJ6WhAcGkF/PYoWJf
B8J2UevRceBo1KsBCHjfDS4iMQ7AqQhkig==
=Mg6W
-----END PGP SIGNATURE-----

--eed9819ffa9d9d482d7f2e70e9c7fdf48b9e50eeb17e32951c98b41d269b--


--===============8201391412222810747==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8201391412222810747==--

