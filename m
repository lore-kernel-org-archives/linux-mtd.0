Return-Path: <SRS0=/+zL=6W=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4433DC47255
	for <linux-mtd@archiver.kernel.org>; Fri,  8 May 2020 17:13:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 180D2218AC
	for <linux-mtd@archiver.kernel.org>; Fri,  8 May 2020 17:13:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m0xKvt56"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 180D2218AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lEVp7ddbjPEd6gaQPkhefyuBGd94Z+3GY9CcvO3acEk=; b=m0xKvt56PDshC0
	WYGQFBYMj0tgcE1OYVjGJCfvJ2o/SpWzzl7SaUz7qh5+KUZD+9V0jtHOCGStjDZBYmBT86XvZhhNC
	eOFNSkDKKtMaciap9X8f8e4yDL/NW2z7u1sdK1df662TxrbxSyLqZLY/GW5+QTx8XxhsFWDU1tZVS
	bRCx9s2c3xmPIs6yt8SSYxni9v07gBKSFRpuz7rck5k1Gpj1JtW9Y+Yu06XQ3gaUKkCdQgNFNs//z
	7Fk4yzUeSWbU9lZuEb37mEx+FSnSrzvkRJ3193ycW1beq/vHtnkQbkNZli8heIlQNp8MvZSZMrV5y
	fgIa9/LnK2iVRz8so/yQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jX6ZJ-0005rK-Vh; Fri, 08 May 2020 17:13:49 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jX6ZG-0005l6-IJ
 for linux-mtd@lists.infradead.org; Fri, 08 May 2020 17:13:48 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 1B572240004;
 Fri,  8 May 2020 17:13:40 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 <devicetree@vger.kernel.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v4 0/8] New Arasan NAND controller driver
Date: Fri,  8 May 2020 19:13:31 +0200
Message-Id: <20200508171339.8052-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200508_101346_881895_84292750 
X-CRM114-Status: GOOD (  12.86  )
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

SGVsbG8sCgpUaGlzIGlzIGEgZGVlcCByZXdvcmsgb2YgTmFnYSdzIEFyYXNhbiBOQU5EIGNvbnRy
b2xsZXIgZHJpdmVyLiBUaGlzCnZlcnNpb24gaXMgdGhlIGZpbmFsIHZlcnNpb24gYW5kIHdvcmtz
IHdpdGggc29mdHdhcmUgRUNDLiBJdCByZWxpZXMgb24KYSBwcmV2aW91cyBzZXJpZXMgY2FsbGVk
ICJTdXBwb3J0aW5nIHJlc3RyaWN0ZWQgTkFORCBjb250cm9sbGVycyIgdGhhdApicmluZ3MgbW9y
ZSBmbGV4aWJpbGl0eSB0byB0aGUgTkFORCB3aXRoIHRoZSBnb2FsIHRvIHN1cHBvcnQKcmVzdHJp
Y3RlZCBjb250cm9sbGVycyBsaWtlIHRoaXMgb25lLgoKQ2hlZXJzLApNaXF1w6hsCgpDaGFuZ2Vz
IGluIHY0OgoqIENvbGxlY3RlZCBSZXZpZXdlZC1ieSB0YWdzLgoqIERyb3BwZWQgSXZhbiBmcm9t
IHRoZSBsaXN0IChkaWQgbm90IGZpbmQgaGlzIGNvbnRhY3QpLgoqIFdyYXBwZWQgY29tbWl0IGxv
Zy4KKiBGaXhlZCB0eXBvcyBpbiB0aGUgY29tbWl0IGxvZ3MvY29tbWVudHMuCiogVG9vayBhdXRo
b3JzaGlwIG9mIGFsbCBwYXRjaGVzLgoqIEFkZGVkIG1vcmUgZGV0YWlscyBvbiB0aGUgQkNIIGNo
YW5nZXMuCiogRG9jdW1lbnRlZCB0aGUgbmV3IGJjaF9jb250cm9sIGVudHJ5LgoqIE1hZGUgdGhl
IHN3YXAgYml0IGNhbGxzIGNvbmRpdGlvbmFscyBpbiBiY2hfZW5jb2RlIHRvIGF2b2lkCiAgcGVu
YWxpemluZyBwZW9wbGUgdGhhdCBkbyBub3QgdXNlIGl0LgoqIFBhdGNoZWQgYmNoX2luaXQoKSB0
byB0YWtlIGFuIGV4dHJhIGFyZ3VtZW50LgoqIERyb3BwZWQgY2FsbHMgdG8gbmFuZF9yZWxlYXNl
KCksIHVzZSB0aGUgY29uc3RydWN0aW9uIHByb3Bvc2VkIGJ5CiAgQm9yaXMgaW5zdGVhZC4KKiBE
cm9wcGVkIGEgdXNlbGVzcyBORkMgc3RydWN0IGZpZWxkLgoqIEFkZGVkIGEgY29tbWVudCBvbiBu
b3QgaGF2aW5nIGFuIGludGVycnVwdCBmb3IgUkIuCiogQ2hlY2tlZCB0aGUgbnVtYmVyIG9mIHN0
ZXBzIHJlcXVlc3RlZCBpcyBjb21wYXRpYmxlIHdpdGggdGhlCiAgY29udHJvbGxlciBsaW1pdGF0
aW9ucy4KKiBSZXdvcmtlZCBhbmZjX2V4ZWNfb3AgYXMgc3VnZ2VzdGVkIHRvIHRyZWF0IHRoZSBj
aGVja19vbmx5IGFyZ3VtZW50CiAgYW5vdGhlciB3YXkuCiogQ2hhbmdlIHRoZSBjb21tZW50IHN0
YXRpbmcgdGhhdCB0aGUgY29udHJvbGxlciBoYXMgb25seSBvbmUgQ1MuCiogQ2xhcmlmaWVkIHRo
ZSBpbnRlcnJ1cHRzIHNpZ25hbHMgdnMuIGludGVycnVwdCBzdGF0dXMgYml0cy4KCkNoYW5nZXMg
aW4gdjM6CiogUHJlZml4IHNwZWNpZmljIGNsb2NrIGRlZmluaXRpb25zIHdpdGggWExOWCBhcyB0
aGV5IGRvIG5vdCBhcHBseSBmb3IKICBhbnkgb3RoZXIgU29DIGFuZCBhcmUgYXR0YWNoZWQgdG8g
YSBzaW5nbGUgY29tcGF0aWJsZS4KKiBVc2VkIGZpZWxkIGdldHRlcnMvc2V0dGVycyBhcyBkZWZp
bmVkIGluIGJpdGZpZWxkLmguCiogRm9yY2UgY2FzdGluZyB0byB1MzIgYmVmb3JlIHNoaWZ0aW5n
IHU4IHZhbHVlcyBieSA4IDE2IG9yIDI0IGJpdHMuCiogQ29tcGx5IHdpdGggdGhlIHJlY2VudCBj
b3JlIGNoYW5nZXMgYW5kIHNlbGVjdCBtYW51YWxseQogIG5hbmRfbW9ub2xpdGhpY19yZWFkL3dy
aXRlX3BhZ2VfcmF3KCkgaGVscGVycy4KKiBBZGQgTUFJTlRBSU5FUiBwYXRjaC4KKiBBZGQgYSBi
aXQgZXh0cmFjdGlvbiBoZWxwZXIgaW4gdGhlIGNvcmUuCiogUmVuYW1lIEJDSCBmdW5jdGlvbnMu
CiogQWRkIGEgc3dhcHBpbmcgYml0IG1lY2hhbmlzbSB0byBCQ0guCiogU3VwcG9ydCB0aGUgaGFy
ZHdhcmUgRUNDIGVuZ2luZS4KCkNoYW5nZXMgaW4gdjI6CiogV29ya2luZyAtPmV4ZWNfb3AoKSBp
bXBsZW1lbnRhdGlvbiByZWx5aW5nIG9uIGNvcmUgY2hhbmdlcy4KKiBEcm9wcGVkIHRoZSBFQ0Mg
c3VwcG9ydCBmb3Igbm93LCB3aWxsIGJlIHBhcnQgb2YgYW5vdGhlciBzZXJpZXMgaWYKICB0aGlz
IHBhdGNoIGlzIGFjY2VwdGVkLgoKTWlxdWVsIFJheW5hbCAoOCk6CiAgbGliL2JjaDogUmV3b3Jr
IGEgbGl0dGxlIGJpdCB0aGUgZXhwb3J0ZWQgZnVuY3Rpb24gbmFtZXMKICBsaWIvYmNoOiBBbGxv
dyBlYXN5IGJpdCBzd2FwcGluZwogIG10ZDogcmF3bmFuZDogRW5zdXJlIHRoZSBudW1iZXIgb2Yg
Yml0ZmxpcHMgaXMgY29uc2lzdGVudAogIG10ZDogcmF3bmFuZDogQWRkIG5hbmRfZXh0cmFjdF9i
aXRzKCkKICBNQUlOVEFJTkVSUzogQWRkIEFyYXNhbiBOQU5EIGNvbnRyb2xsZXIgYW5kIGJpbmRp
bmdzCiAgZHQtYmluZGluZ3M6IG10ZDogRG9jdW1lbnQgQVJBU0FOIE5BTkQgYmluZGluZ3MKICBt
dGQ6IHJhd25hbmQ6IGFyYXNhbjogQWRkIG5ldyBBcmFzYW4gTkFORCBjb250cm9sbGVyCiAgbXRk
OiByYXduYW5kOiBhcmFzYW46IFN1cHBvcnQgdGhlIGhhcmR3YXJlIEJDSCBFQ0MgZW5naW5lCgog
Li4uL2JpbmRpbmdzL210ZC9hcmFzYW4sbmFuZC1jb250cm9sbGVyLnlhbWwgIHwgICA2MyArCiBN
QUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICA3ICsKIGRy
aXZlcnMvbXRkL2RldmljZXMvZG9jZzMuYyAgICAgICAgICAgICAgICAgICB8ICAgMTAgKy0KIGRy
aXZlcnMvbXRkL25hbmQvcmF3L0tjb25maWcgICAgICAgICAgICAgICAgICB8ICAgIDcgKwogZHJp
dmVycy9tdGQvbmFuZC9yYXcvTWFrZWZpbGUgICAgICAgICAgICAgICAgIHwgICAgMSArCiBkcml2
ZXJzL210ZC9uYW5kL3Jhdy9hcmFzYW4tbmFuZC1jb250cm9sbGVyLmMgfCAxMjI3ICsrKysrKysr
KysrKysrKysrCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYyAgICAgICAgICAgICAg
fCAgIDUyICstCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2JjaC5jICAgICAgICAgICAgICAg
fCAgIDEwICstCiBpbmNsdWRlL2xpbnV4L2JjaC5oICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgIDExICstCiBpbmNsdWRlL2xpbnV4L210ZC9yYXduYW5kLmggICAgICAgICAgICAgICAgICAg
fCAgICA0ICsKIGxpYi9iY2guYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
ICAxNTIgKy0KIDExIGZpbGVzIGNoYW5nZWQsIDE0ODAgaW5zZXJ0aW9ucygrKSwgNjQgZGVsZXRp
b25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL210ZC9hcmFzYW4sbmFuZC1jb250cm9sbGVyLnlhbWwKIGNyZWF0ZSBtb2RlIDEwMDY0NCBk
cml2ZXJzL210ZC9uYW5kL3Jhdy9hcmFzYW4tbmFuZC1jb250cm9sbGVyLmMKCi0tIAoyLjIwLjEK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
