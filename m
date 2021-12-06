Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28549C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Dec 2021 09:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o7wK0Ym+ke9SOLAQLKMFQyTMSvF+E/3yshM8r35KlA4=; b=u5LZCd4p3CW5ls
	Ln+XgOocSgO9rk45Sx/X6nI5mcOajhivhbauJeliIX+J7RtpxzPTQXZKwN6/6DCq2vpl+18diHwYs
	mBaPDHZcjS1j8thw9wNultExPyoAFjU46yjvkgqBeXEGWhhkHYvrIOdnxtChqxsh6tY7o5wMfeGwB
	40EsbK8u/LCLjNO56MXFMX6kwoSLjtR+t9EfAyvkfXV4CBqbVfTmt4jhutJQ7KHSFs7i88VD7ROkj
	teeK2RbAx3rs2wA05vLDdEwgIGljogUOpJBvfzuWJLtUDq2/2EcXHgfv2/FK2Jz6jTTa6/oJfX3aA
	7F9lVVXFDT9dvtTJ8jig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mu9tw-00355h-29; Mon, 06 Dec 2021 09:03:12 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mu9tj-00352H-9b; Mon, 06 Dec 2021 09:03:00 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id B925DE0010;
 Mon,  6 Dec 2021 09:02:43 +0000 (UTC)
Date: Mon, 6 Dec 2021 10:02:43 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Ralph Siemsen <ralph.siemsen@linaro.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush
 Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Jimmy Lalande <jimmy.lalande@se.com>, Milan Stevanovic
 <milan.stevanovic@se.com>, Linux-Renesas
 <linux-renesas-soc@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Gareth Williams <gareth.williams.jx@renesas.com>, Phil Edworthy
 <phil.edworthy@renesas.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] mtd: rawnand: rzn1: Add new NAND controller driver
Message-ID: <20211206100243.463ef310@xps13>
In-Reply-To: <20211201211850.GA3132024@maple.netwinder.org>
References: <20211126140625.351697-1-miquel.raynal@bootlin.com>
 <20211126140625.351697-3-miquel.raynal@bootlin.com>
 <20211201211850.GA3132024@maple.netwinder.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_010259_522363_EFD9260A 
X-CRM114-Status: GOOD (  14.04  )
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

SGkgUmFscGgsCgpyYWxwaC5zaWVtc2VuQGxpbmFyby5vcmcgd3JvdGUgb24gV2VkLCAxIERlYyAy
MDIxIDE2OjE4OjUwIC0wNTAwOgoKPiBPbiBGcmksIE5vdiAyNiwgMjAyMSBhdCAwMzowNjoyNFBN
ICswMTAwLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+ID5JbnRyb2R1Y2UgUmVuZXNhcyBSWi9OMXgg
TkFORCBjb250cm9sbGVyIGRyaXZlciB3aGljaCBzdXBwb3J0czoKPiA+LSBBbGwgT05GSSB0aW1p
bmcgbW9kZXMKPiA+LSBEaWZmZXJlbnQgY29uZmlndXJhdGlvbnMgb2YgaXRzIGludGVybmFsIEVD
QyBjb250cm9sbGVyCj4gPi0gT24tZGllIChub3QgdGVzdGVkKSBhbmQgc29mdHdhcmUgRUNDIHN1
cHBvcnQKPiA+LSBTZXZlcmFsIGNoaXBzIChub3QgdGVzdGVkKQo+ID4tIFN1YnBhZ2UgYWNjZXNz
ZXMKPiA+LSBETUEgYW5kIFBJTwo+ID4KPiA+VGhpcyBjb250cm9sbGVyIHdhcyBvcmlnaW5hbGx5
IHByb3ZpZGVkIGJ5IEV2YXRyb25peCBiZWZvcmUgYmVpbmcgYm91Z2h0Cj4gPmJ5IENhZGVuY2Uu
Cj4gPgo+ID5TaWduZWQtb2ZmLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3Rs
aW4uY29tPiAgCj4gCj4gSSd2ZSBnaXZlbiBpdCBhIHRyeSBhbmQgYWxsIHNlZW1zIHRvIGJlIHdl
bGwuIFRodXM6Cj4gVGVzdGVkLWJ5OiBSYWxwaCBTaWVtc2VuIDxyYWxwaC5zaWVtc2VuQGxpbmFy
by5vcmc+CgpHcmVhdCEgVGhhbmtzIGZvciB5b3VyIGZlZWRiYWNrLgoKPiA+KwltdGQgPSBuYW5k
X3RvX210ZChjaGlwKTsKPiA+KwltdGQtPmRldi5wYXJlbnQgPSBuYW5kYy0+ZGV2Owo+ID4rCWlm
ICghbXRkLT5uYW1lKSB7Cj4gPisJCWRldl9lcnIobmFuZGMtPmRldiwgIk1pc3NpbmcgTVREIGxh
YmVsXG4iKTsKPiA+KwkJcmV0dXJuIC1FSU5WQUw7Cj4gPisJfSAgCj4gCj4gTWlub3IgaXRlbTog
Y291bGQgdGhlIG5vZGUgbmFtZSBiZSB1c2VkIGFzIGEgZmFsbGJhY2sgd2hlbiBsYWJlbCBpcyBu
b3QgcHJlc2VudD8KClRoYXQncyBub3QgdGhlIHBvbGljeSB0aGF0IHdlIHRyaWVkIHRvIGVuZm9y
Y2Ugc28gZmFyIGJlY2F1c2Ugbm9kZQpuYW1lcyBhcmUgdG9vIGdlbmVyaWMgYW5kIGRlZmluZSB0
aGUgbmFuZC1jb250cm9sbGVyLCBub3QgdGhlIGNoaXAKaXRzZWxmLiBUaGF0IGlzIHNvbWV0aGlu
ZyB3aGljaCBtYXkgZXZvbHZlIGlmIHdlIGV2ZXIgZGVjaWRlIHRvIGRvCnRoaW5ncyBkaWZmZXJl
bnRseSBhdCBzb21lIHBvaW50IGJ1dCBJIGd1ZXNzIHdlIHdvdWxkIG5lZWQgdG8gZG8gdGhhdAph
dCBNVEQgbGV2ZWwgaW4gdGhpcyBjYXNlLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
