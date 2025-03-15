Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 459DAC28B28
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Mar 2025 09:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O0SmOl+uoJAZeTPQARAZKh4rX3cZgdHJzaURokccyGk=; b=LiAKpiPlQwVVgTH3ucohblos8m
	jNkwtG2qEowfKtzV7GuHMpPaPDerrM9Znnr4YesMZ40rsCNpPIA/bpnbk2Brj7W9F2kSblsdlUbzl
	cv9cM4EsjHAmAphC+STz4/uTR0/aob0JYK5J3eQjLD1xALdJ0Prcam8qQgnaVVLapHP+7P3F63bBZ
	694nwr1VibrCbt4jwRS6jEuftlyVUlMSYfZxD0c3TzSWW7RS0IqeTcOi/9rQr//SLeea6pIueQIYp
	3i762ymC9orM111M9EjFK1VXI9Il6ldPiDWfg33jLxqgg+UzPhEU67069rb8dhQUbQvUA8yXjC1DO
	XGmr+lGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttNoN-0000000G8dB-1dmz;
	Sat, 15 Mar 2025 09:28:07 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttNnn-0000000G8Y9-2cPA
	for linux-mtd@lists.infradead.org;
	Sat, 15 Mar 2025 09:27:33 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4ZFG5R5vpQz2CchB;
	Sat, 15 Mar 2025 17:24:11 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id E805A1A016C;
	Sat, 15 Mar 2025 17:27:23 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 15 Mar 2025 17:27:23 +0800
Subject: Re: [v4 PATCH 10/13] ubifs: Use crypto_acomp interface
To: Herbert Xu <herbert@gondor.apana.org.au>
CC: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, Richard
 Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>,
	<linux-pm@vger.kernel.org>, Steffen Klassert <steffen.klassert@secunet.com>,
	<netdev@vger.kernel.org>
References: <cover.1741954523.git.herbert@gondor.apana.org.au>
 <349a78bc53d3620a29cc6105b55985db51aa0a11.1741954523.git.herbert@gondor.apana.org.au>
 <e5792e49-588d-8dee-0e3e-9e73e4bedebf@huawei.com>
 <Z9VCPB_pcT4ycYyt@gondor.apana.org.au>
 <dfa799fd-5ece-4ea4-d5d0-8c1da39a3a8d@huawei.com>
 <Z9VEkEOul9bt4bc1@gondor.apana.org.au>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <1b6176d7-31a8-7211-b648-a79bd25af6dc@huawei.com>
Date: Sat, 15 Mar 2025 17:27:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <Z9VEkEOul9bt4bc1@gondor.apana.org.au>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_022731_824680_0B9500BA 
X-CRM114-Status: GOOD (  15.38  )
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
Content-Type: text/plain; charset="gbk"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

1NogMjAyNS8zLzE1IDE3OjEyLCBIZXJiZXJ0IFh1INC0tcA6Cj4gT24gU2F0LCBNYXIgMTUsIDIw
MjUgYXQgMDU6MDg6NDdQTSArMDgwMCwgWmhpaGFvIENoZW5nIHdyb3RlOgo+Pgo+PiBBY2NvcmRp
bmcgdG8gdGhlIHdhcm5pbmcgbWVzc2FnZSwgY3VycmVudCBjb21wcmVzc29yIGlzIHpzdGQuIFRo
ZSBvdXRwdXQKPj4gYnVmZmVyIHNpemUgaXMgbGltaXRlZCBvbmx5IGZvciBMWk8gY29tcHJlc3Nv
ciBieSBbMV0uCj4gCj4gQW55IGFsZ29yaXRobSBjYW4gYW5kIHdpbGwgcHJvZHVjZSBvdXRwdXQg
bG9uZ2VyIHRoYW4gdGhlIGlucHV0LAo+IGlmIHlvdSBnaXZlIGl0IGVub3VnaCBvdXRwdXQgYnVm
ZmVyLgo+IAo+IFByZXZpb3VzbHkgYW4gb3V0cHV0IGJ1ZmZlciBsZW5ndGggb2YgMnggdGhlIGlu
cHV0IGxlbmd0aCB3YXMgZ2l2ZW4KPiB0byBhbGwgYWxnb3JpdGhtcywgbWVhbmluZyB0aGF0IHRo
ZXkgd291bGQgYWxsIHN1Y2NlZWQgbm8gbWF0dGVyCj4gd2hldGhlciB0aGUgaW5wdXQgY2FuIGJl
IGNvbXByZXNzZWQgb3Igbm90Lgo+IAo+IFRoaXMgaGFzIG5vdyBiZWVuIGNoYW5nZWQgc28gdGhh
dCBpbmNvbXByZXNzaWJsZSBkYXRhIGlzIG5vdAo+IG5lZWRsZXNzbHkgY29tcHJlc3NlZCBhbGwg
dGhlIHdheSB0byB0aGUgZW5kLiAgSW4gZmFjdCB3ZSBzaG91bGQKPiByZWR1Y2UgaXQgZnVydGhl
ciB0byBlbGltaW5hdGUgdGhlIFVCSUZTX01JTl9DT01QUkVTU19ESUZGIGNoZWNrLgoKQWgsIEkg
Z2V0IGl0LiBUaGFua3MgZm9yIHJlbWluZGluZywgYW5kIEkgdmVyaWZ5IHRoYXQgdGhlIHJvb3Qg
Y2F1c2UgaXMgCnRoZSBvdXRwdXQgYnVmZmVyIGJlY29tZXMgc21hbGxlci4KPiAKPiBJIHdpbGwg
cmVtb3ZlIHRoZSB3YXJuaW5nIG9uIGNvbXByZXNzaW9uIHNpbmNlIGZhaWx1cmVzIGFyZQo+IGV4
cGVjdGVkIGFuZCByZWR1Y2UgdGhlIG91dHB1dCBidWZmZXIgbGVuZ3RoIGZ1cnRoZXIgdG8gcmVt
b3ZlCj4gdGhlIHBvc3QtY29tcHJlc3Npb24gbGVuZ3RoIGNoZWNrLgo+IAoKSSB0aGluayB3ZSBz
aG91bGQga2VlcCB0aGUgd2FybmluZywgaXQgd291bGQgYmUgYmV0dGVyIHRvIGRpc3Rpbmd1aXNo
IAp0aGUgZGlmZmVyZW50IGVycm9yIHR5cGVzLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
