Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4288C98321
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2026 20:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mioGuF+2nym8qgd9nUZrbaywfMW1dN6IchYfKx2gN+k=; b=IDsELZDXkVz3Ft
	PQjVYQzhExNW2D1uyLmj9CDltYJbVJT5j6KAC+hySyBjJWeHPmd6p2FZPC9JvjV1v4FwoenPmrcT8
	CMveXhjGXTieBAdcnSXitjjkUGBA2xLV+iVzyXd+J1kw84k1sNtOL39cgFmNgO4+SbWDScHYT6uAA
	AtMCkqDsJmAr8QGrr0iGYewOtSPoexlemwH4e9oW8Np71fEcmIoISv07Y+LNAwvJNXWxmRSDskWIL
	k9MR8berHNh8Pd15JXhtI83Xq49lmymq+k1FsUJXPQ6DwIymJNw+M7FIH57mvQSDP5i7ZUreTXQnN
	vx2E78HK8b/NslA+q9EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ple-0000000C79K-1i88;
	Thu, 24 Sep 2026 20:10:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9plc-0000000C77u-3SJY
	for linux-mtd@lists.infradead.org;
	Thu, 24 Sep 2026 20:10:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 937F443076;
	Thu, 24 Sep 2026 20:10:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2211A1F000FF;
	Thu, 24 Sep 2026 20:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790280604;
	bh=1jOsfzsB3hv4KNrWjmgN4wnBOvlVFXQ0TixMOloSGIw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=owOBD9Z3bxyNpfQo+mebKzx7nefUU6RKRXWF5C3g6rtPvf/jTfsfangRI3fdnqzZt
	 Eb3L1IwTFMcFJurhh9tUf1EWfRCPG7CRuzk+jdLeE91Fysidiw6IrVPFt94wiIy3P7
	 tXeqxgl3yJwQuaM4fVTNqssg3ElFnUANuAJM+m66M9Y2OucWs3R1dsp5PsppLhoeux
	 sOvDv+3lA+A3aYbuh/JO0XTgZW/y3mxnaxe7RHK7CCrK4jjeEAFMSM6hJy2VEIvqLT
	 K2YoifP2d1kAkKqpjcMFo85k2bKDW8zMB1uT4svQO9BCrQs5fjkmf91OiKjKw9Dj4R
	 3GDI3Vp3/gg+A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/8] mtd: rawnand: qcom: make nandc_set_read_loc_first()
 more generic
To: "Manivannan Sadhasivam" <mani@kernel.org>, "Gabor Juhos" <j4g8y7@gmail.com>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>
Cc: "Md Sadre Alam" <md.alam@oss.qualcomm.com>, linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260924-qcom_nandc-share-more-code-v1-5-f3012199b161@gmail.com>
References: <20260924-qcom_nandc-share-more-code-v1-0-f3012199b161@gmail.com>
 <20260924-qcom_nandc-share-more-code-v1-5-f3012199b161@gmail.com>
Date: Thu, 24 Sep 2026 20:10:03 +0000
Message-Id: <20260924201004.2211A1F000FF@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gbXRkOiByYXduYW5k
OiBjb21taXQgbWVzc2FnZSBhbmQgY29kZSBtaXNtYXRjaCBvbiBmdW5jdGlvbiBwcmVmaXgKLS0K
CmNvbW1pdCA0NDMzNDNjYmIxMWM2Y2ZkODJhYzg4MWFjZTAxMmZiOGQ1MzNhN2E4CkF1dGhvcjog
R2Fib3IgSnVob3MgPGo0Zzh5N0BnbWFpbC5jb20+CgptdGQ6IHJhd25hbmQ6IHFjb206IG1ha2Ug
bmFuZGNfc2V0X3JlYWRfbG9jX2ZpcnN0KCkgbW9yZSBnZW5lcmljCgpUaGlzIGNvbW1pdCBtb2Rp
ZmllcyBuYW5kY19zZXRfcmVhZF9sb2NfZmlyc3QoKSB0byB0YWtlIGEgY29udHJvbGxlciAKcG9p
bnRlciByYXRoZXIgdGhhbiBhIGNoaXAgcG9pbnRlciB0byBtYWtlIGl0IG1vcmUgZ2VuZXJpYy4g
SXQgYWxzbyAKaW50ZW5kcyB0byByZW5hbWUgdGhlIGZ1bmN0aW9uIHdpdGggYSBuZXcgcHJlZml4
LgoKPiBJbiBvcmRlciB0byBtYWtlIHRoZSBmdW5jdGlvbiBtb3JlIGdlbmVyaWMsIGNoYW5nZSB0
aGUgZGVjbGFyYXRpb24KPiB0byBnZXQgYSAncWNvbV9uYW5kY19jb250cm9sbGVyJyBwb2ludGVy
IGRpcmVjdGx5LCBhbmQgdXBkYXRlIHRoZQo+IGNhbGxlcnMgYWNjb3JkaW5nbHkuIFdoaWxlIGF0
IGl0LCBhbHNvIGNoYW5nZSB0aGUgZnVuY3Rpb24gbmFtZSB0bwo+IHVzZSBhICdxcGljX25hbmRj
JyBwcmVmaXguCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRj
LmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMKPiBpbmRleCA5OWZiZjU0NTgw
ODM2Li45NmExYTVhMDNkZTg3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3Fj
b21fbmFuZGMuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYwo+IEBA
IC0xNTAsOCArMTUwLDggQEAgc3RhdGljIGJvb2wgcWNvbV9uYW5kY19pc19sYXN0X2N3KHN0cnVj
dCBuYW5kX2VjY19jdHJsICplY2MsIGludCBjdykKPiAgfQo+ICAKPiAgLyoqCj4gLSAqIG5hbmRj
X3NldF9yZWFkX2xvY19maXJzdCgpIC0gdG8gc2V0IHJlYWQgbG9jYXRpb24gZmlyc3QgcmVnaXN0
ZXIKPiAtICogQGNoaXA6CQlOQU5EIFByaXZhdGUgRmxhc2ggQ2hpcCBEYXRhCj4gKyAqIHFjb21f
bmFuZGNfc2V0X3JlYWRfbG9jX2ZpcnN0KCkgLSB0byBzZXQgcmVhZCBsb2NhdGlvbiBmaXJzdCBy
ZWdpc3Rlcgo+ICsgKiBAbmFuZGM6CQlOQU5EIGNvbnRyb2xsZXIncyBwcml2YXRlIGRhdGEKPiAg
ICogQHJlZ19iYXNlOgkJbG9jYXRpb24gcmVnaXN0ZXIgYmFzZQo+ICAgKiBAY3dfb2Zmc2V0OgkJ
Y29kZSB3b3JkIG9mZnNldAo+ICAgKiBAcmVhZF9zaXplOgkJY29kZSB3b3JkIHJlYWQgbGVuZ3Ro
Cj4gQEAgLTE1OSwxMSArMTU5LDEwIEBAIHN0YXRpYyBib29sIHFjb21fbmFuZGNfaXNfbGFzdF9j
dyhzdHJ1Y3QgbmFuZF9lY2NfY3RybCAqZWNjLCBpbnQgY3cpCj4gICAqCj4gICAqIFRoaXMgZnVu
Y3Rpb24gd2lsbCBzZXQgbG9jYXRpb24gcmVnaXN0ZXIgdmFsdWUKPiAgICovCj4gLXN0YXRpYyB2
b2lkIG5hbmRjX3NldF9yZWFkX2xvY19maXJzdChzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLAo+IC0J
CQkJICAgICBpbnQgcmVnX2Jhc2UsIHUzMiBjd19vZmZzZXQsCj4gLQkJCQkgICAgIHUzMiByZWFk
X3NpemUsIHUzMiBpc19sYXN0X3JlYWRfbG9jKQo+ICtzdGF0aWMgdm9pZCBxY29tX25hbmRjX3Nl
dF9yZWFkX2xvY19maXJzdChzdHJ1Y3QgcWNvbV9uYW5kX2NvbnRyb2xsZXIgKm5hbmRjLAo+ICsJ
CQkJCSAgaW50IHJlZ19iYXNlLCB1MzIgY3dfb2Zmc2V0LAo+ICsJCQkJCSAgdTMyIHJlYWRfc2l6
ZSwgdTMyIGlzX2xhc3RfcmVhZF9sb2MpCgpbU2V2ZXJpdHk6IE1lZGl1bV0KRG9lcyB0aGlzIGlt
cGxlbWVudGF0aW9uIG1hdGNoIHRoZSBpbnRlbmRlZCBmdW5jdGlvbiBuYW1lIHByZWZpeD8gVGhl
IGNvbW1pdCAKbWVzc2FnZSBtZW50aW9ucyB1c2luZyBhICdxcGljX25hbmRjJyBwcmVmaXgsIGJ1
dCBpdCBpcyBkZWZpbmVkIGhlcmUgYXMgCnFjb21fbmFuZGNfc2V0X3JlYWRfbG9jX2ZpcnN0LgoK
LS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8y
MDI2MDkyNC1xY29tX25hbmRjLXNoYXJlLW1vcmUtY29kZS12MS0wLWYzMDEyMTk5YjE2MUBnbWFp
bC5jb20/cGFydD01CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
