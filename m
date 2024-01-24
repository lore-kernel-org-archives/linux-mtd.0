Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ECB2C47DDF
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jan 2024 12:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FWY9xz/ET6PsiSvVNHPCz/alEaW3Duumz+L9Q+HdCh4=; b=kF4jdCrdEvLMKD7Y5eYNt29a+K
	lPc+Z3BRBbzzElNIzBr4QOQ+VKxWPOX6Rq+pgPKiLcyAAcsazBJSmxcWvbp6s2X9Lr7/uuDlgbLQ4
	2AicHcg5NRjGtHlmSe8PG9xVkEf2pNJB1Te3P/jvyrPBmauzLl6Y7DQ3ZaktWbyUafxB72zkV14/q
	shZ3XHRFCuZYE02LwcIyYnPLDz+ng+kCH1KZqtrb46ZHPheNPiLxApHs8bRhdaymGoYwHN4LuYYIX
	W5AZBVL4MrvQ5IZl09ago7IjbQjXmpmrX1ysL9peQym2YeoKdR7OUNjgkFZx0aAzDknfuhLnw50Ka
	R06S20ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rScd1-003Iaw-22;
	Wed, 24 Jan 2024 12:45:15 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSccx-003IWm-0c
	for linux-mtd@lists.infradead.org;
	Wed, 24 Jan 2024 12:45:13 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4TKkDC5GGhz1xmT3;
	Wed, 24 Jan 2024 20:44:11 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 42DB91A016E;
	Wed, 24 Jan 2024 20:44:49 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Jan 2024 20:44:48 +0800
Subject: Re: [Linux Kernel Bug] memory leak in ubi_attach
To: Chenyuan Yang <chenyuan0y@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <richard@nod.at>,
	<miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
	<linux-kernel@vger.kernel.org>, <syzkaller@googlegroups.com>, Zijie Zhao
	<zzjas98@gmail.com>
References: <CALGdzuo8_EXr4aUAw6X9S+yzMPi25Y82netPLWsd+3n-Ov9Pnw@mail.gmail.com>
 <10779b09-3413-6374-b4a1-1efd8821c5f2@huawei.com>
 <CALGdzuryBbCqGAhox9ZWaQHD5dSQNApfGmCP+rYZ7O4MCRH+rw@mail.gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <7138a98c-1562-3059-07b6-4d918bec9d1a@huawei.com>
Date: Wed, 24 Jan 2024 20:44:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CALGdzuryBbCqGAhox9ZWaQHD5dSQNApfGmCP+rYZ7O4MCRH+rw@mail.gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_044511_602310_E8A518AA 
X-CRM114-Status: GOOD (  17.01  )
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

5ZyoIDIwMjQvMS8yMyAxMjo1NywgQ2hlbnl1YW4gWWFuZyDlhpnpgZM6Cj4gSGkgWmhpaGFvLAo+
IAo+IFRoYW5rcyBmb3IgeW91ciBwcm9tcHQgcmVwbHkhIEhlcmUgYXJlIHRoZSBmaWxlcyByZWxh
dGVkIHRvIHRoaXMgbWVtb3J5IGxlYWsuCj4gCj4gQmVzdCwKPiBDaGVueXVhbgo+IAoKQ2FuIHlv
dSBwcm92aWRlIGEga2VybmVsIGNvbmZpZyBhbmQgdGhlIGNtZGxpbmU/IEkgY2FuJ3QgcmVwcm9k
dWNlIHRoZSAKcHJvYmxlbSBieSBib3RoIEMgcHJvZ3JhbSBhbmQgc3l6IHByb2dyYW0uIEJ1dCBh
ZnRlciBhbmFseXppbmcgdGhlIGxvZzoKCiAgICAgWzxmZmZmZmZmZjgxNTcyNzRlPl0gX19rbWFs
bG9jX25vZGVfdHJhY2tfY2FsbGVyKzB4NGUvMHgxMjAgCm1tL3NsYWJfY29tbW9uLmM6MTAyNwog
ICAgIFs8ZmZmZmZmZmY4MTU2MWUxZj5dIGtzdHJkdXArMHgzZi8weDcwIG1tL3V0aWwuYzo2Mgog
ICAgIFs8ZmZmZmZmZmY4MTU2MWVhNz5dIGtzdHJkdXBfY29uc3QrMHg1Ny8weDgwIG1tL3V0aWwu
Yzo4NQogICAgIFs8ZmZmZmZmZmY4MjRkNDU5Nj5dIGt2YXNwcmludGZfY29uc3QrMHhjNi8weDEx
MCBsaWIva2FzcHJpbnRmLmM6NDgKICAgICBbPGZmZmZmZmZmODRhYWVhZGY+XSBrb2JqZWN0X3Nl
dF9uYW1lX3ZhcmdzKzB4M2YvMHhlMCBsaWIva29iamVjdC5jOjI3MgogICAgIFs8ZmZmZmZmZmY4
NGFhZWY0MT5dIGtvYmplY3RfYWRkX3ZhcmcgbGliL2tvYmplY3QuYzozNjYgW2lubGluZV0KICAg
ICBbPGZmZmZmZmZmODRhYWVmNDE+XSBrb2JqZWN0X2luaXRfYW5kX2FkZCsweDcxLzB4ZTAgbGli
L2tvYmplY3QuYzo0NTUKICAgICBbPGZmZmZmZmZmODE2MjA4NWE+XSBzeXNmc19zbGFiX2FkZCsw
eDEwYS8weDIxMCBtbS9zbHViLmM6NjE2OAogICAgIFs8ZmZmZmZmZmY4MTYyODQ3ND5dIF9fa21l
bV9jYWNoZV9jcmVhdGUrMHgxYjQvMHg1YTAgbW0vc2x1Yi5jOjUxMjAKICAgICBbPGZmZmZmZmZm
ODE1NzFkY2E+XSBjcmVhdGVfY2FjaGUgbW0vc2xhYl9jb21tb24uYzoyMzUgW2lubGluZV0KICAg
ICBbPGZmZmZmZmZmODE1NzFkY2E+XSBrbWVtX2NhY2hlX2NyZWF0ZV91c2VyY29weSsweDE2YS8w
eDJlMCAKbW0vc2xhYl9jb21tb24uYzozNDAKICAgICBbPGZmZmZmZmZmODE1NzFmNTE+XSBrbWVt
X2NhY2hlX2NyZWF0ZSsweDExLzB4MjAgbW0vc2xhYl9jb21tb24uYzozOTUKICAgICBbPGZmZmZm
ZmZmODJlNDBmYzU+XSBhbGxvY19haSBkcml2ZXJzL210ZC91YmkvYXR0YWNoLmM6MTQ2NCBbaW5s
aW5lXQogICAgIFs8ZmZmZmZmZmY4MmU0MGZjNT5dIHViaV9hdHRhY2grMHhiNS8weDFlMDAgCmRy
aXZlcnMvbXRkL3ViaS9hdHRhY2guYzoxNTYwCiAgICAgWzxmZmZmZmZmZjgyZTMwMmY4Pl0gdWJp
X2F0dGFjaF9tdGRfZGV2KzB4ODc4LzB4MTEzMCAKZHJpdmVycy9tdGQvdWJpL2J1aWxkLmM6MTAw
MAogICAgIFs8ZmZmZmZmZmY4MmUzMTc2ZD5dIGN0cmxfY2Rldl9pb2N0bCsweDFkZC8weDI1MCAK
ZHJpdmVycy9tdGQvdWJpL2NkZXYuYzoxMDQzCiAgICAgWzxmZmZmZmZmZjgxNmIwZTIzPl0gdmZz
X2lvY3RsIGZzL2lvY3RsLmM6NTEgW2lubGluZV0KICAgICBbPGZmZmZmZmZmODE2YjBlMjM+XSBf
X2RvX3N5c19pb2N0bCBmcy9pb2N0bC5jOjg3MSBbaW5saW5lXQoKVGhlIGxlYWtlZCBtZW1vcnkg
aXMgbG9jYXRlZCBpbiAna29iai0+bmFtZScsIHRoZSBrb2JqIGNvbWVzIGZyb20gCmttZW1fY2Fj
aGUgYW5kIGl0IGlzIHVzZWQgdG8gY3JlYXRlIGVudHJ5IHVuZGVyIApzeXNmcygnL3N5cy9rZXJu
ZWwvc2xhYicpLiBJZiBrbWVtX2NhY2hlX2Rlc3Ryb3koKSBpcyBtaXNzZWQgdG8gYmUgCmNhbGxl
ZCBpbiBzb21lb25lIGV4aXRpbmcgcGF0aCBpbiBVQkksIHRoZXJlIHdpbGwgYmUgbW9yZSBtZW1s
ZWFrIAptZXNzYWdlcyByZXBvcnRlZCAoZWcuIGFpLT5hZWJfc2xhYl9jYWNoZSkuIFNvIEkgZ3Vl
c3MgdGhlIHBvdGVudGlvbmFsIApwcm9ibGVtIGhhcyBub3RoaW5nIHRvIGRvIHdpdGggVUJJLgpB
ZnRlciBsb29raW5nIHRocm91Z2ggdGhlIGltcGxlbWVudGF0aW9uIG9mIGNyZWF0ZV9jYWNoZSwg
dGhlIGxpZmUgdGltZSAKb2YgJ2tvYmotPm5hbWUnIGlzIGFsb25nIHdpdGgga29iaiwgaXQgY2Fu
IGJlIGFsd2F5cyByZWxlYXNlZCBldmVuIGluIAplcnJvciBoYW5kbGluZyBwYXRocy4gVG8gZmln
dXJlIG91dCB3aGF0IGhhcHBlbnMgSSBuZWVkIHRvIHJlcHJvZHVjZSBpdCAKb24gbXkgbG9jYWwg
bWFjaGluZS4KCj4gT24gTW9uLCBKYW4gMjIsIDIwMjQgYXQgMTA6NTXigK9QTSBaaGloYW8gQ2hl
bmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPiB3cm90ZToKPj4KPj4g5ZyoIDIwMjQvMS8yMyAx
MTo1MywgQ2hlbnl1YW4gWWFuZyDlhpnpgZM6Cj4+PiBEZWFyIExpbnV4IEtlcm5lbCBEZXZlbG9w
ZXJzIGZvciBVQkksCj4+Pgo+Pj4gV2UgZW5jb3VudGVyZWQgIm1lbW9yeSBsZWFrIGluIHViaV9h
dHRhY2giIHdoZW4gdGVzdGluZyBVQkkgd2l0aAo+Pj4gU3l6a2FsbGVyIGFuZCBvdXIgZ2VuZXJh
dGVkIHNwZWNpZmljYXRpb25zLgo+Pj4KPj4+IHN5eiByZXBybzogaHR0cHM6Ly9kcml2ZS5nb29n
bGUuY29tL2ZpbGUvZC8xN0ZvR3c2YWtmdWZ6MDVVLW9SQlAyd1htT2lGRjFWVXEvdmlldz91c3A9
ZHJpdmVfbGluawo+Pj4gQyByZXByb2R1Y2VyOiBodHRwczovL2RyaXZlLmdvb2dsZS5jb20vZmls
ZS9kLzFheWQzbG1IUHZxTm9JMDFwUUVkVTgzMkVrdHBUVW5aXy92aWV3P3VzcD1kcml2ZV9saW5r
Cj4+PiByZXBvcnQ6IGh0dHBzOi8vZHJpdmUuZ29vZ2xlLmNvbS9maWxlL2QvMWhDMmFyWTNGYlF0
LTZMNXJiRGZZLURRMm9IODJJSUdxL3ZpZXc/dXNwPWRyaXZlX2xpbmsKPj4+IHN0YXRzOiBodHRw
czovL2RyaXZlLmdvb2dsZS5jb20vZmlsZS9kLzFSRWlnOWZWMEgxZllQV2FpaWNjLUpWTGxDcG83
VFR3NC92aWV3P3VzcD1kcml2ZV9saW5rCj4+Cj4+IEkgY2FuJ3Qgb3BlbiBhYm92ZSBsaW5rcyBp
biBjb21wYW55LCBtYXkgeW91IHBvc3QgdGhlc2UgZmlsZXMgaW4gYXR0YWNobWVudD8KPj4KPj4+
Cj4+PiBUaGlzIG1lbW9yeSBsZWFrIGlzIHRyaWdnZXJlZCBieSBgaW9jdGwkVUJJX0lPQ0FUVGAs
IHdoZXJlCj4+PiBgdWJpX2F0dGFjaF9pbmZvYCBpbnZva2VzIGBrbWVtX2NhY2hlX2NyZWF0ZWAK
Pj4+IChodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni43L3NvdXJjZS9kcml2ZXJz
L210ZC91YmkvYXR0YWNoLmMjTDE0NjQpLgo+Pj4gSXQgc2VlbXMgdGhhdCB0aGUgbWVtb3J5IGxl
YWsgb2NjdXJzIHdoZW4gdGhlIHNsYWIgY2FjaGUgaXMKPj4+IHN1Y2Nlc3NmdWxseSBjcmVhdGVk
LiBJIGFwb2xvZ2l6ZSBmb3Igbm90IGJlaW5nIGFibGUgdG8gY29uZHVjdCBhCj4+PiBkZWVwZXIg
YW5hbHlzaXMgb2YgdGhlIHJvb3QgY2F1c2UsIGFzIG15IGV4cGVydGlzZSBpbiBVQkkgZHJpdmVy
cyBpcwo+Pj4gbGltaXRlZC4KPj4+Cj4+PiBJZiB5b3UgaGF2ZSBhbnkgcXVlc3Rpb25zIG9yIHJl
cXVpcmUgbW9yZSBpbmZvcm1hdGlvbiwgcGxlYXNlIGZlZWwKPj4+IGZyZWUgdG8gY29udGFjdCB1
cy4KPj4+Cj4+PiBSZXBvcnRlZC1ieTogQ2hlbnl1YW4gWWFuZyA8Y2hlbnl1YW4weUBnbWFpbC5j
b20+Cj4+Pgo+Pj4gQmVzdCwKPj4+IENoZW55dWFuCj4+Pgo+Pj4KPj4+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+Pj4gTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cj4+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8KPj4+Cj4+Cj4+Cj4+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKPj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
