Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D52EC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Jul 2022 16:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R4/qht1AtRVke3dLQiV4yz8ADoirCqiYHd5+6PhmHoo=; b=iBhLTQo980kbla
	6Gqj8iTWG5ToBfEQiWh22K0XSKopcjAluWZqm8MDgEBXx81l2738Pspq7RT1vAaxZ9fqViBFA42fq
	WzYE3XnCG8dM5YiWJ8e39dYysZixTxNsLm6T5t5B6dtiZiVKtHenNNhgf8tSkXtOK0mfvsje4QaXS
	RoQ93wKqoxqNX5iISqgh10BEvg9oRvapVbtCsdSEBC+E2cyLRn57r08sMZ4rXMfbpl31dSGt2VlGi
	6PWWPwCkxl3YSLtHAuXyiv54hvUJiih4lRhKRPcBeEQ/NOQQ105H8hi8M6WGaEyubjNx4jA1LFFGd
	uF4EXKYCZpLIPHnrKsig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEvpu-0083Zz-Qc; Fri, 22 Jul 2022 16:49:10 +0000
Received: from out28-173.mail.aliyun.com ([115.124.28.173])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEvpo-0083Su-H9
	for linux-mtd@lists.infradead.org; Fri, 22 Jul 2022 16:49:07 +0000
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.3241718|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0235158-0.00320354-0.973281;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047212;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=23;RT=23;SR=0;TI=SMTPD_---.Ob0cnML_1658508529;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.Ob0cnML_1658508529)
          by smtp.aliyun-inc.com;
          Sat, 23 Jul 2022 00:48:50 +0800
From: =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= <zhouyanjie@wanyeetech.com>
To: tudor.ambarus@microchip.com,
	p.yadav@ti.com,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org
Cc: linux-mtd@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	aidanmacdonald.0x0@gmail.com,
	tmn505@gmail.com,
	paul@crapouillou.net,
	dongsheng.qiu@ingenic.com,
	aric.pzqi@ingenic.com,
	rick.tyliu@ingenic.com,
	jinghui.liu@ingenic.com,
	sernia.zhou@foxmail.com,
	reimu@sudomaker.com
Subject: [PATCH 2/3] dt-bindings: SPI: Add Ingenic SFC bindings.
Date: Sat, 23 Jul 2022 00:48:29 +0800
Message-Id: <1658508510-15400-3-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1658508510-15400-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1658508510-15400-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_094904_782226_AAEBD62D 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
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

QWRkIHRoZSBTRkMgYmluZGluZ3MgZm9yIHRoZSBYMTAwMCBTb0MsIHRoZSBYMTYwMCBTb0MsIHRo
ZSBYMTgzMCBTb0MsCmFuZCB0aGUgWDIwMDAgU29DIGZyb20gSW5nZW5pYy4KClNpZ25lZC1vZmYt
Ynk6IOWRqOeQsOadsCAoWmhvdSBZYW5qaWUpIDx6aG91eWFuamllQHdhbnllZXRlY2guY29tPgot
LS0KIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwaS9pbmdlbmljLHNmYy55YW1sICAgICAgIHwg
NjQgKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDY0IGluc2VydGlvbnMo
KykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
c3BpL2luZ2VuaWMsc2ZjLnlhbWwKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3Mvc3BpL2luZ2VuaWMsc2ZjLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3Mvc3BpL2luZ2VuaWMsc2ZjLnlhbWwKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5k
ZXggMDAwMDAwMDAuLmI3YzRjZjQKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3Mvc3BpL2luZ2VuaWMsc2ZjLnlhbWwKQEAgLTAsMCArMSw2NCBAQAor
IyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2Up
CislWUFNTCAxLjIKKy0tLQorJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9zcGkv
aW5nZW5pYyxzZmMueWFtbCMKKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNj
aGVtYXMvY29yZS55YW1sIworCit0aXRsZTogQmluZGluZ3MgZm9yIFNGQyBpbiBJbmdlbmljIFNv
Q3MKKworbWFpbnRhaW5lcnM6CisgIC0g5ZGo55Cw5p2wIChaaG91IFlhbmppZSkgPHpob3V5YW5q
aWVAd2FueWVldGVjaC5jb20+CisKK2Rlc2NyaXB0aW9uOgorICBUaGUgU1BJIEZsYXNoIENvbnRy
b2xsZXIgaW4gSW5nZW5pYyBTb0NzLgorCitwcm9wZXJ0aWVzOgorICBjb21wYXRpYmxlOgorICAg
IG9uZU9mOgorICAgICAgLSBlbnVtOgorICAgICAgICAgIC0gaW5nZW5pYyx4MTAwMC1zZmMKKyAg
ICAgICAgICAtIGluZ2VuaWMseDE2MDAtc2ZjCisgICAgICAgICAgLSBpbmdlbmljLHgyMDAwLXNm
YworICAgICAgLSBpdGVtczoKKyAgICAgICAgICAtIGVudW06CisgICAgICAgICAgICAgIC0gaW5n
ZW5pYyx4MTgzMC1zZmMKKyAgICAgICAgICAtIGNvbnN0OiBpbmdlbmljLHgxMDAwLXNmYworCisg
IHJlZzoKKyAgICBtYXhJdGVtczogMQorCisgIGludGVycnVwdHM6CisgICAgbWF4SXRlbXM6IDEK
KworICBjbG9ja3M6CisgICAgbWF4SXRlbXM6IDEKKworICBjbG9jay1uYW1lczoKKyAgICBjb25z
dDogc2ZjCisKK3JlcXVpcmVkOgorICAtIGNvbXBhdGlibGUKKyAgLSByZWcKKyAgLSBpbnRlcnJ1
cHRzCisgIC0gY2xvY2tzCisgIC0gY2xvY2stbmFtZXMKKworYWRkaXRpb25hbFByb3BlcnRpZXM6
IGZhbHNlCisKK2V4YW1wbGVzOgorICAtIHwKKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xv
Y2svaW5nZW5pYyx4MTAwMC1jZ3UuaD4KKworCXNmYzogc3BpQDEzNDQwMDAwIHsKKwkJY29tcGF0
aWJsZSA9ICJpbmdlbmljLHgxMDAwLXNmYyI7CisJCXJlZyA9IDwweDEzNDQwMDAwIDB4MTAwMD47
CisKKwkJaW50ZXJydXB0LXBhcmVudCA9IDwmaW50Yz47CisJCWludGVycnVwdHMgPSA8Nz47CisK
KwkJY2xvY2tzID0gPCZjZ3UgWDEwMDBfQ0xLX1NGQz47CisJCWNsb2NrLW5hbWVzID0gInNmYyI7
CisKKwkJc3RhdHVzID0gImRpc2FibGVkIjsKKwl9OworLi4uCi0tIAoyLjcuNAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
