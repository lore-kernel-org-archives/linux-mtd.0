Return-Path: <SRS0=z5ty=FE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A7F2C5519F
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 07:10:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 265C4206CA
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 07:10:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d2vO+gVV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 265C4206CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nho3TGi4eLia2XhaBQPHSDdCiNQpG433BTLTG7FTPVc=; b=d2vO+gVV0qhNQ6Y7S65v5QbQd
	+8NnoDES3cUFIS+F2b0vWQBAHjH3XGJl2WttMi4O2XaVPyrbroQ4SxFsB6GePo/QDxyMbzhPqHVV3
	ZaVg1x6KnR7fe5OZ2r8av4xK3F3Hq+k8OTH3mBDL03h2gq/lC0Pzlx7mXDWz0w6LegZj+ihBEbc3g
	BHnAVlyP/kERMLjQtWJLqCyl/QLLcFIUR9BFCcrwCeA0CVJKy2qbVxZG8STrF+apcXg7cMDoWO+A9
	3cbEFsB859j3Zna/rQW1yoRvaHqMBfPDe8yPexR/4fh6wjqMG3HNVjQdecm9lR1yGv0rU9suJYBTy
	qqo888MVQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjdJU-0002iI-3b; Mon, 30 Nov 2020 07:09:32 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjdJR-0002hG-9y
 for linux-mtd@lists.infradead.org; Mon, 30 Nov 2020 07:09:30 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 30C1EAC6A;
 Mon, 30 Nov 2020 07:09:28 +0000 (UTC)
Subject: Re: [PATCH 14/45] block: use put_device in put_disk
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20201128161510.347752-1-hch@lst.de>
 <20201128161510.347752-15-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <1322a5be-2434-cd0f-f0c0-53444c96c6bd@suse.de>
Date: Mon, 30 Nov 2020 08:09:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201128161510.347752-15-hch@lst.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_020929_489738_DDAA7F27 
X-CRM114-Status: GOOD (  23.09  )
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

T24gMTEvMjgvMjAgNToxNCBQTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gVXNlIHB1dF9k
ZXZpY2UgdG8gcHV0IHRoZSBkZXZpY2UgaW5zdGVhZCBvZiBwb2tpbmcgaW50byB0aGUgaW50ZXJu
YWxzCj4gYW5kIHVzaW5nIGtvYmplY3RfcHV0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9w
aCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+IFJldmlld2VkLWJ5OiBHcmVnIEtyb2FoLUhhcnRtYW4g
PGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgo+IFJldmlld2VkLWJ5OiBKYW4gS2FyYSA8amFj
a0BzdXNlLmN6Pgo+IFJldmlld2VkLWJ5OiBKb2hhbm5lcyBUaHVtc2hpcm4gPGpvaGFubmVzLnRo
dW1zaGlybkB3ZGMuY29tPgo+IEFja2VkLWJ5OiBUZWp1biBIZW8gPHRqQGtlcm5lbC5vcmc+Cj4g
LS0tCj4gICBibG9jay9nZW5oZC5jIHwgMiArLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2Jsb2NrL2dlbmhkLmMgYi9i
bG9jay9nZW5oZC5jCj4gaW5kZXggMGJkOWM0MWRkNGNiNjkuLmY0NmU4OTIyNmZkZjkxIDEwMDY0
NAo+IC0tLSBhL2Jsb2NrL2dlbmhkLmMKPiArKysgYi9ibG9jay9nZW5oZC5jCj4gQEAgLTE4MDMs
NyArMTgwMyw3IEBAIEVYUE9SVF9TWU1CT0woX19hbGxvY19kaXNrX25vZGUpOwo+ICAgdm9pZCBw
dXRfZGlzayhzdHJ1Y3QgZ2VuZGlzayAqZGlzaykKPiAgIHsKPiAgIAlpZiAoZGlzaykKPiAtCQlr
b2JqZWN0X3B1dCgmZGlza190b19kZXYoZGlzayktPmtvYmopOwo+ICsJCXB1dF9kZXZpY2UoZGlz
a190b19kZXYoZGlzaykpOwo+ICAgfQo+ICAgRVhQT1JUX1NZTUJPTChwdXRfZGlzayk7Cj4gICAK
PiAKUmV2aWV3ZWQtYnk6IEhhbm5lcyBSZWluZWNrZSA8aGFyZUBzdXNlLmRlPgoKQ2hlZXJzLAoK
SGFubmVzCi0tIApEci4gSGFubmVzIFJlaW5lY2tlICAgICAgICAgICAgICAgIEtlcm5lbCBTdG9y
YWdlIEFyY2hpdGVjdApoYXJlQHN1c2UuZGUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAr
NDkgOTExIDc0MDUzIDY4OApTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHbWJILCBNYXhmZWxkc3Ry
LiA1LCA5MDQwOSBOw7xybmJlcmcKSFJCIDM2ODA5IChBRyBOw7xybmJlcmcpLCBHZXNjaMOkZnRz
ZsO8aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
