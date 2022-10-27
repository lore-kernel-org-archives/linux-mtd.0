Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2CCCECAAA1
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Oct 2022 13:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=A25RSGsnyUmW42L+h26i7PulnaqyDBGEH6KWppeOf88=; b=UoqFSiv9HRCU+V
	s7gwGT/B8dxTZfmGC6oBSdp6AcAkCfee2yNNWhtGUpAo0cWeyaEXeKl0EtqbCHc78iUeyT3YC86co
	oroEnarrjDDpXUZIovNdtNJf0C3byqD+0JZSps6DnnvS15dXMWl2+BqBYWHCMxoAodkzo29UrEncL
	WDQAMlqBDOxlRh4x3gn1ZKla9kzpvgnuvgkWuP5w065yX5BIQaIHpOTVvMUSt+ULmxob+A20dn1HF
	4kTkclUF2Ar5QQDlW8Eibu9fwGAOqCEONRdQ/zX2Y0qlCnYSRuYYSux/6QlEryUNAkmji7bfSasYN
	n7tiUh4ruFRkZefkAgLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo2kC-00DP8r-QD; Thu, 27 Oct 2022 13:16:24 +0000
Received: from laurent.telenet-ops.be ([2a02:1800:110:4::f00:19])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo2ec-00DMlN-Hm
	for linux-mtd@lists.infradead.org; Thu, 27 Oct 2022 13:10:42 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:53a:31ee:412:433f])
	by laurent.telenet-ops.be with bizsmtp
	id d1AW2800a5LQXpN011AW98; Thu, 27 Oct 2022 15:10:32 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1oo2eU-001pe7-6r; Thu, 27 Oct 2022 15:10:30 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1oo2eT-00G6Wv-EE; Thu, 27 Oct 2022 15:10:29 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	noreply@ellerman.id.au
Subject: [PATCH 1/2] mtd: rawnand: lpc32xx_mlc: Switch to using pm_ptr()
Date: Thu, 27 Oct 2022 15:10:27 +0200
Message-Id: <20221027131028.3838303-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_061038_842876_C4FAAF7D 
X-CRM114-Status: GOOD (  13.59  )
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

VGhlIHN3aXRjaCB0byB1c2luZyB0aGUgZ3Bpb2QgQVBJIHJlbW92ZWQgdGhlIGxhc3QgdXNlciBv
ZgpscGMzMnh4X3dwX2Rpc2FibGUoKSBvdXRzaWRlICNpZmRlZiBDT05GSUdfUE0sIGNhdXNpbmcg
YnVpbGQgZmFpbHVyZXMgaWYKQ09ORklHX1BNPW46CgogICAgZHJpdmVycy9tdGQvbmFuZC9yYXcv
bHBjMzJ4eF9tbGMuYzozODA6MTM6IGVycm9yOiDigJhscGMzMnh4X3dwX2Rpc2FibGXigJkgZGVm
aW5lZCBidXQgbm90IHVzZWQgWy1XZXJyb3I9dW51c2VkLWZ1bmN0aW9uXQogICAgICAzODAgfCBz
dGF0aWMgdm9pZCBscGMzMnh4X3dwX2Rpc2FibGUoc3RydWN0IGxwYzMyeHhfbmFuZF9ob3N0ICpo
b3N0KQogICAgICAgICAgfCAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn4KCkZpeCB0aGlz
IGJ5IHN3aXRjaGluZyBmcm9tICNpZmRlZiBDT05GSUdfUE0gdG8gcG1fcHRyKCksIGluY3JlYXNp
bmcKY29tcGlsZS1jb3ZlcmFnZSBhcyBhIHNpZGUtZWZmZWN0LgoKUmVwb3J0ZWQtYnk6IG5vcmVw
bHlAZWxsZXJtYW4uaWQuYXUKRml4ZXM6IDc4MmUzMmE5OTBkOWQ3MDIgKCJtdGQ6IHJhd25hbmQ6
IGxwYzMyeHhfbWxjOiBzd2l0Y2ggdG8gdXNpbmcgZ3Bpb2QgQVBJIikKU2lnbmVkLW9mZi1ieTog
R2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4KLS0tCiBkcml2ZXJzL210
ZC9uYW5kL3Jhdy9scGMzMnh4X21sYy5jIHwgMTAgKystLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9scGMzMnh4X21sYy5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbHBjMzJ4eF9t
bGMuYwppbmRleCAzMDZlMmMyMTY1MDExNzY5Li5hZTdmNjQyOWE1ZjY0MjU0IDEwMDY0NAotLS0g
YS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9scGMzMnh4X21sYy5jCisrKyBiL2RyaXZlcnMvbXRkL25h
bmQvcmF3L2xwYzMyeHhfbWxjLmMKQEAgLTg1MCw3ICs4NTAsNiBAQCBzdGF0aWMgaW50IGxwYzMy
eHhfbmFuZF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlyZXR1cm4gMDsK
IH0KIAotI2lmZGVmIENPTkZJR19QTQogc3RhdGljIGludCBscGMzMnh4X25hbmRfcmVzdW1lKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiAJc3RydWN0IGxwYzMyeHhfbmFuZF9ob3N0
ICpob3N0ID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7CkBAIC04ODIsMTEgKzg4MSw2IEBA
IHN0YXRpYyBpbnQgbHBjMzJ4eF9uYW5kX3N1c3BlbmQoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldiwgcG1fbWVzc2FnZV90IHBtKQogCXJldHVybiAwOwogfQogCi0jZWxzZQotI2RlZmluZSBs
cGMzMnh4X25hbmRfcmVzdW1lIE5VTEwKLSNkZWZpbmUgbHBjMzJ4eF9uYW5kX3N1c3BlbmQgTlVM
TAotI2VuZGlmCi0KIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGxwYzMyeHhfbmFu
ZF9tYXRjaFtdID0gewogCXsgLmNvbXBhdGlibGUgPSAibnhwLGxwYzMyMjAtbWxjIiB9LAogCXsg
Lyogc2VudGluZWwgKi8gfSwKQEAgLTg5Niw4ICs4OTAsOCBAQCBNT0RVTEVfREVWSUNFX1RBQkxF
KG9mLCBscGMzMnh4X25hbmRfbWF0Y2gpOwogc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIg
bHBjMzJ4eF9uYW5kX2RyaXZlciA9IHsKIAkucHJvYmUJCT0gbHBjMzJ4eF9uYW5kX3Byb2JlLAog
CS5yZW1vdmUJCT0gbHBjMzJ4eF9uYW5kX3JlbW92ZSwKLQkucmVzdW1lCQk9IGxwYzMyeHhfbmFu
ZF9yZXN1bWUsCi0JLnN1c3BlbmQJPSBscGMzMnh4X25hbmRfc3VzcGVuZCwKKwkucmVzdW1lCQk9
IHBtX3B0cihscGMzMnh4X25hbmRfcmVzdW1lKSwKKwkuc3VzcGVuZAk9IHBtX3B0cihscGMzMnh4
X25hbmRfc3VzcGVuZCksCiAJLmRyaXZlcgkJPSB7CiAJCS5uYW1lCT0gRFJWX05BTUUsCiAJCS5v
Zl9tYXRjaF90YWJsZSA9IGxwYzMyeHhfbmFuZF9tYXRjaCwKLS0gCjIuMjUuMQoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
