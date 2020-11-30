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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69224C63777
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 07:40:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E31A120709
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 07:40:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Oetf81st"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E31A120709
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KDlqmPmeh47N5x58H/a2lxlANowu053fjIBz+Km2mqA=; b=Oetf81stnPokIkwFp7enk4MLi
	D1CbjfpqN+h4/0mA+tNKEWp6TstXKWgnf1XvE3RI264Zy6Df2gqKtczEC3XY8SI8hKlyGDpQBDc98
	t5tlf7QqQyBwfE+B5rj2zTPogexFJFpc9ZmboifzXVrcbOBVns7hLgish/x5zhxTVVyEEUoEgdQQ5
	J9UZm2re/oSezRQwYtKRHTh9Pa2Ij76uwD1DQYtTWU63ODnlOZsZlN/omosUB+GMGywmAPOKTBuRZ
	SFQlx51zoPt4ToXsLLahxqDU92cdnWhHpHUoHbVsqj3hFCIC3ZT+TROS7yX0u08yV8+6JBF4DoW3w
	KZy2Y6tuw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjdmp-0007xo-DT; Mon, 30 Nov 2020 07:39:51 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjdmm-0007vl-H1
 for linux-mtd@lists.infradead.org; Mon, 30 Nov 2020 07:39:49 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 691E2AD45;
 Mon, 30 Nov 2020 07:39:47 +0000 (UTC)
Subject: Re: [PATCH 30/45] block: remove the nr_sects field in struct hd_struct
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20201128161510.347752-1-hch@lst.de>
 <20201128161510.347752-31-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <1c42fdb8-9c10-e5fd-e1c8-cfedc3922097@suse.de>
Date: Mon, 30 Nov 2020 08:39:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201128161510.347752-31-hch@lst.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_023948_727258_39BD2B9F 
X-CRM114-Status: GOOD (  19.73  )
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

T24gMTEvMjgvMjAgNToxNCBQTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gTm93IHRoYXQg
dGhlIGhkX3N0cnVjdCBhbHdheXMgaGFzIGEgYmxvY2sgZGV2aWNlIGF0dGFjaGVkIHRvIGl0LCB0
aGVyZSBpcwo+IG5vIG5lZWQgZm9yIGhhdmluZyB0d28gc2l6ZSBmaWVsZCB0aGF0IGp1c3QgZ2V0
IG91dCBvZiBzeW5jLgo+IAo+IEFkZGl0aW9uYWxseSB0aGUgZmllbGQgaW4gaGRfc3RydWN0IGRp
ZCBub3QgdXNlIHByb3BlciBzZXJpYWxpemF0aW9uLAo+IHBvc3NpYmx5IGFsbG93aW5nIGZvciB0
b3JuIHdyaXRlcy4gIEJ5IG9ubHkgdXNpbmcgdGhlIGJsb2NrX2RldmljZSBmaWVsZAo+IHRoaXMg
cHJvYmxlbSBhbHNvIGdldHMgZml4ZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhl
bGx3aWcgPGhjaEBsc3QuZGU+Cj4gUmV2aWV3ZWQtYnk6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3Jl
Z2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+Cj4gQWNrZWQtYnk6IENvbHkgTGkgPGNvbHlsaUBzdXNl
LmRlPgkJCVtiY2FjaGVdCj4gQWNrZWQtYnk6IENoYW8gWXUgPHl1Y2hhbzBAaHVhd2VpLmNvbT4J
CQlbZjJmc10KPiAtLS0KPiAgIGJsb2NrL2Jpby5jICAgICAgICAgICAgICAgICAgICAgICAgfCAg
NCArLQo+ICAgYmxvY2svYmxrLWNvcmUuYyAgICAgICAgICAgICAgICAgICB8ICAyICstCj4gICBi
bG9jay9ibGsuaCAgICAgICAgICAgICAgICAgICAgICAgIHwgNTMgLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQo+ICAgYmxvY2svZ2VuaGQuYyAgICAgICAgICAgICAgICAgICAgICB8IDU1ICsrKysrKysr
KysrLS0tLS0tLS0tLS0KPiAgIGJsb2NrL3BhcnRpdGlvbnMvY29yZS5jICAgICAgICAgICAgfCAx
NyArKysrLS0tCj4gICBkcml2ZXJzL2Jsb2NrL2xvb3AuYyAgICAgICAgICAgICAgIHwgIDEgLQo+
ICAgZHJpdmVycy9ibG9jay9uYmQuYyAgICAgICAgICAgICAgICB8ICAyICstCj4gICBkcml2ZXJz
L2Jsb2NrL3hlbi1ibGtiYWNrL2NvbW1vbi5oIHwgIDQgKy0KPiAgIGRyaXZlcnMvbWQvYmNhY2hl
L3N1cGVyLmMgICAgICAgICAgfCAgMiArLQo+ICAgZHJpdmVycy9zMzkwL2Jsb2NrL2Rhc2RfaW9j
dGwuYyAgICB8ICA0ICstCj4gICBkcml2ZXJzL3RhcmdldC90YXJnZXRfY29yZV9wc2NzaS5jIHwg
IDUgKy0KPiAgIGZzL2Jsb2NrX2Rldi5jICAgICAgICAgICAgICAgICAgICAgfCA3MyArLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgIGZzL2YyZnMvc3VwZXIuYyAgICAgICAgICAgICAg
ICAgICAgfCAgMiArLQo+ICAgZnMvcHN0b3JlL2Jsay5jICAgICAgICAgICAgICAgICAgICB8ICAy
ICstCj4gICBpbmNsdWRlL2xpbnV4L2dlbmhkLmggICAgICAgICAgICAgIHwgMjkgKysrLS0tLS0t
LS0tCj4gICBrZXJuZWwvdHJhY2UvYmxrdHJhY2UuYyAgICAgICAgICAgIHwgIDIgKy0KPiAgIDE2
IGZpbGVzIGNoYW5nZWQsIDYxIGluc2VydGlvbnMoKyksIDE5NiBkZWxldGlvbnMoLSkKPiAKUmV2
aWV3ZWQtYnk6IEhhbm5lcyBSZWluZWNrZSA8aGFyZUBzdXNlLmRlPgoKQ2hlZXJzLAoKSGFubmVz
Ci0tIApEci4gSGFubmVzIFJlaW5lY2tlICAgICAgICAgICAgICAgIEtlcm5lbCBTdG9yYWdlIEFy
Y2hpdGVjdApoYXJlQHN1c2UuZGUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICArNDkgOTEx
IDc0MDUzIDY4OApTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHbWJILCBNYXhmZWxkc3RyLiA1LCA5
MDQwOSBOw7xybmJlcmcKSFJCIDM2ODA5IChBRyBOw7xybmJlcmcpLCBHZXNjaMOkZnRzZsO8aHJl
cjogRmVsaXggSW1lbmTDtnJmZmVyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
