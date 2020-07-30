Return-Path: <SRS0=Dlpg=BJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AF28C433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Jul 2020 12:49:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4465B20829
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Jul 2020 12:49:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F/FpAHb3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4465B20829
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Obht2flJ57aqS3MZGttlRGnWChfNB1bmEvTmCSSSVCQ=; b=F/FpAHb3HPeZo/Wr4bA9/zLRE
	qOeXGU9sVMw0uBtO4NhiwyWGngT0JBygXHYKDBMCqczhehlgA6xgshIkCogigCzZqhMwLRL77g7Bg
	MUKg0VEKPoBKlN8Op1H9C/kFvbdv8hV5P3+sHfgVs2bDWmIXYe9NSXSKIv0X+jO2Mu0kigpXczNKC
	hhjbVXIhJuFPfH88jq30JXU736z2Xey5XdyRa8MGou9lOY6n3SeLalA7XCT8BSxyppgEt/hxw5hBf
	9vU5Hu+tHC1hs9Xqr4PXLT2gRfQTexTjQEDPank3NtcJZNydZXXnzawC1Dr/fEpGEP/bDlsEIxP9r
	52M33t0mA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k17yS-00066d-06; Thu, 30 Jul 2020 12:47:52 +0000
Received: from inva020.nxp.com ([92.121.34.13])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k17yO-00065n-LA
 for linux-mtd@lists.infradead.org; Thu, 30 Jul 2020 12:47:50 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id D94FE1A1327;
 Thu, 30 Jul 2020 14:47:47 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id C19031A0ED6;
 Thu, 30 Jul 2020 14:47:43 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 0F8BF402BF;
 Thu, 30 Jul 2020 14:47:37 +0200 (CEST)
From: Anson Huang <Anson.Huang@nxp.com>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, han.xu@nxp.com, u.kleine-koenig@pengutronix.de,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: mtd: Convert imx nand to json-schema
Date: Thu, 30 Jul 2020 20:43:24 +0800
Message-Id: <1596113004-15548-2-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596113004-15548-1-git-send-email-Anson.Huang@nxp.com>
References: <1596113004-15548-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200730_084748_843696_B871454B 
X-CRM114-Status: GOOD (  15.03  )
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
Cc: Linux-imx@nxp.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Q29udmVydCB0aGUgaS5NWCBuYW5kIGNvbnRyb2xsZXIgYmluZGluZyB0byBEVCBzY2hlbWEgZm9y
bWF0CnVzaW5nIGpzb24tc2NoZW1hLgoKU2lnbmVkLW9mZi1ieTogQW5zb24gSHVhbmcgPEFuc29u
Lkh1YW5nQG54cC5jb20+Ci0tLQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210
ZC9teGMtbmFuZC50eHQgfCAxOSAtLS0tLS0tLS0tCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9t
dGQvbXhjLW5hbmQueWFtbCAgICAgICAgICB8IDQyICsrKysrKysrKysrKysrKysrKysrKysKIDIg
ZmlsZXMgY2hhbmdlZCwgNDIgaW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25zKC0pCiBkZWxldGUg
bW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9teGMtbmFu
ZC50eHQKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbXRkL214Yy1uYW5kLnlhbWwKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbXRkL214Yy1uYW5kLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tdGQvbXhjLW5hbmQudHh0CmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAy
ODU3YzYyLi4wMDAwMDAwCi0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
dGQvbXhjLW5hbmQudHh0CisrKyAvZGV2L251bGwKQEAgLTEsMTkgKzAsMCBAQAotKiBGcmVlc2Nh
bGUncyBteGNfbmFuZAotCi1SZXF1aXJlZCBwcm9wZXJ0aWVzOgotLSBjb21wYXRpYmxlOiAiZnNs
LGlteFhYLW5hbmQiCi0tIHJlZzogYWRkcmVzcyByYW5nZSBvZiB0aGUgbmZjIGJsb2NrCi0tIGlu
dGVycnVwdHM6IGlycSB0byBiZSB1c2VkCi0tIG5hbmQtYnVzLXdpZHRoOiBzZWUgbmFuZC1jb250
cm9sbGVyLnlhbWwKLS0gbmFuZC1lY2MtbW9kZTogc2VlIG5hbmQtY29udHJvbGxlci55YW1sCi0t
IG5hbmQtb24tZmxhc2gtYmJ0OiBzZWUgbmFuZC1jb250cm9sbGVyLnlhbWwKLQotRXhhbXBsZToK
LQotCW5hbmRAZDgwMDAwMDAgewotCQljb21wYXRpYmxlID0gImZzbCxpbXgyNy1uYW5kIjsKLQkJ
cmVnID0gPDB4ZDgwMDAwMDAgMHgxMDAwPjsKLQkJaW50ZXJydXB0cyA9IDwyOT47Ci0JCW5hbmQt
YnVzLXdpZHRoID0gPDg+OwotCQluYW5kLWVjYy1tb2RlID0gImh3IjsKLQl9OwpkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9teGMtbmFuZC55YW1sIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9teGMtbmFuZC55YW1sCm5ldyBm
aWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAuLmVlNGQxZDAKLS0tIC9kZXYvbnVsbAorKysg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL214Yy1uYW5kLnlhbWwKQEAg
LTAsMCArMSw0MiBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBP
UiBCU0QtMi1DbGF1c2UpCislWUFNTCAxLjIKKy0tLQorJGlkOiBodHRwOi8vZGV2aWNldHJlZS5v
cmcvc2NoZW1hcy9tdGQvbXhjLW5hbmQueWFtbCMKKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVl
Lm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIworCit0aXRsZTogIEZyZWVzY2FsZSdzIG14Y19u
YW5kIGJpbmRpbmcKKworbWFpbnRhaW5lcnM6CisgIC0gVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xl
aW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KKworYWxsT2Y6CisgIC0gJHJlZjogIm5hbmQtY29u
dHJvbGxlci55YW1sIgorCitwcm9wZXJ0aWVzOgorICBjb21wYXRpYmxlOgorICAgIGNvbnN0OiBm
c2wsaW14MjctbmFuZAorCisgIHJlZzoKKyAgICBtYXhJdGVtczogMQorCisgIGludGVycnVwdHM6
CisgICAgbWF4SXRlbXM6IDEKKworcmVxdWlyZWQ6CisgIC0gY29tcGF0aWJsZQorICAtIHJlZwor
ICAtIGludGVycnVwdHMKKwordW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQorCitleGFtcGxl
czoKKyAgLSB8CisgICAgbmFuZC1jb250cm9sbGVyQGQ4MDAwMDAwIHsKKyAgICAgICAgI2FkZHJl
c3MtY2VsbHMgPSA8MT47CisgICAgICAgICNzaXplLWNlbGxzID0gPDA+OworICAgICAgICBjb21w
YXRpYmxlID0gImZzbCxpbXgyNy1uYW5kIjsKKyAgICAgICAgcmVnID0gPDB4ZDgwMDAwMDAgMHgx
MDAwPjsKKyAgICAgICAgaW50ZXJydXB0cyA9IDwyOT47CisgICAgICAgIG5hbmQtYnVzLXdpZHRo
ID0gPDg+OworICAgICAgICBuYW5kLWVjYy1tb2RlID0gImh3IjsKKyAgICB9OwotLSAKMi43LjQK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
