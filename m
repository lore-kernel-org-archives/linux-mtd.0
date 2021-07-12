Return-Path: <SRS0=7PWl=ME=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C389DC07E99
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Jul 2021 13:40:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91B3F60FEA
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Jul 2021 13:40:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91B3F60FEA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tuU5F5zGh9ju47ZfGMEpjL8pxb0tlWurBezp55PVcV8=; b=gZcmcyvqXHfu08oNWMvQYlDYiL
	JvdvCrjxAaWT70J/UNbw+kLedcDIMR+1DWcxC4NTFWF/NKLT7l/5fQRXtT8Nq6YC/Wgf9WmX3j+ta
	k4nMz0FONx/2Hw/aMIYez/uFnIlwjvhItuk0fXUzSqGCWfh7bG+v4v0fR/sezr0sd//h0E9+vXXrQ
	2prh2clIjPYX+cKFfM8ViCtRzol5ZOXtiuZFooNwfFIy6lcDZCkgBlMjPnzdECR1Gltuf9WRhlGz8
	2Zy5NbjfP1LTp4xA6Iy/aL4FPmEYVPLOiEwxYMvzBUNuEiSN7rd5Y+vXCHDTlFkuusW8C1+X/Y4zs
	QveTLqkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2wA9-007Q0z-M9; Mon, 12 Jul 2021 13:39:57 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2wA7-007Q04-9W
 for linux-mtd@lists.infradead.org; Mon, 12 Jul 2021 13:39:57 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GNlD404xszccLx
 for <linux-mtd@lists.infradead.org>; Mon, 12 Jul 2021 21:36:36 +0800 (CST)
Received: from dggema761-chm.china.huawei.com (10.1.198.203) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Mon, 12 Jul 2021 21:39:52 +0800
Received: from [10.174.178.46] (10.174.178.46) by
 dggema761-chm.china.huawei.com (10.1.198.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Mon, 12 Jul 2021 21:39:51 +0800
Subject: Re: [PATCH v2] mtd: mtd_blkdevs: Initialize
 rq.limits.discard_granularity
To: <linux-mtd@lists.infradead.org>
References: <20210615093905.3473709-1-chengzhihao1@huawei.com>
 <20210618095207.0bec4fde@xps13>
 <258a2366-0042-dc2b-0589-fe3a99851ded@huawei.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <ee166ebf-a322-edf9-6d6f-59a4039748bd@huawei.com>
Date: Mon, 12 Jul 2021 21:39:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <258a2366-0042-dc2b-0589-fe3a99851ded@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggema761-chm.china.huawei.com (10.1.198.203)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210712_063955_635127_A5129F76 
X-CRM114-Status: GOOD (  11.74  )
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

5ZyoIDIwMjEvNi8xOCAxNjo1NSwgWmhpaGFvIENoZW5nIOWGmemBkzoKPiDlnKggMjAyMS82LzE4
IDE1OjUyLCBNaXF1ZWwgUmF5bmFsIOWGmemBkzoKPj4gSGkgWmhpaGFvLAo+Pgo+PiBaaGloYW8g
Q2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPiB3cm90ZSBvbiBUdWUsIDE1IEp1biAyMDIx
Cj4+IDE3OjM5OjA1ICswODAwOgo+Pgo+Pj4gU2luY2UgY29tbWl0IGIzNWZkNzQyMmMyZjgoImJs
b2NrOiBjaGVjayBxdWV1ZSdzIAo+Pj4gbGltaXRzLmRpc2NhcmRfZ3JhbnVsYXJpdHkKPj4+IGlu
IF9fYmxrZGV2X2lzc3VlX2Rpc2NhcmQoKSIpIGNoZWNrcyBycS5saW1pdHMuZGlzY2FyZF9ncmFu
dWxhcml0eSBpbgo+Pj4gX19ibGtkZXZfaXNzdWVfZGlzY2FyZCgpLCB3ZSBtYXkgZ2V0IGZvbGxv
d2luZyB3YXJuaW5ncyBvbiBmb3JtYXR0ZWQgCj4+PiBmdGw6Cj4+Pgo+Pj4gwqDCoCBXQVJOSU5H
OiBDUFU6IDIgUElEOiA3MzEzIGF0IGJsb2NrL2Jsay1saWIuYzo1MQo+Pj4gwqDCoCBfX2Jsa2Rl
dl9pc3N1ZV9kaXNjYXJkKzB4MmE3LzB4MzkwCj4+Pgo+Pj4gUmVwcm9kdWNlcjoKPj4+IMKgwqAg
MS4gZnRsX2Zvcm1hdCAvZGV2L210ZDAKPj4+IMKgwqAgMi4gbW9kcHJvYmUgZnRsCj4+PiDCoMKg
IDMuIG1rZnMudmZhdCAvZGV2L2Z0bGEKPj4+IMKgwqAgNC4gbW91bnQgLW9kaXNjYXJkIC9kZXYv
ZnRsYSB0ZW1wCj4+PiDCoMKgIDUuIGRkIGlmPS9kZXYvemVybyBvZj10ZW1wL3RzdCBicz0xTSBj
b3VudD0xMCBvZmxhZz1kaXJlY3QKPj4+IMKgwqAgNi4gZGQgaWY9L2Rldi96ZXJvIG9mPXRlbXAv
dHN0IGJzPTFNIGNvdW50PTEwIG9mbGFnPWRpcmVjdAo+Pj4KPj4+IEZpeCBpdCBieSBpbml0aWFs
aXppbmcgcnEubGltaXRzLmRpc2NhcmRfZ3JhbnVsYXJpdHkgaWYgZGV2aWNlIHN1cHBvcnRzCj4+
PiBkaXNjYXJkIG9wZXJhdGlvbi4KPj4KPj4gQ2FuIHlvdSBwbGVhc2UgdmVyaWZ5IHRoYXQgdGhp
cyBpcyBzdGlsbCBuZWVkZWQgYWZ0ZXIgQ2hyaXN0b3BoJ3MKPj4gYWRkaXRpb25hbCBmaXg6Cj4+
IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC94ZW4tZGV2ZWwvcGF0Y2gvMjAy
MTA2MDIwNjUzNDUuMzU1Mjc0LTEwLWhjaEBsc3QuZGUvIAo+Pgo+Pgo+IEhpLCBNaXF1ZWwsCj4g
SSBjYW4gc3RpbGwgcmVwcm9kdWNlIHRoZSBwcm9ibGVtIGFmdGVyIFsxXSBhcHBsaWVkLgo+IEkg
bG9vayB0aHJvdWdoIHRoaXMgc2VyaWVzIHBhdGNoZXMgYW5kIEkgZGlkbid0IGZpbmQgb3V0IAo+
ICdycS5saW1pdHMuZGlzY2FyZF9ncmFudWxhcml0eScgaGFzIGJlZW4gaW5pdGlhbGl6ZWQgc29t
ZXdoZXJlLiBUaGUgCj4gcGF0Y2hzZXQgaXMgYW1pbmcgYXQgcmVjb25zdHJ1Y3RpbmcgdG8gYXZv
aWQgYm9pbGVycGxhdGUgY29kZSBpbiBkcml2ZXJzPwo+IFNvICdycS5saW1pdHMuZGlzY2FyZF9n
cmFudWxhcml0eScgc3RpbGwgbmVlZCB0byBiZSBpbml0aWFsaXplZCBpbiAKPiBtdGRibG9jayBk
cml2ZXIuCj4KPiBbMV0gCj4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L3hl
bi1kZXZlbC9wYXRjaC8yMDIxMDYwMjA2NTM0NS4zNTUyNzQtMTAtaGNoQGxzdC5kZS8KPgpmcmll
bmRseQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
