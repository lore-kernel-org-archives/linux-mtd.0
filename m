Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22ACFC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Jul 2022 23:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ktOjR5blSb4b4LWXGU1N9zA5luYR5vbvT38X+9BBdtk=; b=CAcc3IHuPD62Mw8zBVM1eSDy+2
	NCvRE1B0HJYl0BMp4IAghJrNaw0VB/kzs1P7zqDo8AYelH5tl5vMV1cPtMzsljIVjfQAmw+Cn+Pxz
	Km659v4pJNSlP31Ra7i0aRjuUAIwWzs85HIgR/34vHio53KcXK5qcADdk3W4hxJbEtnn3UtVuGANN
	tfpy3jaMc3x78dyIJNrVsGOSQppJude4tde0540s1aVyrVV0spV8+QreicdTG5+saKtKXtywtAPk9
	zTP6Sc6UcV8Ltuys+HllhjwZ+53QoGBkKNZ5n5r8urttXOHisE3hzRJCODY/gn7D2Hp/7XCnN3dlp
	z/j4RWyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCUmJ-00BB5e-Gu; Fri, 15 Jul 2022 23:31:23 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCUcA-00B5Ws-5Y
	for linux-mtd@lists.infradead.org; Fri, 15 Jul 2022 23:20:55 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id C77A622175;
	Sat, 16 Jul 2022 01:20:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1657927252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wSxie2CEIzA/i7/xibzPAmDcNMxxLFuq+8fVYOpsh20=;
	b=PFe5tCjk2xQSS3mOEgj/bkzpUuy4IBe03UmFCqUq3fmYJHoAunfp0Tl6FKGxYdIAkEdYC/
	vI9YPMLYs6htvypVmO1nPZloCwF2f9hCONGHHY6lMkKLaYI0s4AEffljuy5jG9WqIdqqgY
	by+ZlGASU1/57ZjHUyP2bX9/bW+Ai4g=
MIME-Version: 1.0
Date: Sat, 16 Jul 2022 01:20:51 +0200
From: Michael Walle <michael@walle.cc>
To: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
Cc: clg@kaod.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, p.yadav@ti.com, quic_ggregory@quicinc.com,
 quic_jiles@quicinc.com, tudor.ambarus@microchip.com
Subject: Re: [PATCH] mtd: spi-nor: winbond: add support for W25Q512NW-IQ/IN
In-Reply-To: <2e0f02f3-0e0e-8690-a58e-bb74a21ab63e@quicinc.com>
References: <20220710145721.1207157-1-quic_jaehyoo@quicinc.com>
 <20220711095042.2095360-1-michael@walle.cc>
 <a42fbef2-3eff-9e88-233e-a805cfbe2376@quicinc.com>
 <4972a85d04e39ebb7b4a5872f6632c45@walle.cc>
 <2260955b-354d-ceda-cadc-49453bfca3e4@quicinc.com>
 <00f0c9d480ef5a414f1c34492661bd9e@walle.cc>
 <63cedfce-34bb-ed63-3871-75a6c3dd5d73@quicinc.com>
 <6be710bb5c1bf0449e54a54b78f6f7a0@walle.cc>
 <47c01d768ea56edc9a2f9d317af7b495@walle.cc>
 <114fcde6-bdf7-68ee-d031-35a916027aee@quicinc.com>
 <b42cb229-f241-6e29-a138-29023ce316d9@quicinc.com>
 <c628e868-5c73-ca4b-1f99-60cc149806bf@quicinc.com>
 <b00410c825486ec406ed1ae773b11792@walle.cc>
 <2e0f02f3-0e0e-8690-a58e-bb74a21ab63e@quicinc.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <00bdb7304cf479d21b87d4a35e908fb4@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_162054_417662_CD6C33F1 
X-CRM114-Status: GOOD (  11.30  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksCgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMgYi9kcml2ZXJz
L210ZC9zcGktbm9yL2NvcmUuYwo+PiBpbmRleCBjZTVkNjkzMTdkNDYuLmEyYzhkZTI1MGUwMSAx
MDA2NDQKPj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKPj4gKysrIGIvZHJpdmVy
cy9tdGQvc3BpLW5vci9jb3JlLmMKPj4gQEAgLTIxMTMsNiArMjExMywxMCBAQCBzcGlfbm9yX3Nl
bGVjdF91bmlmb3JtX2VyYXNlKHN0cnVjdCAKPj4gc3BpX25vcl9lcmFzZV9tYXAgKm1hcCwKPj4g
Cj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdGVzdGVkX2VyYXNlID0gJm1hcC0+
ZXJhc2VfdHlwZVtpXTsKPj4gCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIFNr
aXAgbWFza2VkIGVyYXNlIHR5cGVzLiAqLwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBpZiAoIXRlc3RlZF9lcmFzZS0+c2l6ZSkKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGNvbnRpbnVlOwo+IAo+IFllcywgaXQgYWxzbyB3b3Jrcy4gRG8g
eW91IHdhbnQgbWUgdG8gdXBkYXRlIHRoaXMgcGF0Y2ggd2l0aCBhZGRpbmcgCj4gdGhpcwo+IGZp
eD8gT3IgaXMgaXQgZ29vZCB0byBnbyBhcyBpcyBzbyB0aGF0IHRoZSBJTkZPIHRhYmxlIGNhbiBi
ZSByZXBsYWNlZAo+IHdpdGggU05PUl9JRDMgbGF0ZXIgYWZ0ZXIgdGhlIGZpeCBpcyBtZXJnZWQ/
CgpQbGVhc2UgYWRkIHRoaXMgYXMgYSBzZXBhcmF0ZSBwcmVjZWRpbmcgcGF0Y2ggdG8geW91ciBv
cmlnaW5hbCBvbmUKd2hlcmUgeW91IGFkZCB0aGUgZmxhc2guIEtlZXAgdGhlIElORk8oMHhlZjYw
MjAsIDAsIDAsIDApLiBUaGVuIHdlCndpbGwgcmVwbGFjZSBpdCBsYXRlciB3aXRoIHRoZSBTTk9S
X0lEMygpLgoKVGhhbmtzIGZvciBkZWJ1Z2dpbmchCi1taWNoYWVsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
