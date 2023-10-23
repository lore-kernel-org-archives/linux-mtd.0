Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC09CDB474
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Oct 2023 07:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Eg92FlvXp161XcWFArKzRITa0zQHz6Q8IuLNXbysRCo=; b=kOah7WDPIHYAYe
	3010iYaPE84iX8dmAOz4YBNKVmqTKaZdefPuf2+csMmywYR45nOjzCEy4c40fakDK/yuhCPSX7BBD
	BX66xL74OUBXBVzH9TXB0b1MSJ4QUk6rDr8LHHDrHCqxDqtSgVjD+KXuj9Y1iFI7tqktfJLIO6HDI
	m7CzKbbqqmTu4MmviWRImyJOV79Hm/3ImjI//+hGTxKjR6OZ/baim+gtjNBSc1WJ4BopKHB05FhKJ
	8zVbf5kko1XChe6/pLAS1JbPp91uW9UokcvBYImu40zTSC3UhJ9+2ge3/dRjlURX1plNcJGq/274Q
	crPyX/+roQW7idf+owpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qupmA-006gwE-1V;
	Mon, 23 Oct 2023 07:55:02 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qupm7-006guT-0p
	for linux-mtd@lists.infradead.org;
	Mon, 23 Oct 2023 07:55:00 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 17C761C0007;
	Mon, 23 Oct 2023 07:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698047695;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9NG6Qfj/WvzlqK/Izjv2p/D3wthz19tmgf7a/knaCMY=;
	b=hHX6svNA8O44ORGFy2KuHXQI6HdTd0ct3xmsyiM8tjvU2ri8O1qHdk0pwbAV7fuIn9Pz6C
	RwziQHjcpNNtAGFk7em7mLUJ35b+87AbB8bDSx2Dj3wH/uD03XrZlSrBiOnt75StPEIL+B
	pSzK9cOn4TSIESr1oPxIdeL7E9kuok8REOmlf3eu0EgyVvsyFfSGmnnMAWLsoAMOyw1Tfq
	CYJuEsi2gHRFfK+M8oikm52DRszFLnVJly31hzJ8BiWFht8Xj7SflSxEOUP671J+6SDWiv
	gHBV0jmOFJ601FDlEUD8CiAEDh8Gsw3T2cmDn7+lKcM0LlgGT+eNzjG2cm+aow==
Date: Mon, 23 Oct 2023 09:54:51 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] mtd: rawnand: add support for TH58NYG3S0HBAI4 NAND
 flash
Message-ID: <20231023095451.65c4c0ec@xps-13>
In-Reply-To: <20231021150212.20509-1-amadeus@jmu.edu.cn>
References: <20231021150212.20509-1-amadeus@jmu.edu.cn>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_005459_445357_9C9A765D 
X-CRM114-Status: GOOD (  14.95  )
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

SGkgQ2h1a3VuLAoKYW1hZGV1c0BqbXUuZWR1LmNuIHdyb3RlIG9uIFNhdCwgMjEgT2N0IDIwMjMg
MjM6MDI6MTIgKzA4MDA6Cgo+IFRoZSBUb3NoaWJhIFRINThOWUczUzBIQkFJNCBpcyBkZXRlY3Rl
ZCB3aXRoIDEyOCBieXRlIE9PQiB3aGlsZSB0aGUgZmxhc2gKPiBoYXMgMjU2IGJ5dGVzIE9PQi4g
VGhpcyBhZGRzIGEgc3RhdGljIE5BTkQgSUQgZW50cnkgdG8gY29ycmVjdCB0aGlzLgoKQW55IHdh
eSB5b3UgY2FuIGRldGVjdCB0aGlzIGFuZCBmaXggdGhlIHBhcmFtZXRlciBwYWdlIGF0IHJ1biB0
aW1lCmluc3RlYWQ/Cgo+IFRlc3RlZCBvbiBBcmNhZHlhbiBBVzEwMDAgZmxhc2hlZCB3aXRoIE9w
ZW5XcnQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2h1a3VuIFBhbiA8YW1hZGV1c0BqbXUuZWR1LmNu
Pgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2lkcy5jIHwgMyArKysKPiAgMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9uYW5kX2lkcy5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9pZHMuYwo+
IGluZGV4IDY1MDM1MWM2MmFmNi4uMmI4NzFkZmQxZDA5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
bXRkL25hbmQvcmF3L25hbmRfaWRzLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5k
X2lkcy5jCj4gQEAgLTU4LDYgKzU4LDkgQEAgc3RydWN0IG5hbmRfZmxhc2hfZGV2IG5hbmRfZmxh
c2hfaWRzW10gPSB7Cj4gIAkJeyAuaWQgPSB7MHhhZCwgMHhkZSwgMHgxNCwgMHhhNywgMHg0Miwg
MHg0YX0gfSwKPiAgCQkgIFNaXzE2SywgU1pfOEssIFNaXzRNLCBOQU5EX05FRURfU0NSQU1CTElO
RywgNiwgMTY2NCwKPiAgCQkgIE5BTkRfRUNDX0lORk8oNDAsIFNaXzFLKSB9LAo+ICsJeyJUSDU4
TllHM1MwSEJBSTQgOEcgMS44ViA4LWJpdCIsCj4gKwkJeyAuaWQgPSB7MHg5OCwgMHhhMywgMHg5
MSwgMHgyNiwgMHg3Nn0gfSwKPiArCQkgIFNaXzRLLCBTWl8xSywgU1pfMjU2SywgMCwgNCwgMjU2
LCBOQU5EX0VDQ19JTkZPKDgsIFNaXzUxMikgfSwKPiAgCXsiVEg1OE5WRzJTM0hCQUk0IDRHIDMu
M1YgOC1iaXQiLAo+ICAJCXsgLmlkID0gezB4OTgsIDB4ZGMsIDB4OTEsIDB4MTUsIDB4NzZ9IH0s
Cj4gIAkJICBTWl8ySywgU1pfNTEyLCBTWl8xMjhLLCAwLCA1LCAxMjgsIE5BTkRfRUNDX0lORk8o
OCwgU1pfNTEyKSB9LAoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
