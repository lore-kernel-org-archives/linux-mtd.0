Return-Path: <SRS0=GkoH=M5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1B8DC4338F
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Aug 2021 19:09:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5086E60FE7
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Aug 2021 19:09:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5086E60FE7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6p61sGodPctR+KtcNSMh8Nt7QJd7H3nEV+l0qykUBEQ=; b=G3aTGBnl2RWS5f
	WtbwZqhiHZaCMS2Lq+Kwd2deB7J/VsQhBLCwmDr/BaoEO4rdVjcRcjzN/L/s24MqikBCjenyVd8UE
	HJlnGr55eFOpE911HT+npncUIgK/6U+bwZPrmTgVTp8UgllhnswkdsTm7b84fGqIZ+6nLWcs0Pj/y
	t8K8Qb5lwpQBpkx9TYu10eCfVkoWd6S9+Lrp7lg1O70nmqE5MMx79ce/4PlyqGMEMx/edH/TAD2d1
	JdZ9w9KvYS4NElezvT1AuxGu3bLGFD/WIV9sK267kI18Q3VaPWEenv5YDTq6l1Cp4swapHc5tum3V
	6kwl0sWqk2olkyXqu9lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mC5D5-00DFnn-Jj; Fri, 06 Aug 2021 19:08:47 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mC5D2-00DFml-Io
 for linux-mtd@lists.infradead.org; Fri, 06 Aug 2021 19:08:46 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 88CB9100002;
 Fri,  6 Aug 2021 19:08:41 +0000 (UTC)
Date: Fri, 6 Aug 2021 21:08:40 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Apurva Nandan <a-nandan@ti.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Mark Brown <broonie@kernel.org>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>, Pratyush Yadav
 <p.yadav@ti.com>
Subject: Re: [PATCH 11/13] mtd: spinand: Add support for Power-on-Reset
 (PoR) instruction
Message-ID: <20210806210840.65c06b67@xps13>
In-Reply-To: <20210713130538.646-12-a-nandan@ti.com>
References: <20210713130538.646-1-a-nandan@ti.com>
 <20210713130538.646-12-a-nandan@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_120844_807629_A1FB7DA3 
X-CRM114-Status: GOOD (  15.93  )
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
IDEzIEp1bCAyMDIxIDEzOjA1OjM2CiswMDAwOgoKPiBNYW51ZmFjdHVyZXJzIGxpa2UgR2lnYWRl
dmljZSBhbmQgV2luYm9uZCBhcmUgYWRkaW5nIFBvd2VyLW9uLVJlc2V0Cj4gZnVuY3Rpb25hbGl0
eSBpbiB0aGVpciBTUEkgTkFORCBmbGFzaCBjaGlwcy4gUG9SIGluc3RydWN0aW9uIGNvbnNpc3Rz
Cj4gb2YgYSA2NmggY29tbWFuZCBmb2xsb3dlZCBieSA5OWggY29tbWFuZCwgYW5kIGlzIGRpZmZl
cmVudCBmcm9tIHRoZSBGRmgKPiByZXNldC4gVGhlIHJlc2V0IGNvbW1hbmQgRkZoIGp1c3QgY2xl
YXJzIHRoZSBzdGF0dXMgb25seSByZWdpc3RlcnMsCj4gd2hpbGUgdGhlIFBvUiBjb21tYW5kIGVy
YXNlcyBhbGwgdGhlIGNvbmZpZ3VyYXRpb25zIHdyaXR0ZW4gdG8gdGhlCj4gZmxhc2ggYW5kIGlz
IGVxdWl2YWxlbnQgdG8gYSBwb3dlci1kb3duIC0+IHBvd2VyLXVwIGN5Y2xlLgo+IAo+IEFkZCBz
dXBwb3J0IGZvciB0aGUgUG93ZXItb24tUmVzZXQgY29tbWFuZCBmb3IgYW55IGZsYXNoIHRoYXQg
cHJvdmlkZXMKPiB0aGlzIGZlYXR1cmUuCj4gCj4gRGF0YXNoZWV0OiBodHRwczovL3d3dy53aW5i
b25kLmNvbS9leHBvcnQvc2l0ZXMvd2luYm9uZC9kYXRhc2hlZXQvVzM1TjAxSldfRGF0YXNoZWV0
X0JyaWVmLnBkZgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFwdXJ2YSBOYW5kYW4gPGEtbmFuZGFuQHRp
LmNvbT4KPiAtLS0KClsuLi5dCgkJCQlcCj4gQEAgLTIxOCw2ICsyMzAsOCBAQCBzdHJ1Y3Qgc3Bp
bmFuZF9kZXZpY2U7Cj4gICAqIHJlYWRpbmcvcHJvZ3JhbW1pbmcvZXJhc2luZyB3aGVuIHRoZSBS
RVNFVCBvY2N1cnMuIFNpbmNlIHdlIGFsd2F5cwo+ICAgKiBpc3N1ZSBhIFJFU0VUIHdoZW4gdGhl
IGRldmljZSBpcyBJRExFLCA1dXMgaXMgc2VsZWN0ZWQgZm9yIGJvdGggaW5pdGlhbAo+ICAgKiBh
bmQgcG9sbCBkZWxheS4KPiArICogUG93ZXIgb24gUmVzZXQgY2FuIHRha2UgbWF4IHVwdG8gNTAw
IHVzIHRvIGNvbXBsZXRlLCBzbyBzbGVlcCBmb3IgMTAwMCB1cwoKcy9tYXggdXB0by91cCB0by8K
Cj4gKyAqIHRvIDEyMDAgdXMgc2FmZWx5LgoKSSBkb24ndCByZWFsbHkgZ2V0IHdoeSwgaWYgdGhl
IG1heGltdW0gaXMgNTAwLCB0aGVuIGxldCdzIHdhaXQgZm9yCjUwMHVzLgoKPiAgICovCj4gICNk
ZWZpbmUgU1BJTkFORF9SRUFEX0lOSVRJQUxfREVMQVlfVVMJNgo+ICAjZGVmaW5lIFNQSU5BTkRf
UkVBRF9QT0xMX0RFTEFZX1VTCTUKPiBAQCAtMjI3LDYgKzI0MSw4IEBAIHN0cnVjdCBzcGluYW5k
X2RldmljZTsKPiAgI2RlZmluZSBTUElOQU5EX1dSSVRFX1BPTExfREVMQVlfVVMJMTUKPiAgI2Rl
ZmluZSBTUElOQU5EX0VSQVNFX0lOSVRJQUxfREVMQVlfVVMJMjUwCj4gICNkZWZpbmUgU1BJTkFO
RF9FUkFTRV9QT0xMX0RFTEFZX1VTCTUwCj4gKyNkZWZpbmUgU1BJTkFORF9QT1JfTUlOX0RFTEFZ
X1VTCTEwMDAKPiArI2RlZmluZSBTUElOQU5EX1BPUl9NQVhfREVMQVlfVVMJMTIwMAo+ICAKPiAg
I2RlZmluZSBTUElOQU5EX1dBSVRSRFlfVElNRU9VVF9NUwk0MDAKPiAgCj4gQEAgLTM1MSw2ICsz
NjcsNyBAQCBzdHJ1Y3Qgc3BpbmFuZF9lY2NfaW5mbyB7Cj4gICNkZWZpbmUgU1BJTkFORF9IQVNf
UUVfQklUCQlCSVQoMCkKPiAgI2RlZmluZSBTUElOQU5EX0hBU19DUl9GRUFUX0JJVAkJQklUKDEp
Cj4gICNkZWZpbmUgU1BJTkFORF9IQVNfT0NUQUxfRFRSX0JJVAlCSVQoMikKPiArI2RlZmluZSBT
UElOQU5EX0hBU19QT1JfQ01EX0JJVAkJQklUKDMpCj4gIAo+ICAvKioKPiAgICogc3RydWN0IHNw
aW5hbmRfb25kaWVfZWNjX2NvbmYgLSBwcml2YXRlIFNQSS1OQU5EIG9uLWRpZSBFQ0MgZW5naW5l
IHN0cnVjdHVyZQoKCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
