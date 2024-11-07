Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C50D4334B
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Nov 2024 11:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=nM+FCtlT4BEUWai4Ezsh7K/pPwog96HBPlcGjs2nQLU=; b=vVAd/CRn35uloW4QAao9UP9GrP
	zJS3MasUAL7wDQtrJcCcuX1T3ID8KBIPxdG0A/JvSwPyOFK+WgnNpxz5y1sRdbbsZc+zVXbY+HPPS
	oJ/KDKlmYxtW+g4pFwtN8f2eW4hmEjltc6dKNa4i/hF64O8tmjMoEJK1+BEPWDByPMXGaHeqskITR
	euNCziaU7OPS7wYvW8JhbJ6XN/pjmoJtjHWyEOeqYmkuZAgeuXXh+Z3okZQbQZBaRuASlKh54Yj6L
	RN60yn6HDaAGFUdE+RO7Ci7RM6SKbWYdecuh+WN+BnvEGiOgM8pi8kEMtjqz2U46YmyO8I/0gjLaZ
	GFR0VoQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t90m3-00000006kcN-1Z3M;
	Thu, 07 Nov 2024 11:34:03 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t90k4-00000006k3Z-1FBb
	for linux-mtd@lists.infradead.org;
	Thu, 07 Nov 2024 11:32:02 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 4B4F32A87F6;
	Thu,  7 Nov 2024 12:31:57 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 0cO-LgOO_zeT; Thu,  7 Nov 2024 12:31:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 6ADDF2A8802;
	Thu,  7 Nov 2024 12:31:56 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id en-DhaWUOr6R; Thu,  7 Nov 2024 12:31:56 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 3419E2A87F6;
	Thu,  7 Nov 2024 12:31:56 +0100 (CET)
Date: Thu, 7 Nov 2024 12:31:56 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Rickard x Andersson <rickaran@axis.com>
Cc: Rickard X Andersson <rickard.andersson@axis.com>, 
	chengzhihao1 <chengzhihao1@huawei.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	rickard314 andersson <rickard314.andersson@gmail.com>, 
	kernel <kernel@axis.com>
Message-ID: <1446825408.208073.1730979115998.JavaMail.zimbra@nod.at>
In-Reply-To: <d8891124-1391-5642-bfd6-3bfd4f636e2c@axis.com>
References: <20241011125904.2915983-1-rickard.andersson@axis.com> <20241011125904.2915983-2-rickard.andersson@axis.com> <2095423248.201132.1730924426363.JavaMail.zimbra@nod.at> <d8891124-1391-5642-bfd6-3bfd4f636e2c@axis.com>
Subject: Re: [PATCH v3 02/10] ubi: Expose mean erase counter for fastmap in
 sysfs
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF132 (Linux)/8.8.12_GA_3809)
Thread-Topic: Expose mean erase counter for fastmap in sysfs
Thread-Index: 1Nf+AppmOyfEsYpWGr9w6UwdpzmQQA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_033200_512208_F6FB2B42 
X-CRM114-Status: GOOD (  10.34  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIlJpY2thcmQgeCBBbmRlcnNz
b24iIDxyaWNrYXJhbkBheGlzLmNvbT4KPiBBbjogInJpY2hhcmQiIDxyaWNoYXJkQG5vZC5hdD4s
ICJSaWNrYXJkIFggQW5kZXJzc29uIiA8cmlja2FyZC5hbmRlcnNzb25AYXhpcy5jb20+Cj4gT25l
IG9mIG15IGRldmljZXMgaGF2ZSB0aGUgZm9sbG93aW5nIHN0YXR1czoKPiAKPiAvc3lzL2NsYXNz
L3ViaS91YmkxICMgY2F0IG1heF9lY19kYXRhCj4gNDY3Mgo+IC9zeXMvY2xhc3MvdWJpL3ViaTEg
IyBjYXQgbWVhbl9lY19mYXN0bWFwCj4gODg2OQo+IAo+IElmIHlvdSBjb21iaW5lIHRoZSBtZWFu
IEVDIHZhbHVlcyB5b3Ugd2lsbCBub3QgYmUgYWJsZSB0byB0ZWxsIHRoYXQgdGhlCj4gZmFzdG1h
cCBhcmVhIGlzIG11Y2ggbW9yZSB3b3JuIGRvd24uIEZvciBleGFtcGxlIHRoZSB3ZWFyIG9mIHlv
dXIKPiBmYXN0bWFwIGFyZWEgY291bGQgYmUgb24gdGhlIHZlcmdlIG9mIGJyZWFraW5nIHRoZSBm
bGFzaCBidXQgdGhhdCB3aWxsCj4gbm90IGJlIHNlZW4gb24gYSBtZWFuIHZhbHVlIHRoYXQgaW5j
bHVkZXMgYm90aCB0aGUgZmFzdG1hcCBhbmQgZGF0YSBhcmVhLgo+IAo+IElmIGZhc3RtYXAgaXMg
bm90IGVuYWJsZWQgb24geW91ciBzeXN0ZW0gdGhlbiBtZWFuX2VjX2Zhc3RtYXAgd2lsbCBub3QK
PiBiZSB2aXNpYmxlIGluIHN5c2ZzLgoKQnV0IGRvZXMgdGhlIHVzZXIgYXBwbGljYXRpb24gY2Fy
ZT8KTGV0IG1lIGFzayBkaWZmZXJlbnRseSwgd2hhdCBpcyB0aGUgcHVycG9zZSBvZiBleHBvc2lu
ZyB0aGVzZSBudW1iZXJzPwpJZiB5b3UganVzdCB3YW50IHRvIGtub3cgaG93IG11Y2ggeW91ciBm
bGFzaCBpcyBhZ2VkLCBjb21iaW5lZCBtYXgvbWVhbgplYyBjb3VudGVycyB3aWxsIGRvIGl0LgoK
Rm9yIGRlYnVnZ2luZyBmYXN0bWFwIHNwZWNpZmljIGlzc3VlcywgdGhlIGRldGFpbGVkIGluZm8g
dmlhIGRlYnVnZnMgd2lsbCBkbyBpdC4KCkknbSB0b3RhbGx5IGZpbmUgd2l0aCBleHBvc2luZyBt
b3JlIGNvdW50ZXJzLCB3ZSBqdXN0IG5lZWQgdG8gYmUgY2xlYXIKYWJvdXQgdGhlaXIgbWVhbmlu
ZyBhbmQgdXNlIGNhc2UuIEVzcGVjaWFsbHkgaW4gc3lzZnMgd2UgbXVzdCBub3QgbWFrZSBhIG1l
c3MuCgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
