Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED822CD5BD5
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2026 13:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:From:Cc:Subject:To:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=60bCjHzyXy9Izc9SwSQn82hnsWVUnwIhRQZrrJyvEyc=; b=yKikbac/QwLQ5+PCyzHYZnnBl5
	bTnB8Naf2+irhS+cMIXfSbU64HA0tB9xpgMlX+aiE21mr+TwR+SpAeoG5wCEehmk7Tq2bbhyj/K2N
	0tpuGhBQMCisZpzx9TZjY2gwdw/8OCJvCA89QCnKNh/DECzdRqUKmyHEg0PK0pXyGg9aWWdxIh8ny
	1xMNgQwDiYErAKx2XMJdpkyJT0KPsQebgw4vXO/MeuB7ZFNc1OShTcXIhlA3lf2lpcvlml1CCNMFh
	oZOHtRsBZkz8YfuneLn0+57FZ7ZODdTVLCCyvrG3Qfopyqe81VGlOS0bvBOCsd6ibx/3RJG2QgOur
	hdspqedw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSDue-000000049Dl-3HNQ;
	Wed, 27 May 2026 13:03:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSDuc-000000049DD-3JJx
	for linux-mtd@lists.infradead.org;
	Wed, 27 May 2026 13:03:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id 70E9D43B2C;
	Wed, 27 May 2026 13:03:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id C77A21F000E9;
	Wed, 27 May 2026 13:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779886986;
	bh=1BhftPsWNr/zYqyqfqybYzGSTTuG87AZB5k66wycOdg=;
	h=Date:To:Subject:Cc:From:References:In-Reply-To;
	b=dhNVp7xzlDE5nyGDjE9T1Siyyj2OHCe6LiiTgAMvPigXOloDatMeDapJztCUks7Hx
	 0KCoBaaDhxkqs9x6dzy+q8BHu/fJdJjVmq4yz9iWLgCZNlMw+hJgHEmGjgYDdO/yRi
	 8xUWumVB3uTWtgNf1fLn9KxYZLrFuJF61NhKmtMeoim+ktr6g4c4aHg3Um+xsNLYAp
	 HUQlSK9/JN8Aebt/4ZmW438QBMXvCl8z+Y/kcR5zQd3YYKC0ZanExmeNUgvKFTz88x
	 fD52GvU1fUOPN35QNDH4ls7B3TXcmHZt7rXELI+RUyKzAMk3vKkf+AFginjfYebypP
	 tRJVPk0bt5lcw==
Mime-Version: 1.0
Date: Wed, 27 May 2026 15:03:02 +0200
Message-Id: <DITH9ZS58ACZ.33DMIXVXGV1HN@kernel.org>
To: <tkuw584924@gmail.com>, "Tudor Ambarus" <tudor.ambarus@linaro.org>,
 "Pratyush Yadav" <pratyush@kernel.org>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: spansion: use die erase for
 multi-die devices only
Cc: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, <stable@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.20.0
References: <cover.1779872008.git.takahiro.kuwano@infineon.com>
 <3e0a6329c1fdc40324f847d9758d53eee2036e3c.1779872008.git.takahiro.kuwano@infineon.com>
In-Reply-To: <3e0a6329c1fdc40324f847d9758d53eee2036e3c.1779872008.git.takahiro.kuwano@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_060306_850697_0CB5769C 
X-CRM114-Status: UNSURE (   8.09  )
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
Content-Type: multipart/mixed; boundary="===============0860062954482720960=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============0860062954482720960==
Content-Type: multipart/signed;
 boundary=01a7148aac2eec50f70580bf01568d97db4ff1514413b8fba5ec521e61c0;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--01a7148aac2eec50f70580bf01568d97db4ff1514413b8fba5ec521e61c0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed May 27, 2026 at 11:05 AM CEST, tkuw584924 wrote:
> From: Takahiro Kuwano <takahiro.kuwano@infineon.com>
>
> Die erase opcode is supported in multi-die devices only. For single die
> devices, default chip erase opcode must be used.
>
> In s25hx_t_late_init(), die erase opcode is set only when the device is
> multi-die.
>
> Fixes: 461d0babb544 ("mtd: spi-nor: spansion: enable die erase for multi =
die flashes")
> Cc: stable@kernel.org
> Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>

Reviewed-by: Michael Walle <mwalle@kernel.org>


--01a7148aac2eec50f70580bf01568d97db4ff1514413b8fba5ec521e61c0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCahbrhhIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jq/QF/RqH00r+krlGhwF+kIDK7uWuQAEAgAv8e
vzJ6Totdg4srH4GaewG1bXLJ9LKF4Ca4AXwJlA4D3Vs6UD16klH7iYJKnggGd39H
LoZ+Uizq3nNF+FgoH+zTZFnRZTbmUndVXh0=
=QiqL
-----END PGP SIGNATURE-----

--01a7148aac2eec50f70580bf01568d97db4ff1514413b8fba5ec521e61c0--


--===============0860062954482720960==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0860062954482720960==--

