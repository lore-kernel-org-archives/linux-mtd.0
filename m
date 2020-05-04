Return-Path: <SRS0=hi6L=6S=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9663FC47257
	for <linux-mtd@archiver.kernel.org>; Mon,  4 May 2020 08:24:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B7FE206B9
	for <linux-mtd@archiver.kernel.org>; Mon,  4 May 2020 08:24:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Oljcozas"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B7FE206B9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OG9xA6MUW1xvOXe4+JOXRjxErj2bUAlTz2BtpAgfQ7g=; b=OljcozaseZ2S+g
	sHlUVANmE4SqWwi0wvy2nr+9n4Hq7UpMRu2GHH9d3oqsiOpxq/62U6LBrL2X+LNojdNjKtQYKG7fN
	WEcNavnDNhffHEAhAr/S+/fGW5epUGxzTIVE/DHwUI1vvpk/H0rUKFKZ992BLFdX1WvTT3qICBQDC
	DyrVdyxLOFiYRw8nJb1nYk0gNpAK6KZDYvil4mRZpX9soBoN5gUElTKIhOVKGz3MqaXCIDIZ5qUjN
	zIWaBGxCfT5c48uaaTDtj2b7LEMEYuW1nTE1ozfofrurmmRLXKWicpRzk24fUhlxHVjFBnGSlNNjS
	ROhOUjo8+pbYn6qACeSw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVWOu-0008OO-Fg; Mon, 04 May 2020 08:24:32 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVWOq-0008MF-JR
 for linux-mtd@lists.infradead.org; Mon, 04 May 2020 08:24:30 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 731E5C0009;
 Mon,  4 May 2020 08:24:14 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v3 00/13] Supporting restricted NAND controllers
Date: Mon,  4 May 2020 10:24:01 +0200
Message-Id: <20200504082414.7327-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200504_012428_910917_E91E98C4 
X-CRM114-Status: GOOD (  13.90  )
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
Cc: Michal Simek <monstr@monstr.eu>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpUaGUgZmlyc3QgNiBwYXRjaGVzIGFyZSBqdXN0IG1pc2NlbGxhbmVvdXMgY2hhbmdl
cywgdGhhdCBkbyBub3QgYnJpbmcKZnVuY3Rpb25hbCBjaGFuZ2VzIGJ1dCBjbGFyaWZ5IGEgZmV3
IGNvcmUgYXJlYXMuCgpQYXRjaGVzIDcgdG8gMTAgY2hhbmdlIHRoZSBOQU5EIG9wZXJhdGlvbnMg
dXNlZCB0byByZWFkIE9ORkkvSkVERUMKcGFyYW1ldGVyIHBhZ2VzLiBJIGV4cGVjdCBhbGwgY29u
dHJvbGxlcnMgdG8gc3VwcG9ydCBpdCBub3cuCgpQYXRjaCAxMSBhZGQgbmV3IG5hbmRfbW9ub2xp
dGhpY19yZWFkL3dyaXRlX3BhZ2VfcmF3KCkgaGVscGVycywgdGhhdApjb3VsZCBiZSB1c2VkIGJ5
IGRyaXZlcnMgd2hpY2ggYXJlICJjb25zdHJhaW5lZCIuCgpGaW5hbGx5LCBwYXRjaGVzIDEyIGFu
ZCAxMyBzb2Z0ZW4gdGhlIHJ1bGVzIHNvIHRoYXQgdGhlIGhvb2tzIGxpbmtlZAp0byB0aGUgYWJv
dmUgaGVscGVycyBhcmUgbm90IG92ZXJ3cml0dGVuIGJ5IHRoZSBjb3JlIG9yIE5BTkQgY2hpcApk
cml2ZXJzLgoKVGhpcyBzZXJpZXMgaXMgbmVlZGVkIGluIG9yZGVyIHRvIHN1cHBvcnQgY29udHJv
bGxlcnMgbGlrZSBBcmFzYW4ncy4KClRoYW5rcywKTWlxdcOobAoKQ2hhbmdlcyBpbiB2MzoKKiBz
L05BTkRfVVNFX0RNQV9CVUZGRVIvTkFORF9VU0VTX0RNQS8gYXMgc3VnZ2VzdGVkIGJ5IEJvcmlz
LgoqIENvbGxlY3RlZCBSZXZpZXdlZC1ieSB0YWdzLgoqIEVuaGFuY2UgdGhlIGtlcm5lbCBkb2Mg
b2YgdGhlIG1vbm9saXRoaWMgaGVscGVycy4KKiBBZGRlZCBhIG5hbmRfY2hlY2tfc3VwcG9ydGVk
X29wKCkgaGVscGVyLgoqIEFkZCBhIGNoZWNrX29ubHkgYXJndW1lbnQgdG8gdGhlIG5hbmRfcmVh
ZF9kYXRhX29wKCkgaGVscGVyIHNvIHRoYXQKICB3ZSBjYW4gY2hlY2sgaWYgaXQgaXMgc3VwcG9y
dGVkIGJ5IHRoZSBjb250cm9sbGVyIGRyaXZlciAodGhpcyB1c2VzCiAgdGhlIG5hbmRfY2hlY2tf
c3VwcG9ydGVkX29wKCkgaGVscGVyKS4KKiBFbmhhbmNlIHRoZSBPTkZJL0pFREVDIHBhcmFtZXRl
ciBwYWdlIGRpc2NvdmVyaWVzOiBpbiBjYXNlIHRoZQogIGRyaXZlciBkb2VzIG5vdCBzdXBwb3J0
IC0+ZXhlY19vcCgpLCB3ZSBzdGlsbCB1c2UgdGhlIHNhbWUgYmVoYXZpb3IKICBhcyBiZWZvcmUg
KHJlYWRpbmcgZGF0YSBieXRlcyBvbmx5KSwgb3RoZXJ3aXNlIHdlIGNoZWNrIGlmIHJlYWRpbmcK
ICBkYXRhIGJ5dGVzIGlzIHN1cHBvcnRlZCBvciBub3QuIElmIGl0IGlzIG5vdCwgdGhlbiB3ZSBm
YWxsYmFjayB0byBhCiAgQ0hBTkdFIFJFQUQgQ09MVU1OIG9wZXJhdGlvbi4KCkNoYW5nZXMgaW4g
djI6CiogRml4ZWQgdGhlIHR3byB3cm9uZyBjb252ZXJzaW9ucyBvZiBmbGFnIHZhbHVlcyBmcm9t
IDgtYml0IGRpZ2l0cwogIGludG8gQklUKCkgbWFjcm9zLgoqIERyb3BwZWQgIkhlbHAgc3VwcG9y
dGluZyBjb250cm9sbGVycyB0aGF0IGFyZSBub3QgYWJsZSB0byBzcGxpdAogIG9wZXJhdGlvbnMi
LiBJbnN0ZWFkLCBkZWNpZGVkIG9uIHRoZSBmbHkgZm9yIHRoZSByZWFkX3BhcmFtX3BhZ2UoKQog
IHVzZXMgKE9ORkkgYW5kIEpFREVDIGRpc2NvdmVyeSkgYW5kIHdyb3RlIHNlcGFyYXRlIGhlbHBl
cnMgZm9yCiAgcmVhZC93cml0ZV9wYWdlX3JhdygpICh0aGUgQXJhc2FuIGRyaXZlciB3aWxsIHVz
ZSB0aGVtKS4KKiBQcmV2ZW50IHRoZSBjb3JlIGFuZCBOQU5EIGNoaXAgZHJpdmVycyB0byBvdmVy
bG9hZCB0aGUKICBlY2MtPnJlYWQvd3JpdGVfcGFnZV9yYXcoKSBob29rcy4KKiBBZGRlZCBSZXZp
ZXdlZC1ieSB0YWdzLgoKTWlxdWVsIFJheW5hbCAoMTMpOgogIG10ZDogcmF3bmFuZDogVHJhbnNs
YXRlIG9ic2N1cmUgYml0ZmllbGRzIGludG8gcmVhZGFibGUgbWFjcm9zCiAgbXRkOiByYXduYW5k
OiBSZW9yZGVyIHRoZSBuYW5kX2NoaXAtPm9wdGlvbnMgZmxhZ3MKICBtdGQ6IHJhd25hbmQ6IFJl
bmFtZSBhIE5BTkQgY2hpcCBvcHRpb24KICBtdGQ6IHJhd25hbmQ6IEZpeCBjb21tZW50cyBhYm91
dCB0aGUgdXNlIG9mIGJ1ZnBvaQogIG10ZDogcmF3bmFuZDogUmVuYW1lIHRoZSB1c2VfYnVmcG9p
IHZhcmlhYmxlcwogIG10ZDogcmF3bmFuZDogQXZvaWQgaW5kaXJlY3QgYWNjZXNzIHRvIC0+ZGF0
YV9idWYoKQogIG10ZDogcmF3bmFuZDogQWRkIGEgaGVscGVyIHRvIGNoZWNrIHN1cHBvcnRlZCBv
cGVyYXRpb25zCiAgbXRkOiByYXduYW5kOiBHaXZlIHRoZSBwb3NzaWJpbGl0eSB0byB2ZXJpZnkg
YSByZWFkIG9wZXJhdGlvbiBpcwogICAgc3VwcG9ydGVkCiAgbXRkOiByYXduYW5kOiBvbmZpOiBB
ZGFwdCB0aGUgcGFyYW1ldGVyIHBhZ2UgcmVhZCB0byBjb25zdHJhaW50CiAgICBjb250cm9sbGVy
cwogIG10ZDogcmF3bmFuZDogamVkZWM6IEFkYXB0IHRoZSBwYXJhbWV0ZXIgcGFnZSByZWFkIHRv
IGNvbnN0cmFpbnQKICAgIGNvbnRyb2xsZXJzCiAgbXRkOiByYXduYW5kOiBFeHBvc2UgbW9ub2xp
dGhpYyByZWFkL3dyaXRlX3BhZ2VfcmF3KCkgaGVscGVycwogIG10ZDogcmF3bmFuZDogQWxsb3cg
Y29udHJvbGxlcnMgdG8gb3ZlcmxvYWQgc29mdCBFQ0MgaG9va3MKICBtdGQ6IHJhd25hbmQ6IG1p
Y3JvbjogQWxsb3cgY29udHJvbGxlcnMgdG8gb3ZlcmxvYWQgcmF3IGFjY2Vzc29ycwoKIGRyaXZl
cnMvbXRkL25hbmQvcmF3L2F0bWVsL25hbmQtY29udHJvbGxlci5jIHwgICAyICstCiBkcml2ZXJz
L210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jICAgICB8ICAgMiArLQogZHJpdmVycy9t
dGQvbmFuZC9yYXcvZGVuYWxpLmMgICAgICAgICAgICAgICAgfCAgIDIgKy0KIGRyaXZlcnMvbXRk
L25hbmQvcmF3L2ZzbWNfbmFuZC5jICAgICAgICAgICAgIHwgICAyICstCiBkcml2ZXJzL210ZC9u
YW5kL3Jhdy9pbnRlcm5hbHMuaCAgICAgICAgICAgICB8ICAgOSArCiBkcml2ZXJzL210ZC9uYW5k
L3Jhdy9tYXJ2ZWxsX25hbmQuYyAgICAgICAgICB8ICAgNCArLQogZHJpdmVycy9tdGQvbmFuZC9y
YXcvbWVzb25fbmFuZC5jICAgICAgICAgICAgfCAgIDIgKy0KIGRyaXZlcnMvbXRkL25hbmQvcmF3
L210a19uYW5kLmMgICAgICAgICAgICAgIHwgICAyICstCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9u
YW5kX2Jhc2UuYyAgICAgICAgICAgICB8IDE4OSArKysrKysrKysrKysrKy0tLS0tCiBkcml2ZXJz
L210ZC9uYW5kL3Jhdy9uYW5kX2plZGVjLmMgICAgICAgICAgICB8ICAzNCArKy0tCiBkcml2ZXJz
L210ZC9uYW5kL3Jhdy9uYW5kX2xlZ2FjeS5jICAgICAgICAgICB8ICAgOCArLQogZHJpdmVycy9t
dGQvbmFuZC9yYXcvbmFuZF9taWNyb24uYyAgICAgICAgICAgfCAgMTIgKy0KIGRyaXZlcnMvbXRk
L25hbmQvcmF3L25hbmRfb25maS5jICAgICAgICAgICAgIHwgIDIwICstCiBkcml2ZXJzL210ZC9u
YW5kL3Jhdy9xY29tX25hbmRjLmMgICAgICAgICAgICB8ICAgMiArLQogZHJpdmVycy9tdGQvbmFu
ZC9yYXcvc3RtMzJfZm1jMl9uYW5kLmMgICAgICAgfCAgIDIgKy0KIGRyaXZlcnMvbXRkL25hbmQv
cmF3L3N1bnhpX25hbmQuYyAgICAgICAgICAgIHwgICAyICstCiBkcml2ZXJzL210ZC9uYW5kL3Jh
dy90YW5nb19uYW5kLmMgICAgICAgICAgICB8ICAgMiArLQogZHJpdmVycy9tdGQvbmFuZC9yYXcv
dGVncmFfbmFuZC5jICAgICAgICAgICAgfCAgIDIgKy0KIGluY2x1ZGUvbGludXgvbXRkL3Jhd25h
bmQuaCAgICAgICAgICAgICAgICAgIHwgIDk5ICsrKysrLS0tLS0KIDE5IGZpbGVzIGNoYW5nZWQs
IDI2NyBpbnNlcnRpb25zKCspLCAxMzAgZGVsZXRpb25zKC0pCgotLSAKMi4yMC4xCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
