Return-Path: <SRS0=z5ty=FE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3812C5519F
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 07:15:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 463F1206CA
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 07:15:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KTd7Gs4+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 463F1206CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9doNyHvlEEzeVi6dwk2znPW5oHJ9MbEqYdTy4r8galA=; b=KTd7Gs4+6ij375mwZEagK8caK
	UHVACKutSRQnkfAgHX/2iRhvFU4K2GGKxI0OqSCaIR+VBS2oiCpBjSnGu/ZtrEBR42YVsBgwyONyi
	LLcjsiK2tyirpkqPH9QO6belTNp/Ml50BX+iqPKt9pD2QJ/0nzWoCYuaev0Hds6ILK920W/qoTs/C
	URYKTg99uBcZmzsEd6uhL2fGzNYtSu0ZsMNEU9cws9wW7cqjXfhSHAJyh6bAa9v40PiYgWIb+L2IT
	Zgf/r2pRwaqeOJuYhHjUMAm6uByYFMXN2o763yhWsiw4QE3G/fGAX2IshAosMRQECP70UNI+KSP+a
	ON9ylSFOA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjdOE-0003ul-US; Mon, 30 Nov 2020 07:14:26 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjdOB-0003tn-M4
 for linux-mtd@lists.infradead.org; Mon, 30 Nov 2020 07:14:24 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 82ED1AC55;
 Mon, 30 Nov 2020 07:14:22 +0000 (UTC)
Subject: Re: [PATCH 16/45] block: switch bdgrab to use igrab
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20201128161510.347752-1-hch@lst.de>
 <20201128161510.347752-17-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <595de89b-944c-a694-c63e-7600370d28fc@suse.de>
Date: Mon, 30 Nov 2020 08:14:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201128161510.347752-17-hch@lst.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_021423_880201_D0DACF75 
X-CRM114-Status: GOOD (  25.03  )
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

T24gMTEvMjgvMjAgNToxNCBQTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gQWxsIG9mIHRo
ZSBjdXJyZW50IGNhbGxlcnMgYWxyZWFkeSBoYXZlIGEgcmVmZXJlbmNlLCBidXQgdG8gcHJlcGFy
ZSBmb3IKPiBhZGRpdGlvbmFsIHVzZXJzIGVuc3VyZSBiZGdyYWIgcmV0dXJucyBOVUxMIGlmIHRo
ZSBibG9jayBkZXZpY2UgaXMgYmVlaW5nCj4gZnJlZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hy
aXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gLS0tCj4gICBmcy9ibG9ja19kZXYuYyB8IDYg
KysrKystCj4gICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL2ZzL2Jsb2NrX2Rldi5jIGIvZnMvYmxvY2tfZGV2LmMKPiBpbmRl
eCBkNzA3YWIzNzZkYTg2ZS4uOTYyZmFiZThhNjdiODMgMTAwNjQ0Cj4gLS0tIGEvZnMvYmxvY2tf
ZGV2LmMKPiArKysgYi9mcy9ibG9ja19kZXYuYwo+IEBAIC04OTQsMTAgKzg5NCwxNCBAQCBzdGF0
aWMgc3RydWN0IGJsb2NrX2RldmljZSAqYmRnZXQoZGV2X3QgZGV2KQo+ICAgLyoqCj4gICAgKiBi
ZGdyYWIgLS0gR3JhYiBhIHJlZmVyZW5jZSB0byBhbiBhbHJlYWR5IHJlZmVyZW5jZWQgYmxvY2sg
ZGV2aWNlCj4gICAgKiBAYmRldjoJQmxvY2sgZGV2aWNlIHRvIGdyYWIgYSByZWZlcmVuY2UgdG8u
Cj4gKyAqCj4gKyAqIFJldHVybnMgdGhlIGJsb2NrX2RldmljZSB3aXRoIGFuIGFkZGl0aW9uYWwg
cmVmZXJlbmNlIHdoZW4gc3VjY2Vzc2Z1bCwKPiArICogb3IgTlVMTCBpZiB0aGUgaW5vZGUgaXMg
YWxyZWFkeSBiZWVpbmcgZnJlZWQuCj4gICAgKi8KPiAgIHN0cnVjdCBibG9ja19kZXZpY2UgKmJk
Z3JhYihzdHJ1Y3QgYmxvY2tfZGV2aWNlICpiZGV2KQo+ICAgewo+IC0JaWhvbGQoYmRldi0+YmRf
aW5vZGUpOwo+ICsJaWYgKCFpZ3JhYihiZGV2LT5iZF9pbm9kZSkpCj4gKwkJcmV0dXJuIE5VTEw7
Cj4gICAJcmV0dXJuIGJkZXY7Cj4gICB9Cj4gICBFWFBPUlRfU1lNQk9MKGJkZ3JhYik7Cj4gClJl
dmlld2VkLWJ5OiBIYW5uZXMgUmVpbmVja2UgPGhhcmVAc3VzZS5kZT4KCkNoZWVycywKCkhhbm5l
cwotLSAKRHIuIEhhbm5lcyBSZWluZWNrZSAgICAgICAgICAgICAgICBLZXJuZWwgU3RvcmFnZSBB
cmNoaXRlY3QKaGFyZUBzdXNlLmRlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKzQ5IDkx
MSA3NDA1MyA2ODgKU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR21iSCwgTWF4ZmVsZHN0ci4gNSwg
OTA0MDkgTsO8cm5iZXJnCkhSQiAzNjgwOSAoQUcgTsO8cm5iZXJnKSwgR2VzY2jDpGZ0c2bDvGhy
ZXI6IEZlbGl4IEltZW5kw7ZyZmZlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
