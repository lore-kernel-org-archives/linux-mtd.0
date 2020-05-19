Return-Path: <SRS0=qFGM=7B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEEA0C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 07:46:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84AF0207C4
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 07:46:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f79mOfqn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84AF0207C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7TcFQ4ep0JDLvo6Ck2KEcx9MnFyIpcbC1Ln3YJFT7Bo=; b=f79mOfqnbzSCom
	2+Cl0ncpcsFwsjHPCNsJPXurzHHhwwY4QAECBFt5xBiNNTMVyTNPScGYDnxkYTeXg9qb+qUTFANJ8
	nOZQRx+2+Z05xbiCPwePdAdsmkB2WisvKbW1eprZ+uNzdw64zGLfu/QARcdB+zQuAycRxf/AXIvi4
	B5tm2HrsIjRFyKs3sQApwfJE/DddMrrPTLVXrx6j1/xWRmjUJdWgN88ZBcErNnsaFBEWjLO2FyFeC
	E+20Mk81Qau+kjmou3w60bfh1R72+qduKV/dDrNqK3cnpOLLzLyfXcuPbjM823KCWWDMgzsvOwaeR
	QxHn/f9ZFaXTNgOyAmlA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jawwq-0006qh-4B; Tue, 19 May 2020 07:46:00 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jawwm-0006pO-AT
 for linux-mtd@lists.infradead.org; Tue, 19 May 2020 07:45:58 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 6220D240008;
 Tue, 19 May 2020 07:45:50 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v5 0/8] New Arasan NAND controller driver
Date: Tue, 19 May 2020 09:45:41 +0200
Message-Id: <20200519074549.23673-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_004556_635830_502C8DC4 
X-CRM114-Status: GOOD (  14.38  )
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
IGluIHY1OgoqIEFkZGVkIGEgRklYTUUgYW5kIHR3byBUT0RPIGNvbW1lbnRzIGluIHRoZSBjb2Rl
LCBleHBsYWluaW5nIGhvdy9oeQogIHRoZSBOQU5EIGNvcmUgc2hvdWxkIGJlIGV4dGVuZGVkLgoq
IENyZWF0ZWQgYSByZWFsIGZ1bmN0aW9uIHRoYXQgcmV0dXJucyB0aGUgcGFja2V0IHNpemUgYW5k
IG51bWJlciwgb3IKICBhbiBlcnJvciBpZiB0aGUgZXhhY3QgcmVxdWVzdGVkIGFtb3VudCBjYW5u
b3QgYmUgcmVhY2hlZC4KKiBDcmVhdGVkIGEgbmV3IGhlbHBlciB0byBjaGVjayBpZiBhbiBvcGVy
YXRpb24gaXMgYWN0dWFsbHkgc3VwcG9ydGVkCiAgb3Igbm90LiBVc2VkIHRoZSBhYm92ZSBuZXcg
aGVscGVyIGZvciBjaGVja2luZyB0aGUgdmFsaWRpdHkgb2YgYW4KICAtPmV4ZWNfb3AoKSBvcGVy
YXRpb24gb24gZGVtYW5kLgoqIENvbGxlY3RlZCBSb2IncyBSZXZpZXdlZC1ieSB0YWcuCgpDaGFu
Z2VzIGluIHY0OgoqIENvbGxlY3RlZCBSZXZpZXdlZC1ieSB0YWdzLgoqIERyb3BwZWQgSXZhbiBm
cm9tIHRoZSBsaXN0IChkaWQgbm90IGZpbmQgaGlzIGNvbnRhY3QpLgoqIFdyYXBwZWQgY29tbWl0
IGxvZy4KKiBGaXhlZCB0eXBvcyBpbiB0aGUgY29tbWl0IGxvZ3MvY29tbWVudHMuCiogVG9vayBh
dXRob3JzaGlwIG9mIGFsbCBwYXRjaGVzLgoqIEFkZGVkIG1vcmUgZGV0YWlscyBvbiB0aGUgQkNI
IGNoYW5nZXMuCiogRG9jdW1lbnRlZCB0aGUgbmV3IGJjaF9jb250cm9sIGVudHJ5LgoqIE1hZGUg
dGhlIHN3YXAgYml0IGNhbGxzIGNvbmRpdGlvbmFscyBpbiBiY2hfZW5jb2RlIHRvIGF2b2lkCiAg
cGVuYWxpemluZyBwZW9wbGUgdGhhdCBkbyBub3QgdXNlIGl0LgoqIFBhdGNoZWQgYmNoX2luaXQo
KSB0byB0YWtlIGFuIGV4dHJhIGFyZ3VtZW50LgoqIERyb3BwZWQgY2FsbHMgdG8gbmFuZF9yZWxl
YXNlKCksIHVzZSB0aGUgY29uc3RydWN0aW9uIHByb3Bvc2VkIGJ5CiAgQm9yaXMgaW5zdGVhZC4K
KiBEcm9wcGVkIGEgdXNlbGVzcyBORkMgc3RydWN0IGZpZWxkLgoqIEFkZGVkIGEgY29tbWVudCBv
biBub3QgaGF2aW5nIGFuIGludGVycnVwdCBmb3IgUkIuCiogQ2hlY2tlZCB0aGUgbnVtYmVyIG9m
IHN0ZXBzIHJlcXVlc3RlZCBpcyBjb21wYXRpYmxlIHdpdGggdGhlCiAgY29udHJvbGxlciBsaW1p
dGF0aW9ucy4KKiBSZXdvcmtlZCBhbmZjX2V4ZWNfb3AgYXMgc3VnZ2VzdGVkIHRvIHRyZWF0IHRo
ZSBjaGVja19vbmx5IGFyZ3VtZW50CiAgYW5vdGhlciB3YXkuCiogQ2hhbmdlIHRoZSBjb21tZW50
IHN0YXRpbmcgdGhhdCB0aGUgY29udHJvbGxlciBoYXMgb25seSBvbmUgQ1MuCiogQ2xhcmlmaWVk
IHRoZSBpbnRlcnJ1cHRzIHNpZ25hbHMgdnMuIGludGVycnVwdCBzdGF0dXMgYml0cy4KCkNoYW5n
ZXMgaW4gdjM6CiogUHJlZml4IHNwZWNpZmljIGNsb2NrIGRlZmluaXRpb25zIHdpdGggWExOWCBh
cyB0aGV5IGRvIG5vdCBhcHBseSBmb3IKICBhbnkgb3RoZXIgU29DIGFuZCBhcmUgYXR0YWNoZWQg
dG8gYSBzaW5nbGUgY29tcGF0aWJsZS4KKiBVc2VkIGZpZWxkIGdldHRlcnMvc2V0dGVycyBhcyBk
ZWZpbmVkIGluIGJpdGZpZWxkLmguCiogRm9yY2UgY2FzdGluZyB0byB1MzIgYmVmb3JlIHNoaWZ0
aW5nIHU4IHZhbHVlcyBieSA4IDE2IG9yIDI0IGJpdHMuCiogQ29tcGx5IHdpdGggdGhlIHJlY2Vu
dCBjb3JlIGNoYW5nZXMgYW5kIHNlbGVjdCBtYW51YWxseQogIG5hbmRfbW9ub2xpdGhpY19yZWFk
L3dyaXRlX3BhZ2VfcmF3KCkgaGVscGVycy4KKiBBZGQgTUFJTlRBSU5FUiBwYXRjaC4KKiBBZGQg
YSBiaXQgZXh0cmFjdGlvbiBoZWxwZXIgaW4gdGhlIGNvcmUuCiogUmVuYW1lIEJDSCBmdW5jdGlv
bnMuCiogQWRkIGEgc3dhcHBpbmcgYml0IG1lY2hhbmlzbSB0byBCQ0guCiogU3VwcG9ydCB0aGUg
aGFyZHdhcmUgRUNDIGVuZ2luZS4KCkNoYW5nZXMgaW4gdjI6CiogV29ya2luZyAtPmV4ZWNfb3Ao
KSBpbXBsZW1lbnRhdGlvbiByZWx5aW5nIG9uIGNvcmUgY2hhbmdlcy4KKiBEcm9wcGVkIHRoZSBF
Q0Mgc3VwcG9ydCBmb3Igbm93LCB3aWxsIGJlIHBhcnQgb2YgYW5vdGhlciBzZXJpZXMgaWYKICB0
aGlzIHBhdGNoIGlzIGFjY2VwdGVkLgoKCk1pcXVlbCBSYXluYWwgKDgpOgogIGxpYi9iY2g6IFJl
d29yayBhIGxpdHRsZSBiaXQgdGhlIGV4cG9ydGVkIGZ1bmN0aW9uIG5hbWVzCiAgbGliL2JjaDog
QWxsb3cgZWFzeSBiaXQgc3dhcHBpbmcKICBtdGQ6IHJhd25hbmQ6IEVuc3VyZSB0aGUgbnVtYmVy
IG9mIGJpdGZsaXBzIGlzIGNvbnNpc3RlbnQKICBtdGQ6IHJhd25hbmQ6IEFkZCBuYW5kX2V4dHJh
Y3RfYml0cygpCiAgTUFJTlRBSU5FUlM6IEFkZCBBcmFzYW4gTkFORCBjb250cm9sbGVyIGFuZCBi
aW5kaW5ncwogIGR0LWJpbmRpbmdzOiBtdGQ6IERvY3VtZW50IEFSQVNBTiBOQU5EIGJpbmRpbmdz
CiAgbXRkOiByYXduYW5kOiBhcmFzYW46IEFkZCBuZXcgQXJhc2FuIE5BTkQgY29udHJvbGxlcgog
IG10ZDogcmF3bmFuZDogYXJhc2FuOiBTdXBwb3J0IHRoZSBoYXJkd2FyZSBCQ0ggRUNDIGVuZ2lu
ZQoKIC4uLi9iaW5kaW5ncy9tdGQvYXJhc2FuLG5hbmQtY29udHJvbGxlci55YW1sICB8ICAgNjMg
KwogTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgNyAr
CiBkcml2ZXJzL210ZC9kZXZpY2VzL2RvY2czLmMgICAgICAgICAgICAgICAgICAgfCAgIDEwICst
CiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9LY29uZmlnICAgICAgICAgICAgICAgICAgfCAgICA3ICsK
IGRyaXZlcnMvbXRkL25hbmQvcmF3L01ha2VmaWxlICAgICAgICAgICAgICAgICB8ICAgIDEgKwog
ZHJpdmVycy9tdGQvbmFuZC9yYXcvYXJhc2FuLW5hbmQtY29udHJvbGxlci5jIHwgMTI5NyArKysr
KysrKysrKysrKysrKwogZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMgICAgICAgICAg
ICAgIHwgICA1MiArLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iY2guYyAgICAgICAgICAg
ICAgIHwgICAxMCArLQogaW5jbHVkZS9saW51eC9iY2guaCAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgICAxMSArLQogaW5jbHVkZS9saW51eC9tdGQvcmF3bmFuZC5oICAgICAgICAgICAgICAg
ICAgIHwgICAgNCArCiBsaWIvYmNoLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgMTUyICstCiAxMSBmaWxlcyBjaGFuZ2VkLCAxNTUwIGluc2VydGlvbnMoKyksIDY0IGRl
bGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tdGQvYXJhc2FuLG5hbmQtY29udHJvbGxlci55YW1sCiBjcmVhdGUgbW9kZSAxMDA2
NDQgZHJpdmVycy9tdGQvbmFuZC9yYXcvYXJhc2FuLW5hbmQtY29udHJvbGxlci5jCgotLSAKMi4y
MC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
