Return-Path: <SRS0=1rsk=FB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A55BC2D0E4
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2020 12:05:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB54221D81
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2020 12:05:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D4wLFeqh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB54221D81
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JrMvLUmCgozxIqCTf5AnSnTvin039F3EJkwbpTAm9A4=; b=D4wLFeqhEtypDnCPioVEB8N1Z
	5FfOsy4v58GzTYR+LURmAEBDd1wZpbA/PlfN29Yr4vx4qjNlY6tPRsATVl7KzSqLmKZYiogHLSWhv
	MLJ/w9EO1Ohw75YzYKlds9No7AG0pQh7f2nUnff8oNK1vmHiPEoAt28JmScmGOahVDZOHUnOwdN+0
	UdSEs2CeltDUqHhS1b5Ym/NREd6n3aBT4fPRtPlDkMVWE8uCl6psvpWt9bxaJcCOf20QDRK5MwLrK
	XVneF5bcXN11BJ06yIINQ96PgXJVWicPgBYua2GG4BHaK/0nv1BBX4uwFp57lf8WnV0FEye/dCe9A
	X1/W7zVWg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kicUW-00066U-1l; Fri, 27 Nov 2020 12:04:44 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kicUT-00064y-9N
 for linux-mtd@lists.infradead.org; Fri, 27 Nov 2020 12:04:42 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2D8BFADCA;
 Fri, 27 Nov 2020 12:04:40 +0000 (UTC)
Subject: Re: [PATCH 13/44] block: use disk_part_iter_exit in
 disk_part_iter_next
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20201126130422.92945-1-hch@lst.de>
 <20201126130422.92945-14-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <1624f174-4182-744c-56ad-b50a391a6bb7@suse.de>
Date: Fri, 27 Nov 2020 13:04:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201126130422.92945-14-hch@lst.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_070441_462939_4577C395 
X-CRM114-Status: GOOD (  22.03  )
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

T24gMTEvMjYvMjAgMjowMyBQTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gQ2FsbCBkaXNr
X3BhcnRfaXRlcl9leGl0IGluIGRpc2tfcGFydF9pdGVyX25leHQgaW5zdGVhZCBvZiBkdXBsaWNh
dGluZwo+IHRoZSBmdW5jdGlvbmFsaXR5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBI
ZWxsd2lnIDxoY2hAbHN0LmRlPgo+IFJldmlld2VkLWJ5OiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdy
ZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgo+IFJldmlld2VkLWJ5OiBKYW4gS2FyYSA8amFja0Bz
dXNlLmN6Pgo+IFJldmlld2VkLWJ5OiBKb2hhbm5lcyBUaHVtc2hpcm4gPGpvaGFubmVzLnRodW1z
aGlybkB3ZGMuY29tPgo+IEFja2VkLWJ5OiBUZWp1biBIZW8gPHRqQGtlcm5lbC5vcmc+Cj4gLS0t
Cj4gICBibG9jay9nZW5oZC5jIHwgMyArLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYmxvY2svZ2VuaGQuYyBiL2Js
b2NrL2dlbmhkLmMKPiBpbmRleCA0ZTAzOTUyNGY5MmI4Zi4uMGJkOWM0MWRkNGNiNjkgMTAwNjQ0
Cj4gLS0tIGEvYmxvY2svZ2VuaGQuYwo+ICsrKyBiL2Jsb2NrL2dlbmhkLmMKPiBAQCAtMjI3LDgg
KzIyNyw3IEBAIHN0cnVjdCBoZF9zdHJ1Y3QgKmRpc2tfcGFydF9pdGVyX25leHQoc3RydWN0IGRp
c2tfcGFydF9pdGVyICpwaXRlcikKPiAgIAlpbnQgaW5jLCBlbmQ7Cj4gICAKPiAgIAkvKiBwdXQg
dGhlIGxhc3QgcGFydGl0aW9uICovCj4gLQlkaXNrX3B1dF9wYXJ0KHBpdGVyLT5wYXJ0KTsKPiAt
CXBpdGVyLT5wYXJ0ID0gTlVMTDsKPiArCWRpc2tfcGFydF9pdGVyX2V4aXQocGl0ZXIpOwo+ICAg
Cj4gICAJLyogZ2V0IHBhcnRfdGJsICovCj4gICAJcmN1X3JlYWRfbG9jaygpOwo+IApSZXZpZXdl
ZC1ieTogSGFubmVzIFJlaW5lY2tlIDxoYXJlQHN1c2UuZGU+CgpDaGVlcnMsCgpIYW5uZXMKLS0g
CkRyLiBIYW5uZXMgUmVpbmVja2UgICAgICAgICAgICAgICAgS2VybmVsIFN0b3JhZ2UgQXJjaGl0
ZWN0CmhhcmVAc3VzZS5kZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICs0OSA5MTEgNzQw
NTMgNjg4ClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdtYkgsIE1heGZlbGRzdHIuIDUsIDkwNDA5
IE7DvHJuYmVyZwpIUkIgMzY4MDkgKEFHIE7DvHJuYmVyZyksIEdlc2Now6RmdHNmw7xocmVyOiBG
ZWxpeCBJbWVuZMO2cmZmZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
