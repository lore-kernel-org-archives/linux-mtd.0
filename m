Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC22BC35FFB
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Mar 2025 12:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=glmFTKaPzhmP0PYnGf2nVHmRhorhmCVal8TtZUv03Uo=; b=YoJyV7C0K/S+VokPEPFBBjw747
	2xUIqsgiNO4ItKqGUEQkMhBebiTBHWZDfjyOiTcAHqr/jG+4PJO9iWqkXd9VKTrelfJvXY60sYDVV
	yRqlZANJhwWHMf/jtm2iHXa/xyvDy6F9wZZtNB6INd26LaeXAMKP6+VQ70liX6mT20+BHNZeI5zum
	piuuWvMNMiHVS4yULUs5B3KX1kZ4TJ6q3TEaRlP6EmJveZjjJoYRG/TkrYgmb16ZPcQ0gNMupCJ6P
	bVbodmEDCYWnlRfMmcJpw/QRFCBeSg7f8U5R4jbX6nwjoe0RW9Q4tw49X8dWYFGpRhmgmSGjT6km/
	bXtPMSuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tusX7-00000008yA5-3hyc;
	Wed, 19 Mar 2025 12:28:29 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tusX3-00000008y8J-42wL
	for linux-mtd@lists.infradead.org;
	Wed, 19 Mar 2025 12:28:27 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4ZHnwG4TVzzph7P;
	Wed, 19 Mar 2025 20:25:02 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 8E3FF180044;
	Wed, 19 Mar 2025 20:28:16 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 19 Mar 2025 20:28:15 +0800
Subject: Re: [v5 PATCH 14/14] ubifs: Pass folios to acomp
To: Herbert Xu <herbert@gondor.apana.org.au>
CC: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, Richard
 Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>,
	<linux-pm@vger.kernel.org>, Steffen Klassert <steffen.klassert@secunet.com>,
	<netdev@vger.kernel.org>
References: <cover.1742034499.git.herbert@gondor.apana.org.au>
 <99ae6a15afc1478bab201949dc3dbb2c7634b687.1742034499.git.herbert@gondor.apana.org.au>
 <9f77f2a4-e4ba-813e-f44d-3a42d9637d0f@huawei.com>
 <Z9qSkRbwig5VXstP@gondor.apana.org.au>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <82697910-2359-b96c-e454-e38abd8c0a7a@huawei.com>
Date: Wed, 19 Mar 2025 20:28:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <Z9qSkRbwig5VXstP@gondor.apana.org.au>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_052826_148474_EEDFACDC 
X-CRM114-Status: GOOD (  11.40  )
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

1NogMjAyNS8zLzE5IDE3OjQ2LCBIZXJiZXJ0IFh1INC0tcA6Cj4gT24gV2VkLCBNYXIgMTksIDIw
MjUgYXQgMDU6NDQ6MTdQTSArMDgwMCwgWmhpaGFvIENoZW5nIHdyb3RlOgo+Pgo+PiBUZXN0ZWQt
Ynk6IFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+ICMgRm9yIHhmc3Rlc3Rz
Cj4gCj4gVGhhbmsgeW91IGZvciB0ZXN0aW5nIQo+IAo+Pj4KPj4+IGRpZmYgLS1naXQgYS9mcy91
Ymlmcy9jb21wcmVzcy5jIGIvZnMvdWJpZnMvY29tcHJlc3MuYwo+Pj4gaW5kZXggYTI0MWJhMDFj
OWE4Li5lYTZmMDZhZGNkNDMgMTAwNjQ0Cj4+PiAtLS0gYS9mcy91Ymlmcy9jb21wcmVzcy5jCj4+
PiArKysgYi9mcy91Ymlmcy9jb21wcmVzcy5jCj4+PiBAQCAtMTYsNiArMTYsNyBAQAo+Pj4gICAg
ICovCj4+PiAgICAjaW5jbHVkZSA8Y3J5cHRvL2Fjb21wcmVzcy5oPgo+Pj4gKyNpbmNsdWRlIDxs
aW51eC9oaWdobWVtLmg+Cj4+PiAgICAjaW5jbHVkZSAidWJpZnMuaCIKPj4+ICAgIC8qIEZha2Ug
ZGVzY3JpcHRpb24gb2JqZWN0IGZvciB0aGUgIm5vbmUiIGNvbXByZXNzb3IgKi8KPj4+IEBAIC0x
MjYsNyArMTI3LDcgQEAgdm9pZCB1Ymlmc19jb21wcmVzcyhjb25zdCBzdHJ1Y3QgdWJpZnNfaW5m
byAqYywgY29uc3Qgdm9pZCAqaW5fYnVmLAo+Pj4gICAgCXsKPj4+ICAgIAkJQUNPTVBfUkVRVUVT
VF9BTExPQyhyZXEsIGNvbXByLT5jYywgR0ZQX05PRlMgfCBfX0dGUF9OT1dBUk4pOwo+Pj4gLQkJ
YWNvbXBfcmVxdWVzdF9zZXRfc3JjX25vbmRtYShyZXEsIGluX2J1ZiwgaW5fbGVuKTsKPj4+ICsJ
CWFjb21wX3JlcXVlc3Rfc2V0X3NyY19kbWEocmVxLCBpbl9idWYsIGluX2xlbik7Cj4+Cj4+IFdo
eSBub3QgbWVyZ2luZyBpdCBpbnRvIHBhdGNoIDEzPwo+IAo+IEJlY2F1c2UgaXQgd2lsbCBicmVh
ayB3aXRob3V0IHRoaXMgcGF0Y2guICBJZiB0aGUgaW5wdXQgaXMgYSBoaWdobWVtCj4gZm9saW8g
aXQgY2Fubm90IGJlIGRpcmVjdGx5IHBhc3NlZCBvdmVyIHRvIERNQSAoYmVjYXVzZSB0aGUgdmly
dHVhbAo+IGFkZHJlc3MgaGFzIGJlZW4gcmVtYXBwZWQgYnkga21hcF9sb2NhbCkuCgpNYWtlcyBz
ZW5zZS4KPiAKPiBDaGVlcnMsCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
