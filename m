Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B784ECD6F7
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Feb 2026 01:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MSCsqT8bO5oRVY4rbR2pkQA3/9wmQJSkoofHZgFO3cQ=; b=dZUVvjHNBxynw+1JUQLCSsEbRY
	I+BeBbCMUKocO5A7YjrVQPwAcI1/hsdrX3wS68X7BzCyT0XawwH65JUdjle7lgfs5nSc7/uDWfEjb
	ew9ypJsBc8slzaODeqkE0FHySgc8H1GNlOHJ9bxMVEYD+oVSSvqu+IUg8yU3DA1t6BrEwG8ii3QOK
	zcDPzfFBUrSeLiGQghEBWjFVl2N/H6Z7GAWH0fsF7GVHzj1J/Yg8EpBGhoZETbm7wxoxuMqwup5/N
	u00nrN8GcAsuTnU0UXMQz6NYqWgaxGiD1aFtCGMKAO9CjUdJO2a1AEyuOaVFsmwJCTn5kN4KCpesJ
	fSLqAunQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqLN2-00000001GYg-3pY5;
	Thu, 12 Feb 2026 01:19:52 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqLMz-00000001GYJ-2z4B
	for linux-mtd@lists.infradead.org;
	Thu, 12 Feb 2026 01:19:51 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=wWmq7IP4177wpPecsCUzQDX/2ZEtX+wzwidR9CeA2uQ=;
	b=SigTDvu+TdjZQYyZTxEqH031ULDFuV+m2X4EY3VXTErm5nYSwNxsxVWoab3bQ8JEk29FBlXjK
	r0RVfHNwZFIcCdkQNoXX896DpW6Z/lUOBkD8QDj4nrN3pMwVSmmRLS22EVZgqTprgd6ScaPbKxA
	3DCvZaKeN1gmA52VVmP3XsY=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4fBHQk2gsXz12LDD;
	Thu, 12 Feb 2026 09:14:54 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 9973E40561;
	Thu, 12 Feb 2026 09:19:42 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 12 Feb 2026 09:19:42 +0800
Subject: Re: [BUG] UBIFS corruption on powerpc 32-bit targets
To: Tomas Alvarez Vanoli <tomas.alvarez-vanoli@hitachienergy.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <DB9PR06MB784979B96C388174F81F9103C29EA@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <b93ff0e5-79ad-ff73-bdb3-e7e7d5c35256@huawei.com>
 <DB9PR06MB78498340513D9788FC7576FDC298A@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <d0eb0572-e383-466e-7b4f-97e4a853b7c5@huawei.com>
 <DB9PR06MB7849BCA2FA49A7AEE3D03104C299A@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <2e8dee20-842e-e946-87a0-9ff0190600ab@huawei.com>
 <DB9PR06MB7849E51C72D54F8109C55714C266A@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <581cbf94-a48b-3670-27bf-3ecca07ddcb8@huawei.com>
 <DB9PR06MB78496EADCD11536AA66C22CFC265A@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <8f65d531-b752-b058-4163-09a66fd9a7a1@huawei.com>
 <DB9PR06MB78496CB06BF8E60582CF40F7C262A@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <abfe8c37-11ea-a76d-5aea-014b39fcdf2e@huawei.com>
 <d5c8fe2d-2b78-3459-d176-da15ae24d1ab@huawei.com>
 <DB9PR06MB7849403569974A214C101D77C263A@DB9PR06MB7849.eurprd06.prod.outlook.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <01bac338-856c-599d-85d5-ed6485707310@huawei.com>
Date: Thu, 12 Feb 2026 09:19:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <DB9PR06MB7849403569974A214C101D77C263A@DB9PR06MB7849.eurprd06.prod.outlook.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_171949_924197_2615947A 
X-CRM114-Status: GOOD (  12.19  )
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

1NogMjAyNi8yLzEyIDA6NTEsIFRvbWFzIEFsdmFyZXogVmFub2xpINC0tcA6Cj4+IFdoYXQgZG9l
cyAnYXBwbGljYXRpb24nIG1lYW4/Cj4gSSBtZWFudCBqdXN0IGNvbXBsZXRlbHkgY2hhbmdpbmcg
dGhlIGtlcm5lbCBhbmQgcm9vdGZzIHRoYXQgaXMgdGhlcmUgYXMgYSBiYWNrdXAKPiBpbWFnZSBh
bmQgdXNpbmcgYSBtb3JlIHJlY2VudCBrZXJuZWwuCj4gWWVzLCBpdCB3aWxsIHByZXZlbnQgdGhl
IHByb2JsZW0gdG9vLgo+Pgo+PiBBcHBseSBmb2xsb3dpbmcgcGF0Y2ggaW4gNi4xMjoKPj4gWy4u
Ll0KPiAKPiBVbmZvcnR1bmF0ZWx5IG9uIG15IHN5c3RlbSB0aGlzIGp1c3QgZ2V0cyBzdHVjaywg
YmVjYXVzZSB0aGUgb25seSB3YXkKPiB3cml0ZV9vcnBoX25vZGUgZ2V0cyBjYWxsZWQgaXMgdGhy
b3VnaCBkb19jb21taXQgY2FsbGluZwo+IHViaWZzX29ycGhhbl9lbmRfY29tbWl0LCBidXQgdGhh
dCBwYXRoIGlzIG5ldmVyIGV4ZWN1dGVkIChleGNlcHQgd2hlbiBtb3VudGluZykuCj4gCj4gSSB0
cmllZCBtb3VudGluZyB3aXRoIGFuZCB3aXRob3V0IHN5bmMsIHNhbWUgcmVzdWx0cy4KPiAKClRo
ZSAnc3luYycgc3lzY2FsbCB3aWxsIGNhbGwgdWJpZnNfb3JwaGFuX2VuZF9jb21taXQgaWYgdGhl
IG9yaHBhbiBsaXN0IAppcyBub3QgZW1wdHkuCnViaWZzX3N5bmNfZnMgLT4gdWJpZnNfcnVuX2Nv
bW1pdCAtPiBkb19jb21taXQgLT4gdWJpZnNfb3JwaGFuX2VuZF9jb21taXQKCkluIHViaWZzX2Ny
ZWF0ZSwgdGhlIG5ldyBpbm9kZSB3aWxsIGJlIGFkZGVkIGludG8gb3JwaGFuIGxpc3QuCnViaWZz
X2NyZWF0ZSAtPiB1Ymlmc19uZXdfaW5vZGUgLT4gdWJpZnNfYWRkX29ycGhhbgoKWW91IGNhbiBh
ZGQgc29tZSBkZWJ1ZyBtZXNzYWdlcyB0byBjaGVjayB3aGljaCBjb25kaXRpb24gaXMgYnJva2Vu
Lgo+IEJlc3QgUmVnYXJkcywKPiBUb21hcwo+IC4KPiAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
