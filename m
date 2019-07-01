Return-Path: <SRS0=0U+/=U6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6B7BC0650E
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jul 2019 07:18:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B67620652
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jul 2019 07:18:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SgiYBT1d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B67620652
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n9Fe6kTe0TDh9vkWrY9tkJgPmtedXfZiccfOO1JckII=; b=SgiYBT1dQNgO7P
	K8gwXi5btTFOQJkTnn7FD9KThv4V/kcyfK8M2fc0MpJqBGvNAk6SwBVnP2uvzFVte1O8DvpsV2wSu
	UvCgsQusjbI92Fxv2yFDxPzieRY5UKAa/8qQB9TgHdSvx9ZLTbE0zGQjJxhweXNVZmPHIQBGTs9j7
	sUEtIUty+3xPeSmjCYImSRgxfxJLgeH0CMtewAoOxCWfe08lfJpar6Hnde2f8FZCkvverxx3CsKHO
	gR+uihQEHYGy5NImcbFrtTWAPwkFCVzI7aFgWOdB9PnCO+X+pOkYiSmyeOYOHGFYLf5hNSjzrdQKV
	MQ7/CMeUSHyBe+M3jbyg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hhqZg-0003kb-Vh; Mon, 01 Jul 2019 07:18:04 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hhqZe-0003jr-1h
 for linux-mtd@lists.infradead.org; Mon, 01 Jul 2019 07:18:03 +0000
X-Originating-IP: 86.250.200.211
Received: from xps13 (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 2EFB8240002;
 Mon,  1 Jul 2019 07:17:57 +0000 (UTC)
Date: Mon, 1 Jul 2019 09:17:57 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH] mtd: onenand_base: Mark expected switch fall-through
Message-ID: <20190701091757.591051b5@xps13>
In-Reply-To: <20190604141737.GA1064@embeddedor>
References: <20190604141737.GA1064@embeddedor>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190701_001802_244470_DB471294 
X-CRM114-Status: GOOD (  16.08  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
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
 Jonathan Bakker <xc-racer2@live.ca>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgR3VzdGF2bywKCiJHdXN0YXZvIEEuIFIuIFNpbHZhIiA8Z3VzdGF2b0BlbWJlZGRlZG9yLmNv
bT4gd3JvdGUgb24gVHVlLCA0IEp1biAyMDE5CjA5OjE3OjM3IC0wNTAwOgoKPiBJbiBwcmVwYXJh
dGlvbiB0byBlbmFibGluZyAtV2ltcGxpY2l0LWZhbGx0aHJvdWdoLCBtYXJrIHN3aXRjaCBjYXNl
cwo+IHdoZXJlIHdlIGFyZSBleHBlY3RpbmcgdG8gZmFsbCB0aHJvdWdoLgo+IAo+IFRoaXMgcGF0
Y2ggZml4ZXMgdGhlIGZvbGxvd2luZyB3YXJuaW5nOgo+IAo+IGRyaXZlcnMvbXRkL25hbmQvb25l
bmFuZC9vbmVuYW5kX2Jhc2UuYzogSW4gZnVuY3Rpb24g4oCYb25lbmFuZF9jaGVja19mZWF0dXJl
c+KAmToKPiBkcml2ZXJzL210ZC9uYW5kL29uZW5hbmQvb25lbmFuZF9iYXNlLmM6MzI2NDoxNzog
d2FybmluZzogdGhpcyBzdGF0ZW1lbnQgbWF5IGZhbGwgdGhyb3VnaCBbLVdpbXBsaWNpdC1mYWxs
dGhyb3VnaD1dCj4gICAgdGhpcy0+b3B0aW9ucyB8PSBPTkVOQU5EX0hBU19OT1BfMTsKPiBkcml2
ZXJzL210ZC9uYW5kL29uZW5hbmQvb25lbmFuZF9iYXNlLmM6MzI2NToyOiBub3RlOiBoZXJlCj4g
ICBjYXNlIE9ORU5BTkRfREVWSUNFX0RFTlNJVFlfNEdiOgo+ICAgXn5+fgo+IAo+IFdhcm5pbmcg
bGV2ZWwgMyB3YXMgdXNlZDogLVdpbXBsaWNpdC1mYWxsdGhyb3VnaD0zCj4gCj4gVGhpcyBwYXRj
aCBpcyBwYXJ0IG9mIHRoZSBvbmdvaW5nIGVmZm9ydHMgdG8gZW5hYmxlCj4gLVdpbXBsaWNpdC1m
YWxsdGhyb3VnaC4KPiAKPiBDYzogSm9uYXRoYW4gQmFra2VyIDx4Yy1yYWNlcjJAbGl2ZS5jYT4K
PiBTaWduZWQtb2ZmLWJ5OiBHdXN0YXZvIEEuIFIuIFNpbHZhIDxndXN0YXZvQGVtYmVkZGVkb3Iu
Y29tPgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL29uZW5hbmQvb25lbmFuZF9iYXNlLmMgfCAx
ICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbXRkL25hbmQvb25lbmFuZC9vbmVuYW5kX2Jhc2UuYyBiL2RyaXZlcnMvbXRkL25hbmQv
b25lbmFuZC9vbmVuYW5kX2Jhc2UuYwo+IGluZGV4IGJhNDZkMGNmNjBhMS4uYmRiNWY0NzMzZDI4
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvb25lbmFuZC9vbmVuYW5kX2Jhc2UuYwo+
ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvb25lbmFuZC9vbmVuYW5kX2Jhc2UuYwo+IEBAIC0zMjYy
LDYgKzMyNjIsNyBAQCBzdGF0aWMgdm9pZCBvbmVuYW5kX2NoZWNrX2ZlYXR1cmVzKHN0cnVjdCBt
dGRfaW5mbyAqbXRkKQo+ICAJc3dpdGNoIChkZW5zaXR5KSB7Cj4gIAljYXNlIE9ORU5BTkRfREVW
SUNFX0RFTlNJVFlfOEdiOgo+ICAJCXRoaXMtPm9wdGlvbnMgfD0gT05FTkFORF9IQVNfTk9QXzE7
Cj4gKwkJLyogZmFsbCB0aHJvdWdoICovCj4gIAljYXNlIE9ORU5BTkRfREVWSUNFX0RFTlNJVFlf
NEdiOgo+ICAJCWlmIChPTkVOQU5EX0lTX0REUCh0aGlzKSkKPiAgCQkJdGhpcy0+b3B0aW9ucyB8
PSBPTkVOQU5EX0hBU18yUExBTkU7CgoKQXBwbGllZCB0byBuYW5kL25leHQsIHRoYW5rcy4KCk1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
