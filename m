Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D099C4829E
	for <linux-mtd@archiver.kernel.org>; Sun, 18 Feb 2024 11:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LKV7DG84oOfeVXD91Miq+ZSKwsqV0Sekz9kxhc8Ewh0=; b=Vvs5P6TGreT7DMXpF7iCnnmoK5
	BDCQsG0d+CgJLwa1pmBduGRFTKtrBHrnFhXO1OyZOfABKJIuJpF+n1JNGGZQlw5BfsZaar/jlQGTi
	4mFRpCLYNXZwwVgCo0t1Fw+z71CR/nMBaNT2E/sn8ppwY/nAyIXtcCPUbtAsBl0G3RdVw7fNWFYxy
	PZwh2wF2geN/ST1c9810J2wXRKOWTSGHlHcsqOHksZ7dB4Cdd/dVBtEuogY78ixDPIBy1M+MLdVrj
	PgJlJY9+i2+kgzKeJKQtVwKLvlsqikKfbqk8p/2F+qIiW2wKUmU41Fa2uGyRXxqmes2AgCbmGEAAe
	IvW7V34A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbfee-00000007e1T-0r1F;
	Sun, 18 Feb 2024 11:48:20 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbfeZ-00000007e0x-30bx
	for linux-mtd@lists.infradead.org;
	Sun, 18 Feb 2024 11:48:18 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Td3lb03Khz1gyrl;
	Sun, 18 Feb 2024 19:46:03 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 0F73E1A0172;
	Sun, 18 Feb 2024 19:48:09 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 18 Feb 2024 19:48:07 +0800
Subject: Re: [PATCH 5.4 058/194] mtd: Fix gluebi NULL pointer dereference
 caused by ftl notifier
To: Richard Weinberger <richard@nod.at>
CC: Martin Kepplinger-Novakovic <martink@posteo.de>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, stable <stable@vger.kernel.org>,
	<patches@lists.linux.dev>, ZhaoLong Wang <wangzhaolong1@huawei.com>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Sasha Levin <sashal@kernel.org>,
	linux-mtd <linux-mtd@lists.infradead.org>, Vignesh Raghavendra
	<vigneshr@ti.com>, dpervushin <dpervushin@embeddedalley.com>, Artem
 Bityutskiy <Artem.Bityutskiy@nokia.com>, linux-kernel
	<linux-kernel@vger.kernel.org>, yi zhang <yi.zhang@huawei.com>, yangerkun
	<yangerkun@huawei.com>, Henri Roosen <Henri.Roosen@ginzinger.com>, Melchior
 Franz <Melchior.Franz@ginzinger.com>
References: <20240122235719.206965081@linuxfoundation.org>
 <20240122235721.687806578@linuxfoundation.org>
 <fdfcc3b6e1a884bb986acf072bcc13611eae8bdd.camel@posteo.de>
 <a53aacd3-4270-2d80-f14c-8cfd763e4404@huawei.com>
 <1171523562.70108.1708251955853.JavaMail.zimbra@nod.at>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <912b7429-c294-418e-2082-ab269382f1f0@huawei.com>
Date: Sun, 18 Feb 2024 19:48:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1171523562.70108.1708251955853.JavaMail.zimbra@nod.at>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240218_034815_940739_6DF6D46C 
X-CRM114-Status: GOOD (  12.05  )
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

5ZyoIDIwMjQvMi8xOCAxODoyNSwgUmljaGFyZCBXZWluYmVyZ2VyIOWGmemBkzoKPiAtLS0tLSBV
cnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4+IFZvbjogImNoZW5nemhpaGFvMSIgPGNoZW5nemhp
aGFvMUBodWF3ZWkuY29tPgo+Pj4gSGkgR3JlZywgaGkgcGF0Y2gtZGV2ZWxvcGVycywKPj4+Cj4+
PiB3YWl0IGEgc2Vjb25kLiB0aGlzIGFscmVhZHkgd2VudCBpbnRvIHY1LjQuMjY4IGJ1dCBzdGls
bDogRG9lc24ndCB0aGlzCj4+PiBicmVhayB1c2Vyc3BhY2U/Cj4+Pgo+Pj4gQWNjb3JkaW5nIHRv
Cj4+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzQ0MTEwNzEwMC4yMzczNC4xNjk3OTA0
NTgwMjUyLkphdmFNYWlsLnppbWJyYUBub2QuYXQvCj4+PiB3aGVyZSB0aGlzIHNvbHV0aW9uIHNl
ZW1zIHRvIGNvbWUgZnJvbSwgdGhlIGJlaGF2aW91ciBjaGFuZ2VzOiAibm8KPj4+IG10ZGJsb2Nr
IChoZW5jZSwgYWxzbyBubyBGVExzKSBvbiB0b3Agb2YgZ2x1ZWJpLiIKPj4+Cj4+PiBJIGZlbGwg
YWNjcm9zcyB0aGlzIGJlY2F1c2Ugb2YgYW4gb3V0LW9mLXRyZWUgbW9kdWxlIHRoYXQgZG9lcwo+
Pj4gc3lzX21vdW50KCkgYW4gbXRkYmxvY2ssIHNvIEkgd29uJ3QgY29tcGxhaW4gYWJvdXQgbXkg
Y29kZSBzcGVjaWZpY2FsbHkKPj4+IDopIEJ1dCBkb2Vzbid0IGl0IGJyZWFrIG1vdW50aW5nLCBz
YXksIGpmZnMyIGluc2lkZSBhbiB1YmkgdmlhCj4+PiBtdGRibG9jaz8gSWYgc28sIGlzIHRoaXMg
cmVhbGx5IHNvbWV0aGluZyB0aGF0IHlvdSB3YW50IHRvIHNlZQo+Pj4gYmFja3BvcnRlZCB0byBv
bGQga2VybmVscz8KPj4+Cj4+PiBPciBkaWZmZXJlbnRseSBwdXQ6IEhhcyB0aGlzIHBhdGNoIGJl
ZW4gcGlja2VkIHVwIGZvciBvbGQgc3RhYmxlCj4+PiBrZXJuZWxzIGJ5IHNjcmlwdHMgb3IgYnkg
YSBodW1hbj8KPj4+Cj4+PiBJIGp1c3Qgd2FudCB0byBtYWtlIHN1cmUsIGFuZCB3aG8ga25vd3Ms
IGl0IG1pZ2h0IGhlbHAgb3RoZXJzIHRvbywgd2hvCj4+PiB3b3VsZCBqdXN0IGRvIGEgKHBvc3Np
Ymx5IGRhbmdlcm91cz8pIHJldmVydCBpbiB0aGVpciB0cmVlcy4KPj4+Cj4+Cj4+IFRoaXMgY2hh
bmdlIGRvZXMgYWZmZWN0IHRoZSBtb3VudGluZyhtdGRibG9jayBiYXNlZCBvbiBnbHVlYmkpIGJl
aGF2aW9yCj4+IGluIHVzZXJzcGFjZS4gSXQgd2FzIHBpY2tlZCBpbnRvIHN0YWJsZSB2ZXJzaW9u
cyBiZWNhdXNlIHRoZSBmaXhlZAo+PiBwcm9ibGVtIGlzIHNlcmlvdXMgYW5kIGVhc3kgdG8gYmUg
cmVwcm9kdWNlZCwgSSBndWVzcy4KPj4gQSB0ZW1wb3Jhcnkgc29sdXRpb24gaXMgdGhhdCBtb2Rp
ZnkgbW91bnRpbmcgc291cmNlIHRhcmdldCBpbiB1c2Vyc3BhY2UsCj4+IGp1c3QgcmVwbGFjZSBt
dGRibG9jayB3aXRoIG10ZCBjaGFyIGRldmljZS4gRm9yIGV4YW1wbGUsIG1vdW50IC10IGpmZnMy
Cj4+IG10ZDAgL21udAo+IAo+IEkgZG9uJ3QgdGhpbmsgdGhpcyBuZWVkcyBiYWNrcG9ydGluZyB0
byBzdGFibGUuIEl0J3Mgbm90IHNlcmlvdXMgYmVjYXVzZSB5b3UKPiBzdGlsbCBuZWVkIHRvIGJl
IHJvb3QgdG8gc2V0dXAgYW5kIHRyaWdnZXIgc3VjaCBhIHNjZW5hcmlvLgo+IAoKClllcy4gSSBm
ZWVsIG9rYXkgdG8gcmV2ZXJ0IHRoaXMgcGF0Y2ggb24gc3RhYmxlIHZlcnNpb25zLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
