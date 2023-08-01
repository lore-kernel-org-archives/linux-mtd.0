Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C4C3C00528
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Aug 2023 15:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UmA4tuJtSdzuprDDgwWT7MBWGrNUJHh4tBubxQAQqB0=; b=TMvc2qsg8CFHfr
	Owj7Kr6WYvyfN9KBgZxobg/Y/Y8qqaLmhZHAcFbhdU93S/bz97o54VavCBE06cp0gTLXq9zgiOzZv
	jHd1pOIGrBcwsylPcZMBBeD2DGNDDweYL2KpTpJaOMxrKlLE5CbGPQAsH5AUWzfSH+wVfrdm0NHBC
	0yQjUiMZXV3I/fdel4M5SMxNQTbxEAE3KN1Aj5gKu/su9xDLWXw+XmfO30ti6s/LOVwOE5w/TQdbi
	W4+V6D4qIIo/7m3zBaXREZHQt0lEesJrIi0K9GyAANIb+XptmQeopVCAA+Kahe0N4F/0JhTmGMi2F
	E/zpkUYh9DK4IeLObBvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQrX1-002kj3-2J;
	Tue, 01 Aug 2023 15:43:31 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQrWx-002ki0-0h;
	Tue, 01 Aug 2023 15:43:28 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1439F1C0002;
	Tue,  1 Aug 2023 15:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690904603;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bWZsaBxHLydFSEqvkKaw+57w2DI9CMV4K3orO5o0zVQ=;
	b=OG9HC56Y6Oux9p8mmm21iM2w1vQl6JuPBZinmQehQRTkjVN3crp8cl+4iILyZC7zxDabRP
	/z26mxeP/lbHK4T/M8oxqtrssXncTVAH0n+YwVcISnmijH/skabfUvo4NWDJnNzkyQI2TC
	5M1Wy+63T89PUVMBeVsRU8l2WNIFLMISKu9xsN9uGg6iDwE6mhb25VVH9dlFky+F6OLkYz
	naRm1lgvBvbEPo0PQG/ZZ2bXqU4TgpE+b9SHQKAV4UEgaNES8yaQ8W5QWpBS8YlWqF46y3
	WYJxqCxtlDyhcJ838FEPhkKP1/g801wjAIxK8ZPPS2kjiNbUSH5bxy8T5NPDfg==
Date: Tue, 1 Aug 2023 17:43:21 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Li Zetao <lizetao1@huawei.com>
Cc: <computersforpeace@gmail.com>, <kamal.dasu@broadcom.com>,
 <bcm-kernel-feedback-list@broadcom.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <william.zhang@broadcom.com>, <anand.gore@broadcom.com>,
 <kursad.oney@broadcom.com>, <florian.fainelli@broadcom.com>,
 <rafal@milecki.pl>, <rjui@broadcom.com>, <sbranden@broadcom.com>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH -next] mtd: nand: Use
 devm_platform_ioremap_resource_byname()
Message-ID: <20230801174321.4fceefaa@xps-13>
In-Reply-To: <20230801134619.416618-1-lizetao1@huawei.com>
References: <20230801134619.416618-1-lizetao1@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_084327_525735_3365B65C 
X-CRM114-Status: GOOD (  15.26  )
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

SGkgTGksCgpsaXpldGFvMUBodWF3ZWkuY29tIHdyb3RlIG9uIFR1ZSwgMSBBdWcgMjAyMyAyMTo0
NjoxOSArMDgwMDoKCj4gQ29udmVydCBwbGF0Zm9ybV9nZXRfcmVzb3VyY2VfYnluYW1lKCkgKyBk
ZXZtX2lvcmVtYXBfcmVzb3VyY2UoKSB0byBhCj4gc2luZ2xlIGNhbGwgdG8gZGV2bV9wbGF0Zm9y
bV9pb3JlbWFwX3Jlc291cmNlX2J5bmFtZSgpLCBhcyB0aGlzIGlzCj4gZXhhY3RseSB3aGF0IHRo
aXMgZnVuY3Rpb24gZG9lcy4KClBsZWFzZSB1c2UgIm10ZDogcmF3bmFuZDogYnJjbW5hbmQ6IiBm
b3IgdGhlIHByZWZpeC4KCj4gCj4gU2lnbmVkLW9mZi1ieTogTGkgWmV0YW8gPGxpemV0YW8xQGh1
YXdlaS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JjbTYzMTM4
X25hbmQuYyB8IDQgKy0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9pcHJvY19u
YW5kLmMgICAgfCA3ICsrLS0tLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyks
IDggZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2Jy
Y21uYW5kL2JjbTYzMTM4X25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2Jj
bTYzMTM4X25hbmQuYwo+IGluZGV4IDcxZGRjYzYxMWY2ZS4uOTU5NjYyOTAwMGY0IDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JjbTYzMTM4X25hbmQuYwo+ICsr
KyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JjbTYzMTM4X25hbmQuYwo+IEBAIC02
MSwxNSArNjEsMTMgQEAgc3RhdGljIGludCBiY202MzEzOF9uYW5kX3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2Owo+
ICAJc3RydWN0IGJjbTYzMTM4X25hbmRfc29jICpwcml2Owo+ICAJc3RydWN0IGJyY21uYW5kX3Nv
YyAqc29jOwo+IC0Jc3RydWN0IHJlc291cmNlICpyZXM7Cj4gIAo+ICAJcHJpdiA9IGRldm1fa3ph
bGxvYyhkZXYsIHNpemVvZigqcHJpdiksIEdGUF9LRVJORUwpOwo+ICAJaWYgKCFwcml2KQo+ICAJ
CXJldHVybiAtRU5PTUVNOwo+ICAJc29jID0gJnByaXYtPnNvYzsKPiAgCj4gLQlyZXMgPSBwbGF0
Zm9ybV9nZXRfcmVzb3VyY2VfYnluYW1lKHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAibmFuZC1pbnQt
YmFzZSIpOwo+IC0JcHJpdi0+YmFzZSA9IGRldm1faW9yZW1hcF9yZXNvdXJjZShkZXYsIHJlcyk7
Cj4gKwlwcml2LT5iYXNlID0gZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlX2J5bmFtZShw
ZGV2LCAibmFuZC1pbnQtYmFzZSIpOwo+ICAJaWYgKElTX0VSUihwcml2LT5iYXNlKSkKPiAgCQly
ZXR1cm4gUFRSX0VSUihwcml2LT5iYXNlKTsKPiAgCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRk
L25hbmQvcmF3L2JyY21uYW5kL2lwcm9jX25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2Jy
Y21uYW5kL2lwcm9jX25hbmQuYwo+IGluZGV4IGQzMjk1MDg0N2E2Mi4uMDg5YzcwZmM2ZWRmIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2lwcm9jX25hbmQuYwo+
ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2lwcm9jX25hbmQuYwo+IEBAIC0x
MDMsNyArMTAzLDYgQEAgc3RhdGljIGludCBpcHJvY19uYW5kX3Byb2JlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpCj4gIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2Owo+ICAJ
c3RydWN0IGlwcm9jX25hbmRfc29jICpwcml2Owo+ICAJc3RydWN0IGJyY21uYW5kX3NvYyAqc29j
Owo+IC0Jc3RydWN0IHJlc291cmNlICpyZXM7Cj4gIAo+ICAJcHJpdiA9IGRldm1fa3phbGxvYyhk
ZXYsIHNpemVvZigqcHJpdiksIEdGUF9LRVJORUwpOwo+ICAJaWYgKCFwcml2KQo+IEBAIC0xMTIs
MTMgKzExMSwxMSBAQCBzdGF0aWMgaW50IGlwcm9jX25hbmRfcHJvYmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikKPiAgCj4gIAlzcGluX2xvY2tfaW5pdCgmcHJpdi0+aWRtX2xvY2spOwo+
ICAKPiAtCXJlcyA9IHBsYXRmb3JtX2dldF9yZXNvdXJjZV9ieW5hbWUocGRldiwgSU9SRVNPVVJD
RV9NRU0sICJpcHJvYy1pZG0iKTsKPiAtCXByaXYtPmlkbV9iYXNlID0gZGV2bV9pb3JlbWFwX3Jl
c291cmNlKGRldiwgcmVzKTsKPiArCXByaXYtPmlkbV9iYXNlID0gZGV2bV9wbGF0Zm9ybV9pb3Jl
bWFwX3Jlc291cmNlX2J5bmFtZShwZGV2LCAiaXByb2MtaWRtIik7Cj4gIAlpZiAoSVNfRVJSKHBy
aXYtPmlkbV9iYXNlKSkKPiAgCQlyZXR1cm4gUFRSX0VSUihwcml2LT5pZG1fYmFzZSk7Cj4gIAo+
IC0JcmVzID0gcGxhdGZvcm1fZ2V0X3Jlc291cmNlX2J5bmFtZShwZGV2LCBJT1JFU09VUkNFX01F
TSwgImlwcm9jLWV4dCIpOwo+IC0JcHJpdi0+ZXh0X2Jhc2UgPSBkZXZtX2lvcmVtYXBfcmVzb3Vy
Y2UoZGV2LCByZXMpOwo+ICsJcHJpdi0+ZXh0X2Jhc2UgPSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBf
cmVzb3VyY2VfYnluYW1lKHBkZXYsICJpcHJvYy1leHQiKTsKPiAgCWlmIChJU19FUlIocHJpdi0+
ZXh0X2Jhc2UpKQo+ICAJCXJldHVybiBQVFJfRVJSKHByaXYtPmV4dF9iYXNlKTsKPiAgCgoKVGhh
bmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
