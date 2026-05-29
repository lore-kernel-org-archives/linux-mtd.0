Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CBF8CD6E4A
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2026 16:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lH0wgeDFnkqSicWMRfD+WPC57aqg0+oUyTfLTNP3DUk=; b=2Ywlg5bJNU2wGi
	7BnXTNds3V5oE51uArb2nLxBNNmo2I/HpAfTayiHzb1ptBlM7e3Jo1aZjk7Q6uEVfZ756Azns/BHb
	NKarJJXBq4CRhetLofG3kton/KWLqBoyRHUapbEcGMvkfsh3NOxwfE4WknlKSh50Xy9IM4aYWqnkD
	meqWbfawjtzruxyV4zG0T+sOpPRB4yj7TtILhSvPn5u80u7PTQZ6oQH2RjCSPgUHCKtaCjxL4CYOu
	ZB4FQ2Vs2aGyzI3DBCqieu1XgqAPPy0N8Xz3MiY4KEkLtdDGapj7IdX5w1Ut4tqGxqVt/zZ+M8RW4
	aNCClPrtWu1bNkLF5bIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT06I-00000007t2R-0gee;
	Fri, 29 May 2026 16:30:22 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT06F-00000007t0U-18xv
	for linux-mtd@lists.infradead.org;
	Fri, 29 May 2026 16:30:20 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AD6824E42D92;
	Fri, 29 May 2026 16:30:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8164A601FA;
	Fri, 29 May 2026 16:30:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0C8E310888CC2;
	Fri, 29 May 2026 18:30:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780072215; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zSvVa76bozjvegooFQ2sxhnthAp8wr8yKMUnprg+yS4=;
	b=zBCvihGO/skiDR78t15MyXF8fsqGVJRcfPAsP1jEu2uMVXKyO5ecBAHxeUIhVudCkmF8xz
	CHX65v4Pj8VT0a4PwvPkz7ziINFmwPKBNm97tSKNLXqrRsHqCxoG6sukVfap7W1rVKGGCI
	p9pmRHlY3GNVsJs3/pt5DBywcC0uPQUkM1jK6jEyAAlPMbUen0tsda6vnrXmMqO+qxp8My
	8tmiX878uqfFJVmJBYj+UhN9HTyN6nFsgdP3Jpv5pr0cJ+mDPzO8LGpPNGTe3ZZiIdj892
	OhymwJDz6l1shxYfbFjbvpujLdLk7SyElTI9GFu4A+fxPQru3qEvwkrKMutEuw==
From: "Miquel Raynal (DAVE)" <miquel.raynal@bootlin.com>
Date: Fri, 29 May 2026 18:29:56 +0200
Subject: [PATCH 1/3] mtd: rawnand: pl353: Update timings at the right
 moment
MIME-Version: 1.0
Message-Id: <20260529-dave-upstream-nand-fixes-v1-1-8c72aa23aee2@bootlin.com>
References: <20260529-dave-upstream-nand-fixes-v1-0-8c72aa23aee2@bootlin.com>
In-Reply-To: <20260529-dave-upstream-nand-fixes-v1-0-8c72aa23aee2@bootlin.com>
To: Michal Simek <michal.simek@amd.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Andrea Scian <andrea.scian@dave.eu>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Olivier Sobrie <olivier@sobrie.be>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_093019_442987_C12C8CF9 
X-CRM114-Status: GOOD (  13.87  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SWYgc2V2ZXJhbCBDRSBhcmUgd2lyZWQsIHdlIHdvdWxkIHdyaXRlIHRoZSByZWdpc3RlcnMgZm9y
IGV2ZXJ5IGNoaXAgb25lCmFmdGVyIHRoZSBvdGhlciwgYW5kIHJlc2VsZWN0IHRoZSBjb3JyZWN0
IHRpbWluZ3MgZm9yIHRoZSBmaXJzdCBjaGlwIHRoZQp1c2Ugd2FudHMgdG8gdXNlIGFmdGVyIHBy
b2JlLiBUaGlzIGlzIG5vdCBleGFjdGx5IGVmZmljaWVudCBhbmQgY291bGQKc2xpZ2h0bHkgYmUg
aW1wcm92ZWQgc2luY2Ugd2UgYWxyZWFkeSBoYXZlIGEgaGVscGVyIHRoYXQgYXBwbGllcyB0aGUK
Y29uZmlndXJhdGlvbiBpZiB0aGVyZSBpcyBhIGNoaXAgY2hhbmdlLiBJbnN0ZWFkIG9mIHByb2dy
YW1taW5nIHRoZQpyZWdpc3RlcnMgaW4gLT5zZXR1cF9pbnRlcmZhY2UoKSwgbGV0J3MganVzdCBk
cm9wIHRoZSBwb2ludGVyIHRvIHRoZQpjaGlwIGFuZCBsZXQgdGhlIG5hbmRfc2VsZWN0X3Rhcmdl
dCgpIGhlbHBlciBkbyBpdHMgbWFnaWMuCgpDYzogT2xpdmllciBTb2JyaWUgPG9saXZpZXJAc29i
cmllLmJlPgpTaWduZWQtb2ZmLWJ5OiBNaXF1ZWwgUmF5bmFsIChEQVZFKSA8bWlxdWVsLnJheW5h
bEBib290bGluLmNvbT4KLS0tCk9saXZpZXIsCgpUaGlzIGlzIGFuIGVuaGFuY2VtZW50IHRvIHlv
dXIgcHJldmlvdXMgcGF0Y2ggd2hpY2ggYWxyZWFkeQp3b3Jrcy4gQ2FuIHlvdSBwbGVhc2UgdGVs
bCBtZSBpZiB0aGF0IGNoYW5nZSBpcyBva2F5IGZvciB5b3U/CgpUaGFua3MsCk1pcXXDqGwKLS0t
CiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9wbDM1eC1uYW5kLWNvbnRyb2xsZXIuYyB8IDcgKysrKyst
LQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9wbDM1eC1uYW5kLWNvbnRyb2xsZXIuYyBiL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L3BsMzV4LW5hbmQtY29udHJvbGxlci5jCmluZGV4IGYyYzY1ZWI3
YThkOS4uOTg2MDE5YjQyMTUzIDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9wbDM1
eC1uYW5kLWNvbnRyb2xsZXIuYworKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9wbDM1eC1uYW5k
LWNvbnRyb2xsZXIuYwpAQCAtODYyLDggKzg2MiwxMSBAQCBzdGF0aWMgaW50IHBsMzV4X25mY19z
ZXR1cF9pbnRlcmZhY2Uoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgaW50IGNzLAogCQkJICBQTDM1
WF9TTUNfTkFORF9UQVJfQ1lDTEVTKHRtZ3MudF9hcikgfAogCQkJICBQTDM1WF9TTUNfTkFORF9U
UlJfQ1lDTEVTKHRtZ3MudF9ycik7CiAKLQl3cml0ZWwocGxuYW5kLT50aW1pbmdzLCBuZmMtPmNv
bmZfcmVncyArIFBMMzVYX1NNQ19DWUNMRVMpOwotCXBsMzV4X3NtY191cGRhdGVfcmVncyhuZmMp
OworCS8qCisJICogUmVzZXQgbmZjLT5zZWxlY3RlZF9jaGlwIHNvIHRoZSBuZXh0IGNvbW1hbmQg
d2lsbCBjYXVzZSB0aGUgdGltaW5nCisJICogcmVnaXN0ZXJzIHRvIGJlIHVwZGF0ZWQgaW4gLT4q
X3NlbGVjdF90YXJnZXQoKS4KKwkgKi8KKwluZmMtPnNlbGVjdGVkX2NoaXAgPSBOVUxMOwogCiAJ
cmV0dXJuIDA7CiB9CgotLSAKMi41My4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
