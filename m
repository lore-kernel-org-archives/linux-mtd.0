Return-Path: <SRS0=z5ty=FE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ED25C63777
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 07:47:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DADF120709
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 07:47:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S9M5fh79"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DADF120709
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=m5pbYp5XCYmCsnTDcRJ0l9EiA86tLRXz++mZJeuWhdw=; b=S9M5fh79LDaBtmAKCZko8ngV4
	TxHrWGsK56oFmUuqL2r1Js+2ZCN2PpfuWCO985Nb2/zr891ymG0l6tFYeWMOgpJWAIoSYeiKY3Kew
	kaJb5gwTKi8oUKa/FXuy1ANkKNtCyy3bfritQPb6j1Jd5vtIqkOJ6iTZ3SmBs7vMf4XqiG0M84Fec
	uPM/+27fYIELpqmhTeMeAVYqH47Pecq01Q8wm4Fwd71gfz0r3aApXzjEntNbPlIFS4rwlkUPnasvC
	uXq7GYNgpjXG3vq+Qn0RrrIHJ3RvnxVsXDSTyvL4un9/AC+sGSN2fhaH8i0HYz6RXqkVAhmMCqIMS
	aPLlfN+QQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjdtK-0001Wn-Fr; Mon, 30 Nov 2020 07:46:34 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjdtH-0001Vb-QF
 for linux-mtd@lists.infradead.org; Mon, 30 Nov 2020 07:46:32 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5BC21AC55;
 Mon, 30 Nov 2020 07:46:30 +0000 (UTC)
Subject: Re: [PATCH 37/45] block: allocate struct hd_struct as part of struct
 bdev_inode
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20201128161510.347752-1-hch@lst.de>
 <20201128161510.347752-38-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <e20d55a3-5d82-6e74-3cad-35b58fe1ceb1@suse.de>
Date: Mon, 30 Nov 2020 08:46:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201128161510.347752-38-hch@lst.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_024631_993055_6A418527 
X-CRM114-Status: GOOD (  19.57  )
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

T24gMTEvMjgvMjAgNToxNSBQTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gQWxsb2NhdGUg
aGRfc3RydWN0IHRvZ2V0aGVyIHdpdGggc3RydWN0IGJsb2NrX2RldmljZSB0byBwcmUtbG9hZAo+
IHRoZSBsaWZldGltZSBydWxlIGNoYW5nZXMgaW4gcHJlcGFyYXRpb24gb2YgbWVyZ2luZyB0aGUg
dHdvIHN0cnVjdHVyZXMuCj4gCj4gTm90ZSB0aGF0IHBhcnQwIHdhcyBwcmV2aW91c2x5IGVtYmVk
ZGVkIGludG8gc3RydWN0IGdlbmRpc2ssIGJ1dCBpcwo+IGEgc2VwYXJhdGUgYWxsb2NhdGlvbiBu
b3csIGFuZCBhbHJlYWR5IHBvaW50cyB0byB0aGUgYmxvY2tfZGV2aWNlIGluc3RlYWQKPiBvZiB0
aGUgaGRfc3RydWN0LiAgVGhlIGxpZmV0aW1lIG9mIHN0cnVjdCBnZW5kaXNrIGlzIHN0aWxsIGNv
bnRyb2xsZWQgYnkKPiB0aGUgc3RydWN0IGRldmljZSBlbWJlZGRlZCBpbiB0aGUgcGFydDAgaGRf
c3RydWN0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRl
Pgo+IC0tLQo+ICAgYmxvY2svYmxrLWNvcmUuYyAgICAgICAgICAgICAgICAgICB8IDE2ICsrKyst
LS0KPiAgIGJsb2NrL2Jsay1mbHVzaC5jICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICAgYmxv
Y2svYmxrLW1lcmdlLmMgICAgICAgICAgICAgICAgICB8ICAyIC0KPiAgIGJsb2NrL2Jsay5oICAg
ICAgICAgICAgICAgICAgICAgICAgfCAyMSAtLS0tLS0tLS0tCj4gICBibG9jay9nZW5oZC5jICAg
ICAgICAgICAgICAgICAgICAgIHwgNTAgKysrKysrKysrLS0tLS0tLS0tLS0tLQo+ICAgYmxvY2sv
cGFydGl0aW9ucy9jb3JlLmMgICAgICAgICAgICB8IDY3ICsrKy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQo+ICAgZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfcmVjZWl2ZXIuYyB8ICAyICstCj4g
ICBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF93b3JrZXIuYyAgIHwgIDMgKy0KPiAgIGRyaXZlcnMv
YmxvY2svenJhbS96cmFtX2Rydi5jICAgICAgfCAgMiArLQo+ICAgZHJpdmVycy9tZC9kbS5jICAg
ICAgICAgICAgICAgICAgICB8ICA0ICstCj4gICBkcml2ZXJzL21kL21kLmMgICAgICAgICAgICAg
ICAgICAgIHwgIDIgKy0KPiAgIGZzL2Jsb2NrX2Rldi5jICAgICAgICAgICAgICAgICAgICAgfCAz
OSArKysrKystLS0tLS0tLS0tLQo+ICAgaW5jbHVkZS9saW51eC9ibGtfdHlwZXMuaCAgICAgICAg
ICB8ICAyICstCj4gICBpbmNsdWRlL2xpbnV4L2dlbmhkLmggICAgICAgICAgICAgIHwgMTQgKysr
LS0tLQo+ICAgaW5jbHVkZS9saW51eC9wYXJ0X3N0YXQuaCAgICAgICAgICB8ICA0ICstCj4gICAx
NSBmaWxlcyBjaGFuZ2VkLCA2MSBpbnNlcnRpb25zKCspLCAxNjkgZGVsZXRpb25zKC0pCj4gClJl
dmlld2VkLWJ5OiBIYW5uZXMgUmVpbmVja2UgPGhhcmVAc3VzZS5kZT4KCkNoZWVycywKCkhhbm5l
cwotLSAKRHIuIEhhbm5lcyBSZWluZWNrZSAgICAgICAgICAgICAgICBLZXJuZWwgU3RvcmFnZSBB
cmNoaXRlY3QKaGFyZUBzdXNlLmRlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKzQ5IDkx
MSA3NDA1MyA2ODgKU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR21iSCwgTWF4ZmVsZHN0ci4gNSwg
OTA0MDkgTsO8cm5iZXJnCkhSQiAzNjgwOSAoQUcgTsO8cm5iZXJnKSwgR2VzY2jDpGZ0c2bDvGhy
ZXI6IEZlbGl4IEltZW5kw7ZyZmZlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
