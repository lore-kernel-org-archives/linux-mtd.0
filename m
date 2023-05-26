Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E3C4C77B7C
	for <linux-mtd@archiver.kernel.org>; Fri, 26 May 2023 11:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HFbjCIOaWLPAtrqE59Shalqqrhlso4DXhH104IU1/Fw=; b=jAwnyFMHctKHBBu3Wc4VWc/Snq
	+GWqrsmzUBjnz3Q1pg5Nw1Mij0DjhOczyOVkmFYg8vVJMR8pcavLoxDrivQHaJCdB76F/arhbsAIl
	YMPGsUj3BMNUNAMOwktbUdsa2GDFhcMIEsKBf88h9CFg93e1P00P4rWOiRJwDA6m6B6JYa2jQY6oX
	R737ex89pK6GAC3Mj2XFKm1f7kivzyn4yXewFak8QZMcVrZKX49zopNEzUyuWYwcCPN08blJj7iXp
	wPrAsWXr9mYIXoG5OQinHPdzqNp/7kXHyKG7i8a7nbPE0BwAI6UuOl+SwAmgFz3d4GCMlxvzwMtG1
	KhdUrRkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2VVx-002Hsv-1Q;
	Fri, 26 May 2023 11:21:45 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2VVu-002HrG-1X
	for linux-mtd@lists.infradead.org;
	Fri, 26 May 2023 11:21:44 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4QSMrP32x0zsSL2;
	Fri, 26 May 2023 19:19:17 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 26 May 2023 19:21:26 +0800
Subject: Re: [PATCH v1] mkfs.ubifs: Fix mkfs.ubifs failure with option selinux
To: Zijun Hu <quic_zijuhu@quicinc.com>, <david.oberhollenzer@sigma-star.at>,
	<bastiangermann@fishpost.de>
CC: <linux-mtd@lists.infradead.org>
References: <1685090853-25855-1-git-send-email-quic_zijuhu@quicinc.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <d2e46286-bcd0-35fc-8fe0-cc1fec2e4b40@huawei.com>
Date: Fri, 26 May 2023 19:21:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1685090853-25855-1-git-send-email-quic_zijuhu@quicinc.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_042142_679951_1F427E11 
X-CRM114-Status: GOOD (  12.68  )
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

1NogMjAyMy81LzI2IDE2OjQ3LCBaaWp1biBIdSDQtLXAOgo+IEJlbG93IGZhaWx1cmUgaGFwcGVu
cyB3aGVuIG1rZnMudWJpZnMgLS1zZWxpbnV4PUZJTEUgLi4uCj4gIkVycm9yOiBiYWQgZmlsZSBj
b250ZXh0IEZJTEUgMSIKPiAiTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeSAoZXJyb3IgMikiCj4g
Cj4gSXQgaXMgZml4ZWQgYnkgdGhpcyBjaGFuZ2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogWmlqdW4g
SHUgPHF1aWNfemlqdWh1QHF1aWNpbmMuY29tPgo+IC0tLQo+ICAgdWJpZnMtdXRpbHMvbWtmcy51
Ymlmcy9ta2ZzLnViaWZzLmMgfCAxICsKPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KQo+IAo+IGRpZmYgLS1naXQgYS91Ymlmcy11dGlscy9ta2ZzLnViaWZzL21rZnMudWJpZnMuYyBi
L3ViaWZzLXV0aWxzL21rZnMudWJpZnMvbWtmcy51Ymlmcy5jCj4gaW5kZXggODIxMWFkYS4uMTVl
NmJkYyAxMDA2NDQKPiAtLS0gYS91Ymlmcy11dGlscy9ta2ZzLnViaWZzL21rZnMudWJpZnMuYwo+
ICsrKyBiL3ViaWZzLXV0aWxzL21rZnMudWJpZnMvbWtmcy51Ymlmcy5jCj4gQEAgLTczMyw2ICs3
MzMsNyBAQCBzdGF0aWMgaW50IGdldF9vcHRpb25zKGludCBhcmdjLCBjaGFyKiphcmd2KQo+ICAg
CQkJaWYgKCFjb250ZXh0KQo+ICAgCQkJCXJldHVybiBlcnJfbXNnKCJ4bWFsbG9jIGZhaWxlZFxu
Iik7Cj4gICAJCQltZW1jcHkoY29udGV4dCwgb3B0YXJnLCBjb250ZXh0X2xlbik7Cj4gKwkJCWNv
bnRleHRbY29udGV4dF9sZW5dID0gJ1wwJzsKCk1ha2VzIHNlbnNlLCAnY29udGV4dCcgaXMgYWxs
b2NhdGVkIHdpdGhvdXQgaW5pdGlhbGl6YXRpb24sIGl0IG1heSBiZSAKdGVybWluYXRlZCB3aXRo
IG5vbiAnXDAnLgoKUmV2aWV3ZWQtYnk6IFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdl
aS5jb20+Cgo+ICAgCj4gICAJCQkvKiBNYWtlIHN1cmUgcm9vdCBkaXJlY3RvcnkgZXhpc3RzICov
Cj4gICAJCQlpZiAoc3RhdChjb250ZXh0LCAmY29udGV4dF9zdCkpCj4gCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
