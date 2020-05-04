Return-Path: <SRS0=hi6L=6S=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FD2CC3A5A9
	for <linux-mtd@archiver.kernel.org>; Mon,  4 May 2020 09:55:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 326D42071C
	for <linux-mtd@archiver.kernel.org>; Mon,  4 May 2020 09:55:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u8mHzz3+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 326D42071C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Z23s45q1Qv/SBuE1ZgjpJQdE75YEnQOSc8R1QCDngdU=; b=u8mHzz3+cj8HbN
	miHHwjey/XT3sKGl6lCjY6xIzr/AY2DOGVW/1yVuKqdT+jXl8NOqwAzIuSuNGpF0w0R1W3UzKqCGx
	GTNtn1w/vXz6Rnvg/M9bGHURx6k5zjQ7VPTuTZTnXN7xzFYKYkvNwMKuuYk/8aMCLJfFsPPQT5zpM
	gWXl9rYLG7/sWrVs9Ov3b/94dwU4j0W1AjqxwUnpAWGraOrguL3OXmDI4drVPmh+2HNJeR5gCZly5
	fpTY2BtNcff4zvirhMzR2RDQwbX/Mw6qCImXiDmPpVjmuD5dMMRDpFncOmZyHnnQGJAUMWyi1Lki9
	iDW6hDQ6cESzOjUBwILA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVXon-0006uP-8B; Mon, 04 May 2020 09:55:21 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVXok-0006tA-An
 for linux-mtd@lists.infradead.org; Mon, 04 May 2020 09:55:20 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 96F20240025;
 Mon,  4 May 2020 09:52:38 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v4 00/13] Supporting restricted NAND controllers
Date: Mon,  4 May 2020 11:52:24 +0200
Message-Id: <20200504095237.1654-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200504_025518_649581_55FCF135 
X-CRM114-Status: GOOD (  14.00  )
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
bGxlcnMgbGlrZSBBcmFzYW4ncy4KClRoYW5rcywKTWlxdcOobAoKQ2hhbmdlcyBpbiB2NDoKKiBD
b2xsZWN0ZWQgUmV2aWV3ZWQtYnkgdGFncy4KKiBDaGFuZ2VkIHRoZSB4eHgoKSA9PSAwIGNvbmRp
dGlvbnMgaW50byAheHh4KCkKKiBSZW1vdmVkIHRoZSB1c2Ugb2YgcGJ1ZiBpbiB0aGUgSkVERUMg
ZHJpdmVyLCBrZWVwIHVzaW5nIHAgb25seQoqIERyb3BwZWQgdGhlIGV4dHJhIHNlbnRlbmNlIGlu
IHRoZSBrZXJuZWwgZG9jIG9mIG1vbm9saXRoaWMgaGVscGVycwoKQ2hhbmdlcyBpbiB2MzoKKiBz
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
YW5kX2Jhc2UuYyAgICAgICAgICAgICB8IDE4NyArKysrKysrKysrKysrKy0tLS0tCiBkcml2ZXJz
L210ZC9uYW5kL3Jhdy9uYW5kX2plZGVjLmMgICAgICAgICAgICB8ICAxOSArLQogZHJpdmVycy9t
dGQvbmFuZC9yYXcvbmFuZF9sZWdhY3kuYyAgICAgICAgICAgfCAgIDggKy0KIGRyaXZlcnMvbXRk
L25hbmQvcmF3L25hbmRfbWljcm9uLmMgICAgICAgICAgIHwgIDEyICstCiBkcml2ZXJzL210ZC9u
YW5kL3Jhdy9uYW5kX29uZmkuYyAgICAgICAgICAgICB8ICAyMCArLQogZHJpdmVycy9tdGQvbmFu
ZC9yYXcvcWNvbV9uYW5kYy5jICAgICAgICAgICAgfCAgIDIgKy0KIGRyaXZlcnMvbXRkL25hbmQv
cmF3L3N0bTMyX2ZtYzJfbmFuZC5jICAgICAgIHwgICAyICstCiBkcml2ZXJzL210ZC9uYW5kL3Jh
dy9zdW54aV9uYW5kLmMgICAgICAgICAgICB8ICAgMiArLQogZHJpdmVycy9tdGQvbmFuZC9yYXcv
dGFuZ29fbmFuZC5jICAgICAgICAgICAgfCAgIDIgKy0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L3Rl
Z3JhX25hbmQuYyAgICAgICAgICAgIHwgICAyICstCiBpbmNsdWRlL2xpbnV4L210ZC9yYXduYW5k
LmggICAgICAgICAgICAgICAgICB8ICA5OSArKysrKy0tLS0tCiAxOSBmaWxlcyBjaGFuZ2VkLCAy
NTYgaW5zZXJ0aW9ucygrKSwgMTI0IGRlbGV0aW9ucygtKQoKLS0gCjIuMjAuMQoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
