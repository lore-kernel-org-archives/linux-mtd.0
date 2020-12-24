Return-Path: <SRS0=HPNF=F4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FB36C433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Dec 2020 01:16:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D022F22517
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Dec 2020 01:16:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D022F22517
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1gCWFVH/jPCqOsFUlLY5bMJAd6sjz2FVajlkQEp3Is4=; b=F1OB0jhlImYrb/MI/wXjBd+N1
	CUfXKbY7DTuMWm2nNZ8cbhufBwQw4CA22IU9GErnC81jmrfgBLGoEYjj7w9vOR1BHu9EPmAj0iw6G
	bct+Tuc+smj1K5uyuTuainBsA9/4CbT8gCSv84RiVzSG+Q4/MdWB34SKq0uNWXn30G8zH0gFYui7g
	3iLUzDnlppCbvEmPe41QQ4ucR9siy94LGn7nhcF/Vp+fH4OelMxA+bFDJXY8ixR+PnQrUyyHTaLnn
	isJmG8cpI2bvKh5dQxKDtd1gY//0HQrEcsqdiwMLPX0M9DAOU3bRjDZvYX/kOqw5jQRmlob7a44zv
	fwy5RRhRw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ksFDP-0003ep-Nv; Thu, 24 Dec 2020 01:14:51 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksFDJ-0003cu-Uo
 for linux-mtd@lists.infradead.org; Thu, 24 Dec 2020 01:14:49 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4D1XCH4kqdz7KN4;
 Thu, 24 Dec 2020 09:13:47 +0800 (CST)
Received: from [10.174.176.185] (10.174.176.185) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Thu, 24 Dec 2020 09:14:21 +0800
Subject: Re: [PATCH v2] ubifs: Fix read out-of-bounds in
 ubifs_jnl_write_inode()
To: Richard Weinberger <richard@nod.at>, Chengsong Ke <kechengsong@huawei.com>
References: <20201223121536.6244-1-kechengsong@huawei.com>
 <244303467.160590.1608764840819.JavaMail.zimbra@nod.at>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <a45eb291-c3e5-23c6-239d-88347cf688e4@huawei.com>
Date: Thu, 24 Dec 2020 09:14:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <244303467.160590.1608764840819.JavaMail.zimbra@nod.at>
X-Originating-IP: [10.174.176.185]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_201446_793620_C6734AC3 
X-CRM114-Status: GOOD (  12.69  )
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
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 wangfangpeng1 <wangfangpeng1@huawei.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

5ZyoIDIwMjAvMTIvMjQgNzowNywgUmljaGFyZCBXZWluYmVyZ2VyIOWGmemBkzoKCj4+IFJlcHJv
ZHVjZXI6Cj4+IDAuIGNvbmZpZyBLQVNBTiAmJiBhcHBseSBwcmludC5wYXRjaAo+PiAxLiBtb3Vu
dCB1YmlmcyBvbiAvcm9vdC90ZW1wCj4+IDIuIHJ1biB0ZXN0LnNoCj4gCj4gV2hhdCBkb2VzIHRl
c3Quc2ggZG8/CkdvIHRvIExpbms6IGh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1
Zy5jZ2k/aWQ9MjEwODY1Lgp0ZXN0LnNoIGNyZWF0ZXMgYSB2ZXJ5IGxvbmcgcGF0aCBmaWxlIHRl
c3RfZmlsZSwgYW5kIHRoZW4gY3JlYXRlIGEgCnN5bWJvbCBsaW5rIGxpbmtfZmlsZSBmb3IgdGVz
dF9maWxlLCBzbyB1YmlmcyBpbm9kZSBmb3IgbGlua19maWxlIHdpbGwgCmJlIGFzc2lnbmVkIGEg
YmlnIHZhbHVlIGZvciB1aS0+ZGF0YV9sZW4uCldoZW4gd2UgY2hhbmdlIGF0aW1lIGZvciBsaW5r
X2ZpbGUsIHViaWZzX2pubF93cml0ZV9pbm9kZSB3aWxsIGJlIApleGVjdXRlZCBieSB3Yl93cml0
ZWJhY2suIEJ5IHRoaXMgd2F5LCB3cml0ZV9sZW4gY291bGQgYmUgbm90IGFsaWduZWQgCndpdGgg
OCBieXRlcy4KPiAKPj4gMy4gY2QgL3Jvb3QvdGVtcCAmJiBscyAvLyBjaGFuZ2UgYXRpbWUgZm9y
IGxpbmtfZmlsZQo+PiA0LiB3YWl0IDF+MiBtaW51dGVzCj4+Cj4+IEluIG9yZGVyIHRvIHNvbHZl
IHRoZSByZWFkIG9vYiBwcm9ibGVtIGluIHViaWZzX3didWZfd3JpdGVfbm9sb2NrLCBqdXN0IGFs
aWduCj4+IHRoZSB3cml0ZV9sZW4gdG8KPj4gOCBieXRlcyB3aGVuIGFsbG9jIHRoZSBtZW1vcnku
IFNvIHRoYXQgdGhpcyBwYXRjaCB3aWxsIG5vdCBhZmZlY3QgdGhlIHVzZSBvZgo+PiB3cml0ZV9s
ZW4gaW4gb3RoZXIKPj4gZnVuY3Rpb25zLCBzdWNoIGFzIHViaWZzX2pubF93cml0ZV9pbm9kZS0+
bWFrZV9yZXNlcnZhdGlvbiBhbmQKPj4gdWJpZnNfam5sX3dyaXRlX2lub2RlLT51Ymlmc19ub2Rl
X2NhbGNfaGFzaC4KPiAKPiBJIGdhdmUgdGhpcyBhIHNlY29uZCB0aG91Z2h0IGFuZCBJJ20gbm90
IHNvIHN1cmUgYW55bW9yZSB3aGF0IGV4YWN0bHkgaXMgZ29pbmcgb24uCj4gVGhlIHByb2JsZW0g
aXMgcmVhbCwgSSBmdWxseSBhZ3JlZSB3aXRoIHlvdSBidXQgSSBuZWVkIHRvIGRpZyBkZWVwZXIg
aW50bwo+IHRoZSBqb3VybmFsIGFuZCB3YnVmIGNvZGUgdG8gZG91YmxlIGNoZWNrIHRoYXQgd2Ug
cmVhbGx5IGZpeCB0aGUgcmlnaHQgdGhpbmcKPiBhbmQgbm90IGp1c3QgcGFwZXIgb3RoZXIgc29t
ZXRoaW5nLgo+IAo+IFRoYW5rcywKPiAvL3JpY2hhcmQKPiAuCj4gCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
