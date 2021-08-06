Return-Path: <SRS0=GkoH=M5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B52CDC4338F
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Aug 2021 19:06:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CB2560FE7
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Aug 2021 19:06:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4CB2560FE7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AKeYxpq/AFJN6+Dy9Ko0pIczcXa/sCxTPtF/49OptSI=; b=bV1rNkZOPGGen7
	S6JonrNWC4PIse2RhxywRG/r6HM/az0j45/3xB4LpunJLG6uUPUqzjv1HxnXEEW1Xjk/+KAZuJJe6
	DYeJb848DSfDkHJdBjvBl3tDTR9zsZO9t05d1W2Gc/EYdnaaHKbU/7oV1w0Kmz6ebmje5QAC3BGai
	6b9i31X6ccTbzbBgZ53uREqr4g1QXw6oZStN4+7iQ/0fkNyMDLezWWbZc+21rEJnVjszJefGa6eT1
	Gkl3n39F742pi6y/nhnqIV5s3qH74zcU7cFYbRvyTkw8nZyoXhLD8Bg2T2k0Pr6wsQXtq75Q1ZM83
	IA3HHgESfnhNMZk752nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mC5Ah-00DFM3-9q; Fri, 06 Aug 2021 19:06:19 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mC5Ad-00DFL0-8Y
 for linux-mtd@lists.infradead.org; Fri, 06 Aug 2021 19:06:17 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 40AC760003;
 Fri,  6 Aug 2021 19:06:11 +0000 (UTC)
Date: Fri, 6 Aug 2021 21:06:09 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Apurva Nandan <a-nandan@ti.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Mark Brown <broonie@kernel.org>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>, Pratyush Yadav
 <p.yadav@ti.com>
Subject: Re: [PATCH 10/13] mtd: spinand: Add octal_dtr_enable() for Winbond
 manufacturer_ops
Message-ID: <20210806210609.0fd94b9e@xps13>
In-Reply-To: <20210713130538.646-11-a-nandan@ti.com>
References: <20210713130538.646-1-a-nandan@ti.com>
 <20210713130538.646-11-a-nandan@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_120615_611633_3E8759D5 
X-CRM114-Status: GOOD (  21.53  )
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

SGkgQXB1cnZhLAoKQXB1cnZhIE5hbmRhbiA8YS1uYW5kYW5AdGkuY29tPiB3cm90ZSBvbiBUdWUs
IDEzIEp1bCAyMDIxIDEzOjA1OjM1CiswMDAwOgoKPiBBZGQgaW1wbGVtZW50YXRpb24gb2Ygb2N0
YWxfZHRyX2VuYWJsZSgpIG1hbnVmYWN0dXJlcl9vcHMgZm9yIFdpbmJvbmQuCj4gVG8gc3dpdGNo
IHRvIE9jYXRsIERUUiBtb2RlLCBzZXR0aW5nIHByb2dyYW1tYWJsZSBkdW1teSBjeWNsZXMgYW5k
Cj4gU1BJIElPIG1vZGUgdXNpbmcgdGhlIHZvbGF0aWxlIGNvbmZpZ3VyYXRpb24gcmVnaXN0ZXIg
aXMgcmVxdWlyZWQuIFRvCj4gZnVuY3Rpb24gYXQgbWF4IDEyME1IeiBTUEkgY2xvY2sgaW4gT2N0
YWwgRFRSIG1vZGUsIDEyIHByb2dyYW1tYWJsZQo+IGR1bW15IGNsb2NrIGN5Y2xlIHNldHRpbmcg
aXMgcmVxdWlyZWQuIChEZWZhdWx0IG51bWJlciBvZiBkdW1teSBjeWNsZQo+IGFyZSA4IGNsb2Nr
cykKPiAKPiBTZXQgdGhlIHByb2dyYW1tYWJsZSBkdW1teSBjeWNsZSB0byAxMiBjbG9ja3MsIGFu
ZCBTUEkgSU8gbW9kZSB0bwo+IE9jdGFsIERUUiB3aXRoIERhdGEgU3Ryb2JlIGluIHRoZSBWQ1Iu
IEFsc28sIHBlcmZvcm0gYSBSRUFEIElECj4gb3BlcmF0aW9uIGluIE9jdGFsIERUUiBTUEkgbW9k
ZSB0byBlbnN1cmUgdGhlIHN3aXRjaCB3YXMgc3VjY2Vzc2Z1bC4KCkNvbW1pdCB0aXRsZSBzaG91
bGQgY29udGFpbiAid2luYm9uZDoiIChzYW1lIGZvciB0aGUgcHJldmlvdXMgcGF0Y2ggYW5kCnBv
c3NpYmx5IG5leHQgb25lcyBhcyB3ZWxsKS4KCj4gRGF0YXNoZWV0OiBodHRwczovL3d3dy53aW5i
b25kLmNvbS9leHBvcnQvc2l0ZXMvd2luYm9uZC9kYXRhc2hlZXQvVzM1TjAxSldfRGF0YXNoZWV0
X0JyaWVmLnBkZgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFwdXJ2YSBOYW5kYW4gPGEtbmFuZGFuQHRp
LmNvbT4KPiAtLS0KPiAgZHJpdmVycy9tdGQvbmFuZC9zcGkvd2luYm9uZC5jIHwgNDIgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNDIgaW5zZXJ0
aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3NwaS93aW5ib25kLmMg
Yi9kcml2ZXJzL210ZC9uYW5kL3NwaS93aW5ib25kLmMKPiBpbmRleCBhNzA1MmE5Y2ExNzEuLjU4
Y2RhMDdjMTVhMCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3NwaS93aW5ib25kLmMK
PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3NwaS93aW5ib25kLmMKPiBAQCAtMTYsNiArMTYsMTQg
QEAKPiAgCj4gICNkZWZpbmUgV0lOQk9ORF9DRkdfQlVGX1JFQUQJCUJJVCgzKQo+ICAKPiArLyog
T2N0YWwgRFRSIFNQSSBtb2RlICg4RC04RC04RCkgd2l0aCBEYXRhIFN0cm9iZSBvdXRwdXQqLwo+
ICsjZGVmaW5lIFdJTkJPTkRfSU9fTU9ERV9WQ1JfT0NUQUxfRFRSCTB4RTcKPiArI2RlZmluZSBX
SU5CT05EX0lPX01PREVfVkNSX0FERFIJMHgwMAo+ICsKPiArLyogVXNlIDEyIGR1bW15IGNsayBj
eWNsZXMgZm9yIHVzaW5nIE9jdGFsIERUUiBTUEkgYXQgbWF4IDEyME1IWiAqLwo+ICsjZGVmaW5l
IFdJTkJPTkRfRFVNTVlfQ0xLX0NPVU5UCQkxMgo+ICsjZGVmaW5lIFdJTkJPTkRfRFVNTVlfQ0xL
X1ZDUl9BRERSCTB4MDEKPiArCj4gIHN0YXRpYyBTUElOQU5EX09QX1ZBUklBTlRTKHJlYWRfY2Fj
aGVfdmFyaWFudHMsCj4gIAkJU1BJTkFORF9QQUdFX1JFQURfRlJPTV9DQUNIRV9RVUFESU9fT1Ao
MCwgMiwgTlVMTCwgMCksCj4gIAkJU1BJTkFORF9QQUdFX1JFQURfRlJPTV9DQUNIRV9YNF9PUCgw
LCAxLCBOVUxMLCAwKSwKPiBAQCAtMTQyLDggKzE1MCw0MiBAQCBzdGF0aWMgaW50IHdpbmJvbmRf
d3JpdGVfdmNyX29wKHN0cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCwgdTggcmVnLCB1OCB2
YWwpCj4gIAlyZXR1cm4gMDsKPiAgfQo+ICAKPiArc3RhdGljIGludCB3aW5ib25kX3NwaW5hbmRf
b2N0YWxfZHRyX2VuYWJsZShzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNwaW5hbmQpCj4gK3sKPiAr
CWludCByZXQ7Cj4gKwlzdHJ1Y3Qgc3BpX21lbV9vcCBvcDsKPiArCj4gKwlyZXQgPSB3aW5ib25k
X3dyaXRlX3Zjcl9vcChzcGluYW5kLCBXSU5CT05EX0RVTU1ZX0NMS19WQ1JfQUREUiwKPiArCQkJ
CSAgIFdJTkJPTkRfRFVNTVlfQ0xLX0NPVU5UKTsKPiArCWlmIChyZXQpCj4gKwkJcmV0dXJuIHJl
dDsKPiArCj4gKwlyZXQgPSB3aW5ib25kX3dyaXRlX3Zjcl9vcChzcGluYW5kLCBXSU5CT05EX0lP
X01PREVfVkNSX0FERFIsCj4gKwkJCQkgICBXSU5CT05EX0lPX01PREVfVkNSX09DVEFMX0RUUik7
Cj4gKwlpZiAocmV0KQo+ICsJCXJldHVybiByZXQ7Cj4gKwo+ICsJLyogUmVhZCBmbGFzaCBJRCB0
byBtYWtlIHN1cmUgdGhlIHN3aXRjaCB3YXMgc3VjY2Vzc2Z1bC4gKi8KPiArCW9wID0gKHN0cnVj
dCBzcGlfbWVtX29wKQo+ICsJCVNQSV9NRU1fT1AoU1BJX01FTV9PUF9DTURfRFRSKDIsIDB4OWY5
ZiwgOCksCj4gKwkJCSAgIFNQSV9NRU1fT1BfTk9fQUREUiwKPiArCQkJICAgU1BJX01FTV9PUF9E
VU1NWV9EVFIoMTYsIDgpLAo+ICsJCQkgICBTUElfTUVNX09QX0RBVEFfSU5fRFRSKFNQSU5BTkRf
TUFYX0lEX0xFTiwKPiArCQkJCQkJICBzcGluYW5kLT5zY3JhdGNoYnVmLCA4KSk7Cj4gKwo+ICsJ
cmV0ID0gc3BpX21lbV9leGVjX29wKHNwaW5hbmQtPnNwaW1lbSwgJm9wKTsKPiArCWlmIChyZXQp
Cj4gKwkJcmV0dXJuIHJldDsKPiArCj4gKwlpZiAobWVtY21wKHNwaW5hbmQtPnNjcmF0Y2hidWYs
IHNwaW5hbmQtPmlkLmRhdGEsIFNQSU5BTkRfTUFYX0lEX0xFTikpCj4gKwkJcmV0dXJuIC1FSU5W
QUw7Cj4gKwo+ICsJcmV0dXJuIDA7Cj4gK30KPiArCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc3Bp
bmFuZF9tYW51ZmFjdHVyZXJfb3BzIHdpbmJvbmRfc3BpbmFuZF9tYW51Zl9vcHMgPSB7Cj4gIAku
aW5pdCA9IHdpbmJvbmRfc3BpbmFuZF9pbml0LAo+ICsJLm9jdGFsX2R0cl9lbmFibGUgPSB3aW5i
b25kX3NwaW5hbmRfb2N0YWxfZHRyX2VuYWJsZSwKPiAgfTsKPiAgCj4gIGNvbnN0IHN0cnVjdCBz
cGluYW5kX21hbnVmYWN0dXJlciB3aW5ib25kX3NwaW5hbmRfbWFudWZhY3R1cmVyID0gewoKCgoK
VGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
