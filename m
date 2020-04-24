Return-Path: <SRS0=YgIB=6I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC8DAC54FCB
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Apr 2020 17:38:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E7E820736
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Apr 2020 17:38:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tjYvWR5w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E7E820736
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2UqkaMJGzqn6ZKElMwUj2dMkVBCnEqpbeD3xByRNTbY=; b=tjYvWR5wAKtixf
	kKNsc+Kcuhkyua959iotLuOYHcewbUjihZd4TYBHV3X6gl3GBETTe31hISTtWaNQ8tXzfVDilJoii
	1uReB2NRaizBVJzoOEKaUIk4J5AU3Iu9yvxEXgq5rg89pLUiYOUxUWKeJKzuA3FKb5JuAOjPocug2
	XhmhiP45fYoQwOA5er2bMq0vLciek79AoAdu6Tn/SvsChz3msOyjBsUUpiUrFxfLi8pmU4yvPD15Q
	j6NqFkwqmtDj9ypojAAEbVDzKhtlBFe043/yeAQABhomi71TdtD8xmVtFWkBJCUP/Nr9wWyaYXeZv
	PCgkk5SeRKxD/hb7t2Yw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jS2Gz-0007EA-JX; Fri, 24 Apr 2020 17:37:57 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jS2Fg-0005yP-2D
 for linux-mtd@lists.infradead.org; Fri, 24 Apr 2020 17:36:37 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id C884920003;
 Fri, 24 Apr 2020 17:36:32 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 00/10] Supporting restricted NAND controllers
Date: Fri, 24 Apr 2020 19:36:21 +0200
Message-Id: <20200424173631.14311-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200424_103636_414055_A54ECFB6 
X-CRM114-Status: UNSURE (   8.21  )
X-CRM114-Notice: Please train this message.
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
IGNvcmUgYXJlYXMuCgpQYXRoIDcgYWRkcyBhIHdheSB0byB0ZXN0IHdoYXQgdGhlIGNvbnRyb2xs
ZXIgLT5leGVjX29wKCkKaW1wbGVtZW50YXRpb24gYWN0dWFsbHkgc3VwcG9ydHMgYW5kIGRlY2lk
ZSB0byBlaXRoZXIgInBhY2siIHRoZSBOQU5ECm9wZXJhdGlvbnMgYXMgbXVjaCBhcyBwb3NzaWJs
ZSwgb3RoZXJ3aXNlIGNvbnRpbnVlIHRvIHNwbGl0IG9wZXJhdGlvbnMKYXMgdXN1YWwuCgpQYXRj
aGVzIDggYW5kIDkgdXNlIHRoaXMgZmxhZyB0byBmYWxsYmFjayBvbiBwYWNrZWQgb3BlcmF0aW9u
cyBkdXJpbmcKT05GSS9KRURFQyBwYXJhbWV0ZXIgcGFnZSByZWFkcyAodGhlIGlkZWEgb2YgdGhl
c2UgdHdvIHBhdGNoZXMgaXMKaW1wb3J0ZWQgZnJvbSBhIHByZXZpb3VzIHNlcmllcykuCgpGaW5h
bGx5LCBwYXRjaCAxMCBkb2VzIHRoZSBzYW1lIGluIHRoZSBjb3JlLCBpbiB0aGUgcmVhZC93cml0
ZV9wYWdlCmhlbHBlcnMuCgpUaGlzIHNlcmllcyBpcyBuZWVkZWQgaW4gb3JkZXIgdG8gc3VwcG9y
dCBjb250cm9sbGVycyBsaWtlIEFyYXNhbidzLgoKVGhhbmtzLApNaXF1w6hsCgpNaXF1ZWwgUmF5
bmFsICgxMCk6CiAgbXRkOiByYXduYW5kOiBUcmFuc2xhdGUgb2JzY3VyZSBiaXRmaWVsZHMgaW50
byByZWFkYWJsZSBtYWNyb3MKICBtdGQ6IHJhd25hbmQ6IFJlb3JkZXIgdGhlIG5hbmRfY2hpcC0+
b3B0aW9ucyBmbGFncwogIG10ZDogcmF3bmFuZDogUmVuYW1lIGEgTkFORCBjaGlwIG9wdGlvbgog
IG10ZDogcmF3bmFuZDogRml4IGNvbW1lbnRzIGFib3V0IHRoZSB1c2Ugb2YgYnVmcG9pCiAgbXRk
OiByYXduYW5kOiBSZW5hbWUgdGhlIHVzZV9idWZwb2kgdmFyaWFibGVzCiAgbXRkOiByYXduYW5k
OiBBdm9pZCBpbmRpcmVjdCBhY2Nlc3MgdG8gLT5kYXRhX2J1ZigpCiAgbXRkOiByYXduYW5kOiBI
ZWxwIHN1cHBvcnRpbmcgY29udHJvbGxlcnMgdGhhdCBhcmUgbm90IGFibGUgdG8gc3BsaXQKICAg
IG9wZXJhdGlvbnMKICBtdGQ6IHJhd25hbmQ6IG9uZmk6IEFkZCBhbiBhbHRlcm5hdGl2ZSBwYXJh
bWV0ZXIgcGFnZSByZWFkCiAgbXRkOiByYXduYW5kOiBqZWRlYzogQWRkIGFuIGFsdGVybmF0aXZl
IHBhcmFtZXRlciBwYWdlIHJlYWQKICBtdGQ6IHJhd25hbmQ6IEZhbGxiYWNrIG9uIGVhc2llciBv
cGVyYXRpb25zIHdoZW4gbmVlZGVkCgogZHJpdmVycy9tdGQvbmFuZC9yYXcvYXRtZWwvbmFuZC1j
b250cm9sbGVyLmMgfCAgIDIgKy0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21u
YW5kLmMgICAgIHwgICAyICstCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9kZW5hbGkuYyAgICAgICAg
ICAgICAgICB8ICAgMiArLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvaW50ZXJuYWxzLmggICAgICAg
ICAgICAgfCAgIDUgKwogZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jICAgICAgICAg
ICAgfCAgIDIgKy0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L210a19uYW5kLmMgICAgICAgICAgICAg
IHwgICAyICstCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYyAgICAgICAgICAgICB8
IDExMCArKysrKysrKysrKysrKystLS0tCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2plZGVj
LmMgICAgICAgICAgICB8ICAzMSArKysrLS0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfb25m
aS5jICAgICAgICAgICAgIHwgIDE3ICsrLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5k
Yy5jICAgICAgICAgICAgfCAgIDIgKy0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L3N0bTMyX2ZtYzJf
bmFuZC5jICAgICAgIHwgICAyICstCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9zdW54aV9uYW5kLmMg
ICAgICAgICAgICB8ICAgMiArLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvdGFuZ29fbmFuZC5jICAg
ICAgICAgICAgfCAgIDIgKy0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L3RlZ3JhX25hbmQuYyAgICAg
ICAgICAgIHwgICAyICstCiBpbmNsdWRlL2xpbnV4L210ZC9yYXduYW5kLmggICAgICAgICAgICAg
ICAgICB8IDEwNSArKysrKysrKysrLS0tLS0tLS0KIDE1IGZpbGVzIGNoYW5nZWQsIDE5MSBpbnNl
cnRpb25zKCspLCA5NyBkZWxldGlvbnMoLSkKCi0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
