Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F4BEB4900
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Feb 2026 10:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bMNYBS17ZG6G6VEDFuP/yGANibwifLkQQkU/lVFkuKI=; b=T2x7Qq8Zlwm+NN
	9yl6X7AQfeilrajMdBgQujYD5SrXH5MZltBF2kPTQvFJN7XDzwE6E5sIsmtTdPZkouUXcKZSz2UtY
	vWJzzmZGDJ0ftccoKMNWZbqcTC1dT9D+vJoVoIm3qtgl687wBtIf7lyvpAs8RisuSM0CFgZ8+m022
	xeT4D+xdC8zuRmBHaGoPduUfDOYr2MfzdyP957c0oA01CAOPjAdjJnhC17R8yuO2M9LfJeOI/tWHH
	JoNpAih8+BklLKVkehh4Kz4nC/dJ/7i0gyYUB5BwpTbI9dPIU5hijY0sEuVu34V7yy5LY0fx2YNtJ
	5LIf6iDoeCov4C70AvJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqUH9-00000001xRc-3JRb;
	Thu, 12 Feb 2026 10:50:23 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqUH4-00000001xQu-3n3n
	for linux-mtd@lists.infradead.org;
	Thu, 12 Feb 2026 10:50:22 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8C195C23D9B;
	Thu, 12 Feb 2026 10:50:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 50AA9606CA;
	Thu, 12 Feb 2026 10:50:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 90881119718DE;
	Thu, 12 Feb 2026 11:50:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770893415; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dJ41KSE7bAttPFiYliHfAJ50Lmau9EKSZq3J/XLvPWY=;
	b=n8gDIjUjpViNviAkPVF5jchl7JzMKD3co8b69LorWbq6g0bGnNJ/t7LSfmyUkX+1tnzahl
	dxeDPnb9EHP1sTEhvCMM1j7kGdZ+8zgQPRde3mPxEjHKUN5kHOy0Gp4Mvp9sUNFGcpQG8c
	wcBifgR0l64D9xIjVYFLAsdBAU8JbA0fqONZjZrJZH4c5odgPilsgmwPOfYK4aiwJnsRES
	Pi7otuzcxEyCm3SxVSFcYG2mIjSmgRyJ4oxGUKprPQK7wMOvLkSJb+IHPG8xDUsVEzGULd
	u6SYnFxY3nPhmQKvhE+ZxgR1XhRoMpTOnkBwBstQQIv80xIbkblQssz67pRFAw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Santhosh Kumar K" <s-k6@ti.com>,  <broonie@kernel.org>,
  <robh@kernel.org>,  <krzk+dt@kernel.org>,  <conor+dt@kernel.org>,
  <richard@nod.at>,  <vigneshr@ti.com>,  <tudor.ambarus@linaro.org>,
  <pratyush@kernel.org>,  <linux-spi@vger.kernel.org>,
  <devicetree@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-mtd@lists.infradead.org>,  <praneeth@ti.com>,  <u-kumar1@ti.com>,
  <p-mantena@ti.com>,  <a-dutta@ti.com>
Subject: Re: [RFC PATCH v2 09/12] spi: cadence-quadspi: add PHY tuning
 infrastructure
In-Reply-To: <DGAC4N62UZQQ.3R7TLX87PECU3@kernel.org> (Michael Walle's message
	of "Mon, 09 Feb 2026 10:48:21 +0100")
References: <20260113141617.1905039-1-s-k6@ti.com>
	<20260113141617.1905039-10-s-k6@ti.com>
	<DGAC4N62UZQQ.3R7TLX87PECU3@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 12 Feb 2026 11:50:12 +0100
Message-ID: <87qzqqxml7.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_025020_708127_DB804488 
X-CRM114-Status: GOOD (  11.19  )
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

SGkgTWljaGFlbCwKCk9uIDA5LzAyLzIwMjYgYXQgMTA6NDg6MjEgKzAxLCAiTWljaGFlbCBXYWxs
ZSIgPG13YWxsZUBrZXJuZWwub3JnPiB3cm90ZToKCj4gT24gVHVlIEphbiAxMywgMjAyNiBhdCAz
OjE2IFBNIENFVCwgU2FudGhvc2ggS3VtYXIgSyB3cm90ZToKPj4gK3N0YXRpYyBpbnQgY3FzcGlf
Z2V0X3BoeV9wYXR0ZXJuX29mZnNldChzdHJ1Y3QgZGV2aWNlICpkZXYsIHUzMiAqb2Zmc2V0KQo+
Cj4gLi4KPgo+PiArCXBhcnRpdGlvbl9ucCA9IG9mX2dldF9jaGlsZF9ieV9uYW1lKGZsYXNoX25w
LCAicGFydGl0aW9ucyIpOwo+PiArCWlmICghcGFydGl0aW9uX25wKSB7Cj4+ICsJCW9mX25vZGVf
cHV0KGZsYXNoX25wKTsKPj4gKwkJcmV0dXJuIC1FTk9ERVY7Cj4+ICsJfQo+PiArCj4+ICsJZm9y
X2VhY2hfY2hpbGRfb2Zfbm9kZShwYXJ0aXRpb25fbnAsIHBhcnRfbnApIHsKPj4gKwkJaWYgKG9m
X3Byb3BlcnR5X3JlYWRfc3RyaW5nKHBhcnRfbnAsICJsYWJlbCIsICZsYWJlbCkgfHwKPj4gKwkJ
ICAgICFzdHJzdHIobGFiZWwsICJwaHlwYXR0ZXJuIikpCj4+ICsJCQljb250aW51ZTsKPgo+IFRo
ZXJlIHdhcyBhbHJlYWR5IGEgcmV2aWV3IGNvbW1lbnQgb24gdGhlIGxhc3QgdmVyc2lvbi4gTW92
aW5nIHRoaXMKPiBpbnRvIHRoZSBkcml2ZXIgZG9lc24ndCBtYWtlIGl0IGFueSBiZXR0ZXIuIElu
IGZhY3QgdGhpcyBtaWdodAo+IGNyZWF0ZSBhIChiYWQpIHByZWNlZGVudCBmb3IgZnV0dXJlIGRy
aXZlcnMuCgpJIHJlbWVtYmVyIGNvbXBsYWluaW5nIGFib3V0IGl0IGJ1dCBub3QgaWYgdGhlcmUg
d2FzIGEgc29sdXRpb24KZm9yZXNlZW4uIEluIFNQSSBOQU5EIHRoZSBzb2x1dGlvbiBoYXMgYmVl
biBmb3VuZDogdGhlIHBhdHRlcm4gaXMgaW4gdGhlCmRyaXZlciBhbmQgd2UgbG9hZCBpdCBpbnRv
IGNhY2hlIGJlZm9yZSBQSFkgdHVuaW5nLiBCdXQgZm9yIFNQSSBOT1IgSQp1bmRlcnN0b29kIHRo
aXMgd2Fzbid0IHBvc3NpYmxlLiBXaGF0IHdvdWxkIGJlIGFuIGFsdGVybmF0aXZlPwoKVGhhbmtz
LApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
