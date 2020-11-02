Return-Path: <SRS0=MFHV=EI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5742DC00A89
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 12:35:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D30802076E
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 12:35:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yFH1u3Uh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D30802076E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=b5xu5K7B0x/rkbIKvarJ7OzIVMIKBSeMvrGQg+AHBH8=; b=yFH1u3Uhv35jv5twLUd6AhKfH
	779oF/w2cpul/K2o6tPbY/G4ZxnPjgiCpoZN2fNnY1zXxojEwr+ki/74W6Qo2CFNN8neF6V3S6ICB
	7PPl/d9qMeVpCKwtTQ4nz6/sekcSAgtbbAHFxG94pB4YJ7HqoLdCbv5Fh7IwoCSY3OgOMpp5MnWkT
	lm9DXKHy1TaxjlfBRVuAP6XHjiX13T5tdRmlagYVrJ/T0wwFesfv2w4DqSXlRN+kMMbRIOsgPOHGy
	SvlpLfSXZ3H5yEGIdJ6Bpxn321UWfBgM4WuV7Ee9KXKnBRPnIKRR+Rh3KhEpsuMXqWZx7cvY4rWUm
	nUxd2EmOA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZZ3G-0000ce-Mp; Mon, 02 Nov 2020 12:35:10 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZZ39-0000Yf-Bw
 for linux-mtd@lists.infradead.org; Mon, 02 Nov 2020 12:35:08 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id C780560002;
 Mon,  2 Nov 2020 12:34:58 +0000 (UTC)
Date: Mon, 2 Nov 2020 13:34:57 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 04/23] mtd: devices: docg3: Fix kernel-doc 'bad line'
 and 'excessive doc' issues
Message-ID: <20201102133457.7d2db57d@xps13>
In-Reply-To: <20201102115406.1074327-5-lee.jones@linaro.org>
References: <20201102115406.1074327-1-lee.jones@linaro.org>
 <20201102115406.1074327-5-lee.jones@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_073503_687565_2EF71C65 
X-CRM114-Status: GOOD (  18.95  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>,
 Robert Jarzmik <robert.jarzmik@free.fr>, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTGVlLAoKTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4gd3JvdGUgb24gTW9uLCAg
MiBOb3YgMjAyMCAxMTo1Mzo0NworMDAwMDoKCj4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2Vy
bmVsIGJ1aWxkIHdhcm5pbmcocyk6Cj4gCj4gIGRyaXZlcnMvbXRkL2RldmljZXMvZG9jZzMuYzo4
MTk6IHdhcm5pbmc6IGJhZCBsaW5lOgo+ICBkcml2ZXJzL210ZC9kZXZpY2VzL2RvY2czLmM6MTc5
OTogd2FybmluZzogRXhjZXNzIGZ1bmN0aW9uIHBhcmFtZXRlciAnYmFzZScgZGVzY3JpcHRpb24g
aW4gJ2RvY19wcm9iZV9kZXZpY2UnCj4gCj4gQ2M6IFJvYmVydCBKYXJ6bWlrIDxyb2JlcnQuamFy
em1pa0BmcmVlLmZyPgo+IENjOiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4u
Y29tPgo+IENjOiBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0Pgo+IENjOiBWaWdu
ZXNoIFJhZ2hhdmVuZHJhIDx2aWduZXNockB0aS5jb20+Cj4gQ2M6IGxpbnV4LW10ZEBsaXN0cy5p
bmZyYWRlYWQub3JnCj4gU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJv
Lm9yZz4KPiAtLS0KPiAgZHJpdmVycy9tdGQvZGV2aWNlcy9kb2NnMy5jIHwgNSArKy0tLQo+ICAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL210ZC9kZXZpY2VzL2RvY2czLmMgYi9kcml2ZXJzL210ZC9kZXZpY2Vz
L2RvY2czLmMKPiBpbmRleCBhMDMwNzkyMTE1YmMyLi41YjBhZTVkZGFkNzQ1IDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvbXRkL2RldmljZXMvZG9jZzMuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL2Rldmlj
ZXMvZG9jZzMuYwo+IEBAIC04MTYsNyArODE2LDcgQEAgc3RhdGljIHZvaWQgZG9jX3JlYWRfcGFn
ZV9maW5pc2goc3RydWN0IGRvY2czICpkb2NnMykKPiAgCj4gIC8qKgo+ICAgKiBjYWxjX2Jsb2Nr
X3NlY3RvciAtIENhbGN1bGF0ZSBibG9ja3MsIHBhZ2VzIGFuZCBvZnMuCj4gLQo+ICsgKgo+ICAg
KiBAZnJvbTogb2Zmc2V0IGluIGZsYXNoCj4gICAqIEBibG9jazA6IGZpcnN0IHBsYW5lIGJsb2Nr
IGluZGV4IGNhbGN1bGF0ZWQKPiAgICogQGJsb2NrMTogc2Vjb25kIHBsYW5lIGJsb2NrIGluZGV4
IGNhbGN1bGF0ZWQKPiBAQCAtMTc4MywxMCArMTc4Myw5IEBAIHN0YXRpYyBpbnQgX19pbml0IGRv
Y19zZXRfZHJpdmVyX2luZm8oaW50IGNoaXBfaWQsIHN0cnVjdCBtdGRfaW5mbyAqbXRkKQo+ICAK
PiAgLyoqCj4gICAqIGRvY19wcm9iZV9kZXZpY2UgLSBDaGVjayBpZiBhIGRldmljZSBpcyBhdmFp
bGFibGUKPiAtICogQGJhc2U6IHRoZSBpbyBzcGFjZSB3aGVyZSB0aGUgZGV2aWNlIGlzIHByb2Jl
ZAo+ICsgKiBAY2FzY2FkZTogdGhlIGNhc2NhZGUgb2YgY2hpcHMgdGhpcyBkZXZpY2VzIHdpbGwg
YmVsb25nIHRvCj4gICAqIEBmbG9vcjogdGhlIGZsb29yIG9mIHRoZSBwcm9iZWQgZGV2aWNlCj4g
ICAqIEBkZXY6IHRoZSBkZXZpY2UKPiAtICogQGNhc2NhZGU6IHRoZSBjYXNjYWRlIG9mIGNoaXBz
IHRoaXMgZGV2aWNlcyB3aWxsIGJlbG9uZyB0bwo+ICAgKgo+ICAgKiBDaGVja3Mgd2hldGhlciBh
IGRldmljZSBhdCB0aGUgc3BlY2lmaWVkIElPIHJhbmdlLCBhbmQgZmxvb3IgaXMgYXZhaWxhYmxl
Lgo+ICAgKgoKWW91IGFsc28gcmVvcmRlciB0aGUgcGFyYW1ldGVycyBpbiB0aGUga2RvYyB3aGlj
aCBpcyBub3Qgc3RhdGVkIGluIHRoZQpjb21taXQgbG9nLiBCdXQgdGhhdCdzIG5pdHBpY2tpbmcu
Li4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
