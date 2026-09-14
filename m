Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0CCCC88E72
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2026 14:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:Subject:To:From:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cS4SjdSkPOiAMWWBxK5u4t0St0VPg0z7zD/YfRdA2+0=; b=tLwWrrvzsSGrMt0QftqfHb5dwY
	qloaNJOhI3fUyyKU4hhxyDtdTRUfk88ogq8pJAgqyUvCjKl12bmjmUWGwadfyBjo4wxEG5NB8DB4f
	vZe3xUiNeyt5drx3JGiVTVDvJGdDPTithmcc83/MFxibjKzXF8kmhkHy5cBwK9K/pJfVkJpzls1dT
	ljlYArux6lsczrayqpHIcWZ75pehGSDS3WPE8xUlxoPjei860HZviGproBogfjjtAkmOkaN4/2aV5
	+10j12Ol4dcH/guhr1rlUf1iBuzQazV6zOnf50qSr4fF6a+Ivpp7Z9qF09Ey1jVyO5hNcSSYmBcql
	7VbllT3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x67Ic-00000003usH-2DjA;
	Mon, 14 Sep 2026 14:04:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x67Ib-00000003us7-37bV
	for linux-mtd@lists.infradead.org;
	Mon, 14 Sep 2026 14:04:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 327DB60120;
	Mon, 14 Sep 2026 14:04:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 66F2D1F00893;
	Mon, 14 Sep 2026 14:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789394684;
	bh=4UvBLqNBye9PbHAYAVSv51+Ycq/5kneBcsnxjMGGF/s=;
	h=Date:Cc:From:To:Subject:References:In-Reply-To;
	b=mjem+oUIuDEMNflIniaUaEGfzZ2Dvuc8B/Nl8O399qtKkGrah0dmlKf9mzBpx9j7j
	 5u8w0V0PU66pEIaKm7IlsGnxPveNfw5Fs/WMSfdnldhDwSuribuWN5Ki9wr+E7314o
	 kVjQCtSGMzevWBLwzEUoxhjwBZvg3m7zT25Yo+5Tg0yUWrxZ2eLF+Q19jj3E6E762a
	 2jNgnMITxopnKrl94xTJJoUn/BcVA7+nY5PwGIP9KLHSdQlF7Sl7VHTbrAqskuT5Tb
	 ztP+ecXMt+pDmJR4DSCvvdjXsX2xwgGAQfQ9bWkSM6k2mUBn0oUBFm3oP8uchv/Whs
	 5R5PpdfvJKAzA==
Mime-Version: 1.0
Date: Mon, 14 Sep 2026 16:04:40 +0200
Message-Id: <DLF3H41RCZJF.37WOY30CYJ4AY@kernel.org>
Cc: "Pratyush Yadav" <pratyush@kernel.org>, "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>
From: "Michael Walle" <mwalle@kernel.org>
To: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] mtd: spi-nor: issi: Add support for is25wx01g
X-Mailer: aerc 0.20.0
References: <20260914-mtd-spi-nor-new-issi-chip-v2-0-3cd4d7e434b2@analog.com> <20260914-mtd-spi-nor-new-issi-chip-v2-2-3cd4d7e434b2@analog.com>
In-Reply-To: <20260914-mtd-spi-nor-new-issi-chip-v2-2-3cd4d7e434b2@analog.com>
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
Content-Type: multipart/mixed; boundary="===============5744471401841972430=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============5744471401841972430==
Content-Type: multipart/signed;
 boundary=73224e4c0f3a263ea2f87dff3430fb651e1d994a3e10946ad5fb6eb997eb;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--73224e4c0f3a263ea2f87dff3430fb651e1d994a3e10946ad5fb6eb997eb
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Mon Sep 14, 2026 at 3:42 PM CEST, Nuno S=C3=A1 wrote:
> (*): I should note that the command actually failed with -EIO but it
> actually unlocked the chip! And the reason is because the flash as the sa=
me
> FSR register than the micron-st flash. So WEL is set to 1 but can only
> be cleared when clearing the FSR register.

Why doesn't this affect only the locking operation? WEL polling is
used also during write and erase.

> AFAICT, we should do something similar as micron so the writing to an
> actual protected region fails rather than being silently discarded with
> that status bit set. The question would be how to do it? The code is
> pretty much identical to [1]. The masks, the opcoded... So should we
> somehow handle this in the core (by having some common helper) that
> could be set in .late_init() under a common MFR_FSR flag? Or just keep
> both implementations separate for now?

I'd like to keep that out of the core.c, but also like to avoid any
code duplication esp. because there is already handling for the
intel spi controller in there. So maybe move it it into a new
common.c.

Apart from that, this patch set looks good to go.

-michael

> [1]: https://elixir.bootlin.com/linux/v7.2.5/source/drivers/mtd/spi-nor/m=
icron-st.c#L585

--73224e4c0f3a263ea2f87dff3430fb651e1d994a3e10946ad5fb6eb997eb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaqf++RIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/iVegGAyT/hKwwPtVPZ1rEp6XYMK0Mtc/28+h8j
69pul5/NnLvDiXuxhNelXY0Kxvt1xShNAYCViwThHdSy5XQk93euXIMKiF9dElr5
1oxLt+xNBvwPQgrbKJ1QysOZIikXTx1D8vk=
=a2i8
-----END PGP SIGNATURE-----

--73224e4c0f3a263ea2f87dff3430fb651e1d994a3e10946ad5fb6eb997eb--


--===============5744471401841972430==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5744471401841972430==--

