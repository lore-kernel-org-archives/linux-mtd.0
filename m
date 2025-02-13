Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD1A5C0219D
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Feb 2025 12:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cJAoqmhNEzGObmAkiZADE/G2onjiNupiIQSFKSB1I08=; b=vlw2MuBVh8DIIG
	CPUOalSlHgXMDQnMKxYyGK2HxkjcpoCz+VFrPkERcMHTUs6Mo6dhK6Ixcvwm/9jiLjc41I6JJCiKX
	A+A972kUq++MiHphVecSKY/MFZB/IGVLJo3dzLamqnbVzn/2wekLV7/ya2HClzdNX/ySqlT70CjfF
	66BuRHgbpPTxqAzAqDSj3eV16jqQSgLGP0nDxjw6idWmls7xaaErTQZnYjWirfu2O4KK9QM4xJTYC
	G7ORhSUVVvovF8ACZbooUTCOlhYmSc6+DR57WS+GPY9Qr8pmyb7J8ndFF8eakuTzlTt/8+ZyDFgch
	xVgkqbBsSTB9QyNVnR4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiYdi-0000000B39K-3LsS;
	Thu, 13 Feb 2025 12:48:22 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiYdf-0000000B36O-10ez
	for linux-mtd@lists.infradead.org;
	Thu, 13 Feb 2025 12:48:21 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 5D08EA028B;
	Thu, 13 Feb 2025 13:48:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=wnnH+LgHr0GyT00gpBnU
	2NYk4v6lgry2f0Q+Wo7iQGI=; b=KdTmqpUgn17Mcr3gPB6ACyAXKHSz+2Ya3F+b
	QFo907EKau31INLrdGCawaDURKewH6eTh2VKTUzvG5eqUkLbWES+wKvhIv6JeMdL
	ZbkhqPDmhOW7UE43PeA5DQzWW14gzbdKkwOBvJliAsyGuVpZjRZyYIa9vnQZ3cJR
	wseHL+4hgZ1C1VupiuT8EKK/eKHThPG3zu9S458K8pfvVEmSdbr3pmKoAs5LRBaw
	VudfbEFJ0VTs3nr8NVemrsfg90vL4ORmFokdy13k4HLgGXCK7hz8cdeDq1FH7hIG
	bBgb4K8FqxF2GE+VgpdTsKcurv/zyql8OpOgQzOK53Ydr7g3WB+K462I7p4GbHf4
	63hn5EztRsWgiGvc88TGs35WG6UTeJN9LAUb5AuQ1FJCS5rjmobiQ9FUTDNPTeMt
	Q7STkjMSlvJGoZoSK+LsDsHOUGFU0Xz27CoDm4PdjMr6M4yIe3fAqPEujjInKwHE
	LKB84KKKlxD3GvbpbXb7jhkc8lzvgU8csTecLQDwxz2LowJprJFATVCbVkwEuB8D
	AIDT3RTTw7XfJZj7VaBnE87PMj4BDMh9RDD0LkXc3HADJae10OPPI1RjsG8d9JsV
	drD8T2AbR9SBkxgQbm86KWzbGnx0oeMyIaJwKIhgkvbRVXtdDADJkJPyeya1+Hlz
	OewROeU=
Message-ID: <fd82bcb1-1c90-4ff1-a9fb-2625b0f11b7d@prolan.hu>
Date: Thu, 13 Feb 2025 13:48:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: sst: Fix SST write failure
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
	<pratyush@kernel.org>, Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
CC: <mwalle@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<vigneshr@ti.com>, <linux-mtd@lists.infradead.org>, <git@amd.com>,
	<amitrkcian2002@gmail.com>
References: <20250213054546.2078121-1-amit.kumar-mahapatra@amd.com>
 <mafs0lduaxp3o.fsf@kernel.org>
 <33f061a1-490e-4378-bd99-89f1af249e78@linaro.org>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <33f061a1-490e-4378-bd99-89f1af249e78@linaro.org>
X-Originating-IP: [10.254.253.7]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D9485261736A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_044819_739600_3323C845 
X-CRM114-Status: UNSURE (   6.99  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksCgpPbiAyMDI1LiAwMi4gMTMuIDk6MDksIFR1ZG9yIEFtYmFydXMgd3JvdGU6Cj4+PiAgIAlu
b3ItPnByb2dyYW1fb3Bjb2RlID0gb3A7Cj4+PiAtCXJldCA9IHNwaV9ub3Jfd3JpdGVfZGF0YShu
b3IsIHRvLCAxLCBidWYpOwo+Pj4gKwlyZXQgPSBzcGlfbm9yX3dyaXRlX2RhdGEobm9yLCB0bywg
bGVuLCBidWYpOwo+Pgo+PiBXaGF0IGEgc2lsbHkgYnVnISBUaGFua3MgZm9yIGZpeGluZyBpdC4g
SSB3aWxsIGxldCB0aGUgcGF0Y2ggc2l0IG9uIHRoZQo+PiBsaXN0IGZvciBhIGNvdXBsZSBkYXlz
IHRvIGdldCBzb21lIGV5ZXMgb24gaXQgYW5kIHRoZW4gd2lsbCBhcHBseSBpdC4KPiAKPiBMb29r
cyBnb29kLiBOZWVkcyBDYyB0byBzdGFibGUsIGl0IHdhcyBpbnRyb2R1Y2VkIGluIHY2LjEyLCBh
bmQgd2UgY2FuCj4gZ2V0IGl0IGFzIGZpeGVzIGZvciB2Ni4xNC4gV2l0aCBjYyB0byBzdGFibGU6
Cj4gCj4gUmV2aWV3ZWQtYnk6IFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFydXNAbGluYXJvLm9y
Zz4KCkFncmVlZC4gSSdtIHN1cnByaXNlZCBubyBvbmUgcmVwb3J0ZWQgdGhpcyB5ZXQuCgpSZXZp
ZXdlZC1ieTogQmVuY2UgQ3PDs2vDoXMgPGNzb2thcy5iZW5jZUBwcm9sYW4uaHU+Cgo+Pgo+PiBS
ZXZpZXdlZC1ieTogUHJhdHl1c2ggWWFkYXYgPHByYXR5dXNoQGtlcm5lbC5vcmc+Cj4+Cj4+PiAg
IAlpZiAocmV0IDwgMCkKPj4+ICAgCQlyZXR1cm4gcmV0Owo+Pj4gICAJV0FSTihyZXQgIT0gbGVu
LCAiV2hpbGUgd3JpdGluZyAlenUgYnl0ZSB3cml0dGVuICVpIGJ5dGVzXG4iLCBsZW4sIHJldCk7
Cj4+Cj4gCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
