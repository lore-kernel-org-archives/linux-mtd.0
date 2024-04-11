Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24ED0CD11C2
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Apr 2024 02:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8qx0xv5+foGl3UFDnl1N6ONYp+26jwhiXBWrOEXrLRk=; b=JQPm2cw5pJ1w7UuBQyCnBHStG/
	Bhnk2vrvazB6Xl1MWFUrXEwZVJ5ZdzW4f3TwHPEFXS3q7GmZBH4K/Z/nAtUnOvpij0wSyFuI9FRSx
	McUs9i+OLvokF6oLNICmU45GOp/6m7Lfc6kNP+Hs2/TzrxPRAR1wLvgGVHu6tloaZLCpIE7FoaKl7
	0lJmBhzR1pzMEkLuSoY2Khs2RSYtppdXZjGERoGfR+veTTk30O94h2pCzE4Gpxqsh3pMpMvyAzzc8
	MiMIH1eENlKtkf3Qsrfh50+r0sgXiQ5MiY8D9Mv8k6B844CLOv8cCLg0Td/SEbrc9PQHng9jFN6RM
	mrFkSQzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rukM3-0000000A0zk-1JGg;
	Thu, 11 Apr 2024 02:39:59 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rukM0-0000000A0yc-0Asa
	for linux-mtd@lists.infradead.org;
	Thu, 11 Apr 2024 02:39:58 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4VFP3T39Y7z29dPS;
	Thu, 11 Apr 2024 10:36:53 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id E3D241A0172;
	Thu, 11 Apr 2024 10:39:45 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 11 Apr 2024 10:39:45 +0800
Subject: Re: [PATCH 2/2] ubi: ubi_init: Fix missed ubiblock cleanup in error
 handling path
To: Daniel Golle <daniel@makrotopia.org>
CC: <richard@nod.at>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20240410074033.2523399-1-chengzhihao1@huawei.com>
 <20240410074033.2523399-3-chengzhihao1@huawei.com>
 <Zhccfw4HbC_MKj65@makrotopia.org>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <5d858fbc-11cb-8d02-a4b6-a640625c7e1d@huawei.com>
Date: Thu, 11 Apr 2024 10:39:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <Zhccfw4HbC_MKj65@makrotopia.org>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_193956_316641_DA5671B9 
X-CRM114-Status: GOOD (  20.20  )
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

1NogMjAyNC80LzExIDc6MTAsIERhbmllbCBHb2xsZSDQtLXAOgo+IEhpIQo+IAo+IE9uIFdlZCwg
QXByIDEwLCAyMDI0IGF0IDAzOjQwOjMzUE0gKzA4MDAsIFpoaWhhbyBDaGVuZyB3cm90ZToKPj4g
VGhlIHViaWJsb2NrX2luaXQgY2FsbGVkIGJ5IHViaV9pbml0IHdpbGwgcmVnaXN0ZXIgZGV2aWNl
IG51bWJlciwgYnV0Cj4+IGRldmljZSBudW1iZXIgaXMgbm90IHJlbGVhc2VkIGluIGVycm9yIGhh
bmRsaW5nIHBhdGggb2YgdWJpX2luaXQgd2hlbgo+PiB1YmkgaXMgbG9hZGVkIGJ5IGluc2VydGlu
ZyBtb2R1bGUgKGVnLiBhdHRhY2hpbmcgZmFpbHVyZSksIHdoaWNoIGxlYWRzCj4+IHRvIHN1YnNl
cXVlbnQgdWJpX2luaXQgY2FsbHMgZmFpbGVkIGJ5IHJ1bm5pbmcgb3V0IG9mIGRldmljZSBudW1i
ZXIKPj4gKGRtZXNnIHNob3dzIHRoYXQgIl9fcmVnaXN0ZXJfYmxrZGV2OiBmYWlsZWQgdG8gZ2V0
IG1ham9yIGZvciB1YmlibG9jayIpLgo+PiBGaXggaXQgYnkgaW52b2tpbmcgdWJpYmxvY2tfZXhp
dCgpIGluIGNvcnJlc3BvbmRpbmcgZXJyb3IgaGFuZGxpbmcgcGF0aC4KPiAKPiBUaGFuayB5b3Ug
Zm9yIHRha2luZyBjYXJlIG9mIHRoaXMgaXNzdWUuCj4gCj4gU2VlIG15IGNvbW1lbnQgaW5saW5l
IGJlbG93Ogo+IAo+Pgo+PiBGaXhlczogOTI3YzE0NTIwOGIwICgibXRkOiB1Ymk6IGF0dGFjaCBm
cm9tIGRldmljZSB0cmVlIikKPj4gU2lnbmVkLW9mZi1ieTogWmhpaGFvIENoZW5nIDxjaGVuZ3po
aWhhbzFAaHVhd2VpLmNvbT4KPj4gLS0tCj4+ICAgZHJpdmVycy9tdGQvdWJpL2J1aWxkLmMgfCA1
ICsrKy0tCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3ViaS9idWlsZC5jIGIvZHJpdmVycy9t
dGQvdWJpL2J1aWxkLmMKPj4gaW5kZXggN2Y5NWZkNzk2OGE4Li4zNTQ1MTcxOTQwOTkgMTAwNjQ0
Cj4+IC0tLSBhL2RyaXZlcnMvbXRkL3ViaS9idWlsZC5jCj4+ICsrKyBiL2RyaXZlcnMvbXRkL3Vi
aS9idWlsZC5jCj4+IEBAIC0xMzgwLDEyICsxMzgwLDEzIEBAIHN0YXRpYyBpbnQgX19pbml0IHVi
aV9pbml0KHZvaWQpCj4+ICAgCWlmICh1YmlfaXNfbW9kdWxlKCkpIHsKPj4gICAJCWVyciA9IHVi
aV9pbml0X2F0dGFjaCgpOwo+PiAgIAkJaWYgKGVycikKPj4gLQkJCWdvdG8gb3V0X210ZF9ub3Rp
ZmllcjsKPj4gKwkJCWdvdG8gb3V0X2Jsb2NrX2V4aXQ7Cj4+ICAgCX0KPj4gICAKPj4gICAJcmV0
dXJuIDA7Cj4+ICAgCj4+IC1vdXRfbXRkX25vdGlmaWVyOgo+PiArb3V0X2Jsb2NrX2V4aXQ6Cj4+
ICsJdWJpYmxvY2tfZXhpdCgpOwo+IAo+IEkgYmVsaWV2ZSB0aGF0IHRoaXMgY2FsbCBpcyB0aGUg
cmVhc29uIGZvciB0aGUgc2VjdGlvbiBtaXNtYXRjaCB3ZQo+IGFyZSBzZWVpbmcgb24gSW50ZWwn
cyBrZXJuZWwgdGVzdCBidWlsZHM6Cj4gCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb2Uta2J1
aWxkLWFsbC8yMDI0MDQxMTA2NTYud0xMYzVtSFItbGtwQGludGVsLmNvbS8KPiAKPiBBbHNvIG5v
dGUgdGhhdCBCZW4gSHV0Y2hpbmdzIGhhcyBzdXBwbGllZCBhIG1vcmUgY29tcGxldGUgYW5kIGlt
aG8KPiBiZXR0ZXIgc29sdXRpb24gZm9yIHRoaXMgcHJvYmxlbSwgd2hpY2ggeWV0IHN0aWxsIHN1
ZmZlcnMgZnJvbSB0aGUKPiBzYW1lIHByb2JsZW0gKGNhbGxpbmcgX19leGl0IGZ1bmN0aW9uIGZy
b20gX19pbml0IGZ1bmN0aW9uIHdoaWNoCj4gcmVzdWx0cyBpbiBzZWN0aW9uIG1pc21hdGNoKS4K
PiAKCk15IG1pc3Rha2UsIEkgYWx3YXlzIGZvcmdldCB0byBjaGVjayBtYWtlIFc9MSwgSSB3aWxs
IHNlbmQgYSBuZXcgdmVyc2lvbiAKdG8gY29tYmluZSBCZW4ncyBtb2RpZmljYXRpb25zLiBUaGFu
a3MgdG8gcG9pbnQgdGhhdC4KPiAKPj4gICAJdW5yZWdpc3Rlcl9tdGRfdXNlcigmdWJpX210ZF9u
b3RpZmllcik7Cj4+ICAgb3V0X2RlYnVnZnM6Cj4+ICAgCXViaV9kZWJ1Z2ZzX2V4aXQoKTsKPj4g
LS0gCj4+IDIuMzkuMgo+Pgo+IC4KPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
