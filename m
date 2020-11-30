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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7391FC63777
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 07:10:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3FFD206CA
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 07:10:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Dky1WS70"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3FFD206CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=suNXghP3V+nFX+8iRbPEWtLY7OWvqk/qqnpVAlP5tWc=; b=Dky1WS7040J/MmahfFvL+NHim
	TjB8YeQmzJcl984BQ5TDtGB9DRO24TcSWyPUur4HoAfyfxMye+RB+AM9uqQ8bZRzsslk8fsbxV3V+
	2re4EVGw4RQYbz+07XRH7UOcjSliWFzVMyzsPTg5BgOucRedlvBUgee9Z18WY4vKtc4gYDeLN2kMI
	D3fH5Mv0/lvA0qYJs0SqkuvXIDC2Dh4O8e3Z4l8GULfc7qHEsnQSancCwTnKyL/u458sKwy8CQdGB
	1GDwiI0AYJM7l+VFyeMUyCtpqCCmvBUWIT4/ISIqqtHcKBK72TETYHNXacJVsP4jmYyjeL8RVSDRy
	PGcGNtnjg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjdKF-00032z-Et; Mon, 30 Nov 2020 07:10:20 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjdKB-00030h-VD
 for linux-mtd@lists.infradead.org; Mon, 30 Nov 2020 07:10:17 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9CD36AC6A;
 Mon, 30 Nov 2020 07:10:14 +0000 (UTC)
Subject: Re: [PATCH 15/45] block: change the hash used for looking up block
 devices
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20201128161510.347752-1-hch@lst.de>
 <20201128161510.347752-16-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <9520bc81-43f6-889a-7e39-007f6f5ab9bf@suse.de>
Date: Mon, 30 Nov 2020 08:10:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201128161510.347752-16-hch@lst.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_021016_188370_0D1EBC85 
X-CRM114-Status: GOOD (  25.48  )
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

T24gMTEvMjgvMjAgNToxNCBQTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gQWRkaW5nIHRo
ZSBtaW5vciB0byB0aGUgbWFqb3IgY3JlYXRlcyB0b25zIG9mIHBvaW50bGVzcyBjb25mbGljdHMu
IEp1c3QKPiB1c2UgdGhlIGRldl90IGl0c2VsZiwgd2hpY2ggaXMgMzItYml0cyBhbmQgdGh1cyBp
cyBndWFyYW50ZWVkIHRvIGZpdAo+IGludG8gaW5vX3QuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hy
aXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gUmV2aWV3ZWQtYnk6IEdyZWcgS3JvYWgtSGFy
dG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+Cj4gUmV2aWV3ZWQtYnk6IEphbiBLYXJh
IDxqYWNrQHN1c2UuY3o+Cj4gQWNrZWQtYnk6IFRlanVuIEhlbyA8dGpAa2VybmVsLm9yZz4KPiAt
LS0KPiAgIGZzL2Jsb2NrX2Rldi5jIHwgMjYgKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAg
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDI0IGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9mcy9ibG9ja19kZXYuYyBiL2ZzL2Jsb2NrX2Rldi5jCj4gaW5kZXggYzU3NTUx
NTBjNmJlNjIuLmQ3MDdhYjM3NmRhODZlIDEwMDY0NAo+IC0tLSBhL2ZzL2Jsb2NrX2Rldi5jCj4g
KysrIGIvZnMvYmxvY2tfZGV2LmMKPiBAQCAtODYzLDM1ICs4NjMsMTIgQEAgdm9pZCBfX2luaXQg
YmRldl9jYWNoZV9pbml0KHZvaWQpCj4gICAJYmxvY2tkZXZfc3VwZXJibG9jayA9IGJkX21udC0+
bW50X3NiOyAgIC8qIEZvciB3cml0ZWJhY2sgKi8KPiAgIH0KPiAgIAo+IC0vKgo+IC0gKiBNb3N0
IGxpa2VseSBfdmVyeV8gYmFkIG9uZSAtIGJ1dCB0aGVuIGl0J3MgaGFyZGx5IGNyaXRpY2FsIGZv
ciBzbWFsbAo+IC0gKiAvZGV2IGFuZCBjYW4gYmUgZml4ZWQgd2hlbiBzb21lYm9keSB3aWxsIG5l
ZWQgcmVhbGx5IGxhcmdlIG9uZS4KPiAtICogS2VlcCBpbiBtaW5kIHRoYXQgaXQgd2lsbCBiZSBm
ZWQgdGhyb3VnaCBpY2FjaGUgaGFzaCBmdW5jdGlvbiB0b28uCj4gLSAqLwo+IC1zdGF0aWMgaW5s
aW5lIHVuc2lnbmVkIGxvbmcgaGFzaChkZXZfdCBkZXYpCj4gLXsKPiAtCXJldHVybiBNQUpPUihk
ZXYpK01JTk9SKGRldik7Cj4gLX0KPiAtCj4gLXN0YXRpYyBpbnQgYmRldl90ZXN0KHN0cnVjdCBp
bm9kZSAqaW5vZGUsIHZvaWQgKmRhdGEpCj4gLXsKPiAtCXJldHVybiBCREVWX0koaW5vZGUpLT5i
ZGV2LmJkX2RldiA9PSAqKGRldl90ICopZGF0YTsKPiAtfQo+IC0KPiAtc3RhdGljIGludCBiZGV2
X3NldChzdHJ1Y3QgaW5vZGUgKmlub2RlLCB2b2lkICpkYXRhKQo+IC17Cj4gLQlCREVWX0koaW5v
ZGUpLT5iZGV2LmJkX2RldiA9ICooZGV2X3QgKilkYXRhOwo+IC0JcmV0dXJuIDA7Cj4gLX0KPiAt
Cj4gICBzdGF0aWMgc3RydWN0IGJsb2NrX2RldmljZSAqYmRnZXQoZGV2X3QgZGV2KQo+ICAgewo+
ICAgCXN0cnVjdCBibG9ja19kZXZpY2UgKmJkZXY7Cj4gICAJc3RydWN0IGlub2RlICppbm9kZTsK
PiAgIAo+IC0JaW5vZGUgPSBpZ2V0NV9sb2NrZWQoYmxvY2tkZXZfc3VwZXJibG9jaywgaGFzaChk
ZXYpLAo+IC0JCQliZGV2X3Rlc3QsIGJkZXZfc2V0LCAmZGV2KTsKPiAtCj4gKwlpbm9kZSA9IGln
ZXRfbG9ja2VkKGJsb2NrZGV2X3N1cGVyYmxvY2ssIGRldik7Cj4gICAJaWYgKCFpbm9kZSkKPiAg
IAkJcmV0dXJuIE5VTEw7Cj4gICAKPiBAQCAtOTAzLDYgKzg4MCw3IEBAIHN0YXRpYyBzdHJ1Y3Qg
YmxvY2tfZGV2aWNlICpiZGdldChkZXZfdCBkZXYpCj4gICAJCWJkZXYtPmJkX3N1cGVyID0gTlVM
TDsKPiAgIAkJYmRldi0+YmRfaW5vZGUgPSBpbm9kZTsKPiAgIAkJYmRldi0+YmRfcGFydF9jb3Vu
dCA9IDA7Cj4gKwkJYmRldi0+YmRfZGV2ID0gZGV2Owo+ICAgCQlpbm9kZS0+aV9tb2RlID0gU19J
RkJMSzsKPiAgIAkJaW5vZGUtPmlfcmRldiA9IGRldjsKPiAgIAkJaW5vZGUtPmlfYmRldiA9IGJk
ZXY7Cj4gClJldmlld2VkLWJ5OiBIYW5uZXMgUmVpbmVja2UgPGhhcmVAc3VzZS5kZT4KCkNoZWVy
cywKCkhhbm5lcwotLSAKRHIuIEhhbm5lcyBSZWluZWNrZSAgICAgICAgICAgICAgICBLZXJuZWwg
U3RvcmFnZSBBcmNoaXRlY3QKaGFyZUBzdXNlLmRlICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgKzQ5IDkxMSA3NDA1MyA2ODgKU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR21iSCwgTWF4ZmVs
ZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnCkhSQiAzNjgwOSAoQUcgTsO8cm5iZXJnKSwgR2VzY2jD
pGZ0c2bDvGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZlcgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
