Return-Path: <SRS0=z5ty=FE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 340E5C5519F
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 07:08:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94254206CB
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 07:08:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HM+GASxL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94254206CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PLrN4YR7vV8D/fRhsUKytMhEOlt+yBZbKsSzNzamJ28=; b=HM+GASxL+JTwLhZdZcmPT0JW1
	pjAXZodu0o72g+/NwMwwui1xVSnIsGad+KI444ylGg5wwW93JgXp1jF59fJzGr/BqI1Hutu9PfEx1
	tJ5uuuT29PYogi4riPKHQx5DpczX+21r0LV9aXxgsIX1DaTiH5xT2IEL/5o2qm7z8RORUiTzGOXDW
	4/9jj6ytG2ORuiH8riGgvfyCC7Lego49SdA+sBlXR5F6QjIAN98pXLTSkpQrXudYecBB7ZeqOr2Cu
	aN/fkaowYndnemyeU+i5IAvIAA0Qow1+jsffQg/O8QaYii3p6YTe55cx+DvIr2YN9LXopAWeNpSIO
	O7rw2tczA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjdI2-0002M5-MR; Mon, 30 Nov 2020 07:08:02 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjdHz-0002Kk-51
 for linux-mtd@lists.infradead.org; Mon, 30 Nov 2020 07:07:59 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0A17FAC8F;
 Mon, 30 Nov 2020 07:07:58 +0000 (UTC)
Subject: Re: [PATCH 07/45] loop: do not call set_blocksize
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20201128161510.347752-1-hch@lst.de>
 <20201128161510.347752-8-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <2b576021-844b-cdd9-a11d-f1f124707e65@suse.de>
Date: Mon, 30 Nov 2020 08:07:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201128161510.347752-8-hch@lst.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_020759_338261_A662291F 
X-CRM114-Status: GOOD (  21.03  )
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

T24gMTEvMjgvMjAgNToxNCBQTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gc2V0X2Jsb2Nr
c2l6ZSBpcyB1c2VkIGJ5IGZpbGUgc3lzdGVtcyB0byB1c2UgdGhlaXIgcHJlZmVycmVkIGJ1ZmZl
ciBjYWNoZQo+IGJsb2NrIHNpemUuICBCbG9jayBkcml2ZXJzIHNob3VsZCBub3Qgc2V0IGl0Lgo+
IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+IFJldmll
d2VkLWJ5OiBKYW4gS2FyYSA8amFja0BzdXNlLmN6Pgo+IC0tLQo+ICAgZHJpdmVycy9ibG9jay9s
b29wLmMgfCAzIC0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvYmxvY2svbG9vcC5jIGIvZHJpdmVycy9ibG9jay9sb29wLmMKPiBp
bmRleCA5YTI3ZDRmMWMwOGFhYy4uYjQyYzcyODYyMGM5ZTQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ibG9jay9sb29wLmMKPiArKysgYi9kcml2ZXJzL2Jsb2NrL2xvb3AuYwo+IEBAIC0xMTY0LDkg
KzExNjQsNiBAQCBzdGF0aWMgaW50IGxvb3BfY29uZmlndXJlKHN0cnVjdCBsb29wX2RldmljZSAq
bG8sIGZtb2RlX3QgbW9kZSwKPiAgIAlzaXplID0gZ2V0X2xvb3Bfc2l6ZShsbywgZmlsZSk7Cj4g
ICAJbG9vcF9zZXRfc2l6ZShsbywgc2l6ZSk7Cj4gICAKPiAtCXNldF9ibG9ja3NpemUoYmRldiwg
U19JU0JMSyhpbm9kZS0+aV9tb2RlKSA/Cj4gLQkJICAgICAgYmxvY2tfc2l6ZShpbm9kZS0+aV9i
ZGV2KSA6IFBBR0VfU0laRSk7Cj4gLQo+ICAgCWxvLT5sb19zdGF0ZSA9IExvX2JvdW5kOwo+ICAg
CWlmIChwYXJ0X3NoaWZ0KQo+ICAgCQlsby0+bG9fZmxhZ3MgfD0gTE9fRkxBR1NfUEFSVFNDQU47
Cj4gClJldmlld2VkLWJ5OiBIYW5uZXMgUmVpbmVja2UgPGhhcmVAc3VzZS5kZT4KCkNoZWVycywK
Ckhhbm5lcwotLSAKRHIuIEhhbm5lcyBSZWluZWNrZSAgICAgICAgICAgICAgICBLZXJuZWwgU3Rv
cmFnZSBBcmNoaXRlY3QKaGFyZUBzdXNlLmRlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
KzQ5IDkxMSA3NDA1MyA2ODgKU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR21iSCwgTWF4ZmVsZHN0
ci4gNSwgOTA0MDkgTsO8cm5iZXJnCkhSQiAzNjgwOSAoQUcgTsO8cm5iZXJnKSwgR2VzY2jDpGZ0
c2bDvGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
