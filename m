Return-Path: <SRS0=1rsk=FB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94014C2D0E4
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2020 10:37:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B7A221D46
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2020 10:37:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yylpXLDS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B7A221D46
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5pw3CU1/54XgeZrXLUhQlI2fLHyFCiRNlyHCfxOtK4U=; b=yylpXLDSTQKMuz1C0ZOBlTZjV
	loomOdSYG22urdNDvLVmNwdfiEnqGj1tC0x+QnqChWWSlXsA6gFJbp1O675mQAk7HjPtNb7i3eDkM
	z+p58qLglPSFuoTUjSxO5ocfKqUyD1cF50YSOma5W0BdvuRKUY/wzJC3GTOmlmbQTfC1hAZQ5elwY
	LcsvOZ/HQ2N0mBAnAqFX1EuQZ3SL228Wc9h048IQZWOczERHJho5svgE1tpDDFW4fz5qVzEOlagaT
	U8uuN7A/aenkjw2/KU/M7O58ALzjSw6iTuZGiBhM3FnhMWXWf+mzEozRvsLea6GTenN2WWnLNOL46
	jYPF+jZHA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kib7v-0000Pa-4H; Fri, 27 Nov 2020 10:37:19 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kib7s-0000O4-66
 for linux-mtd@lists.infradead.org; Fri, 27 Nov 2020 10:37:17 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7E166AF38;
 Fri, 27 Nov 2020 10:37:14 +0000 (UTC)
Subject: Re: [PATCH 11/44] block: remove a superflous check in blkpg_do_ioctl
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20201126130422.92945-1-hch@lst.de>
 <20201126130422.92945-12-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <af25c440-de15-3ba0-9f29-df708106c7d3@suse.de>
Date: Fri, 27 Nov 2020 11:37:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201126130422.92945-12-hch@lst.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_053716_400700_927D5C90 
X-CRM114-Status: GOOD (  22.69  )
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

T24gMTEvMjYvMjAgMjowMyBQTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gc2VjdG9yX3Qg
aXMgbm93IGFsd2F5cyBhIHU2NCwgc28gdGhpcyBjaGVjayBpcyBub3QgbmVlZGVkLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+IEFja2VkLWJ5OiBU
ZWp1biBIZW8gPHRqQGtlcm5lbC5vcmc+Cj4gUmV2aWV3ZWQtYnk6IEphbiBLYXJhIDxqYWNrQHN1
c2UuY3o+Cj4gLS0tCj4gICBibG9jay9pb2N0bC5jIHwgOSAtLS0tLS0tLS0KPiAgIDEgZmlsZSBj
aGFuZ2VkLCA5IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9ibG9jay9pb2N0bC5jIGIv
YmxvY2svaW9jdGwuYwo+IGluZGV4IDZiNzg1MTgxMzQ0ZmUxLi4wYzA5YmI3YTZmZjM1ZiAxMDA2
NDQKPiAtLS0gYS9ibG9jay9pb2N0bC5jCj4gKysrIGIvYmxvY2svaW9jdGwuYwo+IEBAIC0zNSwx
NSArMzUsNiBAQCBzdGF0aWMgaW50IGJsa3BnX2RvX2lvY3RsKHN0cnVjdCBibG9ja19kZXZpY2Ug
KmJkZXYsCj4gICAJc3RhcnQgPSBwLnN0YXJ0ID4+IFNFQ1RPUl9TSElGVDsKPiAgIAlsZW5ndGgg
PSBwLmxlbmd0aCA+PiBTRUNUT1JfU0hJRlQ7Cj4gICAKPiAtCS8qIGNoZWNrIGZvciBmaXQgaW4g
YSBoZF9zdHJ1Y3QgKi8KPiAtCWlmIChzaXplb2Yoc2VjdG9yX3QpIDwgc2l6ZW9mKGxvbmcgbG9u
ZykpIHsKPiAtCQlsb25nIHBzdGFydCA9IHN0YXJ0LCBwbGVuZ3RoID0gbGVuZ3RoOwo+IC0KPiAt
CQlpZiAocHN0YXJ0ICE9IHN0YXJ0IHx8IHBsZW5ndGggIT0gbGVuZ3RoIHx8IHBzdGFydCA8IDAg
fHwKPiAtCQkgICAgcGxlbmd0aCA8IDAgfHwgcC5wbm8gPiA2NTUzNSkKPiAtCQkJcmV0dXJuIC1F
SU5WQUw7Cj4gLQl9Cj4gLQo+ICAgCXN3aXRjaCAob3ApIHsKPiAgIAljYXNlIEJMS1BHX0FERF9Q
QVJUSVRJT046Cj4gICAJCS8qIGNoZWNrIGlmIHBhcnRpdGlvbiBpcyBhbGlnbmVkIHRvIGJsb2Nr
c2l6ZSAqLwo+IApSZXZpZXdlZC1ieTogSGFubmVzIFJlaW5lY2tlIDxoYXJlQHN1c2UuZGU+CgpD
aGVlcnMsCgpIYW5uZXMKLS0gCkRyLiBIYW5uZXMgUmVpbmVja2UgICAgICAgICAgICAgICAgS2Vy
bmVsIFN0b3JhZ2UgQXJjaGl0ZWN0CmhhcmVAc3VzZS5kZSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICs0OSA5MTEgNzQwNTMgNjg4ClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdtYkgsIE1h
eGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZwpIUkIgMzY4MDkgKEFHIE7DvHJuYmVyZyksIEdl
c2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXIKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
