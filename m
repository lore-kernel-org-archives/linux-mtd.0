Return-Path: <SRS0=s0lc=QE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DB53C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Nov 2021 09:04:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CBA26187F
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Nov 2021 09:04:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9CBA26187F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e1WqW/RYQnGH1Qu02hzvcB4wEYkcLCmxhsrpflA0498=; b=BHjgkkrTcHrgUcLmLrlk4kOEgk
	CNexU8E227BSyamBaDew5dIpF8Pp6IHLwKC0zy5moD8UOV/IlEjz9DWMicJ4D6zZGLvk7DRTfKqce
	Bt7aDt8dZyotbKQ7nt/8tZv6+niwXb9J1zKYD0k6voJUoiKMOUnj1p8l/nvz6eXgdgEuF5GR5PG4I
	KmMia4GLBkXlJKKclkS5NDgK+vZQaszqz/9z+mefxKHorc9MLjJBZFcScW+hvje1UuAODEyQ5B/we
	IluYIWBv1aI+J14IP2tVIYMklfLV2NUflzLfC2BKygi8H3GzuVMjCaALqBty7PDI2I+aSsrCj4Hcn
	d6xUWybw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnGqg-0044My-OF; Wed, 17 Nov 2021 09:03:22 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnGnu-0042aY-OR
 for linux-mtd@lists.infradead.org; Wed, 17 Nov 2021 09:00:33 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HvGzb5rp3zZd6F;
 Wed, 17 Nov 2021 16:58:03 +0800 (CST)
Received: from kwepemm600019.china.huawei.com (7.193.23.64) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 17 Nov 2021 17:00:24 +0800
Received: from [10.174.177.210] (10.174.177.210) by
 kwepemm600019.china.huawei.com (7.193.23.64) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Wed, 17 Nov 2021 17:00:23 +0800
Subject: Re: [QUESTION] blk_mq_freeze_queue in elevator_init_mq
To: Ming Lei <ming.lei@redhat.com>
CC: <damien.lemoal@wdc.com>, <axboe@kernel.dk>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>, <linux-block@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <yi.zhang@huawei.com>, <yebin10@huawei.com>, 
 <houtao1@huawei.com>
References: <d9113bf8-4654-cb04-f79c-38e11493cb2c@huawei.com>
 <YZS4FYxtxYAXjtFJ@T590>
From: yangerkun <yangerkun@huawei.com>
Message-ID: <d9ca8e57-55b8-96f8-e5fd-6103c8b1fa4b@huawei.com>
Date: Wed, 17 Nov 2021 17:00:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <YZS4FYxtxYAXjtFJ@T590>
Content-Language: en-US
X-Originating-IP: [10.174.177.210]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600019.china.huawei.com (7.193.23.64)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_010031_168066_920FC5F9 
X-CRM114-Status: GOOD (  21.28  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiAyMDIxLzExLzE3IDE2OjA2LCBNaW5nIExlaSB3cm90ZToKPiBPbiBXZWQsIE5vdiAxNywg
MjAyMSBhdCAxMTozNzoxM0FNICswODAwLCB5YW5nZXJrdW4gd3JvdGU6Cj4+IE5vd2RheXMgd2Ug
bWVldCB0aGUgYm9vdCByZWdyZXNzaW9uIHdoaWxlIGVuYWJsZSBsb3RzIG9mIG10ZGJsb2NrCj4g
Cj4gV2hhdCBpcyB5b3VyIGJvb3QgcmVncmVzc2lvbj8gQW55IGRtZXNnIGxvZz8KClRoZSByZXN1
bHQgaXMgdGhhdCB3aGVuIGJvb3Qgd2l0aCA1LjEwIGtlcm5lbCBjb21wYXJlIHdpdGggNC40LCA1
LjEwCndpbGwgY29uc3VtZSBhYm91dCAxLjZzIG1vcmUuLi4KPiAKPj4gY29tcGFyZSB3aXRoIDQu
NC4gVGhlIG1haW4gcmVhc29uIHdhcyB0aGF0IHRoZSBibGtfbXFfZnJlZXplX3F1ZXVlIGluCj4+
IGVsZXZhdG9yX2luaXRfbXEgd2lsbCB3YWl0IGEgUkNVIGdhcCB3aGljaCB3YW50IHRvIG1ha2Ug
c3VyZSBubyBJTyB3aWxsCj4+IGhhcHBlbiB3aGlsZSBibGtfbXFfaW5pdF9zY2hlZC4KPiAKPiBU
aGVyZSBpc24ndCBSQ1UgZ3JhY2UgcGVyaW9kIGltcGxpZWQgaW4gdGhlIGJsa19tcV9mcmVlemVf
cXVldWUoKSBjYWxsZWQKPiBmcm9tIGVsZXZhdG9yX2luaXRfbXEoKSwgYmVjYXVzZSB0aGUgLnFf
dXNhZ2VfY291bnRlciB3b3JrcyBhdCBhdG9taWMgbW9kZQo+IGF0IHRoYXQgdGltZS4KPiAKPj4K
Pj4gT3RoZXIgbW9kdWxlIGxpa2UgbG9vcCBtZWV0cyB0aGlzIHByb2JsZW0gdG9vIGFuZCBoYXMg
YmVlbiBmaXggd2l0aAo+IAo+IEFnYWluLCB3aGF0IGlzIHRoZSBwcm9ibGVtPwoKY29tbWl0IDIx
MTJmNWMxMzMwYTY3MWZhODUyMDUxZDg1Y2I5ZWFkYzA1ZDdlYjcKQXV0aG9yOiBCYXJ0IFZhbiBB
c3NjaGUgPGJ2YW5hc3NjaGVAYWNtLm9yZz4KRGF0ZTogICBUaHUgQXVnIDUgMTA6NDI6MDAgMjAy
MSAtMDcwMAoKICAgICBsb29wOiBTZWxlY3QgSS9PIHNjaGVkdWxlciAnbm9uZScgZnJvbSBpbnNp
ZGUgYWRkX2Rpc2soKQoKICAgICAuLi4KICAgICBlLmcuIHZpYSBhIHVkZXYgcnVsZS4gVGhpcyBh
cHByb2FjaCBoYXMgYW4gYWR2YW50YWdlIGNvbXBhcmVkIHRvIApjaGFuZ2luZwogICAgIHRoZSBJ
L08gc2NoZWR1bGVyIGZyb20gdXNlcnNwYWNlIGZyb20gJ21xLWRlYWRsaW5lJyBpbnRvICdub25l
JywgbmFtZWx5CiAgICAgdGhhdCBzeW5jaHJvbml6ZV9yY3UoKSBkb2VzIG5vdCBnZXQgY2FsbGVk
LgoKQWN0dWFsbHksIHdlIGhhcyBtZWV0cyB0aGlzIHByb2JsZW0gdG9vIApiZWZvcmUoaHR0cHM6
Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMvbGludXgtYmxvY2svbXNnNzA2NjAuaHRtbCkuCgoKPiAK
Pj4gZm9sbG93IHBhdGNoZXM6Cj4+Cj4+ICAgMjExMmY1YzEzMzBhIGxvb3A6IFNlbGVjdCBJL08g
c2NoZWR1bGVyICdub25lJyBmcm9tIGluc2lkZSBhZGRfZGlzaygpCj4+ICAgOTBiNzE5ODAwMWYy
IGJsay1tcTogSW50cm9kdWNlIHRoZSBCTEtfTVFfRl9OT19TQ0hFRF9CWV9ERUZBVUxUIGZsYWcK
Pj4KPj4gVGhleSBjaGFuZ2UgdGhlIGRlZmF1bHQgSU8gc2NoZWR1bGVyIGZvciBsb29wIHRvICdu
b25lJy4gU28gbm8gbmVlZCB0bwo+PiBjYWxsIGJsa19tcV9mcmVlemVfcXVldWUgYW5kIGJsa19t
cV9pbml0X3NjaGVkLiBCdXQgaXQgc2VlbXMgbm90Cj4+IGFwcHJvcHJpYXRlIGZvciBtdGRibG9j
a3MuIE10ZGJsb2NrcyBjYW4gdXNlICdtcS1kZWFkbGluZScgdG8gaGVscAo+PiBvcHRpbWl6ZSB0
aGUgcmFuZG9tIHdyaXRlIHdpdGggdGhlIGhlbHAgb2YgbXRkYmxvY2sncyBjYWNoZS4gT25jZSBj
aGFuZ2UKPj4gdG8gJ25vbmUnLCB3ZSBtYXkgbWVldCB0aGUgcmVncmVzc2lvbiBmb3IgcmFuZG9t
IHdyaXRlLgo+Pgo+PiBjb21taXQgNzM3ZWI3OGU4MmQ1MmQzNWRmMTY2ZDI5YWYzMmJmNjE5OTJk
ZTcxZAo+PiBBdXRob3I6IERhbWllbiBMZSBNb2FsIDxkYW1pZW4ubGVtb2FsQHdkYy5jb20+Cj4+
IERhdGU6ICAgVGh1IFNlcCA1IDE4OjUxOjMzIDIwMTkgKzA5MDAKPj4KPj4gICAgICBibG9jazog
RGVsYXkgZGVmYXVsdCBlbGV2YXRvciBpbml0aWFsaXphdGlvbgo+Pgo+PiAgICAgIC4uLgo+Pgo+
PiAgICAgIEFkZGl0aW9uYWxseSwgdG8gbWFrZSBzdXJlIHRoYXQgdGhlIGVsZXZhdG9yIGluaXRp
YWxpemF0aW9uIGlzIG5ldmVyCj4+ICAgICAgZG9uZSB3aGlsZSByZXF1ZXN0cyBhcmUgaW4tZmxp
Z2h0ICh0aGVyZSBzaG91bGQgYmUgbm9uZSB3aGVuIHRoZSBkZXZpY2UKPj4gICAgICBkcml2ZXIg
Y2FsbHMgZGV2aWNlX2FkZF9kaXNrKCkpLCBmcmVlemUgYW5kIHF1aWVzY2UgdGhlIGRldmljZSBy
ZXF1ZXN0Cj4+ICAgICAgcXVldWUgYmVmb3JlIGNhbGxpbmcgYmxrX21xX2luaXRfc2NoZWQoKSBp
biBlbGV2YXRvcl9pbml0X21xKCkuCj4+ICAgICAgLi4uCj4+Cj4+IFRoaXMgY29tbWl0IGFkZCBi
bGtfbXFfZnJlZXplX3F1ZXVlIGluIGVsZXZhdG9yX2luaXRfbXEgd2hpY2ggdHJ5IHRvCj4+IG1h
a2Ugc3VyZSBubyBpbi1mbGlnaHQgcmVxdWVzdCB3aGlsZSB3ZSBnbyB0aHJvdWdoIGJsa19tcV9p
bml0X3NjaGVkLgo+PiBCdXQgZG9lcyB0aGVyZSBhbnkgZHJpdmVycyBjYW4gbGVhdmUgSU8gYWxp
dmUgd2hpbGUgd2UgZ28gdGhyb3VnaAo+PiBlbGV2YXRvcl9pbml0X21x77yfIEFuZCBpZiBubywg
bWF5YmUgd2UgY2FuIGp1c3QgcmVtb3ZlIHRoaXMgbG9naWNhbCB0bwo+PiBmaXggdGhlIHJlZ3Jl
c3Npb24uLi4KPiAKPiBTQ1NJIHNob3VsZCBoYXZlIHBhc3N0aHJvdWdoIHJlcXVlc3RzIGF0IHRo
YXQgbW9tZW50Lgo+IAo+IAo+IAo+IFRoYW5rcywKPiBNaW5nCj4gCj4gLgo+IAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
