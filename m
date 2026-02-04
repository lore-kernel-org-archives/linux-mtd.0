Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A2EE95375
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Feb 2026 10:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bxIlO+G0ErYCuSMeXUmvNNT/4gpMc32YrKoNp+i6AIA=; b=YbOpbR9TtgihDU
	y5T2aHAZntF8AN0XU+jZD4Gtxxuv4ock+tS0AoHmfDRGcKJ7VIFGwA/KJ4H7KSGfJPuQhNUay1Qs1
	1jyNfPAd4gnBpQS736PW/vSMsJ8X23+V5cs6dP+eyg/6ywNvqYoCajurkQOX5dhmWD3XZVU2+ZYrS
	VnRhhFWOzSbg8K9/bSHeyOhcZmNjncvthId6co14DdTq4k4eUFZkjotyHuC7Au1kC/WTI1E2jhpG3
	Q8kF/DnZQryoWvsNRPsGzziU9rbVF6fqASghgoitPNJ9r+NAO3Z26JWOMzflF2RwCz+hfjYPKpm3s
	Gy6GrO5jLzb8IaR7uriw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnaPQ-00000008J2x-0QO7;
	Wed, 04 Feb 2026 10:46:56 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnaPM-00000008J1S-451A
	for linux-mtd@lists.infradead.org;
	Wed, 04 Feb 2026 10:46:55 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 218D71A2BDA;
	Wed,  4 Feb 2026 10:46:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E11C660745;
	Wed,  4 Feb 2026 10:46:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A2AA4119A8891;
	Wed,  4 Feb 2026 11:46:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770202009; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9DcxmSY88sa/IFq/9pI8Ul8RolH6HxvF4wzvh7XRi4E=;
	b=L6/aH8sHQSj5FIg54ozx8gVU9zRM96vD9SGvib+ARivRLj08b/LQ1tT3/cZpwo2ZyyYnH2
	Q0h6z9nfeykNKE8PEEHGF4PxF9dKAu9Zl9qqrAbvQrPxrbcIZbkgZdbEczELtygrgeFa0y
	Go9tTYe2KYHb1hoXy1A3RwFP9xipG9wyc2tRi0pcFmNVtrCXvdC4gOtR512mMVIJy7/77u
	O820dOAfz76YI2bmZwQkpVgcQf2/W1odBzZZFEuoX31iBVvR7fHz83ItwD/Bd8yblxj6+H
	Bwn8Q92kDgyqgyOH9eI5jzRhOwP6WcgAmfz5iA1noZ/1w9/y3W7zKAY+9chfag==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: <broonie@kernel.org>,  <robh@kernel.org>,  <krzk+dt@kernel.org>,
  <conor+dt@kernel.org>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <tudor.ambarus@linaro.org>,  <pratyush@kernel.org>,  <mwalle@kernel.org>,
  <linux-spi@vger.kernel.org>,  <devicetree@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>,  <linux-mtd@lists.infradead.org>,
  <praneeth@ti.com>,  <u-kumar1@ti.com>,  <p-mantena@ti.com>,
  <a-dutta@ti.com>
Subject: Re: [RFC PATCH v2 01/12] spi: dt-bindings: add spi-has-dqs property
In-Reply-To: <20260113141617.1905039-2-s-k6@ti.com> (Santhosh Kumar K.'s
	message of "Tue, 13 Jan 2026 19:46:06 +0530")
References: <20260113141617.1905039-1-s-k6@ti.com>
	<20260113141617.1905039-2-s-k6@ti.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 04 Feb 2026 11:46:45 +0100
Message-ID: <87wm0sg50q.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_024653_422322_6C39A760 
X-CRM114-Status: GOOD (  17.22  )
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

T24gMTMvMDEvMjAyNiBhdCAxOTo0NjowNiArMDUzMCwgU2FudGhvc2ggS3VtYXIgSyA8cy1rNkB0
aS5jb20+IHdyb3RlOgoKPiBBZGQgdGhlIG9wdGlvbmFsICdzcGktaGFzLWRxcycgYm9vbGVhbiBw
cm9wZXJ0eSBmb3IgU1BJIGZsYXNoIGRldmljZQo+IHN1Ym5vZGVzLiBUaGlzIHByb3BlcnR5IGlu
ZGljYXRlcyB0aGUgZmxhc2ggZGV2aWNlIHN1cHBvcnRzIERRUyAoRGF0YQo+IFN0cm9iZSkgbW9k
ZSwgd2hpY2ggcHJvdmlkZXMgaW1wcm92ZWQgdGltaW5nIG1hcmdpbnMgZm9yIGRhdGEgY2FwdHVy
ZQo+IGluIGhpZ2gtc3BlZWQgU1BJIG9wZXJhdGlvbnMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBTYW50
aG9zaCBLdW1hciBLIDxzLWs2QHRpLmNvbT4KPiAtLS0KPiAgLi4uL2RldmljZXRyZWUvYmluZGlu
Z3Mvc3BpL3NwaS1wZXJpcGhlcmFsLXByb3BzLnlhbWwgICAgICAgfCA2ICsrKysrKwo+ICAxIGZp
bGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwaS9zcGktcGVyaXBoZXJhbC1wcm9wcy55YW1sIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwaS9zcGktcGVyaXBoZXJhbC1wcm9wcy55
YW1sCj4gaW5kZXggOGI2ZThmYzAwOWRiLi5jNmYzMzBmZDMyYWEgMTAwNjQ0Cj4gLS0tIGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwaS9zcGktcGVyaXBoZXJhbC1wcm9wcy55
YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwaS9zcGktcGVy
aXBoZXJhbC1wcm9wcy55YW1sCj4gQEAgLTg5LDYgKzg5LDEyIEBAIHByb3BlcnRpZXM6Cj4gICAg
ICBkZXNjcmlwdGlvbjoKPiAgICAgICAgRGVsYXksIGluIG1pY3Jvc2Vjb25kcywgYWZ0ZXIgYSB3
cml0ZSB0cmFuc2Zlci4KPiAgCj4gKyAgc3BpLWhhcy1kcXM6Cj4gKyAgICBkZXNjcmlwdGlvbjoK
PiArICAgICAgSW5kaWNhdGVzIHRoZSBTUEkgZmxhc2ggZGV2aWNlIHN1cHBvcnRzIERRUyAoRGF0
YSBTdHJvYmUpIG1vZGUgZm9yCj4gKyAgICAgIGltcHJvdmVkIGRhdGEgY2FwdHVyZSB0aW1pbmcu
Cj4gKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9mbGFnCgpUaGlz
IGluZm9ybWF0aW9uIGlzIGN1cnJlbnRseSBsYWNraW5nIGluZGVlZCwgbW9zdGx5IGJlY2F1c2Ug
bm9ib2R5IGV2ZXIKY2FyZWQgYWJvdXQgaXQuIFRoZSBEVCBwcm9wZXJ0eSBpcyBJTU8gbm90IHRo
ZSBjb3JyZWN0IHdheSB0byBnaXZlIHRoaXMKaW5mb3JtYXRpb24gZm9yIHR3byByZWFzb25zOgot
IHRoaXMgaXMgYSBjYXBhYmlsaXR5IG9mIHRoZSBjaGlwLCB3ZSBkaXNjb3ZlciB0aGUgY2hpcCBk
eW5hbWljYWxseSBpbgogIGJvdGggY2FzZXMgKE5BTkQgYW5kIE5PUikgYW5kIGF0dGFjaCBtYW55
IGNhcGFiaWxpdGllcyB0byB0aGUgY2hpcHMKICBhbHJlYWR5LCBzbyBJIGJlbGlldmUgdGhpcyBp
bmZvcm1hdGlvbiBzaG91bGQgYmUgcHJvdmlkZWQgdGhyb3VnaCBhCiAgZmxhZy4KLSB0aGUgZmFj
dCB0aGF0IHRoZSBEUVMgc2lnbmFsIG1pZ2h0IGJlIHN1cHBvcnRlZCBkb2VzIG5vdCBpbmRpY2F0
ZSBpdAogIGlzIGFjdHVhbGx5IGRyaXZlbi4gV2luYm9uZCBjaGlwcywgZm9yIGluc3RhbmNlLCBj
YW4gZWl0aGVyIGVuYWJsZSBpdAogIG9yIG5vdCBkZXBlbmRpbmcgb24gdGhlaXIgY29uZmlndXJh
dGlvbiAocHJvYmFibHkgdGhyb3VnaCB0aGVpciBWQ1IKICByZWdpc3RlciwgSSBuZWVkIHRvIGNo
ZWNrIGFnYWluKS4KClRoZSBxdWVzdGlvbiBJIGhhdmUgaXM6IHNoYWxsIHdlIGVuYWJsZSB0aGUg
RFFTIHBpbiBhdXRvbWF0aWNhbGx5IGlmIGl0CmlzIGF2YWlsYWJsZT8gTm90IGFsbCBjb250cm9s
bGVycyBzdXBwb3J0IGl0IEkgc3VwcG9zZSwgYW5kIHdpcmluZyB0aGUKbGluZSBtaWdodCBhcyB3
ZWxsIG5vdCBiZSBkb25lIChvciBpbmNvcnJlY3RseSkuIEZvciB0aGVzZSBjYXNlcyB3ZSBtYXkK
bmVlZCBEVCBwcm9wZXJ0aWVzIGluIHRoZSBmdXR1cmUuIEJ1dCBmb3IgdGhlIERRUyBwcmVzZW5j
ZSBpbmRpY2F0aW9uLCBJCmJldCBpdCBpcyBub3QgdXNlZnVsLCBhbmQgc2hvdWxkIGJlIGhhbmRs
ZWQgYXQgdGhlIGNvcmUgbGV2ZWwgKG5vdApwYXJzZWQgYnkgdGhlIGRyaXZlciBsaWtlIHlvdSBk
bykgYmVjYXVzZSBpdCBtYXkgaGF2ZSBhbiBpbXBhY3Qgb24gdGhlCmNoaXAgaW50ZXJuYWwgY29u
ZmlndXJhdGlvbi4KCkkgd2lsbCB0cnkgdG8gY29tZSB1cCB3aXRoIGEgcHJvcG9zYWwgc29vbiEK
CkNoZWVycywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
