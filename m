Return-Path: <SRS0=z5ty=FE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09864C71156
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 07:29:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9805620725
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 07:29:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bIpRHLmj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9805620725
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8TwjOO1KzHisEVtnfb0fYYqUMo9KWL6gLi9W4a7H0Mo=; b=bIpRHLmjZJoGW2AqFm0r2p/Tn
	4yJi1y5bbDx97CXVc2BeNjTVXuvxGsgVU2WOhNzvT51qxGIp3pGOXMQPUD8YyLeXND/z+fnzsXRUO
	0s2A48tqREvnLfrnfV3V8fYifDfatZ8eapTgyCYCKPu+S7LpbzYTwAyO0xDwHqipzUAgkISIkVYLN
	akMVwXsbrJnbR8cvQTrRIANQCSTgmQ6LZNCMz32DFv1ZKZHKn5XuyfMq2zarZQsiOAus/Zy8EtcjZ
	4TrFaOALUPBZjiq3EzPg29iXdeC82pT2/sK9ZTtB3V/89K3YEOQzoB0I8+RjjdDuv8lyE2NLOLrsV
	HBDZEZ8/A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjdcH-00062O-TW; Mon, 30 Nov 2020 07:28:57 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjdcE-00061b-W7
 for linux-mtd@lists.infradead.org; Mon, 30 Nov 2020 07:28:55 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C901BAC55;
 Mon, 30 Nov 2020 07:28:53 +0000 (UTC)
Subject: Re: [PATCH 21/45] block: refactor blkdev_get
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20201128161510.347752-1-hch@lst.de>
 <20201128161510.347752-22-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <17ebdf44-135c-520d-8a9d-4943b02a83b4@suse.de>
Date: Mon, 30 Nov 2020 08:28:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201128161510.347752-22-hch@lst.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_022855_152007_0159F3A8 
X-CRM114-Status: GOOD (  20.48  )
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

T24gMTEvMjgvMjAgNToxNCBQTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gTW92ZSBtb3Jl
IGNvZGUgdGhhdCBpcyBvbmx5IHJ1biBvbiB0aGUgb3V0ZXIgb3BlbiBidXQgbm90IHRoZSBvcGVu
IG9mCj4gdGhlIHVuZGVybHlpbmcgd2hvbGUgZGV2aWNlIHdoZW4gb3BlbmluZyBhIHBhcnRpdGlv
biBpbnRvIGJsa2Rldl9nZXQsCj4gd2hpY2ggbGVhZHMgdG8gYSBtdWNoIGVhc2llciB0byBmb2xs
b3cgc3RydWN0dXJlLgo+IAo+IFRoaXMgYWxsb3dzIHRvIHNpbXBsaWZ5IHRoZSBkaXNrIGFuZCBt
b2R1bGUgcmVmY291bnRpbmcgc28gdGhhdCBvbmUKPiByZWZlcmVuY2UgaXMgaGVsZCBmb3IgZWFj
aCBvcGVuLCBzaW1pbGFyIHRvIHdoYXQgd2UgZG8gd2l0aCBub3JtYWwKPiBmaWxlIG9wZXJhdGlv
bnMuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4g
QWNrZWQtYnk6IFRlanVuIEhlbyA8dGpAa2VybmVsLm9yZz4KPiBSZXZpZXdlZC1ieTogSmFuIEth
cmEgPGphY2tAc3VzZS5jej4KPiAtLS0KPiAgIGZzL2Jsb2NrX2Rldi5jIHwgMTg1ICsrKysrKysr
KysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgIDEgZmlsZSBjaGFu
Z2VkLCA4NiBpbnNlcnRpb25zKCspLCA5OSBkZWxldGlvbnMoLSkKPiAKUmV2aWV3ZWQtYnk6IEhh
bm5lcyBSZWluZWNrZSA8aGFyZUBzdXNlLmRlPgoKQ2hlZXJzLAoKSGFubmVzCi0tIApEci4gSGFu
bmVzIFJlaW5lY2tlICAgICAgICAgICAgICAgIEtlcm5lbCBTdG9yYWdlIEFyY2hpdGVjdApoYXJl
QHN1c2UuZGUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICArNDkgOTExIDc0MDUzIDY4OApT
VVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHbWJILCBNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJl
cmcKSFJCIDM2ODA5IChBRyBOw7xybmJlcmcpLCBHZXNjaMOkZnRzZsO8aHJlcjogRmVsaXggSW1l
bmTDtnJmZmVyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
