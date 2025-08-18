Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E4F7CA0ED1
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Aug 2025 13:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ui5foULit/pXQvYDwE/PBzrrNQKC2qtOQenn0gFX0KY=; b=nUoqOMmW2EqrXK
	M2aCYNmjDMrFCAqyfWa/KQPL00W4rLLVVMAVX0uwNOAOoz1Eo/3rYrF1PoaoxkYv3MD+GsopUwgMF
	WTqMhAxLaiez/9JSlJAv2wy9FANd9p1uZIX363OqlEHEzcInMvQtiRiqPLkjwkMt3vn4DS0pzwJGi
	oTzxce9UVF7UjC+LqrEdM8fVqszLInglHX6RAvVdsNYSJAeR3klpVGtqGG2G5lzJS1Ihx33a+IC7j
	eUcj18P6UfkPaonIeXCfpK8m4A5uz69CBn2xjnraPcF2kqPw5n1msmEbJ+rw/tpiJaqncFdh27MqK
	wWmHkVOn6HGOtGIF5sTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo0Hj-00000007fZK-15HT;
	Mon, 18 Aug 2025 13:52:27 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo0Hg-00000007fYf-2ozc
	for linux-mtd@lists.infradead.org;
	Mon, 18 Aug 2025 13:52:25 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b47405591ceso1414869a12.3
        for <linux-mtd@lists.infradead.org>; Mon, 18 Aug 2025 06:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755525143; x=1756129943; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JIC+sfaRRNCZ/PpzLr3hvBF4vD7BYR+5HNnrMt71ufA=;
        b=NRicGELV2qXQnlMjuOWHIDQJyWuv00fUSbAyd3pBcEtTO8RPKzaCeFXklPJgsk74f/
         A2+yXeKUFmJcaJC5/FC2T7yTVjYQbryp4YGATioBqEmhtvjw4iEeMWCkhwMw8H0rxMdL
         bxX/zjLPNnKcTLXZumMAnPIFClfNDeAvkWW2jABUmlKyfNmwZc1Omn9NY3SGLL3cmPEO
         9TcXXhNLYZWULrC4IcY9wFRPtg8/qIj8B19hw86VpcBkxOnJWXFBedOm3R4t3cm2hLtO
         KgYbIrhfwiwXLrHnDAFo3caP9bSpsum/VnL20IWWzaiNsQ9bTV21shd1JU9yGMx9kVCw
         Ov7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755525143; x=1756129943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JIC+sfaRRNCZ/PpzLr3hvBF4vD7BYR+5HNnrMt71ufA=;
        b=MgFGRlz5ngRPFBbp6zSCwf1oL2C9K5BzlrX0RT4U/PJb+VaU/pwIr10cdio9xUx4Ob
         919i2R9NAO0nQL3RSk1X7wy1Dio1RFOrRtbhiyv3dxPSNZhuW5kw/DmymswdyiF50CL4
         KxZQAopsONw+p3k2FqjV+qymwr9Hxq2BTlvxDWkivu9cbK6NXimgjOuGm22l3FMyAbnz
         fc7BwYD+8uyaG6gKDb9rpgvX5L/0mHjZZT9fVXmuIHC/t9MSe3D8qah5RWHQJBSVHBQ0
         JbQMuI1naz6OaDKQ6sGVfsfaoYao04/tnIw7KaoOemCzO0pEZo+ne8Oz363F4Lb25K8C
         bWKw==
X-Gm-Message-State: AOJu0Yx3BE25SfVO43ZpUFAmVbdg9J9jf+eSTLcTmsjtE919lUivPYqy
	7BWWcWCioMeihLkut6mZNeXu5AZG+b24TQBKGjxyGL8V4HI66EHXiRYf2zu+Z49Q0OY=
X-Gm-Gg: ASbGncv7pancyJ/A1OH5xx0caFx+g3/MDKT74Ts1Bw5NfKWNxBNw8PWQxSZJqPJsI0x
	IGNaUHaGx4356GY5qratRDdkzm2xv8X50HiaDLWrXMJVrEokj9LfqTQR6h254/IYYNI7K3XgiIY
	hQ/vXxX98LSBo7FCgLponA9QnkB3v1lmTvMHJGp8ZD7uRuUPiFe7f6qlrfrZGpl7YZammkYZmjM
	yitcYcu/byFWJOWaDfTs4cdxwrXIoss4LtuPWgyCrfUZO5WVFCUGvGe6Z3EC/XdFTEn71lGOFi7
	FsYVCBL+pibiffRxtU/n/xjG7H6/UN9271Sy8Aeg6KelpqRI+i6yh19aP44wFzfLr9OrDqFnJ9k
	REk3uMWMyEePZQEnktyBD8X4P1zTOW/5YPstdIt+EIo0=
X-Google-Smtp-Source: AGHT+IGgUrKNSua0EDsMH8SxXxNcd6RWSqv8OZx8Xxbo5zF6jRJky+tITPWEVzuGEdbYWfg2E6WWhg==
X-Received: by 2002:a17:903:4b4c:b0:242:a0b0:3c30 with SMTP id d9443c01a7336-2446d8edf38mr153112465ad.43.1755525143226;
        Mon, 18 Aug 2025 06:52:23 -0700 (PDT)
Received: from Fantast-WT.localdomain ([120.229.37.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d53b22fsm81848505ad.112.2025.08.18.06.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 06:52:22 -0700 (PDT)
From: Teng Wu <gigadevice2025@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	teng.wu@gigadevice.com,
	Teng Wu <gigadevice2025@gmail.com>
Subject: [PATCH] mtd: spinand: gigadevice: Add continuous read support
Date: Mon, 18 Aug 2025 21:51:41 +0800
Message-ID: <20250818135141.2096-1-gigadevice2025@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_065224_712691_BD77B4F3 
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
