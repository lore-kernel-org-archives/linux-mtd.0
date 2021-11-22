Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F0DC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Nov 2021 18:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nf1Gj99SdXX16MT366ySng07V8MAlhJj+7Vc6BD9nOs=; b=B44F8B456y2ixph8zg86lWi0/y
	JYpGLmC5Dskke28TOxRr+8rpfvPf/HvHWLlmUCYlTtTmXwPvKksckqZlR90fNrsfunnp0GiX6TG83
	FdUbzhQhoNRRzBFMxqGoykk4iM9szZld205R7GvUbUj+8uK6zonndqv6ltN/lpWqMH1F94WXCkLzS
	nCVUWYKy+DBxVRr5HvpWV0o7sYEjFIdUcQ8bjevFAIAAjM/4c+y/Q4GIpi5i0372qw0TRD1pbIkEp
	Sdfgrv6FUpGo51q2/Ipl2yWrHzRugiO7jGvXDB+/QGkzJbQWoHNNsP/TUMsznE/cU8TqaW9qhqC/i
	yTvrmfAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpDvH-00HK5F-RW; Mon, 22 Nov 2021 18:20:11 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpDv2-00HK4C-Lx; Mon, 22 Nov 2021 18:19:58 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 1925B22246;
 Mon, 22 Nov 2021 19:19:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1637605193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wwvICoCD/MiTr4Ccf93eEmaoOebR77F3sQsTZTA/3cw=;
 b=W/GZvIY2t++mLY4QLJq99HnWLtVKDzsVdDPkGKlKB8HE8IT0EKbz3vX3TlbcmNf+FmtHe0
 C95svc/EwM52p2SQaXlOdr7JS4hz1Vh0c1mXrl3v9HyAPvoZRdAlDzmclTZqnzoAPNXQuj
 XVUyKhTIiujeZXLjs5PSieiAMHogoO8=
MIME-Version: 1.0
Date: Mon, 22 Nov 2021 19:19:46 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v4 12/13] mtd: spi-nor: gigadevice: gd25q256: Init flash
 based on SFDP
In-Reply-To: <20211122095020.393346-13-tudor.ambarus@microchip.com>
References: <20211122095020.393346-1-tudor.ambarus@microchip.com>
 <20211122095020.393346-13-tudor.ambarus@microchip.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <5eade5660eba81ebca5886209598d480@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_101956_911323_3DCAF3D4 
X-CRM114-Status: UNSURE (   5.47  )
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, nicolas.ferre@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, p.yadav@ti.com, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2021-11-22 10:50, schrieb Tudor Ambarus:

> xxd -p sfdp-gd25q256
> 53464450060102ff00060110300000ffc8000103900000ff84000102c000
> 00ffffffffffffffffffffffffffffffffffe520f3ffffffff0f44eb086b
> 083b42bbeeffffffffff00ffffff00ff0c200f5210d800ff4262c9fe82e9
> 1458ec6006337a757a7504bdd55c0006440008500001ffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffff003600279cf9
> 7764fccb58e3ffffffffffffffffffffffffffffffffffffffffffffffff
> 
> sha1sum sfdp-gd25q256
> 9f25eb3b17832b26dbba288f1b07de1f8a42e446  sfdp-gd25q256

something is wrong here:
$ cat gigadevice/gd25q256.txt
53464450060102ff00060110300000ffc8000103900000ff84000102c000
00ffffffffffffffffffffffffffffffffffe520f3ffffffff0f44eb086b
083b42bbeeffffffffff00ffffff00ff0c200f5210d800ff4262c9fe82e9
1458ec6006337a757a7504bdd55c0006440008500001ffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffff003600279cf9
7764fccb58e3ffffffffffffffffffffffffffffffffffffffffffffffff
$ xxd -r -p gigadevice/gd25q256.txt > gigadevice/gd25q256
$ sha1sum gigadevice/gd25q256
ca4625e284d7cf35fe6b6afe9c7f780b35a5fce7  gigadevice/gd25q256

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
