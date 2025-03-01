Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C85B2C282C5
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Mar 2025 01:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EVHgfz5fmPHvE8jHKLmS8TozplV4V23TNBeLLZIZgiA=; b=Dmu15GVEKKQh6KfoL9JlkHuiK3
	1WzV54MLPibuv4VzPmR286khyLvAxMtbYNMhMt+0mX4Bl3P1cE82qKpDeY4izFHDvEw41Av43suPR
	svpOs6ZseINwzOGVoSKP1WBJ68LifCkKMwkHjdjje0nOdd1P6tv7j6Zf+4AuonTPpb4tOZO+WgvbQ
	vjCsbkygMJkRD9fn1He4LP1Zh9gNTB92P40X1vyDHVu2wuLtBVt+91a6UjUJ6cnUegLsBzfot3Q7u
	4pvDhqyMN9zwoVKROiAX0MH6LY4ibKm1ZBj94TbBizCVUm7qkH8PM10GKxSuhFGk3ahMzvP1WDgZO
	rPsjTN9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toBZm-0000000D9HK-2S63;
	Sat, 01 Mar 2025 01:23:34 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toBZk-0000000D9GD-06qC
	for linux-mtd@lists.infradead.org;
	Sat, 01 Mar 2025 01:23:33 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Z4S1R25RMz21lbd;
	Sat,  1 Mar 2025 09:20:11 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 0F1A314011D;
	Sat,  1 Mar 2025 09:23:17 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 1 Mar 2025 09:23:16 +0800
Subject: Re: [PATCH mtd-utils] ubifs-utils: link libmissing.a in case
 execinfo.h isn't present
To: Ross Burton <ross.burton@arm.com>, <linux-mtd@lists.infradead.org>
References: <20250226182400.1723418-1-ross.burton@arm.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <e87fbc32-b301-1500-c3da-642e21e97306@huawei.com>
Date: Sat, 1 Mar 2025 09:23:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20250226182400.1723418-1-ross.burton@arm.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_172332_218251_80495111 
X-CRM114-Status: GOOD (  12.88  )
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

1NogMjAyNS8yLzI3IDI6MjQsIFJvc3MgQnVydG9uINC0tcA6Cj4gT24gbXVzbCBleGVjaW5mby5o
IGRvZXNuJ3QgZXhpc3QsIGJ1dCB1Ymlmcy11dGlscyB1c2VzIGJhY2t0cmFjZSgpIHdoZW4KPiBy
ZXBvcnRpbmcgZXJyb3JzLiAgVGhpcyByZXN1bHRzIGluIGJ1aWxkIGZhaWx1cmVzIHVuZGVyIG11
c2wuCj4gCj4gSGFuZGlseSwgbGlibWlzc2luZy5hIGFscmVhZHkgZXhpc3RzIHdpdGggYSBzdHVi
IGltcGxlbWVudGF0aW9uIG9mCj4gYmFja3RyYWNlKCkuCj4gCj4gR3VhcmQgdGhlIGV4ZWNpbmZv
LmggaW5jbHVkZSBhbmQgaWYgaXQgaXNuJ3QgYXZhaWxhYmxlIGluc3RlYWQgaW5jbHVkZQo+IGxp
Ym1pc3NpbmcuaCwgYW5kIGxpbmsgdG8gbGlibWlzc2luZy5hIHRvIHByb3ZpZGUgYmFja3RyYWNl
KCkgaWYgbmVlZGVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRv
bkBhcm0uY29tPgo+IC0tLQo+ICAgdWJpZnMtdXRpbHMvTWFrZW1vZHVsZS5hbSB8IDQgKystLQo+
ICAgdWJpZnMtdXRpbHMvY29tbW9uL2RlZnMuaCB8IDUgKysrKy0KPiAgIDIgZmlsZXMgY2hhbmdl
ZCwgNiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAoKUmV2aWV3ZWQtYnk6IFpoaWhh
byBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+CgpDb21wYXJlZCB3aXRoIGZpcnN0IHNv
bHV0aW9uWzFdLCBJIHByZWZlciB0aGlzIG9uZS4KWzFdIApodHRwczovL3BhdGNod29yay5vemxh
YnMub3JnL3Byb2plY3QvbGludXgtbXRkL3BhdGNoLzIwMjUwMjE5MTMwMjQ0LjIxMTk1ODItMy1m
ZXN0ZXZhbUBnbWFpbC5jb20vCj4gZGlmZiAtLWdpdCBhL3ViaWZzLXV0aWxzL01ha2Vtb2R1bGUu
YW0gYi91Ymlmcy11dGlscy9NYWtlbW9kdWxlLmFtCj4gaW5kZXggMjFiYTA1OS4uZjg0NTY5YSAx
MDA2NDQKPiAtLS0gYS91Ymlmcy11dGlscy9NYWtlbW9kdWxlLmFtCj4gKysrIGIvdWJpZnMtdXRp
bHMvTWFrZW1vZHVsZS5hbQo+IEBAIC03Miw3ICs3Miw3IEBAIG1rZnNfdWJpZnNfU09VUkNFUyA9
IFwKPiAgIAl1Ymlmcy11dGlscy9ta2ZzLnViaWZzL21rZnMudWJpZnMuYwo+ICAgCj4gICBta2Zz
X3ViaWZzX0xEQUREID0gbGlibXRkLmEgbGlidWJpLmEgJChaTElCX0xJQlMpICQoTFpPX0xJQlMp
ICQoWlNURF9MSUJTKSAkKFVVSURfTElCUykgJChMSUJTRUxJTlVYX0xJQlMpICQoT1BFTlNTTF9M
SUJTKSBcCj4gLQkJICAgJChEVU1QX1NUQUNLX0xEKSAkKEFTQU5fTElCUykgLWxtIC1scHRocmVh
ZAo+ICsJCSAgICQoRFVNUF9TVEFDS19MRCkgJChBU0FOX0xJQlMpIC1sbSAtbHB0aHJlYWQgbGli
bWlzc2luZy5hCj4gICBta2ZzX3ViaWZzX0NQUEZMQUdTID0gJChBTV9DUFBGTEFHUykgJChaTElC
X0NGTEFHUykgJChMWk9fQ0ZMQUdTKSAkKFpTVERfQ0ZMQUdTKSAkKFVVSURfQ0ZMQUdTKSAkKExJ
QlNFTElOVVhfQ0ZMQUdTKSBcCj4gICAJLUkkKHRvcF9zcmNkaXIpL3ViaS11dGlscy9pbmNsdWRl
IC1JJCh0b3Bfc3JjZGlyKS91Ymlmcy11dGlscy9jb21tb24gLUkgJCh0b3Bfc3JjZGlyKS91Ymlm
cy11dGlscy9saWJ1Ymlmcwo+ICAgCj4gQEAgLTkwLDcgKzkwLDcgQEAgZnNja191Ymlmc19TT1VS
Q0VTID0gXAo+ICAgCXViaWZzLXV0aWxzL2ZzY2sudWJpZnMvaGFuZGxlX2Rpc2Nvbm5lY3RlZC5j
Cj4gICAKPiAgIGZzY2tfdWJpZnNfTERBREQgPSBsaWJtdGQuYSBsaWJ1YmkuYSAkKFpMSUJfTElC
UykgJChMWk9fTElCUykgJChaU1REX0xJQlMpICQoVVVJRF9MSUJTKSAkKExJQlNFTElOVVhfTElC
UykgJChPUEVOU1NMX0xJQlMpIFwKPiAtCQkgICAkKERVTVBfU1RBQ0tfTEQpICQoQVNBTl9MSUJT
KSAtbG0gLWxwdGhyZWFkCj4gKwkJICAgJChEVU1QX1NUQUNLX0xEKSAkKEFTQU5fTElCUykgLWxt
IC1scHRocmVhZCBsaWJtaXNzaW5nLmEKPiAgIGZzY2tfdWJpZnNfQ1BQRkxBR1MgPSAkKEFNX0NQ
UEZMQUdTKSAkKFpMSUJfQ0ZMQUdTKSAkKExaT19DRkxBR1MpICQoWlNURF9DRkxBR1MpICQoVVVJ
RF9DRkxBR1MpICQoTElCU0VMSU5VWF9DRkxBR1MpIFwKPiAgIAktSSQodG9wX3NyY2RpcikvdWJp
LXV0aWxzL2luY2x1ZGUgLUkkKHRvcF9zcmNkaXIpL3ViaWZzLXV0aWxzL2NvbW1vbiAtSSAkKHRv
cF9zcmNkaXIpL3ViaWZzLXV0aWxzL2xpYnViaWZzIFwKPiAgIAktSSQodG9wX3NyY2RpcikvdWJp
ZnMtdXRpbHMvZnNjay51Ymlmcwo+IGRpZmYgLS1naXQgYS91Ymlmcy11dGlscy9jb21tb24vZGVm
cy5oIGIvdWJpZnMtdXRpbHMvY29tbW9uL2RlZnMuaAo+IGluZGV4IDdmZjE3NzEuLmQ1ZWRiZjYg
MTAwNjQ0Cj4gLS0tIGEvdWJpZnMtdXRpbHMvY29tbW9uL2RlZnMuaAo+ICsrKyBiL3ViaWZzLXV0
aWxzL2NvbW1vbi9kZWZzLmgKPiBAQCAtMTMsOCArMTMsMTEgQEAKPiAgICNpbmNsdWRlIDxlcnJu
by5oPgo+ICAgI2luY2x1ZGUgPHRpbWUuaD4KPiAgICNpbmNsdWRlIDxhc3NlcnQuaD4KPiArI2lm
IEhBVkVfRVhFQ0lORk9fSAo+ICAgI2luY2x1ZGUgPGV4ZWNpbmZvLmg+Cj4gLQo+ICsjZWxzZQo+
ICsjaW5jbHVkZSAibGlibWlzc2luZy5oIgo+ICsjZW5kaWYKPiAgICNpbmNsdWRlICJ1Ymlmcy5o
Igo+ICAgCj4gICAvKiBjb21tb24uaCByZXF1aXJlcyB0aGUgUFJPR1JBTV9OQU1FIG1hY3JvICov
Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
