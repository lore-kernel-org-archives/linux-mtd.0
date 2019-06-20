Return-Path: <SRS0=7m8F=UT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 222F2C48BDF
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jun 2019 01:58:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C38512147A
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jun 2019 01:58:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f8Od6qY/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C38512147A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lXmtbsY+e6s5UdK9VM2XpWk/F4q5r57AKaRDAZsFGaw=; b=f8Od6qY/U9MnMT
	nb7m08sE2MTeLQk9Z0BmRmvQqC+Tpuu4lEKd6p0GrPGoDE5wwys4jmVsp4N2OnS3N3mQSbwnChXah
	AqF0xz0Kcwx1OkOlK38NTYovtaIMyqFH1gBovliX3KAUf3tyxHhLv8InJJspidBUOWIjZYEstwBVX
	nQXv9Fb/JJUXMWYve9PlYRJvLRnFIiGgNicTwdlIH2g+MGOHa/7OgrnNuuZl4asijaHc5KL5+eqtw
	ZCIXdUKx5tJPmsFncvLcamou8nJtQchRDDLk2I8qAGWW0QP4didNiRZukxFEdF7nQ64i2JtiOnf38
	OgilwEa4J2+MOTDy39fQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hdmLT-0001vJ-Qk; Thu, 20 Jun 2019 01:58:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdmLO-0001up-IN; Thu, 20 Jun 2019 01:58:33 +0000
X-UUID: a2ff23723c5c4885aa5a623c9cf99047-20190619
X-UUID: a2ff23723c5c4885aa5a623c9cf99047-20190619
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <xiaolei.li@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 241140098; Wed, 19 Jun 2019 17:58:18 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 19 Jun 2019 18:58:17 -0700
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 20 Jun 2019 09:58:15 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 20 Jun 2019 09:58:14 +0800
From: <xiaolei.li@mediatek.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>
Subject: [PATCH] mtd: rawnand: mtk: Re-license MTK NAND driver as Dual MIT/GPL
Date: Thu, 20 Jun 2019 09:58:12 +0800
Message-ID: <20190620015812.16519-1-xiaolei.li@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190619_185830_619418_32029A25 
X-CRM114-Status: GOOD (  10.71  )
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
Cc: ryder.lee@mediatek.com, arnd@arndb.de, srv_heupstream@mediatek.com,
 yellowriver2010@hotmail.com, yamada.masahiro@socionext.com,
 boris.brezillon@collabora.com, linux-mediatek@lists.infradead.org,
 jorge.ramirez-ortiz@linaro.org, rafal@milecki.pl,
 linux-mtd@lists.infradead.org, xiaolei.li@mediatek.com,
 dan.carpenter@oracle.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

RnJvbTogWGlhb2xlaSBMaSA8eGlhb2xlaS5saUBtZWRpYXRlay5jb20+CgpJdCBpcyB3YW50ZWQg
dG8gdXNlIE1USyBOQU5EIGRyaXZlciB3aXRoIEdQTC0yLjAgb3IgTUlUIGxpY2Vuc2UuCkJ1dCBu
b3cgaXQgaXMgb25seSBsaWNlbnNlZCBhcyBHUEwtMi4wLgpTbyByZS1saWNlbnNlIGl0IGFzIGR1
YWwgTUlUL0dQTCBhbmQgcmVwbGFjZSBsaWNlbnNlIHRleHQgd2l0aApTUERYIHRhZy4KClNpZ25l
ZC1vZmYtYnk6IFhpYW9sZWkgTGkgPHhpYW9sZWkubGlAbWVkaWF0ZWsuY29tPgpBY2tlZC1ieTog
Sm9yZ2UgUmFtaXJlei1PcnRpeiA8am9yZ2UucmFtaXJlei1vcnRpekBsaW5hcm8ub3JnPgpBY2tl
ZC1ieTogUnlkZXIgTGVlIDxyeWRlci5sZWVAbWVkaWF0ZWsuY29tPgpBY2tlZC1ieTogUmFmYcWC
IE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgpBY2tlZC1ieTogTWlxdWVsIFJheW5hbCA8bWlx
dWVsLnJheW5hbEBib290bGluLmNvbT4KQWNrZWQtYnk6IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMu
YnJlemlsbG9uQGNvbGxhYm9yYS5jb20+CkFja2VkLWJ5OiBXZW4gWWFuZyA8eWVsbG93cml2ZXIy
MDEwQGhvdG1haWwuY29tPgpBY2tlZC1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBv
cmFjbGUuY29tPgpBY2tlZC1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KQWNrZWQt
Ynk6IE1hc2FoaXJvIFlhbWFkYSA8eWFtYWRhLm1hc2FoaXJvQHNvY2lvbmV4dC5jb20+Ci0tLQog
ZHJpdmVycy9tdGQvbmFuZC9yYXcvbXRrX2VjYy5jICB8IDEyICsrLS0tLS0tLS0tLQogZHJpdmVy
cy9tdGQvbmFuZC9yYXcvbXRrX2VjYy5oICB8ICA0ICstLS0KIGRyaXZlcnMvbXRkL25hbmQvcmF3
L210a19uYW5kLmMgfCAxMiArKy0tLS0tLS0tLS0KIDMgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRp
b25zKCspLCAyMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9tdGtfZWNjLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tdGtfZWNjLmMKaW5kZXggMDViMGMx
OWQ3MmQ5Li43NDU5NWI2NDRiN2MgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L210
a19lY2MuYworKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tdGtfZWNjLmMKQEAgLTEsMTcgKzEs
OSBAQAorLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgT1IgTUlUCiAvKgogICog
TVRLIEVDQyBjb250cm9sbGVyIGRyaXZlci4KICAqIENvcHlyaWdodCAoQykgMjAxNiAgTWVkaWFU
ZWsgSW5jLgogICogQXV0aG9yczoJWGlhb2xlaSBMaQkJPHhpYW9sZWkubGlAbWVkaWF0ZWsuY29t
PgogICoJCUpvcmdlIFJhbWlyZXotT3J0aXoJPGpvcmdlLnJhbWlyZXotb3J0aXpAbGluYXJvLm9y
Zz4KLSAqCi0gKiBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3Ry
aWJ1dGUgaXQgYW5kL29yIG1vZGlmeQotICogaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUg
R2VuZXJhbCBQdWJsaWMgTGljZW5zZSB2ZXJzaW9uIDIgYXMKLSAqIHB1Ymxpc2hlZCBieSB0aGUg
RnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLgotICoKLSAqIFRoaXMgcHJvZ3JhbSBpcyBkaXN0cmli
dXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLAotICogYnV0IFdJVEhPVVQg
QU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YKLSAqIE1F
UkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFNlZSB0
aGUKLSAqIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuCiAgKi8K
IAogI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgpAQCAtNjA0LDQgKzU5Niw0IEBA
IG1vZHVsZV9wbGF0Zm9ybV9kcml2ZXIobXRrX2VjY19kcml2ZXIpOwogCiBNT0RVTEVfQVVUSE9S
KCJYaWFvbGVpIExpIDx4aWFvbGVpLmxpQG1lZGlhdGVrLmNvbT4iKTsKIE1PRFVMRV9ERVNDUklQ
VElPTigiTVRLIE5hbmQgRUNDIERyaXZlciIpOwotTU9EVUxFX0xJQ0VOU0UoIkdQTCIpOworTU9E
VUxFX0xJQ0VOU0UoIkR1YWwgTUlUL0dQTCIpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFu
ZC9yYXcvbXRrX2VjYy5oIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbXRrX2VjYy5oCmluZGV4IGE0
NTVkZjA4MDk1Mi4uMGU0OGMzNmU2Y2EwIDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9tdGtfZWNjLmgKKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbXRrX2VjYy5oCkBAIC0xLDEy
ICsxLDEwIEBACisvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCBPUiBNSVQgKi8K
IC8qCiAgKiBNVEsgU0RHMSBFQ0MgY29udHJvbGxlcgogICoKICAqIENvcHlyaWdodCAoYykgMjAx
NiBNZWRpYXRlawogICogQXV0aG9yczoJWGlhb2xlaSBMaQkJPHhpYW9sZWkubGlAbWVkaWF0ZWsu
Y29tPgogICoJCUpvcmdlIFJhbWlyZXotT3J0aXoJPGpvcmdlLnJhbWlyZXotb3J0aXpAbGluYXJv
Lm9yZz4KLSAqIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJp
YnV0ZSBpdCBhbmQvb3IgbW9kaWZ5IGl0Ci0gKiB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBH
ZW5lcmFsIFB1YmxpYyBMaWNlbnNlIHZlcnNpb24gMiBhcyBwdWJsaXNoZWQKLSAqIGJ5IHRoZSBG
cmVlIFNvZnR3YXJlIEZvdW5kYXRpb24uCiAgKi8KIAogI2lmbmRlZiBfX0RSSVZFUlNfTVREX05B
TkRfTVRLX0VDQ19IX18KZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L210a19uYW5k
LmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tdGtfbmFuZC5jCmluZGV4IDYxN2Y5NjU2YTA0NS4u
MzczZDQ3ZDFiYTRjIDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tdGtfbmFuZC5j
CisrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L210a19uYW5kLmMKQEAgLTEsMTcgKzEsOSBAQAor
Ly8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgT1IgTUlUCiAvKgogICogTVRLIE5B
TkQgRmxhc2ggY29udHJvbGxlciBkcml2ZXIuCiAgKiBDb3B5cmlnaHQgKEMpIDIwMTYgTWVkaWFU
ZWsgSW5jLgogICogQXV0aG9yczoJWGlhb2xlaSBMaQkJPHhpYW9sZWkubGlAbWVkaWF0ZWsuY29t
PgogICoJCUpvcmdlIFJhbWlyZXotT3J0aXoJPGpvcmdlLnJhbWlyZXotb3J0aXpAbGluYXJvLm9y
Zz4KLSAqCi0gKiBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3Ry
aWJ1dGUgaXQgYW5kL29yIG1vZGlmeQotICogaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUg
R2VuZXJhbCBQdWJsaWMgTGljZW5zZSB2ZXJzaW9uIDIgYXMKLSAqIHB1Ymxpc2hlZCBieSB0aGUg
RnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLgotICoKLSAqIFRoaXMgcHJvZ3JhbSBpcyBkaXN0cmli
dXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLAotICogYnV0IFdJVEhPVVQg
QU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YKLSAqIE1F
UkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFNlZSB0
aGUKLSAqIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuCiAgKi8K
IAogI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgpAQCAtMTY1Myw2ICsxNjQ1LDYg
QEAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgbXRrX25mY19kcml2ZXIgPSB7CiAKIG1v
ZHVsZV9wbGF0Zm9ybV9kcml2ZXIobXRrX25mY19kcml2ZXIpOwogCi1NT0RVTEVfTElDRU5TRSgi
R1BMIik7CitNT0RVTEVfTElDRU5TRSgiRHVhbCBNSVQvR1BMIik7CiBNT0RVTEVfQVVUSE9SKCJY
aWFvbGVpIExpIDx4aWFvbGVpLmxpQG1lZGlhdGVrLmNvbT4iKTsKIE1PRFVMRV9ERVNDUklQVElP
TigiTVRLIE5hbmQgRmxhc2ggQ29udHJvbGxlciBEcml2ZXIiKTsKLS0gCjIuMTguMAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
