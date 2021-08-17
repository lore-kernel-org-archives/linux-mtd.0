Return-Path: <SRS0=LBUh=NI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A560C4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 03:17:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A394360F41
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 03:17:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A394360F41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8IUAb2Cdk6jupz3eIAXwxTaFlhDn98RKVcx6vET6O8Y=; b=pF1nmFxR8HHpw7/G4FQTvkwWHO
	IV1m/Am7sKRF5r9YP4pHBMCn2uxeIxVfJgebbu+9HLpEflCgwIkVE0yIDUhPwbREhUVrCE20lcOge
	cSg0qXDEii0qqvnE7EU+5fnGS25rSGxUNwzEyk38swnTYaRqkm4Dt2eQWY1eK8UJoSYw0J9f/IgWV
	uHel2o6Iu23z/EjBEAP+53olX1qOn1xjLB4UWFviwX6CD6NH9n8Z0PWEpQJIWBVkyijHVNHoX9D4w
	1AEibIPDLPnV3sRIOui/kRkZMNyVDEozxe3HEzZObTShTgEYKaOLtXL2IRoYFhBOvUww1yL1ppyY5
	eHovRoXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFpav-000v8M-HZ; Tue, 17 Aug 2021 03:16:53 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFp71-000rF7-4u
 for linux-mtd@lists.infradead.org; Tue, 17 Aug 2021 02:46:06 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Gpb4G0HlRz1CXd5;
 Tue, 17 Aug 2021 10:45:34 +0800 (CST)
Received: from dggema761-chm.china.huawei.com (10.1.198.203) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Tue, 17 Aug 2021 10:45:56 +0800
Received: from [10.174.178.46] (10.174.178.46) by
 dggema761-chm.china.huawei.com (10.1.198.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 17 Aug 2021 10:45:55 +0800
Subject: Re: [PATCH v2] mtd: mtdconcat: Check existence of _read|_write from
 subdev'master device before assigning
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <bbrezillon@kernel.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <yukuai3@huawei.com>, <sfr@canb.auug.org.au>
References: <20210817024552.1691649-1-chengzhihao1@huawei.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <8b315831-84c5-38f3-d3b7-bb53f52c28b8@huawei.com>
Date: Tue, 17 Aug 2021 10:45:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20210817024552.1691649-1-chengzhihao1@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggema761-chm.china.huawei.com (10.1.198.203)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_194559_431960_5CFF28FD 
X-CRM114-Status: GOOD (  14.59  )
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

1NogMjAyMS84LzE3IDEwOjQ1LCBaaGloYW8gQ2hlbmcg0LS1wDoKSGkgTWlxdWVsLApJIGZvdW5k
IGEgYmV0dGVyIHdheSB0byBmaXggdGhlICJXQVJOSU5HIiBvbiBfcmVhZHxfcmVhZF9vb2IgY2hl
Y2tpbmcuIApTaW5jZSBzdWItbXRkIGRldmljZSBoYXMgYmVlbiByZWdpc3RlcmVkIHN1Y2Nlc3Nm
dWxseSwgd2UgY2FuIGNoZWNrIAphZ2FpbnN0IHRoZSBleGlzdGVuY2Ugb2YgX3JlYWR8X3JlYWRf
b29iIGNhbGxiYWNrcyBieSBzdWJkZXYncyBtYXN0ZXIgCmRldmljZS4KQlRXLCBmaXggbWlzc2lu
ZyBzcGFjZSBiZXR3ZWVuIHRoZSBTSEExIGFuZCB0aGUgc3ViamVjdCBzdWdnZXN0ZWQgYnkgClN0
ZXBoZW4uCj4gU2luY2UgMjQzMWM0ZjViNDZjMyAoIm10ZDogSW1wbGVtZW50IG10ZF97cmVhZCx3
cml0ZX0oKSBhcyB3cmFwcGVycwo+IGFyb3VuZCBtdGRfe3JlYWQsd3JpdGV9X29vYigpIikgZG9u
J3QgYWxsb3cgX3dyaXRlfF9yZWFkIGFuZAo+IF93cml0ZV9vb2J8X3JlYWRfb29iIGV4aXN0aW5n
IGF0IHRoZSBzYW1lIHRpbWUuIFdlIHNob3VsZCBjaGVjayB0aGUKPiBleGlzdGVuY2Ugb2YgY2Fs
bGJhY2tzICJfcmVhZCBhbmQgX3dyaXRlIiBmcm9tIHN1YmRldidzIG1hc3RlciBkZXZpY2UKPiAo
V2UgY2FuIHRydXN0IG1hc3RlciBkZXZpY2Ugc2luY2UgaXQgaGFzIGJlZW4gcmVnaXN0ZXJlZCkg
YmVmb3JlCj4gYXNzaWduaW5nLCBvdGhlcndpc2UgZm9sbG93aW5nIHdhcm5pbmcgb2NjdXJzIHdo
aWxlIG1ha2luZwo+IGNvbmNhdGVuYXRlZCBkZXZpY2U6Cj4KPiAgICBXQVJOSU5HOiBDUFU6IDIg
UElEOiA2NzI4IGF0IGRyaXZlcnMvbXRkL210ZGNvcmUuYzo1OTUKPiAgICBhZGRfbXRkX2Rldmlj
ZSsweDdmLzB4N2IwCj4KPiBGaXhlczogMjQzMWM0ZjViNDZjMyAoIm10ZDogSW1wbGVtZW50IG10
ZF97cmVhZCx3cml0ZX0oKSBhcm91bmQgLi4uIikKPiBTaWduZWQtb2ZmLWJ5OiBaaGloYW8gQ2hl
bmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9tdGQvbXRkY29u
Y2F0LmMgfCA2ICsrKystLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9tdGRjb25jYXQuYyBiL2Ry
aXZlcnMvbXRkL210ZGNvbmNhdC5jCj4gaW5kZXggYWY1MWVlZTZiNWU4Li5mNjg1YTU4MWRmNDgg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbXRkY29uY2F0LmMKPiArKysgYi9kcml2ZXJzL210
ZC9tdGRjb25jYXQuYwo+IEBAIC02OTQsNiArNjk0LDEwIEBAIHN0cnVjdCBtdGRfaW5mbyAqbXRk
X2NvbmNhdF9jcmVhdGUoc3RydWN0IG10ZF9pbmZvICpzdWJkZXZbXSwJLyogc3ViZGV2aWNlcyB0
byBjCj4gICAJCWNvbmNhdC0+bXRkLl9ibG9ja19tYXJrYmFkID0gY29uY2F0X2Jsb2NrX21hcmti
YWQ7Cj4gICAJaWYgKHN1YmRldl9tYXN0ZXItPl9wYW5pY193cml0ZSkKPiAgIAkJY29uY2F0LT5t
dGQuX3BhbmljX3dyaXRlID0gY29uY2F0X3BhbmljX3dyaXRlOwo+ICsJaWYgKHN1YmRldl9tYXN0
ZXItPl9yZWFkKQo+ICsJCWNvbmNhdC0+bXRkLl9yZWFkID0gY29uY2F0X3JlYWQ7Cj4gKwlpZiAo
c3ViZGV2X21hc3Rlci0+X3dyaXRlKQo+ICsJCWNvbmNhdC0+bXRkLl93cml0ZSA9IGNvbmNhdF93
cml0ZTsKPiAgIAo+ICAgCWNvbmNhdC0+bXRkLmVjY19zdGF0cy5iYWRibG9ja3MgPSBzdWJkZXZb
MF0tPmVjY19zdGF0cy5iYWRibG9ja3M7Cj4gICAKPiBAQCAtNzU1LDggKzc1OSw2IEBAIHN0cnVj
dCBtdGRfaW5mbyAqbXRkX2NvbmNhdF9jcmVhdGUoc3RydWN0IG10ZF9pbmZvICpzdWJkZXZbXSwJ
Lyogc3ViZGV2aWNlcyB0byBjCj4gICAJY29uY2F0LT5tdGQubmFtZSA9IG5hbWU7Cj4gICAKPiAg
IAljb25jYXQtPm10ZC5fZXJhc2UgPSBjb25jYXRfZXJhc2U7Cj4gLQljb25jYXQtPm10ZC5fcmVh
ZCA9IGNvbmNhdF9yZWFkOwo+IC0JY29uY2F0LT5tdGQuX3dyaXRlID0gY29uY2F0X3dyaXRlOwo+
ICAgCWNvbmNhdC0+bXRkLl9zeW5jID0gY29uY2F0X3N5bmM7Cj4gICAJY29uY2F0LT5tdGQuX2xv
Y2sgPSBjb25jYXRfbG9jazsKPiAgIAljb25jYXQtPm10ZC5fdW5sb2NrID0gY29uY2F0X3VubG9j
azsKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
