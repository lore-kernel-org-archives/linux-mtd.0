Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A959F8925E
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2026 11:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4nf24nSZNVzHju7qudgegWrxfPtci/rMjVCpXE+rp+0=; b=Bd+r1W+gQH6KVPyLRB+zsNU2bH
	O1sRaIkKkX1ELSDe9sevcPuYba9OzI5sihgVOtHMVLA/SRtiLB402/N9Yqwg2unw/E8Xb1SbJUaIR
	vz0OIk9+iVWTHbgzGf3BhRvlB6YM/b/Q1EtlGfdpIRoRDdtMAMBKXPdyVtfNdLBmyEy3H0URf5O5n
	TU96fTTEJOaY5y4RXmp2p9KMhRhwf6uyDp1o5hgQb9kzcR747I0Dmvniw0SIEIINjiFfU9kjrMZNH
	7ZOeP09hLNCq7UcGqFHrP/b7wzn1KfnOBG6YJ1ys3pRMVtT1vYEluQL2SEvtEZOFhxgjmlFVGg+C8
	TKOh3zoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF9KP-00000008WXd-31O1;
	Tue, 21 Apr 2026 11:31:41 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF9KN-00000008WVZ-0uRd
	for linux-mtd@lists.infradead.org;
	Tue, 21 Apr 2026 11:31:40 +0000
Received: from localhost (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 89D296BF;
	Tue, 21 Apr 2026 13:31:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1776771087;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hhuFXO06bOWCEdQdbRTwVTgeyM0AujBkhd+2NkK3l9w=;
	b=IBi1306Xp2a7BD4ZWoIujYfFV3vZRXxdwTV9OeillI8sKbEIEA+rpMtXgudjsvIogfqs8f
	yolJqnt85aODRotApLBIlZ7aSc7sNRZzVXZNfypnLfLPwYFygm17nGblteHEDxGs/gHMZJ
	AcAcrtW569pj4ZbufPsANYSErX16kbP0SLJjfvDkqowavhjswsUmqYG0+NP9aU1OHJBG65
	BEGMr5aeouoXlFIJe0ae4EuEe4zlH6GAhqZqnC2OspEWsJ51R7wcWsV0IR9JVnIagW1fsv
	BGK2FkEqUI9dHyH5RxiMDdSKWln9Iyky3KEyQFjINXGH/uDS3sRC8bW/TjuqsA==
Mime-Version: 1.0
Date: Tue, 21 Apr 2026 13:31:25 +0200
Message-Id: <DHYSS8G7AU19.2K78IJHZUMHYT@walle.cc>
Subject: Re: [PATCH] mtd: spi-nor: debugfs: fix out-of-bounds read in
 spi_nor_params_show()
Cc: "Pratyush Yadav" <p.yadav@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
From: "Michael Walle" <michael@walle.cc>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Michael Walle" <mwalle@kernel.org>, "Takahiro
 Kuwano" <takahiro.kuwano@infineon.com>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>
X-Mailer: aerc 0.20.0
References: <20260417-fix-oob-read-spi-nor-v1-1-2132e61a684a@linaro.org>
In-Reply-To: <20260417-fix-oob-read-spi-nor-v1-1-2132e61a684a@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_043139_413340_690ACBE1 
X-CRM114-Status: GOOD (  12.29  )
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
Content-Type: multipart/mixed; boundary="===============0834963059076042281=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============0834963059076042281==
Content-Type: multipart/signed;
 boundary=a992d56beca61ff579dbf32576fdc45441f3dd00ff95a0dc2cdd6b1bcd39;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--a992d56beca61ff579dbf32576fdc45441f3dd00ff95a0dc2cdd6b1bcd39
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Apr 17, 2026 at 5:24 PM CEST, Tudor Ambarus wrote:
> Sashiko noticed an out-of-bounds read [1].
>
> In spi_nor_params_show(), the snor_f_names array is passed to
> spi_nor_print_flags() using sizeof(snor_f_names).
>
> Since snor_f_names is an array of pointers, sizeof() returns the total
> number of bytes occupied by the pointers
> 	(element_count * sizeof(void *))
> rather than the element count itself. On 64-bit systems, this makes the
> passed length 8x larger than intended.
>
> Inside spi_nor_print_flags(), the 'names_len' argument is used to
> bounds-check the 'names' array access. An out-of-bounds read occurs
> if a flag bit is set that exceeds the array's actual element count
> but is within the inflated byte-size count.
>
> Correct this by using ARRAY_SIZE() to pass the actual number of
> string pointers in the array.
>
> Cc: stable@vger.kernel.org
> Fixes: 0257be79fc4a ("mtd: spi-nor: expose internal parameters via debugf=
s")
> Closes: https://sashiko.dev/#/patchset/20260417-die-erase-fix-v2-1-73bb70=
04ebad%40infineon.com [1]
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Reviewed-by: Michael Walle <mwalle@kernel.org>

--a992d56beca61ff579dbf32576fdc45441f3dd00ff95a0dc2cdd6b1bcd39
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKcEABMJAC8WIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaedgDREcbWljaGFlbEB3
YWxsZS5jYwAKCRASJzzuPgIf+P5pAX4+w/PCCqkj8/+nFtLJAU2g7jDhH9ZBAh0j
aEgznV9hRDXp3zPhk+uukvCt/VCRFbUBfjXPmZwavXvJ6TmduqJG5oEqM2bomxH5
n3U8iB017VVnUmndo44akDUShbZOgSfNgA==
=kKJO
-----END PGP SIGNATURE-----

--a992d56beca61ff579dbf32576fdc45441f3dd00ff95a0dc2cdd6b1bcd39--


--===============0834963059076042281==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0834963059076042281==--

