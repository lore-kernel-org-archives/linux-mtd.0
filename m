Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15DF7C04FFE
	for <linux-mtd@archiver.kernel.org>; Mon, 20 May 2024 15:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5jsxV/sfhbT9+C0SPjStAwB9L8Z7pg27Qb+MUnh2tgk=; b=mP9pMTzIpZilTO
	22REgiKhrSk4H38sdYHKoeB/c/ujO09wAvvTnwVW6R+J93vu5Quk0kNW8XaTAfmgcHTB3i2s+P5OL
	SM8VzzthED7UBsyiLi7skzaMK2vV2+3rsEKHv+NM0m5ar0qTQ9rEryyeTOIOefTTQuC/lhPpXu6Tc
	zeUjOLVeQByYgX7829xMd8XKgMjwvy8vv1KbQm9l2FunF9CrywvVZM1NChMnw9g3/N1jFQUiP3ZWh
	j77YacOcq6nye+LOmMM4CrMC9swkuZRZS00RUWr9eNhnggCBAsjW8dATFcegte+8XXUG6QUWbbt7z
	tdd9e7vPkeQlLESjrWmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9519-0000000Eqtr-0114;
	Mon, 20 May 2024 15:33:39 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9514-0000000EqtF-2pIM
	for linux-mtd@lists.infradead.org;
	Mon, 20 May 2024 15:33:36 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 311121C0005;
	Mon, 20 May 2024 15:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716219207;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rQMWP962e6Sxt6mbk/SRohCyTNQpGXCJTddT2Gn7Ftk=;
	b=osh0pZEiKz2NLzJhXOamqtbb7XdoPCcycfzd4Iwdlgqym12zVGghQ/4577puKxdno8AiFL
	UItSjOjdlus1zIt0IPRhtfE5PicJBuTuh+omti0iVO+mseJ4ZHrdZ+Ch0KzBRHiHm9iFSU
	/vjEum4wC/Tj7r5XPHnMwU8UOrXwLbbnHu6iL3zm+jcO8EQbNDD7qDv7jNOjUMHJ+cZP/b
	4+sgesKYE1zz/vhBXJj48Jd2OQTc/FJ3uTnEzrm33QwQGGnqJNhaq0GOGnPYEf2wV2hIUm
	vxVMI/b43FHaxAKFF9wSXM+Nj5eHoJQtLpBn8Ayf4LQLTa8PYfjdsqKljwOklw==
Date: Mon, 20 May 2024 17:33:25 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 2/3] mtd: rawnand: Enable monolithic read when
 reading subpages
Message-ID: <20240520173325.79fee6a5@xps-13>
In-Reply-To: <CAJhJPsVOx_AZmsRuZ5jy2-wJ+7-Wm+8RQAJ_LhKGLU3aFzrR7g@mail.gmail.com>
References: <20240430-loongson1-nand-v7-0-60787c314fa4@gmail.com>
	<20240430-loongson1-nand-v7-2-60787c314fa4@gmail.com>
	<20240506091748.18c120d5@xps-13>
	<CAJhJPsVOx_AZmsRuZ5jy2-wJ+7-Wm+8RQAJ_LhKGLU3aFzrR7g@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_083335_158191_24097B6F 
X-CRM114-Status: GOOD (  23.88  )
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

SGkgS2VndWFuZywKCmtlZ3VhbmcuemhhbmdAZ21haWwuY29tIHdyb3RlIG9uIE1vbiwgMjAgTWF5
IDIwMjQgMTg6NDI6MzAgKzA4MDA6Cgo+IE9uIE1vbiwgTWF5IDYsIDIwMjQgYXQgMzoxN+KAr1BN
IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+ID4KPiA+
IEhpLAo+ID4KPiA+IGRldm51bGwra2VndWFuZy56aGFuZy5nbWFpbC5jb21Aa2VybmVsLm9yZyB3
cm90ZSBvbiBUdWUsIDMwIEFwciAyMDI0Cj4gPiAxOToxMToxMSArMDgwMDoKPiA+ICAKPiA+ID4g
RnJvbTogS2VndWFuZyBaaGFuZyA8a2VndWFuZy56aGFuZ0BnbWFpbC5jb20+Cj4gPiA+Cj4gPiA+
IG5hbmRfcmVhZF9zdWJwYWdlKCkgcmVhZHMgZGF0YSBhbmQgRUNDIGRhdGEgYnkgdHdvIHNlcGFy
YXRlCj4gPiA+IG9wZXJhdGlvbnMuCj4gPiA+IFRoaXMgcGF0Y2ggYWxsb3dzIHRoZSBOQU5EIGNv
bnRyb2xsZXJzIHdobyBzdXBwb3J0Cj4gPiA+IG1vbm9saXRoaWMgcGFnZSByZWFkIHRvIGRvIHN1
YnBhZ2UgcmVhZCBieSBhIHNpbmdsZSBvcGVyYXRpb24sCj4gPiA+IHdoaWNoIGlzIG1vcmUgZWZm
ZWN0aXZlIHRoYW4gbmFuZF9yZWFkX3N1YnBhZ2UoKS4gIAo+ID4KPiA+IEkgYW0gYSBiaXQgcHV6
emxlZCBieSB0aGlzIGNoYW5nZS4gVXN1YWxseSBuYW5kX3JlYWRfc3VicGFnZSBpcyB1c2VkCj4g
PiBmb3Igb3B0aW1pemF0aW9ucyAod2hlbiBsZXNzIGRhdGEgdGhhbiBhIGZ1bGwgcGFnZSBtdXN0
IGJlIHJldHJpZXZlZCkuCj4gPiBJIGtub3cgaXQgbWF5IGJlIHVzZWQgaW4gb3RoZXIgY2FzZXMg
KGJlY2F1c2UgaXQncyBlYXNpZXIgZm9yIHRoZSBjb3JlCj4gPiBpbiBvcmRlciB0byBzdXBwb3J0
IGEgd2lkZSByYW5nZSBvZiBjb250cm9sbGVycykuIENhbiB5b3UgcGxlYXNlIHNob3cgYQo+ID4g
c3BlZWQgdGVzdCBzaG93aW5nIHRoZSByZXN1bHRzIGJlZm9yZSBJIGNvbnNpZGVyIG1lcmdpbmcg
dGhpcyBwYXRjaD8KPiA+ICAKPiBXaXRoIHRoaXMgcGF0Y2g6Cj4gIyBmbGFzaF9zcGVlZCAtYyAx
MjggLWQgL2Rldi9tdGQxCj4gc2Nhbm5pbmcgZm9yIGJhZCBlcmFzZWJsb2Nrcwo+IHNjYW5uZWQg
MTI4IGVyYXNlYmxvY2tzLCAwIGFyZSBiYWQKPiB0ZXN0aW5nIGVyYXNlYmxvY2sgd3JpdGUgc3Bl
ZWQKPiBlcmFzZWJsb2NrIHdyaXRlIHNwZWVkIGlzIDIxMTIgS2lCL3MKPiB0ZXN0aW5nIGVyYXNl
YmxvY2sgcmVhZCBzcGVlZAo+IGVyYXNlYmxvY2sgcmVhZCBzcGVlZCBpcyAzNDU0IEtpQi9zCj4g
dGVzdGluZyBwYWdlIHdyaXRlIHNwZWVkCj4gcGFnZSB3cml0ZSBzcGVlZCBpcyAxOTE1IEtpQi9z
Cj4gdGVzdGluZyBwYWdlIHJlYWQgc3BlZWQKPiBwYWdlIHJlYWQgc3BlZWQgaXMgMjk5OSBLaUIv
cwo+IHRlc3RpbmcgMiBwYWdlIHdyaXRlIHNwZWVkCj4gMiBwYWdlIHdyaXRlIHNwZWVkIGlzIDIw
MDAgS2lCL3MKPiB0ZXN0aW5nIDIgcGFnZSByZWFkIHNwZWVkCj4gMiBwYWdlIHJlYWQgc3BlZWQg
aXMgMzIwNyBLaUIvcwo+IFRlc3RpbmcgZXJhc2Ugc3BlZWQKPiBlcmFzZSBzcGVlZCBpcyA3MjQ5
NSBLaUIvcwo+IFRlc3RpbmcgMnggbXVsdGktYmxvY2sgZXJhc2Ugc3BlZWQKPiAyeCBtdWx0aS1i
bG9jayBlcmFzZSBzcGVlZCBpcyA3NDEzNSBLaUIvcwo+IFRlc3RpbmcgNHggbXVsdGktYmxvY2sg
ZXJhc2Ugc3BlZWQKPiA0eCBtdWx0aS1ibG9jayBlcmFzZSBzcGVlZCBpcyA3NDgxMiBLaUIvcwo+
IFRlc3RpbmcgOHggbXVsdGktYmxvY2sgZXJhc2Ugc3BlZWQKPiA4eCBtdWx0aS1ibG9jayBlcmFz
ZSBzcGVlZCBpcyA3NTUwMiBLaUIvcwo+IFRlc3RpbmcgMTZ4IG11bHRpLWJsb2NrIGVyYXNlIHNw
ZWVkCj4gMTZ4IG11bHRpLWJsb2NrIGVyYXNlIHNwZWVkIGlzIDc1ODUxIEtpQi9zCj4gVGVzdGlu
ZyAzMnggbXVsdGktYmxvY2sgZXJhc2Ugc3BlZWQKPiAzMnggbXVsdGktYmxvY2sgZXJhc2Ugc3Bl
ZWQgaXMgNzU4NTEgS2lCL3MKPiBUZXN0aW5nIDY0eCBtdWx0aS1ibG9jayBlcmFzZSBzcGVlZAo+
IDY0eCBtdWx0aS1ibG9jayBlcmFzZSBzcGVlZCBpcyA3NjIwNCBLaUIvcwo+IGZpbmlzaGVkCj4g
Cj4gV2l0aG91dCB0aGlzIHBhdGNoOgo+ICMgZmxhc2hfc3BlZWQgLWMgMTI4IC1kIC9kZXYvbXRk
MQo+IHNjYW5uaW5nIGZvciBiYWQgZXJhc2VibG9ja3MKPiBzY2FubmVkIDEyOCBlcmFzZWJsb2Nr
cywgMCBhcmUgYmFkCj4gdGVzdGluZyBlcmFzZWJsb2NrIHdyaXRlIHNwZWVkCj4gZXJhc2VibG9j
ayB3cml0ZSBzcGVlZCBpcyAyMDc0IEtpQi9zCj4gdGVzdGluZyBlcmFzZWJsb2NrIHJlYWQgc3Bl
ZWQKPiBlcmFzZWJsb2NrIHJlYWQgc3BlZWQgaXMgMjg5NSBLaUIvcwo+IHRlc3RpbmcgcGFnZSB3
cml0ZSBzcGVlZAo+IHBhZ2Ugd3JpdGUgc3BlZWQgaXMgOTk4IEtpQi9zCj4gdGVzdGluZyBwYWdl
IHJlYWQgc3BlZWQKPiBwYWdlIHJlYWQgc3BlZWQgaXMgMTQ5OSBLaUIvcwo+IHRlc3RpbmcgMiBw
YWdlIHdyaXRlIHNwZWVkCj4gMiBwYWdlIHdyaXRlIHNwZWVkIGlzIDEwMDIgS2lCL3MKPiB0ZXN0
aW5nIDIgcGFnZSByZWFkIHNwZWVkCj4gMiBwYWdlIHJlYWQgc3BlZWQgaXMgMTU1NCBLaUIvcwo+
IFRlc3RpbmcgZXJhc2Ugc3BlZWQKPiBlcmFzZSBzcGVlZCBpcyA3NjU2MCBLaUIvcwo+IFRlc3Rp
bmcgMnggbXVsdGktYmxvY2sgZXJhc2Ugc3BlZWQKPiAyeCBtdWx0aS1ibG9jayBlcmFzZSBzcGVl
ZCBpcyA3NDAxOSBLaUIvcwo+IFRlc3RpbmcgNHggbXVsdGktYmxvY2sgZXJhc2Ugc3BlZWQKPiA0
eCBtdWx0aS1ibG9jayBlcmFzZSBzcGVlZCBpcyA3NDc2OSBLaUIvcwo+IFRlc3RpbmcgOHggbXVs
dGktYmxvY2sgZXJhc2Ugc3BlZWQKPiA4eCBtdWx0aS1ibG9jayBlcmFzZSBzcGVlZCBpcyA3NTE0
OSBLaUIvcwo+IFRlc3RpbmcgMTZ4IG11bHRpLWJsb2NrIGVyYXNlIHNwZWVkCj4gMTZ4IG11bHRp
LWJsb2NrIGVyYXNlIHNwZWVkIGlzIDc1OTIxIEtpQi9zCj4gVGVzdGluZyAzMnggbXVsdGktYmxv
Y2sgZXJhc2Ugc3BlZWQKPiAzMnggbXVsdGktYmxvY2sgZXJhc2Ugc3BlZWQgaXMgNzU5MjEgS2lC
L3MKPiBUZXN0aW5nIDY0eCBtdWx0aS1ibG9jayBlcmFzZSBzcGVlZAo+IDY0eCBtdWx0aS1ibG9j
ayBlcmFzZSBzcGVlZCBpcyA3NTkyMSBLaUIvcwo+IGZpbmlzaGVkCj4gCj4gVGhlIHRocm91Z2hw
dXQgb2YgdGhlIGZvcm1lciBpcyB0d2ljZSB0aGF0IG9mIHRoZSBsYXR0ZXIuCgpBbmQgd2hhdCBp
cyB5b3VyIE5BTkQgY29udHJvbGxlciBkcml2ZXI/CgpzdWJwYWdlIHJlYWRzIGFyZSB1c2VkIHdo
ZW4geW91IG9ubHkgd2FudCB0byByZWFkIGEgc3Vic2V0IG9mIGEgTkFORApwYWdlLgoKT3RoZXJ3
aXNlIHRoZSBjb3JlIG1heSB1c2UgdGhlIFJORE9VVCBjb21tYW5kIHRvIGNoYW5nZSB0aGUgcG9p
bnRlciBpbgp0aGUgY2hpcCdzIFNSQU0gdG8gcmVhZCBmcm9tIGEgZGlmZmVyZW50IGxvY2F0aW9u
LCBidXQgSSBkb24ndCBzZWUgd2hhdAppcyBpbXBhY3Rpbmcgc28gbXVjaCwgdW5sZXNzIGlmIHRo
ZSBkcml2ZXIgaW1wbGVtZW50YXRpb24gaXMgcmVhbGx5CnN1Yi1vcHRpbWl6ZWQuCgpUaGFua3Ms
Ck1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
