Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A8B7C2BA4C
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jan 2022 11:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sxoWRqBY/pIjRBuSpetwLiEnH4v1KXuoGido+EmnLw4=; b=W7w9AFar5ebQJd
	iN28ELYsSp1or0gSVISqcLKB50fG4zAYSABVtxkjIpGq1WVmSZ2eF2p28T7gCeik5FCIjXq2ACJdc
	GCGrM0idCu1Ys6/7+RcFPlnnfrxyq8YdbqFAVNQzalXiSdujutuhLjnCnFceEnKYIPtHWtufYzR9J
	OvqXODb0n5zMkBZ4Ar7RKcG3qay0i5QHTEDvTt/iHjS51OYvEPI/qITUJJ0HeHpt7Pg83n1q/N4nV
	FcfJZHj/cGFpD2on77x9h/ymTRuvMiy6iYJluv/59qAJMtvj9XZXjVMj7KQTfyHtaBwpW55Sp+YCz
	keFJ7xFoy/G+lzXSfEHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCgSB-00BTXr-4Z; Wed, 26 Jan 2022 11:27:07 +0000
Received: from relay11.mail.gandi.net ([2001:4b98:dc4:8::231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCgLA-00BRWp-7a
 for linux-mtd@lists.infradead.org; Wed, 26 Jan 2022 11:19:54 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DC356100002;
 Wed, 26 Jan 2022 11:19:48 +0000 (UTC)
Date: Wed, 26 Jan 2022 12:19:47 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@foss.st.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, <richard@nod.at>,
 <vigneshr@ti.com>, <robh+dt@kernel.org>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <devicetree@vger.kernel.org>, <chenshumin86@sina.com>
Subject: Re: [PATCH 3/3] nvmem: core: Fix a conflict between MTD and NVMEM
 on wp-gpios property
Message-ID: <20220126121947.79890a47@xps13>
In-Reply-To: <9662651a-12d9-4893-95c2-aa1a3a10302d@foss.st.com>
References: <20220105135734.271313-1-christophe.kerello@foss.st.com>
 <20220105135734.271313-4-christophe.kerello@foss.st.com>
 <3f9a9731-c096-bc9b-63df-bd1dff032737@linaro.org>
 <9662651a-12d9-4893-95c2-aa1a3a10302d@foss.st.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_031952_475000_1BE2DFC8 
X-CRM114-Status: GOOD (  15.31  )
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

SGkgQ2hyaXN0b3BoZSwKCmNocmlzdG9waGUua2VyZWxsb0Bmb3NzLnN0LmNvbSB3cm90ZSBvbiBX
ZWQsIDI2IEphbiAyMDIyIDEyOjA4OjM4ICswMTAwOgoKPiBIaSBTcmluaXZhcywgTWlxdWVsLAo+
IAo+IE9uIDEvMjUvMjIgMTE6NDQsIFNyaW5pdmFzIEthbmRhZ2F0bGEgd3JvdGU6Cj4gPiAKPiA+
IAo+ID4gT24gMDUvMDEvMjAyMiAxMzo1NywgQ2hyaXN0b3BoZSBLZXJlbGxvIHdyb3RlOiAgCj4g
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbnZtZW0vY29yZS5jIGIvZHJpdmVycy9udm1lbS9jb3Jl
LmMKPiA+PiBpbmRleCBlNzY1ZDNkMDU0MmUuLmUxMWM3NGRiNjRmOSAxMDA2NDQKPiA+PiAtLS0g
YS9kcml2ZXJzL252bWVtL2NvcmUuYwo+ID4+ICsrKyBiL2RyaXZlcnMvbnZtZW0vY29yZS5jCj4g
Pj4gQEAgLTc2OSw3ICs3NjksNyBAQCBzdHJ1Y3QgbnZtZW1fZGV2aWNlICpudm1lbV9yZWdpc3Rl
cihjb25zdCBzdHJ1Y3QgPj4gbnZtZW1fY29uZmlnICpjb25maWcpCj4gPj4gwqDCoMKgwqDCoCBp
ZiAoY29uZmlnLT53cF9ncGlvKQo+ID4+IMKgwqDCoMKgwqDCoMKgwqDCoCBudm1lbS0+d3BfZ3Bp
byA9IGNvbmZpZy0+d3BfZ3BpbzsKPiA+PiAtwqDCoMKgIGVsc2UKPiA+PiArwqDCoMKgIGVsc2Ug
aWYgKGNvbmZpZy0+cmVnX3dyaXRlKSAgCj4gPiBUaGlzIGlzIGNsZWFybHkgbm90IGdvaW5nIHRv
IHdvcmsgZm9yIGV2ZXJ5b25lLgo+ID4gCj4gPiBBIGZsYWcgaW4gbnZtZW1fY29uZmlnIHRvIGlu
ZGljYXRlIHRoYXQgd3AgZ3BpbyBpcyBtYW5hZ2VkIGJ5IHByb3ZpZGVyID4gZHJpdmVyIHdvdWxk
IGJlIHRoZSByaWdodCB0aGluZyB0byBkbyBoZXJlLiAgCj4gCj4gQmFzZWQgb24geW91ciBpbnB1
dHMsIEkgd2lsbCBhZGQgYSBuZXcgYm9vbGVhbiBmbGFnIGluIG52bWVuX2NvbmZpZyAocHJvcG9z
YWwgbmFtZTogc2tpcF93cF9ncGlvKSBhbmQgSSB3aWxsIHNldCBpdCB0byB0cnVlIGluIG10ZGNv
cmUuYyB3aGVuIG52bWVuX2NvbmZpZyBzdHJ1Y3R1cmUgaXMgaW5pdGlhbGl6ZWQuIEl0IHdpbGwg
YmUgcGFydCBvZiB0aGUgVjIuCgpGaW5lIGJ5IG1lLiBUaGFua3MgZm9yIHlvdXIgd29yayBvbiB0
aGlzLgoKPiAKPiBSZWdhcmRzLAo+IENocmlzdG9waGUgS2VyZWxsby4KPiAKPiA+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgbnZtZW0tPndwX2dwaW8gPSBncGlvZF9nZXRfb3B0aW9uYWwoY29uZmlnLT5k
ZXYsICJ3cCIsCj4gPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBHUElPRF9PVVRfSElHSCk7ICAKPiA+IAo+ID4gLS1zcmluaQo+ID4g
ICAKCkNoZWVycywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
