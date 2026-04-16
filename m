Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 739ABF531E8
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2026 06:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qfnvws+IOKJp/as8em5t0LkCiWMShQx5A0fLfpzRqQs=; b=cL6haahZG70cMys7TfRUEEc3wg
	bQcMVPhG7hDUztca4tZefj9BDSld+yh3xdWG5FJ+El5T4DqXfopsa2Jmw/WlZpJkaIDb94XPtbdLq
	qzBQakMM8aLdP1l3vhwscOitL2slJihvqs/JvHVYqaG0vIOursCMMIL2ykJ9hx8fDXSyGWOKnAwte
	9Kz0CB41VLiWl52sK2R6A9MfoWz5Rf2R55ocOyXVFSCQM2uk25Anqi/vsFogqg1BLWJzp5QnEVyJN
	yNfKUFguL0+zMEhE/dG5Sveb82op4b+fN69e4HGBPFMKupTcz5NJV0oQwP3yNJQPcPXP+ifxrWcMV
	y0ZOWFdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDGQY-000000023xK-0bMR;
	Thu, 16 Apr 2026 06:42:14 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDGQV-000000023wU-1Piv
	for linux-mtd@lists.infradead.org;
	Thu, 16 Apr 2026 06:42:13 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=l12czzoWsjjRYj0jY049KLT3AamUUuzitRn+iLM94oo=;
	b=mX6NxOIpNJsy5G++xuGY0pPJSJpYH4NBqSSfpnFlQyi0+lcF6SbrvJ+Nxbzbyif7XxjQDBePf
	1b4qXoc4CcIc+w4g7H4/+k7g+VsvqGzd0MaIa2atnQvbmlkCqgWmdUXyXNmW8f2Czmp87bq5XEW
	cKM1VQdj2XDhsvfvw/JSdjQ=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4fx7Yr0XtrzLlZ6;
	Thu, 16 Apr 2026 14:35:44 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 304A940563;
	Thu, 16 Apr 2026 14:42:02 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 16 Apr 2026 14:42:01 +0800
Subject: Re: [PATCH v5 2/3] ubifs: use strscpy() and kmemdup_nul() where
 appropriate
To: Dmitry Antipov <dmantipov@yandex.ru>, Richard Weinberger <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>
References: <20260415071812.1139054-1-dmantipov@yandex.ru>
 <20260415071812.1139054-2-dmantipov@yandex.ru>
 <976f75c0-66a0-fc03-345e-3da0c1c5afea@huawei.com>
 <2f909ac5b916008033db7fd12804cf3e2a499e27.camel@yandex.ru>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <e4c0d68f-5378-7184-a577-0ad7f20676fb@huawei.com>
Date: Thu, 16 Apr 2026 14:41:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <2f909ac5b916008033db7fd12804cf3e2a499e27.camel@yandex.ru>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_234211_853125_080C2FAE 
X-CRM114-Status: GOOD (  13.58  )
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

5ZyoIDIwMjYvNC8xNiAxMzowOSwgRG1pdHJ5IEFudGlwb3Yg5YaZ6YGTOgo+IE9uIFRodSwgMjAy
Ni0wNC0xNiBhdCAxMTozNyArMDgwMCwgWmhpaGFvIENoZW5nIHdyb3RlOgo+IAo+Pj4gLQltZW1j
cHkoZGVudC0+bmFtZSwgZm5hbWVfbmFtZShubSksIGZuYW1lX2xlbihubSkpOwo+Pj4gLQlkZW50
LT5uYW1lW2ZuYW1lX2xlbihubSldID0gJ1wwJzsKPj4+ICsJc3Ryc2NweShkZW50LT5uYW1lLCBm
bmFtZV9uYW1lKG5tKSwgZm5hbWVfbGVuKG5tKSArIDEpOwo+Pgo+PiBIaSBEbWl0cnksCj4+IEkg
bm90aWNlIHRoYXQgc29tZSBhcmNoaXRlY3R1cmVzIGNhbiBhY2NlbGVyYXRlIHRoZSBpbXBsZW1l
bnRhdGlvbiBvZgo+PiBtZW1jcHkoKSwgYW5kIHRoZSBsZW5ndGggb2YgZGVudHJ5IG5hbWUgY291
bGQgYmUgMjU1LCBJIHN1Z2dlc3QgdG8ga2VlcAo+PiB0aGUgb3JpZ25hbCBpbXBsZW1lbnRhdGlv
bi4KPiAKPiBXaGF0IGFib3V0Cj4gCj4gbWVtY3B5X2FuZF9wYWQoZGVudC0+bmFtZSwgZm5hbWVf
bGVuKG5tKSArIDEsIGZuYW1lX25hbWUobm0pLCBmbmFtZV9sZW4obm0pLCAwKT8KCkkgd2Vha2x5
IGFjY2VwdCBtZW1jcHlfYW5kX3BhZCgpLgo+IAo+IEkgaGF2ZSBhIHN0cm9uZyBzdXNwaWNpb24g
dGhhdCBhbGwgb2YgdGhlICdcMCcgdGhpbmdzIHNob3VsZCBiZSBsZWZ0IHRvCj4gbGlicmFyeSBm
dW5jdGlvbnMuIFNvIHRoaXMgaXMgbm90IGEgc3R5bGUgYnV0IHJhdGhlciBhbiBvdmVyYWxsIGRl
c2lnbiBwb2ludCAtCj4gaWYgeW91J3JlIGluc2VydGluZyAnXDAnIGF0IHlvdXIgb3duLCBtb3N0
IGxpa2VseSB5b3UncmUgZG9pbmcgc29tZXRoaW5nCj4gd3JvbmcsIGF0IGxlYXN0IGJlY2F1c2Ug
eW91J3JlIGR1cGxpY2F0aW5nIHNvbWV0aGluZyB3aGljaCBpcyBhbHJlYWR5Cj4gaW1wbGVtZW50
ZWQgaW4gYSBsaWJyYXJ5IGZ1bmN0aW9uLgoKV2VsbCwga2VybmVsIGRldmVsb3BlcnMsIG9mIGNv
dXJzZSwgbmVlZCB0byB1bmRlcnN0YW5kIHdoZW4gYW5kIGhvdyB0byAKc2V0IHRoZSB0cmFpbGlu
ZyAnXDAnLiBUaGVyZSBhcmUgbWFueSBvdGhlciBwbGFjZXMgc2V0dGluZyB0cmFpbGluZyAKJ1ww
JyhlZy4geGZzX2luaXRfbG9jYWxfZm9yaywgeGZzX3N5bWxpbmtfcmVtb3RlX3JlYWQsIApleHQ0
X3hhdHRyX21vdmVfdG9fYmxvY2ssIGV0Yy4pLiBJIGRvbid0IHRoaW5rIHRoZXJlJ3MgYSBwcm9i
bGVtIHdpdGggCnRoaXM7IHRoZSBkZXZlbG9wZXJzIGtub3cgd2hhdCB0aGV5J3JlIGRvaW5nLgo+
IAo+IERtaXRyeQo+IC4KPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
