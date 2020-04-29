Return-Path: <SRS0=TDhY=6N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DA6AC83000
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 15:56:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4BB220775
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 15:56:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HDKDnpIG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4BB220775
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kg/sIS6H0fgifFK6v9cqTWCBal6bHBOAWF1MNpVEOso=; b=HDKDnpIGEyuUeW
	58I5LGDDcjACj7R8am2UV2efIyt2ESXznRKWjdYopoV3yhw7XZsT+llnIfBYp7gbtMIwVAbg7tMJ5
	b5dUaETWvWMORauJUhvB4fQppvbpNjLcn2IL0KgVBQQfeUYC0+iv2chr43b6XG7AhSt+tBpy3P3p6
	hWUt8eqWY8GdqNm+GJl1OJ+M2tOm7jaARWzAWNDub33hnVaQMGxRxBlhSyRBzYuECgDwYakmKKlDF
	Hnu2s5YNFYncbf8xOpWfTjIMg4v2a1Am6vpnfpVVhcmlwH51ZeGrKHtlVuUIacMo3+1Dxqpd1ftrp
	RQiYSJ5/sAwHoEAGDJfw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTp3x-0003wl-VO; Wed, 29 Apr 2020 15:55:53 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTp3v-0003ue-8l
 for linux-mtd@lists.infradead.org; Wed, 29 Apr 2020 15:55:52 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id AAD5020005;
 Wed, 29 Apr 2020 15:55:41 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 00/11] Supporting restricted NAND controllers
Date: Wed, 29 Apr 2020 17:55:29 +0200
Message-Id: <20200429155540.22048-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_085551_444931_374ACA74 
X-CRM114-Status: GOOD (  10.47  )
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
IGNvcmUgYXJlYXMuCgpQYXRjaGVzIDcgYW5kIDggY2hhbmdlIHRoZSBOQU5EIG9wZXJhdGlvbiB1
c2VkIHRvIHJlYWQgT05GSS9KRURFQwpwYXJhbWV0ZXIgcGFnZXMuIEkgZXhwZWN0IGFsbCBjb250
cm9sbGVycyB0byBzdXBwb3J0IGl0LgoKUGF0Y2ggOSBhZGQgbmV3IG5hbmRfbW9ub2xpdGhpY19y
ZWFkL3dyaXRlX3BhZ2VfcmF3KCkgaGVscGVycywgdGhhdApjb3VsZCBiZSB1c2VkIGJ5IGRyaXZl
cnMgd2hpY2ggYXJlICJjb25zdHJhaW5lZCIuCgpGaW5hbGx5LCBwYXRjaGVzIDEwIGFuZCAxMSBz
b2Z0ZW4gdGhlIHJ1bGVzIHNvIHRoYXQgdGhlIGhvb2tzIGxpbmtlZAp0byB0aGUgYWJvdmUgaGVs
cGVycyBhcmUgbm90IG92ZXJ3cml0dGVuIGJ5IHRoZSBjb3JlIG9yIE5BTkQgY2hpcApkcml2ZXJz
LgoKVGhpcyBzZXJpZXMgaXMgbmVlZGVkIGluIG9yZGVyIHRvIHN1cHBvcnQgY29udHJvbGxlcnMg
bGlrZSBBcmFzYW4ncy4KClRoYW5rcywKTWlxdcOobAoKQ2hhbmdlcyBpbiB2MjoKKiBGaXhlZCB0
aGUgdHdvIHdyb25nIGNvbnZlcnNpb25zIG9mIGZsYWcgdmFsdWVzIGZyb20gOC1iaXQgZGlnaXRz
CiAgaW50byBCSVQoKSBtYWNyb3MuCiogRHJvcHBlZCAiSGVscCBzdXBwb3J0aW5nIGNvbnRyb2xs
ZXJzIHRoYXQgYXJlIG5vdCBhYmxlIHRvIHNwbGl0CiAgb3BlcmF0aW9ucyIuIEluc3RlYWQsIGRl
Y2lkZWQgb24gdGhlIGZseSBmb3IgdGhlIHJlYWRfcGFyYW1fcGFnZSgpCiAgdXNlcyAoT05GSSBh
bmQgSkVERUMgZGlzY292ZXJ5KSBhbmQgd3JvdGUgc2VwYXJhdGUgaGVscGVycyBmb3IKICByZWFk
L3dyaXRlX3BhZ2VfcmF3KCkgKHRoZSBBcmFzYW4gZHJpdmVyIHdpbGwgdXNlIHRoZW0pLgoqIFBy
ZXZlbnQgdGhlIGNvcmUgYW5kIE5BTkQgY2hpcCBkcml2ZXJzIHRvIG92ZXJsb2FkIHRoZQogIGVj
Yy0+cmVhZC93cml0ZV9wYWdlX3JhdygpIGhvb2tzLgoqIEFkZGVkIFJldmlld2VkLWJ5IHRhZ3Mu
CgpNaXF1ZWwgUmF5bmFsICgxMSk6CiAgbXRkOiByYXduYW5kOiBUcmFuc2xhdGUgb2JzY3VyZSBi
aXRmaWVsZHMgaW50byByZWFkYWJsZSBtYWNyb3MKICBtdGQ6IHJhd25hbmQ6IFJlb3JkZXIgdGhl
IG5hbmRfY2hpcC0+b3B0aW9ucyBmbGFncwogIG10ZDogcmF3bmFuZDogUmVuYW1lIGEgTkFORCBj
aGlwIG9wdGlvbgogIG10ZDogcmF3bmFuZDogRml4IGNvbW1lbnRzIGFib3V0IHRoZSB1c2Ugb2Yg
YnVmcG9pCiAgbXRkOiByYXduYW5kOiBSZW5hbWUgdGhlIHVzZV9idWZwb2kgdmFyaWFibGVzCiAg
bXRkOiByYXduYW5kOiBBdm9pZCBpbmRpcmVjdCBhY2Nlc3MgdG8gLT5kYXRhX2J1ZigpCiAgbXRk
OiByYXduYW5kOiBvbmZpOiBBZGFwdCB0aGUgcGFyYW1ldGVyIHBhZ2UgcmVhZCB0byBjb25zdHJh
aW50CiAgICBjb250cm9sbGVycwogIG10ZDogcmF3bmFuZDogamVkZWM6IEFkYXB0IHRoZSBwYXJh
bWV0ZXIgcGFnZSByZWFkIHRvIGNvbnN0cmFpbnQKICAgIGNvbnRyb2xsZXJzCiAgbXRkOiByYXdu
YW5kOiBFeHBvc2UgbW9ub2xpdGhpYyByZWFkL3dyaXRlX3BhZ2VfcmF3KCkgaGVscGVycwogIG10
ZDogcmF3bmFuZDogQWxsb3cgY29udHJvbGxlcnMgdG8gb3ZlcmxvYWQgc29mdCBFQ0MgaG9va3MK
ICBtdGQ6IHJhd25hbmQ6IG1pY3JvbjogQWxsb3cgY29udHJvbGxlcnMgdG8gb3ZlcmxvYWQgcmF3
IGFjY2Vzc29ycwoKIGRyaXZlcnMvbXRkL25hbmQvcmF3L2F0bWVsL25hbmQtY29udHJvbGxlci5j
IHwgICAyICstCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jICAgICB8
ICAgMiArLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvZGVuYWxpLmMgICAgICAgICAgICAgICAgfCAg
IDIgKy0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYyAgICAgICAgICAgIHwgICAy
ICstCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9tdGtfbmFuZC5jICAgICAgICAgICAgICB8ICAgMiAr
LQogZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMgICAgICAgICAgICAgfCAxMjIgKysr
KysrKysrKysrKysrLS0tLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9qZWRlYy5jICAgICAg
ICAgICAgfCAgMjggKysrLS0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfbWljcm9uLmMgICAg
ICAgICAgIHwgICA2ICstCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX29uZmkuYyAgICAgICAg
ICAgICB8ICAxNCArLS0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYyAgICAgICAg
ICAgIHwgICAyICstCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYyAgICAg
ICB8ICAgMiArLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvc3VueGlfbmFuZC5jICAgICAgICAgICAg
fCAgIDIgKy0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L3RhbmdvX25hbmQuYyAgICAgICAgICAgIHwg
ICAyICstCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy90ZWdyYV9uYW5kLmMgICAgICAgICAgICB8ICAg
MiArLQogaW5jbHVkZS9saW51eC9tdGQvcmF3bmFuZC5oICAgICAgICAgICAgICAgICAgfCAgOTcg
KysrKysrKystLS0tLS0tCiAxNSBmaWxlcyBjaGFuZ2VkLCAxODQgaW5zZXJ0aW9ucygrKSwgMTAz
IGRlbGV0aW9ucygtKQoKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
