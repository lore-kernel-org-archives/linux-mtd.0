Return-Path: <SRS0=Nzsu=GJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB64FC433E0
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Jan 2021 14:51:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DD102311B
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Jan 2021 14:51:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DD102311B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Bo14qI8rxSLzo7RCBVo3l/w2JmKo/v7aGsZpkueKsn4=; b=hSrPKyKP6mJWl91on1YqRiTfw
	+EuxHalgSPpVxefcAyTH1wjQN/lhCDRfWx4LcuiODohkFFvJJ7Ar3Insx5asS6vx9kaHDJrBk/4t5
	MXMqs3M4wB34sUIP6kcnI4NI36HQkR9ee8BopmP/GIg3R5DUAJmDfNMip9bnQBgDSxMfmXGC84+w/
	T+fYPAPmeMnEiJNmWrXTJ1ICbDgwf0ZI/oBvLJa8c60mo4WzVf6q2rpJuQMLqGiggqSMxAtz1cOVm
	yHr4Dty1L4hffetgAs6gsTV5fDeV/+ZgX333ndM1sxsir1dQdy6/kFhkO6fZRnY2X67N0shIPcQzC
	IJ3Q0VIrg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxA9H-0001du-Kk; Wed, 06 Jan 2021 14:50:55 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxA9F-0001cN-1j
 for linux-mtd@lists.infradead.org; Wed, 06 Jan 2021 14:50:53 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 068B510000B;
 Wed,  6 Jan 2021 14:50:48 +0000 (UTC)
Date: Wed, 6 Jan 2021 15:50:47 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: Re: [PATCH -next] mtd: rawnand: marvell: use resource_size
Message-ID: <20210106155047.5d39fc42@xps13>
In-Reply-To: <20210106131839.371-1-zhengyongjun3@huawei.com>
References: <20210106131839.371-1-zhengyongjun3@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_095053_204632_AE82A05B 
X-CRM114-Status: GOOD (  14.47  )
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
Cc: richard@nod.at, linux-mtd@lists.infradead.org, vigneshr@ti.com,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8KClpoZW5nIFlvbmdqdW4gPHpoZW5neW9uZ2p1bjNAaHVhd2VpLmNvbT4gd3JvdGUgb24g
V2VkLCA2IEphbiAyMDIxCjIxOjE4OjM5ICswODAwOgoKPiBVc2UgcmVzb3VyY2Vfc2l6ZSByYXRo
ZXIgdGhhbiBhIHZlcmJvc2UgY29tcHV0YXRpb24gb24KPiB0aGUgZW5kIGFuZCBzdGFydCBmaWVs
ZHMuCgpTYW1lIGFzIHlvdXIgcHJldmlvdXMgcGF0Y2gsIHRoZSBkZXNjcmlwdGlvbiBkb2VzIG5v
dCBtYXRjaCB0aGUgY2hhbmdlLgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBaaGVuZyBZb25nanVuIDx6
aGVuZ3lvbmdqdW4zQGh1YXdlaS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L21h
cnZlbGxfbmFuZC5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWFydmVs
bF9uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tYXJ2ZWxsX25hbmQuYwo+IGluZGV4IGY1
Y2EyMDAyZDA4ZS4uM2UwMWIxMWM4N2Y4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQv
cmF3L21hcnZlbGxfbmFuZC5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWFydmVsbF9u
YW5kLmMKPiBAQCAtMjM5Niw3ICsyMzk2LDcgQEAgc3RhdGljIGludCBtYXJ2ZWxsX25mY19zZXR1
cF9pbnRlcmZhY2Uoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgaW50IGNoaXBuciwKPiAgCSAqIGJl
IGdyZWF0ZXIgdGhhbiB0aGF0IHRvIGJlIHN1cmUgdENDUyBkZWxheSBpcyByZXNwZWN0ZWQuCj4g
IAkgKi8KPiAgCW5mY190bWcudFdIUiA9IFRPX0NZQ0xFUyhtYXhfdChpbnQsIHNkci0+dFdIUl9t
aW4sIHNkci0+dENDU19taW4pLAo+IC0JCQkJIHBlcmlvZF9ucykgLSAyLAo+ICsJCQkJIHBlcmlv
ZF9ucykgLSAyOwo+ICAJbmZjX3RtZy50UkhXID0gVE9fQ1lDTEVTKG1heF90KGludCwgc2RyLT50
UkhXX21pbiwgc2RyLT50Q0NTX21pbiksCj4gIAkJCQkgcGVyaW9kX25zKTsKPiAgCgoKCgpUaGFu
a3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
