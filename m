Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D2AC0015E
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jul 2023 15:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tscL0qZw70kPpoPPBVLmCaUBDHybFGLhc/ngYfQGERU=; b=h5FWO3DenjMAVM
	OT99tfrK4W3z9uNgwPdbG3AklCbG+k3AVk6FUgYu/mr3H/X4tPXExugd24q60CAfUWobxVjZ+Pr81
	ppo8Gk/KDFNve5YoCVvH/VIea3jAGGN5yjQDeAlOw9SfJaFUDzD190CY6BTZzvLkkbZE+7bz1l/m6
	EqSL/cGFzMUHPOtCBnA46qSwC3RYXysuj0kQ0efTmyjC6wVMScbZ+fpJgBwSyYcxAiYRQEm7Wbckw
	AZoYz79w/YQJ3BnjbtlYce/MBp9xNutQZLQvaYf/l9d+4WYFi0YGjWokVurb07lYnw4iUnaUMGlvq
	zPNGZezVKSVLC4sBEe9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qP2h4-00Fiu5-2W;
	Thu, 27 Jul 2023 15:14:22 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qP2h0-00Fip2-39;
	Thu, 27 Jul 2023 15:14:21 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8164B2000A;
	Thu, 27 Jul 2023 15:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690470855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nzd5HtoFFLl9A34pvDmwNT8AD0dQd1SJOjWLVltzINU=;
	b=hcZx7Sbb8wSkcSu8SGTQsaIbwyHL0BC+MgOUxjU6onWuKmYxxgodPxK7LpbcHi55RuUW4u
	FqBzvQRylrQvTy2CqXe+OTNiLyd2MDcEPZ8ymXHsbWsbPPgnYFmsxRS1QDtjTN3Y61I8F0
	QOAidgZtG/cET0QNtEXD9I6BQxAEilOTtcFULhh+ly6AlE6NjHT6bRLHaR2Ii0TpgOuiX7
	IX9W18qWNmWfG24ysQl4CDbOsqUPEOHIk99PKLxjRs9Gs8WnYW3c/YMoHB5cvQDvhCdK12
	Jut/zK+Colq8gtPoQ8mTW13Bdfq5DjPypSKfdiy4liJBQgIAalZdF+IvTdspng==
Date: Thu, 27 Jul 2023 17:14:11 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Md Sadre Alam
 <quic_mdalam@quicinc.com>, Sricharan Ramabadhran
 <quic_srichara@quicinc.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 7/8] mtd: rawnand: qcom: Early structure initialization
Message-ID: <20230727171411.0efd4815@xps-13>
In-Reply-To: <d83011fa-79e8-0ce8-4fdc-de01c43775f9@linaro.org>
References: <20230716144612.32132-1-miquel.raynal@bootlin.com>
	<20230716144612.32132-8-miquel.raynal@bootlin.com>
	<d83011fa-79e8-0ce8-4fdc-de01c43775f9@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_081419_344172_D33626EF 
X-CRM114-Status: GOOD (  13.77  )
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

SGkgVHVkb3IsCgp0dWRvci5hbWJhcnVzQGxpbmFyby5vcmcgd3JvdGUgb24gVGh1LCAyNyBKdWwg
MjAyMyAxNjowMzo0MCArMDEwMDoKCj4gT24gNy8xNi8yMyAxNTo0NiwgTWlxdWVsIFJheW5hbCB3
cm90ZToKPiA+IEluc3RlYWQgb2YgYWxsb2NhdGluZyBhIHN0cnVjdHVyZSBvbiB0aGUgc3RhY2sg
d2l0aCByYW5kb20gZGF0YSBhbmQgdGhlbgo+ID4gZXhwZWN0IHRoZSBjYWxsZWUgdG8gcGVyZm9y
bSB0aGUgaW5pdGlhbGl6YXRpb24gKHdoaWNoIGlzLCBpbiBnZW5lcmFsLAo+ID4gZXJyb3IgcHJv
bmUpLCBwcmVmZXIgemVyb2luZyB0aGUgc3RydWN0dXJlIGV4cGxpY2l0bHkgYXQgYWxsb2NhdGlv
biBhbmQKPiA+IHByb3ZpZGUgdGhlIGFscmVhZHkgemVyb2VkIGFyZWEsIHNvIG5vIGV4cGxpY2l0
IG1lbXNldCBvcGVyYXRpb24gaXMKPiA+IG5lZWRlZC4gSXQgaXMgcHJvYmFibHkgc2FmZXIgdG8g
ZG8gc28sIHNvIHdlIGxpbWl0IHRoZSB0aW1lZnJhbWUgd2hlbgo+ID4gZGlydHkgZGF0YSBjb3Vs
ZCBhY3R1YWxseSBiZSBhY2Nlc3NlZCBieSBtaXN0YWtlLiAgCj4gCj4gV2h5IGlzIHplcm9lZCBk
YXRhIGNvbnNpZGVyZWQgc2FmZSBvciBzYW5lPwoKSSBiZWxpZXZlIGFsbG9jYXRpbmcgc3RydWN0
dXJlcyBsaWtlIHRoYXQgb24gdGhlIHN0YWNrIHdpbGwgbWFrZSB0aGVpcgpjb250ZW50IGluaGVy
aXQgZnJvbSBwcmV2aW91cyB2YWx1ZXMgdXNlZCB0aGVyZSwgd2hpY2ggaXMgZ2VuZXJhbGx5IGEK
YmFkIGlkZWEgaWYgd2UgZXhwZWN0IHRoZSBzdHJ1Y3R1cmUgdG8gYmUgemVyb2VkLCB3aGljaCBp
cyB0aGUgY2FzZQpoZXJlLgoKVGhpcyBzdHJ1Y3R1cmUgaXMgbWVhbnQgdG8gYmUgemVyb2VkIGJl
Zm9yZSBiZWluZyB1c2VkLCBzbyBpbnN0ZWFkIG9mCmNhcnJ5aW5nIHN0YWxlIGRhdGEgdGhhdCB3
aWxsIGJlIHdpcGVkIG9mZiBsYXRlciwgSSBwcmVmZXIgdG8gaGF2ZSBpdAp6ZXJvZWQgZWFybGll
ci4gUmVkdWNpbmcgdGhlIHRpbWUgd2hlbiBvbmUgY291bGQgYWNjZXNzIHN0YWxlIGRhdGEgb3IK
d3JpdGUgc29tZXRoaW5nIHRoYXQgd2lsbCBiZSByZXNldCBkb2VzIG5vdCBzb3VuZCB0b3RhbGx5
IHVzZWxlc3MgdG8KbWUsIGluIHBhcnRpY3VsYXIgZ2l2ZW4gdGhlIG51bWJlciBvZiBjaGFuZ2Vz
IHRoaXMgZHJpdmVyIGhhcyBiZWVuCnN1YmplY3QgdG8gcmVjZW50bHkuCgpUaGFua3MsCk1pcXXD
qGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
