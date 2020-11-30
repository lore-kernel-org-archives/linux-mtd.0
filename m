Return-Path: <SRS0=z5ty=FE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B702C5519F
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 07:37:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0971620643
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 07:37:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r2vmtvdD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0971620643
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=H2UhtDhNPJscnjBdqSnaEbDL2vkMKEAkG7eBg8H6780=; b=r2vmtvdDMjDx4FCzf8r7xh2ia
	Vnd09EhyMFFO0IA1sIqjLqsUesS6x7AUW63HlNmwtWhvD1h6CQcuSF9BhbpH7Ugip4qUcFsUU8Nvw
	Z6IpLuLz45/DMz4GnTrJCHeYllGCUucuJJSJPUbtkgpzLxtL3fAptrWP1TAMQZYgTjWZ0T9BuP2Q4
	oWzfVmKsyaRSBjcqepFoz/H661YkWJqxugkEjJVt7Xe2OCj5TmLkaGZYVheLJD4ih+VHSr0XxK9p1
	BpxyaMm9TFgSlLaAYXwQZtVuIu3XLCwoicWvWKsVDH7ZRRLeVtQRYsrtArUR2KHT9PGvKyK2x2VqY
	ZimQK4Hew==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjdkB-0007Kh-13; Mon, 30 Nov 2020 07:37:07 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjdk8-0007JV-3o
 for linux-mtd@lists.infradead.org; Mon, 30 Nov 2020 07:37:05 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 107DDACC0;
 Mon, 30 Nov 2020 07:37:03 +0000 (UTC)
Subject: Re: [PATCH 26/45] block: remove ->bd_contains
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20201128161510.347752-1-hch@lst.de>
 <20201128161510.347752-27-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <4b0799bd-ef77-5068-6957-04061b3f61ee@suse.de>
Date: Mon, 30 Nov 2020 08:37:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201128161510.347752-27-hch@lst.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_023704_276621_FD2DF577 
X-CRM114-Status: GOOD (  18.63  )
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

T24gMTEvMjgvMjAgNToxNCBQTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gTm93IHRoYXQg
ZWFjaCBoZF9zdHJ1Y3QgaGFzIGEgcmVmZXJlbmNlIHRvIHRoZSBjb3JyZXNwb25kaW5nCj4gYmxv
Y2tfZGV2aWNlLCB0aGVyZSBpcyBubyBuZWVkIGZvciB0aGUgYmRfY29udGFpbnMgcG9pbnRlci4g
IEFkZAo+IGEgYmRldl93aG9sZSgpIGhlbHBlciB0byBsb29rIHVwIHRoZSB3aG9sZSBkZXZpY2Ug
YmxvY2tfZGV2aWNlCj4gc3RydXR1cmUgaW5zdGVhZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJp
c3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KPiBSZXZpZXdlZC1ieTogR3JlZyBLcm9haC1IYXJ0
bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KPiBSZXZpZXdlZC1ieTogSmFuIEthcmEg
PGphY2tAc3VzZS5jej4KPiBBY2tlZC1ieTogVGVqdW4gSGVvIDx0akBrZXJuZWwub3JnPgo+IC0t
LQo+ICAgZHJpdmVycy9ibG9jay9sb29wLmMgICAgICB8ICAyICstCj4gICBkcml2ZXJzL3Njc2kv
c2NzaWNhbS5jICAgIHwgIDIgKy0KPiAgIGZzL2Jsb2NrX2Rldi5jICAgICAgICAgICAgfCAyMiAr
KysrKysrKy0tLS0tLS0tLS0tLS0tCj4gICBpbmNsdWRlL2xpbnV4L2Jsa190eXBlcy5oIHwgIDQg
KysrLQo+ICAgNCBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMo
LSkKPiAKUmV2aWV3ZWQtYnk6IEhhbm5lcyBSZWluZWNrZSA8aGFyZUBzdXNlLmRlPgoKQ2hlZXJz
LAoKSGFubmVzCi0tIApEci4gSGFubmVzIFJlaW5lY2tlICAgICAgICAgICAgICAgIEtlcm5lbCBT
dG9yYWdlIEFyY2hpdGVjdApoYXJlQHN1c2UuZGUgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICArNDkgOTExIDc0MDUzIDY4OApTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHbWJILCBNYXhmZWxk
c3RyLiA1LCA5MDQwOSBOw7xybmJlcmcKSFJCIDM2ODA5IChBRyBOw7xybmJlcmcpLCBHZXNjaMOk
ZnRzZsO8aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
