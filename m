Return-Path: <SRS0=Y0kv=SD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D32BCC43381
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 15:27:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A07F6213F2
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 15:27:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o3JUT3s0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A07F6213F2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JbDnPlS7B30l08j3W4J1b20Wr0MLCjyOnw330e1mWL4=; b=o3JUT3s0UqegwB
	UnPLvwwQ4LKgBs7HqO9vvmg+V/csNcBYgLkYrBRDCgHcHVp1hx3+V5tAX4EANLHSbS6BTWzInxaYK
	k1ehgOjGH9712+6BGEh0r7Z98zTlSWnfWfgCmTe92++brUrVMp8l887LunH8BOLeAJe54/xkV6vn6
	PehV45y7mTZSn6I4xXXsKoh3OcSxd7Iru2sR1h8439P4BT2ER89tfHpGjYNRcGLi+sqjioYL1RRNd
	F8q0iz8buep14XL74CmooSQE00V6XBebXVpBD2R78gjbuzoEoS3iJ06JasnLD6tLiDRRe9d3O2ZzS
	GqMUF4RVwxnUE2YRenZw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAyqk-00087E-MU; Mon, 01 Apr 2019 15:27:50 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAyqh-00085u-Jt; Mon, 01 Apr 2019 15:27:49 +0000
Received: from xps13 (aaubervilliers-681-1-91-136.w90-88.abo.wanadoo.fr
 [90.88.32.136]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 296F3100008;
 Mon,  1 Apr 2019 15:27:34 +0000 (UTC)
Date: Mon, 1 Apr 2019 17:27:33 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2 0/2] meson-nand: two small memory related fixes
Message-ID: <20190401172733.17131e3e@xps13>
In-Reply-To: <20190318204722.9901-1-martin.blumenstingl@googlemail.com>
References: <20190318204722.9901-1-martin.blumenstingl@googlemail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_082747_800887_ABC9852B 
X-CRM114-Status: GOOD (  11.31  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: jianxin.pan@amlogic.com, bbrezillon@kernel.org, richard@nod.at,
 linux-kernel@vger.kernel.org, liang.yang@amlogic.com,
 linux-mtd@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFydGluLAoKTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29n
bGVtYWlsLmNvbT4gd3JvdGUgb24gTW9uLAoxOCBNYXIgMjAxOSAyMTo0NzoyMCArMDEwMDoKCj4g
V2hpbGUgdHJ5aW5nIHRvIGFkZCBzdXBwb3J0IGZvciBvbGRlciBNZXNvbiBTb0NzIHRvIHRoZSBt
ZXNvbi1uYW5kCj4gZHJpdmVyIEkgd2FzIGV4cGVyaWVuY2luZyBhIGNyYXNoIGluIG1lc29uX25m
Y19yZWFkX2J1ZigpLiBXaGlsZSB0cnlpbmcKPiB0byBmaW5kIG91dCB3aHkgdGhhdCBoYXBwZW5l
ZCBJIGluc3BlY3RlZCB0aGUgY29kZSBpbiB0aGF0IGZ1bmN0aW9uIGFuZAo+IGZvdW5kIHRoYXQg
dGhlcmUnczoKPiAtIGEgbWlzc2luZyBjaGVjayBvbiB0aGUgcmV0dXJuIHZhbHVlIG9mIGEga3ph
bGxvYygpIGNhbGwKPiAtIGEgcG90ZW50aWFsIG1lbW9yeSBsZWFrIGluIGl0Cj4gCj4gQm90aCBm
aXhlcyBoYXZlIG5vdGhpbmcgdG8gZG8gd2l0aCBteSBvcmlnaW5hbCBjcmFzaCAoZm9yIHdoaWNo
IEknbGwKPiBvcGVuIGEgc2VwYXJhdGUgdGhyZWFkKS4KPiAKPiAKPiBDaGFuZ2VzIHNpbmNlIHYx
Ogo+IC0gY29sbGVjdGVkIExpYW5nJ3MgQWNrZWQtYnkncyAodGhhbmsgeW91ISkKPiAtIHJlYmFz
ZWQgb24gdG9wIG9mIHY1LjEtcmMxCj4gCj4gCj4gTWFydGluIEJsdW1lbnN0aW5nbCAoMik6Cj4g
ICBtdGQ6IHJhd25hbmQ6IG1lc29uOiBhZGQgbWlzc2luZyBFTk9NRU0gY2hlY2sgaW4gbWVzb25f
bmZjX3JlYWRfYnVmKCkKPiAgIG10ZDogcmF3bmFuZDogbWVzb246IGZpeCBhIHBvdGVudGlhbCBt
ZW1vcnkgbGVhayBpbiBtZXNvbl9uZmNfcmVhZF9idWYKPiAKPiAgZHJpdmVycy9tdGQvbmFuZC9y
YXcvbWVzb25fbmFuZC5jIHwgNyArKysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKPiAKCgpBcHBsaWVkIHRvIGdpdDovL2dpdC5rZXJuZWwub3Jn
L3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9tdGQvbGludXguZ2l0Cm9uIG5hbmQvbmV4dC4KCgpU
aGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
