Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01315F41808
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Mar 2026 15:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/wvVn6WcOv6rnHBAnH77zQQA8WWXwN67Byez66JKrLY=; b=0G0xUELR9iBbjB
	swXyj+Mcb9M+pdd3Qzl8sE7hAjXTT2nd6zzj0j5M/8OTkv/3VJ/IreINk9myMRQzdFx6XBQJ+FJzI
	LDtd3Nj0f08RFKrOZXrC0VfJmKAgAcNRUYqvwMVcxeGU3qjpbLuECQWZM1nmnf4QqS2a7qbVe9//b
	nuVvFiAqFPS/lnlI3GsqTldDcQOxqgc+iibhFu/PhoH9iUzGUTr2nl2rpXUaGMJvY2va6HwZH1Nd3
	uGWB7AOOeYqDV6739OZvBVKjAllO8zUbd9N32hVzYIZwFewFooRgm0RUDDj/AkQtv5mMfWuW5U48y
	mVU8+0GdfJlrO1gx8vUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzcEq-00000007Z0Y-1ASb;
	Mon, 09 Mar 2026 15:09:44 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzcEn-00000007Z08-0uhw
	for linux-mtd@lists.infradead.org;
	Mon, 09 Mar 2026 15:09:43 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6ECC6C4287A;
	Mon,  9 Mar 2026 15:09:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C62235FFB8;
	Mon,  9 Mar 2026 15:09:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EF20210369BEB;
	Mon,  9 Mar 2026 16:09:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773068977; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FG158/EGLhvDrEBET0uUhkr+ZO0S5F0PmANWPFGizsc=;
	b=t4p/zCDlMFLItGdvjJ9LmtxrzqYp5G0961EWkTkCQ1SM4rc1m2qiB3rc2DNYjQIFP1/pvl
	cl+VGECcrRL0qGrHE+5fgReQci+ZYDJ2tAKs2GUZlgbbFm/8xKS6htxbVFU4c0LWfh/UzF
	1HW+276a2wckS8E3q1dEAOD+eriyUFIw02l04f3HXYkmz4GYFuBqTVhu/Y2zr7Q/7IdKsE
	NyP/niJ9uud7IArG5WfOM3nllieq0xw0TqHAVxhThVcztrx21U7ULQNB+kv/aBThwvk5YP
	jusabS4SZmvddMlnCBoULgmKmklq3UyJBGkoIo7CkgMVh6O9Sbn1JEJAFiv4sQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frieder Schrempf <frieder@fris.de>
Cc: Mark Brown <broonie@kernel.org>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Han Xu <han.xu@nxp.com>,
  Eberhard Stoll <eberhard.stoll@kontron.de>,  Frieder Schrempf
 <frieder.schrempf@kontron.de>,  Tudor Ambarus <tudor.ambarus@linaro.org>,
  Pratyush Yadav <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,
  linux-spi@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org,  imx@lists.linux.dev
Subject: Re: [PATCH RFC 6/7] spi: spi-mem: Call spi_set_rx_sampling_point()
 for each op
In-Reply-To: <20260303-fsl-qspi-rx-sampling-delay-v1-6-9326bbc492d6@kontron.de>
	(Frieder Schrempf's message of "Tue, 03 Mar 2026 17:29:27 +0100")
References: <20260303-fsl-qspi-rx-sampling-delay-v1-0-9326bbc492d6@kontron.de>
	<20260303-fsl-qspi-rx-sampling-delay-v1-6-9326bbc492d6@kontron.de>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 09 Mar 2026 16:09:34 +0100
Message-ID: <87wlzlnioh.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_080941_431482_E8B67921 
X-CRM114-Status: GOOD (  14.79  )
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

SGkgRnJpZWRlciwKCkZpcnN0LCB0aGFua3MgZm9yIHRoZSBzZXJpZXMhIEkgYmVsaWV2ZSBpdCB3
aWxsIGNvbmZsaWN0IHdpdGggdGhlIFNQSQp0dW5pbmcgc2VyaWVzIGFzIHlvdSBtZW50aW9uZWQs
IGJ1dCB3ZSBzaG91bGQgYmUgYWJsZSB0byBtYWtlIHRoZW0gbGl2ZQpzaWRlIGJ5IHNpZGUuCgpP
biAwMy8wMy8yMDI2IGF0IDE3OjI5OjI3ICswMSwgRnJpZWRlciBTY2hyZW1wZiA8ZnJpZWRlckBm
cmlzLmRlPiB3cm90ZToKCj4gRnJvbTogRnJpZWRlciBTY2hyZW1wZiA8ZnJpZWRlci5zY2hyZW1w
ZkBrb250cm9uLmRlPgo+Cj4gV2l0aCBjbG9jayByYXRlcyBjaGFuZ2luZyBvbiBhIHBlci1vcCBi
YXNpcywgd2UgbmVlZCB0byBtYWtlIHN1cmUKPiB0aGF0IHdlIG1lZXQgdGhlIFJYIHNhbXBsaW5n
IHBvaW50IGRlbGF5IGNvbnN0cmFpbnQgb2YgdGhlIHVuZGVybHlpbmcKPiBTUEkgY2hpcC4KPgo+
IFNpZ25lZC1vZmYtYnk6IEZyaWVkZXIgU2NocmVtcGYgPGZyaWVkZXIuc2NocmVtcGZAa29udHJv
bi5kZT4KPiAtLS0KPiAgZHJpdmVycy9zcGkvc3BpLW1lbS5jIHwgMiArKwo+ICAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zcGkvc3BpLW1l
bS5jIGIvZHJpdmVycy9zcGkvc3BpLW1lbS5jCj4gaW5kZXggYTA5MzcxYTA3NWQyZS4uNmI4YmVl
N2Q2ZjVlMyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3NwaS9zcGktbWVtLmMKPiArKysgYi9kcml2
ZXJzL3NwaS9zcGktbWVtLmMKPiBAQCAtNTg5LDYgKzU4OSw4IEBAIHZvaWQgc3BpX21lbV9hZGp1
c3Rfb3BfZnJlcShzdHJ1Y3Qgc3BpX21lbSAqbWVtLCBzdHJ1Y3Qgc3BpX21lbV9vcCAqb3ApCj4g
IHsKPiAgCWlmICghb3AtPm1heF9mcmVxIHx8IG9wLT5tYXhfZnJlcSA+IG1lbS0+c3BpLT5tYXhf
c3BlZWRfaHopCj4gIAkJb3AtPm1heF9mcmVxID0gbWVtLT5zcGktPm1heF9zcGVlZF9oejsKPiAr
Cj4gKwlvcC0+bWF4X2ZyZXEgPSBzcGlfc2V0X3J4X3NhbXBsaW5nX3BvaW50KG1lbS0+c3BpLAo+
IG9wLT5tYXhfZnJlcSk7CgpIb3cgY2FuIHRoaXMgd29yayB3aXRoIHRoZSBhYm92ZSAyIGxpbmVz
PyBNYXliZSB0aGVyZSB3aWxsIGJlIHRoZSBuZWVkCnRvIHVzZSBhICJtaW4gb2YgdGhlIG1heCIg
ZnJlcXVlbmNpZXM/CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
