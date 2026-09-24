Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C0F1C98321
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2026 20:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L3UsA6vfmJ996fHkl5vaHs7sgzwVZfnw8vuVpZNenrw=; b=qrbaQ/23vC8tmi
	jW6phZLslBtZsJdU0kGttAbFVBVMkduV3GgSvQIrJcZUMqtdzg+Nuip0zdnZG+1dHYG1Ny08Po5vS
	CeLE3GjnrPRK1yicTJrM7x6V3dUzmiHbi3VxuGfG4p7e0LDU6U4lGGq6mCytnHe5Gq/Nc7o+coQ/L
	vnLocmfITb7hX6rwa1JPTQH8fkVuuwYF+czOm87+0XS8KDH+6S/g3j29Y3HaxJhrs/L2B0kNgZL35
	BmAQnycTjwpSrz1uvMx9C+cNPLjKPP1HXftZeqXmu4UYJbnplwq3VNb58pQMZF4wRxTvq4P1AK6AG
	b7aA85UKvrbXtmx5k58Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9pmT-0000000C7Jg-2OWn;
	Thu, 24 Sep 2026 20:10:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9pmS-0000000C7JV-1g9s
	for linux-mtd@lists.infradead.org;
	Thu, 24 Sep 2026 20:10:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D3E0A600D4;
	Thu, 24 Sep 2026 20:10:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E5051F000FF;
	Thu, 24 Sep 2026 20:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790280655;
	bh=mrGCecuZc3/HhFipi7r/vR1auDxKeYAI9d88y4Ykcik=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Vr8Fraxzz0rgp6rLkyCccIFR/H7st5ouBo574SfYJa+ltnuzyLEk04aOFc0tJjeJS
	 xWua5XpMsItdAvQ2HI/ND6G+5OdA9q+3D04q4jXV5RFn5FYOJ75Z9lOYMVPy5PX0Lz
	 JnSGdisrsVklZe8q9+uW3M8RDsGbFUoLtyIoOa2vb/MdAsR4r3s4WqcMlAoXDmnj74
	 QRNwLXe7iYVL73Jju6vt2rNtg+fBptZEIy0G7YNSZO8Mj08QVfwX2FWYJ4+zYDWISw
	 2PVfoYFrgtW051ErGqmycLLlMHrJXAXEQgRCMd/+OldJD0vsdhndzLEESsGpp+kA4R
	 WDzfyaByfHD9A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/8] mtd: rawnand: qcom: make config_nand_page_read()
 more generic
To: "Richard Weinberger" <richard@nod.at>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Gabor
 Juhos" <j4g8y7@gmail.com>, "Manivannan Sadhasivam" <mani@kernel.org>, "Vignesh
 Raghavendra" <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, "Md Sadre
 Alam" <md.alam@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org
In-Reply-To: <20260924-qcom_nandc-share-more-code-v1-2-f3012199b161@gmail.com>
References: <20260924-qcom_nandc-share-more-code-v1-0-f3012199b161@gmail.com>
 <20260924-qcom_nandc-share-more-code-v1-2-f3012199b161@gmail.com>
Date: Thu, 24 Sep 2026 20:10:54 +0000
Message-Id: <20260924201055.1E5051F000FF@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gbXRkOiBjb2RlIGFu
ZCBjb21taXQgbWVzc2FnZSBtaXNtYXRjaCBpbiBjb25maWdfbmFuZF9wYWdlX3JlYWQoKSBjaGFu
Z2VzCi0tCgpjb21taXQgODM3MTNhZWQ5MmViZWVmYjI0MTAxYzZiZDNiMmM0N2M3ZTRlOWRmZApB
dXRob3I6IEdhYm9yIEp1aG9zIDxqNGc4eTdAZ21haWwuY29tPgoKbXRkOiByYXduYW5kOiBxY29t
OiBtYWtlIGNvbmZpZ19uYW5kX3BhZ2VfcmVhZCgpIG1vcmUgZ2VuZXJpYwoKVGhpcyBjb21taXQg
bW9kaWZpZXMgY29uZmlnX25hbmRfcGFnZV9yZWFkKCkgdG8gdGFrZSBhIGNvbnRyb2xsZXIgcG9p
bnRlcgpkaXJlY3RseSBpbnN0ZWFkIG9mIGEgbmFuZF9jaGlwIHBvaW50ZXIuIEl0IHVwZGF0ZXMg
dGhlIGNhbGxlcnMgYWNjb3JkaW5nbHkKYW5kIHJlbmFtZXMgdGhlIGZ1bmN0aW9uIHRvIHByZXBh
cmUgZm9yIGZ1dHVyZSByZXVzZS4KCj4gSW4gb3JkZXIgdG8gbWFrZSB0aGUgZnVuY3Rpb24gbW9y
ZSBnZW5lcmljLCBjaGFuZ2UgdGhlIGRlY2xhcmF0aW9uCj4gdG8gZ2V0IGEgJ3Fjb21fbmFuZGNf
Y29udHJvbGxlcicgcG9pbnRlciBkaXJlY3RseSwgYW5kIHVwZGF0ZSB0aGUKPiBjYWxsZXJzIGFj
Y29yZGluZ2x5LiBXaGlsZSBhdCBpdCwgYWxzbyBjaGFuZ2UgdGhlIGZ1bmN0aW9uIG5hbWUgdG8K
PiB1c2UgYSAncXBpY19uYW5kYycgcHJlZml4LgoKW1NldmVyaXR5OiBNZWRpdW1dCkRvZXMgdGhl
IGNvbW1pdCBtZXNzYWdlIGFjY3VyYXRlbHkgcmVmbGVjdCB0aGUgY2hhbmdlcyBtYWRlIGluIHRo
ZSBwYXRjaD8KClRoZSBjb21taXQgbWVzc2FnZSBtZW50aW9ucyBjaGFuZ2luZyB0aGUgcGFyYW1l
dGVyIHRvIGEgJ3Fjb21fbmFuZGNfY29udHJvbGxlcicKcG9pbnRlciBhbmQgdXNpbmcgYSAncXBp
Y19uYW5kYycgcHJlZml4IGZvciB0aGUgZnVuY3Rpb24gbmFtZS4gSG93ZXZlciwgdGhlCmNvZGUg
dXNlcyBhICdzdHJ1Y3QgcWNvbV9uYW5kX2NvbnRyb2xsZXIgKicgcG9pbnRlciBhbmQgbmFtZXMg
dGhlIGZ1bmN0aW9uCnFjb21fbmFuZGNfY29uZmlnX3BhZ2VfcmVhZCgpOgoKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jIGIvZHJpdmVycy9tdGQvbmFuZC9y
YXcvcWNvbV9uYW5kYy5jCj4gaW5kZXggMTJiZmIxNGNkOWEzNy4uYzY1YTg0MTZjM2Y1ZCAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMKPiArKysgYi9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMKWyAuLi4gXQo+IEBAIC0zMDUsMTAgKzMwNSw4
IEBAIHN0YXRpYyB2b2lkIHVwZGF0ZV9yd19yZWdzKHN0cnVjdCBxY29tX25hbmRfaG9zdCAqaG9z
dCwgaW50IG51bV9jdywgYm9vbCByZWFkLCBpCj4gICAqIEhlbHBlciB0byBwcmVwYXJlIERNQSBk
ZXNjcmlwdG9ycyBmb3IgY29uZmlndXJpbmcgcmVnaXN0ZXJzCj4gICAqIGJlZm9yZSByZWFkaW5n
IGEgTkFORCBwYWdlLgo+ICAgKi8KPiAtc3RhdGljIHZvaWQgY29uZmlnX25hbmRfcGFnZV9yZWFk
KHN0cnVjdCBuYW5kX2NoaXAgKmNoaXApCj4gK3N0YXRpYyB2b2lkIHFjb21fbmFuZGNfY29uZmln
X3BhZ2VfcmVhZChzdHJ1Y3QgcWNvbV9uYW5kX2NvbnRyb2xsZXIgKm5hbmRjKQo+ICB7CgotLSAK
U2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYw
OTI0LXFjb21fbmFuZGMtc2hhcmUtbW9yZS1jb2RlLXYxLTAtZjMwMTIxOTliMTYxQGdtYWlsLmNv
bT9wYXJ0PTIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
