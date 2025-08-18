Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C92ECA0ED1
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Aug 2025 13:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ui5foULit/pXQvYDwE/PBzrrNQKC2qtOQenn0gFX0KY=; b=w/m385IMO7dg91
	D4DJ8vbiG/4y/x1jwVeIOczlfmV1w2MEZUZKyGCPILueywhuj078TC5lda2vIXjpBY2uJY1KlMPSN
	iMJmqrXsDiVPkKv8USFD2sV8QTwNvbPO2DdxRlLed82fGccpHd5mXImfdZ+yhTXdKwue2H4E59r++
	mS8n730jGy345SJQVqxAyldId7ENBrhKVdUqYz/aWLlOQ/sXXc8ESKcuqXbTgUticHKOQKFSI2sei
	MUZwRyN6qF+zZMaBD+sQQkhmG1NyCfJApXW6uwA0uwJsMPpzFp8tLXxgw/HfkXCeqDeYfmLppRrjX
	3EYAPZbWuNQTS4tbuC3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo0IT-00000007fiz-13NH;
	Mon, 18 Aug 2025 13:53:13 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo0IR-00000007fiE-0b4t
	for linux-mtd@lists.infradead.org;
	Mon, 18 Aug 2025 13:53:12 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-b474a38b25cso645359a12.0
        for <linux-mtd@lists.infradead.org>; Mon, 18 Aug 2025 06:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755525190; x=1756129990; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JIC+sfaRRNCZ/PpzLr3hvBF4vD7BYR+5HNnrMt71ufA=;
        b=QO7kB9LiUq5jSZ4mFdD3HUi6RXe83c0FZajDgkGHYYipnbLuK8Mp4qRX6JPY8ufbT3
         UhZ9FgCp1rQPGFIIoHzBOdSVXIeHkgDzSR/B/OTi6nPIUVHpuZw3K8J4a5HhzvJALxJz
         XiK+n0PhRgscXcKS2LfSNJne66FGfPgRP2V1/LkT59U1UxYaDp2PAgC2HO13I+JyE+oM
         uCCVGvR4uvy/LxaGO5voyZjkHv5hc45XW00EOnRyLmIDcLzSiukcmA+4XpcaRYWJEWiw
         V8XWIPCxBObqZBGHWXhEdcJ1qspUFOoCvKxGzQUrvuXg44AM9ZBYpkFby7HJk0jWP9au
         pX1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755525190; x=1756129990;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JIC+sfaRRNCZ/PpzLr3hvBF4vD7BYR+5HNnrMt71ufA=;
        b=uoCQQS52ndhEqFsa6jpr90W/u6FRjRO80A0MqZTUMPB8jwg2GOY1HU6aXRbVAfkE2u
         +tAJF03SovcNuqmKQc/SJ5/qbTmEREit9y9ytwyypzqqg7HvOnGvOxlCEYhd0VCCM7Xj
         nL3f6qL0r7GiAHs2akZexxe/EGEpcH5bf3jDLPcBGbSH3Mvn+ESZ4qOhAmDPEkHUBG1B
         RwA9oDgLc0Pp2hSADe5vtthxjPD0MNpcaUEf0I+g+QpyBByILQ2VnvV5y01iOiJi5sV3
         1gt8v008cZaTbJxJ/bKf8oi/JMt/D2/TbFReN0GUnoaTCL5jgKaFvP6JFACTNc0O0zls
         +j9Q==
X-Gm-Message-State: AOJu0YydKuKyXplvIu2Q+zzwCqmSCiDAztNhsPMRN/MZd9fluZQCIWi3
	F/ibAVu+gqBlFSyVqNhnvGhb/8FCeqIIOi474Td4fOfLgoYg1QdB6Ykh
X-Gm-Gg: ASbGnctOLwUgs+BNbjmidV4zqJDZdf6lTIvHFrp9sS/vOSyu4J8L5nGRgp8lqOByx5x
	WzNW8TGhWVbEJTYUi84TcspqXDMBgPGSAFa0h/pxfOxYI06y4+CTcpZZKKlSf0wCpAYTubK51tO
	c/bg5FPQwNNa13KgB1RDcvZBAcVzYrrDEmD63L/XcD2NREh/2tQqV3lKuh2xWayFEpdMY3ceN8c
	qBgP1zb7t2m8tyiyjnQXLqXWsDAKdbUO0pqRFJzIrKpwx1Cm55m583vMYcpA6PAOQdBO4C47W7m
	y9uWxQ/FlQ4SRbsJqqiMgOWGThU3WajdoGi/coKwQzowVYS2liwcG7JCbOnXqlJTZMfd/PXlzxT
	2pkVqXK059Q+8hEhnY7JlNKeh5sWprilBfKO5k8l8EOg=
X-Google-Smtp-Source: AGHT+IGlRJIJIBd9MAB6Pmkf/xGaP961Qd1aFVSWvH/Du8+QIpyF1GcpdFSu0rClgL/I4HixbjWGbg==
X-Received: by 2002:a17:903:2f0e:b0:244:99aa:54a1 with SMTP id d9443c01a7336-24499aa5b7bmr12035205ad.7.1755525190074;
        Mon, 18 Aug 2025 06:53:10 -0700 (PDT)
Received: from Fantast-WT.localdomain ([120.229.37.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446cb075b2sm82013075ad.59.2025.08.18.06.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 06:53:09 -0700 (PDT)
From: Teng Wu <gigadevice2025@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	teng.wu@gigadevice.com,
	Teng Wu <gigadevice2025@gmail.com>
Subject: [PATCH] mtd: spinand: gigadevice: Add continuous read support
Date: Mon, 18 Aug 2025 21:52:27 +0800
Message-ID: <20250818135227.2114-1-gigadevice2025@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_065311_177481_4CF08E50 
X-CRM114-Status: GOOD (  15.59  )
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

R0Q1RjFHTTkgc3VwcG9ydHMgYSBoaWdoLXNwZWVkIENvbnRpbnVvdXMgUmVhZCAoQ1IpIG1vZGUg
d2hpY2ggYWxsb3dzCnRoZSBlbnRpcmUgbWVtb3J5IGFycmF5IHRvIGJlIHJlYWQgb3V0IGJ5IGEg
c2luZ2xlIHJlYWQgY29tbWFuZAp3aXRob3V0IHJlLWlzc3VpbmcgdGhlIDEzaCDigJxQYWdlIFJl
YWQgdG8gQ2FjaGXigJ0gY29tbWFuZCBmb3IgZXZlcnkgcGFnZS4KCkRhdGFzaGVldCBzdW1tYXJ5
CkZlYXR1cmUgcmVnaXN0ZXIgQjBbM10gKE5SIGJpdCkKMSA9IE5vcm1hbCBSZWFkIChkZWZhdWx0
KQowID0gQ29udGludW91cyBSZWFkIChDUikKCkVDQyBzdGF0dXMgcmVnaXN0ZXIgN0NoCk5vcm1h
bCByZWFkOiBiaXRzIFszOjBdIOKGkiBFQ0Mgc3RhdHVzIG9mIGxhc3QgcGFnZQpDb250aW51b3Vz
IHJlYWQ6IGJpdHMgWzc6NF0g4oaSIGFjY3VtdWxhdGVkIG1heCBiaXQtZmxpcHMgb3ZlciB0aGUK
d2hvbGUgc2VxdWVudGlhbCByZWFkIG9wZXJhdGlvbi4KCkRhdGFzaGVldDoKaHR0cHM6Ly9naXRo
dWIuY29tL1dULTg4Ni9EQVRBU0hFRVQvYmxvYi9tYWluL0dENUYxR005LXYxLjAucGRmCgpTaWdu
ZWQtb2ZmLWJ5OiBUZW5nIFd1IDxnaWdhZGV2aWNlMjAyNUBnbWFpbC5jb20+Ci0tLQogZHJpdmVy
cy9tdGQvbmFuZC9zcGkvZ2lnYWRldmljZS5jIHwgMTA3ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDEwNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL2dpZ2FkZXZpY2UuYyBiL2RyaXZl
cnMvbXRkL25hbmQvc3BpL2dpZ2FkZXZpY2UuYwppbmRleCA5M2U0MDQzMWRiZTIuLjcyYWQzNmM5
YTEyNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9zcGkvZ2lnYWRldmljZS5jCisrKyBi
L2RyaXZlcnMvbXRkL25hbmQvc3BpL2dpZ2FkZXZpY2UuYwpAQCAtNCw2ICs0LDcgQEAKICAqCUNo
dWFuaG9uZyBHdW8gPGdjaDk4MTIxM0BnbWFpbC5jb20+CiAgKi8KIAorI2luY2x1ZGUgPGxpbnV4
L2JpdGZpZWxkLmg+CiAjaW5jbHVkZSA8bGludXgvZGV2aWNlLmg+CiAjaW5jbHVkZSA8bGludXgv
a2VybmVsLmg+CiAjaW5jbHVkZSA8bGludXgvbXRkL3NwaW5hbmQuaD4KQEAgLTIzLDYgKzI0LDE4
IEBACiAjZGVmaW5lIEdENUZYR1E0VVhGWFhHX1NUQVRVU19FQ0NfMV8zX0JJVEZMSVBTCSgxIDw8
IDQpCiAjZGVmaW5lIEdENUZYR1E0VVhGWFhHX1NUQVRVU19FQ0NfVU5DT1JfRVJST1IJKDcgPDwg
NCkKIAorLyogRmVhdHVyZSBiaXQgZGVmaW5pdGlvbnMgKi8KKyNkZWZpbmUgR0RfRkVBVFVSRV9O
UglCSVQoMykJLyogTm9ybWFsIFJlYWQoMT1ub3JtYWwsMD1jb250aW51b3VzKSAqLworI2RlZmlu
ZSBHRF9GRUFUVVJFX0NSREMJQklUKDIpCS8qIENvbnRpbnVvdXMgUmVhZCBEdW1teSAqLworCisv
KiBFQ0Mgc3RhdHVzIGV4dHJhY3Rpb24gaGVscGVycyAqLworI2RlZmluZSBHRF9FQ0NTUl9MQVNU
X1BBR0UoZWNjc3IpCUZJRUxEX0dFVChHRU5NQVNLKDMsIDApLCBlY2NzcikKKyNkZWZpbmUgR0Rf
RUNDU1JfQUNDVU1VTEFURUQoZWNjc3IpCUZJRUxEX0dFVChHRU5NQVNLKDcsIDQpLCBlY2NzcikK
Kworc3RydWN0IGdpZ2FkZXZpY2VfcHJpdiB7CisJYm9vbCBjb250aW51b3VzX3JlYWQ7Cit9Owor
CiBzdGF0aWMgU1BJTkFORF9PUF9WQVJJQU5UUyhyZWFkX2NhY2hlX3ZhcmlhbnRzLAogCQlTUElO
QU5EX1BBR0VfUkVBRF9GUk9NX0NBQ0hFXzFTXzRTXzRTX09QKDAsIDEsIE5VTEwsIDAsIDApLAog
CQlTUElOQU5EX1BBR0VfUkVBRF9GUk9NX0NBQ0hFXzFTXzFTXzRTX09QKDAsIDEsIE5VTEwsIDAs
IDApLApAQCAtNjMsNiArNzYsNzQgQEAgc3RhdGljIFNQSU5BTkRfT1BfVkFSSUFOVFModXBkYXRl
X2NhY2hlX3ZhcmlhbnRzLAogCQlTUElOQU5EX1BST0dfTE9BRF8xU18xU180U19PUChmYWxzZSwg
MCwgTlVMTCwgMCksCiAJCVNQSU5BTkRfUFJPR19MT0FEXzFTXzFTXzFTX09QKGZhbHNlLCAwLCBO
VUxMLCAwKSk7CiAKK3N0YXRpYyBpbnQgZ2Q1ZnhnbTlfZ2V0X2VjY3NyKHN0cnVjdCBzcGluYW5k
X2RldmljZSAqc3BpbmFuZCwgdTggKmVjY3NyKQoreworCXN0cnVjdCBnaWdhZGV2aWNlX3ByaXYg
KnByaXYgPSBzcGluYW5kLT5wcml2OworCXN0cnVjdCBzcGlfbWVtX29wIG9wID0gU1BJX01FTV9P
UChTUElfTUVNX09QX0NNRCgweDdjLCAxKSwKKwkJCQkJU1BJX01FTV9PUF9OT19BRERSLAorCQkJ
CQlTUElfTUVNX09QX0RVTU1ZKDEsIDEpLAorCQkJCQlTUElfTUVNX09QX0RBVEFfSU4oMSwgZWNj
c3IsIDEpKTsKKwlpbnQgcmV0OworCisJcmV0ID0gc3BpX21lbV9leGVjX29wKHNwaW5hbmQtPnNw
aW1lbSwgJm9wKTsKKwlpZiAocmV0KQorCQlyZXR1cm4gcmV0OworCisJaWYgKHByaXYtPmNvbnRp
bnVvdXNfcmVhZCkKKwkJKmVjY3NyID0gR0RfRUNDU1JfQUNDVU1VTEFURUQoKmVjY3NyKTsKKwll
bHNlCisJCSplY2NzciA9IEdEX0VDQ1NSX0xBU1RfUEFHRSgqZWNjc3IpOworCisJcmV0dXJuIDA7
Cit9CisKK3N0YXRpYyBpbnQgZ2Q1ZnhnbTlfZWNjX2dldF9zdGF0dXMoc3RydWN0IHNwaW5hbmRf
ZGV2aWNlICpzcGluYW5kLCB1OCBzdGF0dXMpCit7CisJc3RydWN0IG5hbmRfZGV2aWNlICpuYW5k
ID0gc3BpbmFuZF90b19uYW5kKHNwaW5hbmQpOworCXU4IGVjY3NyOworCWludCByZXQ7CisKKwlz
d2l0Y2ggKHN0YXR1cyAmIFNUQVRVU19FQ0NfTUFTSykgeworCWNhc2UgU1RBVFVTX0VDQ19OT19C
SVRGTElQUzoKKwkJcmV0dXJuIDA7CisKKwljYXNlIEdENUZYR1E0WEFfU1RBVFVTX0VDQ18xXzdf
QklURkxJUFM6CisJCXJldCA9IGdkNWZ4Z205X2dldF9lY2NzcihzcGluYW5kLCBzcGluYW5kLT5z
Y3JhdGNoYnVmKTsKKwkJaWYgKHJldCkKKwkJCXJldHVybiBuYW5kZGV2X2dldF9lY2NfY29uZihu
YW5kKS0+c3RyZW5ndGg7CisKKwkJZWNjc3IgPSAqc3BpbmFuZC0+c2NyYXRjaGJ1ZjsKKwkJaWYg
KFdBUk5fT04oIWVjY3NyIHx8IGVjY3NyID4gbmFuZGRldl9nZXRfZWNjX2NvbmYobmFuZCktPnN0
cmVuZ3RoKSkKKwkJCXJldHVybiBuYW5kZGV2X2dldF9lY2NfY29uZihuYW5kKS0+c3RyZW5ndGg7
CisKKwkJcmV0dXJuIGVjY3NyOworCisJY2FzZSBHRDVGWEdRNFhBX1NUQVRVU19FQ0NfOF9CSVRG
TElQUzoKKwkJcmV0dXJuIDg7CisKKwljYXNlIFNUQVRVU19FQ0NfVU5DT1JfRVJST1I6CisJCXJl
dHVybiAtRUJBRE1TRzsKKworCWRlZmF1bHQ6CisJCXJldHVybiAtRUlOVkFMOworCX0KK30KKwor
c3RhdGljIGludCBnZDVmeGdtOV9zZXRfY29udGludW91c19yZWFkKHN0cnVjdCBzcGluYW5kX2Rl
dmljZSAqc3BpbmFuZCwgYm9vbCBlbmFibGUpCit7CisJc3RydWN0IGdpZ2FkZXZpY2VfcHJpdiAq
cHJpdiA9IHNwaW5hbmQtPnByaXY7CisJaW50IHJldDsKKworCXJldCA9IHNwaW5hbmRfdXBkX2Nm
ZyhzcGluYW5kLCBHRF9GRUFUVVJFX05SLAorCQkJCWVuYWJsZSA/IDAgOiBHRF9GRUFUVVJFX05S
KTsKKwlpZiAocmV0KQorCQlyZXR1cm4gcmV0OworCisJcHJpdi0+Y29udGludW91c19yZWFkID0g
ZW5hYmxlOworCisJcmV0dXJuIDA7Cit9CisKIHN0YXRpYyBpbnQgZ2Q1ZnhncTR4YV9vb2JsYXlv
dXRfZWNjKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBpbnQgc2VjdGlvbiwKIAkJCQkgIHN0cnVjdCBt
dGRfb29iX3JlZ2lvbiAqcmVnaW9uKQogewpAQCAtNTQyLDcgKzYyMyw4IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3Qgc3BpbmFuZF9pbmZvIGdpZ2FkZXZpY2Vfc3BpbmFuZF90YWJsZVtdID0gewogCQkJ
CQkgICAgICAmdXBkYXRlX2NhY2hlX3ZhcmlhbnRzKSwKIAkJICAgICBTUElOQU5EX0hBU19RRV9C
SVQsCiAJCSAgICAgU1BJTkFORF9FQ0NJTkZPKCZnZDVmeGdxeF92YXJpYW50Ml9vb2JsYXlvdXQs
Ci0JCQkJICAgICBnZDVmeGdxNHVleHhnX2VjY19nZXRfc3RhdHVzKSksCisJCQkJICAgICBnZDVm
eGdtOV9lY2NfZ2V0X3N0YXR1cyksCisJCQlTUElOQU5EX0NPTlRfUkVBRChnZDVmeGdtOV9zZXRf
Y29udGludW91c19yZWFkKSksCiAJU1BJTkFORF9JTkZPKCJHRDVGMUdNOVJFeHhHIiwKIAkJICAg
ICBTUElOQU5EX0lEKFNQSU5BTkRfUkVBRElEX01FVEhPRF9PUENPREVfRFVNTVksIDB4ODEsIDB4
MDEpLAogCQkgICAgIE5BTkRfTUVNT1JHKDEsIDIwNDgsIDEyOCwgNjQsIDEwMjQsIDIwLCAxLCAx
LCAxKSwKQEAgLTU1MiwxMCArNjM0LDMxIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc3BpbmFuZF9p
bmZvIGdpZ2FkZXZpY2Vfc3BpbmFuZF90YWJsZVtdID0gewogCQkJCQkgICAgICAmdXBkYXRlX2Nh
Y2hlX3ZhcmlhbnRzKSwKIAkJICAgICBTUElOQU5EX0hBU19RRV9CSVQsCiAJCSAgICAgU1BJTkFO
RF9FQ0NJTkZPKCZnZDVmeGdxeF92YXJpYW50Ml9vb2JsYXlvdXQsCi0JCQkJICAgICBnZDVmeGdx
NHVleHhnX2VjY19nZXRfc3RhdHVzKSksCisJCQkJICAgICBnZDVmeGdtOV9lY2NfZ2V0X3N0YXR1
cyksCisJCQlTUElOQU5EX0NPTlRfUkVBRChnZDVmeGdtOV9zZXRfY29udGludW91c19yZWFkKSks
CiB9OwogCitzdGF0aWMgaW50IGdkNWZ4Z205X3NwaW5hbmRfaW5pdChzdHJ1Y3Qgc3BpbmFuZF9k
ZXZpY2UgKnNwaW5hbmQpCit7CisJc3RydWN0IGdpZ2FkZXZpY2VfcHJpdiAqcHJpdjsKKworCXBy
aXYgPSBremFsbG9jKHNpemVvZigqcHJpdiksIEdGUF9LRVJORUwpOworCWlmICghcHJpdikKKwkJ
cmV0dXJuIC1FTk9NRU07CisKKwlzcGluYW5kLT5wcml2ID0gIHByaXY7CisKKwlyZXR1cm4gMDsK
K30KKworc3RhdGljIHZvaWQgZ2Q1ZnhnbTlfc3BpbmFuZF9jbGVhbnVwKHN0cnVjdCBzcGluYW5k
X2RldmljZSAqc3BpbmFuZCkKK3sKKwlrZnJlZShzcGluYW5kLT5wcml2KTsKK30KKwogc3RhdGlj
IGNvbnN0IHN0cnVjdCBzcGluYW5kX21hbnVmYWN0dXJlcl9vcHMgZ2lnYWRldmljZV9zcGluYW5k
X21hbnVmX29wcyA9IHsKKwkuaW5pdCA9IGdkNWZ4Z205X3NwaW5hbmRfaW5pdCwKKwkuY2xlYW51
cCA9IGdkNWZ4Z205X3NwaW5hbmRfY2xlYW51cCwKIH07CiAKIGNvbnN0IHN0cnVjdCBzcGluYW5k
X21hbnVmYWN0dXJlciBnaWdhZGV2aWNlX3NwaW5hbmRfbWFudWZhY3R1cmVyID0gewotLSAKMi40
My4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
