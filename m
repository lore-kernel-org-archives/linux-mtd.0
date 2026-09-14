Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC7EC88E50
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2026 12:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bz49JlMJvk2TnbSG1YH+eH14TbsoQwO/7V3s5IrMZvw=; b=RDOaU41dJFx0fd28JsWAIIUolW
	0EJ2h+OkcjTTNOgnNO0SCuV7iB/9PENfFQDgBTlDy6WsQod0VDQichC5kJ54mKSBUYY5TJTVBroQr
	I86j0a6AKEaNioaKHuPskF4CyIHe91/n5kKejKkJZHDBYD8Rhu+dcBFT1kdM1uDVq1l68jQQqpYWS
	pnT0RYSjiqVYSyGlI2HLNq/OI1NotHQOSoqwksV/MAG4xLb5e227Pi6Ixxisjkc7n5i7K5bJRVg/s
	415aHKLIDB/Kj1VKtl5rQfjXSC8FxEiQ7MGmNrzvmdRI9NQuDhSD5PTsqPs840BCbJvurO/m+brLI
	ZHklatlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65fQ-00000003WZ5-01Fp;
	Mon, 14 Sep 2026 12:20:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65fO-00000003WXn-1C9O
	for linux-mtd@lists.infradead.org;
	Mon, 14 Sep 2026 12:20:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id 0C7AF416F7;
	Mon, 14 Sep 2026 12:20:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 698991F000FF;
	Mon, 14 Sep 2026 12:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789388409;
	bh=1CAcEe4QlA211iDV5LFfJIyFyShs/f5TCZKA9xt3M0o=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=VLXfkuCEinZaQfoaqE5dFpScu2TKPiyMQLw6ODNLYWmybVY6ggTF/6q6nD9HqrIEy
	 5IsvNkmS/WUqRRPWqZLoNN5h34CTM/K2VkiuUePNNMWEolYiZc4naAyPzEfe6Q9DUJ
	 Vi6JSuvpwByxoD4ETwnSo/zpz+Wh+GzbVuRZ0CGd4m/SpI98XG+aya7J9+B/WdL/59
	 AgIRovN6a5M8cgwCUfCMcyuVkW++zwA7XxJDw+fjwWYp3s9qtc5aoxr5cupcOiUtCc
	 OG4pNozHXODhDZ9+ECIpAlMEYe+WsAh4zu+of6RhSEsYKDDUmJVR9qJTWJHdInbcjO
	 vPWeGvPkNGUtw==
Mime-Version: 1.0
Date: Mon, 14 Sep 2026 14:20:05 +0200
Message-Id: <DLF191CC4QMM.1SNYEHUFJ9GK2@kernel.org>
Subject: Re: [PATCH v2 1/3] mtd: spi-nor: fix the lock left held by
 spi_nor_rww_start_exclusive()
Cc: <pratyush@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <vigneshr@ti.com>, <richard@nod.at>,
 <takahiro.kuwano@infineon.com>, <stable@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Itai Handler"
 <itai.handler@gmail.com>
X-Mailer: aerc 0.20.0
References: <20260914081149.1916589-1-itai.handler@gmail.com>
 <20260914081149.1916589-2-itai.handler@gmail.com>
 <87ld94owzj.fsf@bootlin.com>
In-Reply-To: <87ld94owzj.fsf@bootlin.com>
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
Content-Type: multipart/mixed; boundary="===============8925760721411936944=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============8925760721411936944==
Content-Type: multipart/signed;
 boundary=3c7626485cbfcfdc5d1f2f4e0724e820fdbe28a207f265f06e8767126a80;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--3c7626485cbfcfdc5d1f2f4e0724e820fdbe28a207f265f06e8767126a80
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

> Michael, since we already got a cycle with AI walls of text just to tell
> "fix that damn conversion", can I (or you) apply that other patch, so we
> can get rid of these? Let me know what you prefer, although I don't
> remember where that thread is.

It's already in spi-nor/next since last friday.

https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/log/?h=3Dspi-=
nor/next
https://lore.kernel.org/linux-mtd/178913311701.1915651.4791624215787396187.=
b4-ty@b4/T/#me3b51a242469a4d9722089e18547e87fdc65d7c9

-michael

--3c7626485cbfcfdc5d1f2f4e0724e820fdbe28a207f265f06e8767126a80
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaqfmdhIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/h+rQGA21WADlbJRzTdcUtVgkfLn13FsZlH9fAL
mL3YyjGxWm8otE5+lAWk9UiwKbbDR2RkAX96KFwcbgZlq2jUCk0r/ZX1/9uZhwHP
n4v0jC/6LgaWS1IDGhs8UpbKkMQ/AmbCLjg=
=KUGi
-----END PGP SIGNATURE-----

--3c7626485cbfcfdc5d1f2f4e0724e820fdbe28a207f265f06e8767126a80--


--===============8925760721411936944==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8925760721411936944==--

