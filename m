Return-Path: <SRS0=Kxx5=TH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F9B2C004C9
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2019 09:20:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CD4F214C6
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2019 09:20:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jTb5oJrs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CD4F214C6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HjbQkHqcukPJ30l9ZDn1Qk4JlMnjcX7owxV62rBJZcI=; b=jTb5oJrs93iyG1
	XZ8siURC6b8Sln0HtOszDsYISDwrwfx9FKxpPqCTSyNWS7qJbHXCJ+BJz7EnpnNtluAr+Qf6RMotu
	cot7NK3Our7WNNn7VO6qwRdoaOqMQPyNOCAYL+YuCNw33gWw6aQgMDMKvZuL1NMqGp+HHvf3Rui7v
	+Sfu9XA0nnXbwPlPRqwO3uio5K7EeEQPXFuk9H/4k7yQWkD+sPygWoaWcDT9E8ZjxHTFMpd72y2Ox
	S8n3IQlLs9AK5zWgpzBoMn/aA2yZ3p9V3BPDczvOtCmUlmSJuKNGlmoPrwhqteIjV8vZ4fRIziIRE
	ad42VJ/yB2hIonAsGbhQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hNwHF-00067n-CM; Tue, 07 May 2019 09:20:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNwH5-0005wu-5f; Tue, 07 May 2019 09:20:36 +0000
X-UUID: bcc7756ac965477c98e9b19f78d63283-20190507
X-UUID: bcc7756ac965477c98e9b19f78d63283-20190507
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <xiaolei.li@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1571277906; Tue, 07 May 2019 01:20:25 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 7 May 2019 02:20:24 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 7 May 2019 17:20:23 +0800
Received: from mtkslt306.mediatek.inc (10.21.14.136) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Tue, 7 May 2019 17:20:23 +0800
From: Xiaolei Li <xiaolei.li@mediatek.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>
Subject: [RFC PATCH v4 1/1] mtd: rawnand: mtk: Re-license MTK NAND driver as
 Dual MIT/GPL
Date: Tue, 7 May 2019 17:20:20 +0800
Message-ID: <20190507092020.1917-2-xiaolei.li@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190507092020.1917-1-xiaolei.li@mediatek.com>
References: <20190507092020.1917-1-xiaolei.li@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190507_022035_237242_7CF4F18D 
X-CRM114-Status: GOOD (  11.11  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: daniel.thompson@linaro.org, ryder.lee@mediatek.com, arnd@arndb.de,
 srv_heupstream@mediatek.com, yamada.masahiro@socionext.com,
 yellowriver2010@hotmail.com, gustavo@embeddedor.com,
 jorge.ramirez-ortiz@linaro.org, matthias.bgg@gmail.com,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 weiyongjun1@huawei.com, yingjoe.chen@mediatek.com, rafal@milecki.pl,
 linux-mediatek@lists.infradead.org, xiaolei.li@mediatek.com,
 rogercc.lin@mediatek.com, dan.carpenter@oracle.com, peterpandong@micron.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SXQgaXMgd2FudGVkIHRvIHVzZSBNVEsgTkFORCBkcml2ZXIgd2l0aCBHUEwtMi4wIG9yIE1JVCBs
aWNlbnNlLgpCdXQgbm93IGl0IGlzIG9ubHkgbGljZW5zZWQgYXMgR1BMLTIuMC4KU28gcmUtbGlj
ZW5zZSBpdCBhcyBkdWFsIE1JVC9HUEwgYW5kIHJlcGxhY2UgbGljZW5zZSB0ZXh0IHdpdGgKU1BE
WCB0YWcuCgpTaWduZWQtb2ZmLWJ5OiBYaWFvbGVpIExpIDx4aWFvbGVpLmxpQG1lZGlhdGVrLmNv
bT4KQWNrZWQtYnk6IEpvcmdlIFJhbWlyZXotT3J0aXogPGpvcmdlLnJhbWlyZXotb3J0aXpAbGlu
YXJvLm9yZz4KQWNrZWQtYnk6IFJ5ZGVyIExlZSA8cnlkZXIubGVlQG1lZGlhdGVrLmNvbT4KQWNr
ZWQtYnk6IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KQWNrZWQtYnk6IE1pcXVl
bCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+CkFja2VkLWJ5OiBCb3JpcyBCcmV6
aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPgpBY2tlZC1ieTogUm9nZXJDQyBM
aW4gPHJvZ2VyY2MubGluQG1lZGlhdGVrLmNvbT4KLS0tCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9t
dGtfZWNjLmMgIHwgMTIgKystLS0tLS0tLS0tCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9tdGtfZWNj
LmggIHwgIDQgKy0tLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvbXRrX25hbmQuYyB8IDEyICsrLS0t
LS0tLS0tLQogMyBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIzIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L210a19lY2MuYyBiL2RyaXZlcnMv
bXRkL25hbmQvcmF3L210a19lY2MuYwppbmRleCA2NDMyYmQ3MGMzYjMuLmVlYTBmOTAzYmMyNCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbXRrX2VjYy5jCisrKyBiL2RyaXZlcnMv
bXRkL25hbmQvcmF3L210a19lY2MuYwpAQCAtMSwxNyArMSw5IEBACisvLyBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogR1BMLTIuMCBPUiBNSVQKIC8qCiAgKiBNVEsgRUNDIGNvbnRyb2xsZXIgZHJp
dmVyLgogICogQ29weXJpZ2h0IChDKSAyMDE2ICBNZWRpYVRlayBJbmMuCiAgKiBBdXRob3JzOglY
aWFvbGVpIExpCQk8eGlhb2xlaS5saUBtZWRpYXRlay5jb20+CiAgKgkJSm9yZ2UgUmFtaXJlei1P
cnRpegk8am9yZ2UucmFtaXJlei1vcnRpekBsaW5hcm8ub3JnPgotICoKLSAqIFRoaXMgcHJvZ3Jh
bSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5
Ci0gKiBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNl
IHZlcnNpb24gMiBhcwotICogcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRp
b24uCi0gKgotICogVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQg
aXQgd2lsbCBiZSB1c2VmdWwsCi0gKiBidXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhvdXQg
ZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBvZgotICogTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5F
U1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRoZQotICogR05VIEdlbmVyYWwgUHVi
bGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KICAqLwogCiAjaW5jbHVkZSA8bGludXgvcGxh
dGZvcm1fZGV2aWNlLmg+CkBAIC02MDAsNCArNTkyLDQgQEAgbW9kdWxlX3BsYXRmb3JtX2RyaXZl
cihtdGtfZWNjX2RyaXZlcik7CiAKIE1PRFVMRV9BVVRIT1IoIlhpYW9sZWkgTGkgPHhpYW9sZWku
bGlAbWVkaWF0ZWsuY29tPiIpOwogTU9EVUxFX0RFU0NSSVBUSU9OKCJNVEsgTmFuZCBFQ0MgRHJp
dmVyIik7Ci1NT0RVTEVfTElDRU5TRSgiR1BMIik7CitNT0RVTEVfTElDRU5TRSgiRHVhbCBNSVQv
R1BMIik7CmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tdGtfZWNjLmggYi9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9tdGtfZWNjLmgKaW5kZXggYTQ1NWRmMDgwOTUyLi4wZTQ4YzM2ZTZj
YTAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L210a19lY2MuaAorKysgYi9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9tdGtfZWNjLmgKQEAgLTEsMTIgKzEsMTAgQEAKKy8qIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wIE9SIE1JVCAqLwogLyoKICAqIE1USyBTREcxIEVDQyBj
b250cm9sbGVyCiAgKgogICogQ29weXJpZ2h0IChjKSAyMDE2IE1lZGlhdGVrCiAgKiBBdXRob3Jz
OglYaWFvbGVpIExpCQk8eGlhb2xlaS5saUBtZWRpYXRlay5jb20+CiAgKgkJSm9yZ2UgUmFtaXJl
ei1PcnRpegk8am9yZ2UucmFtaXJlei1vcnRpekBsaW5hcm8ub3JnPgotICogVGhpcyBwcm9ncmFt
IGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkg
aXQKLSAqIHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2Ug
dmVyc2lvbiAyIGFzIHB1Ymxpc2hlZAotICogYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlv
bi4KICAqLwogCiAjaWZuZGVmIF9fRFJJVkVSU19NVERfTkFORF9NVEtfRUNDX0hfXwpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbXRrX25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQv
cmF3L210a19uYW5kLmMKaW5kZXggYjZiNDYwMmY1MTMyLi4zY2JjMjU3OTMwNjIgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L210a19uYW5kLmMKKysrIGIvZHJpdmVycy9tdGQvbmFu
ZC9yYXcvbXRrX25hbmQuYwpAQCAtMSwxNyArMSw5IEBACisvLyBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogR1BMLTIuMCBPUiBNSVQKIC8qCiAgKiBNVEsgTkFORCBGbGFzaCBjb250cm9sbGVyIGRy
aXZlci4KICAqIENvcHlyaWdodCAoQykgMjAxNiBNZWRpYVRlayBJbmMuCiAgKiBBdXRob3JzOglY
aWFvbGVpIExpCQk8eGlhb2xlaS5saUBtZWRpYXRlay5jb20+CiAgKgkJSm9yZ2UgUmFtaXJlei1P
cnRpegk8am9yZ2UucmFtaXJlei1vcnRpekBsaW5hcm8ub3JnPgotICoKLSAqIFRoaXMgcHJvZ3Jh
bSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5
Ci0gKiBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNl
IHZlcnNpb24gMiBhcwotICogcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRp
b24uCi0gKgotICogVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQg
aXQgd2lsbCBiZSB1c2VmdWwsCi0gKiBidXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhvdXQg
ZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBvZgotICogTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5F
U1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRoZQotICogR05VIEdlbmVyYWwgUHVi
bGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KICAqLwogCiAjaW5jbHVkZSA8bGludXgvcGxh
dGZvcm1fZGV2aWNlLmg+CkBAIC0xNTk4LDYgKzE1OTAsNiBAQCBzdGF0aWMgc3RydWN0IHBsYXRm
b3JtX2RyaXZlciBtdGtfbmZjX2RyaXZlciA9IHsKIAogbW9kdWxlX3BsYXRmb3JtX2RyaXZlciht
dGtfbmZjX2RyaXZlcik7CiAKLU1PRFVMRV9MSUNFTlNFKCJHUEwiKTsKK01PRFVMRV9MSUNFTlNF
KCJEdWFsIE1JVC9HUEwiKTsKIE1PRFVMRV9BVVRIT1IoIlhpYW9sZWkgTGkgPHhpYW9sZWkubGlA
bWVkaWF0ZWsuY29tPiIpOwogTU9EVUxFX0RFU0NSSVBUSU9OKCJNVEsgTmFuZCBGbGFzaCBDb250
cm9sbGVyIERyaXZlciIpOwotLSAKMi4xOC4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
