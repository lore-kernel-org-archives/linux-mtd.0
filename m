Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D38EEC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Dec 2021 15:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jmX1vcrgJmix/Bx3d3hmRzTqHo2Zv1nQ5mxzN4ii89o=; b=4uxBsHfy6r6r4l
	VSY23PHhROoR7hUnhJSxvX77d++uIYxMZd/otJ5ZwrYBAuCRe/fgsS8zH0F10mXyDlIHUrbTxtiR+
	YNzJ4OewcVfn9jCA1jJrH9ROlO64+vg2IsNP0OXrtbJfbL/lcZKqeq6/KebovXGl7aj44m2sNVONU
	dCu/1M2pBZzGqDI7F92Ec1FFmPFJsxHn7kwkQ0qHuHetEXaC0jdwLzmGyNw/qlsxTR1YPs3Dbicvb
	BAkgieQ60Vuw1bRHfOOADpJdnUkRjN2JmcxOInV00LeCaTyFwRnf+mdj0f4Yyg6BAgcxUTml5f7zX
	KK7WY1quFX2/60TkX4wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxWLL-001OON-D7; Wed, 15 Dec 2021 15:37:23 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxWL5-001OLt-8Z; Wed, 15 Dec 2021 15:37:08 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id C644320000E;
 Wed, 15 Dec 2021 15:36:58 +0000 (UTC)
Date: Wed, 15 Dec 2021 16:36:57 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush
 Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, linux-renesas-soc@vger.kernel.org, Magnus
 Damm <magnus.damm@gmail.com>, Gareth Williams
 <gareth.williams.jx@renesas.com>, Phil Edworthy
 <phil.edworthy@renesas.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Geert
 Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v3 1/4] dt-bindings: mtd: rzn1: Describe Renesas RZ/N1
 NAND controller
Message-ID: <20211215163657.0ae52a78@xps13>
In-Reply-To: <YbjxrFyfIz8Qydpb@robh.at.kernel.org>
References: <20211209143228.525234-1-miquel.raynal@bootlin.com>
 <20211209143228.525234-2-miquel.raynal@bootlin.com>
 <YbjxrFyfIz8Qydpb@robh.at.kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211215_073707_477346_95C48896 
X-CRM114-Status: UNSURE (   7.53  )
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

SGkgUm9iLAoKPiA+ICsgIGNsb2NrLW5hbWVzOgo+ID4gKyAgICBpdGVtczoKPiA+ICsgICAgICAt
IGNvbnN0OiBuYW5kX2hjbGsKPiA+ICsgICAgICAtIGNvbnN0OiBuYW5kX2VjbGsgIAo+IAo+ICdu
YW5kXycgaXMgcmVkdW5kYW50LgoKQWN0dWFsbHkgdGhlIG5hbmRfIHByZWZpeCB3YXMgdm9sdW50
YXJ5IHRvIGJlIGNvbnNpc3RlbnQgd2l0aCB0aGUKc3BlY2lmaWNhdGlvbiB3aGljaCBjYWxsZWQg
dGhlc2UgdHdvIGNsb2NrcyBOQU5EX0hDTEsgYW5kIE5BTkRfRVhMSy4KQnV0IHdoYXRldmVyLCBJ
J2xsIGNoYW5nZSB0aGUgbmFtZXMuCgo+ID4gKyAgIiNhZGRyZXNzLWNlbGxzIjogdHJ1ZQo+ID4g
KyAgIiNzaXplLWNlbGxzIjogdHJ1ZQo+ID4gKwo+ID4gK3JlcXVpcmVkOgo+ID4gKyAgLSBjb21w
YXRpYmxlCj4gPiArICAtIHJlZwo+ID4gKyAgLSBjbG9ja3MKPiA+ICsgIC0gY2xvY2stbmFtZXMK
PiA+ICsgIC0gaW50ZXJydXB0cwo+ID4gKwo+ID4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiB0cnVl
ICAKPiAKPiB1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlCgpOb3Qgc3VyZSB3aHkgSSBwcm9w
b3NlZCB0aGlzIHByb3BlcnR5IGluIHRoZSBmaXJzdCBwbGFjZS4gSSdsbCBjb3JyZWN0LgoKVGhh
bmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
