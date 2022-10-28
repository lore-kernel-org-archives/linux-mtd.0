Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C8CC38A02
	for <linux-mtd@archiver.kernel.org>; Sat, 29 Oct 2022 00:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K+MLSQU5FJfR8V9Y/hp8FZcAfjiU7GB3AwGFujutWQQ=; b=FTmct/jqqR+ngV
	hN6vEVhD9Q3U+3rrPJaExWCSI3qMkr/rtYbztuhzjOkWgXLpfpp5YcMCBoONqACGXL2VnqO8OLJe2
	+6cP1DCcwSg/famPSk0y5YoB67le2ToE1eXGQhBbkpDV3TPyn2qhKoWsc79gIs773q6OHHygQa8oF
	XFmJaUmWhBdl1rjtMRXqmWaEz5XnurVv71HeT0oZrRysEOJiW0HiYh8vZQdbRR/qZaokHNeEjvEGv
	RLyzE9DK+9QPa25Z7EhC0L4wXWgApZeKn3hGVfLgt88fSBQzed1JGiDIc7gUU6VHvYpKfyjIlHXfH
	TCrWsod9B/c+a5GULcSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooZIC-003KVP-NC; Sat, 29 Oct 2022 00:01:40 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooZGM-003JhM-0H; Fri, 28 Oct 2022 23:59:49 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id BBAFCFF802;
	Fri, 28 Oct 2022 23:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667001576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zC82iFrlIYbSsP6fbExDAPio+9uwFvsxm72+V19fmUQ=;
	b=R2AMi4l+N69yWcGSR7WvtK5yF4dZv9jT7XFuGPsfTZl22MAuEiTIBoq5ZcYVpqLHufCBMH
	e2IofCj9i7rtK3BGWV0yZZnqn//kfOwsYzyqgqd16lV9dEZ6ypbVyJN4B0a5iSxt0JzUcq
	A+5tFYsb4c7LVz1GM1LHFyesQiWAevQh+zUhv8AVIKcg2EcqtU6zjGlgf0w9pR0/7fjwyk
	kO8qv+n9lGxo6+o9nGZMcXBaptnZf7N86lEOR3mxhGGloq7BsVnScVuWWo2G69SdHBrMXY
	Eyrb+XiexTTSaOXf7XXa2/8X7p+t1hEdyrhcGWSMacC4LFRokRqXEpXPOEVnNg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <Tudor.Ambarus@microchip.com>,
	Pratyush Yadav <p.yadav@ti.com>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org
Cc: Chen-Yu Tsai <wens@csie.org>,
	Naga Sureshkumar Relli <nagasure@xilinx.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 00/12] Improve MTD bindings
Date: Sat, 29 Oct 2022 01:59:21 +0200
Message-Id: <20221028235933.934850-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_165946_347504_8C2629DA 
X-CRM114-Status: GOOD (  12.84  )
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

SGVsbG8sCgpEdXJpbmcgYSB5YW1sIGNvbnZlcnNpb24gcmV2aWV3LCBLcnp5c3p0b2Ygb3BlbmVk
IHRoZSBkaXNjdXNzaW9uIGFib3V0CnRoZSBsaW5rcyBhbmQgcmVmZXJlbmNlcyBtYWRlIGJldHdl
ZW4gdGhlIGRpZmZlcmVudCBmaWxlcyBpbiB0aGUgbXRkCmJpbmRpbmdzLiBJIGZpZ3VyZWQgb3V0
IHNvbWUgbWluaW1hbCBjaGFuZ2VzIG1pZ2h0IGJlIG5lZWRlZCB0byBwcm9wZXJseQpyZWZlcmVu
Y2UgZXZlcnl0aGluZyBjb3JyZWN0bHkgYW5kIGVuc3VyZSB3ZSBjb25zdHJhaW4gYXMgbXVjaCBh
cwpwb3NzaWJsZSB0aGUgZXhpc3RpbmcgYmluZGluZ3MuIFRoYXQgaXMgd2hhdCBJIHRyaWVkIHRv
IGRvIGhlcmUuCgpUaGUgaWRlYSBpczoKKiBwYXJ0aXRpb24ueWFtbCBkZWZpbmVzIG9uZSBNVEQg
cGFydGl0aW9uCiogcGFyc2Vycy8qLnlhbWwgZGVmaW5lIHBhcnRpdGlvbiBwYXJzZXJzIChtYWlu
bHkgY29tcGF0aWJsZXMpCiogbXRkLnlhbWwgY29udGFpbnMgdGhlIGdlbmVyaWMgZGVmaW5pdGlv
biBvZiBhbnkgbXRkIGRldmljZSAobmFuZCwKICBzcGktbmFuZCwgc3BpLW5vciwgbm9yLCBzcmFt
LCBldGMpLCBpbiBwYXJ0aWN1bGFyLCBpdCBkZWZpbmVzIHRoZQogIHZhcmlvdXMgcGFydGl0aW9u
IGZvcm1hdHMgKGxlZ2FjeSBhbmQgY3VycmVudCkgYW5kIHJlZmVyZW5jZXMKICBwYXJ0aXRpb24u
eWFtbCBhcyB3ZWxsIGFzIGEgbGlzdCBvZiBhbGwgdGhlIHBvc3NpYmxlIHBhcnNlcnMgd2l0aGlu
IGEKICAicGFydGl0aW9ucyIgbm9kZS4KKiBuYW5kLWNoaXAueWFtbCwgamVkZWMsc3BpLW5vciwg
bXRkLXBoeXNtYXAueWFtbCBhbGwgZGVzY3JpYmUgcmVhbAogIGluc3RhbmNlcyBvZiBtdGQgZGV2
aWNlLCBlYWNoIG9mIHRoZW0gd2l0aCBhIGRpZmZlcmVudCB1bmRlcmx5aW5nCiAgdGVjaG5vbG9n
eSwgdGhleSByZWZlcmVuY2UgbXRkLnlhbWwgCiogbmFuZC1jb250cm9sbGVyLnlhbWwgaGFzIHN1
Ym5vZGVzIHdoaWNoIHJlZmVyZW5jZSBuYW5kLWNoaXAueWFtbC4KKiBTcGVjaWZpYyBOQU5EIGNv
bnRyb2xsZXIgYmluZGluZ3MgcmVmZXJlbmNlIG5hbmQtY29udHJvbGxlci55YW1sLgoKSSd2ZSB0
ZXN0ZWQgd2l0aCB0aGUgZm9sbG93aW5nIGNvbW1hbmQgYW5kIGl0IHdvcmtlZCBva2F5OgokIG1h
a2UgZHRfYmluZGluZ19jaGVjayAtajEwIERUX0NIRUNLRVJfRkxBRz0tbSBEVF9TQ0hFTUFfRklM
RVM9bXRkLwoKQ29tbWVudHMgd2VsY29tZSBvZiBjb3Vyc2UgOi0pCgpDaGVlcnMsCk1pcXXDqGwK
Ck1pcXVlbCBSYXluYWwgKDEyKToKICBkdC1iaW5kaW5nczogbXRkOiBDbGFyaWZ5IGFsbCBwYXJ0
aXRpb24gc3Vibm9kZXMKICBkdC1iaW5kaW5nczogbXRkOiBNZW50aW9uIGJhc2ljIHByb3BlcnRp
ZXMKICBkdC1iaW5kaW5nczogbXRkOiBSZW1vdmUgdXNlbGVzcyBmaWxlIGFib3V0IHBhcnRpdGlv
bnMKICBkdC1iaW5kaW5nczogbXRkOiBpbmdlbmljOiBNYXJrIHBhcnRpdGlvbnMgaW4gdGhlIGNv
bnRyb2xsZXIgbm9kZSBhcwogICAgZGVwcmVjYXRlZAogIGR0LWJpbmRpbmdzOiBtdGQ6IG9uZW5h
bmQ6IE1lbnRpb24gdGhlIGV4cGVjdGVkIG5vZGUgbmFtZQogIGR0LWJpbmRpbmdzOiBtdGQ6IG5h
bmQtY2hpcDogUmVmZXJlbmNlIG10ZC55YW1sCiAgZHQtYmluZGluZ3M6IG10ZDogRHJvcCBjb21t
b24gcHJvcGVydGllcyBmcm9tIE5BTkQgY29udHJvbGxlcnMKICBkdC1iaW5kaW5nczogbXRkOiBz
cGktbm9yOiBEcm9wIGNvbW1vbiBwcm9wZXJ0aWVzCiAgZHQtYmluZGluZ3M6IG10ZDogcGh5bWFw
OiBSZXVzZSB0aGUgZ2VuZXJpYyBkZWZpbml0aW9ucwogIGR0LWJpbmRpbmdzOiBtdGQ6IERyb3Ag
b2JqZWN0IHR5cGVzIHdoZW4gcmVmZXJlbmNpbmcgb3RoZXIgZmlsZXMKICBkdC1iaW5kaW5nczog
bXRkOiBBcmd1ZSBpbiBmYXZvciBvZiBrZWVwaW5nIGFkZGl0aW9uYWxQcm9wZXJ0aWVzIHNldAog
ICAgdG8gdHJ1ZQogIGR0LWJpbmRpbmdzOiBtdGQ6IENvbnN0cmFpbiB0aGUgbGlzdCBvZiBwYXJz
ZXJzCgogLi4uL210ZC9hbGx3aW5uZXIsc3VuNGktYTEwLW5hbmQueWFtbCAgICAgICAgIHwgIDMg
LS0KIC4uLi9iaW5kaW5ncy9tdGQvYXJhc2FuLG5hbmQtY29udHJvbGxlci55YW1sICB8ICAzIC0t
CiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvaW5nZW5pYyxuYW5kLnlhbWwgfCAxMyArLS0t
LS0KIC4uLi9iaW5kaW5ncy9tdGQvaW50ZWwsbGdtLWVidW5hbmQueWFtbCAgICAgICB8IDEwICst
LS0tCiAuLi4vYmluZGluZ3MvbXRkL2plZGVjLHNwaS1ub3IueWFtbCAgICAgICAgICAgfCAxNCAt
LS0tLS0tCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvbXRkLXBoeXNtYXAueWFtbCAgfCAg
NyArKy0tCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvbXRkLnlhbWwgICAgICAgICAgfCA0
MSArKysrKysrKysrKysrKysrKystCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvbmFuZC1j
aGlwLnlhbWwgICAgfCAgNCArKwogLi4uL2JpbmRpbmdzL210ZC9uYW5kLWNvbnRyb2xsZXIueWFt
bCAgICAgICAgIHwgIDEgLQogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbi50
eHQgICAgIHwgMzMgLS0tLS0tLS0tLS0tLS0tCiAuLi4vYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMv
cGFydGl0aW9uLnlhbWwgICAgfCAgMSArCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcWNv
bSxuYW5kYy55YW1sICAgfCAgMyAtLQogLi4uL2JpbmRpbmdzL210ZC90aSxncG1jLW9uZW5hbmQu
eWFtbCAgICAgICAgIHwgIDMgKysKIDEzIGZpbGVzIGNoYW5nZWQsIDUyIGluc2VydGlvbnMoKyks
IDg0IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9uLnR4dAoKLS0gCjIuMzQuMQoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
