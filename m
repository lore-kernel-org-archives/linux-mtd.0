Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84AC3C52D6F
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Aug 2024 13:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1kw3xzYP/Btu+BV+ErkGS3nuzJr0I6+0cAzL2XqLkzg=; b=kAEExvtGiz7MZr
	nQjgK8lhfTSiCxdZ8IkWEoyVN8sFJmse3pmQO72qJxgFEFsFMwdmrSZREAFX3pU+Nn6f7VqZhAlCD
	NraWKfSLw0opSqutfUEzJtdF/fXAFYHGPBmQXqpUuSL07KrzVtEGZmywZnm+GYA4UO7+ddOtb6VtA
	FmqbbvOjzXpoRXPa7EnDaiA+4kDgwrxhs4gUHcWENI6aSJpUHoIBcYg5K3VQr/W2Uey8NERrxl4BT
	pekZu0zKQINuyomJerliXrwWsT+42CsQNnoyqBf00gH4XlnW4ib3OjV2Jw7Sjd9wSoEVGJgvGG0B+
	Htcu2Lsuy/AF5sNKq9gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sglHP-000000097AI-1mKX;
	Wed, 21 Aug 2024 13:21:39 +0000
Received: from mail.thorsis.com ([217.92.40.78])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sglGF-000000096ud-1itL;
	Wed, 21 Aug 2024 13:20:29 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D3534148346C;
	Wed, 21 Aug 2024 15:20:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1724246423; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/6SAo6PVLWJClsfzyHrkHAJBVOy5N9kixDFuGn0CPGk=;
	b=cxKl84oDc8cT8pEQQDsgrozKSItB2ILu/jt0c2SHQi+SwwmhJ1Z35VnI6jHI99ZsltSM+o
	yDO/L8ok/4ZwRMGOIfx3uFK9fwH9u5ywGxu+/1gB8ATgSMQ3pT8spAQ9mC+GLyfG5lE2v/
	WwMjYUFBZTNilPD14KuKtRPd69L1oqrI2cAV/AQ8S3wZnMqVhkVyYq52Bn/V07pMmQDkfi
	gLCxrqILoyWW/lKXjd1DRzUCrfNPs/pUUMX0zGTCH0WSl7MXxj+mxw8GthgfhQD5qmiCBh
	zz4NPPbanwtTpEqA+HEcU8PqvG8OCNyUUU4TKHYRWkCgyoAg3q5WD/6MHR/kOg==
Date: Wed, 21 Aug 2024 15:20:19 +0200
From: Alexander Dahl <ada@thorsis.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Alexander Dahl <ada@thorsis.com>, linux-mtd@lists.infradead.org,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	"moderated list:ARM/Microchip (AT91) SoC support" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: nand: raw: atmel: Add message on DMA usage
Message-ID: <20240821-ouch-tanned-fed30ba26700@thorsis.com>
Mail-Followup-To: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	"moderated list:ARM/Microchip (AT91) SoC support" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
References: <20240821120517.330868-1-ada@thorsis.com>
 <20240821151701.6bde9aba@xps-13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240821151701.6bde9aba@xps-13>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_062027_779639_47785DB4 
X-CRM114-Status: GOOD (  16.00  )
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

SGkgTWlxdWVsLAoKQW0gV2VkLCBBdWcgMjEsIDIwMjQgYXQgMDM6MTc6MDFQTSArMDIwMCBzY2hy
aWViIE1pcXVlbCBSYXluYWw6Cj4gSGkgQWxleGFuZGVyLAo+IAo+IGFkYUB0aG9yc2lzLmNvbSB3
cm90ZSBvbiBXZWQsIDIxIEF1ZyAyMDI0IDE0OjA1OjE2ICswMjAwOgo+IAo+ID4gTGlrZSBmb3Ig
b3RoZXIgYXRtZWwgZHJpdmVycyAoc2VyaWFsLCBjcnlwdG8sIG1tYywg4oCmKSwgdG9vLgo+ID4g
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgRGFobCA8YWRhQHRob3JzaXMuY29tPgo+ID4g
LS0tCj4gPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvYXRtZWwvbmFuZC1jb250cm9sbGVyLmMgfCAy
ICsrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+ID4gCj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvYXRtZWwvbmFuZC1jb250cm9sbGVyLmMgYi9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9hdG1lbC9uYW5kLWNvbnRyb2xsZXIuYwo+ID4gaW5kZXggZGM3NWQ1
MGQ1MmU4Li45ZTZkZWEyY2YxNDAgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9hdG1lbC9uYW5kLWNvbnRyb2xsZXIuYwo+ID4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcv
YXRtZWwvbmFuZC1jb250cm9sbGVyLmMKPiA+IEBAIC0yMDUxLDYgKzIwNTEsOCBAQCBzdGF0aWMg
aW50IGF0bWVsX25hbmRfY29udHJvbGxlcl9pbml0KHN0cnVjdCBhdG1lbF9uYW5kX2NvbnRyb2xs
ZXIgKm5jLAo+ID4gIAkJbmMtPmRtYWMgPSBkbWFfcmVxdWVzdF9jaGFubmVsKG1hc2ssIE5VTEws
IE5VTEwpOwo+ID4gIAkJaWYgKCFuYy0+ZG1hYykKPiA+ICAJCQlkZXZfZXJyKG5jLT5kZXYsICJG
YWlsZWQgdG8gcmVxdWVzdCBETUEgY2hhbm5lbFxuIik7Cj4gPiArCQlkZXZfaW5mbyhuYy0+ZGV2
LCAidXNpbmcgJXMgZm9yIERNQSB0cmFuc2ZlcnNcbiIsCj4gPiArCQkJIGRtYV9jaGFuX25hbWUo
bmMtPmRtYWMpKTsKPiAKPiAKPiBUaGUgbWVzc2FnZSBoZXJlIHdvdWxkIGJlIG1pc2xlYWRpbmcg
aWYgIW5jLT5kbWFjLgoKT2YgY291cnNlIHlvdSdyZSByaWdodCwgdGhpcyBpcyBzb21ld2hhdCBl
bWJhcmFzc2luZy4gIEknbGwgc2VuZCBhIHYyLgoKVGhhbmtzIGZvciByZXZpZXdpbmcuCkFsZXgK
Cj4gCj4gPiAgCX0KPiA+ICAKPiA+ICAJLyogV2UgZG8gbm90IHJldHJpZXZlIHRoZSBTTUMgc3lz
Y29uIHdoZW4gcGFyc2luZyBvbGQgRFRzLiAqLwo+ID4gCj4gPiBiYXNlLWNvbW1pdDogNDdhYzA5
YjkxYmVmYmI2YTIzNWFiNjIwYzMyYWY3MTlmODIwODM5OQo+IAo+IAo+IFRoYW5rcywKPiBNaXF1
w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
