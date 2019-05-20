Return-Path: <SRS0=ONRD=TU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D089BC04AAC
	for <linux-mtd@archiver.kernel.org>; Mon, 20 May 2019 12:44:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 978D9204FD
	for <linux-mtd@archiver.kernel.org>; Mon, 20 May 2019 12:44:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lDecwCUg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 978D9204FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YHXD12WGeYcJXkAfj/mHjnZmBxriAYmT4Zyj6Ls6r2c=; b=lDecwCUgtHr48H
	4iSSouFBQEbRMxK+2Ot6dEW8TjOFrhOOYD3EOsM+L3kOMJofzFBsZ14S+nIfEekB7Jjf/gyk0yAqT
	B2ooE9DN1CWoWYlQPyJ6Q5uRNBHvovx0fhfIGK5a05rIdIoqB9C2bv94MiOSJ37NXJG9+V8zbmyZe
	7ZARh6z9Iespw3VRAXaFtRMWItIDY2lnEJ674DkjLGXSSkgegNxL9HwdoxLDsKURnIUFY/FTxB9IY
	s0LXaZwhCBIJw+E9S2VAsIqtfEYp40VvQ16TGBUreJB9xk6IKQIfj0XisEAs4GFM10rg4KO1u5V56
	AMF50JPRfG0WBAhAIwiA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hShel-0003hw-Qr; Mon, 20 May 2019 12:44:43 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hShei-0003hI-Kk
 for linux-mtd@lists.infradead.org; Mon, 20 May 2019 12:44:42 +0000
Received: from xps13 (aaubervilliers-681-1-80-185.w90-88.abo.wanadoo.fr
 [90.88.22.185]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 30D24100010;
 Mon, 20 May 2019 12:44:37 +0000 (UTC)
Date: Mon, 20 May 2019 14:44:36 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Kamal Dasu <kdasu.kdev@gmail.com>
Subject: Re: [PATCH 2/2] mtd: nand: raw: brcmnand: fallback to detected
 ecc-strength, ecc-step-size
Message-ID: <20190520144436.67e42f00@xps13>
In-Reply-To: <1558117914-35807-2-git-send-email-kdasu.kdev@gmail.com>
References: <1558117914-35807-1-git-send-email-kdasu.kdev@gmail.com>
 <1558117914-35807-2-git-send-email-kdasu.kdev@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_054440_830373_0E66F333 
X-CRM114-Status: GOOD (  18.78  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgS2FtYWwsCgpLYW1hbCBEYXN1IDxrZGFzdS5rZGV2QGdtYWlsLmNvbT4gd3JvdGUgb24gRnJp
LCAxNyBNYXkgMjAxOSAxNDoyOTo1NQotMDQwMDoKCj4gVGhpcyBjaGFuZ2Ugc3VwcG9ydHMgbmFu
ZC1lY2Mtc3RlcC1zaXplIGFuZCBuYW5kLWVjYy1zdHJlbmdodCBmaWVsZHMgaW4KCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJlbmd0aAoK
PiBicmNtbmFuZCBkdCBub2RlIHRvIGJlICBvcHRpb25hbC4KCiAgICAgICAgICAgRFQgICAgICAg
ICAgICBeIGV4dHJhIHNwYWNlCgo+IHNlZTogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL210ZC9icmNtLGJyY21uYW5kLnR4dAo+IAo+IElmIGJvdGggbmFuZC1lY2Mtc3RyZW5ndGgg
YW5kIG5hbmQtZWNjLXN0ZXAtc2l6ZSBhcmUgbm90IHNwZWNpZmllZCBpbgo+IGRldmljZSB0cmVl
IG5vZGUgZm9yIE5BTkQsIG5hbmRfYmFzZSBkcml2ZXIgZG9lcyBkZXRlY3Qgb25maSBleHQgZWNj
CgpzL25hbmRfYmFzZSBkcml2ZXIvdGhlIHJhdyBOQU5EIGxheWVyLwpzL29uZmkvT05GSS8Kcy9l
Y2MvRUNDLwoKV2hhdCBpcyAiZXh0Ij8gUGxlYXNlIHVzZSBwbGFpbiBFbmdsaXNoIGhlcmUuCgo+
IGluZm8gZnJvbSBPTkZJIGV4dGVuZGVkIHBhcmFtZXRlciBwYWdlIGZvciBwYXJ0cyB1c2luZyBP
TkZJID49IDIuMS4gSW4KCnMvaW5mby9pbmZvcm1hdGlvbi8KCj4gY2FzZSBvZiBub24tb25maSBO
QU5EIHRoZXJlIGNvdWxkIGJlIGEgbmFuZF9pZCB0YWJsZSBlbnRyeSB3aXRoIHRoZSBlY2MKCnMv
ZWNjL0VDQy8KCj4gaW5mby4gSWYgdGhlcmUgaXMgYSB2YWxpZCAgZGV2aWNlIHRyZWUgZW50cnkg
Zm9yIG5hbmQtZWNjLXN0cmVuZ3RoIGFuZAo+IG5hbmQtZWNjLXN0ZXAtc2l6ZSBmaWVsZHMgaXQg
c3RpbGwgc2hhbGwgb3ZlcnJpZGUgdGhlIGRldGVjdGVkIHZhbHVlcy4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBLYW1hbCBEYXN1IDxrZGFzdS5rZGV2QGdtYWlsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9t
dGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYyB8IDEwICsrKysrKysrKysKPiAgMSBmaWxl
IGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQv
bmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21u
YW5kL2JyY21uYW5kLmMKPiBpbmRleCBjZTBiOGZmLi5lOTY3YjMwIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMKPiArKysgYi9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCj4gQEAgLTIxNDQsNiArMjE0NCwxNiBAQCBz
dGF0aWMgaW50IGJyY21uYW5kX3NldHVwX2RldihzdHJ1Y3QgYnJjbW5hbmRfaG9zdCAqaG9zdCkK
PiAgCQlyZXR1cm4gLUVJTlZBTDsKPiAgCX0KPiAgCj4gKwlpZiAoIShjaGlwLT5lY2Muc2l6ZSA+
IDAgJiYgY2hpcC0+ZWNjLnN0cmVuZ3RoID4gMCkgJiYKCklzIHRoZSBjYXNlIHdoZXJlIG9ubHkg
c2l6ZSBPUiBzdHJlbmd0aCBpcyB2YWxpZCBoYW5kbGVkPwoKPiArCSAgICAoY2hpcC0+YmFzZS5l
Y2NyZXEuc3RyZW5ndGggPiAwICYmCj4gKwkgICAgIGNoaXAtPmJhc2UuZWNjcmVxLnN0ZXBfc2l6
ZSA+IDApKSB7Cj4gKwkJLyogdXNlIGRldGVjdGVkIGVjYyBwYXJhbWV0ZXJzICovCgogICAgICAg
ICAgICAgICAgICAgVXNlICAgICAgICAgIEVDQwoKPiArCQljaGlwLT5lY2Muc2l6ZSA9IGNoaXAt
PmJhc2UuZWNjcmVxLnN0ZXBfc2l6ZTsKPiArCQljaGlwLT5lY2Muc3RyZW5ndGggPSBjaGlwLT5i
YXNlLmVjY3JlcS5zdHJlbmd0aDsKPiArCQlwcl9pbmZvKCJVc2luZyBkZXRlY3RlZCBuYW5kLWVj
Yy1zdGVwLXNpemUgJWQsIG5hbmQtZWNjLXN0cmVuZ3RoICVkXG4iLAo+ICsJCQljaGlwLT5lY2Mu
c2l6ZSwgY2hpcC0+ZWNjLnN0cmVuZ3RoKTsKPiArCX0KPiArCj4gIAlzd2l0Y2ggKGNoaXAtPmVj
Yy5zaXplKSB7Cj4gIAljYXNlIDUxMjoKPiAgCQlpZiAoY2hpcC0+ZWNjLmFsZ28gPT0gTkFORF9F
Q0NfSEFNTUlORykKCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
