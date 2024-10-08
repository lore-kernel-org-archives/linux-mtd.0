Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C89CED258
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Oct 2024 02:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/0Ant6xo4BmKh5gbzraeS9wSk40MrL7jg16qsxa/+NU=; b=wXnumKoU4u1uH00rwcGl7Ksad4
	AUFPRvM1+xf47a/XS1t4oPfGOd5QHxtcWIQZFLeCWLhanXRizDKuNzlsxxAfBJmUYTRszqbFBaHgn
	T6a8QOaLBGdAC8G3FccKlGBGcV2woLzqj7Mq/Z08jKsZinYvt/9k+1jC8fUtXylJRxL7vfSpD76ES
	SQ1Pqph97leiQUyyy9ISIrrCQ3diQWdRARE3NVnp5JLusf4onQf3KrWmjy7zRbnouHN1kwVPW0wbK
	JH9Jj6cZmhHtrd0TNepieINt0PBo1ZV7kMr+DwUvZ2Eeszdj7qL9O/irakXeTUut0arkRwn+DLKcI
	82h2vdMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy08C-00000004JWp-1Dgd;
	Tue, 08 Oct 2024 02:39:24 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy089-00000004JWA-02cf
	for linux-mtd@lists.infradead.org;
	Tue, 08 Oct 2024 02:39:22 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4XN0Y30mpbzZhSQ
	for <linux-mtd@lists.infradead.org>; Tue,  8 Oct 2024 10:37:27 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id ED01818005F
	for <linux-mtd@lists.infradead.org>; Tue,  8 Oct 2024 10:39:08 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 10:39:08 +0800
Subject: Re: [PATCHv2] mkfs.jffs2: fix segfault when parsing dev table
To: Rosen Penev <rosenp@gmail.com>, <linux-mtd@lists.infradead.org>
References: <20241003021941.1954913-1-rosenp@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <e4a26eff-92f8-9ce2-f9bc-4ce4b0355f26@huawei.com>
Date: Tue, 8 Oct 2024 10:39:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241003021941.1954913-1-rosenp@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_193921_302473_ED4AE8E2 
X-CRM114-Status: GOOD (  13.91  )
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

1NogMjAyNC8xMC8zIDEwOjE5LCBSb3NlbiBQZW5ldiDQtLXAOgo+IE1ha2Ugc3VyZSB0aGF0IHRo
ZSBmaXJzdCBpdGVtIGlzIHBhcnNlZCBjb3JyZWN0bHkuIE9uZSBpc3N1ZSBvdGhlcndpc2UgaXMK
PiBhIG51bGwgcG9pbnRlciBkZXJlZmVyZW5jZSB3aGVuIHRoZSBmaXJzdCBpdGVtIGlzIG5vdCBm
b3VuZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSb3NlbiBQZW5ldiA8cm9zZW5wQGdtYWlsLmNvbT4K
PiAtLS0KPiAgIGpmZnNYLXV0aWxzL21rZnMuamZmczIuYyB8IDIgKy0KPiAgIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAoKUmV2aWV3ZWQtYnk6IFpoaWhh
byBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+Cj4gZGlmZiAtLWdpdCBhL2pmZnNYLXV0
aWxzL21rZnMuamZmczIuYyBiL2pmZnNYLXV0aWxzL21rZnMuamZmczIuYwo+IGluZGV4IGI5ZGQ5
NmIuLmRhMDdiNjkgMTAwNjQ0Cj4gLS0tIGEvamZmc1gtdXRpbHMvbWtmcy5qZmZzMi5jCj4gKysr
IGIvamZmc1gtdXRpbHMvbWtmcy5qZmZzMi5jCj4gQEAgLTQyOCw3ICs0MjgsNyBAQCBzdGF0aWMg
aW50IGludGVycHJldF90YWJsZV9lbnRyeShzdHJ1Y3QgZmlsZXN5c3RlbV9lbnRyeSAqcm9vdCwg
Y2hhciAqbGluZSkKPiAgIAo+ICAgCWlmIChzc2NhbmYgKGxpbmUsICIlIiBTQ0FORl9QUkVGSVgg
InMgJWMgJWxvICVsdSAlbHUgJWx1ICVsdSAlbHUgJWx1ICVsdSIsCj4gICAJCQkJU0NBTkZfU1RS
SU5HKG5hbWUpLCAmdHlwZSwgJm1vZGUsICZ1aWQsICZnaWQsICZtYWpvciwgJm1pbm9yLAo+IC0J
CQkJJnN0YXJ0LCAmaW5jcmVtZW50LCAmY291bnQpIDwgMCkKPiArCQkJCSZzdGFydCwgJmluY3Jl
bWVudCwgJmNvdW50KSA8IDIpCj4gICAJewo+ICAgCQlyZXR1cm4gMTsKPiAgIAl9Cj4gCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
