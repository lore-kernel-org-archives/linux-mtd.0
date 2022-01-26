Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12FE0C63682
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jan 2022 18:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Synf+lcBiljfN7WO7jft81rYLUG+ZnNXQnNkzqxNZ+s=; b=QuPz3RDExNBjjFmR6IUyinZ9Ii
	Yw7Q1YxXJa62n80n8cEQoASGrudTb1IKTWNc8LXRZsf1+LKssw3KrzSpRZbN+69AMeP3sIBVLruCT
	Mc+Trow4SHddSNItyP1FA6YutNf34g9hAX4cJzXPlLn+ARkEyOzdyqsXK1+b1041bpcvCnwa2YKqM
	OCG+pZhTt1ELYHhKQbb0taEj0duDSRNcFWjVKhAIo3YDy+h0+6wPW2azIv8ZFWXgS9Uj8g5M3nw3E
	WANqFINNxQOX/q2hHaaUSqRe9U91a1VuZCdXBnH6uIkpi5M5THqRtCaLgkqoWBlGn5MP2ot2BNE+a
	Ec3r+zvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCma5-00DBdw-GD; Wed, 26 Jan 2022 17:59:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCmId-00D51q-20
 for linux-mtd@lists.infradead.org; Wed, 26 Jan 2022 17:41:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 90A6761931;
 Wed, 26 Jan 2022 17:41:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CD01C340E8;
 Wed, 26 Jan 2022 17:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643218898;
 bh=UjPtMJvYnQexM6xAUwEDFsPyqZ0hrEpQOLkboh91jc0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P8u4ijZZnIA8xyh4l/cwZqDQOFH6baIj7xCm9h/39Oo4o4TcqG5JLLM3ljnFo/g7z
 DxvFewX5/SClPR3pl5J3+QW4rxu8rbwNnj4VMxaNeW4pRw81ACfd0W1Cx8iUotCj/I
 Dtla8GAwD0434f9lsVYayORVGHHpPQKcoYXTGfBcrflyqGP7/4x8GCVtWlynhl1g+Y
 4Xb8YqGnRvpCkVC7GrmSNsuPI+jWGrpbQfKdXO8lXRd6dYBYrYYw31WX9878WpQ7pA
 ao5bCHGEirzz/ZzVK1LZOTziF0gbB3r/xwsLSaqJRLxnkeFzCi7Nn90Iws547vr5Vd
 zFHSC5WD4ERbg==
Date: Wed, 26 Jan 2022 17:41:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Subject: Re: [PATCH v9 01/13] spi: spi-mem: Introduce a capability structure
Message-ID: <YfGHy/MsQhaWCeYM@sirena.org.uk>
References: <20220104083631.40776-2-miquel.raynal@bootlin.com>
 <20220126105333.883267-1-miquel.raynal@bootlin.com>
 <YfF4UhhVFu749ZYK@sirena.org.uk> <20220126183601.42d38e88@xps13>
MIME-Version: 1.0
In-Reply-To: <20220126183601.42d38e88@xps13>
X-Cookie: Use only in a well-ventilated area.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_094139_185011_76A1321B 
X-CRM114-Status: GOOD (  15.82  )
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
Content-Type: multipart/mixed; boundary="===============4397968562788934506=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============4397968562788934506==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NGefvqmzzVn6Osek"
Content-Disposition: inline


--NGefvqmzzVn6Osek
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 26, 2022 at 06:36:01PM +0100, Miquel Raynal wrote:

> > I was hoping to review this stuff?  I think I was expecting it to be
> > rebased after the merge window...

> Sorry for the misunderstanding, I thought you were fine with these
> spi bits so I didn't ping you before applying. Can you review the v9
> then? There is nothing different in the series I applied.

> Depending on the outcome I'll either fix inline if you ack the patches
> or drop the patches from that branch and send a v10 otherwise.

I don't recall seeing anything but I'd dropped them due to the merge
window, like I say I was expecting a repost for -rc1.  I'll try to fish
them out and have a look tomorrow.

--NGefvqmzzVn6Osek
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHxh8oACgkQJNaLcl1U
h9AEswgAgLYmvOtovPnDKE5dwp+VAiCx5B+HKUZygwjsf/aVYM8QHpcynETI6/lN
mjWpEYXtiyRH8ndBsB3ZD/duQy9cYWXUu++rLmvamHMoy54NfIahIfobicZhXJBD
9WtJLh3Bgm/jg9DThttEXr2I7QPfOzBF+jfUs8E5XQ7vUQtTXbM464e9Xz/qdjf7
kNG6MtoUu1g+BjafsjZDG0Md7k6zt+MnzgR6JCbcwDUm5onALqYqq8ReKN779W34
DqtC4dhDo+vFqBmCsgK/NqBuNRzwOCaRkXFDOe4VA3Fie5+o0EJJLX7JKpQCx//Z
VKbiUrXh9nc5oqphrCs/yLY6YOIuIA==
=XU6M
-----END PGP SIGNATURE-----

--NGefvqmzzVn6Osek--


--===============4397968562788934506==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4397968562788934506==--

