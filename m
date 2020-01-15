Return-Path: <SRS0=8YuD=3E=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EFC9C33CB1
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jan 2020 08:13:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 620C924671
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jan 2020 08:13:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U+Plap7z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 620C924671
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RK6N+yyIWInYhfFERnTftBgsDvRekKT0d5vkEuEY8/w=; b=U+Plap7zm1pWx5
	xmIr6Gbx0N9arkjGR2C2zN6lF5jzDh7ivsqGGixXO8qmyiHriqFA5r//OxxxMUWZzrZHHCfDi7Oi9
	yBjhSkc7/Gpy24RLiuZ5w0XS1NIO2V0R9UFDGBECxc4fUa/3vSCl+xqZIUsIYXlZ2LEjVossoEVOp
	F1V8BErZ1tnpaQzZuoakBEoJVWh1epAwbI7NuAw3BU7G56gvfMiO04ZBK/HiQI/y6EBi+W9nWORb6
	HDEfB1heBQWr5i2dS8Shiqjd5BFKI8tBOEDa4xaf/NbbZDyCe77TN+DpPQ/CkZu8Z7jY7aG6upDLb
	HZ8k1SRAPlQAktQFXCzg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irdo9-0007NT-CE; Wed, 15 Jan 2020 08:13:45 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irdo1-0007F5-D3
 for linux-mtd@lists.infradead.org; Wed, 15 Jan 2020 08:13:41 +0000
X-Originating-IP: 90.76.211.102
Received: from xps13 (lfbn-tou-1-1151-102.w90-76.abo.wanadoo.fr
 [90.76.211.102]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 300B71C000A;
 Wed, 15 Jan 2020 08:13:26 +0000 (UTC)
Date: Wed, 15 Jan 2020 09:13:25 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [RFC PATCH 0/3] Fix proposal for the Micron shallow erase issue
Message-ID: <20200115091325.667c06a8@xps13>
In-Reply-To: <20200115085806.218b6b32@collabora.com>
References: <20191231192656.16376-1-miquel.raynal@bootlin.com>
 <a2199251-882a-5067-fe4c-47f1c8a252fe@gmail.com>
 <20200114101219.4b951dfe@xps13>
 <8fac8e86-3455-271d-2fcb-c2a6070e8127@cumminsallison.com>
 <20200115085806.218b6b32@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200115_001337_587899_AB1DD7B4 
X-CRM114-Status: GOOD (  17.43  )
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
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Zoltan
 Szubbocsev <zszubbocsev@micron.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>, "Wojtaszczyk,
 Piotr" <WojtaszczykP@cumminsallison.com>, Bean Huo <beanhuo@micron.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQm9yaXMsCgpCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29t
PiB3cm90ZSBvbiBXZWQsIDE1IEphbgoyMDIwIDA4OjU4OjA2ICswMTAwOgoKPiBPbiBUdWUsIDE0
IEphbiAyMDIwIDIwOjQ2OjE3ICswMDAwCj4gIldvanRhc3pjenlrLCBQaW90ciIgPFdvanRhc3pj
enlrUEBjdW1taW5zYWxsaXNvbi5jb20+IHdyb3RlOgo+IAo+ID4gT24gMS8xNC8yMCAzOjEyIEFN
LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOiAgCj4gPiA+IENyYXAuIEknbGwgbm90IHJlc2VuZCBpbW1l
ZGlhdGVseSBhcyB0aGlzIGlzIGFuIFJGQywgSSBleHBlY3QKPiA+ID4gZmVlZGJhY2sgb24gdGhp
cyBwcm9wb3NhbCBiZWZvcmUgc2VuZGluZyBhbiBhY3R1YWwgcGF0Y2guCj4gPiA+IAo+ID4gPiAK
PiA+ID4gVGhhbmtzLAo+ID4gPiBNaXF1w6hsCj4gPiA+ICAgICAKPiA+IAo+ID4gSGkgTWlxdcOo
bCwgaGVyZSBhcmUgc29tZSBteSBjb21tZW50czoKPiA+IAo+ID4gK3N0YXRpYyBpbnQgbWljcm9u
X25hbmRfYXZvaWRfc2hhbGxvd19lcmFzZShzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLAo+ID4gKwkJ
CQkJICAgdW5zaWduZWQgaW50IGViKQo+ID4gK3sKPiA+ICsJc3RydWN0IG1pY3Jvbl9uYW5kICpt
aWNyb24gPSBuYW5kX2dldF9tYW51ZmFjdHVyZXJfZGF0YShjaGlwKTsKPiA+ICsJdW5zaWduZWQg
aW50IHBhZ2UgPSBlYiAqIG5hbmRkZXZfcGFnZXNfcGVyX2VyYXNlYmxvY2soJmNoaXAtPmJhc2Up
Owo+ID4gKwl1OCAqZGF0YWJ1ZiA9IG5hbmRfZ2V0X2RhdGFfYnVmKGNoaXApOwo+ID4gKwlpbnQg
cmV0LCBpOwo+ID4gKwo+ID4gKwltZW1zZXQoZGF0YWJ1ZiwgMHhGRiwgbmFuZGRldl9wYWdlX3Np
emUoJmNoaXAtPmJhc2UpKTsKPiA+ICsKPiA+ICsJLyogTWljcm9uIGFkdmlzZXMgdG8gb25seSB3
cml0ZSBvZGQgcGFnZXMgKi8KPiA+ICsJZm9yIChpID0gMDsgaSA8IE1JQ1JPTl9TSEFMTE9XX0VS
QVNFX01JTl9QQUdFOyBpICs9IDIsIHBhZ2UgKz0gMikgewo+ID4gKwkJaWYgKCEobWljcm9uLT53
cml0dGVucFtlYl0gJiBCSVQoaSkpKSB7Cj4gPiArCQkJcmV0ID0gbmFuZF93cml0ZV9wYWdlX3Jh
dyhjaGlwLCBkYXRhYnVmLCBmYWxzZSwgcGFnZSk7Cj4gPiArCQkJaWYgKHJldCkKPiA+ICsJCQkJ
cmV0dXJuIHJldDsKPiA+ICsJCX0KPiA+ICsJfQo+ID4gKwo+ID4gKwlyZXR1cm4gMDsKPiA+ICt9
Cj4gPiAKPiA+IFNob3VsZG4ndCB3ZSBwcm9ncmFtIG9ubHkgdGhlIE9PQiBhcmVhIG9mIHRoZSBw
YWdlcyB0byAwJ2VzPyBQcm9ncmFtbWluZyBwYWdlcyB0byAweEZGIAo+ID4gd2hpY2ggYXJlIGFs
cmVhZHkgMHhGRiB0YWtlcyBtb3JlIHRpbWUgYW5kIGRvZXNuJ3QgbWFrZSBhbnkgZGlmZmVyZW5j
ZS4gIAo+IAo+IEhtLCBJJ20gcHJldHR5IHN1cmUgd2Ugc2hvdWxkIHNldCBpbi1iYW5kIGRhdGEg
dG8gMCwgbm90IDB4ZmYuCj4gUHJvZ3JhbW1pbmcgb25seSB0aGUgT09CIHBvcnRpb24gbWlnaHQg
bm90IGJlIGVub3VnaCBmb3IgdGhlIGludGVybmFsCj4gImlzIHBhZ2Ugd3JpdHRlbj8iIGxvZ2lj
IHRvIHJldHVybiB0cnVlLgoKQWJzb2x1dGVseSwgdGhpcyBpcyBhIG1pc3Rha2UsIHRoZSBpZGVh
IGlzIHRvIHByb2dyYW0gYWxsIGNlbGxzICh0byAwKS4KCj4gPiBBbHNvIGFmdGVyIHBvd2VyIGxv
c3MgYWxsIGZsYWdzIGluIG1pY3Jvbi0+d3JpdHRlbnAgYXJlIGdvbmUgc28gdGhlIAo+ID4gbWlj
cm9uX25hbmRfYXZvaWRfc2hhbGxvd19lcmFzZSB3aWxsIHBlcmZvcm0gb24gYWxsIFBFQnMgY2F1
c2luZyBwZXJmb3JtYW5jZSBsb3NzLiAgCj4gCj4gWWVzLCB0aGF0J3MgYSBwZXJmb3JtYW5jZSBo
aXQgd2UnbGwgaGF2ZSB0byBhY2NlcHQgZm9yIG5vdy4KPiAKClRoaXMgaXMgcXVpdGUgc2V2ZXJl
IGlzc3VlLCB0aGlzIGlzIHRoZSBiZXN0IGlkZWEgd2UgY2FtZSB3aXRoIHRvCmxpbWl0IHBlcmZv
cm1hbmNlIGhpdHMuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
