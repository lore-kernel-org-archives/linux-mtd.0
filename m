Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A51FD5AE72
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Nov 2024 08:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CDFJlD/05nvr6+sZdZ1BED5tQBKzG/3dIUfdD5eFAWE=; b=DT2t57os+qfwPRTsDL4B8GxzNd
	iMfy7N3IbECFN1/2fwxLHKxzS4Rc5rrjLzSr5xkSw+y194O7nEHnJqpkwGH0xH8hFoanlsEPQGc8n
	N0JHs5EBz+gM9jygFdqpFAV7o4I/Jk0esmaSljnq6uArUT1wutJqynB9l/LbHiCV298GsFILS+Obl
	fg61H+Dk1PvubUE2YGgD7apK77ByLfckERuqcg3SG8VZeGdBFt2rwg5RTBUQFBKjM/4ve3sra/fYn
	9VG2o2pVgV5KFPg+BySmj7DZk9gd/HB70CELXwveV04puJNLr80NmpTW3Bt0chhTeWK60jDalxnTA
	QLgAo86w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8y3Z-000000069Hk-0NoH;
	Thu, 07 Nov 2024 08:39:57 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8y3V-000000069Gc-3qNX
	for linux-mtd@lists.infradead.org;
	Thu, 07 Nov 2024 08:39:56 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Xkb7D20N1z1SCjb;
	Thu,  7 Nov 2024 16:38:00 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 1837F1A0188;
	Thu,  7 Nov 2024 16:39:43 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 7 Nov 2024 16:39:42 +0800
Subject: Re: [PATCH RFC] ubifs: Fix use-after-free in ubifs_tnc_end_commit
To: Waqar Hameed <waqar.hameed@axis.com>, Richard Weinberger <richard@nod.at>,
	Sascha Hauer <s.hauer@pengutronix.de>
CC: <kernel@axis.com>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Ryder Wang <rydercoding@hotmail.com>
References: <1225b9b5bbf5278e5ae512177712915f1bc0aebf.1728570925.git.waqar.hameed@axis.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <0f040e0a-c27f-2f29-6d9e-9c7152a18513@huawei.com>
Date: Thu, 7 Nov 2024 16:39:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1225b9b5bbf5278e5ae512177712915f1bc0aebf.1728570925.git.waqar.hameed@axis.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_003954_321493_3F90E784 
X-CRM114-Status: GOOD (  12.77  )
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

1NogMjAyNC8xMC85IDIyOjQ2LCBXYXFhciBIYW1lZWQg0LS1wDoKPiBSdW5uaW5nCj4gCj4gICAg
cm0gLWYgL2V0Yy90ZXN0LWZpbGUuYmluCj4gICAgZGQgaWY9L2Rldi91cmFuZG9tIG9mPS9ldGMv
dGVzdC1maWxlLmJpbiBicz0xTSBjb3VudD02MCBjb252PWZzeW5jCj4gCj4gaW4gYSBsb29wLCB3
aXRoIGBDT05GSUdfVUJJRlNfRlNfQVVUSEVOVElDQVRJT05gLCBLQVNBTiByZXBvcnRzOgo+IAo+
ICAgIEJVRzogS0FTQU46IHVzZS1hZnRlci1mcmVlIGluIHViaWZzX3RuY19lbmRfY29tbWl0KzB4
YTVjLzB4MTk1MAo+ICAgIFdyaXRlIG9mIHNpemUgMzIgYXQgYWRkciBmZmZmZmY4MDBhM2FmODZj
IGJ5IHRhc2sgdWJpZnNfYmd0MF8yMC8xNTMKPiAKPiAgICBDYWxsIHRyYWNlOgo+ICAgICBkdW1w
X2JhY2t0cmFjZSsweDAvMHgzNDAKPiAgICAgc2hvd19zdGFjaysweDE4LzB4MjQKPiAgICAgZHVt
cF9zdGFja19sdmwrMHg5Yy8weGJjCj4gICAgIHByaW50X2FkZHJlc3NfZGVzY3JpcHRpb24uY29u
c3Rwcm9wLjArMHg3NC8weDJiMAo+ICAgICBrYXNhbl9yZXBvcnQrMHgxZDgvMHgxZjAKPiAgICAg
a2FzYW5fY2hlY2tfcmFuZ2UrMHhmOC8weDFhMAo+ICAgICBtZW1jcHkrMHg4NC8weGY0Cj4gICAg
IHViaWZzX3RuY19lbmRfY29tbWl0KzB4YTVjLzB4MTk1MAo+ICAgICBkb19jb21taXQrMHg0ZTAv
MHgxMzQwCj4gICAgIHViaWZzX2JnX3RocmVhZCsweDIzNC8weDJlMAo+ICAgICBrdGhyZWFkKzB4
MzZjLzB4NDEwCj4gICAgIHJldF9mcm9tX2ZvcmsrMHgxMC8weDIwCj4gCj4gICAgQWxsb2NhdGVk
IGJ5IHRhc2sgNDAxOgo+ICAgICBrYXNhbl9zYXZlX3N0YWNrKzB4MzgvMHg3MAo+ICAgICBfX2th
c2FuX2ttYWxsb2MrMHg4Yy8weGQwCj4gICAgIF9fa21hbGxvYysweDM0Yy8weDViYwo+ICAgICB0
bmNfaW5zZXJ0KzB4MTQwLzB4MTZhNAo+ICAgICB1Ymlmc190bmNfYWRkKzB4MzcwLzB4NTJjCj4g
ICAgIHViaWZzX2pubF93cml0ZV9kYXRhKzB4NWQ4LzB4ODcwCj4gICAgIGRvX3dyaXRlcGFnZSsw
eDM2Yy8weDUxMAo+ICAgICB1Ymlmc193cml0ZXBhZ2UrMHgxOTAvMHg0ZGMKPiAgICAgX193cml0
ZXBhZ2UrMHg1OC8weDE1NAo+ICAgICB3cml0ZV9jYWNoZV9wYWdlcysweDM5NC8weDgzMAo+ICAg
ICBkb193cml0ZXBhZ2VzKzB4MWYwLzB4NWIwCj4gICAgIGZpbGVtYXBfZmRhdGF3cml0ZV93YmMr
MHgxNzAvMHgyNWMKPiAgICAgZmlsZV93cml0ZV9hbmRfd2FpdF9yYW5nZSsweDE0MC8weDE5MAo+
ICAgICB1Ymlmc19mc3luYysweGU4LzB4MjkwCj4gICAgIHZmc19mc3luY19yYW5nZSsweGMwLzB4
MWU0Cj4gICAgIGRvX2ZzeW5jKzB4NDAvMHg5MAo+ICAgICBfX2FybTY0X3N5c19mc3luYysweDM0
LzB4NTAKPiAgICAgaW52b2tlX3N5c2NhbGwuY29uc3Rwcm9wLjArMHhhOC8weDI2MAo+ICAgICBk
b19lbDBfc3ZjKzB4YzgvMHgxZjAKPiAgICAgZWwwX3N2YysweDM0LzB4NzAKPiAgICAgZWwwdF82
NF9zeW5jX2hhbmRsZXIrMHgxMDgvMHgxMTQKPiAgICAgZWwwdF82NF9zeW5jKzB4MWE0LzB4MWE4
Cj4gCj4gICAgRnJlZWQgYnkgdGFzayA0MDM6Cj4gICAgIGthc2FuX3NhdmVfc3RhY2srMHgzOC8w
eDcwCj4gICAgIGthc2FuX3NldF90cmFjaysweDI4LzB4NDAKPiAgICAga2FzYW5fc2V0X2ZyZWVf
aW5mbysweDI4LzB4NGMKPiAgICAgX19rYXNhbl9zbGFiX2ZyZWUrMHhkNC8weDEzYwoKSGkgV2Fx
YXIsIGlzIHRoYXQgbGluZSAyNjM5ID8KMjU0MCBzc3RhdGljIGludCB0bmNfZGVsZXRlKCkKMjU0
MSB7CjI2MDggICAgICAgICBpZiAoIXpub2RlLT5wYXJlbnQpIHsKMjYwOSAgICAgICAgICAgICAg
ICAgd2hpbGUgKHpub2RlLT5jaGlsZF9jbnQgPT0gMSAmJiB6bm9kZS0+bGV2ZWwgIT0gMCkgewoy
NjM0ICAgICAgICAgICAgICAgICAgICAgICAgIGlmICh6cC0+Y25leHQpIHsKLi4uCjI2MzggICAg
ICAgICAgICAgICAgICAgICAgICAgfSBlbHNlCjI2MzkgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBrZnJlZSh6cCk7CjI2NDQgfQoKPiAgICAga2ZyZWUrMHhjNC8weDNhMAo+ICAgICB0
bmNfZGVsZXRlKzB4M2Y0LzB4ZTQwCj4gICAgIHViaWZzX3RuY19yZW1vdmVfcmFuZ2UrMHgzNjgv
MHg3M2MKPiAgICAgdWJpZnNfdG5jX3JlbW92ZV9pbm8rMHgyOWMvMHgyZTAKPiAgICAgdWJpZnNf
am5sX2RlbGV0ZV9pbm9kZSsweDE1MC8weDI2MAo+ICAgICB1Ymlmc19ldmljdF9pbm9kZSsweDFk
NC8weDJlNAo+ICAgICBldmljdCsweDFjOC8weDQ1MAo+ICAgICBpcHV0KzB4MmEwLzB4M2M0Cj4g
ICAgIGRvX3VubGlua2F0KzB4MmNjLzB4NDkwCj4gICAgIF9fYXJtNjRfc3lzX3VubGlua2F0KzB4
OTAvMHgxMDAKPiAgICAgaW52b2tlX3N5c2NhbGwuY29uc3Rwcm9wLjArMHhhOC8weDI2MAo+ICAg
ICBkb19lbDBfc3ZjKzB4YzgvMHgxZjAKPiAgICAgZWwwX3N2YysweDM0LzB4NzAKPiAgICAgZWww
dF82NF9zeW5jX2hhbmRsZXIrMHgxMDgvMHgxMTQKPiAgICAgZWwwdF82NF9zeW5jKzB4MWE0LzB4
MWE4Cj4gCgpMb29rcyBsaWtlIHRoZXJlIGlzIG9uZSBwb3NzaWJpbGl0eToKMS4gdG5jX2luc2Vy
dCgpIHRyaWdnZXJzIGEgVE5DIHRyZWUgc3BsaXQ6CiAgICB6cm9vdAogICAgLwogICB6X3AxCiAg
IC8Kem4KICAgel9wMSBpcyBmdWxsLCBhZnRlciBpbnNlcnRpbmcgem5fbmV3KGtleSBvcmRlciBp
cyBzbWFsbGVyIHRoYXQgem4pIAp1bmRlciB6X3AxLCB6bi0+cGFyZW50IGlzIHN3aXRjaGVkIHRv
IHpfcDIsIGJ1dCB6bi0+Y3BhcmVudCBpcyBzdGlsbCB6X3AxOgogICAgenJvb3QKICAgIC8gICAg
XAogICB6X3AxICB6X3AyCiAgIC8gICAgICBcCnpuX25ldyAgIHpuCjIuIHRuY19kZWxldGUoKSBy
ZW1vdmVzIGFsbCB6bm9kZXMgZXhjZXB0IHRoZSAnem4nOgogICAgenJvb3QKICAgICAgIFwKICAg
ICAgIHpfcDIKICAgICAgICAgXAogICAgICAgICB6bgogICAgIFROQyB0cmVlIGlzIGNvbGxhcHNl
ZCwgenJvb3QgYW5kIHpfcDIgYXJlIGZyZWVkOgogICAgIHpyb290Jyh6bikKMy4gZ2V0X3pub2Rl
c190b19jb21taXQoKSBmaW5kcyBvbmx5IG9uZSB6bm9kZSh6biwgd2hpY2ggaXMgYWxzbyB6cm9v
dCksIAp6bi0+Y3BhcmVudCBpcyBub3QgdXBkYXRlZCBhbmQgc3RpbGwgcG9pbnRzIHRvIHpfcDEo
d2hpY2ggd2FzIGZyZWVkKS4KNC4gd3JpdGVfaW5kZXgoKSBhY2Nlc3NlcyB0aGUgem4tPmNwYXJl
bnQtPnpicmFuY2gsIHdoaWNoIHRyaWdnZXJzIGFuIFVBRiEKClRyeSBmb2xsb3dpbmcgbW9kaWZp
Y2F0aW9uIHRvIHZlcmlmeSB3aGV0aGVyIHRoZSBwcm9ibGVtIGlzIGZpeGVkOgpkaWZmIC0tZ2l0
IGEvZnMvdWJpZnMvdG5jX2NvbW1pdC5jIGIvZnMvdWJpZnMvdG5jX2NvbW1pdC5jCmluZGV4IGE1
NWUwNDgyMmQxNi4uN2M0M2UwY2NmNmQ0IDEwMDY0NAotLS0gYS9mcy91Ymlmcy90bmNfY29tbWl0
LmMKKysrIGIvZnMvdWJpZnMvdG5jX2NvbW1pdC5jCkBAIC02NTcsNiArNjU3LDggQEAgc3RhdGlj
IGludCBnZXRfem5vZGVzX3RvX2NvbW1pdChzdHJ1Y3QgdWJpZnNfaW5mbyAqYykKICAgICAgICAg
ICAgICAgICB6bm9kZS0+YWx0ID0gMDsKICAgICAgICAgICAgICAgICBjbmV4dCA9IGZpbmRfbmV4
dF9kaXJ0eSh6bm9kZSk7CiAgICAgICAgICAgICAgICAgaWYgKCFjbmV4dCkgeworICAgICAgICAg
ICAgICAgICAgICAgICB1Ymlmc19hc3NlcnQoYywgIXpub2RlLT5wYXJlbnQpOworICAgICAgICAg
ICAgICAgICAgICAgICB6bm9kZS0+Y3BhcmVudCA9IE5VTEw7CiAgICAgICAgICAgICAgICAgICAg
ICAgICB6bm9kZS0+Y25leHQgPSBjLT5jbmV4dDsKICAgICAgICAgICAgICAgICAgICAgICAgIGJy
ZWFrOwogICAgICAgICAgICAgICAgIH0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
