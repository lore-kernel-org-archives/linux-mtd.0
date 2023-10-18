Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BF4DCDB47E
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Oct 2023 08:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BQpHxRlU4uBAKIfeQdAeapwJV4Q3A9ovGZVx7x0UIvU=; b=GdSqMX/nQZ/xND
	QjFnZ2Cg/0XcL+c/wIXzZhwgFn9dQQuIxxUtO2zeGmoLFJSuDkoqH9ml8wgdWqtVDokeTxD0FigYE
	zUH1iSe3Sq5BVJTme8skAz6Vl6JbMjsuh5Ox0X+I31g0vWgxNFziIdMAVX45P2DB5i+BHNp8Acub6
	6YpU9U5opTgPZJBTUQSM+MnJka1M6fyRQNPbbnlPmgYhMBPjQNL4RlpbyoonJmSbGVwLH3G4Aybm6
	0kX7iaVWHGLmNFpMcNXMsIi+VJxASNwivQL1Q6dEh/NRyEoKOTwaL+7E/6g6UL+1lDO11ZeTuq+rv
	41r/YpQZrOeeeYTPvVow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt1gZ-00E72z-21;
	Wed, 18 Oct 2023 08:13:47 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt1gW-00E72X-1e
	for linux-mtd@lists.infradead.org;
	Wed, 18 Oct 2023 08:13:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 587E01BF206;
	Wed, 18 Oct 2023 08:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697616820;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=usCvN6cyAKkZu2e+Miu8g71Ahq7IBoQCOqzD1QX14HU=;
	b=jWQ54Nt8sOIxfPbz39Pl4ZJrPb1nwPjWmberXoelGuwdu/XwUfbjpZli1hPqLWdyu1/I2k
	5vzIML+6Bg1wDaTJ2M2C8ahMVUmNmqBEM9gCiqgnC03uAZQqC7eezr9WNJXzaE82Agc+bv
	BvCzU3TQJ0+5eIYg6Rpoi56tBZHktgBvZK2lMt8XlR7TvqaEYGa/wxwLRcqzAaAKK6gpHb
	G8YcKz7OONNmOxvXDJnvlEdWHCNDyyONEmT3fi6FuHQh8uRHmbkpDmBDEidHthN6gsU5is
	hI7JXA49ol8o3tI3/mwmgm0WckKP5z9avWCR8Uot7cgdD82YIEexh997w5u2Dw==
Date: Wed, 18 Oct 2023 10:13:36 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Richard Weinberger <richard@nod.at>, Michael Walle <michael@walle.cc>,
 Pratyush Yadav <pratyush@kernel.org>, "open list:SPI NOR SUBSYSTEM"
 <linux-mtd@lists.infradead.org>
Subject: Re: [GIT PULL] mtd: spi-nor: changes for v6.7-rc1
Message-ID: <20231018101336.1432f64c@xps-13>
In-Reply-To: <60bc9593-445d-47c9-ac47-0b2e2b11756e@linaro.org>
References: <60bc9593-445d-47c9-ac47-0b2e2b11756e@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_011344_848364_A939C520 
X-CRM114-Status: GOOD (  17.12  )
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

SGkgVHVkb3IsCgo+IEZvciBTUEkgTk9SIHdlIGNsZWFuZWQgdGhlIGZsYXNoIGluZm8gZW50cmll
cyBpbiBvcmRlciB0byBoYXZlCj4gdGhlbSBzbGltbWVyIGFuZCBzZWxmIGV4cGxhbmF0b3J5LiBJ
biBvcmRlciB0byBtYWtlIHRoZSBlbnRyaWVzCj4gYXMgc2xpbSBhcyBwb3NzaWJsZSwgd2UgaW50
cm9kdWNlZCBzYW5lIGRlZmF1bHQgdmFsdWVzIHNvIHRoYXQKPiB0aGUgYWN0dWFsIGZsYXNoIGVu
dHJpZXMgZG9uJ3QgbmVlZCB0byBzcGVjaWZ5IHRoZW0uIFdlIG5vdyB1c2UKPiBhIGZsZXhpYmxl
IG1hY3JvIHRvIHNwZWNpZnkgdGhlIGZsYXNoIElEIGluc3RlYWQgb2YgdGhlIHByZXZpb3VzCj4g
SU5GT3goKSBtYWNyb3MgdGhhdCBoYWQgaGFyZGNvZGVkIElEIGxlbmd0aHMuCj4gCj4gSW5zdGVh
ZCBvZjoKPiAtICAgICAgIHsgIncyNXE1MTJud20iLCBJTkZPKDB4ZWY4MDIwLCAwLCA2NCAqIDEw
MjQsIDApCj4gLSAgICAgICAgICAgICAgIE9UUF9JTkZPKDI1NiwgMywgMHgxMDAwLCAweDEwMDAp
IH0sCj4gCj4gV2Ugbm93IHVzZToKPiArICAgICAgICAgICAgICAgLmlkID0gU05PUl9JRCgweGVm
LCAweDgwLCAweDIwKSwKPiArICAgICAgICAgICAgICAgLm5hbWUgPSAidzI1cTUxMm53bSIsCj4g
KyAgICAgICAgICAgICAgIC5vdHAgPSBTTk9SX09UUCgyNTYsIDMsIDB4MTAwMCwgMHgxMDAwKSwK
PiAKPiBXZSBhbHNvIHJlbW92ZWQgc29tZSBmbGFzaCBlbnRyaWVzOiB0aGUgdmVyeSBvbGQgQ2F0
YWx5c3QKPiBTUEkgRUVQUk9NcyB0aGF0IHdlcmUgaW50cm9kdWNlZCBvbmNlIHdpdGggdGhlIFNQ
SS1OT1Igc3Vic3lzdGVtLAo+IGFuZCBhIEZ1aml0c3UgTVJBTS4gQm90aCBzaG91bGQgdXNlIHRo
ZSBhdDI1IEVFUFJPTSBkcml2ZXIuCj4gVGhlIGxhdHRlciBldmVuIGhhcyBkZXZpY2UgdHJlZSBi
aW5kaW5ncyBmb3IgdGhlIGF0MjUgZHJpdmVyLgo+IAo+IFdlIG1hZGUgc3VyZSB0aGF0IHRoZSBj
b252ZXJzaW9uIGRpZG4ndCBpbnRyb2R1Y2UgYW55IHVud2FudGVkCj4gY2hhbmdlcyBieSBjb21w
YXJpbmcgdGhlIC5yb2RhdGEgc2VnbWVudCBiZWZvcmUgYW5kIGFmdGVyIHRoZQo+IGNvbnZlcnNp
b24uIFRoZSBwYXRjaGVzIGxhbmRlZCBpbiBsaW51eC1uZXh0IGltbWVkaWF0ZWx5IGFmdGVyCj4g
djYuNi1yYzIsIHdlIGhhdmVuJ3Qgc2VlbiBhbnkgcmVncmVzc2lvbnMgeWV0Lgo+IAo+IEFwYXJ0
IG9mIHRoZSBhdXR1bW4gY2xlYW5pbmcgd2UgaW50cm9kdWNlZCBhIG5ldyBmbGFzaCBlbnRyeSwK
PiBhdDI1ZmYzMjFhLCBhbmQgYWRkZWQgYmxvY2sgcHJvdGVjdGlvbiBzdXBwb3J0IGZvciBtdDI1
cXU1MTJhLgoKVGhhbmtzIGEgbG90IGZvciBhZGFwdGluZyB0aGUgUFIgdGV4dCBhY2NvcmRpbmcg
dG8gTGludXMnIHJlbWFya3MuIEknbGwKdHJ5IHRvIGRvIHRoZSBzYW1lIDotKQoKVGhhbmtzLApN
aXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
