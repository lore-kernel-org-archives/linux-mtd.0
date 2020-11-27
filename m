Return-Path: <SRS0=1rsk=FB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA105C63777
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2020 12:05:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 335A321D81
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2020 12:05:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yqFIK1mh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 335A321D81
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aibYVk3s7OESCZnQL8Q5pIjXqvi8O1bvAcGWf7iDvpk=; b=yqFIK1mhuALOqIMsdQ7ZrKli7
	3a5tlZm/8XToTXaovN7YKfdoc5e5WYLetOrIpgC7jrEzgbqaacfcVKHT+hZL9TfOl0kXgHmZqt6AZ
	NZV1IYg3AitP7rhT0YCrglKT8z3InmtIDMk3b3v7cFOuI5a0aX9JPuLbX0GWy5KcTcbTSOQU/JQQj
	wZpBwkQ/Lx/+V2Z0xveovilaX1I4CO7v8oUUJ68TkHs98nWD/3Y64IHPd0xd+an39K5EAzGIZvQ/X
	YCRHRuqoG+n7pf5o8Zhwq5e3gK06mT3BzjgVAy5y0Os352Cjs3T2QcYF5ruxzv7qZ3FRl0JvwNgL/
	4MgylDVwQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kicTq-0005w6-6D; Fri, 27 Nov 2020 12:04:02 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kicTn-0005uu-Iq
 for linux-mtd@lists.infradead.org; Fri, 27 Nov 2020 12:04:00 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B2543AC2F;
 Fri, 27 Nov 2020 12:03:57 +0000 (UTC)
Subject: Re: [PATCH 12/44] block: add a bdev_kobj helper
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20201126130422.92945-1-hch@lst.de>
 <20201126130422.92945-13-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <71b7c8b6-937e-e873-5957-872493452886@suse.de>
Date: Fri, 27 Nov 2020 13:03:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201126130422.92945-13-hch@lst.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_070359_761814_88B8C991 
X-CRM114-Status: GOOD (  18.20  )
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

T24gMTEvMjYvMjAgMjowMyBQTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gQWRkIGEgbGl0
dGxlIGhlbHBlciB0byBmaW5kIHRoZSBrb2JqZWN0IGZvciBhIHN0cnVjdCBibG9ja19kZXZpY2Uu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gUmV2
aWV3ZWQtYnk6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+
Cj4gUmV2aWV3ZWQtYnk6IEphbiBLYXJhIDxqYWNrQHN1c2UuY3o+Cj4gUmV2aWV3ZWQtYnk6IEpv
aGFubmVzIFRodW1zaGlybiA8am9oYW5uZXMudGh1bXNoaXJuQHdkYy5jb20+Cj4gQWNrZWQtYnk6
IFRlanVuIEhlbyA8dGpAa2VybmVsLm9yZz4KPiBBY2tlZC1ieTogQ29seSBMaSA8Y29seWxpQHN1
c2UuZGU+CQlbYmNhY2hlXQo+IC0tLQo+ICAgZHJpdmVycy9tZC9iY2FjaGUvc3VwZXIuYyB8ICA3
ICsrLS0tLS0KPiAgIGRyaXZlcnMvbWQvbWQuYyAgICAgICAgICAgfCAgNCArLS0tCj4gICBmcy9i
bG9ja19kZXYuYyAgICAgICAgICAgIHwgIDYgKysrLS0tCj4gICBmcy9idHJmcy9zeXNmcy5jICAg
ICAgICAgIHwgMTUgKysrLS0tLS0tLS0tLS0tCj4gICBpbmNsdWRlL2xpbnV4L2Jsa190eXBlcy5o
IHwgIDMgKysrCj4gICA1IGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDIzIGRlbGV0
aW9ucygtKQo+IApSZXZpZXdlZC1ieTogSGFubmVzIFJlaW5lY2tlIDxoYXJlQHN1c2UuZGU+CgpD
aGVlcnMsCgpIYW5uZXMKLS0gCkRyLiBIYW5uZXMgUmVpbmVja2UgICAgICAgICAgICAgICAgS2Vy
bmVsIFN0b3JhZ2UgQXJjaGl0ZWN0CmhhcmVAc3VzZS5kZSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICs0OSA5MTEgNzQwNTMgNjg4ClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdtYkgsIE1h
eGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZwpIUkIgMzY4MDkgKEFHIE7DvHJuYmVyZyksIEdl
c2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXIKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
