Return-Path: <SRS0=z5ty=FE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FC29C64E8A
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 07:44:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24D1520731
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 07:44:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KzqET7WW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24D1520731
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aQiQJ3YRrCFxHCINamwUtCnZe9LP4P/ihc1zx3BG/T0=; b=KzqET7WWiVvWVa7oL8yvu6f86
	WnvX0+gHajOcenuTL9kQNIriZhlkqMIMuTY/UNfRcQMIehRPwTKq/jxlW5zzsH73Al/qDGTq0iAHn
	syxb0bYMNePRWtSI7nZx4oeaiH4VKDkdN92feBHeuyai763tH+4Hno4RSrtmOvMgPk7xnRqv3A5yz
	2VeQUwaUzhM7ExRCM6X7880UEw3pckBLo/mKHcaqD0M7hfoSe7NeUPT9hze6W4Em/DfgpZFKNBMnv
	wYeqyXrZE8q2Fkv4obiSKmPGHrdHe2j7VA+p9AC0nGDU6QhHD5KHhVxDCKxfN70RLXoa4Ro42bYhi
	NXhx0J63A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjdqS-0000iM-H8; Mon, 30 Nov 2020 07:43:36 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjdqO-0000gW-P7
 for linux-mtd@lists.infradead.org; Mon, 30 Nov 2020 07:43:34 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AFB27AC8F;
 Mon, 30 Nov 2020 07:43:31 +0000 (UTC)
Subject: Re: [PATCH 35/45] block: move make_it_fail to struct block_device
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20201128161510.347752-1-hch@lst.de>
 <20201128161510.347752-36-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <45b457ba-e76c-a320-b3ef-c5b555509761@suse.de>
Date: Mon, 30 Nov 2020 08:43:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201128161510.347752-36-hch@lst.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_024332_976971_F440AF56 
X-CRM114-Status: GOOD (  18.71  )
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

T24gMTEvMjgvMjAgNToxNSBQTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gTW92ZSB0aGUg
bWFrZV9pdF9mYWlsIGZsYWcgdG8gc3RydWN0IGJsb2NrX2RldmljZSBhbiB0dXJuIGl0IGludG8g
YSBib29sCj4gaW4gcHJlcGFyYXRpb24gb2Yga2lsbGluZyBzdHJ1Y3QgaGRfc3RydWN0Lgo+IAo+
IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+IFJldmlld2Vk
LWJ5OiBKYW4gS2FyYSA8amFja0BzdXNlLmN6Pgo+IC0tLQo+ICAgYmxvY2svYmxrLWNvcmUuYyAg
ICAgICAgICB8IDMgKystCj4gICBibG9jay9nZW5oZC5jICAgICAgICAgICAgIHwgNCArKy0tCj4g
ICBpbmNsdWRlL2xpbnV4L2Jsa190eXBlcy5oIHwgMyArKysKPiAgIGluY2x1ZGUvbGludXgvZ2Vu
aGQuaCAgICAgfCAzIC0tLQo+ICAgNCBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDYg
ZGVsZXRpb25zKC0pCj4gClJldmlld2VkLWJ5OiBIYW5uZXMgUmVpbmVja2UgPGhhcmVAc3VzZS5k
ZT4KCkNoZWVycywKCkhhbm5lcwotLSAKRHIuIEhhbm5lcyBSZWluZWNrZSAgICAgICAgICAgICAg
ICBLZXJuZWwgU3RvcmFnZSBBcmNoaXRlY3QKaGFyZUBzdXNlLmRlICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgKzQ5IDkxMSA3NDA1MyA2ODgKU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR21i
SCwgTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnCkhSQiAzNjgwOSAoQUcgTsO8cm5iZXJn
KSwgR2VzY2jDpGZ0c2bDvGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZlcgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
