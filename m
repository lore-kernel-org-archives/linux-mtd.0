Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 303E9C02198
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Feb 2025 09:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lNaamoH2HKmgt98HpzNe6Q6lc7pvRfwb1gvUqulTmn0=; b=2kIPjpsmsP9W+jvx9cwHiCT339
	HdIhwZ5JHs5CGVJ4RAfjHJsjSql5taVtAEwbJjz9cTBY34ht0+l/cQaEg7cLHMiuyZLofXPID2F69
	BWd1VyR1zFhhHV/4cvOte5nbMzMw7SVqw6sQbiajxlYfr1Diw1NpUzcy5B9TPMAj9xGK4DvtENXyy
	FjTdWF60KNZEiudvHCbVHN7mhYRzSMFYB4JJnaNg3mhdIzKlLRreT8tdFJ2y2lSfrmcxTO8u2KAjh
	LeVlcC57DQpUMvNfLK/NpzOsSwlypssPEUwOrgtsNWPlKMHbwAora8hVSqrtVKdZNBc2gks19qLww
	lvxHrmDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkKE5-00000007aw1-1sNf;
	Tue, 18 Feb 2025 09:49:13 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkK2x-00000007YHj-3mJg
	for linux-mtd@lists.infradead.org;
	Tue, 18 Feb 2025 09:37:45 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4YxvTF48fDz1V7C0;
	Tue, 18 Feb 2025 17:33:05 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 43B94180088;
	Tue, 18 Feb 2025 17:37:40 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 18 Feb 2025 17:37:39 +0800
Subject: Re: [PATCH mtd-utils 5/5] ubifs-utils: extract_files: Define
 XATTR_LIST_MAX locally
To: Fabio Estevam <festevam@gmail.com>, <david.oberhollenzer@sigma-star.at>
CC: <raj.khem@gmail.com>, <linux-mtd@lists.infradead.org>
References: <20250218001512.1862030-1-festevam@gmail.com>
 <20250218001512.1862030-5-festevam@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <902f18fc-469b-886e-271c-b4bc443e9216@huawei.com>
Date: Tue, 18 Feb 2025 17:37:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20250218001512.1862030-5-festevam@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_013744_114743_F4A9C4AC 
X-CRM114-Status: GOOD (  17.79  )
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

1NogMjAyNS8yLzE4IDg6MTUsIEZhYmlvIEVzdGV2YW0g0LS1wDoKPiBtdXNsIGRvZXMgbm90IGRl
ZmluZSBYQVRUUl9MSVNUX01BWC4KPiAKPiBEZWZpbmUgaXQgbG9jYWxseSB0byBmaXggdGhlIGZv
bGxvd2luZyBidWlsZCBlcnJvciB3aGVuIGJ1aWxkaW5nIHdpdGggbXVzbDoKPiAKPiB8IC4uL2dp
dC91Ymlmcy11dGlscy9mc2NrLnViaWZzL2V4dHJhY3RfZmlsZXMuYzogSW4gZnVuY3Rpb24gJ3Bh
cnNlX2lub19ub2RlJzoKPiB8IC4uL2dpdC91Ymlmcy11dGlscy9mc2NrLnViaWZzL2V4dHJhY3Rf
ZmlsZXMuYzoxNDQ6NDc6IGVycm9yOiAnWEFUVFJfTElTVF9NQVgnIHVuZGVjbGFyZWQgKGZpcnN0
IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKQo+IHwgICAxNDQgfCAgICAgICAgIGlmIChpbm9fbm9kZS0+
eG5tcyArIGlub19ub2RlLT54Y250ID4gWEFUVFJfTElTVF9NQVgpIHsKPiB8ICAgICAgIHwgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+
Cj4gfCAuLi9naXQvdWJpZnMtdXRpbHMvZnNjay51Ymlmcy9leHRyYWN0X2ZpbGVzLmM6MTQ0OjQ3
OiBub3RlOiBlYWNoIHVuZGVjbGFyZWQgaWRlbnRpZmllciBpcyByZXBvcnRlZCBvbmx5IG9uY2Ug
Zm9yIGVhY2ggZnVuY3Rpb24gaXQgYXBwZWFycyBpbgo+IHwgbWFrZTogKioqIFtNYWtlZmlsZTo0
Mzc0OiB1Ymlmcy11dGlscy9mc2NrLnViaWZzL2ZzY2tfdWJpZnMtZXh0cmFjdF9maWxlcy5vXSBF
cnJvciAxCj4gCj4gU2lnbmVkLW9mZi1ieTogRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwu
Y29tPgo+IC0tLQo+ICAgdWJpZnMtdXRpbHMvZnNjay51Ymlmcy9leHRyYWN0X2ZpbGVzLmMgfCA0
ICsrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0
IGEvdWJpZnMtdXRpbHMvZnNjay51Ymlmcy9leHRyYWN0X2ZpbGVzLmMgYi91Ymlmcy11dGlscy9m
c2NrLnViaWZzL2V4dHJhY3RfZmlsZXMuYwo+IGluZGV4IGM4M2QzNzc0OWJjMC4uYTMzMTczNjk0
ZGU3IDEwMDY0NAo+IC0tLSBhL3ViaWZzLXV0aWxzL2ZzY2sudWJpZnMvZXh0cmFjdF9maWxlcy5j
Cj4gKysrIGIvdWJpZnMtdXRpbHMvZnNjay51Ymlmcy9leHRyYWN0X2ZpbGVzLmMKPiBAQCAtMjEs
NiArMjEsMTAgQEAKPiAgICNpbmNsdWRlICJtaXNjLmgiCj4gICAjaW5jbHVkZSAiZnNjay51Ymlm
cy5oIgo+ICAgCgpIb3cgYWJvdXQgYWRkaW5nIHRoZSBuZXcgaGVhZGVyIGZpbGUgJzxsaW51eC9s
aW1pdHMuaD4nPwo+ICsjaWZuZGVmIFhBVFRSX0xJU1RfTUFYCj4gKyNkZWZpbmUgWEFUVFJfTElT
VF9NQVggNjU1MzYKPiArI2VuZGlmCj4gKwo+ICAgc3RhdGljIHZvaWQgcGFyc2Vfbm9kZV9oZWFk
ZXIoaW50IGxudW0sIGludCBvZmZzLCBpbnQgbGVuLAo+ICAgCQkJICAgICAgdW5zaWduZWQgbG9u
ZyBsb25nIHNxbnVtLAo+ICAgCQkJICAgICAgc3RydWN0IHNjYW5uZWRfbm9kZSAqaGVhZGVyKQo+
IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
