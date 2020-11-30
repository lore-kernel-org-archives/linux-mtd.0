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
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1893C63777
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 07:32:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 720CC20731
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 07:32:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zKMlfkWN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 720CC20731
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IYO56a4fTkx5wCufLwfzqXHugV4mjqdNr86l+EiorJY=; b=zKMlfkWNMIVQnyLZvuqc9TAFt
	3W8jTnFbeeTVmunowmQhdSe98Q3SICsetC9RuFwU4GUvkv4V/mfgbrY8CcQeDc5yMyKbul2uxFzxf
	0cweEj7AkYZDpDpg3HEPkxSEGzL6jDH30Ibq7V6UnHeEig4Ry5D1NQUBEDVb5xKwHVZReJgjoFpjg
	HSFHz2xIftb+4YMLLEvMbcAg1Xm5ASJpQYWq2R7p4UpGHGY3IbcRM3ydnx5dWZqvvUfONjUaC83NE
	XqM3McdI8Jg/nreCt/SkOVWnEWAfanaVwaTlcIVEu2jfpKC/8dCwZvkAiUv00HuUSOQMBFMRuJIOh
	f/NiGewgA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjdfE-0006dX-47; Mon, 30 Nov 2020 07:32:00 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjdfC-0006cn-25
 for linux-mtd@lists.infradead.org; Mon, 30 Nov 2020 07:31:58 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D91FAAC8F;
 Mon, 30 Nov 2020 07:31:56 +0000 (UTC)
Subject: Re: [PATCH 24/45] block: remove i_bdev
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20201128161510.347752-1-hch@lst.de>
 <20201128161510.347752-25-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <7ad63383-5f07-3fd2-d39b-b0db7905d094@suse.de>
Date: Mon, 30 Nov 2020 08:31:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201128161510.347752-25-hch@lst.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_023158_226611_96759334 
X-CRM114-Status: GOOD (  20.56  )
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

T24gMTEvMjgvMjAgNToxNCBQTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gU3dpdGNoIHRo
ZSBibG9jayBkZXZpY2UgbG9va3VwIGludGVyZmFjZXMgdG8gZGlyZWN0bHkgd29yayB3aXRoIGEg
ZGV2X3QKPiBzbyB0aGF0IHN0cnVjdCBibG9ja19kZXZpY2UgcmVmZXJlbmNlcyBhcmUgb25seSBh
Y3F1aXJlZCBieSB0aGUKPiBibGtkZXZfZ2V0IHZhcmlhbnRzIChhbmQgdGhlIGJsay1jZ3JvdXAg
c3BlY2lhbCBjYXNlKS4gIFRoaXMgbWVhbnMgdGhhdAo+IHdlIG5vdyBkb24ndCBuZWVkIGFuIGV4
dHJhIHJlZmVyZW5jZSBpbiB0aGUgaW5vZGUgYW5kIGNhbiBnZW5lcmFsbHkKPiBzaW1wbGlmeSBo
YW5kbGluZyBvZiBzdHJ1Y3QgYmxvY2tfZGV2aWNlIHRvIGtlZXAgdGhlIGxvb2t1cHMgY29udGFp
bmVkCj4gaW4gdGhlIGNvcmUgYmxvY2sgbGF5ZXIgY29kZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBD
aHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KPiBSZXZpZXdlZC1ieTogSmFuIEthcmEgPGph
Y2tAc3VzZS5jej4KPiBBY2tlZC1ieTogVGVqdW4gSGVvIDx0akBrZXJuZWwub3JnPgo+IEFja2Vk
LWJ5OiBDb2x5IExpIDxjb2x5bGlAc3VzZS5kZT4JCVtiY2FjaGVdCj4gLS0tCj4gICBibG9jay9p
b2N0bC5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMyArLQo+ICAgZHJpdmVy
cy9ibG9jay9sb29wLmMgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDggKy0KPiAgIGRyaXZl
cnMvbWQvYmNhY2hlL3N1cGVyLmMgICAgICAgICAgICAgICAgICAgIHwgIDIwICstCj4gICBkcml2
ZXJzL21kL2RtLXRhYmxlLmMgICAgICAgICAgICAgICAgICAgICAgICB8ICAgOSArLQo+ICAgZHJp
dmVycy9tdGQvbXRkc3VwZXIuYyAgICAgICAgICAgICAgICAgICAgICAgfCAgMTcgKy0KPiAgIGRy
aXZlcnMvdGFyZ2V0L3RhcmdldF9jb3JlX2ZpbGUuYyAgICAgICAgICAgIHwgICA2ICstCj4gICBk
cml2ZXJzL3VzYi9nYWRnZXQvZnVuY3Rpb24vc3RvcmFnZV9jb21tb24uYyB8ICAgOCArLQo+ICAg
ZnMvYmxvY2tfZGV2LmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxOTYgKysrKyst
LS0tLS0tLS0tLS0tLQo+ICAgZnMvYnRyZnMvdm9sdW1lcy5jICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgMTMgKy0KPiAgIGZzL2lub2RlLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgICAzIC0KPiAgIGZzL2ludGVybmFsLmggICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgICA3ICstCj4gICBmcy9pb191cmluZy5jICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAxMCArLQo+ICAgZnMvcGlwZS5jICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgIDUgKy0KPiAgIGZzL3F1b3RhL3F1b3RhLmMgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgIDE5ICstCj4gICBmcy9zdGF0ZnMuYyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAgMiArLQo+ICAgZnMvc3VwZXIuYyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgNDQgKystLS0KPiAgIGluY2x1ZGUvbGludXgvYmxrZGV2LmggICAgICAg
ICAgICAgICAgICAgICAgIHwgICAyICstCj4gICBpbmNsdWRlL2xpbnV4L2ZzLmggICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAgMSAtCj4gICAxOCBmaWxlcyBjaGFuZ2VkLCAxMjEgaW5zZXJ0
aW9ucygrKSwgMjUyIGRlbGV0aW9ucygtKQo+IApSZXZpZXdlZC1ieTogSGFubmVzIFJlaW5lY2tl
IDxoYXJlQHN1c2UuZGU+CgpDaGVlcnMsCgpIYW5uZXMKLS0gCkRyLiBIYW5uZXMgUmVpbmVja2Ug
ICAgICAgICAgICAgICAgS2VybmVsIFN0b3JhZ2UgQXJjaGl0ZWN0CmhhcmVAc3VzZS5kZSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICs0OSA5MTEgNzQwNTMgNjg4ClNVU0UgU29mdHdhcmUg
U29sdXRpb25zIEdtYkgsIE1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZwpIUkIgMzY4MDkg
KEFHIE7DvHJuYmVyZyksIEdlc2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXIKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
