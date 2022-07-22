Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2FF3C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Jul 2022 16:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KHxefem9t2qcR5hlTPDKatZQWrtrVIvCeBJAvvSLMdM=; b=qXPyxfJVikeYYz
	mIq9nXHJdh+1hOqHHccPviOURdIkK7Zp2K14XuAuGOSFIlS63SltbG5WhPAuS3bzRsvJodh3AJN15
	aspYSiabaWyz/Lhhd7uVRnFox6ZfIQ32TMd0nwaVNL/P/Sjg2PnKh0NtlYhuhLAVZ/iIrWzs8ltt3
	mgciL0Z8EMjAoRALvqsSNeR4bNaBr5zDVOsx+jMtoGqozdxyVG5jKxf8LbN5pTGP/gMGAvb4Le56d
	tHxDwT5EIuOHw7yIuZF1TpFp3/hjn6xYT3HG5u1yOQjwzvfS7AvCiH8hMAbE81OeY9QGIvSTFgquu
	QYXknb5B1Nz1cUlVQCsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEvpw-0083aS-KE; Fri, 22 Jul 2022 16:49:12 +0000
Received: from out28-195.mail.aliyun.com ([115.124.28.195])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEvpo-0083Q6-Ha
	for linux-mtd@lists.infradead.org; Fri, 22 Jul 2022 16:49:08 +0000
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.2783662|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00548407-0.00159274-0.992923;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047201;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=23;RT=23;SR=0;TI=SMTPD_---.Ob0cn8C_1658508518;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.Ob0cn8C_1658508518)
          by smtp.aliyun-inc.com;
          Sat, 23 Jul 2022 00:48:47 +0800
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
Subject: [PATCH 0/3] Add SFC support for Ingenic SoCs.
Date: Sat, 23 Jul 2022 00:48:27 +0800
Message-Id: <1658508510-15400-1-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_094904_824072_ABBFDD28 
X-CRM114-Status: UNSURE (   6.85  )
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

MS5Vc2UgdGhlIHNwaS1tZW0gcG9sbCBzdGF0dXMgQVBJcyBpbiBTUEktTk9SIHRvIHJlZHVjZSBD
UFUgbG9hZC4KMi5BZGQgU0ZDIHN1cHBvcnQgZm9yIHRoZSBYMTAwMCBTb0MsIHRoZSBYMTYwMCBT
b0MsIGFuZCB0aGUgWDIwMDAgU29DIGZyb20gSW5nZW5pYy4KCkxpdSBKaW5naHVpIGFuZCBBaWRh
biBNYWNEb25hbGQgcHJvdmlkZWQgYSBsb3Qgb2YgYXNzaXN0YW5jZSBkdXJpbmcgdGhlIGRldmVs
b3BtZW50IG9mIHRoaXMgZHJpdmVyLgoK5ZGo55Cw5p2wIChaaG91IFlhbmppZSkgKDMpOgogIG10
ZDogc3BpLW5vcjogVXNlIHRoZSBzcGktbWVtIHBvbGwgc3RhdHVzIEFQSXMuCiAgZHQtYmluZGlu
Z3M6IFNQSTogQWRkIEluZ2VuaWMgU0ZDIGJpbmRpbmdzLgogIFNQSTogSW5nZW5pYzogQWRkIFNG
QyBzdXBwb3J0IGZvciBJbmdlbmljIFNvQ3MuCgogLi4uL2RldmljZXRyZWUvYmluZGluZ3Mvc3Bp
L2luZ2VuaWMsc2ZjLnlhbWwgICAgICAgfCAgNjQgKysKIGRyaXZlcnMvbXRkL3NwaS1ub3IvY29y
ZS5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDQyICstCiBkcml2ZXJzL3NwaS9LY29uZmln
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgOSArCiBkcml2ZXJzL3NwaS9NYWtl
ZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCiBkcml2ZXJzL3NwaS9z
cGktaW5nZW5pYy1zZmMuYyAgICAgICAgICAgICAgICAgICAgICB8IDY2MiArKysrKysrKysrKysr
KysrKysrKysKIDUgZmlsZXMgY2hhbmdlZCwgNzY4IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9u
cygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9zcGkvaW5nZW5pYyxzZmMueWFtbAogY3JlYXRlIG1vZGUgMTAwNzU1IGRyaXZlcnMvc3BpL3Nw
aS1pbmdlbmljLXNmYy5jCgotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
