Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77462C43334
	for <linux-mtd@archiver.kernel.org>; Sat, 16 Jul 2022 00:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Be+35MBWjqprQoYzVDBZABlWwS3JbKd3vypiI6UBW0w=; b=NrNsHPJzomzx3A
	wNvAs/hWwYmspC5GQilRb27CDlqhSN/+zk4iXxK+Dm9TrgusIKHYiscAWBAJPyemW+NAIVxIXSbUQ
	lN7GAXbWL7Y7rwSilNgmqSMX5yVhpmCyGchkOavTNMr1oLzF+Ux9aGhXuc1yoUgUorXLU9IVwCC24
	NMiPiPYWYE5LMbxz3V5D4wYGgCaZnzUwT2Yp3JhtlldHikkCAJubrd32VE5ls0ag3Q21NI/sbo4g9
	JfQusuhLxijxtQsh4cTS3F+OrZ+hQGGjuKbJ2oGKSHkgDMVRCQfkfR6V+21GQbMRr9GKV+rcLJhhg
	jFgz/3MsNQqRM22TsStA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCVL6-00BNBD-RE; Sat, 16 Jul 2022 00:07:20 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCVL2-00BN88-GG
	for linux-mtd@lists.infradead.org; Sat, 16 Jul 2022 00:07:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1657930037; x=1689466037;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4ijOUw4M3pLQOKeOImMyQ2h2NflWNsyke1V/y3rcq7g=;
  b=EbpoJiz/nBPXbYXWgPP38w0SfYcj7vF7JX9V5Yk/R5qfiMuBZvRcBHdC
   E9CPQ2kl7qfwlDq/HsGbnGQ2U6yXJuJ28mKcu+2Xeb4dkKzCG3S8GrSKD
   xcpVO7t47+Op71gzMN5s6fig9oA15tzyXRd8PP8OVq8H921pnKjsgyYPO
   Q=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 15 Jul 2022 17:07:08 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2022 17:07:08 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 15 Jul 2022 17:07:07 -0700
Received: from maru.qualcomm.com (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 15 Jul
 2022 17:07:06 -0700
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
	<p.yadav@ti.com>, Michael Walle <michael@walle.cc>
CC: Jamie Iles <quic_jiles@quicinc.com>, Graeme Gregory
	<quic_ggregory@quicinc.com>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?=
	<clg@kaod.org>, Jae Hyun Yoo <quic_jaehyoo@quicinc.com>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 2/2] mtd: spi-nor: winbond: add support for W25Q512NW-IQ
Date: Fri, 15 Jul 2022 17:06:43 -0700
Message-ID: <20220716000643.3541839-2-quic_jaehyoo@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220716000643.3541839-1-quic_jaehyoo@quicinc.com>
References: <20220716000643.3541839-1-quic_jaehyoo@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_170716_595277_D4AE3A4D 
X-CRM114-Status: UNSURE (   9.47  )
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

QWRkIHN1cHBvcnQgZm9yIFdpbmJvbmQgVzI1UTUxMk5XLUlRL0lOCgpTaWduZWQtb2ZmLWJ5OiBK
YWUgSHl1biBZb28gPHF1aWNfamFlaHlvb0BxdWljaW5jLmNvbT4KTGluazogaHR0cHM6Ly93d3cu
d2luYm9uZC5jb20vcmVzb3VyY2UtZmlsZXMvVzI1UTUxMk5XJTIwUmV2QiUyMDA3MTkyMDIxLnBk
ZgpSZXZpZXdlZC1ieTogQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4KLS0tCkNoYW5n
ZXMgaW4gdjI6CiAqIENoYW5nZSBzZWN0b3Igc2l6ZSBhbmQgbnVtYmVyIG9mIHNlY3RvciB0byB6
ZXJvIHNvIHRoYXQgaXQgY2FuIHVzZSBwYXJzZWQKICAgaW5mbyBmcm9tIHNmZHAuIChNaWNoYWVs
KQogKiBBZGRlZCBtZDVzdW0gb2Ygc2ZkcCBibG9jay4gKE1pY2hhZWwpCgpDaGFuZ2VzIGluIHYy
OgogKiBSZWZpbmVkIGNvbW1pdCBtZXNzYWdlLiAoTWljaGFlbCkKClRlc3QgcmVzdWx0IG9uIEFT
VDI2MDAgU29DJ3MgU1BJIGNvbnRyb2xsZXI6CiQgY2F0IC9zeXMvYnVzL3BsYXRmb3JtL2Rldmlj
ZXMvMWU2MjAwMDAuc3BpL3NwaV9tYXN0ZXIvc3BpMC9zcGkwLjEvc3BpLW5vci9qZWRlY19pZApl
ZjYwMjAKCiQgY2F0IC9zeXMvYnVzL3BsYXRmb3JtL2RldmljZXMvMWU2MjAwMDAuc3BpL3NwaV9t
YXN0ZXIvc3BpMC9zcGkwLjEvc3BpLW5vci9tYW51ZmFjdHVyZXIKd2luYm9uZAoKJCBjYXQgL3N5
cy9idXMvcGxhdGZvcm0vZGV2aWNlcy8xZTYyMDAwMC5zcGkvc3BpX21hc3Rlci9zcGkwL3NwaTAu
MS9zcGktbm9yL3BhcnRuYW1lCncyNXE1MTJud3EKCiQgaGV4ZHVtcCAvc3lzL2J1cy9wbGF0Zm9y
bS9kZXZpY2VzLzFlNjIwMDAwLnNwaS9zcGlfbWFzdGVyL3NwaTAvc3BpMC4xL3NwaS1ub3Ivc2Zk
cAowMDAwMDAwIDQ2NTMgNTA0NCAwMTA2IGZmMDEgMDYwMCAxMDAxIDAwODAgZmYwMAowMDAwMDEw
IDAwODQgMDIwMSAwMGQwIGZmMDAgZmZmZiBmZmZmIGZmZmYgZmZmZgowMDAwMDIwIDZmMDAgNzA3
NCA3NDIwIDczNjUgZmY3NCBmZmZmIGZmZmYgZmZmZgoqCjAwMDAwNDAgZmZmZiBmZmZmIGZmZmYg
ZmZmZiBmZmZmIGZmZmYgZmZmZiBmZmZmCioKMDAwMDA4MCAyMGU1IGZmZmIgZmZmZiAxZmZmIGVi
NDQgNmIwOCAzYjA4IGJiNDIKMDAwMDA5MCBmZmZlIGZmZmYgZmZmZiAwMDAwIGZmZmYgZWI0MCAy
MDBjIDUyMGYKMDAwMDBhMCBkODEwIDAwMDAgMDIzMyAwMGE2IGU3ODEgZDkxNCA2M2U5IDMzNzYK
MDAwMDBiMCA3NTdhIDc1N2EgYmRmNyA1Y2Q1IGY3MTkgZmY1ZCA3MGU5IGE1ZjkKMDAwMDBjMCBm
ZmZmIGZmZmYgZmZmZiBmZmZmIGZmZmYgZmZmZiBmZmZmIGZmZmYKMDAwMDBkMCAwYWZmIGZmZjAg
ZmYyMSBmZmRjICAgICAgICAgICAgICAgICAgICAKMDAwMDBkOAoKJCBtZDVzdW0gL3N5cy9idXMv
cGxhdGZvcm0vZGV2aWNlcy8xZTYyMDAwMC5zcGkvc3BpX21hc3Rlci9zcGkwL3NwaTAuMS9zcGkt
bm9yL3NmZHAKZTE0ODRmZTdjOTkzYWRhZWU1ZWEwZDYyNDZmNTI4MTcKCiQgZmxhc2hfb3RwX2lu
Zm8gLXUgL2Rldi9tdGQwCk51bWJlciBvZiBPVFAgdXNlciBibG9ja3Mgb24gL2Rldi9tdGQwOiAz
CmJsb2NrICAwOiAgb2Zmc2V0ID0gMHgwMDAwICBzaXplID0gMjU2IGJ5dGVzICBbdW5sb2NrZWRd
CmJsb2NrICAxOiAgb2Zmc2V0ID0gMHgwMTAwICBzaXplID0gMjU2IGJ5dGVzICBbdW5sb2NrZWRd
CmJsb2NrICAyOiAgb2Zmc2V0ID0gMHgwMjAwICBzaXplID0gMjU2IGJ5dGVzICBbdW5sb2NrZWRd
CgokIGZsYXNoX290cF9kdW1wIC11IC9kZXYvbXRkMCAweDJkMApPVFAgdXNlciBkYXRhIGZvciAv
ZGV2L210ZDAKMHgwMmQwOiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBm
ZiBmZiBmZgoweDAyZTA6IGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZm
IGZmIGZmCjB4MDJmMDogZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYg
ZmYgZmYKCiQgZWNobyAtbiBvdHAgdGVzdCB8IGZsYXNoX290cF93cml0ZSAtdSAvZGV2L210ZDAg
MHgyZDAKV3JpdGluZyBPVFAgdXNlciBkYXRhIG9uIC9kZXYvbXRkMCBhdCBvZmZzZXQgMHgyZDAK
V3JvdGUgOCBieXRlcyBvZiBPVFAgdXNlciBkYXRhCgokIGZsYXNoX290cF9kdW1wIC11IC9kZXYv
bXRkMCAweDJkMApPVFAgdXNlciBkYXRhIGZvciAvZGV2L210ZDAKMHgwMmQwOiA2ZiA3NCA3MCAy
MCA3NCA2NSA3MyA3NCBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZgoweDAyZTA6IGZmIGZmIGZmIGZm
IGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmCjB4MDJmMDogZmYgZmYgZmYgZmYg
ZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYKCiQgZmxhc2hfb3RwX2VyYXNlIC11
IC9kZXYvbXRkMCAweDIwMCAweDEwMAoKJCBmbGFzaF9vdHBfZHVtcCAtdSAvZGV2L210ZDAgMHgy
ZDAKT1RQIHVzZXIgZGF0YSBmb3IgL2Rldi9tdGQwCjB4MDJkMDogZmYgZmYgZmYgZmYgZmYgZmYg
ZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYKMHgwMmUwOiBmZiBmZiBmZiBmZiBmZiBmZiBm
ZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZgoweDAyZjA6IGZmIGZmIGZmIGZmIGZmIGZmIGZm
IGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIAoKIGRyaXZlcnMvbXRkL3NwaS1ub3Ivd2luYm9u
ZC5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL210ZC9zcGktbm9yL3dpbmJvbmQuYyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Ivd2lu
Ym9uZC5jCmluZGV4IGZmYWEyNDA1NTI1OS4uY2EzOWFjZjQxMTJjIDEwMDY0NAotLS0gYS9kcml2
ZXJzL210ZC9zcGktbm9yL3dpbmJvbmQuYworKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL3dpbmJv
bmQuYwpAQCAtMTMzLDYgKzEzMyw5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmxhc2hfaW5mbyB3
aW5ib25kX25vcl9wYXJ0c1tdID0gewogCXsgIncyNW01MTJqdiIsIElORk8oMHhlZjcxMTksIDAs
IDY0ICogMTAyNCwgMTAyNCkKIAkJTk9fU0ZEUF9GTEFHUyhTRUNUXzRLIHwgU1BJX05PUl9RVUFE
X1JFQUQgfAogCQkJICAgICAgU1BJX05PUl9EVUFMX1JFQUQpIH0sCisJeyAidzI1cTUxMm53cSIs
IElORk8oMHhlZjYwMjAsIDAsIDAsIDApCisJCVBBUlNFX1NGRFAKKwkJT1RQX0lORk8oMjU2LCAz
LCAweDEwMDAsIDB4MTAwMCkgfSwKIAl7ICJ3MjVxNTEybndtIiwgSU5GTygweGVmODAyMCwgMCwg
NjQgKiAxMDI0LCAxMDI0KQogCQlQQVJTRV9TRkRQCiAJCU9UUF9JTkZPKDI1NiwgMywgMHgxMDAw
LCAweDEwMDApIH0sCi0tIAoyLjI1LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
