Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2676C83F23
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Jul 2025 10:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ypA58ANU0xcv6HkfuTCsEo0vMBLKANX8RivJx9IpLCM=; b=ZTIvb9i55kkWNkASYs7X7CRhVg
	P0BAGM/ct+S5zHz4slHLciD9MHYPl0wzT+HZhzuxkC0JSPz4Xg6JwV/rF0cLN0NWcCRZJEArfrebo
	Y6s4K7tvY/PSg3apP26TenWcImCt4LKrpm4V0NvFBGiTZzVWHTaA0Yc47bIWIpnZ45WRghMssJB9y
	frDy0XecajQLCIJ/3vSxkcGYJoP3QOdUHPJjbTa2xxHJaIfpSuhZQA5in1DJYGXlVZXeDZ+7A6Ri0
	KxmOBGV81PPDEmJlyn4rIfBN358TyjwX7ysEcR//NXwFpfcU/GSjJ903Kc1L9SKgpnM4eD8JUMMDY
	hjRwzszw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaAaV-0000000EQQ3-2OW8;
	Fri, 11 Jul 2025 10:02:39 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua9lP-0000000EGX5-2Hhr
	for linux-mtd@lists.infradead.org;
	Fri, 11 Jul 2025 09:09:53 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4bdm844kYZz2FbQC;
	Fri, 11 Jul 2025 17:07:48 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 0F2161400CB;
	Fri, 11 Jul 2025 17:09:46 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 11 Jul 2025 17:09:45 +0800
Subject: Re: [PATCH] ubifs: stop using write_cache_pages
To: Christoph Hellwig <hch@lst.de>, <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>
References: <20250711081116.564445-1-hch@lst.de>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <35dcb159-ddf9-2403-f1dc-f11d8d4562ce@huawei.com>
Date: Fri, 11 Jul 2025 17:09:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20250711081116.564445-1-hch@lst.de>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_020951_766918_33C61473 
X-CRM114-Status: GOOD (  15.78  )
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

1NogMjAyNS83LzExIDE2OjExLCBDaHJpc3RvcGggSGVsbHdpZyDQtLXAOgo+IFN0b3AgdXNpbmcg
dGhlIG9ic29sZXRlIHdyaXRlX2NhY2hlX3BhZ2VzIGFuZCB1c2Ugd3JpdGViYWNrX2l0ZXIgZGly
ZWN0bHkuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+
Cj4gLS0tCj4gICBmcy91Ymlmcy9maWxlLmMgfCAxMCArKysrKysrLS0tCj4gICAxIGZpbGUgY2hh
bmdlZCwgNyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAoKUmV2aWV3ZWQtYnk6IFpo
aWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+Cj4gZGlmZiAtLWdpdCBhL2ZzL3Vi
aWZzL2ZpbGUuYyBiL2ZzL3ViaWZzL2ZpbGUuYwo+IGluZGV4IGJmMzExYzM4ZDlhOC4uZDUyMTgx
ZjUzM2FjIDEwMDY0NAo+IC0tLSBhL2ZzL3ViaWZzL2ZpbGUuYwo+ICsrKyBiL2ZzL3ViaWZzL2Zp
bGUuYwo+IEBAIC05NzcsOCArOTc3LDcgQEAgc3RhdGljIGludCBkb193cml0ZXBhZ2Uoc3RydWN0
IGZvbGlvICpmb2xpbywgc2l6ZV90IGxlbikKPiAgICAqIG9uIHRoZSBwYWdlIGxvY2sgYW5kIGl0
IHdvdWxkIG5vdCB3cml0ZSB0aGUgdHJ1bmNhdGVkIGlub2RlIG5vZGUgdG8gdGhlCj4gICAgKiBq
b3VybmFsIGJlZm9yZSB3ZSBoYXZlIGZpbmlzaGVkLgo+ICAgICovCj4gLXN0YXRpYyBpbnQgdWJp
ZnNfd3JpdGVwYWdlKHN0cnVjdCBmb2xpbyAqZm9saW8sIHN0cnVjdCB3cml0ZWJhY2tfY29udHJv
bCAqd2JjLAo+IC0JCXZvaWQgKmRhdGEpCj4gK3N0YXRpYyBpbnQgdWJpZnNfd3JpdGVwYWdlKHN0
cnVjdCBmb2xpbyAqZm9saW8sIHN0cnVjdCB3cml0ZWJhY2tfY29udHJvbCAqd2JjKQo+ICAgewo+
ICAgCXN0cnVjdCBpbm9kZSAqaW5vZGUgPSBmb2xpby0+bWFwcGluZy0+aG9zdDsKPiAgIAlzdHJ1
Y3QgdWJpZnNfaW5mbyAqYyA9IGlub2RlLT5pX3NiLT5zX2ZzX2luZm87Cj4gQEAgLTEwNTAsNyAr
MTA0OSwxMiBAQCBzdGF0aWMgaW50IHViaWZzX3dyaXRlcGFnZShzdHJ1Y3QgZm9saW8gKmZvbGlv
LCBzdHJ1Y3Qgd3JpdGViYWNrX2NvbnRyb2wgKndiYywKPiAgIHN0YXRpYyBpbnQgdWJpZnNfd3Jp
dGVwYWdlcyhzdHJ1Y3QgYWRkcmVzc19zcGFjZSAqbWFwcGluZywKPiAgIAkJc3RydWN0IHdyaXRl
YmFja19jb250cm9sICp3YmMpCj4gICB7Cj4gLQlyZXR1cm4gd3JpdGVfY2FjaGVfcGFnZXMobWFw
cGluZywgd2JjLCB1Ymlmc193cml0ZXBhZ2UsIE5VTEwpOwo+ICsJc3RydWN0IGZvbGlvICpmb2xp
byA9IE5VTEw7Cj4gKwlpbnQgZXJyb3I7Cj4gKwo+ICsJd2hpbGUgKChmb2xpbyA9IHdyaXRlYmFj
a19pdGVyKG1hcHBpbmcsIHdiYywgZm9saW8sICZlcnJvcikpKQo+ICsJCWVycm9yID0gdWJpZnNf
d3JpdGVwYWdlKGZvbGlvLCB3YmMpOwo+ICsJcmV0dXJuIGVycm9yOwo+ICAgfQo+ICAgCj4gICAv
KioKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
