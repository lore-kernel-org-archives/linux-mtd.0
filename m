Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03777E98E0F
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Feb 2026 09:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N3zDgLQTANVUIIiORxBae9l3EmxEHnCRtyOK0Vgqz+s=; b=YoymTZ20mbsa14tiRyjBpc2fcm
	dhFbeiCl4T1AuB/3YC+7PKlVDTpLaqLlpTdKYp6mBs7EEsHXo4m1/T0t2pmLNH1x/HnrHBgWoUsnm
	5J3rA9/Z60AUyz1wBPWVF8Y6PWQNdkGkJWN8uw94IujdmGCGbtRf33TltUBXK0SNloSbSQqFCmUWF
	baM4gbtQjleavX5/A+oRPyeBFrveYjEgu52rBChiv96+Qy3ickSsD//PrAT3+PHWav7jheVp//maC
	+fxoMbTbxlIhNxoHfu9L6qtQh3/Ap8DHg/x5GANIWBUvmuJghEXCAlRUC6L2Z+13yFXIPlhD89lOf
	heqHrYfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuSFs-0000000HXR9-2SDy;
	Mon, 23 Feb 2026 09:29:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuSFp-0000000HXQj-2PEi
	for linux-mtd@lists.infradead.org;
	Mon, 23 Feb 2026 09:29:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7FE48432CA;
	Mon, 23 Feb 2026 09:29:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AE1BC19421;
	Mon, 23 Feb 2026 09:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771838964;
	bh=qSc8GpjmV8N4ESmmtoyex8meT32NYtvc0z27Ol22oBY=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=Fp7TxbYfRJ5481Vdo9QJM9dPqJgvg1E1O1mnF6BNpUF6Xdoi1VVrNAhpVPa3L6sEQ
	 n0cfQ5fmYCAyikDxWMi/lniSdpOLEwjm55C3nzOL108Tbumr6RYbrhrJ9zeMyk+5aJ
	 xDJy4f2dOxPBFrb8sOQiLdEZU3H0kvkWMbOkMPckE3KUCQv7wL0PSRti3ALWjYOevn
	 5x4c/Fqups+tmKAqPX3YiW0iDo68lJuwdB+Yk/1L62wGy8MCI1X+JCo254VaGzv0YE
	 E/tzJQun95dLQEY1qjDYxshd9wmfgNUcEavoK/Uep1X42CJ4XN1P8YEu/H8XlpOf/0
	 1vcXj3Wz5+Q9Q==
Mime-Version: 1.0
Date: Mon, 23 Feb 2026 10:29:20 +0100
Message-Id: <DGM8HPC181AF.3FCCS4MIE4A43@kernel.org>
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: sst: Fix write enable before AAI
 sequence
Cc: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <miquel.raynal@bootlin.com>, <pratyush@kernel.org>, <richard@nod.at>,
 <sanjaikumar.vs@dicortech.com>, <stable@vger.kernel.org>,
 <tudor.ambarus@linaro.org>, <vigneshr@ti.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "Sanjaikumar V S" <sanjaikumarvs@gmail.com>
X-Mailer: aerc 0.20.0
References: <DGM6ZPOT1WCR.157JI0LW4W3E8@kernel.org>
 <20260223091733.47-1-sanjaikumarvs@gmail.com>
In-Reply-To: <20260223091733.47-1-sanjaikumarvs@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_012925_796472_B926B1C3 
X-CRM114-Status: GOOD (  20.77  )
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
Content-Type: multipart/mixed; boundary="===============7768480872581008421=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============7768480872581008421==
Content-Type: multipart/signed;
 boundary=adf5d6bf2817c52630721166249761492ef851abe98547b5f7470d47818c;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--adf5d6bf2817c52630721166249761492ef851abe98547b5f7470d47818c
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Mon Feb 23, 2026 at 10:17 AM CET, Sanjaikumar V S wrote:
>> Raises concern about writes ending at odd offsets potentially
>> having the same issue
>
> The odd end address case (trailing byte) is already handled in the
> existing code at lines 243-255:
>
> /* Write out trailing byte if it exists. */
> if (actual !=3D len) {
>     ret =3D spi_nor_write_enable(nor);
>     ...
>     ret =3D sst_nor_write_data(nor, to, 1, buf + actual);
> }

Ah, I must be blind. I stopped reading at the write_disable.

> So write_enable is already called before writing the trailing
> byte. My patch only addresses the odd start case where BP clears
> WEL before the AAI sequence begins.
>
>> Suggests simplifying the conditional logic by removing the length
>> check
>
> The condition `if (actual < len - 1)` avoids an unnecessary
> write_enable when len =3D=3D 1 (single byte write at odd address, no
> AAI follows). But if you prefer unconditional write_enable for
> simplicity, I can change it in v3.

I know, but I actually don't like repeating the condition in the for
loop. So I'd prefer to have a local "needs_write_enable" boolean
which will be set to true. But then, I wouldn't care too much if
there is a write enable followed by a write disable for a rare case.

>> Notes the patch lacks runtime testing
>
> I don't have the hardware setup to test odd-address writes at the
> moment. The fix is based on code analysis. I have tested patch 2/2
> (dirmap fallback) on hardware.

I'm hesitant - because like I said, if there is really a bug - it
would have never worked correctly, since day 1. But yeah, I've also
read the datasheet and it clearly states that the byte write will
clear the write enable latch.

> Please let me know if you'd like me to send a v3 with the
> simplified unconditional write_enable.

Please see above.

-michael

--adf5d6bf2817c52630721166249761492ef851abe98547b5f7470d47818c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaZwd8BIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gD+AF+PMpnOIUXZU15ZBDAvkgvNBLt4H5g2WC7
aDt3o03I0g2/SHw0sv84Dd1FQiMqqAVxAYCjWOam711N/Ut6j2f+6MXK9h9dIcwO
dmEauy79oSIIyC7Q8J0sTI1nFnBaJSKRk+k=
=CCQO
-----END PGP SIGNATURE-----

--adf5d6bf2817c52630721166249761492ef851abe98547b5f7470d47818c--


--===============7768480872581008421==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7768480872581008421==--

