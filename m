Return-Path: <SRS0=yEN0=UX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 975A5C43613
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jun 2019 01:39:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62D0722CEB
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jun 2019 01:39:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BpHvdb9n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62D0722CEB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pWEpvVppj5PNU86yetrbewtudLjFraieMLkFnvSe6mc=; b=BpHvdb9n9Ib/+P
	ycR1Es0y/nLej806WO7Z8xrcjJNd5xLmi2CrlNvNjYGEtNunC0IKPHnVBlNrW6EMnnisdCRmJeNwB
	qahMDDDDtmyjd4KnljfpmlMDaUKnUIW+OrRcXPu5tuqLnWZovm7/U9QbQnddR4jN3j3GWgwVNM1M0
	qvVjWX3swZZ/3cIXj1Ct49u2XtQOtcxGn3FD2NoMtN/BE90T71njmmwpvgzWvcgOMulcHGdJ3t3yM
	HQmqLgyLQdZaLd1XfkGPnvYCuVCntPFfOctAMnwMAYqxiZY858OSND5efahDhOVenOwgyLpeHc22E
	mfo11+TFbyCw58f+GDbw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hfDwp-0001Cg-Ao; Mon, 24 Jun 2019 01:39:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfDwm-0001CH-4g; Mon, 24 Jun 2019 01:39:05 +0000
X-UUID: 9458c8c3087b490ea29e9375cab40c6a-20190623
X-UUID: 9458c8c3087b490ea29e9375cab40c6a-20190623
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <xiaolei.li@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1664621968; Sun, 23 Jun 2019 17:39:02 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 23 Jun 2019 18:39:00 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 24 Jun 2019 09:38:59 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 24 Jun 2019 09:38:58 +0800
From: <xiaolei.li@mediatek.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>
Subject: [PATCH v2] mtd: rawnand: mtk: Re-license MTK NAND driver as Dual
 MIT/GPL
Date: Mon, 24 Jun 2019 09:38:56 +0800
Message-ID: <20190624013856.20732-1-xiaolei.li@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190623_183904_189965_C4E81B7A 
X-CRM114-Status: GOOD (  10.50  )
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
 rogercc.lin@mediatek.com, dan.carpenter@oracle.com, matthias.bgg@gmail.com
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
Ynk6IE1hc2FoaXJvIFlhbWFkYSA8eWFtYWRhLm1hc2FoaXJvQHNvY2lvbmV4dC5jb20+CkFja2Vk
LWJ5OiBSb2dlckNDIExpbiA8cm9nZXJjYy5saW5AbWVkaWF0ZWsuY29tPgpSZXZpZXdlZC1ieTog
TWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL210
ZC9uYW5kL3Jhdy9tdGtfZWNjLmMgIHwgMTIgKystLS0tLS0tLS0tCiBkcml2ZXJzL210ZC9uYW5k
L3Jhdy9tdGtfZWNjLmggIHwgIDQgKy0tLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvbXRrX25hbmQu
YyB8IDEyICsrLS0tLS0tLS0tLQogMyBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIz
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L210a19lY2Mu
YyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L210a19lY2MuYwppbmRleCAwNWIwYzE5ZDcyZDkuLjc0
NTk1YjY0NGI3YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbXRrX2VjYy5jCisr
KyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L210a19lY2MuYwpAQCAtMSwxNyArMSw5IEBACisvLyBT
UERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCBPUiBNSVQKIC8qCiAgKiBNVEsgRUNDIGNv
bnRyb2xsZXIgZHJpdmVyLgogICogQ29weXJpZ2h0IChDKSAyMDE2ICBNZWRpYVRlayBJbmMuCiAg
KiBBdXRob3JzOglYaWFvbGVpIExpCQk8eGlhb2xlaS5saUBtZWRpYXRlay5jb20+CiAgKgkJSm9y
Z2UgUmFtaXJlei1PcnRpegk8am9yZ2UucmFtaXJlei1vcnRpekBsaW5hcm8ub3JnPgotICoKLSAq
IFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBh
bmQvb3IgbW9kaWZ5Ci0gKiBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1
YmxpYyBMaWNlbnNlIHZlcnNpb24gMiBhcwotICogcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3
YXJlIEZvdW5kYXRpb24uCi0gKgotICogVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRo
ZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsCi0gKiBidXQgV0lUSE9VVCBBTlkgV0FSUkFO
VFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBvZgotICogTUVSQ0hBTlRBQklM
SVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRoZQotICogR05V
IEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KICAqLwogCiAjaW5jbHVk
ZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+CkBAIC02MDQsNCArNTk2LDQgQEAgbW9kdWxlX3Bs
YXRmb3JtX2RyaXZlcihtdGtfZWNjX2RyaXZlcik7CiAKIE1PRFVMRV9BVVRIT1IoIlhpYW9sZWkg
TGkgPHhpYW9sZWkubGlAbWVkaWF0ZWsuY29tPiIpOwogTU9EVUxFX0RFU0NSSVBUSU9OKCJNVEsg
TmFuZCBFQ0MgRHJpdmVyIik7Ci1NT0RVTEVfTElDRU5TRSgiR1BMIik7CitNT0RVTEVfTElDRU5T
RSgiRHVhbCBNSVQvR1BMIik7CmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tdGtf
ZWNjLmggYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tdGtfZWNjLmgKaW5kZXggYTQ1NWRmMDgwOTUy
Li4wZTQ4YzM2ZTZjYTAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L210a19lY2Mu
aAorKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tdGtfZWNjLmgKQEAgLTEsMTIgKzEsMTAgQEAK
Ky8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wIE9SIE1JVCAqLwogLyoKICAqIE1U
SyBTREcxIEVDQyBjb250cm9sbGVyCiAgKgogICogQ29weXJpZ2h0IChjKSAyMDE2IE1lZGlhdGVr
CiAgKiBBdXRob3JzOglYaWFvbGVpIExpCQk8eGlhb2xlaS5saUBtZWRpYXRlay5jb20+CiAgKgkJ
Sm9yZ2UgUmFtaXJlei1PcnRpegk8am9yZ2UucmFtaXJlei1vcnRpekBsaW5hcm8ub3JnPgotICog
VGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFu
ZC9vciBtb2RpZnkgaXQKLSAqIHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVi
bGljIExpY2Vuc2UgdmVyc2lvbiAyIGFzIHB1Ymxpc2hlZAotICogYnkgdGhlIEZyZWUgU29mdHdh
cmUgRm91bmRhdGlvbi4KICAqLwogCiAjaWZuZGVmIF9fRFJJVkVSU19NVERfTkFORF9NVEtfRUND
X0hfXwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbXRrX25hbmQuYyBiL2RyaXZl
cnMvbXRkL25hbmQvcmF3L210a19uYW5kLmMKaW5kZXggNjE3Zjk2NTZhMDQ1Li4zNzNkNDdkMWJh
NGMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L210a19uYW5kLmMKKysrIGIvZHJp
dmVycy9tdGQvbmFuZC9yYXcvbXRrX25hbmQuYwpAQCAtMSwxNyArMSw5IEBACisvLyBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCBPUiBNSVQKIC8qCiAgKiBNVEsgTkFORCBGbGFzaCBj
b250cm9sbGVyIGRyaXZlci4KICAqIENvcHlyaWdodCAoQykgMjAxNiBNZWRpYVRlayBJbmMuCiAg
KiBBdXRob3JzOglYaWFvbGVpIExpCQk8eGlhb2xlaS5saUBtZWRpYXRlay5jb20+CiAgKgkJSm9y
Z2UgUmFtaXJlei1PcnRpegk8am9yZ2UucmFtaXJlei1vcnRpekBsaW5hcm8ub3JnPgotICoKLSAq
IFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBh
bmQvb3IgbW9kaWZ5Ci0gKiBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1
YmxpYyBMaWNlbnNlIHZlcnNpb24gMiBhcwotICogcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3
YXJlIEZvdW5kYXRpb24uCi0gKgotICogVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRo
ZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsCi0gKiBidXQgV0lUSE9VVCBBTlkgV0FSUkFO
VFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBvZgotICogTUVSQ0hBTlRBQklM
SVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRoZQotICogR05V
IEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KICAqLwogCiAjaW5jbHVk
ZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+CkBAIC0xNjUzLDYgKzE2NDUsNiBAQCBzdGF0aWMg
c3RydWN0IHBsYXRmb3JtX2RyaXZlciBtdGtfbmZjX2RyaXZlciA9IHsKIAogbW9kdWxlX3BsYXRm
b3JtX2RyaXZlcihtdGtfbmZjX2RyaXZlcik7CiAKLU1PRFVMRV9MSUNFTlNFKCJHUEwiKTsKK01P
RFVMRV9MSUNFTlNFKCJEdWFsIE1JVC9HUEwiKTsKIE1PRFVMRV9BVVRIT1IoIlhpYW9sZWkgTGkg
PHhpYW9sZWkubGlAbWVkaWF0ZWsuY29tPiIpOwogTU9EVUxFX0RFU0NSSVBUSU9OKCJNVEsgTmFu
ZCBGbGFzaCBDb250cm9sbGVyIERyaXZlciIpOwotLSAKMi4xOC4wCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
