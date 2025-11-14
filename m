Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E82DDCE7A8C
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Nov 2025 08:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VV8lIQN0ziKeCg75p5uy+lHFvP14x/I+GwNdkprzYAE=; b=UBBCVjxDll5/gjiX6S+QeKcTZy
	qlQ4Z4QhJ4hRARxvNaXK7YOSuPblq3a+B4ejHt8h4eoMk1Bp19rRW7q89dLUz3xt2verdD9qKfncO
	aipE0eY++yQD6fheROhQOpoJIiCQ2laFF0jBjbWHsBRT0QxriVpsuMK3Ap8jGEPPOpLYe1ux2mYST
	efqYTHwVh5qe8FKIKnSwBVsaKz+Wp/AVVC5wlEbxBOlisI5in8bwKz7ffoM+1KlPNHoyZnDPQHV+F
	e3tXlVOacz+YWIr/c2w7+2XoV60jUnbZGYDYHhfiL0axGrfEfyjFJU/29eDIbQ0a/E3Bi9aAoMO8A
	nY5lbtJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJpZs-0000000BqKp-18P5;
	Fri, 14 Nov 2025 08:54:44 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJpZp-0000000BqHN-18kr
	for linux-mtd@lists.infradead.org;
	Fri, 14 Nov 2025 08:54:43 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=bBPkGn+HvYPbCOban3h93zpgCqbhQyunRNC/QZYHqBE=;
	b=ldE5qXSiaP6hjjr+Zd6BOYEydKy5gQDDUXgNKYXaHtls3vCIoTO1WP/lXBLw93cYBLt00sQ2A
	piRDgchjWBP8xKeYa68VuiPAubFHGIZRwdIL1q0PTumaFHNRskkSH+o04pp+VsO6PUoQiJ++Efy
	ss62NiSrZ+sieEkc0coVF2w=
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4d79rp5GY8z12LDL
	for <linux-mtd@lists.infradead.org>; Fri, 14 Nov 2025 16:52:58 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 252E9140136
	for <linux-mtd@lists.infradead.org>; Fri, 14 Nov 2025 16:54:29 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 14 Nov 2025 16:54:28 +0800
Subject: Re: [PATCH mtd-utils 2/2] fsck.ubifs: use the appropriate format
 specifiers for ino_t and loff_t
To: <linux-mtd@lists.infradead.org>
References: <9276ac09-7c7d-41df-9ee2-094f1c8edf93@lineo.co.jp>
 <285fc676-0f51-41fb-83c9-b95671af4ada@lineo.co.jp>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <5c3f7c59-a6e6-0bbd-3f18-b54c79f5d584@huawei.com>
Date: Fri, 14 Nov 2025 16:54:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <285fc676-0f51-41fb-83c9-b95671af4ada@lineo.co.jp>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_005441_776378_AAD064F1 
X-CRM114-Status: UNSURE (   8.16  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="gbk"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

1NogMjAyNS8xMS8xMyAxNjozMiwgWXV0YSBIYXlhbWEg0LS1wDoKPiBPbiBhcmNoaXRlY3R1cmVz
IHN1Y2ggYXMgYXJtdjctYSwgaW5vX3QgaXMgdW5zaWduZWQgbG9uZyBsb25nIHJhdGhlciB0aGFu
Cj4gdW5zaWduZWQgbG9uZy4gSW4gc3VjaCBjYXNlcywgdGhlIHByaW50ZiBmb3JtYXQgc3BlY2lm
aWVyICIlbHUiIGlzIG5vdAo+IGFwcHJvcHJpYXRlIGFuZCBjYXVzZXMgYW4gaW5jb3JyZWN0IGFk
ZHJlc3Mgb2Zmc2V0Lgo+IAo+ICAgIG10ZC11dGlscy91Ymlmcy11dGlscy9mc2NrLnViaWZzL3By
b2JsZW0uYzoyMjQKPiAgICAJCWxvZ19vdXQoYywgInByb2JsZW06ICVzLCBpbm8gJWx1LCB1bnJl
YWNoYWJsZSBkZW50cnkgJXMsIHR5cGUgJXMlcyIsCj4gICAgCQkJcHJvYmxlbS0+ZGVzYywgaWZw
LT5maWxlLT5pbnVtLAo+ICAgIAkJCWMtPmVuY3J5cHRlZCAmJiAhaWZwLT5maWxlLT5pbm8uaXNf
eGF0dHIgPyAiPGVuY3J5cHRlZD4iIDogZGVudF9ub2RlLT5uYW1lLAo+ICAgIAkJCXViaWZzX2dl
dF90eXBlX25hbWUoZGVudF9ub2RlLT50eXBlKSwKPiAgICAJCQlrZXlfdHlwZShjLCAmZGVudF9u
b2RlLT5rZXkpID09IFVCSUZTX1hFTlRfS0VZID8gIih4YXR0cikiIDogIiIpOwo+IAo+ICAgIGZz
Y2sudWJpZnNbNDg0XSAoL2Rldi91YmkwXzAsZGFuZ2VyIG1vZGUpOiBwcm9ibGVtOiBEZW50cnkg
aXMgdW5yZWFjaGFibGUsIGlubyA5MTcsIHVucmVhY2hhYmxlIGRlbnRyeSAobnVsbCksIHR5cGUg
Y2hlY2tzdW1fdHlwZWZpbGUKClRoZSB1YmlmcyBpbm9kZSBudW1iZXIgd29uJ3QgZXhjZWVkIDQg
Ynl0ZXMsIGFuZCB0aGUgYnl0ZXdpZHRoIG9mIAonaW5vX3QnIHZhcmllcyBvbiBkaWZmZXJlbnQg
bWFjaGluZXMuIEhvdyBhYm91dCBjaGFuZ2luZyBkZWJ1ZyBtZXNzYWdlIApsaWtlICclbHUsICh1
bnNpZ25lZCBsb25nKWludW0nPwo+IAo+IEZ1cnRoZXJtb3JlLCBydW5uaW5nIGZzY2sudWJpZnMg
d2l0aCB0aGUgLS1kZWJ1Zz00IG9wdGlvbiB3aWxsIGFsbW9zdAo+IGNlcnRhaW5seSBjYXVzZSBh
IFNFR1YgYXQgdGhlIGZvbGxvd2luZyBwb2ludC4KPiAKPiAgICBtdGQtdXRpbHMvdWJpZnMtdXRp
bHMvZnNjay51Ymlmcy9jaGVja19maWxlcy5jOjEwMwo+ICAgIAlkYmdfZnNjaygiY29uc3RydWN0
IGZpbGUoJWx1KSBmb3IgJXMgbm9kZSwgVE5DIGxvY2F0aW9uICVkOiVkLCBpbiAlcyIsCj4gICAg
CQkgaW51bSwgdWJpZnNfZ2V0X2tleV9uYW1lKGtleV90eXBlKGMsIGtleSkpLCBzbi0+bG51bSwg
c24tPm9mZnMsCj4gICAgCQkgYy0+ZGV2X25hbWUpOwo+IAo+IFRvIGVuc3VyZSBmdW5jdGlvbmFs
aXR5IHJlZ2FyZGxlc3Mgb2YgZW52aXJvbm1lbnQsIGNhc3QgaW5vX3QgdG8gdW5zaWduZWQKPiBs
b25nIGxvbmcgYW5kIG91dHB1dCB1c2luZyAiJWxsZCIuIEFwcGx5IHRoZSBzYW1lIGZpeCBmb3Ig
bG9mZl90Lgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
