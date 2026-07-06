Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF122C43458
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jul 2026 14:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h2nPjFpuDZV6jViXXqZRD3y+D3jJKKoK+envdcZss9Q=; b=mX5H0g7+U2FBMrbuVDy9hEBxvY
	Bc+hW2qE6wbMnnBAVHmL7FceCz5eR3sVtjEg1R21RQcPdUF2A8fHhWGavsRTALW99ZcXvXYy6OAAx
	9TcW3JF5LSrsv+an5lkAikAKuWMtNn427vKLQt8YzE3yDYQN1qdpHeenNQA9xAm+Xef8Kz80w0u6A
	tn1dYluuIoye0/VOFudPFtV6S4lJAZ69hF7YWoysP8YwrmNzzfbkR7SxaMSW8/pcMjk9aAMaju2Hj
	fTqN0HaGr55ZCKMC9EN0mXMIqj6jhdP98LUwwwCzuMP69xUUSyqqc6Y6Kw9YJ2MqoK24s9RFOldsn
	d8NkQKxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgkOw-0000000ClBd-1Kzz;
	Mon, 06 Jul 2026 14:34:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgkOv-0000000ClB1-0wYO
	for linux-mtd@lists.infradead.org;
	Mon, 06 Jul 2026 14:34:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 884B660098;
	Mon,  6 Jul 2026 14:34:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id B03DA1F000E9;
	Mon,  6 Jul 2026 14:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783348464;
	bh=YxRrCXlWN9ARPXX/Q3oLuamYQn0AXB/KIJFWqLuNswY=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=XE9/Xt1KJmK+ku8BM/Ll6WvmBhsV/o7VxOrubaxBtpbhA+vB1Q63KHE9tSYUKpSyp
	 wEZ1QGxUZWWFTrlMxXHd6/IB1OA20tnB8HQDKNA+XW/Ieo6ZGw3O9YnrKR+MelqTCr
	 P2Hb8vIo00qIbd5oji4hZJKWqRxA09mWRsEdIlQmWoNqbG9NzKnWM+CSGljzxxK8+v
	 imeMaPYEPVG+5twOlz1DxnIx8IGyNd1bOVo7HwpjlXwSqIwaL13T862C5E09Tz4C+O
	 f3RgoqYHDrK1zf5YdhNLZRkN1Kg3oUyPa5zmH2hTnKiQBcUzLIcBH02WeW3JItSPUM
	 bzegLGNZ4vN8w==
Mime-Version: 1.0
Date: Mon, 06 Jul 2026 16:34:20 +0200
Message-Id: <DJRK9ORBDZH8.1YM083YAEDN62@kernel.org>
Subject: Re: [PATCH v1 7/8] mtd: spi-nor: push the rollback mechanism into
 the sfdp module
Cc: "Pratyush Yadav" <pratyush@kernel.org>, "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, <linux-mtd@lists.infradead.org>, "Cheng Ming
 Lin" <chengminglin@mxic.com.tw>, <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
X-Mailer: aerc 0.20.0
References: <20260703143003.1809579-1-mwalle@kernel.org>
 <20260703143003.1809579-8-mwalle@kernel.org> <874iickxki.fsf@bootlin.com>
In-Reply-To: <874iickxki.fsf@bootlin.com>
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
Content-Type: multipart/mixed; boundary="===============8601875053641500989=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============8601875053641500989==
Content-Type: multipart/signed;
 boundary=e18ae1c96ffc1fa382f365316a0edf4ab68d498cab596b2ef6f08fc6ab07;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--e18ae1c96ffc1fa382f365316a0edf4ab68d498cab596b2ef6f08fc6ab07
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Jul 6, 2026 at 4:22 PM CEST, Miquel Raynal wrote:
> On 03/07/2026 at 16:29:18 +02, Michael Walle <mwalle@kernel.org> wrote:
>
>> Right now, the core is handling the rollback of the parameters. But it
>> doesn't have the knowledge what has to be rolled back. And in fact,
>> havent rolled back everything. Push it down to the called function and
>> make it mandatory, that this function has no side effects if it fails.
>>
>> Funny enough, there is a comment in the SFDP table handing code that
>
> handling?                                                ^

yeah ;)

>> each table parser is responsible to roll back any changes. But none of
>> them did. So while add it, expand the logic to that and roll it back for
>> them. There is one simple rule though:
>>
>>   SFDP parsing and fixups may only modify the spi_nor_flash_parameters.
>
> Ok.
>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Btw Sashiko found a problem with the new rollback logic [1]. So
expect that there will be at least a v2.

-michael

[1] https://sashiko.dev/#/patchset/20260703143003.1809579-1-mwalle%40kernel=
.org

--e18ae1c96ffc1fa382f365316a0edf4ab68d498cab596b2ef6f08fc6ab07
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaku87BIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gWGwGAh0RJ2eLKgbbbse46YPQft8AK3TXMwDxk
UhRdx3r2MCtpprB4l9rbWQjRbDnzlGstAYClTn+s8IIaRo/TM7xkh2KphHBJ2ep1
Wo5X6OoN0jFbY1+65rkLYYuRi1J+HYBHBzg=
=MkP+
-----END PGP SIGNATURE-----

--e18ae1c96ffc1fa382f365316a0edf4ab68d498cab596b2ef6f08fc6ab07--


--===============8601875053641500989==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8601875053641500989==--

