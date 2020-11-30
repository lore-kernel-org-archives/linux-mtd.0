Return-Path: <SRS0=z5ty=FE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF2E4C63777
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 07:38:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E97D120643
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 07:38:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hUGtAaZF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E97D120643
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NXenZ4LVzVK1hrEo9UDayWm6skA/XEBqWJfhzYj51Aw=; b=hUGtAaZF/Om0FKSx/xMTYEfDZ
	QxXS2jRwcXSHBeQwBd8zjQUSD+lz9DD7FCl4Qa5aBtRPRN9jUtPvPENa9SYhHOFz5xPg9T3i9oBe1
	1ljSxCr2gRLnblKcABJTuMz2GNdwuLrqwEU13CvcieWjHgInxToq9uRIkIQrrSgT6hInR3ayL0bHc
	gCpELtYD0C90biovw3bZtMezuwfhPSDPkvUE3wWFkAVsNmk/AsACBA96tT+DEFdpIUiyKbdnPa08Q
	EHvrCJt7/WptHNLPv8lZ+YUT+ik55s5mOMpX86XFFkNu6RGoHTOqbcay8pRxFMXtb6u/c+l5h540y
	ryryZonQw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjdkp-0007T6-HR; Mon, 30 Nov 2020 07:37:47 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjdkm-0007Rn-4p
 for linux-mtd@lists.infradead.org; Mon, 30 Nov 2020 07:37:45 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0AAA6AD09;
 Mon, 30 Nov 2020 07:37:43 +0000 (UTC)
Subject: Re: [PATCH 27/45] block: simplify the block device claiming interface
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20201128161510.347752-1-hch@lst.de>
 <20201128161510.347752-28-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <1bd1571f-69be-03ab-6d67-3a6cb3a71e1e@suse.de>
Date: Mon, 30 Nov 2020 08:37:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201128161510.347752-28-hch@lst.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_023744_339017_4ACB6355 
X-CRM114-Status: GOOD (  17.94  )
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

T24gMTEvMjgvMjAgNToxNCBQTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gU3RvcCBwYXNz
aW5nIHRoZSB3aG9sZSBkZXZpY2UgYXMgYSBzZXBhcmF0ZSBhcmd1bWVudCBnaXZlbiB0aGF0IGl0
Cj4gY2FuIGJlIHRyaXZpYWxseSBkZWR1Y3RlZCBhbmQgY2xlYW51cCB0aGUgIWhvbGRlciBkZWJ1
ZyBjaGVjay4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5k
ZT4KPiBSZXZpZXdlZC1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0
aW9uLm9yZz4KPiBSZXZpZXdlZC1ieTogSmFuIEthcmEgPGphY2tAc3VzZS5jej4KPiBBY2tlZC1i
eTogVGVqdW4gSGVvIDx0akBrZXJuZWwub3JnPgo+IC0tLQo+ICAgZHJpdmVycy9ibG9jay9sb29w
LmMgICB8IDEyICsrKysrLS0tLS0KPiAgIGZzL2Jsb2NrX2Rldi5jICAgICAgICAgfCA1MSArKysr
KysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgIGluY2x1ZGUvbGludXgv
YmxrZGV2LmggfCAgNiArKy0tLQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCsp
LCA0NCBkZWxldGlvbnMoLSkKPiAKUmV2aWV3ZWQtYnk6IEhhbm5lcyBSZWluZWNrZSA8aGFyZUBz
dXNlLmRlPgoKQ2hlZXJzLAoKSGFubmVzCi0tIApEci4gSGFubmVzIFJlaW5lY2tlICAgICAgICAg
ICAgICAgIEtlcm5lbCBTdG9yYWdlIEFyY2hpdGVjdApoYXJlQHN1c2UuZGUgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICArNDkgOTExIDc0MDUzIDY4OApTVVNFIFNvZnR3YXJlIFNvbHV0aW9u
cyBHbWJILCBNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcKSFJCIDM2ODA5IChBRyBOw7xy
bmJlcmcpLCBHZXNjaMOkZnRzZsO8aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
