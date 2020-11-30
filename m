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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F31FC63777
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 07:48:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B182D20731
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 07:48:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F0G2f6Yf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B182D20731
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+BShefaaxqEd4vfQfKtXgquCkIs5sFBFXMYCJMWu3pM=; b=F0G2f6YfjjNPVh9gtH/+mSiNZ
	TUjXhm6mWd7aT44GvT4lWXSv8p/g7ima3y0Nb/WLVi7Fv6jjePeP8rmb+S5HEKdmgaVXUDP9cxxsk
	brtCRlPyvC1DxB6UTBj4OdKgrMZJjJDZQJxA2GC0u0esGNAbo2y49FULoYQH0BTIuHRNDbeK72S4C
	IAdCpqWvuESaDVlX326lbgdY9q0lSZvtfgMJZyLl9IG9m0X481zjVtDOcfZ/wguQhnXIAYA5ko42b
	PDC13Ta4TkXW8ZcYp2UpM0ojt0Llmro+orHjG2KaWZ3ZLm/+vqeEw7k/e1Qh+J8lEuHsaGkv7/UKx
	yuGrLfV/Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjduB-0001ko-0T; Mon, 30 Nov 2020 07:47:27 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjdu8-0001jr-LS
 for linux-mtd@lists.infradead.org; Mon, 30 Nov 2020 07:47:25 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 935D2ACC0;
 Mon, 30 Nov 2020 07:47:23 +0000 (UTC)
Subject: Re: [PATCH 38/45] block: switch partition lookup to use struct
 block_device
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20201128161510.347752-1-hch@lst.de>
 <20201128161510.347752-39-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <45ba93f5-a00d-7e09-e839-afd12c65b067@suse.de>
Date: Mon, 30 Nov 2020 08:47:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201128161510.347752-39-hch@lst.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_024724_843306_7C77F342 
X-CRM114-Status: GOOD (  18.25  )
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
Cc: linux-bcache@vger.kernel.org, Chao Yu <yuchao0@huawei.com>,
 Jan Kara <jack@suse.cz>, Mike Snitzer <snitzer@redhat.com>, linux-mm@kvack.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jan Kara <jack@suse.com>,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, Tejun Heo <tj@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMTEvMjgvMjAgNToxNSBQTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gVXNlIHN0cnVj
dCBibG9ja19kZXZpY2UgdG8gbG9va3VwIHBhcnRpdGlvbnMgb24gYSBkaXNrLiAgVGhpcyByZW1v
dmVzCj4gYWxsIHVzYWdlIG9mIHN0cnVjdCBoZF9zdHJ1Y3QgZnJvbSB0aGUgSS9PIHBhdGguCj4g
Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gUmV2aWV3
ZWQtYnk6IEphbiBLYXJhIDxqYWNrQHN1c2UuY3o+Cj4gQWNrZWQtYnk6IENvbHkgTGkgPGNvbHls
aUBzdXNlLmRlPgkJCVtiY2FjaGVdCj4gQWNrZWQtYnk6IENoYW8gWXUgPHl1Y2hhbzBAaHVhd2Vp
LmNvbT4JCQlbZjJmc10KPiAtLS0KPiAgIGJsb2NrL2Jpby5jICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgNCArLQo+ICAgYmxvY2svYmxrLWNvcmUuYyAgICAgICAgICAgICAgICAgICB8IDY2ICsr
KysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLQo+ICAgYmxvY2svYmxrLWZsdXNoLmMgICAgICAg
ICAgICAgICAgICB8ICAyICstCj4gICBibG9jay9ibGstbXEuYyAgICAgICAgICAgICAgICAgICAg
IHwgIDkgKystLQo+ICAgYmxvY2svYmxrLW1xLmggICAgICAgICAgICAgICAgICAgICB8ICA3ICsr
LS0KPiAgIGJsb2NrL2Jsay5oICAgICAgICAgICAgICAgICAgICAgICAgfCAgNCArLQo+ICAgYmxv
Y2svZ2VuaGQuYyAgICAgICAgICAgICAgICAgICAgICB8IDU3ICsrKysrKysrKysrKysrKy0tLS0t
LS0tLS0tCj4gICBibG9jay9wYXJ0aXRpb25zL2NvcmUuYyAgICAgICAgICAgIHwgIDcgKy0tLQo+
ICAgZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfcmVjZWl2ZXIuYyB8ICAyICstCj4gICBkcml2ZXJz
L2Jsb2NrL2RyYmQvZHJiZF93b3JrZXIuYyAgIHwgIDIgKy0KPiAgIGRyaXZlcnMvYmxvY2svenJh
bS96cmFtX2Rydi5jICAgICAgfCAgMiArLQo+ICAgZHJpdmVycy9tZC9iY2FjaGUvcmVxdWVzdC5j
ICAgICAgICB8ICA0ICstCj4gICBkcml2ZXJzL21kL2RtLmMgICAgICAgICAgICAgICAgICAgIHwg
IDQgKy0KPiAgIGRyaXZlcnMvbWQvbWQuYyAgICAgICAgICAgICAgICAgICAgfCAgNCArLQo+ICAg
ZHJpdmVycy9udm1lL3RhcmdldC9hZG1pbi1jbWQuYyAgICB8IDIwICsrKystLS0tLQo+ICAgZnMv
ZXh0NC9zdXBlci5jICAgICAgICAgICAgICAgICAgICB8IDE4ICsrKy0tLS0tCj4gICBmcy9leHQ0
L3N5c2ZzLmMgICAgICAgICAgICAgICAgICAgIHwgMTAgKy0tLS0KPiAgIGZzL2YyZnMvZjJmcy5o
ICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICAgZnMvZjJmcy9zdXBlci5jICAgICAgICAg
ICAgICAgICAgICB8ICA2ICstLQo+ICAgaW5jbHVkZS9saW51eC9ibGtkZXYuaCAgICAgICAgICAg
ICB8ICA4ICsrLS0KPiAgIGluY2x1ZGUvbGludXgvZ2VuaGQuaCAgICAgICAgICAgICAgfCAgNCAr
LQo+ICAgaW5jbHVkZS9saW51eC9wYXJ0X3N0YXQuaCAgICAgICAgICB8IDE3ICsrKystLS0tCj4g
ICAyMiBmaWxlcyBjaGFuZ2VkLCAxMjIgaW5zZXJ0aW9ucygrKSwgMTM3IGRlbGV0aW9ucygtKQo+
IApSZXZpZXdlZC1ieTogSGFubmVzIFJlaW5lY2tlIDxoYXJlQHN1c2UuZGU+CgpDaGVlcnMsCgpI
YW5uZXMKLS0gCkRyLiBIYW5uZXMgUmVpbmVja2UgICAgICAgICAgICAgICAgS2VybmVsIFN0b3Jh
Z2UgQXJjaGl0ZWN0CmhhcmVAc3VzZS5kZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICs0
OSA5MTEgNzQwNTMgNjg4ClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdtYkgsIE1heGZlbGRzdHIu
IDUsIDkwNDA5IE7DvHJuYmVyZwpIUkIgMzY4MDkgKEFHIE7DvHJuYmVyZyksIEdlc2Now6RmdHNm
w7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
