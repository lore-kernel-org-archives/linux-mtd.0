Return-Path: <SRS0=z5ty=FE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70B6CC63777
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 07:53:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11F5E20709
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 07:53:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jT8bc6a1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11F5E20709
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9E1jDzGXbfVCvc/eLM+OKqiF9IVidYhi+9gBZGXcJNI=; b=jT8bc6a1CnYKvzK2B3LAazh2S
	3JbJDeRyt/MVM38KDeyJX+SXfrvTE7IBWCdhCj6ihd6rXRjw0eHYKISq9qGaWzstGTmfR/v6uKJty
	tIQ3jjBvQ968aExivG883MKUAdljEB04dUC7RCmQGS98RrKJKhgMNeM8VXwPdyeZWWeE77hylQrYc
	A6SqSgco5YFJ9+sKV2PXDAzuD+J166eVDa0YloyYbpvgzuITy1FRm9OtbAgazRneq0Ey8hz4abZWE
	FGZSOY8mPgKZ+bCwMkCvbQqhLw97xzVTqxqNtGP8ovMPJhrZqi23rjY7e8TxpsPtyxrZdYesEnATw
	ZJTHF08eQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjdyx-0003qe-C2; Mon, 30 Nov 2020 07:52:23 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjdy3-0003Kx-NS
 for linux-mtd@lists.infradead.org; Mon, 30 Nov 2020 07:51:32 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 06B55AC55;
 Mon, 30 Nov 2020 07:51:25 +0000 (UTC)
Subject: Re: [PATCH 44/45] block: merge struct block_device and struct
 hd_struct
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20201128161510.347752-1-hch@lst.de>
 <20201128161510.347752-45-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <75432706-8726-2c86-a080-40c45e6144c3@suse.de>
Date: Mon, 30 Nov 2020 08:51:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201128161510.347752-45-hch@lst.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_025128_103542_78A226A1 
X-CRM114-Status: GOOD (  20.61  )
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

T24gMTEvMjgvMjAgNToxNSBQTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gSW5zdGVhZCBv
ZiBoYXZpbmcgdHdvIHN0cnVjdHVyZXMgdGhhdCByZXByZXNlbnQgZWFjaCBibG9jayBkZXZpY2Ug
d2l0aAo+IGRpZmZlcmVudCBsaWZlIHRpbWUgcnVsZXMsIG1lcmdlIHRoZW0gaW50byBhIHNpbmds
ZSBvbmUuICBUaGlzIGFsc28KPiBncmVhdGx5IHNpbXBsaWZpZXMgdGhlIHJlZmVyZW5jZSBjb3Vu
dGluZyBydWxlcywgYXMgd2UgY2FuIHVzZSB0aGUgaW5vZGUKPiByZWZlcmVuY2UgY291bnQgYXMg
dGhlIG1haW4gcmVmZXJlbmNlIGNvdW50IGZvciB0aGUgbmV3IHN0cnVjdAo+IGJsb2NrX2Rldmlj
ZSwgd2l0aCB0aGUgZGV2aWNlIG1vZGVsIHJlZmVyZW5jZSBmcm9udCBlbmRpbmcgaXQgZm9yIGRl
dmljZQo+IG1vZGVsIGludGVyYWN0aW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBI
ZWxsd2lnIDxoY2hAbHN0LmRlPgo+IC0tLQo+ICAgYmxvY2svYmxrLWNncm91cC5jICAgICAgICB8
ICAgOSArKy0KPiAgIGJsb2NrL2Jsay5oICAgICAgICAgICAgICAgfCAgIDIgKy0KPiAgIGJsb2Nr
L2dlbmhkLmMgICAgICAgICAgICAgfCAgODkgKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0K
PiAgIGJsb2NrL3BhcnRpdGlvbnMvY29yZS5jICAgfCAxMTYgKysrKysrKysrKysrKysrLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0KPiAgIGZzL2Jsb2NrX2Rldi5jICAgICAgICAgICAgfCAgIDkgLS0t
Cj4gICBpbmNsdWRlL2xpbnV4L2Jsa190eXBlcy5oIHwgICA4ICsrLQo+ICAgaW5jbHVkZS9saW51
eC9ibGtkZXYuaCAgICB8ICAgMSAtCj4gICBpbmNsdWRlL2xpbnV4L2dlbmhkLmggICAgIHwgIDQw
ICsrKy0tLS0tLS0tLS0KPiAgIGluaXQvZG9fbW91bnRzLmMgICAgICAgICAgfCAgMjEgKysrKy0t
LQo+ICAga2VybmVsL3RyYWNlL2Jsa3RyYWNlLmMgICB8ICA0MyArKystLS0tLS0tLS0tLQo+ICAg
MTAgZmlsZXMgY2hhbmdlZCwgMTA4IGluc2VydGlvbnMoKyksIDIzMCBkZWxldGlvbnMoLSkKPiAK
UmV2aWV3ZWQtYnk6IEhhbm5lcyBSZWluZWNrZSA8aGFyZUBzdXNlLmRlPgoKQ2hlZXJzLAoKSGFu
bmVzCi0tIApEci4gSGFubmVzIFJlaW5lY2tlICAgICAgICAgICAgICAgIEtlcm5lbCBTdG9yYWdl
IEFyY2hpdGVjdApoYXJlQHN1c2UuZGUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICArNDkg
OTExIDc0MDUzIDY4OApTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHbWJILCBNYXhmZWxkc3RyLiA1
LCA5MDQwOSBOw7xybmJlcmcKSFJCIDM2ODA5IChBRyBOw7xybmJlcmcpLCBHZXNjaMOkZnRzZsO8
aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
