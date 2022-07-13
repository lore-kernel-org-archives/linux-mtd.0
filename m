Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F48C43334
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Jul 2022 21:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Rli3MBFAW4aJ7yxkFLL4YAMDX6yIfne49gLMMhH9qKk=; b=1YM2j/Gqt56FEB
	Omd25yrtGEUDtTSCI2Q34lG/iP5hgjfv/5GpGAp/rf34qB6Xmxk8MhxvndcWV7vjVI+XbjUB/4TJV
	9IULNAG1bwIhS4EVPKZRJPcrG7lLXFGX+oy8sQc426v2gL0lw8MpzNDCzKUhQXMPw2GOLwwau9Szs
	AfRB2Trc9HpoulHSvbWb7q/60kO07Nccn6U00i+JeP83RNMGA9BW70/7GFdLVayEt1ZmuMx+qAoRt
	OxqZjGxjcLhEaDMtlp22foDUilE5525GE+oa/Hj9vySxXgdxzKfY2qtq9xR+pGrIsx0V1qC6O9Zvd
	FUqvt+62TvXIsT77q5KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBjeo-007xBE-Of; Wed, 13 Jul 2022 21:12:30 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBjel-007x9e-IP
	for linux-mtd@lists.infradead.org; Wed, 13 Jul 2022 21:12:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1657746747; x=1689282747;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=490C69vkYrYG3grw7z3HU8TvedAfOCosDlNscR4taAY=;
  b=jqPnh9rhV31gCtduSjoWvSOEMmlv0gvVbWHPaD5Jg0Tsenn4iraY88Fg
   h8fDCJfYwbo6BCJ7TrujkTWaG8Zqp2uiaFz2kLs/n1X8q1+09fIW0NtFe
   fiKNUa+ERnutuPOFWC3ldvXVKyyuXCI5S4SNSqiKdXHAAckM1oDVFNW14
   g=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 13 Jul 2022 14:12:26 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2022 14:12:26 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 13 Jul 2022 14:12:26 -0700
Received: from maru.qualcomm.com (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 13 Jul
 2022 14:12:25 -0700
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
	<p.yadav@ti.com>, Michael Walle <michael@walle.cc>
CC: Jamie Iles <quic_jiles@quicinc.com>, Graeme Gregory
	<quic_ggregory@quicinc.com>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?=
	<clg@kaod.org>, Jae Hyun Yoo <quic_jaehyoo@quicinc.com>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] mtd: spi-nor: winbond: add support for W25Q512NW-IQ
Date: Wed, 13 Jul 2022 14:12:10 -0700
Message-ID: <20220713211210.1945044-1-quic_jaehyoo@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_141227_656120_5FD0254D 
X-CRM114-Status: UNSURE (   9.32  )
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
ZXMgaW4gdjI6CiAqIFJlZmluZWQgY29tbWl0IG1lc3NhZ2UgKE1pY2hhZWwpCgpUZXN0IHJlc3Vs
dCBvbiBBU1QyNjAwIFNvQydzIFNQSSBjb250cm9sbGVyOgokIGNhdCAvc3lzL2J1cy9wbGF0Zm9y
bS9kZXZpY2VzLzFlNjIwMDAwLnNwaS9zcGlfbWFzdGVyL3NwaTAvc3BpMC4xL3NwaS1ub3IvamVk
ZWNfaWQKZWY2MDIwCgokIGNhdCAvc3lzL2J1cy9wbGF0Zm9ybS9kZXZpY2VzLzFlNjIwMDAwLnNw
aS9zcGlfbWFzdGVyL3NwaTAvc3BpMC4xL3NwaS1ub3IvbWFudWZhY3R1cmVyCndpbmJvbmQKCiQg
Y2F0IC9zeXMvYnVzL3BsYXRmb3JtL2RldmljZXMvMWU2MjAwMDAuc3BpL3NwaV9tYXN0ZXIvc3Bp
MC9zcGkwLjEvc3BpLW5vci9wYXJ0bmFtZQp3MjVxNTEybndxCgokIGhleGR1bXAgL3N5cy9idXMv
cGxhdGZvcm0vZGV2aWNlcy8xZTYyMDAwMC5zcGkvc3BpX21hc3Rlci9zcGkwL3NwaTAuMS9zcGkt
bm9yL3NmZHAKMDAwMDAwMCA0NjUzIDUwNDQgMDEwNiBmZjAxIDA2MDAgMTAwMSAwMDgwIGZmMDAK
MDAwMDAxMCAwMDg0IDAyMDEgMDBkMCBmZjAwIGZmZmYgZmZmZiBmZmZmIGZmZmYKMDAwMDAyMCBm
ZmZmIGZmZmYgZmZmZiBmZmZmIGZmZmYgZmZmZiBmZmZmIGZmZmYKKgowMDAwMDgwIDIwZTUgZmZm
YiBmZmZmIDFmZmYgZWI0NCA2YjA4IDNiMDggYmI0MgowMDAwMDkwIGZmZmUgZmZmZiBmZmZmIDAw
MDAgZmZmZiBlYjQwIDIwMGMgNTIwZgowMDAwMGEwIGQ4MTAgMDAwMCAwMjMzIDAwYTYgZTc4MSBk
OTE0IDYzZTkgMzM3NgowMDAwMGIwIDc1N2EgNzU3YSBiZGY3IDVjZDUgZjcxOSBmZjVkIDcwZTkg
YTVmOQowMDAwMGMwIGZmZmYgZmZmZiBmZmZmIGZmZmYgZmZmZiBmZmZmIGZmZmYgZmZmZgowMDAw
MGQwIDBhZmYgZmZmMCBmZjIxIGZmZGMKMDAwMDBkOAoKJCBmbGFzaF9vdHBfaW5mbyAtdSAvZGV2
L210ZDAKTnVtYmVyIG9mIE9UUCB1c2VyIGJsb2NrcyBvbiAvZGV2L210ZDA6IDMKYmxvY2sgIDA6
ICBvZmZzZXQgPSAweDAwMDAgIHNpemUgPSAyNTYgYnl0ZXMgIFt1bmxvY2tlZF0KYmxvY2sgIDE6
ICBvZmZzZXQgPSAweDAxMDAgIHNpemUgPSAyNTYgYnl0ZXMgIFt1bmxvY2tlZF0KYmxvY2sgIDI6
ICBvZmZzZXQgPSAweDAyMDAgIHNpemUgPSAyNTYgYnl0ZXMgIFt1bmxvY2tlZF0KCiQgZmxhc2hf
b3RwX2R1bXAgLXUgL2Rldi9tdGQwIDB4MmQwCk9UUCB1c2VyIGRhdGEgZm9yIC9kZXYvbXRkMAow
eDAyZDA6IGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmCjB4
MDJlMDogZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYKMHgw
MmYwOiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZgoKJCBl
Y2hvIC1uIG90cCB0ZXN0IHwgZmxhc2hfb3RwX3dyaXRlIC11IC9kZXYvbXRkMCAweDJkMApXcml0
aW5nIE9UUCB1c2VyIGRhdGEgb24gL2Rldi9tdGQwIGF0IG9mZnNldCAweDJkMApXcm90ZSA4IGJ5
dGVzIG9mIE9UUCB1c2VyIGRhdGEKCiQgZmxhc2hfb3RwX2R1bXAgLXUgL2Rldi9tdGQwIDB4MmQw
Ck9UUCB1c2VyIGRhdGEgZm9yIC9kZXYvbXRkMAoweDAyZDA6IDZmIDc0IDcwIDIwIDc0IDY1IDcz
IDc0IGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmCjB4MDJlMDogZmYgZmYgZmYgZmYgZmYgZmYgZmYg
ZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYKMHgwMmYwOiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBm
ZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZgoKJCBmbGFzaF9vdHBfZXJhc2UgLXUgL2Rldi9tdGQw
IDB4MjAwIDB4MTAwCgokIGZsYXNoX290cF9kdW1wIC11IC9kZXYvbXRkMCAweDJkMApPVFAgdXNl
ciBkYXRhIGZvciAvZGV2L210ZDAKMHgwMmQwOiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBm
ZiBmZiBmZiBmZiBmZiBmZiBmZgoweDAyZTA6IGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZm
IGZmIGZmIGZmIGZmIGZmIGZmCjB4MDJmMDogZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYg
ZmYgZmYgZmYgZmYgZmYgZmYgCgogZHJpdmVycy9tdGQvc3BpLW5vci93aW5ib25kLmMgfCAzICsr
KwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bXRkL3NwaS1ub3Ivd2luYm9uZC5jIGIvZHJpdmVycy9tdGQvc3BpLW5vci93aW5ib25kLmMKaW5k
ZXggZmZhYTI0MDU1MjU5Li5kNmYxYTNiNzI2N2UgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL3Nw
aS1ub3Ivd2luYm9uZC5jCisrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Ivd2luYm9uZC5jCkBAIC0x
MzMsNiArMTMzLDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBmbGFzaF9pbmZvIHdpbmJvbmRfbm9y
X3BhcnRzW10gPSB7CiAJeyAidzI1bTUxMmp2IiwgSU5GTygweGVmNzExOSwgMCwgNjQgKiAxMDI0
LCAxMDI0KQogCQlOT19TRkRQX0ZMQUdTKFNFQ1RfNEsgfCBTUElfTk9SX1FVQURfUkVBRCB8CiAJ
CQkgICAgICBTUElfTk9SX0RVQUxfUkVBRCkgfSwKKwl7ICJ3MjVxNTEybndxIiwgSU5GTygweGVm
NjAyMCwgMCwgNjQgKiAxMDI0LCAxMDI0KQorCQlQQVJTRV9TRkRQCisJCU9UUF9JTkZPKDI1Niwg
MywgMHgxMDAwLCAweDEwMDApIH0sCiAJeyAidzI1cTUxMm53bSIsIElORk8oMHhlZjgwMjAsIDAs
IDY0ICogMTAyNCwgMTAyNCkKIAkJUEFSU0VfU0ZEUAogCQlPVFBfSU5GTygyNTYsIDMsIDB4MTAw
MCwgMHgxMDAwKSB9LAotLSAKMi4yNS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
