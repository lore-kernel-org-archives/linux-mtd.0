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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 320B3C63777
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 07:36:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5286820643
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 07:36:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WX6fUNVT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5286820643
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aLHPzgp4oMVo2nKhzweUDKMRbsghBnUoFQrSTJcf++I=; b=WX6fUNVTLaPEAFu3/x6O2vvQ/
	pYDA7FOscadb1KdZzGovbWZ81z00arYpsFOEQK1YGfZ4WKCHKWVSYzAuswqErR4Gm3rCbGL9rKaN2
	rRd1en2vPmkLz4e9SYQmiiIbDrzD7JUqES0iH0gKEnwOHo8pdQUsW8kQ9wpoZ4QXjzbh6Ix7HVvhA
	CBB68jGNawnRpfwlRUZl4odkD9uUFQsiU7Lz2/syAhuuzlUsmGa44ToJXJHKOTf4MatzFNgpNV4Pl
	2P+spgRFlXbB4m4rpCOceQxqYglFagDVOQp8gSZKJw5NzP+ngta7MX910QztK1IEUOFMrHLs/T6Or
	x1NLCNuIw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjdjU-0007Dj-Gi; Mon, 30 Nov 2020 07:36:24 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjdjS-0007D3-7K
 for linux-mtd@lists.infradead.org; Mon, 30 Nov 2020 07:36:23 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 09E40AC6A;
 Mon, 30 Nov 2020 07:36:21 +0000 (UTC)
Subject: Re: [PATCH 25/45] block: simplify bdev/disk lookup in blkdev_get
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20201128161510.347752-1-hch@lst.de>
 <20201128161510.347752-26-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <daa050e6-8758-a458-91fe-046c5690a336@suse.de>
Date: Mon, 30 Nov 2020 08:36:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201128161510.347752-26-hch@lst.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_023622_413855_9574590C 
X-CRM114-Status: GOOD (  26.57  )
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

T24gMTEvMjgvMjAgNToxNCBQTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gVG8gc2ltcGxp
ZnkgYmxvY2sgZGV2aWNlIGxvb2t1cCBhbmQgYSBmZXcgb3RoZXIgdXBjb21pbmcgYXJlYXMsIG1h
a2Ugc3VyZQo+IHRoYXQgd2UgYWx3YXlzIGhhdmUgYSBzdHJ1Y3QgYmxvY2tfZGV2aWNlIGF2YWls
YWJsZSBmb3IgZWFjaCBkaXNrIGFuZAo+IGVhY2ggcGFydGl0aW9uLCBhbmQgb25seSBmaW5kIGV4
aXN0aW5nIGJsb2NrIGRldmljZXMgaW4gYmRnZXQuICBUaGUgb25seQo+IGRvd25zaWRlIG9mIHRo
aXMgaXMgdGhhdCBlYWNoIGRldmljZSBhbmQgcGFydGl0aW9uIHVzZXMgYSBsaXR0bGUgbW9yZQo+
IG1lbW9yeS4gIFRoZSB1cHNpZGUgd2lsbCBiZSB0aGF0IGEgbG90IG9mIGNvZGUgY2FuIGJlIHNp
bXBsaWZpZWQuCj4gCj4gV2l0aCB0aGF0IGFsbCB3ZSBuZWVkIHRvIGxvb2sgdXAgdGhlIGJsb2Nr
IGRldmljZSBpcyB0byBsb29rdXAgdGhlIGlub2RlCj4gYW5kIGRvIGEgZmV3IHNhbml0eSBjaGVj
a3Mgb24gdGhlIGdlbmRpc2ssIGluc3RlYWQgb2YgdGhlIHNlcGFyYXRlIGxvb2t1cAo+IGZvciB0
aGUgZ2VuZGlzay4gIEZvciBibGstY2dyb3VwIHdoaWNoIHdhbnRzIHRvIGFjY2VzcyBhIGdlbmRp
c2sgd2l0aG91dAo+IG9wZW5pbmcgaXQsIGEgbmV3IGJsa2Rldl97Z2V0LHB1dH1fbm9fb3BlbiBs
b3ctbGV2ZWwgaW50ZXJmYWNlIGlzIGFkZGVkCj4gdG8gcmVwbGFjZSB0aGUgcHJldmlvdXMgZ2V0
X2dlbmRpc2sgdXNlLgo+IAo+IE5vdGUgdGhhdCB0aGUgY2hhbmdlIHRvIGxvb2sgdXAgYmxvY2sg
ZGV2aWNlIGRpcmVjdGx5IGluc3RlYWQgb2YgdGhlIHR3bwo+IHN0ZXAgbG9va3VwIHVzaW5nIHN0
cnVjdCBnZW5kaXNrIGNhdXNlcyBhIHN1YnRpbGUgY2hhbmdlIGluIGJlaGF2aW9yOgo+IGFjY2Vz
c2luZyBhIG5vbi1leGlzdGluZyBwYXJ0aXRpb24gb24gYW4gZXhpc3RpbmcgYmxvY2sgZGV2aWNl
IGNhbiBub3cKPiBjYXVzZSBhIGNhbGwgdG8gcmVxdWVzdF9tb2R1bGUuICBUaGF0IGNhbGwgaXMg
aGFybWxlc3MsIGFuZCBpbiBwcmFjdGljZQo+IG5vIHJlY2VudCBzeXN0ZW0gd2lsbCBhY2Nlc3Mg
dGhlc2Ugbm9kZXMgYXMgdGhleSBhcmVuJ3QgY3JlYXRlZCBieSB1ZGV2Cj4gYW5kIHN0YXRpYyAv
ZGV2LyBzZXR1cHMgYXJlIHVudXN1YWwuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhl
bGx3aWcgPGhjaEBsc3QuZGU+Cj4gLS0tCj4gICBibG9jay9ibGstY2dyb3VwLmMgICAgICAgICB8
ICA0MiArKysrLS0tLQo+ICAgYmxvY2svYmxrLWlvY29zdC5jICAgICAgICAgfCAgMzYgKysrLS0t
LQo+ICAgYmxvY2svYmxrLmggICAgICAgICAgICAgICAgfCAgIDIgKy0KPiAgIGJsb2NrL2dlbmhk
LmMgICAgICAgICAgICAgIHwgMjEwICsrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KPiAgIGJsb2NrL3BhcnRpdGlvbnMvY29yZS5jICAgIHwgIDI5ICsrLS0tCj4gICBmcy9ibG9j
a19kZXYuYyAgICAgICAgICAgICB8IDE3NyArKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0t
Cj4gICBpbmNsdWRlL2xpbnV4L2Jsay1jZ3JvdXAuaCB8ICAgNCArLQo+ICAgaW5jbHVkZS9saW51
eC9ibGtkZXYuaCAgICAgfCAgIDYgKysKPiAgIGluY2x1ZGUvbGludXgvZ2VuaGQuaCAgICAgIHwg
ICA3ICstCj4gICA5IGZpbGVzIGNoYW5nZWQsIDE5NCBpbnNlcnRpb25zKCspLCAzMTkgZGVsZXRp
b25zKC0pCj4gClJldmlld2VkLWJ5OiBIYW5uZXMgUmVpbmVja2UgPGhhcmVAc3VzZS5kZT4KCkNo
ZWVycywKCkhhbm5lcwotLSAKRHIuIEhhbm5lcyBSZWluZWNrZSAgICAgICAgICAgICAgICBLZXJu
ZWwgU3RvcmFnZSBBcmNoaXRlY3QKaGFyZUBzdXNlLmRlICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgKzQ5IDkxMSA3NDA1MyA2ODgKU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR21iSCwgTWF4
ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnCkhSQiAzNjgwOSAoQUcgTsO8cm5iZXJnKSwgR2Vz
Y2jDpGZ0c2bDvGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZlcgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
