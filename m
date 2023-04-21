Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86BB1C77B76
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Apr 2023 21:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=VJTKu0wfX61kDtX1+tuMQ1c1DQklSbIRDeV2/RR29+g=; b=K2LAjXBywq7BsG9jGHF2+pF+Ex
	6hzxDx3v9ZWAdvocTucefd8R1ZXBlfn0qSia/aLhTHkdvoa1Zogj7nwfCGpDN96IKfahby/8ru56B
	veSlHNt3H7tCPQzDo0nPvNEOu/APH4OiTyB43JQji9tAuC8dacbD3EVraxQ4YAzNEn5CIc2Tk8evL
	qqZh9P+PERMUfaheh4OE0Sjzujo5ZNXtdI7RXValjwOjwLmkHl4rgcaFfmSNQRM185fV8k868+/nl
	dWDqs0ypt/feqHrkN5e0MerxhJAQSUW5aUtYmrGInD9t5Rupdqv1pAL8438No08MnmbmziCznv8/r
	YCcsQG6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppy9J-00Brmz-2V;
	Fri, 21 Apr 2023 21:18:33 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppy9G-00Brlf-2c
	for linux-mtd@lists.infradead.org;
	Fri, 21 Apr 2023 21:18:32 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 7B69B63CC16F;
	Fri, 21 Apr 2023 23:18:16 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id SnRLdqdW0iV1; Fri, 21 Apr 2023 23:18:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 17D266418F2B;
	Fri, 21 Apr 2023 23:18:16 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id auZ6_yP3xkVD; Fri, 21 Apr 2023 23:18:16 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id EC79563CC16F;
	Fri, 21 Apr 2023 23:18:15 +0200 (CEST)
Date: Fri, 21 Apr 2023 23:18:15 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: ZhaoLong Wang <wangzhaolong1@huawei.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	chengzhihao1 <chengzhihao1@huawei.com>, 
	yi zhang <yi.zhang@huawei.com>
Message-ID: <1751647898.236371.1682111895850.JavaMail.zimbra@nod.at>
In-Reply-To: <20230318015621.1408243-1-wangzhaolong1@huawei.com>
References: <20230318015621.1408243-1-wangzhaolong1@huawei.com>
Subject: Re: [PATCH 0/5] ubi: Enhanced fault injection capability for the
 UBI driver
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: Enhanced fault injection capability for the UBI driver
Thread-Index: zOuMq5RgU5mOajBYreOdiSG1qqplFg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_141831_022764_109BC949 
X-CRM114-Status: UNSURE (   9.88  )
X-CRM114-Notice: Please train this message.
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIlpoYW9Mb25nIFdhbmciIDx3
YW5nemhhb2xvbmcxQGh1YXdlaS5jb20+Cj4gVGhlIGV4aXN0aW5nIGZhdWx0IGluamVjdGlvbiBj
YXBhYmlsaXR5IG9mIFVCSSBpcyB0b28gc2ltcGxlLgo+IEl0IHVzZXMgaGFyZC1jb2RlZCBmYXVs
dCBwcm9iYWJpbGl0eSB2YWx1ZXMgYW5kIGxhY2tzIG90aGVyCj4gY29uZmlndXJhYmxlIG9wdGlv
bnMuIEFzIGEgcmVzdWx0LCB0aGVzZSBpbnRlcmZhY2VzIGFyZSBkaWZmaWN1bHQKPiB0byB1c2Ug
d2hlbiBkaWdnaW5nIGRlZmVjdHMgaW4gdGhlIGFibm9ybWFsIHBhdGggb2YgY29kZSBhbmQKPiBy
ZXByb2R1Y2luZyBzb21lIHByb2JsZW1zLgo+IAo+IFRoZSBrZXJuZWwgcHJvdmlkZXMgYSBwb3dl
cmZ1bCBmYXVsdCBpbmplY3Rpb24gZnJhbWV3b3JrLCB3aGljaAo+IHByb3ZpZGVzIHJpY2ggY29u
ZmlndXJhYmxlIGZhdWx0IGluamVjdGlvbiBhdHRyaWJ1dGVzIGR1cmluZyBydW50aW1lLgo+IFNv
IGl0IGNhbiBiZSB1c2VkIHRvIGltcHJvdmUgdGhlIGZhdWx0IGluamVjdGlvbiBjYXBhYmlsaXR5
IG9mIHRoZQo+IFVCSSBkcml2ZXIuCj4gCj4gVGhpcyBzZXJpZXMgb2YgcGF0Y2hlcyByZWZhY3Rv
ciB0aGUgZXhpc3RpbmcgZmF1bHQgaW5qZWN0aW9uIGludGVyZmFjZQo+IGFuZCBhZGQgc29tZSBm
YXVsdCBpbmplY3Rpb24gdHlwZXMgdG8gaGVscCB0ZXN0ZXJzIGFuZCBkZXZlbG9wZXJzCj4gZmlu
ZCBwb3RlbnRpYWwgcHJvYmxlbXMgaW4gdGhlIGNvZGUuCgpJbiBnZW5lcmFsIEkgbGlrZSBoYXZp
bmcgc29tZSBuZXcgYW5kIGFkdmFuY2VkIHdheSB0byB0ZXN0IFVCSS4KQnV0IHlvdXIgcGF0Y2hl
cyBzZWVtIHRvIHJlbW92ZSB0aGUgb2xkIGludGVyZmFjZSBmcm9tIGRlYnVnZnMsCnRoaXMgd2ls
bCBjYXVzZSBicmVha2FnZSBvZiBleGlzdGluZyB0ZXN0IHNjcmlwdHMuCgpTbyBwbGVhc2Uga2Vl
cCB0aGUgb2xkIGludGVyZmFjZSB0b28uCgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
