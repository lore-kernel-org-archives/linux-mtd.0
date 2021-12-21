Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E606DC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Dec 2021 09:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M6AXZCBwEt3fFlr/Uri9LBlRsMB0fSJa9DYz6HDB1Jw=; b=zx+xqkNJtCQgB3
	sOeX3vwphkK4TT2zYoMW7DyFsuHwwU+yzD+L3HxxT7hyzFOPb+21ByXcQrHqmdzXt0AofDfDdQVCx
	x/jElc4sGseM4pDmxDYybtk5QCd3IEWmYZ925u84yT4El+BhTwOdiR7q9sujhjdYrZYNhMywsV1yk
	LfywoC9VD7GjXui7C7D243t+vEwprQp4IvYFeA2ycfWx6K/WiPBp1MsRYhrcsT2JXqSYZk0ialrKa
	wQBkmBbMUWFaZtLJv8XDSFurXMJFLvFxBAhQoucUdhAJIHs6N4FLJVTJ/wz0HtcC6GG0jIM33hvfS
	3ik8gB3YrxMDvXZ1yaVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzbGV-0064kx-Kw; Tue, 21 Dec 2021 09:16:59 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzbGP-0064iW-DX
 for linux-mtd@lists.infradead.org; Tue, 21 Dec 2021 09:16:55 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 5AC5C6000B;
 Tue, 21 Dec 2021 09:16:45 +0000 (UTC)
Date: Tue, 21 Dec 2021 10:16:44 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Wolfram Sang <wsa@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush
 Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, Milan Stevanovic <milan.stevanovic@se.com>,
 Jimmy Lalande <jimmy.lalande@se.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-renesas-soc@vger.kernel.org, Magnus
 Damm <magnus.damm@gmail.com>, Gareth Williams
 <gareth.williams.jx@renesas.com>, Phil Edworthy
 <phil.edworthy@renesas.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Chris Brandt <Chris.Brandt@renesas.com>, Ralph Siemsen
 <ralph.siemsen@linaro.org>
Subject: Re: [PATCH v6 3/4] MAINTAINERS: Add an entry for Renesas NAND
 controller
Message-ID: <20211221101644.70bb4fdd@xps13>
In-Reply-To: <Yb0CYpCBFA/bQFjF@kunai>
References: <20211217142033.353599-1-miquel.raynal@bootlin.com>
 <20211217142033.353599-4-miquel.raynal@bootlin.com>
 <Yb0CYpCBFA/bQFjF@kunai>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_011653_655629_486366A1 
X-CRM114-Status: UNSURE (   8.44  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgV29sZnJhbSwKCndzYUBrZXJuZWwub3JnIHdyb3RlIG9uIEZyaSwgMTcgRGVjIDIwMjEgMjI6
MzQ6MjYgKzAxMDA6Cgo+ID4gK1JFTkVTQVMgUi1DQVIgR0VOMyAmIFJaL04xIE5BTkQgQ09OVFJP
TExFUiBEUklWRVIKPiA+ICtNOglNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4u
Y29tPgo+ID4gK0w6CWxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnICAKPiAKPiBDb3VsZCB5
b3UgYWRkCj4gCj4gTDogICAgICBsaW51eC1yZW5lc2FzLXNvY0B2Z2VyLmtlcm5lbC5vcmcKPiAK
PiBhcyB3ZWxsIHBsZWFzZT8KClN1cmUhIEknbGwgYWRkIHRoaXMgbGluZSB3aGVuIGFwcGx5aW5n
LgoKVGhhbmtzIGZvciB0aGUgZmVlZGJhY2sgYW5kIGZvciB0aGUgb3ZlcmFsbCByZXZpZXchCgo+
IAo+ID4gK1M6CU1haW50YWluZWQKPiA+ICtGOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbXRkL3JlbmVzYXMtbmFuZGMueWFtbAo+ID4gK0Y6CWRyaXZlcnMvbXRkL25hbmQvcmF3
L3JlbmVzYXMtbmFuZC1jb250cm9sbGVyLmMgIAoKQ2hlZXJzLApNaXF1w6hsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
