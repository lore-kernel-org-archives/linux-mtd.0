Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 097B9C88E64
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2026 08:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:From:Cc:Subject:To:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EoUiDo3czp1ECHd0k+eaHD22NjykkJW7hfznu4Ej4ZU=; b=ZNDNCXc64qojydZKKl9TzSA9Iu
	gv2IRIx0mUIeSDrvzzyOxTQdU5jN0W8oAHu3ICW86r7wmixLsFrqtLNLynke0Q5PiqVqKOQ2kh2M6
	i7iWi+nKfnCNbm8EYLJ/A3XAvNYLpIdYMvsvHu+MMxeFvdRnkROM9muQJbI2smVKtfOnyLeGvvu3S
	GN+/0gUY0Me+VsOb117DmfSSpDpaBJ5nKv8/qrthqyfeiscvZ7Xf/21h9DMKdQgTfzTA8S9x1uOW4
	CRwD/PB2OgKJgnuz+Vw3bHw/foNq3IxBOitHwVdqKojA9aM8QlglOqdJ76TsvsKMbdxcMj03li/GE
	/OsokB7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x627c-00000002kdy-3fpE;
	Mon, 14 Sep 2026 08:33:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x627b-00000002kdR-3fnA
	for linux-mtd@lists.infradead.org;
	Mon, 14 Sep 2026 08:33:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 1473C601FB;
	Mon, 14 Sep 2026 08:33:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 6F2B41F00893;
	Mon, 14 Sep 2026 08:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789374782;
	bh=7TfHGyLDKigYrKX0lKyKyVlr99ToO+iL4J2l2vtb/vw=;
	h=Date:To:Subject:Cc:From:References:In-Reply-To;
	b=XjfyVFs7ivXy2Ouac5D56JOvm0q33a6bhPNBJ1LbhWBzYrbjUMs9AJIuTY3X9ovoL
	 KXQwkp5Cv0C9+gwY8Q5NdJI3X4SToIGK3hhH/lnoFoicCyggmXmpTsrOiEOOGV6t1l
	 Kfkjf7x/V50/EPpJI1XGENilgx+w09V3g8LTXGIioZxOIrvpJVGB1EoXuiwW0CNOf+
	 AuC6MzVmRxD95LhGcKM6++5Q1piwI/axAhLD9TmelKaB0w0Esj5jPyq+TwN2Bd7OCW
	 n88hTPLMuVKIAILWFiu92uFpWqBR0YNiZ3MdXMJ3Ck8ffwzpUcJhlwudJPos8fqz7a
	 CVgWpUfEo8BkQ==
Mime-Version: 1.0
Date: Mon, 14 Sep 2026 10:32:59 +0200
Message-Id: <DLEWF5DGXYAE.179JK12YIHHID@kernel.org>
To: "Itai Handler" <itai.handler@gmail.com>, <pratyush@kernel.org>
Subject: Re: [PATCH 2/2] mtd: spi-nor: take the flash lock in
 spi_nor_remove()
Cc: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <vigneshr@ti.com>, <richard@nod.at>, <miquel.raynal@bootlin.com>,
 <takahiro.kuwano@infineon.com>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260910184452.895485-1-itai.handler@gmail.com>
 <20260910184452.895485-3-itai.handler@gmail.com>
In-Reply-To: <20260910184452.895485-3-itai.handler@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============5673080448362345889=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============5673080448362345889==
Content-Type: multipart/signed;
 boundary=bbbdaab65393f877a3a172d7d3159aff44a70d5f1a437ce91c7acbfe7227;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--bbbdaab65393f877a3a172d7d3159aff44a70d5f1a437ce91c7acbfe7227
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Sep 10, 2026 at 8:44 PM CEST, Itai Handler wrote:
> spi_nor_remove() restores the addressing mode with the same unlocked
> call to spi_nor_restore() that spi_nor_shutdown() used before the
> previous patch, and it is exposed the same way: the MTD device is still
> registered at that point, so an unbind can run the restore while another
> thread is in the middle of an operation. A busy flash silently ignores
> the restore, and a restore that lands between two chunks of a read
> switches the chip to 3-byte addressing while the driver keeps sending
> 4 address bytes.
>
> Moving the restore after mtd_device_unregister() would not fix this.
> Since commit 19bfa9ebebb5 ("mtd: use refcount to prevent corruption")
> del_mtd_device() drops a reference instead of refusing with -EBUSY when
> the device is in use, so unregistering returns right away and does not
> wait for an operation that is already running.
>
> Take nor->lock for the restore, as spi_nor_shutdown() now does. The
> unregister stays unconditional, so a flash whose restore had to be
> skipped is still torn down.

Why are these two different patches? This should be folded into the
former one.

-michael

--bbbdaab65393f877a3a172d7d3159aff44a70d5f1a437ce91c7acbfe7227
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaqexOxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jPmAF9Fy37fgcZRMQrLnNeIYzMnIBHr+NFtkK/
wxEf1Tsr3HfxSUv0lGMQF2kNUt4EA7xVAX48Dw2+6zLI/1HT0PSrykhq9pTN00UY
1mB9KScdZ8z5/bc0x6AggJ15xsgCW3VhI74=
=iJCs
-----END PGP SIGNATURE-----

--bbbdaab65393f877a3a172d7d3159aff44a70d5f1a437ce91c7acbfe7227--


--===============5673080448362345889==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5673080448362345889==--

