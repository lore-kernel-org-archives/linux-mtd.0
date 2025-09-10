Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5487CA0FED
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Sep 2025 09:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9LN3JoqGQjT90yucakDgDFoJpom8KHwb6bkGocrFzhw=; b=fKCsGKZua+y5pH
	abxFoStbtQlitHwNQTJEAu6Rlp7Kb9FmGNCgKwCPfmQWuXOVznIdzwk+kC84Ib+U12XmNoR4PO6Um
	1DZqc2yeOaLZnDjOuRPFfAsOLc/EeSubFylrqHoadDiNVw3uMdcFckSu4JfThBQr6c4zZKUAgFrm+
	hVaRonsOR/x8jWyJAKcOegLg7/WoEsiaL3umDWdOPE/KbtK/bZX1L6rW1htenhOT8BfBgG3fcjV1r
	chSLGxtu8Ogb0RBlqXIHNOABeeVXWkxVFuFtxtZho+YOdsMD7LoSekKaZC3gLv4+Ls7mIqQ9Tu7ls
	h8VgBAhEcMks9BcYOZXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwGq5-0000000D8ev-3nRa;
	Wed, 10 Sep 2025 09:10:05 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwGq2-0000000D8dw-3Vqa
	for linux-mtd@lists.infradead.org;
	Wed, 10 Sep 2025 09:10:04 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B98A74E40BB2;
	Wed, 10 Sep 2025 09:10:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A07CA606DB;
	Wed, 10 Sep 2025 09:10:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D015B102F294C;
	Wed, 10 Sep 2025 11:09:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757495399; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZGdZCcz9UwBIS4jBTMbck9fbv41yXW91D1xMl9GGQ8Y=;
	b=XYBHxHHcXTegSVJoHeE5qbiapSrwAvEXVOKI5IezhWdA9WwS54GGZgevjXwXdG7HA0+rr+
	9A8oqmp2ETMkEJwoK8CdCIBlXmNo20Vx/czOCkavpiwTog03Ofe5PfaJdcYl1UY3jY8PfY
	yxofQq7jFG8I+3rzc3Ky/67zilxcp+6W+jWIPSKRVlu0UYDUKCwHE4tIHRWKOv0Lhj3qKc
	qlRpDN218k2eOSNLzmFghGox8FY6tkdeugudJsx5ze8qWWT0q5JxMQGlu9eol+2B3ikDHr
	iC7hekKLgZpadIu3XAbnJ6IkOrs0GmLZ0Zso4hkaq0Yma7X2IT7Fu29bE//L7A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: richard@nod.at,  vigneshr@ti.com,  robh@kernel.org,  krzk+dt@kernel.org,
  conor+dt@kernel.org,  tudor.ambarus@linaro.org,
  mmkurbanov@salutedevices.com,  Takahiro.Kuwano@infineon.com,
  pratyush@kernel.org,  linux-mtd@lists.infradead.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  alvinzhou@mxic.com.tw,  Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH v2 1/3] dt-bindings: mtd: spi-nand: Add
 enable-randomizer-otp property
In-Reply-To: <20250910030301.1368372-2-linchengming884@gmail.com> (Cheng Ming
	Lin's message of "Wed, 10 Sep 2025 11:02:59 +0800")
References: <20250910030301.1368372-1-linchengming884@gmail.com>
	<20250910030301.1368372-2-linchengming884@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Wed, 10 Sep 2025 11:09:35 +0200
Message-ID: <87wm66d67k.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_021003_019399_EA98E9CA 
X-CRM114-Status: GOOD (  15.27  )
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

SGVsbG8gQ2hlbmcgTWluZywKCk9uIDEwLzA5LzIwMjUgYXQgMTE6MDI6NTkgKzA4LCBDaGVuZyBN
aW5nIExpbiA8bGluY2hlbmdtaW5nODg0QGdtYWlsLmNvbT4gd3JvdGU6Cgo+IEZyb206IENoZW5n
IE1pbmcgTGluIDxjaGVuZ21pbmdsaW5AbXhpYy5jb20udHc+Cj4KPiBBZGQgYSBuZXcgYm9vbGVh
biBwcm9wZXJ0eSAiZW5hYmxlLXJhbmRvbWl6ZXItb3RwIiB0byBlbmFibGUgdGhlCj4gcmFuZG9t
aXplciBmZWF0dXJlIG9uIHN1cHBvcnRlZCBTUEktTkFORCBkZXZpY2VzLgo+Cj4gU2lnbmVkLW9m
Zi1ieTogQ2hlbmcgTWluZyBMaW4gPGNoZW5nbWluZ2xpbkBteGljLmNvbS50dz4KPiAtLS0KPiAg
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9zcGktbmFuZC55YW1sIHwgNCAr
KysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3NwaS1uYW5kLnlhbWwgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3NwaS1uYW5kLnlhbWwKPiBpbmRleCA3
N2E4NzI3YzcuLjQzMmJjNzllOSAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbXRkL3NwaS1uYW5kLnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbXRkL3NwaS1uYW5kLnlhbWwKPiBAQCAtMjEsNiArMjEsMTAgQEAgcHJv
cGVydGllczoKPiAgICAgIGRlc2NyaXB0aW9uOiBFbmNvZGUgdGhlIGNoaXAtc2VsZWN0IGxpbmUg
b24gdGhlIFNQSSBidXMKPiAgICAgIG1heEl0ZW1zOiAxCj4gIAo+ICsgIGVuYWJsZS1yYW5kb21p
emVyLW90cDoKClRoaXMgaXMgYSBOQU5EIHdpZGUgZmVhdHVyZSwgc28gd2Ugc2hvdWxkIHByb2Jh
Ymx5IGFkZCBhIHByZWZpeCwgc3VjaCBhcwoibmFuZCwiLgoKTm93LCB3aGF0IGFib3V0IHRoaXMg
Im90cCIgc3VmZml4PyBNYW55IChpZiBub3QgYWxsKSBjaGlwcyBoYXZlIGEKdm9sYXRpbGUgc2V0
dGluZyBmb3IgdGhhdC4gQWJvdXQgdGhlIG5hbWluZywgIm90cCIgb2Z0ZW4gcmVmbGVjdHMgdG8g
dGhlCk9UUCBhcmVhLCB3aGljaCBpcyBub3Qgd2hhdCB5b3UgaW1wbHkgaGVyZSwgYXMgeW91IHdh
bnQgdG8gaW5zaXN0CihyaWdodGZ1bGx5KSBvbiB0aGUgZmFjdCB0aGF0IHRoaXMgZmVhdHVyZSBj
YW5ub3QgYmUgZGlzYWJsZWQuCgpBbHNvLCB0aGlzIGlzIGEgcGVyLWNoaXAgY29uZmlndXJhdGlv
biwgd2hpbGUgSSB3b3VsZCBoYXZlIHdlbGNvbWVkIGEKcGVyLXBhcnRpdGlvbiBjb25maWd1cmF0
aW9uLiBJIGNhbiBlYXNpbHkgaW1hZ2luZSB0d28gY2FzZXM6CgotIFRoZSBib290IFJPTSwgZm9y
IGxvbmdldml0eSBwdXJwb3NlcywgZXhwZWN0cyB0aGUgZmlyc3QgYmxvY2tzCiAgY29udGFpbmlu
ZyB0aGUgYm9vdGxvYWRlciB0byBiZSBzY3JhbWJsZWQuIEhvd2V2ZXIgdGhlIHJlc3Qgb2YgdGhl
CiAgc3lzdGVtIGRvZXMgbm90IHJlYWxseSBjYXJlIGFuZCBkaXNhYmxlcyByYW5kb21pemF0aW9u
LgoKLSBUaGUgYm9vdCBST00gaXMgbm90IGNhcGFibGUgb2YgZGUtc2NyYW1ibGluZywgaG93ZXZl
ciB0aGUgcmVzdCBvZiB0aGUKICBzeXN0ZW0gcmVsaWVzIG9uIHRoZSAocHJvYmFibHkpIG1vcmUg
cm9idXN0IHNjcmFtYmxpbmcgZmVhdHVyZS4KCkluIGJvdGggY2FzZXMgYSBjaGlwIHdpZGUgdmFy
aWFibGUgaXMgbm90IHJlbGV2YW50LgoKVGhlIGZhY3QgdGhhdCBpdCBpcyBhIG9uZS10aW1lIGZl
YXR1cmUgbWFrZXMgaXQgZXZlbiBoYXJkZXIgdG8gZml0IGludG8Kc29tZXRoaW5nIGdlbmVyaWMu
CgpIb3cgZG8geW91IHRoaW5rIHRoZXNlIGNvbnN0cmFpbnRzIGNvdWxkIGZpdCB3aXRoIHlvdXIg
bmVlZHM/IENhbiB5b3UKcGxlYXNlIGV4cGxhaW4gYWdhaW4gKHNvcnJ5IGZvciB0aGUgcmVwZXRp
dGlvbikgd2hhdCBNYWNyb25peCBjaGlwcyBoYXZlCnRoZSB2b2xhdGlsZSBjYXBhYmlsaXR5IGFu
ZCB3aGljaCBvbmVzIGRvIG5vdD8KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
