Return-Path: <SRS0=1rsk=FB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24319C2D0E4
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2020 10:37:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2AFF21D46
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2020 10:37:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E2s3UwIq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2AFF21D46
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5GJDcX+cre2b66bes671cGkKz4mb8FACWC9BA+Ueb1s=; b=E2s3UwIq/4goKBhU5Z0zHWIB7
	/T9/zeLw8lKr8TgFh9erJ+x6BgXNFhrqdP9Dq9xoT9+vsUcViKk0xAflsqkB5n423b4B1VmYilFig
	oAaW/mAgoPTD6GDYPtGgGreAuiYnkp1gS20EvQdknb1gt9wmZ9ko/DcQWgs/byXtQbz2R0PEwE9Qf
	BkqG19LWO5D5NIZdxK6SHdoE7FEXrSHdLfquZxFM9AqaeOEuxwQL5qpTwY1tNwwQLRC9XB+dwrWFu
	uu/Wb68CFXIFyRHGRhc3kMjrf80MsfsxpAVM/yQBZDogUVDYugv+fQvLZWGu6Gf8jB4ZyDWpl8esQ
	Y2pFL5FLQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kib7W-0000DP-0C; Fri, 27 Nov 2020 10:36:54 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kib7P-0000BW-06
 for linux-mtd@lists.infradead.org; Fri, 27 Nov 2020 10:36:51 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E1240AC75;
 Fri, 27 Nov 2020 10:36:45 +0000 (UTC)
Subject: Re: [PATCH 10/44] block: remove a duplicate __disk_get_part prototype
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20201126130422.92945-1-hch@lst.de>
 <20201126130422.92945-11-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <2ef8235e-2f2a-6f0d-4143-f6c069da737c@suse.de>
Date: Fri, 27 Nov 2020 11:36:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201126130422.92945-11-hch@lst.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_053647_187051_54E23CD4 
X-CRM114-Status: GOOD (  20.84  )
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
Cc: linux-bcache@vger.kernel.org, Jan Kara <jack@suse.cz>,
 Mike Snitzer <snitzer@redhat.com>, linux-mm@kvack.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jan Kara <jack@suse.com>,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, Tejun Heo <tj@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMTEvMjYvMjAgMjowMyBQTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gU2lnbmVkLW9m
Zi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gQWNrZWQtYnk6IFRlanVuIEhl
byA8dGpAa2VybmVsLm9yZz4KPiBSZXZpZXdlZC1ieTogSmFuIEthcmEgPGphY2tAc3VzZS5jej4K
PiBSZXZpZXdlZC1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9u
Lm9yZz4KPiBSZXZpZXdlZC1ieTogSm9oYW5uZXMgVGh1bXNoaXJuIDxqb2hhbm5lcy50aHVtc2hp
cm5Ad2RjLmNvbT4KPiAtLS0KPiAgIGluY2x1ZGUvbGludXgvZ2VuaGQuaCB8IDEgLQo+ICAgMSBm
aWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51
eC9nZW5oZC5oIGIvaW5jbHVkZS9saW51eC9nZW5oZC5oCj4gaW5kZXggNDY1NTNkNmQ2MDI1NjMu
LjIyZjViOWZkOTZmOGJmIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvZ2VuaGQuaAo+ICsr
KyBiL2luY2x1ZGUvbGludXgvZ2VuaGQuaAo+IEBAIC0yNTAsNyArMjUwLDYgQEAgc3RhdGljIGlu
bGluZSBkZXZfdCBwYXJ0X2RldnQoc3RydWN0IGhkX3N0cnVjdCAqcGFydCkKPiAgIAlyZXR1cm4g
cGFydF90b19kZXYocGFydCktPmRldnQ7Cj4gICB9Cj4gICAKPiAtZXh0ZXJuIHN0cnVjdCBoZF9z
dHJ1Y3QgKl9fZGlza19nZXRfcGFydChzdHJ1Y3QgZ2VuZGlzayAqZGlzaywgaW50IHBhcnRubyk7
Cj4gICBleHRlcm4gc3RydWN0IGhkX3N0cnVjdCAqZGlza19nZXRfcGFydChzdHJ1Y3QgZ2VuZGlz
ayAqZGlzaywgaW50IHBhcnRubyk7Cj4gICAKPiAgIHN0YXRpYyBpbmxpbmUgdm9pZCBkaXNrX3B1
dF9wYXJ0KHN0cnVjdCBoZF9zdHJ1Y3QgKnBhcnQpCj4gClJldmlld2VkLWJ5OiBIYW5uZXMgUmVp
bmVja2UgPGhhcmVAc3VzZS5kZT4KCkNoZWVycywKCkhhbm5lcwotLSAKRHIuIEhhbm5lcyBSZWlu
ZWNrZSAgICAgICAgICAgICAgICBLZXJuZWwgU3RvcmFnZSBBcmNoaXRlY3QKaGFyZUBzdXNlLmRl
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKzQ5IDkxMSA3NDA1MyA2ODgKU1VTRSBTb2Z0
d2FyZSBTb2x1dGlvbnMgR21iSCwgTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnCkhSQiAz
NjgwOSAoQUcgTsO8cm5iZXJnKSwgR2VzY2jDpGZ0c2bDvGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZl
cgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
