Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90CA9C4332F
	for <linux-mtd@archiver.kernel.org>; Sat, 12 Nov 2022 09:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I7oB8L9HuutZapuOYBdfMuSb7NHS8wewJ6w+NdX3v3I=; b=20QEFxUMGa441+UZl9LLDCxyLT
	ZyISEe42itoD8aFdwjVNCkcCHdAXXS0+d982qk9BYFRy0t+KwenIYSIKAQT9PIzQ3k+9pwvGhCFx2
	IssDWJa5beD7dn71ImH1e4jTLZEYtsQV6+VkmTNhS7Mk9NwpfvMyndOj/zpexi4PYsuvU9i+WPJQX
	ZiifKSRGTdBIsUMicfRvuUibM3wDoCO1OOmPXVtV7wpoOzxasIn0NlV+9XaXH6eEEW8cD5WUULd3I
	kV8wFil4UTBpSTCS1cR7YQ6f/9GjY/d8Aqkw1fEbtQTiTGSX+KPqO7kxiJKuQNInU5ip7hXMAtxhH
	qcKTi6qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otmaX-004YEt-AM; Sat, 12 Nov 2022 09:14:09 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otmaU-004YAi-M1
	for linux-mtd@lists.infradead.org; Sat, 12 Nov 2022 09:14:08 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4N8VCN67wSzbnb7;
	Sat, 12 Nov 2022 17:10:08 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 12 Nov 2022 17:13:52 +0800
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 12 Nov 2022 17:13:51 +0800
Subject: Re: [PATCH v2] mtd: ubi: fix possible null-ptr-deref in
 ubi_free_volume()
To: Yang Yingliang <yangyingliang@huawei.com>, <linux-mtd@lists.infradead.org>
CC: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>
References: <20221112041443.2930237-1-yangyingliang@huawei.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <d448c3c3-a4a3-89f0-782c-2539d71f5b69@huawei.com>
Date: Sat, 12 Nov 2022 17:13:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20221112041443.2930237-1-yangyingliang@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221112_011406_943068_28EF844D 
X-CRM114-Status: GOOD (  12.36  )
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

1NogMjAyMi8xMS8xMiAxMjoxNCwgWWFuZyBZaW5nbGlhbmcg0LS1wDoKClsuLi5dCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbXRkL3ViaS92bXQuYyBiL2RyaXZlcnMvbXRkL3ViaS92bXQuYwo+IGlu
ZGV4IDhmY2MwYmRmMDYzNS4uNWI3YWQxYzI2NmNiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRk
L3ViaS92bXQuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL3ViaS92bXQuYwo+IEBAIC02MTQsOCArNjE0
LDE0IEBAIHZvaWQgdWJpX2ZyZWVfdm9sdW1lKHN0cnVjdCB1YmlfZGV2aWNlICp1YmksIHN0cnVj
dCB1Ymlfdm9sdW1lICp2b2wpCj4gICAJZGJnX2dlbigiZnJlZSB2b2x1bWUgJWQiLCB2b2wtPnZv
bF9pZCk7Cj4gICAKPiAgIAl1YmktPnZvbHVtZXNbdm9sLT52b2xfaWRdID0gTlVMTDsKPiAtCWNk
ZXZfZGVsKCZ2b2wtPmNkZXYpOwo+IC0JZGV2aWNlX3VucmVnaXN0ZXIoJnZvbC0+ZGV2KTsKPiAr
CWlmIChkZXZpY2VfaXNfcmVnaXN0ZXJlZCgmdm9sLT5kZXYpKSB7Cj4gKwkJY2Rldl9kZWwoJnZv
bC0+Y2Rldik7Cj4gKwkJZGV2aWNlX3VucmVnaXN0ZXIoJnZvbC0+ZGV2KTsKPiArCX0gZWxzZSBp
ZiAodm9sLT5kZXYua29iai5zdGF0ZV9pbml0aWFsaXplZCkgewo+ICsJCXB1dF9kZXZpY2UoJnZv
bC0+ZGV2KTsKPiArCX0gZWxzZSB7Cj4gKwkJdm9sX3JlbGVhc2UoJnZvbC0+ZGV2KTsKPiArCX0K
PiAgIH0KPiAgIAo+ICAgLyoqCj4gCgpIb3cgYWJvdXQgdGhpcz8gSGFuZGxlIGFkZGluZyBmYWls
ZWQgdm9sdW1lIGluIHViaV9hZGRfdm9sdW1lKCksIGZyZWUgCm90aGVyIGFkZGVkIHZvbHVtZXMg
Ynkga2lsbF92b2x1bWVzKCkuCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC91Ymkvdm10LmMgYi9k
cml2ZXJzL210ZC91Ymkvdm10LmMKaW5kZXggOGZjYzBiZGYwNjM1Li45YzBiNWY1OTg4ZDUgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL3ViaS92bXQuYworKysgYi9kcml2ZXJzL210ZC91Ymkvdm10
LmMKQEAgLTU4MCw3ICs1ODAsOSBAQCBpbnQgdWJpX2FkZF92b2x1bWUoc3RydWN0IHViaV9kZXZp
Y2UgKnViaSwgc3RydWN0IAp1Ymlfdm9sdW1lICp2b2wpCiAgICAgICAgIGlmIChlcnIpIHsKICAg
ICAgICAgICAgICAgICB1YmlfZXJyKHViaSwgImNhbm5vdCBhZGQgY2hhcmFjdGVyIGRldmljZSBm
b3Igdm9sdW1lIAolZCwgZXJyb3IgJWQiLAogICAgICAgICAgICAgICAgICAgICAgICAgdm9sX2lk
LCBlcnIpOwotICAgICAgICAgICAgICAgcmV0dXJuIGVycjsKKyAgICAgICAgICAgICAgIHViaS0+
dm9sdW1lc1t2b2wtPnZvbF9pZF0gPSBOVUxMOworICAgICAgICAgICAgICAgdm9sX3JlbGVhc2Uo
JnZvbC0+ZGV2KTsKKyAgICAgICAgICAgICAgIGdvdG8gb3V0OwogICAgICAgICB9CgogICAgICAg
ICB2b2wtPmRldi5yZWxlYXNlID0gdm9sX3JlbGVhc2U7CkBAIC01OTAsMTQgKzU5MiwxNiBAQCBp
bnQgdWJpX2FkZF92b2x1bWUoc3RydWN0IHViaV9kZXZpY2UgKnViaSwgc3RydWN0IAp1Ymlfdm9s
dW1lICp2b2wpCiAgICAgICAgIHZvbC0+ZGV2Lmdyb3VwcyA9IHZvbHVtZV9kZXZfZ3JvdXBzOwog
ICAgICAgICBkZXZfc2V0X25hbWUoJnZvbC0+ZGV2LCAiJXNfJWQiLCB1YmktPnViaV9uYW1lLCB2
b2wtPnZvbF9pZCk7CiAgICAgICAgIGVyciA9IGRldmljZV9yZWdpc3Rlcigmdm9sLT5kZXYpOwot
ICAgICAgIGlmIChlcnIpCi0gICAgICAgICAgICAgICBnb3RvIG91dF9jZGV2OworICAgICAgIGlm
IChlcnIpIHsKKyAgICAgICAgICAgICAgIGNkZXZfZGVsKCZ2b2wtPmNkZXYpOworICAgICAgICAg
ICAgICAgdWJpLT52b2x1bWVzW3ZvbC0+dm9sX2lkXSA9IE5VTEw7CisgICAgICAgICAgICAgICBw
dXRfZGV2aWNlKCZ2b2wtPmRldik7CisgICAgICAgICAgICAgICBnb3RvIG91dDsKKyAgICAgICB9
CgogICAgICAgICBzZWxmX2NoZWNrX3ZvbHVtZXModWJpKTsKLSAgICAgICByZXR1cm4gZXJyOwoK
LW91dF9jZGV2OgotICAgICAgIGNkZXZfZGVsKCZ2b2wtPmNkZXYpOworb3V0OgogICAgICAgICBy
ZXR1cm4gZXJyOwogIH0KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
