Return-Path: <SRS0=sICc=D2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F05D3C433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Oct 2020 03:07:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 173522224D
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Oct 2020 03:07:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Nw+ab0CK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 173522224D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=F7oAyGiE8XULeh8WML9KvdnwSOnSCdGTPbET590nvK0=; b=Nw+ab0CKWM1UE78XfegBGNfSW
	tIfXhq+hFiq8eyQU+5EpPiVGab2bKeYURWgAawgE+gUNpPKQxFme87xsm4Q5YbEDUKDP66nyCOSBV
	qKlHMamcwgyyHxR/3QEFwCrkD97SJN1vLFpV+fy7KgGGgliTq0FQoDNEndXsBujPHCzBEFZNl2HOo
	eqTDOr69Bv8vcMH+IbEcX1sbjdZsb+KFRWHsSjF6B93dswz/iVqpSSAViftOiRvbQDNWqeG51E36r
	VSO1dUL4y2HlWJL/JFDmmHaDg7XMk9UhlZ5jCCpSre+sv/wY/bkU2FVdIHhzwKNbjTiIr3GFHpAqC
	wOYC+ettw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kULVF-0001fi-Sh; Mon, 19 Oct 2020 03:06:29 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kULVC-0001ey-1u
 for linux-mtd@lists.infradead.org; Mon, 19 Oct 2020 03:06:27 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 065D65D84146CC2E6BB0;
 Mon, 19 Oct 2020 11:06:07 +0800 (CST)
Received: from [10.174.176.185] (10.174.176.185) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.487.0; Mon, 19 Oct 2020 11:05:59 +0800
Subject: Re: [PATCH RFC 0/5] ubifs: Prevent memory oob accessing while dumping
 node
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20200616071146.2607061-1-chengzhihao1@huawei.com>
Message-ID: <f22055d4-47c8-d83d-f650-6fd82ce54a29@huawei.com>
Date: Mon, 19 Oct 2020 11:05:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200616071146.2607061-1-chengzhihao1@huawei.com>
X-Originating-IP: [10.174.176.185]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201018_230626_345553_B29DBDDC 
X-CRM114-Status: GOOD (  17.54  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: richard@nod.at, liu.song11@zte.com.cn, yi.zhang@huawei.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="gbk"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

1NogMjAyMC82LzE2IDE1OjExLCBaaGloYW8gQ2hlbmcg0LS1wDoKPiBXZSB1c2UgZnVuY3Rpb24g
dWJpZnNfZHVtcF9ub2RlKCkgdG8gZHVtcCBiYWQgbm9kZSBjYXVzZWQgYnkgc29tZQo+IHJlYXNv
bnMgKFN1Y2ggYXMgYml0IGZsaXBwaW5nIGNhdXNlZCBieSBoYXJkd2FyZSBlcnJvciwgd3JpdGlu
ZyBieXBhc3MKPiB1YmlmcyBvciB1bmtub3duIGJ1Z3MgaW4gdWJpZnMpLiBUaGUgbm9kZSBjb250
ZW50IGNhbiBub3QgYmUgdHJ1c3RlZAo+IGFueW1vcmUsIHNvIHdlIHNob3VsZCBwcmV2ZW50IG1l
bW9yeSBvdXQtb2YtYm91bmRzIGFjY2Vzc2luZyB3aGlsZQo+IGR1bXBpbmcgbm9kZSBpbiBmb2xs
b3dpbmcgc2l0dWF0aW9uczoKPiAKPiAxLiBiYWQgbm9kZV9sZW46IER1bXBpbmcgZGF0YSBhY2Nv
cmRpbmcgdG8gJ2NoLT5sZW4nIHdoaWNoIG1heSBleGNlZWQKPiAgICAgdGhlIHNpemUgb2YgbWVt
b3J5IGFsbG9jYXRlZCBmb3Igbm9kZS4KPiAyLiBiYWQgbm9kZSBjb250ZW50OiBTb21lIGtpbmRz
IG9mIG5vZGUgY2FuIHJlY29yZCBhZGRpdGlvbmFsIGRhdGEsIGVnLgo+ICAgICBpbmRleCBub2Rl
IGFuZCBvcnBoYW4gbm9kZSwgbWFrZSBzdXJlIHRoZSBzaXplIG9mIGFkZGl0aW9uYWwgZGF0YQo+
ICAgICBub3QgYmV5b25kIHRoZSBub2RlIGxlbmd0aC4KPiAzLiBub2RlX3R5cGUgY2hhbmdlczog
UmVhZCBkYXRhIGFjY29yZGluZyB0byB0eXBlIEEsIGJ1dCBleHBlY3RlZCB0eXBlCj4gICAgIEIs
IGJlZm9yZSB0aGF0LCBub2RlIGlzIGFsbG9jYXRlZCBhY2NvcmRpbmcgdG8gdHlwZSBCJ3Mgc2l6
ZS4gTGVuZ3RoCj4gICAgIG9mIHR5cGUgQSBub2RlIGlzIGdyZWF0ZXIgdGhhbiB0eXBlIEIgbm9k
ZS4KPiAKPiBDb21taXQgYWNjNWFmM2VmYTMwM2Q1ZjMgKCJ1YmlmczogRml4IG91dC1vZi1ib3Vu
ZHMgbWVtb3J5IGFjY2VzcyBjYXVzZWQKPiBieSBhYm5vcm1hbCB2YWx1ZSBvZiBub2RlX2xlbiIp
IGhhbmRsZXMgc2l0dWF0aW9uIDEgZm9yIGRhdGEgbm9kZSBvbmx5LAo+IGl0IHdvdWxkIGJlIGJl
dHRlciBpZiB3ZSBjYW4gc29sdmUgcHJvYmxlbXMgaW4gYWJvdmUgc2l0dWF0aW9ucyBmb3IgYWxs
Cj4ga2luZHMgb2Ygbm9kZXMuCj4gCj4gUGF0Y2ggMSBhZGRzIGEgbmV3IHBhcmFtZXRlciAnbm9k
ZV9sZW4nKHNpemUgb2YgbWVtb3J5IHdoaWNoIGlzIGFsbG9jYXRlZAo+IGZvciB0aGUgbm9kZSkg
aW4gZnVuY3Rpb24gdWJpZnNfZHVtcF9ub2RlKCksIHNhZmUgZHVtcGluZyBsZW5ndGggb2YgdGhl
Cj4gbm9kZSBzaG91bGQgYmU6IG1pbmltdW0oY2gtPmxlbiwgYy0+cmFuZ2VzW25vZGVfdHlwZV0u
bWF4X2xlbiwgbm9kZV9sZW4pLgo+IEJlc2lkZXMsIGMtPnJhbmdlc1tub2RlX3R5cGVdLm1pbl9s
ZW4gY2FuIG5vdCBncmVhdGVyIHRoYW4gc2FmZSBkdW1waW5nCj4gbGVuZ3RoLCB3aGljaCBtYXkg
Y2F1c2VkIGJ5IG5vZGVfdHlwZSBjaGFuZ2VzKHNpdHVhdGlvbiAzKS4KPiAKPiBQYXRjaCAyIHJl
dmVydHMgY29tbWl0IGFjYzVhZjNlZmEzMDNkNWYgKCJ1YmlmczogRml4IG91dC1vZi1ib3VuZHMg
bWVtb3J5Cj4gYWNjZXNzIGNhdXNlZCBieSBhYm5vcm1hbCB2YWx1ZSBvZiBub2RlX2xlbiIpIHRv
IHByZXBhcmUgZm9yIHBhdGNoIDMuCj4gCj4gUGF0Y2ggMyByZXBsYWNlcyBtb2RpZmllZCBmdW5j
dGlvbiB1Ymlmc19kdW1wX25vZGUoKSBpbiBhbGwgbm9kZSBkdW1waW5nCj4gcGxhY2VzIGV4Y2Vw
dCBmb3IgdWJpZnNfZHVtcF9zbGViKCkuCj4gCj4gUGF0Y2ggNCByZW1vdmVzIHVudXNlZCBmdW5j
dGlvbiB1Ymlmc19kdW1wX3NsZWIoKSwKPiAKPiBQYXRjaCA1IGFsbG93cyB1Ymlmc19kdW1wX25v
ZGUoKSB0byBkdW1wIGFsbCBicmFuY2hlcyBvZiB0aGUgaW5kZXggbm9kZS4KPiAKPiBTb21lIHRl
c3RzIGFmdGVyIHBhdGNoc2V0IGFwcGxpZWQ6Cj4gaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3Jn
L3Nob3dfYnVnLmNnaT9pZD0yMDgyMDMKPiAKPiBaaGloYW8gQ2hlbmcgKDUpOgo+ICAgIHViaWZz
OiBMaW1pdCBkdW1waW5nIGxlbmd0aCBieSBzaXplIG9mIG1lbW9yeSB3aGljaCBpcyBhbGxvY2F0
ZWQgZm9yCj4gICAgICB0aGUgbm9kZQo+ICAgIFJldmVydCAidWJpZnM6IEZpeCBvdXQtb2YtYm91
bmRzIG1lbW9yeSBhY2Nlc3MgY2F1c2VkIGJ5IGFibm9ybWFsCj4gICAgICB2YWx1ZSBvZiBub2Rl
X2xlbiIKPiAgICB1YmlmczogUGFzcyBub2RlIGxlbmd0aCBpbiBhbGwgbm9kZSBkdW1waW5nIGNh
bGxlcnMKPiAgICB1YmlmczogdWJpZnNfZHVtcF9zbGViOiBSZW1vdmUgdW51c2VkIGZ1bmN0aW9u
Cj4gICAgdWJpZnM6IHViaWZzX2R1bXBfbm9kZTogRHVtcCBhbGwgYnJhbmNoZXMgb2YgdGhlIGlu
ZGV4IG5vZGUKPiAKPiAgIGZzL3ViaWZzL2NvbW1pdC5jICAgfCAgIDQgKy0KPiAgIGZzL3ViaWZz
L2RlYnVnLmMgICAgfCAxMTEgKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0t
LS0tLS0KPiAgIGZzL3ViaWZzL2RlYnVnLmggICAgfCAgIDUgKy0KPiAgIGZzL3ViaWZzL2ZpbGUu
YyAgICAgfCAgIDIgKy0KPiAgIGZzL3ViaWZzL2lvLmMgICAgICAgfCAgMzcgKysrKystLS0tLS0t
LS0tCj4gICBmcy91Ymlmcy9qb3VybmFsLmMgIHwgICAzICstCj4gICBmcy91Ymlmcy9tYXN0ZXIu
YyAgIHwgICA0ICstCj4gICBmcy91Ymlmcy9vcnBoYW4uYyAgIHwgICA2ICsrLQo+ICAgZnMvdWJp
ZnMvcmVjb3ZlcnkuYyB8ICAgNiArLS0KPiAgIGZzL3ViaWZzL3JlcGxheS5jICAgfCAgIDQgKy0K
PiAgIGZzL3ViaWZzL3NiLmMgICAgICAgfCAgIDIgKy0KPiAgIGZzL3ViaWZzL3NjYW4uYyAgICAg
fCAgIDQgKy0KPiAgIGZzL3ViaWZzL3N1cGVyLmMgICAgfCAgIDIgKy0KPiAgIGZzL3ViaWZzL3Ru
Yy5jICAgICAgfCAgIDggKystLQo+ICAgZnMvdWJpZnMvdG5jX21pc2MuYyB8ICAgNCArLQo+ICAg
ZnMvdWJpZnMvdWJpZnMuaCAgICB8ICAgNCArLQo+ICAgMTYgZmlsZXMgY2hhbmdlZCwgMTA4IGlu
c2VydGlvbnMoKyksIDk4IGRlbGV0aW9ucygtKQo+IApwaW5nLCBhbHRob3VnaCBpdCBpcyBub3Qg
YSBzZXJpb3VzIHByb2JsZW0gZm9yIHViaWZzLCBidXQgZHVtcGluZyBleHRyYSAKbWVtb3J5IGJ5
IGZvcm1hdGluZyBzcGVjaWZpZWQgdWJpZnMgaW1nIG1heSBjYXVzZSBzZWN1cml0eSBwcm9ibGVt
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
