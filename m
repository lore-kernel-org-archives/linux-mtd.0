Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D4C2CED27C
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Oct 2024 08:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AO/q6naiznJlAYPLVBMZf9pBdaAza+xOr/odEGhuE/E=; b=l7M1PHSzEd3BqE
	CFzju6OpPKiOifRkk2KBXR53NhatX8++2z9AXkjE7xX+BIsNVRssXPk5hdTQ/UhQRhsZPQx0qFD4d
	2F2P+godZNjiLkSZ7ac5BB+5phpE3vRlGLiRxHtq9rUB3QQjDpqiGUgLKTCRk6yl1Hck2KLmp1GFP
	UQ0cGiACfuf3LrJ+DUD9Ewa/IE4zbbuGJt/PtEIvt/vZImPWiV0wYk2UEV3M58ukfsq4HpXpiOu6P
	SAT3E7LcOtZGRCEh761QZtUl/5OZWe/hMA0K7aOPAdW4gDxxxElMOTNofa1lTGPnOopAJw4AsrZxa
	L7GoWR6zJDW4M7rP+89A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy5nc-000000056Ym-3YhG;
	Tue, 08 Oct 2024 08:42:32 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy5eg-000000053ue-3GeC;
	Tue, 08 Oct 2024 08:33:24 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9EFBD1C000A;
	Tue,  8 Oct 2024 08:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728376392;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TmLP/WI1VtrRBkIucS2941CxDdB37ieasR6WFFSWafs=;
	b=POSKCKOpM0S5Rro9I7JX/yFDGVQEbxnQfOlbhvDuVflBTc9b0oQzIQp7fKtzf6mJwdOQ+0
	Ea9yaFhepRPa3MqaYNcDO/VEW6QLHJqANEHtweXO5D876vZq8tICxDlfjrmrbTDnklWsBz
	0pAYroBCDAgXQON2fmL69ED1dgdlzDy5jho/yQO5tqH0EdwHwUBc86MuNxTZZ0aBcTJr+T
	UHYVDWD5LAAELveRyE4v2cHZeoPtNyyU8w7VYOZiIGEcGGrpmUancBz/ZYPglMSFDCCVy6
	Izc1kwXhCGbPtsztfFaqEyh0UYZq966m3DrL4DrW+CqDmsEUQlcF0xSAXpcASQ==
Date: Tue, 8 Oct 2024 10:33:06 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Julian Vetter <jvetter@kalrayinc.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG
 Xuerui <kernel@xen0n.name>, Andrew Morton <akpm@linux-foundation.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Richard Henderson
 <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Matt Turner <mattst88@gmail.com>, "James E . J . Bottomley"
 <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Richard
 Weinberger <richard@nod.at>, Anton Ivanov
 <anton.ivanov@cambridgegreys.com>, Johannes Berg
 <johannes@sipsolutions.net>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Niklas
 Schnelle <schnelle@linux.ibm.com>, Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-alpha@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org, linux-arch@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-sound@vger.kernel.org, Yann Sionneau
 <ysionneau@kalrayinc.com>
Subject: Re: [PATCH v8 13/14] mtd: Add HAS_IOMEM || INDIRECT_IOMEM
 dependency
Message-ID: <20241008103306.44123824@xps-13>
In-Reply-To: <20241008075023.3052370-14-jvetter@kalrayinc.com>
References: <20241008075023.3052370-1-jvetter@kalrayinc.com>
	<20241008075023.3052370-14-jvetter@kalrayinc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_013321_080595_B73E660E 
X-CRM114-Status: GOOD (  18.34  )
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

SGkgSnVsaWFuLAoKanZldHRlckBrYWxyYXlpbmMuY29tIHdyb3RlIG9uIFR1ZSwgIDggT2N0IDIw
MjQgMDk6NTA6MjEgKzAyMDA6Cgo+IFRoZSBVTSBhcmNoIGRvZXNuJ3QgaGF2ZSBIQVNfSU9NRU09
eSwgc28gdGhlIGJ1aWxkIGZhaWxzIGJlY2F1c2UgdGhlCj4gZnVuY3Rpb25zIG1lbWNweV9mcm9t
aW8gYW5kIG1lbWNweV90b2lvIGFyZSBub3QgZGVmaW5lZCBhbnltb3JlLiBUaGVzZQo+IGZ1bmN0
aW9ucyBhcmUgb25seSBidWlsZCBmb3IgdGFyZ2V0cyB3aGljaCBoYXZlIEhBU19JT01FTT15IG9y
Cj4gSU5ESVJFQ1RfSU9NRU09eS4gU28sIGRlcGVuZCBvbiBlaXRoZXIgb2YgdGhlIHR3by4KClRo
ZXJlIGFyZSBtYW55IG10ZCBkcml2ZXJzIHVzaW5nIG1lbWNweV9mcm9taW8gYW5kIG1lbWNweV90
b2lvLCBJJ20gbm90CnN1cmUgSSBnZXQgd2h5IG9ubHkgdGhpcyBzdWJzZXQgb2YgZHJpdmVycyB3
b3VsZCBiZSBpbXBhY3RlZD8KCkFsc28sIGZyb20gYSBnZW5lcmFsIHN0YW5kcG9pbnQsIEkgZG9u
J3Qgc2VlIHdpdGggYSBnb29kIGV5ZSB0aGUKcHJvbGlmZXJhdGlvbiBvZiB0aGUgdXNlIG9mIHx8
IElORElSRUNUX0lPTUVNIGp1c3QgZm9yIHRoZSB1bQphcmNoaXRlY3R1cmU6CgokIGdpdCBncmVw
IEhBU19JT01FTSB8IHdjIC1sCjYxMQokIGdpdCBncmVwIElORElSRUNUX0lPTUVNIHwgd2MgLWwK
MTUKCkkgYmVsaWV2ZSB0aGUgS2NvbmZpZyBzeW1ib2wgc2hvdWxkIGFkYXB0IHRvIHJlZmxlY3Qg
dGhlIGZhY3QgdGhhdCBJTwpvcGVyYXRpb25zIGFyZSBmaW5lLCByZWdhcmRsZXNzIG9mIHRoZWly
IHR5cGUgKCJkaXJlY3QiIG9yICJpbmRpcmVjdCIpCnJhdGhlciB0aGFuIG1vdmUgdGhlIGxvYWQg
b24gdGhlIGluZGl2aWR1YWwgZHJpdmVycy4KCj4gUmV2aWV3ZWQtYnk6IFlhbm4gU2lvbm5lYXUg
PHlzaW9ubmVhdUBrYWxyYXlpbmMuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEp1bGlhbiBWZXR0ZXIg
PGp2ZXR0ZXJAa2FscmF5aW5jLmNvbT4KPiAtLS0KPiBDaGFuZ2VzIGZvciB2ODoKPiAtIE5ldyBw
YXRjaAo+IC0tLQo+ICBkcml2ZXJzL210ZC9jaGlwcy9LY29uZmlnIHwgNCArKysrCj4gIGRyaXZl
cnMvbXRkL2xwZGRyL0tjb25maWcgfCAxICsKPiAgMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlv
bnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvY2hpcHMvS2NvbmZpZyBiL2RyaXZl
cnMvbXRkL2NoaXBzL0tjb25maWcKPiBpbmRleCAxOTcyNmViZDk3M2QuLjc4YWZlN2NjZjAwNSAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9jaGlwcy9LY29uZmlnCj4gKysrIGIvZHJpdmVycy9t
dGQvY2hpcHMvS2NvbmZpZwo+IEBAIC00LDYgKzQsNyBAQCBtZW51ICJSQU0vUk9NL0ZsYXNoIGNo
aXAgZHJpdmVycyIKPiAgCj4gIGNvbmZpZyBNVERfQ0ZJCj4gIAl0cmlzdGF0ZSAiRGV0ZWN0IGZs
YXNoIGNoaXBzIGJ5IENvbW1vbiBGbGFzaCBJbnRlcmZhY2UgKENGSSkgcHJvYmUiCj4gKwlkZXBl
bmRzIG9uIEhBU19JT01FTSB8fCBJTkRJUkVDVF9JT01FTQo+ICAJc2VsZWN0IE1URF9HRU5fUFJP
QkUKPiAgCXNlbGVjdCBNVERfQ0ZJX1VUSUwKPiAgCWhlbHAKPiBAQCAtMTYsNiArMTcsNyBAQCBj
b25maWcgTVREX0NGSQo+ICAKPiAgY29uZmlnIE1URF9KRURFQ1BST0JFCj4gIAl0cmlzdGF0ZSAi
RGV0ZWN0IG5vbi1DRkkgQU1EL0pFREVDLWNvbXBhdGlibGUgZmxhc2ggY2hpcHMiCj4gKwlkZXBl
bmRzIG9uIEhBU19JT01FTSB8fCBJTkRJUkVDVF9JT01FTQo+ICAJc2VsZWN0IE1URF9HRU5fUFJP
QkUKPiAgCXNlbGVjdCBNVERfQ0ZJX1VUSUwKPiAgCWhlbHAKPiBAQCAtMjExLDEyICsyMTMsMTQg
QEAgY29uZmlnIE1URF9DRklfVVRJTAo+ICAKPiAgY29uZmlnIE1URF9SQU0KPiAgCXRyaXN0YXRl
ICJTdXBwb3J0IGZvciBSQU0gY2hpcHMgaW4gYnVzIG1hcHBpbmciCj4gKwlkZXBlbmRzIG9uIEhB
U19JT01FTSB8fCBJTkRJUkVDVF9JT01FTQo+ICAJaGVscAo+ICAJICBUaGlzIG9wdGlvbiBlbmFi
bGVzIGJhc2ljIHN1cHBvcnQgZm9yIFJBTSBjaGlwcyBhY2Nlc3NlZCB0aHJvdWdoCj4gIAkgIGEg
YnVzIG1hcHBpbmcgZHJpdmVyLgo+ICAKPiAgY29uZmlnIE1URF9ST00KPiAgCXRyaXN0YXRlICJT
dXBwb3J0IGZvciBST00gY2hpcHMgaW4gYnVzIG1hcHBpbmciCj4gKwlkZXBlbmRzIG9uIEhBU19J
T01FTSB8fCBJTkRJUkVDVF9JT01FTQo+ICAJaGVscAo+ICAJICBUaGlzIG9wdGlvbiBlbmFibGVz
IGJhc2ljIHN1cHBvcnQgZm9yIFJPTSBjaGlwcyBhY2Nlc3NlZCB0aHJvdWdoCj4gIAkgIGEgYnVz
IG1hcHBpbmcgZHJpdmVyLgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9scGRkci9LY29uZmln
IGIvZHJpdmVycy9tdGQvbHBkZHIvS2NvbmZpZwo+IGluZGV4IDAzOTVhYTZiNjhmMS4uZjM1ZGQ4
MDUyYWJjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL2xwZGRyL0tjb25maWcKPiArKysgYi9k
cml2ZXJzL210ZC9scGRkci9LY29uZmlnCj4gQEAgLTQsNiArNCw3IEBAIG1lbnUgIkxQRERSICYg
TFBERFIyIFBDTSBtZW1vcnkgZHJpdmVycyIKPiAgCj4gIGNvbmZpZyBNVERfTFBERFIKPiAgCXRy
aXN0YXRlICJTdXBwb3J0IGZvciBMUEREUiBmbGFzaCBjaGlwcyIKPiArCWRlcGVuZHMgb24gSEFT
X0lPTUVNIHx8IElORElSRUNUX0lPTUVNCj4gIAlzZWxlY3QgTVREX1FJTkZPX1BST0JFCj4gIAlo
ZWxwCj4gIAkgIFRoaXMgb3B0aW9uIGVuYWJsZXMgc3VwcG9ydCBvZiBMUEREUiAoTG93IHBvd2Vy
IGRvdWJsZSBkYXRhIHJhdGUpCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
