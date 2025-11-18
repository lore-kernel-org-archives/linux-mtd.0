Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6657CEBF92
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Nov 2025 09:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3sBhowqSq7Su80gVmd2s0+XNcHKAnsNuXLDSGKQ/Tvk=; b=LQSK4wP5V4DmgSpIToqyPK2wa0
	YwT0k4scq27Kvq68yCvZ9S14etndqrWDA5gNOTa+BpKltDDbGi6vP1M0g4GYH6IMrUDDEoDS3Y1q/
	AFpZHAVe1yQPsY8W42239lDfvZlLXVZZ9wuQI3qz1s9dfkcUx5Hk3ihFfBTO5WSS1YH8myQpkU1p6
	CjVn+k141hfDmmVo6qZC3y01XZr2ovEIaXctV97vie+eQBa0BNrCjw2j2GSAV/aWaYg8QjQnii8Vf
	okiBAMGcHraTgmNjfcEzc7ja0w7oXnvC+rvu/2rik9iIkl3BdzQT1gm93ng4JrwBw4giVrJ1Hql+e
	fujdqYDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLHue-000000009Rg-41tu;
	Tue, 18 Nov 2025 09:22:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLHuc-000000009RB-2fNQ
	for linux-mtd@lists.infradead.org;
	Tue, 18 Nov 2025 09:22:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D7E2243691;
	Tue, 18 Nov 2025 09:22:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF326C2BCB6;
	Tue, 18 Nov 2025 09:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763457727;
	bh=cicC6ikllzlcaCehJIRXdn7UAs4wGJNz+Kpn/QZMzKQ=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=HKvfn7Dew+r2WEOvR3GAW70Ou1Y1OsrneyH2+TmsV34vVIywv02CrySVfrzM5PBqF
	 NXMovihAN+moLRtR5o9yi7JsmEBSAd131LyO3FjOzo1bBk6Qd50TMhmkJk8frYjhJb
	 O7uYajZEw26CTSc8O8glPhPV+VJUdWGJ+YhAiMLiYESs9I4k9r82pgvMsh1THV2ymc
	 VRQKRbJlYL4qVAcKHEviJqXzjAW/dzgLe8/WQQh62wAumb05nD4Roxs2aRlise4m2y
	 tPbXuvbP60iyXUUjlB0o9BN4qr9Pl1GFWkEtlPxTC5rKSIn2qMfV+ZQTA2U/BYGp5F
	 1/fcn6ceHt66Q==
Mime-Version: 1.0
Date: Tue, 18 Nov 2025 10:22:02 +0100
Message-Id: <DEBPL9ORUVZY.124RXZH34EBBB@kernel.org>
Subject: Re: [PATCH 03/19] mtd: spi-nor: Improve opcodes documentation
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
References: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-0-487bc7129931@bootlin.com> <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-3-487bc7129931@bootlin.com>
In-Reply-To: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-3-487bc7129931@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_012210_715914_670574DA 
X-CRM114-Status: GOOD (  15.47  )
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
Content-Type: multipart/mixed; boundary="===============1222709046157759340=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============1222709046157759340==
Content-Type: multipart/signed;
 boundary=2eec54e9365629b0a5b17971cee8ee891bc71cb5f2eba468934e7f3534d8;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--2eec54e9365629b0a5b17971cee8ee891bc71cb5f2eba468934e7f3534d8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Nov 14, 2025 at 6:53 PM CET, Miquel Raynal wrote:
> There are two status registers, named 1 and 2, all the opcodes imply a 1
> byte access. Make it clear by aligning all comments on the same pattern,
> for the four "{read,write} status {1,2} registers" definitions.

Not sure, what you mean. The current comment implies 1 byte access.
But that is wrong because the WRSR can be used to write both the SR1
and SR2 (or sometimes called CR).

With that fixed:
Reviewed-by: Michael Walle <mwalle@kernel.org>

-michael

> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  include/linux/mtd/spi-nor.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index cdcfe0fd2e7d624bbb66fefcb87823bce300268e..90a0cf58351295c63baea4f06=
4b49b7390337d37 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -21,8 +21,8 @@
>  /* Flash opcodes. */
>  #define SPINOR_OP_WRDI		0x04	/* Write disable */
>  #define SPINOR_OP_WREN		0x06	/* Write enable */
> -#define SPINOR_OP_RDSR		0x05	/* Read status register */
> -#define SPINOR_OP_WRSR		0x01	/* Write status register 1 byte */
> +#define SPINOR_OP_RDSR		0x05	/* Read status register 1 */
> +#define SPINOR_OP_WRSR		0x01	/* Write status register 1 */
>  #define SPINOR_OP_RDSR2		0x3f	/* Read status register 2 */
>  #define SPINOR_OP_WRSR2		0x3e	/* Write status register 2 */
>  #define SPINOR_OP_READ		0x03	/* Read data bytes (low frequency) */


--2eec54e9365629b0a5b17971cee8ee891bc71cb5f2eba468934e7f3534d8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaRw6uhIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gNfwGA1yct2Qjoy0upeSglTUwnlnUKsZqbvQ0L
oszRORaINFV179D7irHIUgQh7iiHctUXAX91Iu2y4Gjv2pgfMaztgnWcf1FzOwFh
8gIxzIhVrCn6x15YfQZvzw/Zbb6NQO44ZI8=
=G3Ob
-----END PGP SIGNATURE-----

--2eec54e9365629b0a5b17971cee8ee891bc71cb5f2eba468934e7f3534d8--


--===============1222709046157759340==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1222709046157759340==--

