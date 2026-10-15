Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26041CC6B3A
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2026 11:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m25dhZ125pkUGjgwaWXB/IkoWd17Qm6eNsY9Vjw15do=; b=3Hy4tyseHfxg2zBJqGRfe3x4iO
	ANcebQupJUKheqwhAv+N/8Jlkwt6mUVT6KU81k72xYXxXEhFZ9IkG705ps0ltTRaCwuHWvp7s11D/
	lQAVjP1YBgztPbIPaxyPjgWBtrTNxLDfHIAekYIyahn5twsrKomWicImi5dDDXT4jIKazZiql4Fgm
	wxxSNQq0a2j0lAW//scQnaLeR0N6rp45UWRrrZAsdPCuaqSopZ6eYOjCFrbEM8J3nEWlD+w3TB/BF
	UbhjN4kXViHfdbXIlUBPGUic0TZUTg80ULjZ8bUpez/LPu3oa6POgOwP862kxc9DiRhmMYSFJr5J/
	wQkymyag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHJFl-0000000HWR2-1mmc;
	Thu, 15 Oct 2026 11:04:05 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHJFh-0000000HWMh-2Ava
	for linux-mtd@lists.infradead.org;
	Thu, 15 Oct 2026 11:04:04 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=nc+mRntCZbE6AaA9IRRfmZusSjKwibC4JVgRA7v5cw0=;
	b=sOP1bESzum+fry0YPsCauk+npmZYNyrGXuCvxH0gbyONkpGTKvinhviCgDkLEMrZ1FDgRl4zk
	Typ26sOMTPAsrgkuKcCDfCFYsf2QnaCsXSiBDzj5GtN9R2gIpm5utlEnGxpfgzXFR81jZhl0U+Q
	CuSc4mZ2gVWEmurdzRBZqRs=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4j54cc3QrqzpT0F;
	Thu, 15 Oct 2026 18:51:12 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id 9441F202E6;
	Thu, 15 Oct 2026 19:03:49 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 whupemo200011.china.huawei.com (7.152.185.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 15 Oct 2026 19:03:48 +0800
Subject: Re: [PATCH 2/2] mtd: ubi: use GFP_NOIO for lock tree entry allocation
To: Yelin Fei <yelinfei66@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
	<linux-kernel@vger.kernel.org>
References: <cover.1792046946.git.yelinfei@ruijie.com.cn>
 <8b4e0b970271095df8321b1662aa464c5b9002dc.1792046946.git.yelinfei@ruijie.com.cn>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <f89c80cb-d879-ede2-9459-1778ff2f71c2@huawei.com>
Date: Thu, 15 Oct 2026 19:03:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <8b4e0b970271095df8321b1662aa464c5b9002dc.1792046946.git.yelinfei@ruijie.com.cn>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 whupemo200011.china.huawei.com (7.152.185.179)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_040402_030725_AC4285A7 
X-CRM114-Status: GOOD (  18.28  )
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

1NogMjAyNi8xMC8xNSAxNTozMywgWWVsaW4gRmVpINC0tcA6Cj4gRnJvbTogWWUgTGluZmVpIDx5
ZWxpbmZlaUBydWlqaWUuY29tLmNuPgo+IAo+IFRoZSBwZXItTEVCIGxvY2sgdHJlZSBlbnRyeSBj
YW4gYmUgYWxsb2NhdGVkIHdoaWxlIFVCSSBpcyBleGVjdXRpbmcgb24KPiBiZWhhbGYgb2YgYSBz
eW5jaHJvbm91cyBibG9jay1sYXllciBjb25zdW1lciAodWJpYmxvY2spLCB3aGVyZSBpc3N1aW5n
Cj4gZnVydGhlciBibG9jayBJL08gZnJvbSBkaXJlY3QgcmVjbGFpbSB3b3VsZCBkZWFkbG9jazsg
c2VlIHRoZQo+IHByZWNlZGluZyBjb21taXQgIm10ZDogdWJpOiBibG9jazogZm9yYmlkIGRpcmVj
dCByZWNsYWltIEkvTyBkdXJpbmcKPiBzeW5jaHJvbm91cyByZWFkIiBmb3IgdGhlIGZ1bGwgYW5h
bHlzaXMuCj4gCj4gTWFrZSB0aGUgYWxsb2NhdGlvbiBzZWxmLWNvbnRhaW5lZDogR0ZQX05PSU8g
cmVzdHJpY3RzIGRpcmVjdCByZWNsYWltCj4gdG8gZHJvcHBpbmcgY2xlYW4gcGFnZSBjYWNoZSBh
bmQgc2hyaW5raW5nIHNsYWJzLCBwYWdlIChzd2FwKSByZWNsYWltCj4gaXMgbGVmdCB0byBrc3dh
cGQsIGFuZCB0aGUgd29yc3QgY2FzZSBpcyAtRU5PTUVNLCB3aGljaCBjYWxsZXJzCj4gYWxyZWFk
eSBwcm9wYWdhdGUgYXMgYW4gb3JkaW5hcnkgcmVjb3ZlcmFibGUgSS9PIGVycm9yLgo+IAo+IG1l
bWFsbG9jX25vaW9fc2F2ZSgpL21lbWFsbG9jX25vaW9fcmVzdG9yZSgpIGluIHViaWJsb2NrX3Jl
YWQoKQo+IGFscmVhZHkgZW5mb3JjZSB0aGlzIGZvciB0aGUgd2hvbGUgcmVhZCBzY29wZTsga2Vl
cGluZyB0aGUgYWxsb2NhdGlvbgo+IGhlcmUgc2VsZi1jb250YWluZWQgYXMgd2VsbCBtZWFucyB0
aGUgc2FmZXR5IHByb3BlcnR5IGRvZXMgbm90IGRlcGVuZAo+IG9uIGV2ZXJ5IGZ1dHVyZSBjYWxs
ZXIgcmVtZW1iZXJpbmcgdG8gc2V0IHVwIHRoYXQgc2NvcGUuCgpUaGUgbHRyZWVfYWRkX2VudHJ5
KCkgaGFzIG1hbnkgY2FsbGVycyB0aGF0IG5vdCBuZWVkIEdGUF9OT0lPLCBJIHRoaW5rIAonbXRk
OiB1Ymk6IGJsb2NrOiBmb3JiaWQgZGlyZWN0IHJlY2xhaW0gSS9PIGR1cmluZwogPiBzeW5jaHJv
bm91cyByZWFkJyBpcyBlbm91Z2guCj4gCj4gU2lnbmVkLW9mZi1ieTogWWUgTGluZmVpIDx5ZWxp
bmZlaUBydWlqaWUuY29tLmNuPgo+IC0tLQo+ICAgZHJpdmVycy9tdGQvdWJpL2ViYS5jIHwgMiAr
LQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3ViaS9lYmEuYyBiL2RyaXZlcnMvbXRkL3ViaS9lYmEu
Ywo+IGluZGV4IGYwYzU0OWU2MmM1NS4uOGZlNjhlN2ZmZjU4IDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvbXRkL3ViaS9lYmEuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL3ViaS9lYmEuYwo+IEBAIC0yNDcs
NyArMjQ3LDcgQEAgc3RhdGljIHN0cnVjdCB1YmlfbHRyZWVfZW50cnkgKmx0cmVlX2FkZF9lbnRy
eShzdHJ1Y3QgdWJpX2RldmljZSAqdWJpLAo+ICAgewo+ICAgCXN0cnVjdCB1YmlfbHRyZWVfZW50
cnkgKmxlLCAqbGUxLCAqbGVfZnJlZTsKPiAgIAo+IC0JbGUgPSBrbWFsbG9jX29iaihzdHJ1Y3Qg
dWJpX2x0cmVlX2VudHJ5LCBHRlBfTk9GUyk7Cj4gKwlsZSA9IGttYWxsb2Nfb2JqKHN0cnVjdCB1
YmlfbHRyZWVfZW50cnksIEdGUF9OT0lPKTsgLyogc2VlIHViaWJsb2NrX3JlYWQoKSAqLwo+ICAg
CWlmICghbGUpCj4gICAJCXJldHVybiBFUlJfUFRSKC1FTk9NRU0pOwo+ICAgCj4gCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
