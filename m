Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54210C433FE
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Dec 2021 14:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lFyQ/wnHikZ26OAMyGBYFttUS4b9zAZTooW5fuANQ4g=; b=2K5lMrPTMc8Oye
	qoMbSq9ur+UkJSUxg9Ozk8eYpmHqlx/dwrCwztu9iAp8pFFvb2hubRefbmlLSowoIO2kIjZHq3K+/
	802NQgfmDOezgs7XCPZLzZXIUBpt9qAIWoZnTgMDvCrhVturisxfKUR/f20OEZoyojddlF1IhxUks
	iYKSnpYPJK2r9s6Ou+BPAR1sFN7FQAZXLn30h0j0v3MDHmRf4lr/t7lav5opiHeaA7OEq36CcgKQ8
	MhLimDml9UFD5E/3EdxvwuCHYlNgehCu0VBYA6gfjNHzDEnw7yXhwVvZekh7eZHEE7AFhh7bBYfFg
	lNX4ys2DOFTUen7s+upA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myE6F-00AbEk-ND; Fri, 17 Dec 2021 14:20:43 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myE6C-00AbDJ-Ai
 for linux-mtd@lists.infradead.org; Fri, 17 Dec 2021 14:20:42 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 4EBDB60011;
 Fri, 17 Dec 2021 14:20:34 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>
Cc: Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
 Milan Stevanovic <milan.stevanovic@se.com>,
 Jimmy Lalande <jimmy.lalande@se.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
 Gareth Williams <gareth.williams.jx@renesas.com>,
 Phil Edworthy <phil.edworthy@renesas.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Wolfram Sang <wsa@kernel.org>,
 Chris Brandt <Chris.Brandt@renesas.com>,
 Ralph Siemsen <ralph.siemsen@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v6 0/4] Renesas NAND controller support
Date: Fri, 17 Dec 2021 15:20:29 +0100
Message-Id: <20211217142033.353599-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_062040_673171_6A1A736E 
X-CRM114-Status: GOOD (  18.32  )
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

SGVsbG8sCgpIZXJlIGlzIGEgc2hvcnQgc2VyaWVzIGJyaW5naW5nIHN1cHBvcnQgZm9yIFJlbmVz
YXMgTkFORCBjb250cm9sbGVyCmZvdW5kIG9uIFItQ2FyIEdlbjMgYW5kIFJaL04xIFNvQ3MuCgpU
aGUgZHJpdmVyIGhhcyBiZWVuIHRlc3RlZCB3aXRoIGEgZnVsbHktdXBzdHJlYW0gZGV2aWNlIHRy
ZWUgb24gdG9wIG9mIGEKdjUuMTYtcmM0LiBUaGUgRFQgdXNlZCBpcyB2ZXJ5IGNsb3NlIHRvIHRo
ZSByOWEwNmcwMzItZGIuCgpDaGVlcnMsCk1pcXXDqGwKCkNoYW5nZXMgaW4gdjY6CiogQWRkZWQg
R2VlcnQncyBSLWJ5IG9uIHRoZSBEVCBwYXRjaC4KKiBDaGFuZ2VkIGFsbCB0aGUgbmFtaW5nIGR1
ZSB0byBXb2xmcmFtJ3MgZmVlZGJhY2suIFRoaXMgY29udHJvbGxlciBpcwogIGFsc28gZm91bmQg
b24gdGhlIFItQ2FyIEdlbjMgZmFtaWx5LiBIZW5jZSBJIHVzZWQgYSBtdWNoIG1vcmUgZ2VuZXJp
YwogIG5hbWUgZm9yIHRoZSBkcml2ZXIsIHRoZSBiaW5kaW5ncywgdGhlIHZhcmlhYmxlcywgZXRj
LiBUaGUgYmluZGluZ3MKICBoYXZlIGJlZW4gdXBkYXRlZCB0byBtYXRjaCB0aGUgdHdvIGRpZmZl
cmVudCBTb0MgZmFtaWxpZXMgYXMgd2VsbC4KKiBVcGRhdGVkIHRoZSBNT0RVTEVfTElDRU5TRSBt
YWNybyBhcyBzdWdnZXN0ZWQgYnkgV29sZnJhbS4KIApDaGFuZ2VzIGluIHY1OgoqIEFkZCBSb2In
cyBhY2sgb24gdGhlIGJpbmRpbmdzLgoqIERyb3BwZWQgdGhlICNhZGRyZXNzL3NpemUtY2VsbHMg
cHJvcGVydGllcyAoaGFuZGxlZCBieSBuYW5kLWNvbnRyb2xsZXIueWFtbCkuCiogRml4ZWQgYSB0
eXBvIHJlcG9ydGVkIGJ5IHRoZSBrZXJuZWwgdGVzdCByb2JvdCAod2hlbiBidWlsZGluZyBhcyBh
IG1vZHVsZSkuCgpDaGFuZ2VzIGluIHY0OgoqIFNldCB1bmV2YWx1YXRlZFByb3BlcnRpZXMgc2V0
IHRvIGZhbHNlIGluIHRoZSBiaW5kaW5ncy4KKiBDaGFuZ2UgdGhlIGNsb2NrIG5hbWVzIGJ5IHJl
bW92aW5nIHRoZSBuYW5kXyBwcmVmaXggd2hpY2ggaXMKICByZWR1bmRhbnQsIGV2ZW4gdGhvdWdo
IHRoZSBjbG9ja3MgYXJlIG5hbWVkIGxpa2UgdGhpcyBpbiB0aGUgc3BlYy4gVGhlCiAgbmFtZSBy
ZW1haW5zIGNsZWFyIGVub3VnaCBhbnl3YXkuCgpDaGFuZ2VzIGluIHYzOgoqIFJlYmFzZWQgb24g
dG9wIG9mIGEgZnVsbHktdXBzdHJlYW0gcmVjZW50IGtlcm5lbC4KKiBSZW5hbWVkIHRoZSBjbG9j
a3MgaW4gdGhlIGJpbmRpbmdzIGFuZCB0aGUgZHJpdmVyIHRvIG1hdGNoIHRoZQogIGRvY3VtZW50
YXRpb24gKGxvd2VyLWNhc2VkKTogbmFuZF9oY2xrICYgbmFuZF9lY2xrLgoqIEFkZGVkIGEgbmV3
IGNvbW1pdCBkZXNjcmliaW5nIHRoZSBOQU5EIGNvbnRyb2xsZXIgaW4gdGhlIHI5YTA2ZzAzMgog
IERUU0kuCiogQWRkZWQgdGhlIFJldmlld2VkLWJ5IGFuZCBUZXN0ZWQtYnkgdGFncyByZWNlaXZl
ZC4KCkNoYW5nZXMgaW4gdjI6CiogQWRkZWQgdGhlIGZhbWlseS1zcGVjaWZpYyByem4xIGNvbXBh
dGlibGUgYXMgc3VnZ2VzdGVkIGJ5IEdlZXJ0LgogIFVwZGF0ZWQgdGhlIGJpbmRpbmdzLCB0aGUg
YmluZGluZyBmaWxlIG5hbWUsIHRoZSBjb21wYXRpYmxlIHVzZWQgaW4KICB0aGUgZHJpdmVyLCB0
aGUgTUFJTlRBSU5FUlMgZW50cnksIGV0Yy4KKiBBZGRlZCBhbiBBUkNIX1JFTkVTQVMgS2NvbmZp
ZyBkZXBlbmRlbmN5LgoqIENoYW5nZWQgdGhlIHR5cGUgKHRvIHVuc2lnbmVkKSBvZiBhIGNvdXBs
ZSBvZiB2YXJpYWJsZXMuCiogUmV0dXJuZWQgZWFybGllciB3aGVuIHBvc3NpYmxlIHRvIHJlZHVj
ZSBpbmRlbnRhdGlvbi4KKiBVc2VkIHBsYXRmb3JtX2dldF9pcnFfb3B0aW9uYWwoKSBpbnN0ZWFk
IG9mIHBsYXRmb3JtX2dldF9pcnEoKSB0byBhdm9pZAogIGEgdXNlbGVzcyB3YXJuaW5nLgoqIEhh
bmRsZWQgcHJvYmUgZGVmZXJyYWwgY29ycmVjdGx5LgoqIEFwcGxpZWQgYSBtYXNzaXZlIHMvbmZj
L25hbmRjLyBhcyBzdWdnZXN0ZWQgYnkgR2VlcnQgdG8gYXZvaWQKICBjb25mdXNpb25zIHdpdGgg
dGhlIG5lYXItZmllbGQtY29tbXVuaWNhdGlvbiBkZXZpY2UuCiogTWVudGlvbmVkIEV2YXRyb25p
eCBhcyBvcmlnaW5hbCBhdXRob3JzIG9mIHRoZSBJUCBpbiB0aGUgY29tbWl0IGxvZyBhbmQKICBp
biB0aGUgaGVhZGVyLgoqIEFkZGVkIGFuIGFkZGl0aW9uYWwgY2hlY2sgb24gdGhlIHZhbGlkaXR5
IG9mIHRoZSBjaGlsZCBub2RlcyByZWcgcHJvcGVydHkuCiogQSBjb3VwbGUgb2Ygc3R5bGUgZml4
ZXMuCgpNaXF1ZWwgUmF5bmFsICg0KToKICBkdC1iaW5kaW5nczogbXRkOiByZW5lc2FzOiBEZXNj
cmliZSBSZW5lc2FzIFItQ2FyIEdlbjMgJiBSWi9OMSBOQU5ECiAgICBjb250cm9sbGVyCiAgbXRk
OiByYXduYW5kOiByZW5lc2FzOiBBZGQgbmV3IE5BTkQgY29udHJvbGxlciBkcml2ZXIKICBNQUlO
VEFJTkVSUzogQWRkIGFuIGVudHJ5IGZvciBSZW5lc2FzIE5BTkQgY29udHJvbGxlcgogIEFSTTog
ZHRzOiByOWEwNmcwMzI6IERlc2NyaWJlIHRoZSBOQU5EIGNvbnRyb2xsZXIKCiAuLi4vYmluZGlu
Z3MvbXRkL3JlbmVzYXMtbmFuZGMueWFtbCAgICAgICAgICAgfCAgIDY2ICsKIE1BSU5UQUlORVJT
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDcgKwogYXJjaC9hcm0vYm9v
dC9kdHMvcjlhMDZnMDMyLmR0c2kgICAgICAgICAgICAgIHwgICAxMSArCiBkcml2ZXJzL210ZC9u
YW5kL3Jhdy9LY29uZmlnICAgICAgICAgICAgICAgICAgfCAgICA3ICsKIGRyaXZlcnMvbXRkL25h
bmQvcmF3L01ha2VmaWxlICAgICAgICAgICAgICAgICB8ICAgIDEgKwogLi4uL210ZC9uYW5kL3Jh
dy9yZW5lc2FzLW5hbmQtY29udHJvbGxlci5jICAgIHwgMTQyNCArKysrKysrKysrKysrKysrKwog
NiBmaWxlcyBjaGFuZ2VkLCAxNTE2IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3JlbmVzYXMtbmFuZGMueWFtbAog
Y3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbXRkL25hbmQvcmF3L3JlbmVzYXMtbmFuZC1jb250
cm9sbGVyLmMKCi0tIAoyLjI3LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
