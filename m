Return-Path: <SRS0=z5ty=FE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B56E8C5519F
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 07:46:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30C8B20709
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 07:46:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N8dl8Eoj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30C8B20709
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=syDVLQAQt1UBu7vpo7ftIhSdxV8D/Arj6VQifrkG1QQ=; b=N8dl8EojeT1ij54YR5AuTpc9m
	Ab03vuxpjKjy/wEJ+qZW613UXIW+6+E5Uxcobwcws+OLw5Y8DqIlPySQ6k4jU0vfiwzzrf49KNOeA
	LMm9LA8PAQ8NBdXjWJLJmjyvUwfuDKXB802vJEwj6Fxi4fMGMpvwor9+oiamteuY5o7cLnCZyNjYI
	Qk/hRySusuadzvPuita2kItMOa7bY5IYy5/15uX1POAbIFA6LXGYa06YuMxEwhsCSLhbS96JObi0O
	DNgRaSaPYYjCqU3Iso4BikCLpYVaBU8HzTRj4BDomHq3zN+txh/7zWYKmBNs9ik+7NMna1QijOde3
	qZbdr8jaA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjdr7-0000vf-4x; Mon, 30 Nov 2020 07:44:17 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjdr3-0000ty-5w
 for linux-mtd@lists.infradead.org; Mon, 30 Nov 2020 07:44:14 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 04285AD43;
 Mon, 30 Nov 2020 07:44:12 +0000 (UTC)
Subject: Re: [PATCH 36/45] block: move the policy field to struct block_device
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20201128161510.347752-1-hch@lst.de>
 <20201128161510.347752-37-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <03bb661a-519a-5f0b-d3c6-e10d0388d939@suse.de>
Date: Mon, 30 Nov 2020 08:44:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201128161510.347752-37-hch@lst.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_024413_366943_5844D95C 
X-CRM114-Status: GOOD (  19.72  )
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
cG9saWN5IGZpZWxkIHRvIHN0cnVjdCBibG9ja19kZXZpY2UgYW5kIHJlbmFtZSBpdCB0byB0aGUK
PiBtb3JlIGRlc2NyaXB0aXZlIGJkX3JlYWRfb25seS4gIEFsc28gdHVybiB0aGUgZmllbGQgaW50
byBhIGJvb2wgYXMgaXQKPiBpcyB1c2VkIGFzIHN1Y2guCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hy
aXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gUmV2aWV3ZWQtYnk6IEphbiBLYXJhIDxqYWNr
QHN1c2UuY3o+Cj4gLS0tCj4gICBibG9jay9ibGstY29yZS5jICAgICAgICAgIHwgMiArLQo+ICAg
YmxvY2svZ2VuaGQuYyAgICAgICAgICAgICB8IDggKysrKy0tLS0KPiAgIGJsb2NrL2lvY3RsLmMg
ICAgICAgICAgICAgfCAyICstCj4gICBibG9jay9wYXJ0aXRpb25zL2NvcmUuYyAgIHwgNCArKy0t
Cj4gICBpbmNsdWRlL2xpbnV4L2Jsa190eXBlcy5oIHwgMSArCj4gICBpbmNsdWRlL2xpbnV4L2dl
bmhkLmggICAgIHwgNCArKy0tCj4gICA2IGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyks
IDEwIGRlbGV0aW9ucygtKQo+IApSZXZpZXdlZC1ieTogSGFubmVzIFJlaW5lY2tlIDxoYXJlQHN1
c2UuZGU+CgpDaGVlcnMsCgpIYW5uZXMKLS0gCkRyLiBIYW5uZXMgUmVpbmVja2UgICAgICAgICAg
ICAgICAgS2VybmVsIFN0b3JhZ2UgQXJjaGl0ZWN0CmhhcmVAc3VzZS5kZSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICs0OSA5MTEgNzQwNTMgNjg4ClNVU0UgU29mdHdhcmUgU29sdXRpb25z
IEdtYkgsIE1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZwpIUkIgMzY4MDkgKEFHIE7DvHJu
YmVyZyksIEdlc2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXIKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
