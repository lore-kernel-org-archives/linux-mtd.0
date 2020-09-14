Return-Path: <SRS0=tjU8=CX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F0F0C43461
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2020 03:26:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE54C208E4
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2020 03:26:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="byzRuc4J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE54C208E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yjqh6LmznLgx/dJAvFocEdTC6aCP0wDxUQteGTddFBw=; b=byzRuc4JXeL5ZGgV3wDw40h01
	TwAlC40LFCcojHk/ttabKtH13WUa8te2uzWutxuHEuufvI2twHV0+YnEDs+L+VqdtSwixIyoqzhnV
	OLWYYFSS7libYRjFBUPSiAizspYVWvwsfqhj9KOqPgnDO/YSXd8bXkgQRYYa7YPiGL7SJQsPbwm8W
	Kdm2MbQ2Qy0etVwQiu/KiQCObSENjOGW2GbbfqoAqe311wZf1fiS/pR3YGhabpmhzbt/kgkQbqHfC
	UUfGEW5wzzDgNau+R16aC0HLKU5A/qkWj3GlO/xG3jHge0L5hoppY/jNEGUKPbrH2CxnpXmFZ05MM
	H8laHRn/A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHf7L-0007ZH-Al; Mon, 14 Sep 2020 03:25:23 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHf7D-0007Yd-3q
 for linux-mtd@lists.infradead.org; Mon, 14 Sep 2020 03:25:16 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 09D43150C717E0C64E0F;
 Mon, 14 Sep 2020 11:25:02 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.214) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.487.0;
 Mon, 14 Sep 2020 11:24:55 +0800
Subject: Re: [PATCH 1/2] ubifs: xattr: Fix some potential memory leaks while
 iterating entries
To: Richard Weinberger <richard.weinberger@gmail.com>
References: <20200601091037.3794172-1-chengzhihao1@huawei.com>
 <CAFLxGvxA9pw8D6Q8GbBD0SUP+EHhOsZmRMSPxrW4sq0gYi9N9Q@mail.gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <b82cd435-437d-e384-c95e-a7e031559c7e@huawei.com>
Date: Mon, 14 Sep 2020 11:24:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAFLxGvxA9pw8D6Q8GbBD0SUP+EHhOsZmRMSPxrW4sq0gYi9N9Q@mail.gmail.com>
X-Originating-IP: [10.174.179.214]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200913_232515_414065_DB76E9C2 
X-CRM114-Status: GOOD (  13.59  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>, "zhangyi \(F\)" <yi.zhang@huawei.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

5ZyoIDIwMjAvOS8xNCAzOjA4LCBSaWNoYXJkIFdlaW5iZXJnZXIg5YaZ6YGTOgo+IE9uIE1vbiwg
SnVuIDEsIDIwMjAgYXQgMTE6MTEgQU0gWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2Vp
LmNvbT4gd3JvdGU6Cj4+Cgo+IEkgYWdyZWUgdGhhdCB0aGlzIG5lZWRzIGZpeGluZy4gRGlkIHlv
dSBhbHNvIGxvb2sgaW50byBnZXR0aW5nIHJpZCBvZiBweGVudD8KPiBVQklGUyB1c2VzIHRoZSBw
eGVudCBwYXR0ZXJuIG92ZXIgYW5kIG92ZXIgYW5kIHRoZSBzYW1lIGVycm9yIGdvdCBjb3B5IHBh
c3RlZAo+IGEgbG90LiA6LSgKPiAKSSB0aG91Z2h0IGFib3V0IGl0LiBJJ20gbm90IHN1cmUgd2hl
dGhlciBpdCBpcyBnb29kIHRvIGRyb3AgJ3B4ZW50Jy4gCk1heWJlIHlvdSBtZWFuIGRvaW5nIGNo
YW5nZXMgbG9va3MgbGlrZSBmb2xsb3dpbmcoVGFrZXMgCnViaWZzX2pubF93cml0ZV9pbm9kZSgp
IGZvciBleGFtcGxlKToKCmRpZmYgLS1naXQgYS9mcy91Ymlmcy9qb3VybmFsLmMgYi9mcy91Ymlm
cy9qb3VybmFsLmMKaW5kZXggNGE1YjA2ZjhkODEyLi5mY2Q1YWMwNDdiMzQgMTAwNjQ0Ci0tLSBh
L2ZzL3ViaWZzL2pvdXJuYWwuYworKysgYi9mcy91Ymlmcy9qb3VybmFsLmMKQEAgLTg3OSwxMyAr
ODc5LDE5IEBAIGludCB1Ymlmc19qbmxfd3JpdGVfaW5vZGUoc3RydWN0IHViaWZzX2luZm8gKmMs
IApjb25zdCBzdHJ1Y3QgaW5vZGUgKmlub2RlKQogIAkJdW5pb24gdWJpZnNfa2V5IGtleTsKICAJ
CXN0cnVjdCBmc2NyeXB0X25hbWUgbm0gPSB7MH07CiAgCQlzdHJ1Y3QgaW5vZGUgKnhpbm87Ci0J
CXN0cnVjdCB1Ymlmc19kZW50X25vZGUgKnhlbnQsICpweGVudCA9IE5VTEw7CisJCXN0cnVjdCB1
Ymlmc19kZW50X25vZGUgKnhlbnQ7CgogIAkJaWYgKHVpLT54YXR0cl9jbnQgPj0gdWJpZnNfeGF0
dHJfbWF4X2NudChjKSkgewogIAkJCXViaWZzX2VycihjLCAiQ2Fubm90IGRlbGV0ZSBpbm9kZSwg
aXQgaGFzIHRvbyBtdWNoIHhhdHRycyEiKTsKICAJCQlnb3RvIG91dF9yZWxlYXNlOwogIAkJfQoK
KwkJZm5hbWVfbmFtZSgmbm0pID0ga21hbGxvYyhVQklGU19NQVhfTkxFTiwgR0ZQX05PRlMpOwor
CQlpZiAoIWZuYW1lX25hbWUoJm5tKSkgeworCQkJZXJyID0gLUVOT01FTTsKKwkJCWdvdG8gb3V0
X3JlbGVhc2U7CisJCX0KKwogIAkJbG93ZXN0X3hlbnRfa2V5KGMsICZrZXksIGlub2RlLT5pX2lu
byk7CiAgCQl3aGlsZSAoMSkgewogIAkJCXhlbnQgPSB1Ymlmc190bmNfbmV4dF9lbnQoYywgJmtl
eSwgJm5tKTsKQEAgLTg5NCwxMSArOTAwLDEyIEBAIGludCB1Ymlmc19qbmxfd3JpdGVfaW5vZGUo
c3RydWN0IHViaWZzX2luZm8gKmMsIApjb25zdCBzdHJ1Y3QgaW5vZGUgKmlub2RlKQogIAkJCQlp
ZiAoZXJyID09IC1FTk9FTlQpCiAgCQkJCQlicmVhazsKCisJCQkJa2ZyZWUoZm5hbWVfbmFtZSgm
bm0pKTsKICAJCQkJZ290byBvdXRfcmVsZWFzZTsKICAJCQl9CgotCQkJZm5hbWVfbmFtZSgmbm0p
ID0geGVudC0+bmFtZTsKICAJCQlmbmFtZV9sZW4oJm5tKSA9IGxlMTZfdG9fY3B1KHhlbnQtPm5s
ZW4pOworCQkJc3RybmNweShmbmFtZV9uYW1lKCZubSksIHhlbnQtPm5hbWUsIGZuYW1lX2xlbigm
bm0pKTsKCiAgCQkJeGlubyA9IHViaWZzX2lnZXQoYy0+dmZzX3NiLCBsZTY0X3RvX2NwdSh4ZW50
LT5pbnVtKSk7CiAgCQkJaWYgKElTX0VSUih4aW5vKSkgewpAQCAtOTA3LDYgKzkxNCw3IEBAIGlu
dCB1Ymlmc19qbmxfd3JpdGVfaW5vZGUoc3RydWN0IHViaWZzX2luZm8gKmMsIApjb25zdCBzdHJ1
Y3QgaW5vZGUgKmlub2RlKQogIAkJCQkJICB4ZW50LT5uYW1lLCBlcnIpOwogIAkJCQl1Ymlmc19y
b19tb2RlKGMsIGVycik7CiAgCQkJCWtmcmVlKHhlbnQpOworCQkJCWtmcmVlKGZuYW1lX25hbWUo
Jm5tKSk7CiAgCQkJCWdvdG8gb3V0X3JlbGVhc2U7CiAgCQkJfQogIAkJCXViaWZzX2Fzc2VydChj
LCB1Ymlmc19pbm9kZSh4aW5vKS0+eGF0dHIpOwpAQCAtOTE2LDExICs5MjQsMTAgQEAgaW50IHVi
aWZzX2pubF93cml0ZV9pbm9kZShzdHJ1Y3QgdWJpZnNfaW5mbyAqYywgCmNvbnN0IHN0cnVjdCBp
bm9kZSAqaW5vZGUpCiAgCQkJaW5vID0gKHZvaWQgKilpbm8gKyBVQklGU19JTk9fTk9ERV9TWjsK
ICAJCQlpcHV0KHhpbm8pOwoKLQkJCWtmcmVlKHB4ZW50KTsKLQkJCXB4ZW50ID0geGVudDsKICAJ
CQlrZXlfcmVhZChjLCAmeGVudC0+a2V5LCAma2V5KTsKKwkJCWtmcmVlKHhlbnQpOwogIAkJfQot
CQlrZnJlZShweGVudCk7CisJCWtmcmVlKGZuYW1lX25hbWUoJm5tKSk7CiAgCX0KCiAgCXBhY2tf
aW5vZGUoYywgaW5vLCBpbm9kZSwgMSk7CgpUaGUga2lsbF94YXR0cnMgcHJvY2VzcyBpcyBtb3Jl
IGludHVpdGl2ZSB3aXRob3V0IHRoZSBweGVudC4gSG93ZXZlciwgCnRoZSByZWxlYXNlIHByb2Nl
c3MgZm9yIHRoZSBtZW1vcnkgKHN0b3JlcyB4ZW50LT5uYW1lKSBpcyBzaW1pbGFyIHRvIAoncHhl
bnQnLiBJZiB5b3UgdGhpbmsgaXQncyBiZXR0ZXIgdGhhbiB2MSwgSSB3aWxsIHNlbmQgdjIuCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
