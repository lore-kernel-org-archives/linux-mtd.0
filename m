Return-Path: <SRS0=z5ty=FE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3400C5519F
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 07:53:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E38420709
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 07:53:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nasPJu+z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E38420709
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OS/grM3+WhCgom3Hdaq5UgIVwG9cUPzPGw0vcn6z4AE=; b=nasPJu+zYJQZJWhqF1LIfAT0v
	/YCKhksrqctgu/vOw5p4/aXxxTyZh5TxmYHrc7plyRq79Q/RZW88uvL9P+S4HBT3qmaopgFqylmLf
	LE33my1qFSXf22spy45bNImqpPfld7EO03+KO11MByKkJ/MK/sq4QzPM4z6iSmOeJhiMLn0XszE5b
	5E3aeTPdlgTgHAQzvNEEcDzv94W+LD8oXcbpmRxSvcuEXH+OW0DGyENpmj0J7Rv9xnahS+NeM/RR/
	2805s5e7KVTT6YhSQhg1Kz8F+l2mOr+Ccjft1yJ3EWz2vmp0P+RNYgq0Ww2bJj0OjISSwGWOFJR+Y
	KjqAVGINA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjdzG-00041F-Ng; Mon, 30 Nov 2020 07:52:42 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjdyc-0003e0-15
 for linux-mtd@lists.infradead.org; Mon, 30 Nov 2020 07:52:02 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2190FAC8F;
 Mon, 30 Nov 2020 07:52:00 +0000 (UTC)
Subject: Re: [PATCH 45/45] block: stop using bdget_disk for partition 0
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20201128161510.347752-1-hch@lst.de>
 <20201128161510.347752-46-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <6ee4669e-69c1-eb41-c37e-3794d3207e3a@suse.de>
Date: Mon, 30 Nov 2020 08:51:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201128161510.347752-46-hch@lst.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_025202_255427_6B9C4D65 
X-CRM114-Status: GOOD (  18.73  )
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

T24gMTEvMjgvMjAgNToxNSBQTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gV2UgY2FuIGp1
c3QgZGVyZWZlcmVuY2UgdGhlIHBvaW50IGluIHN0cnVjdCBnZW5kaXNrIGluc3RlYWQuICBBbHNv
Cj4gcmVtb3ZlIHRoZSBub3cgdW51c2VkIGV4cG9ydC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJp
c3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KPiBSZXZpZXdlZC1ieTogSmFuIEthcmEgPGphY2tA
c3VzZS5jej4KPiAtLS0KPiAgIGJsb2NrL2dlbmhkLmMgICAgICAgICAgICAgICAgICAgfCAgMSAt
Cj4gICBkcml2ZXJzL2Jsb2NrL25iZC5jICAgICAgICAgICAgIHwgIDQgKy0tLQo+ICAgZHJpdmVy
cy9ibG9jay94ZW4tYmxrZnJvbnQuYyAgICB8IDIwICsrKysrLS0tLS0tLS0tLS0tLS0tCj4gICBk
cml2ZXJzL2Jsb2NrL3pyYW0venJhbV9kcnYuYyAgIHwgMTQgKystLS0tLS0tLS0tLS0KPiAgIGRy
aXZlcnMvbWQvZG0uYyAgICAgICAgICAgICAgICAgfCAxNiArKy0tLS0tLS0tLS0tLS0tCj4gICBk
cml2ZXJzL3MzOTAvYmxvY2svZGFzZF9pb2N0bC5jIHwgIDUgKystLS0KPiAgIGZzL2Jsb2NrX2Rl
di5jICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICAgNyBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNl
cnRpb25zKCspLCA0OSBkZWxldGlvbnMoLSkKPiAKUmV2aWV3ZWQtYnk6IEhhbm5lcyBSZWluZWNr
ZSA8aGFyZUBzdXNlLmRlPgoKQ2hlZXJzLAoKSGFubmVzCi0tIApEci4gSGFubmVzIFJlaW5lY2tl
ICAgICAgICAgICAgICAgIEtlcm5lbCBTdG9yYWdlIEFyY2hpdGVjdApoYXJlQHN1c2UuZGUgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICArNDkgOTExIDc0MDUzIDY4OApTVVNFIFNvZnR3YXJl
IFNvbHV0aW9ucyBHbWJILCBNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcKSFJCIDM2ODA5
IChBRyBOw7xybmJlcmcpLCBHZXNjaMOkZnRzZsO8aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
