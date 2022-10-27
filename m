Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC29AFA3740
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Oct 2022 13:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UUpT8BSBEw5EkqUpwWyfk76MePWF7aIu2JqDbWNj6ms=; b=2ADAnqlKjHtdeV
	M2g0lEP+6OsOfk1ArR3qamudjQvhG/kktXawVy8uziBNVYZ1Kb28qBvGR1I97nc7mwLBUMKTA1xiB
	/hsSYVvAuNWoCMdv7UfJdXTMCmowY1u9qEbKuOeab/nCxHvQbFwacqnyvxke+1WaPV9xhq140vn8m
	f1lfWXe78IQ4uNhCB+G6N0uOLj4gtbbrxTYsc8yUtVbibKZjeLbCkbwRSNBK1WZ6IJdkWGbZTKyIR
	fIYqErpRvfFmb5RASdHbjwlLieq3YWCn2RmR5AYDbcAy9h4pMbP4OITEsvv5SfNRKaTDjk6JzX46B
	JX4ZnuBSLLu1ILQGGqrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo2kJ-00DPCf-Av; Thu, 27 Oct 2022 13:16:31 +0000
Received: from michel.telenet-ops.be ([2a02:1800:110:4::f00:18])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo2ec-00DMlQ-Ho
	for linux-mtd@lists.infradead.org; Thu, 27 Oct 2022 13:10:42 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:53a:31ee:412:433f])
	by michel.telenet-ops.be with bizsmtp
	id d1AW2800P5LQXpN061AWZg; Thu, 27 Oct 2022 15:10:32 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1oo2eT-001pe8-V4; Thu, 27 Oct 2022 15:10:29 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1oo2eT-00G6Wz-FL; Thu, 27 Oct 2022 15:10:29 +0200
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
Subject: [PATCH 2/2] mtd: rawnand: lpc32xx_slc: Switch to using pm_ptr()
Date: Thu, 27 Oct 2022 15:10:28 +0200
Message-Id: <20221027131028.3838303-2-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221027131028.3838303-1-geert@linux-m68k.org>
References: <20221027131028.3838303-1-geert@linux-m68k.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_061038_850601_2223E811 
X-CRM114-Status: GOOD (  13.99  )
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
bHBjMzJ4eF9zbGMuYzozMTg6MTM6IGVycm9yOiDigJhscGMzMnh4X3dwX2Rpc2FibGXigJkgZGVm
aW5lZCBidXQgbm90IHVzZWQgWy1XZXJyb3I9dW51c2VkLWZ1bmN0aW9uXQogICAgICAzMTggfCBz
dGF0aWMgdm9pZCBscGMzMnh4X3dwX2Rpc2FibGUoc3RydWN0IGxwYzMyeHhfbmFuZF9ob3N0ICpo
b3N0KQogICAgICAgICAgfCAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn4KCkZpeCB0aGlz
IGJ5IHN3aXRjaGluZyBmcm9tICNpZmRlZiBDT05GSUdfUE0gdG8gcG1fcHRyKCksIGluY3JlYXNp
bmcKY29tcGlsZS1jb3ZlcmFnZSBhcyBhIHNpZGUtZWZmZWN0LgoKUmVwb3J0ZWQtYnk6IG5vcmVw
bHlAZWxsZXJtYW4uaWQuYXUKRml4ZXM6IDZiOTIzZGIyODY3Y2I1ZTEgKCJtdGQ6IHJhd25hbmQ6
IGxwYzMyeHhfc2xjOiBzd2l0Y2ggdG8gdXNpbmcgZ3Bpb2QgQVBJIikKU2lnbmVkLW9mZi1ieTog
R2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4KLS0tCiBkcml2ZXJzL210
ZC9uYW5kL3Jhdy9scGMzMnh4X3NsYy5jIHwgMTAgKystLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9scGMzMnh4X3NsYy5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbHBjMzJ4eF9z
bGMuYwppbmRleCA0NzAyNTc3Zjc0ZTVkYWU0Li42OTE4NzM3MzQ2Yzk1YzhhIDEwMDY0NAotLS0g
YS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9scGMzMnh4X3NsYy5jCisrKyBiL2RyaXZlcnMvbXRkL25h
bmQvcmF3L2xwYzMyeHhfc2xjLmMKQEAgLTk2OSw3ICs5NjksNiBAQCBzdGF0aWMgaW50IGxwYzMy
eHhfbmFuZF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlyZXR1cm4gMDsK
IH0KIAotI2lmZGVmIENPTkZJR19QTQogc3RhdGljIGludCBscGMzMnh4X25hbmRfcmVzdW1lKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiAJc3RydWN0IGxwYzMyeHhfbmFuZF9ob3N0
ICpob3N0ID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7CkBAIC0xMDA4LDExICsxMDA3LDYg
QEAgc3RhdGljIGludCBscGMzMnh4X25hbmRfc3VzcGVuZChzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2LCBwbV9tZXNzYWdlX3QgcG0pCiAJcmV0dXJuIDA7CiB9CiAKLSNlbHNlCi0jZGVmaW5l
IGxwYzMyeHhfbmFuZF9yZXN1bWUgTlVMTAotI2RlZmluZSBscGMzMnh4X25hbmRfc3VzcGVuZCBO
VUxMCi0jZW5kaWYKLQogc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbHBjMzJ4eF9u
YW5kX21hdGNoW10gPSB7CiAJeyAuY29tcGF0aWJsZSA9ICJueHAsbHBjMzIyMC1zbGMiIH0sCiAJ
eyAvKiBzZW50aW5lbCAqLyB9LApAQCAtMTAyMiw4ICsxMDE2LDggQEAgTU9EVUxFX0RFVklDRV9U
QUJMRShvZiwgbHBjMzJ4eF9uYW5kX21hdGNoKTsKIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJp
dmVyIGxwYzMyeHhfbmFuZF9kcml2ZXIgPSB7CiAJLnByb2JlCQk9IGxwYzMyeHhfbmFuZF9wcm9i
ZSwKIAkucmVtb3ZlCQk9IGxwYzMyeHhfbmFuZF9yZW1vdmUsCi0JLnJlc3VtZQkJPSBscGMzMnh4
X25hbmRfcmVzdW1lLAotCS5zdXNwZW5kCT0gbHBjMzJ4eF9uYW5kX3N1c3BlbmQsCisJLnJlc3Vt
ZQkJPSBwbV9wdHIobHBjMzJ4eF9uYW5kX3Jlc3VtZSksCisJLnN1c3BlbmQJPSBwbV9wdHIobHBj
MzJ4eF9uYW5kX3N1c3BlbmQpLAogCS5kcml2ZXIJCT0gewogCQkubmFtZQk9IExQQzMyWFhfTU9E
TkFNRSwKIAkJLm9mX21hdGNoX3RhYmxlID0gbHBjMzJ4eF9uYW5kX21hdGNoLAotLSAKMi4yNS4x
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
