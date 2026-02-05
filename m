Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B03EAECD993
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Feb 2026 17:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7+1Ox2tgBV/n5luMpvBRENXw2cv+3ezTfaic0RWxrQM=; b=s5Mvcw+z9B3vBh
	ulOsofGfZds6640AyNnlqrPZqghKdc4NQRMXyJWb990Bi8kmoNqamTEMpAsHAgF3Su2fmJ5juTXkT
	kcahRov64febjdl2Ikrg4X/OcZHcqYKlkMdfv7ZIObbCIFxq/YscZPOqzUG+A+qnCf/WVvwvDhfoe
	Yaen+z2a+lMJ/fuaDhkQuyLNTBU6MiT7wRX69ZTuZ66etg70cl7My2NYnikxq1EQx7AwdWlzG5HfY
	RuaRrs7Qn2w1fIL/d6HtxLga8iedluEvRzU90qFlFWbyvSjDfTiR67fTyKFYQf24ScOr96g0jDAYK
	+kZ+VS+K0bu9OmerKyFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo3Kc-0000000AJFj-3nUX;
	Thu, 05 Feb 2026 17:39:54 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo3KZ-0000000AJFO-05Ss
	for linux-mtd@lists.infradead.org;
	Thu, 05 Feb 2026 17:39:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 405BEC243B0;
	Thu,  5 Feb 2026 17:39:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EC8AA6074D;
	Thu,  5 Feb 2026 17:39:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B160C102F1B6D;
	Thu,  5 Feb 2026 18:39:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770313188; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=m5bZ0GbyBq2QVmRhYdoLegbe54IqW06SZN2AvRVDWyo=;
	b=dDiXS8Bs+DJPLycI9dC8wYV3oa+ZNSsQMS1HwuWuKWiT5DRf9iH8wZtCUG4P/WgYQEW7YD
	RlnsVErwGI2UeiBRUVeAUy/QDvk3VKVRr98m7RoN//wwQ8lqEdZeDlbNWj0J8ouvMn1HPy
	T7s0ZCQVP+InnKgqFTFOV6HA31uoi30MOOpc8jKp+ot4OW1XArg+UBuMx5UfJIGjqfhv+O
	iNql0bUtA6Ecy91BK65fJlnOztGWix4BnpGDoI21deGLLm6f0bNyQy+kiIJnlynyO0f1G9
	LbvYCxDfTZCxMP6JHi1Keb0+hV4jyksJhGRoeiO3u3+5JYMC6UTkvn8142eyXw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: <broonie@kernel.org>,  <robh@kernel.org>,  <krzk+dt@kernel.org>,
  <conor+dt@kernel.org>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <tudor.ambarus@linaro.org>,  <pratyush@kernel.org>,  <mwalle@kernel.org>,
  <linux-spi@vger.kernel.org>,  <devicetree@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>,  <linux-mtd@lists.infradead.org>,
  <praneeth@ti.com>,  <u-kumar1@ti.com>,  <p-mantena@ti.com>,
  <a-dutta@ti.com>
Subject: Re: [RFC PATCH v2 09/12] spi: cadence-quadspi: add PHY tuning
 infrastructure
In-Reply-To: <20260113141617.1905039-10-s-k6@ti.com> (Santhosh Kumar K.'s
	message of "Tue, 13 Jan 2026 19:46:14 +0530")
References: <20260113141617.1905039-1-s-k6@ti.com>
	<20260113141617.1905039-10-s-k6@ti.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 05 Feb 2026 18:39:45 +0100
Message-ID: <87bji3gkda.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_093951_202644_6557ED63 
X-CRM114-Status: GOOD (  15.64  )
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

T24gMTMvMDEvMjAyNiBhdCAxOTo0NjoxNCArMDUzMCwgU2FudGhvc2ggS3VtYXIgSyA8cy1rNkB0
aS5jb20+IHdyb3RlOgoKPiBJbXBsZW1lbnQgdGhlIHNwaV9jb250cm9sbGVyX21lbV9vcHMgZXhl
Y3V0ZV90dW5pbmcgY2FsbGJhY2sgdG8gZW5hYmxlCj4gUEhZIHR1bmluZyBzdXBwb3J0IGZvciB0
aGUgQ2FkZW5jZSBjb250cm9sbGVyLiBQSFkgdHVuaW5nIG9wdGltaXplcyBkYXRhCj4gY2FwdHVy
ZSB0aW1pbmcgYXQgaGlnaCBmcmVxdWVuY2llcyBieSBjYWxpYnJhdGluZyB0aGUgcmVhZCBkYXRh
IGNhcHR1cmUKPiBkZWxheSB0aHJvdWdoIHRoZSBjb250cm9sbGVyJ3MgUEhZIGludGVyZmFjZS4K
Pgo+IFR1bmluZyBhbGdvcml0aG0gZnVuY3Rpb25zIChjcXNwaV9waHlfdHVuaW5nX2Rkci9zZHIg
YW5kCj4gY3FzcGlfcGh5X3ByZS9wb3N0X2NvbmZpZykgYXJlIHBsYWNlaG9sZGVycyB0byBiZSBp
bXBsZW1lbnRlZAo+IGluIHN1YnNlcXVlbnQgY29tbWl0cy4KPgo+IFNpZ25lZC1vZmYtYnk6IFNh
bnRob3NoIEt1bWFyIEsgPHMtazZAdGkuY29tPgo+IC0tLQo+ICBkcml2ZXJzL3NwaS9zcGktY2Fk
ZW5jZS1xdWFkc3BpLmMgfCAyNDEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAyNDEgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
c3BpL3NwaS1jYWRlbmNlLXF1YWRzcGkuYyBiL2RyaXZlcnMvc3BpL3NwaS1jYWRlbmNlLXF1YWRz
cGkuYwo+IGluZGV4IDBkZjI4NmQyNDI1Ni4uYjhiMGU4NWY0ZjY4IDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvc3BpL3NwaS1jYWRlbmNlLXF1YWRzcGkuYwo+ICsrKyBiL2RyaXZlcnMvc3BpL3NwaS1j
YWRlbmNlLXF1YWRzcGkuYwo+IEBAIC0zMiw2ICszMiw3IEBACj4gIAo+ICAjZGVmaW5lIENRU1BJ
X05BTUUJCQkiY2FkZW5jZS1xc3BpIgo+ICAjZGVmaW5lIENRU1BJX01BWF9DSElQU0VMRUNUCQk0
Cj4gKyNkZWZpbmUgQ1FTUElfQU02NTRfTk9OX1BIWV9DTEtfUkFURQkyNTAwMDAwMAo+ICAKPiAg
c3RhdGljX2Fzc2VydChDUVNQSV9NQVhfQ0hJUFNFTEVDVCA8PSBTUElfREVWSUNFX0NTX0NOVF9N
QVgpOwo+ICAKPiBAQCAtNjUsNiArNjYsNyBAQCBzdHJ1Y3QgY3FzcGlfc3Q7Cj4gIHN0cnVjdCBj
cXNwaV9mbGFzaF9wZGF0YSB7Cj4gIAlzdHJ1Y3QgY3FzcGlfc3QJKmNxc3BpOwo+ICAJdTMyCQlj
bGtfcmF0ZTsKPiArCXUzMgkJbm9uX3BoeV9jbGtfcmF0ZTsKClRoaXMgaXMgdGhlIHNlY29uZCAo
YW5kIGxhc3QpIG1haW4gaXNzdWUgSSBoYXZlIHdpdGggdGhlIHNlcmllcyBhcyBpdCBpcwpyaWdo
dCBub3cuIFdlIGNhbm5vdCBzZXQgdGhpcyB0eXBlIG9mIGZyZXF1ZW5jeSBpbiB0aGUgZHJpdmVy
IElNTywgaXQgaXMKdG9vIGJvYXJkIHNwZWNpZmljLgoKV2UgY3VycmVudGx5IGhhdmUgYSBEVCBw
cm9wZXJ0eSBmb3IgdGhlIFNQSSBtYXhpbXVtIHN1cHBvcnRlZApmcmVxdWVuY3kuIEkgYmVsaWV2
ZSB0aGlzIGlzIG5vIGxvbmdlciBlbm91Z2guIFdoeSBub3QgbWFraW5nIHRoaXMKZnJlcXVlbmN5
IHByb3BlcnR5IGFuIGFycmF5PyBGaXJzdCBmcmVxdWVuY3kgd291bGQgYmUgdGhlIGRlZmF1bHQs
Cm5vbiB0dW5lZCBtYXhpbXVtIGZyZXF1ZW5jeS4gVGhlIHNlY29uZCB3b3VsZCBiZSB0aGUgbWF4
aW11bSBmcmVxdWVuY3kKcmVhY2hhYmxlIHdoZW4gdHVuaW5nIHRoZSBQSFkuCgpUaGUgcmVzdCBv
ZiB0aGUgcGF0Y2ggTEdUTSBvdGhlcndpc2UsIGJ1dCB0aGVyZSBpcyB0aGlzIGZyZXF1ZW5jeQpp
bmZvcm1hdGlvbiB3aGljaCBJIHRoaW5rIHNob3VsZCBiZSBoYW5kbGVkIHdpdGggbW9yZSBjYXJl
LgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
