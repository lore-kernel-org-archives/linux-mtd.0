Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AACDC87FDB
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Aug 2025 11:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m9unU6eeNsiIwWfM+dFpL2MDQ1RrzWvpkcctZkxePEY=; b=CMe1FJstZ8GaMuBO2YEtrPqi6Y
	rP2NkUOP3HDoNE0YSz1VHjpFrM9uCrf+PIqSysxWFFLNxTqpZMKdHRUcJ4De0GthUYyUtNIc52X90
	43JDVf2i8V6b2FXwC6DDhHyuS9/3x6yHRi1/fwjJBzJV09QjddBJMsxcUBftSVeQerBXb6RVdd8CZ
	OaPmt75k+UbM2ARwvXV+4YM1xN99rM8FpesRiRhkQLg+8VuMHA+2sbT4dzLa0WVU7ThAC9LvXK/XO
	ZetvFZNJoAzuYCTAA+nGNOin/JKK2w5bZ1VXZOs9H9FXtYZA9vkiAXCmcXPWkFHr7l0Vfy/0LIDjp
	au+1jX0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulQuc-00000007Ye5-3uQ8;
	Mon, 11 Aug 2025 11:41:58 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulQgH-00000007Vth-3A0e
	for linux-mtd@lists.infradead.org;
	Mon, 11 Aug 2025 11:27:11 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4c0sgS4cPXzdc8H;
	Mon, 11 Aug 2025 19:22:44 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 9B71E18007F;
	Mon, 11 Aug 2025 19:27:03 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 11 Aug 2025 19:27:02 +0800
Subject: Re: [PATCH] ubifs: Simplify the code and remove unnecessary
 parameters.
To: Xichao Zhao <zhao.xichao@vivo.com>, <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250811101529.436635-1-zhao.xichao@vivo.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <36b86ba2-504a-11b0-ec1b-3b39bd978251@huawei.com>
Date: Mon, 11 Aug 2025 19:27:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20250811101529.436635-1-zhao.xichao@vivo.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_042710_106776_223B14F3 
X-CRM114-Status: GOOD (  16.84  )
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

1NogMjAyNS84LzExIDE4OjE1LCBYaWNoYW8gWmhhbyDQtLXAOgo+IFJlbW92ZSB0aGUgcGFyYW1l
dGVyICcqYycgZnJvbSB0aGUgdWJpZnNfY3JjX25vZGUgZnVuY3Rpb24sCj4gYW5kIHJlcGxhY2Ug
cGFydCBvZiB0aGUgY29kZSB1c2luZyB1Ymlmc19jcmNfbm9kZS4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBYaWNoYW8gWmhhbyA8emhhby54aWNoYW9Adml2by5jb20+Cj4gLS0tCj4gICBmcy91Ymlmcy9p
by5jICAgIHwgMTMgKysrKy0tLS0tLS0tLQo+ICAgZnMvdWJpZnMvdWJpZnMuaCB8ICAyICstCj4g
ICAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCj4gCgpI
aSwgSSB0aGluayB0aGUgY29kZSBvZiBjcmMgY2FsY3VsYXRpb24gaW4gZml4X3NpemVfaW5fcGxh
Y2UoKSBjYW4gYmUgCnJlcGxhY2VkIHRvby4gSWYgbm90LCB3ZSBjb3VsZCBtYWtlIHViaWZzX2Ny
Y19ub2RlKCkgYmUgc3RhdGljLgoKPiBkaWZmIC0tZ2l0IGEvZnMvdWJpZnMvaW8uYyBiL2ZzL3Vi
aWZzL2lvLmMKPiBpbmRleCBhNzlmMjI5ZGY0NzUuLjZjNmQ2ODI0Mjc3OSAxMDA2NDQKPiAtLS0g
YS9mcy91Ymlmcy9pby5jCj4gKysrIGIvZnMvdWJpZnMvaW8uYwo+IEBAIC0zMjcsOCArMzI3LDYg
QEAgaW50IHViaWZzX2NoZWNrX25vZGUoY29uc3Qgc3RydWN0IHViaWZzX2luZm8gKmMsIGNvbnN0
IHZvaWQgKmJ1ZiwgaW50IGxlbiwKPiAgICAqLwo+ICAgdm9pZCB1Ymlmc19wYWQoY29uc3Qgc3Ry
dWN0IHViaWZzX2luZm8gKmMsIHZvaWQgKmJ1ZiwgaW50IHBhZCkKPiAgIHsKPiAtCXVpbnQzMl90
IGNyYzsKPiAtCj4gICAJdWJpZnNfYXNzZXJ0KGMsIHBhZCA+PSAwKTsKPiAgIAo+ICAgCWlmIChw
YWQgPj0gVUJJRlNfUEFEX05PREVfU1opIHsKPiBAQCAtMzQzLDggKzM0MSw3IEBAIHZvaWQgdWJp
ZnNfcGFkKGNvbnN0IHN0cnVjdCB1Ymlmc19pbmZvICpjLCB2b2lkICpidWYsIGludCBwYWQpCj4g
ICAJCWNoLT5sZW4gPSBjcHVfdG9fbGUzMihVQklGU19QQURfTk9ERV9TWik7Cj4gICAJCXBhZCAt
PSBVQklGU19QQURfTk9ERV9TWjsKPiAgIAkJcGFkX25vZGUtPnBhZF9sZW4gPSBjcHVfdG9fbGUz
MihwYWQpOwo+IC0JCWNyYyA9IGNyYzMyKFVCSUZTX0NSQzMyX0lOSVQsIGJ1ZiArIDgsIFVCSUZT
X1BBRF9OT0RFX1NaIC0gOCk7Cj4gLQkJY2gtPmNyYyA9IGNwdV90b19sZTMyKGNyYyk7Cj4gKwkJ
dWJpZnNfY3JjX25vZGUoYnVmLCBVQklGU19QQURfTk9ERV9TWik7Cj4gICAJCW1lbXNldChidWYg
KyBVQklGU19QQURfTk9ERV9TWiwgMCwgcGFkKTsKPiAgIAl9IGVsc2UgaWYgKHBhZCA+IDApCj4g
ICAJCS8qIFRvbyBsaXR0bGUgc3BhY2UsIHBhZGRpbmcgbm9kZSB3b24ndCBmaXQgKi8KPiBAQCAt
Mzk1LDcgKzM5Miw3IEBAIHZvaWQgdWJpZnNfaW5pdF9ub2RlKHN0cnVjdCB1Ymlmc19pbmZvICpj
LCB2b2lkICpub2RlLCBpbnQgbGVuLCBpbnQgcGFkKQo+ICAgCX0KPiAgIH0KPiAgIAo+IC12b2lk
IHViaWZzX2NyY19ub2RlKHN0cnVjdCB1Ymlmc19pbmZvICpjLCB2b2lkICpub2RlLCBpbnQgbGVu
KQo+ICt2b2lkIHViaWZzX2NyY19ub2RlKHZvaWQgKm5vZGUsIGludCBsZW4pCj4gICB7Cj4gICAJ
c3RydWN0IHViaWZzX2NoICpjaCA9IG5vZGU7Cj4gICAJdWludDMyX3QgY3JjOwo+IEBAIC00MzIs
NyArNDI5LDcgQEAgaW50IHViaWZzX3ByZXBhcmVfbm9kZV9obWFjKHN0cnVjdCB1Ymlmc19pbmZv
ICpjLCB2b2lkICpub2RlLCBpbnQgbGVuLAo+ICAgCQkJcmV0dXJuIGVycjsKPiAgIAl9Cj4gICAK
PiAtCXViaWZzX2NyY19ub2RlKGMsIG5vZGUsIGxlbik7Cj4gKwl1Ymlmc19jcmNfbm9kZShub2Rl
LCBsZW4pOwo+ICAgCj4gICAJcmV0dXJuIDA7Cj4gICB9Cj4gQEAgLTQ2OSw3ICs0NjYsNiBAQCB2
b2lkIHViaWZzX3ByZXBhcmVfbm9kZShzdHJ1Y3QgdWJpZnNfaW5mbyAqYywgdm9pZCAqbm9kZSwg
aW50IGxlbiwgaW50IHBhZCkKPiAgICAqLwo+ICAgdm9pZCB1Ymlmc19wcmVwX2dycF9ub2RlKHN0
cnVjdCB1Ymlmc19pbmZvICpjLCB2b2lkICpub2RlLCBpbnQgbGVuLCBpbnQgbGFzdCkKPiAgIHsK
PiAtCXVpbnQzMl90IGNyYzsKPiAgIAlzdHJ1Y3QgdWJpZnNfY2ggKmNoID0gbm9kZTsKPiAgIAl1
bnNpZ25lZCBsb25nIGxvbmcgc3FudW0gPSBuZXh0X3NxbnVtKGMpOwo+ICAgCj4gQEAgLTQ4Myw4
ICs0NzksNyBAQCB2b2lkIHViaWZzX3ByZXBfZ3JwX25vZGUoc3RydWN0IHViaWZzX2luZm8gKmMs
IHZvaWQgKm5vZGUsIGludCBsZW4sIGludCBsYXN0KQo+ICAgCQljaC0+Z3JvdXBfdHlwZSA9IFVC
SUZTX0lOX05PREVfR1JPVVA7Cj4gICAJY2gtPnNxbnVtID0gY3B1X3RvX2xlNjQoc3FudW0pOwo+
ICAgCWNoLT5wYWRkaW5nWzBdID0gY2gtPnBhZGRpbmdbMV0gPSAwOwo+IC0JY3JjID0gY3JjMzIo
VUJJRlNfQ1JDMzJfSU5JVCwgbm9kZSArIDgsIGxlbiAtIDgpOwo+IC0JY2gtPmNyYyA9IGNwdV90
b19sZTMyKGNyYyk7Cj4gKwl1Ymlmc19jcmNfbm9kZShub2RlLCBsZW4pOwo+ICAgfQo+ICAgCj4g
ICAvKioKPiBkaWZmIC0tZ2l0IGEvZnMvdWJpZnMvdWJpZnMuaCBiL2ZzL3ViaWZzL3ViaWZzLmgK
PiBpbmRleCA1ZGI0NWM5ZTI2ZWUuLjVkMTcyNTA5MDkxYSAxMDA2NDQKPiAtLS0gYS9mcy91Ymlm
cy91Ymlmcy5oCj4gKysrIGIvZnMvdWJpZnMvdWJpZnMuaAo+IEBAIC0xNzQzLDcgKzE3NDMsNyBA
QCBpbnQgdWJpZnNfd3JpdGVfbm9kZV9obWFjKHN0cnVjdCB1Ymlmc19pbmZvICpjLCB2b2lkICpi
dWYsIGludCBsZW4sIGludCBsbnVtLAo+ICAgaW50IHViaWZzX2NoZWNrX25vZGUoY29uc3Qgc3Ry
dWN0IHViaWZzX2luZm8gKmMsIGNvbnN0IHZvaWQgKmJ1ZiwgaW50IGxlbiwKPiAgIAkJICAgICBp
bnQgbG51bSwgaW50IG9mZnMsIGludCBxdWlldCwgaW50IG11c3RfY2hrX2NyYyk7Cj4gICB2b2lk
IHViaWZzX2luaXRfbm9kZShzdHJ1Y3QgdWJpZnNfaW5mbyAqYywgdm9pZCAqYnVmLCBpbnQgbGVu
LCBpbnQgcGFkKTsKPiAtdm9pZCB1Ymlmc19jcmNfbm9kZShzdHJ1Y3QgdWJpZnNfaW5mbyAqYywg
dm9pZCAqYnVmLCBpbnQgbGVuKTsKPiArdm9pZCB1Ymlmc19jcmNfbm9kZSh2b2lkICpidWYsIGlu
dCBsZW4pOwo+ICAgdm9pZCB1Ymlmc19wcmVwYXJlX25vZGUoc3RydWN0IHViaWZzX2luZm8gKmMs
IHZvaWQgKmJ1ZiwgaW50IGxlbiwgaW50IHBhZCk7Cj4gICBpbnQgdWJpZnNfcHJlcGFyZV9ub2Rl
X2htYWMoc3RydWN0IHViaWZzX2luZm8gKmMsIHZvaWQgKm5vZGUsIGludCBsZW4sCj4gICAJCQkg
ICAgaW50IGhtYWNfb2ZmcywgaW50IHBhZCk7Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
