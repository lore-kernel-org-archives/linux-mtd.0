Return-Path: <SRS0=1rsk=FB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39A3BC63777
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2020 10:37:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9E77208CA
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2020 10:37:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B6Z58jwH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9E77208CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fhdvcvH3lcYhTs8FOhajInMTmRTm6r3D7YQhovHCM48=; b=B6Z58jwHcWDgdYQkaugYx6hz6
	eZFD1frR3HaFKtTE3qjLP6WAxiVZIT+++D4s6xU2aWvzqnLkmETBkc7zfB2B0nDqWXlgl6ZDIeddj
	uYvIaKyZebJm4n03ay1+Clzd/OpmdUAYfXqhTOQMpnmETpVtfwzr8qz/zybqS9P3yfW82RxQR1z4d
	P68LokkpGDy47J6aLP62ibwqNxDcLHCAgg8so1eoaM5xdrmn+HYDLHPM50hscEbR9953junPrTaZy
	8nsaXm+PeQUHEM0wKpS/91/HlIZx2VBhfB+XFkmISenqezk6nB4XI0dqMXKq2nLJeHFk3GlFt7vTa
	YvguMiL0g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kib6z-00006m-EN; Fri, 27 Nov 2020 10:36:21 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kib6w-00005s-KG
 for linux-mtd@lists.infradead.org; Fri, 27 Nov 2020 10:36:19 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A2770AC75;
 Fri, 27 Nov 2020 10:36:16 +0000 (UTC)
Subject: Re: [PATCH 09/44] dm: remove the block_device reference in struct
 mapped_device
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20201126130422.92945-1-hch@lst.de>
 <20201126130422.92945-10-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <38aa5185-1b96-f32f-9234-0d3a54a61119@suse.de>
Date: Fri, 27 Nov 2020 11:36:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201126130422.92945-10-hch@lst.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_053618_814919_052E0CC2 
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

T24gMTEvMjYvMjAgMjowMyBQTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gR2V0IHJpZCBv
ZiB0aGUgbG9uZy1sYXN0aW5nIHN0cnVjdCBibG9ja19kZXZpY2UgcmVmZXJlbmNlIGluCj4gc3Ry
dWN0IG1hcHBlZF9kZXZpY2UuICBUaGUgb25seSByZW1haW5pbmcgdXNlciBpcyB0aGUgZnJlZXpl
IGNvZGUsCj4gd2hlcmUgd2UgY2FuIHRyaXZpYWxseSBsb29rIHVwIHRoZSBibG9jayBkZXZpY2Ug
YXQgZnJlZXplIHRpbWUKPiBhbmQgcmVsZWFzZSB0aGUgcmVmZXJlbmNlIGF0IHRoYXcgdGltZS4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KPiBBY2tl
ZC1ieTogTWlrZSBTbml0emVyIDxzbml0emVyQHJlZGhhdC5jb20+Cj4gLS0tCj4gICBkcml2ZXJz
L21kL2RtLWNvcmUuaCB8ICAyIC0tCj4gICBkcml2ZXJzL21kL2RtLmMgICAgICB8IDI1ICsrKysr
KysrKysrKysrLS0tLS0tLS0tLS0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygr
KSwgMTMgZGVsZXRpb25zKC0pCj4gClJldmlld2VkLWJ5OiBIYW5uZXMgUmVpbmVja2UgPGhhcmVA
c3VzZS5kZT4KCkNoZWVycywKCkhhbm5lcwotLSAKRHIuIEhhbm5lcyBSZWluZWNrZSAgICAgICAg
ICAgICAgICBLZXJuZWwgU3RvcmFnZSBBcmNoaXRlY3QKaGFyZUBzdXNlLmRlICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgKzQ5IDkxMSA3NDA1MyA2ODgKU1VTRSBTb2Z0d2FyZSBTb2x1dGlv
bnMgR21iSCwgTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnCkhSQiAzNjgwOSAoQUcgTsO8
cm5iZXJnKSwgR2VzY2jDpGZ0c2bDvGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZlcgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
