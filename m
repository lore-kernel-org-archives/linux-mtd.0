Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAD5606A31A
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Oct 2026 04:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dlovg5Q7;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=TbIrOkJj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JdVHbmLDozShZozfgkPM1MQoGuAfEUKljsxJBPjWJHE=; b=dlovg5Q7H/7j1l6R4yq2aTK010
	/7j3REjBpUeAyKj65o6qzb7DAtjl47v2WjvrUkxHQoqLRrCJHJZgJW2X0m2qYOut8hSGnzqrCwyQG
	8DT8u4siZxfgfw7NblP3JWBHGO1QlmpQYr5s95rgTkvwutKRwyaYfQft3sIFK9aiA2Tt51EyAhSfn
	hNrmxT7saJS5zwPzWCIDd/ybmtoR0fR32Jdxyf7WiViR6mBfuiPx7kcIRbogjQpSw7NXAgCQAZog2
	DSIQIMXHz9yBeEI7ANPxWiqVoBJwkZ/MQMG8joaPmm8YaGuo1Dr6iCjnt27exJ7nDWiLsiT40e+FG
	hSODY8ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLCYe-00000001hww-2fQ3;
	Mon, 26 Oct 2026 04:43:40 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLCYa-00000001hwR-48mg
	for linux-mtd@lists.infradead.org;
	Mon, 26 Oct 2026 04:43:39 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=pA5SQuNt2A3L8vVVAARn7Ve8cg2BMqGbZ0MCh8Bf2x4=;
	b=TbIrOkJjBbYTPkV5O0h5OcNmzcv1E2fqHSRZSp9h20CuU/J67lm7Go46MuSK6RhLS6OOt1y9n
	2p2qkAOZvC51+Zt1aVCdWkYx2G84fKfKBhlR7lN4w4eQILjLFaGNHgSc0j2BAt4DdEppe+Rzo9H
	ZilsoKpPRl8zEXwRQGO9Kxs=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4jCgx30ppDzRhRs;
	Mon, 26 Oct 2026 12:43:19 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id 5580A202E6;
	Mon, 26 Oct 2026 12:43:26 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 whupemo200011.china.huawei.com (7.152.185.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 26 Oct 2026 12:43:25 +0800
Subject: Re: [PATCH 2/2] ubi: Check the data size of the last LEB of static
 volumes
To: Alejandro Pacheco <ale@alepacheco.dev>, Richard Weinberger
	<richard@nod.at>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra
	<vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <6083713b-4c4e-4e17-93c5-61f3bb7a77f1@alepacheco.dev>
 <67a5dbbb-911a-4f24-b862-9dae24f958e0@alepacheco.dev>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <22ec08e4-90cc-a45a-e334-c355da430928@huawei.com>
Date: Mon, 26 Oct 2026 12:43:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <67a5dbbb-911a-4f24-b862-9dae24f958e0@alepacheco.dev>
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 whupemo200011.china.huawei.com (7.152.185.179)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_214337_676535_33CE8694 
X-CRM114-Status: GOOD (  23.86  )
X-Spam-Score: -3.8 (---)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="gbk"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

1NogMjAyNi8xMC8yNCAyMDo0MywgQWxlamFuZHJvIFBhY2hlY28g0LS1wDoKPiBGcm9tOiBBbGVq
YW5kcm8gUGFjaGVjbyA8YWxlQGFsZXBhY2hlY28uZGV2Pgo+IAo+IEZvciBhIHN0YXRpYyB2b2x1
bWUsIGluaXRfdm9sdW1lcygpIHRha2VzIHRoZSBkYXRhIHNpemUgb2YgaXRzIGxhc3QgTEVCCj4g
ZnJvbSB0aGUgYXR0YWNoIGluZm9ybWF0aW9uLCBhdi0+bGFzdF9kYXRhX3NpemUsIGFzIHZvbC0+
bGFzdF9lYl9ieXRlcy4KPiBXaGVuIHRoZSB2b2x1bWUgaXMgZmlyc3Qgb3BlbmVkLCB1YmlfY2hl
Y2tfdm9sdW1lKCkgcmVhZHMgdGhhdCBtYW55Cj4gYnl0ZXMgb2YgdGhlIGxhc3QgTEVCIGludG8g
YSBidWZmZXIgb2Ygdm9sLT51c2FibGVfbGViX3NpemUgYnl0ZXMuCj4gCj4gTm90aGluZyBib3Vu
ZHMgdGhhdCBzaXplIGJ5IHZvbC0+dXNhYmxlX2xlYl9zaXplLiBXaGVuIFVCSSBhdHRhY2hlcyBi
eQo+IHNjYW5uaW5nLCBpdCBpcyB0aGUgZGF0YV9zaXplIG9mIHRoZSBsYXN0IExFQidzIFZJRCBo
ZWFkZXIsIHdoaWNoCj4gdmFsaWRhdGVfdmlkX2hkcigpIG9ubHkgY2hlY2tzIGFnYWluc3QgdWJp
LT5sZWJfc2l6ZTsgdGhhdCBpcyBsYXJnZXIKPiB0aGFuIHRoZSB1c2FibGUgTEVCIHNpemUgb2Yg
YSB2b2x1bWUgd2l0aCBhIG5vbi16ZXJvIGRhdGFfcGFkLiBXaGVuIFVCSQo+IGF0dGFjaGVzIGZy
b20gYSBmYXN0bWFwLCBpdCBjYW4gYmUgdGhlIGxhc3RfZWJfYnl0ZXMgb2YgdGhlIHZvbHVtZSdz
Cj4gZmFzdG1hcCBoZWFkZXIsIHdoaWNoIGlzIG5vdCBjaGVja2VkIGF0IGFsbC4gQSBsYXJnZXIg
c2l6ZSBtYWtlcwo+IHViaV9jaGVja192b2x1bWUoKSB3cml0ZSBwYXN0IHRoZSBlbmQgb2YgaXRz
IGJ1ZmZlci4KPiAKPiBCZWZvcmUgVUJJIGNvbWVzIHVwLCBjaGVja19hdHRhY2hpbmdfaW5mbygp
IHJ1bnMgY2hlY2tfYXYoKSBvbiBldmVyeQo+IHZvbHVtZSB0aGF0IGhhcyBhdHRhY2ggaW5mb3Jt
YXRpb24sIHRvIGNoZWNrIGl0IGFnYWluc3QgdGhlIHZvbHVtZSdzCj4gcmVjb3JkIGluIHRoZSB2
b2x1bWUgdGFibGUuIEFsc28gcmVqZWN0IHRoZXJlIGEgc3RhdGljIHZvbHVtZSB3aG9zZSBsYXN0
Cj4gTEVCIGRhdGEgc2l6ZSBpcyBuZWdhdGl2ZSBvciBsYXJnZXIgdGhhbiB2b2wtPnVzYWJsZV9s
ZWJfc2l6ZS4gSW1hZ2VzCj4gd3JpdHRlbiBieSBVQkkgb3IgdWJpbml6ZSBhcmUgbm90IGFmZmVj
dGVkOiBubyBMRUIgb2YgYSBzdGF0aWMgdm9sdW1lCj4gaG9sZHMgbW9yZSBkYXRhIHRoYW4gaXRz
IHVzYWJsZSBMRUIgc2l6ZS4KPiAKPiBUaGlzIG5lZWRzIGEgY3JhZnRlZCBpbWFnZSAodGhlIFZJ
RCBoZWFkZXIgYW5kIHRoZSBmYXN0bWFwIGNhcnJ5IENSQ3MKPiB0aGF0IGNhdGNoIHJhbmRvbSBj
b3JydXB0aW9uKSBvbiBhIGRldmljZSB0aGF0IFVCSSBhdHRhY2hlcyBhdCBib290IG9yCj4gdGhh
dCBhIHVzZXIgd2l0aCBDQVBfU1lTX1JFU09VUkNFIGF0dGFjaGVzLgo+IAo+IEFuIExMTSBjb2Rp
bmcgYXNzaXN0YW50IHdhcyB1c2VkIHRvIGZpbmQgdGhpcyBidWcgYW5kIHRvIHdyaXRlIHRoaXMK
PiBwYXRjaCBhbmQgaXRzIGNoYW5nZWxvZy4KPiAKPiBGaXhlczogODAxYzEzNWNlNzNkICgiVUJJ
OiBVbnNvcnRlZCBCbG9jayBJbWFnZXMiKQo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4g
U2lnbmVkLW9mZi1ieTogQWxlamFuZHJvIFBhY2hlY28gPGFsZUBhbGVwYWNoZWNvLmRldj4KPiAt
LS0KPiAgIGRyaXZlcnMvbXRkL3ViaS92dGJsLmMgfCA2ICsrKysrKwo+ICAgMSBmaWxlIGNoYW5n
ZWQsIDYgaW5zZXJ0aW9ucygrKQoKUmV2aWV3ZWQtYnk6IFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGlo
YW8xQGh1YXdlaS5jb20+Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3ViaS92dGJsLmMg
Yi9kcml2ZXJzL210ZC91YmkvdnRibC5jCj4gaW5kZXggMDZkODdhMzAxM2EuLmYxYmQ2ZTFlNDg4
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL3ViaS92dGJsLmMKPiArKysgYi9kcml2ZXJzL210
ZC91YmkvdnRibC5jCj4gQEAgLTY5Niw2ICs2OTYsMTIgQEAgc3RhdGljIGludCBjaGVja19hdihj
b25zdCBzdHJ1Y3QgdWJpX3ZvbHVtZSAqdm9sLAo+ICAgCQllcnIgPSA1Owo+ICAgCQlnb3RvIGJh
ZDsKPiAgIAl9Cj4gKwlpZiAodm9sLT52b2xfdHlwZSA9PSBVQklfU1RBVElDX1ZPTFVNRSAmJgo+
ICsJICAgIChhdi0+bGFzdF9kYXRhX3NpemUgPCAwIHx8Cj4gKwkgICAgIGF2LT5sYXN0X2RhdGFf
c2l6ZSA+IHZvbC0+dXNhYmxlX2xlYl9zaXplKSkgewo+ICsJCWVyciA9IDY7Cj4gKwkJZ290byBi
YWQ7Cj4gKwl9Cj4gICAJcmV0dXJuIDA7Cj4gICAKPiAgIGJhZDoKPiAuCj4gCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
