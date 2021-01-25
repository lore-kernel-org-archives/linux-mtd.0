Return-Path: <SRS0=dx8R=G4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F381DC433DB
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Jan 2021 08:37:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7217522AAA
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Jan 2021 08:37:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7217522AAA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Np7Gn12NAvkA5e2HHj9APdlZl3Sx0u6M1mhgUL+Ugxo=; b=nA3krKwZOl5Sqqs65QNKdQeeZ
	17db1Qn83UKCH8bsDtTNTav7buQgn2seIVWWmwOwTH9vGOroY4WlhGcANejfGZ4rZzAuSJGiyFcta
	2vBW1eKNlCb9hyvbVfjKmaZs2w82v2mBNevJnXn1uvACqn4G7mO6qqYuuENqR/DZcNim2SAjQAaVw
	/1ZeRWL9j8rgvDGbCfR8S4MRT4ymPJ+9hAzOnEu/IYMqcqvMBxaUl/HHbkpt4qXzXx/mWn1zSO95A
	mJbmn5AJ0omRxxFKxF37+YcuKgwK3prppgpQygS5T7ufgtghkCqBkr1JqFQLegqLxXuYGA5d3FiEl
	U/LG2Fnrg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3xN0-00028L-Fj; Mon, 25 Jan 2021 08:37:10 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3xMw-00026p-1j
 for linux-mtd@lists.infradead.org; Mon, 25 Jan 2021 08:37:08 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DPNVW0z68z15yYL;
 Mon, 25 Jan 2021 16:35:47 +0800 (CST)
Received: from [10.174.176.235] (10.174.176.235) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.498.0; Mon, 25 Jan 2021 16:36:51 +0800
Subject: Re: [PATCH] mtd: phram: use div_u64_rem to stop overwrite len in
 phram_setup
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <20210104101830.3036-1-miquel.raynal@bootlin.com>
 <01746715-84dc-cd7a-508a-52ba3172e339@huawei.com>
 <20210125092852.504f082f@xps13>
From: yangerkun <yangerkun@huawei.com>
Message-ID: <527f4357-16a6-2561-81c2-20127eabd68c@huawei.com>
Date: Mon, 25 Jan 2021 16:36:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20210125092852.504f082f@xps13>
X-Originating-IP: [10.174.176.235]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_033706_448434_097661C0 
X-CRM114-Status: GOOD (  16.94  )
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
Cc: patrick@baymotion.com, zhongguohua1@huawei.com, joern@lazybastard.org,
 linux-mtd@lists.infradead.org, richard@nod.at
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgrlnKggMjAyMS8xLzI1IDE2OjI4LCBNaXF1ZWwgUmF5bmFsIOWGmemBkzoKPiBIaSB5YW5nZXJr
dW4sCj4gCj4geWFuZ2Vya3VuIDx5YW5nZXJrdW5AaHVhd2VpLmNvbT4gd3JvdGUgb24gTW9uLCAy
NSBKYW4gMjAyMSAxMzo0ODozMgo+ICswODAwOgo+IAo+PiBIaSwKPj4KPj4gUmVjaGVjayB0aGUg
cGF0Y2gsIGFuZCBpdCBzZWVtcyB3ZSBuZWVkIGNoZWNrIGVyYXNlc2l6ZSB0byBwcmV2ZW50IERJ
Vi8wLi4uCj4gCj4gQ2FuIHlvdSBlbGFib3JhdGUgYSBsaXR0bGUgYml0Pwo+IAo+IFRoZSBkb19k
aXYoKSAhPSAwIGhhcyBiZWVuIHJlcGxhY2VkIGJ5IHRoZSAncmVtJyBjb25kaXRpb24gYW5kIGl0
IHNlZW1zCj4gZ29vZCB0byBtZS4gU28gcGxlYXNlIHRlbGwgbWUgd2hhdCBkaXZpc2lvbiBieSB6
ZXJvIHlvdSBhcmUgdGFsa2luZwo+IGFib3V0IGJlY2F1c2UgdGhlIGJlZ2lubmluZyBvZiB0aGUg
aWYgY29uZGl0aW9uIGlzICJsZW4gPT0gMCB8fAo+IGVyYXNlc2l6ZSA9PSAwIHx8IGVyYXNlc2l6
ZSA+IGxlbiIsIHNvIGl0IGRvZXMgYWxyZWFkeSB0YWtlIGNhcmUgb2YKPiB0aGlzIHNpdHVhdGlv
bi4KClRoZSBwYXRjaCBJIHNlbmQgc2hvdyBhcyBmb2xsb3c6CgotLS0gYS9kcml2ZXJzL210ZC9k
ZXZpY2VzL3BocmFtLmMKKysrIGIvZHJpdmVycy9tdGQvZGV2aWNlcy9waHJhbS5jCkBAIC0yMjIs
NiArMjIyLDcgQEAgc3RhdGljIGludCBwaHJhbV9zZXR1cChjb25zdCBjaGFyICp2YWwpCiAgCXVp
bnQ2NF90IHN0YXJ0OwogIAl1aW50NjRfdCBsZW47CiAgCXVpbnQ2NF90IGVyYXNlc2l6ZSA9IFBB
R0VfU0laRTsKKwl1aW50MzJfdCByZW07CiAgCWludCBpLCByZXQ7CgogIAlpZiAoc3Rybmxlbih2
YWwsIHNpemVvZihidWYpKSA+PSBzaXplb2YoYnVmKSkKQEAgLTI2Myw4ICsyNjQsOSBAQCBzdGF0
aWMgaW50IHBocmFtX3NldHVwKGNvbnN0IGNoYXIgKnZhbCkKICAJCX0KICAJfQoKKwlkaXZfdTY0
X3JlbShsZW4sICh1aW50MzJfdCllcmFzZXNpemUsICZyZW0pOwogICAgICAgICBeXl5eXl5eXl5e
Xl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXgoJT25jZSB1c2VyIHNldCBlcmFzZXNp
emUgPT0gMCwgdGhlIGRpdl91NjRfcmVtIHdpbGwgdHJpZ2dlciB0aGUKRElWLzAuLi4KCiAgCWlm
IChsZW4gPT0gMCB8fCBlcmFzZXNpemUgPT0gMCB8fCBlcmFzZXNpemUgPiBsZW4KLQkgICAgfHwg
ZXJhc2VzaXplID4gVUlOVF9NQVggfHwgZG9fZGl2KGxlbiwgKHVpbnQzMl90KWVyYXNlc2l6ZSkg
IT0gMCkgeworCSAgICB8fCBlcmFzZXNpemUgPiBVSU5UX01BWCB8fCByZW0pIHsKICAJCXBhcnNl
X2VycigiaWxsZWdhbCBlcmFzZXNpemUgb3IgbGVuXG4iKTsKICAJCWdvdG8gZXJyb3I7CiAgCX0K
LS0gCgo+IAo+Pgo+PiBTb3JyeSBmb3IgdGhlIG1pc3Rha2UuIENhbiB5b3UgYWRkIGEgZml4IHBh
dGNoIGZvciB0aGlzPwo+IAo+IEluIGFueSBjYXNlIGlmIHRoZSBwYXRjaCB0dXJucyBvdXQgdG8g
YmUgd3JvbmcgSSdsbCBhc2sgeW91IHRvIGVpdGhlcgo+IHNlbmQgYSBmaXggb3Igc2VuZCBhIHYy
IGFuZCBJJ2xsIGRyb3AgdjEuCgpPa2F5LCBJIHdpbGwgc2VuZCB0aGUgdjIuIFNvcnJ5IGFnYWlu
IGZvciB0aGUgbWlzdGFrZS4KClRoYW5rcywKS3VuLgoKPiAKPj4g5ZyoIDIwMjEvMS80IDE4OjE4
LCBNaXF1ZWwgUmF5bmFsIOWGmemBkzoKPj4+IE9uIFdlZCwgMjAyMC0xMi0zMCBhdCAwMjoxNzox
OCBVVEMsIHlhbmdlcmt1biB3cm90ZToKPj4+PiBXZSBub3cgc3VwcG9ydCB1c2VyIHRvIHNldCBl
cmFzZSBwYWdlIHNpemUsIGFuZCB1c2UgZG9fZGl2IGJldHdlZW4gbGVuCj4+Pj4gYW5kIGVyYXNl
IHNpemUgdG8gZGV0ZXJtaW5lIHRoZSByZWFzb25hYmxlbmVzcyBmb3IgdGhlIGVyYXNlIHNpemUu
Cj4+Pj4gSG93ZXZlciwgZG9fZGl2IGlzIGEgbWFjcm8gYW5kIHdpbGwgb3ZlcndyaXRlIHRoZSB2
YWx1ZSBvZiBsZW4uIFdoaWNoCj4+Pj4gcmVzdWx0cyBhIG10ZCBkZXZpY2Ugd2l0aCB1bmV4Y2Vw
dGVkIHNpemUuIEZpeCBpdCBieSB1c2UgZGl2X3U2NF9yZW0uCj4+Pj4KPj4+PiBGaXhlczogZmZh
ZDU2MDM5NGRlICgibXRkOiBwaHJhbTogQWxsb3cgdGhlIHVzZXIgdG8gc2V0IHRoZSBlcmFzZSBw
YWdlIHNpemUuIikKPj4+PiBTaWduZWQtb2ZmLWJ5OiB5YW5nZXJrdW4gPHlhbmdlcmt1bkBodWF3
ZWkuY29tPgo+Pj4KPj4+IEFwcGxpZWQgdG8gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2Nt
L2xpbnV4L2tlcm5lbC9naXQvbXRkL2xpbnV4LmdpdCBtdGQvbmV4dCwgdGhhbmtzLgo+IAo+IFRo
YW5rcywKPiBNaXF1w6hsCj4gLgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
