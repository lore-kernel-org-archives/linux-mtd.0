Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D714C87FDB
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Aug 2025 12:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8JWn5HMHNnASOsIMqRuVmo7DXngVDDrC8Wo5flYckLc=; b=XNwjtggq9tbDED
	bz0eb50Mz2+xnmzI8jzD/DjJyJFwN1KrH3boemymuDOlA2to5Kq79hgabi+GOi/WGHJAANHQVPZuC
	wafWRN+P6dhVMPdRT9QpBQ/kdAzVr4pgEI1DSow8Jfou5y4eN6X587ky6p6FaFTqNI1IOJT5KnVUn
	hFByO0llaQKA9GNbu8OT78rng1qQxPaUReCDprfZLva2ZTAMOKvMMfRNP9e3J/qu5rp8trLQdk7YC
	K6fCtScuWn7x2qWXcEu8SzWhBa5mTxNgfbMpHXA79apPGavnZ5BVPEXFP1oriGZA2Af9KD+QiigFa
	xxLLtwyaOP/1Ssp0kEsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulRLA-00000007b7x-1CfQ;
	Mon, 11 Aug 2025 12:09:24 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulRL7-00000007b7C-42n8
	for linux-mtd@lists.infradead.org;
	Mon, 11 Aug 2025 12:09:23 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4594440145cso6172005e9.1
        for <linux-mtd@lists.infradead.org>; Mon, 11 Aug 2025 05:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754914160; x=1755518960; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TGWojVuAahncp2PL7F7k52hXQw6pomfkevqP1zuZMgU=;
        b=Xd7j63uaTYeIHqtu2XLl4WYaqh1RI883B2mX3Ij74GGgcJHx2rlckMMw0i7EhZ6bTQ
         GBU3soer9AKFCv+r8J006+eQnEOjVZcCp6rIsskD1Dj0ujls/9tP2ZOUEoUI7irNNIx5
         f8n+CeKQb7IjrnrvX5rShG0F+Mt/mZF+cPXN1uJTMv2dzS2Bdou+2ETTDlCnw7f5Cc1l
         yg3t8BAviCbczib/FrbxRucNsgztMqRaXGoyedCrxvHLQO1YGSOoluWdWKB0YCRLK2Q/
         m0x7Io3V6CuCwDFsTfkIkOzsUtVyFd7sHXUa22KG/QgZhzzexFOeffSCiyYEWuSKpCOd
         htIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754914160; x=1755518960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TGWojVuAahncp2PL7F7k52hXQw6pomfkevqP1zuZMgU=;
        b=I1n08kaPNE9dEMC2PFiUAngBDnXOrFe3yFkGidoLrIcDo8rpaDLelsRdjrdnt4YL3C
         yguB64ITnV25eDpKU/81K6DTF1me4+7S4FXfA7J76baCyBgShh3DphuHkJcuZCHmjuM4
         bY1F2DgFIqp4PCKgtPne3oEaW/AhvyVm234SkWV5gIlDSsipyuw6ADr0C4++psyZ+29C
         ur3NqbgLnDwnSHi17v54QHu3T4hHUb3tW+LQZcQXXBXfFvlQz2nE7yrwopnOMnFFqrp5
         8cSx+NnpZTp76S6eyruGtokezvf55Z9+HgRRK/pqdKH/apQLPnM2yB8veqMvPZRvg7nj
         v/oA==
X-Forwarded-Encrypted: i=1; AJvYcCXihpfSnPWKE1tIbPuvkS2ANFGmNu1qsTvXvitF0/jaFSMRMxhonXjxBP/q2Ui8wI1bazySuDpiOBo=@lists.infradead.org
X-Gm-Message-State: AOJu0YyXwPvOWKwmE/U8XLSBdeVTg3V81eDn+KrWpR6GlaZK4uvxtwIG
	ojab1kNgmD6m1rBsggKuj9mvdzJKfjWeTCzyr+/BuxbMdEQln+MLrVDr
X-Gm-Gg: ASbGnctFWKOjNBjHY4mEXaZkdyvtGoNykOtUZOIQMIMpVaZhaSdhVwN1z3i5C9giLkr
	vsWp/r+st+fqC5edDE3mhsCsfsRIqk4WW7S/AukHLxjVhD2Y97mx6AxJKT52H3yxwlzkxPqMoCc
	rU4oqcYJEK14MEkumR2B/jX+fpXv6B++XLd2RnRN8monZ4oU31ZuE26bcrpsg7ZSKFB1h9JFQGL
	mFGirY+6DxCwqj5i7yUaQqQdcVDboXPPsscX+ILa55Sa7TJPJ/RlQo4+0csnRBfnXpbhk+t3wrn
	SRdNJbl+9gZSw1kz1EFWjjJ02Q+e3DwqVUtywYN2AV13s+Rn4DF3WQwPA/ayRKS0BP3Sjaw9Eaj
	AVs8fV07LoebC5kdS+JBAMz6jDFY/1Kc6PhsowXuoOskMOQ7pMZYQ+G7j14cHBGwUES+mHLdC/k
	ttbie4Oe7h
X-Google-Smtp-Source: AGHT+IFUSi10Oj0WFDCpb1FhBCdi2Dpon9R34C/nfzX3ReyO2Evkf4zyiSkjs/FeVpPcgdd/AiqGKA==
X-Received: by 2002:a05:6000:4382:b0:3b7:8890:8e71 with SMTP id ffacd0b85a97d-3b906883a54mr2524334f8f.11.1754914159866;
        Mon, 11 Aug 2025 05:09:19 -0700 (PDT)
Received: from pop-os.localdomain (208.77.11.37.dynamic.jazztel.es. [37.11.77.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458f713eb44sm376739085e9.14.2025.08.11.05.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 05:09:19 -0700 (PDT)
From: =?UTF-8?q?Miguel=20Garc=C3=ADa?= <miguelgarciaroman8@gmail.com>
To: richard@nod.at,
	miquel.raynal@bootlin.com,
	vigneshr@ti.com
Cc: chengzhihao1@huawei.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	=?UTF-8?q?Miguel=20Garc=C3=ADa?= <miguelgarciaroman8@gmail.com>
Subject: [PATCH] mtd: ubi: replace strcpy with strscpy in mtd parameter parser
Date: Mon, 11 Aug 2025 14:09:12 +0200
Message-Id: <20250811120912.144720-1-miguelgarciaroman8@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_050922_007536_7E79F41A 
X-CRM114-Status: GOOD (  11.75  )
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

UmVwbGFjZSB0aGUgc3RyY3B5KCkgY2FsbHMgdXNlZCB0byBjb3B5IHRoZSAnbXRkPScgcGFyYW1l
dGVyIGludG8gbG9jYWwKYnVmZmVycyB3aXRoIHN0cnNjcHkoKSB0byBhdm9pZCBwb3RlbnRpYWwg
b3ZlcmZsb3cgYW5kIGd1YXJhbnRlZSBOVUwKdGVybWluYXRpb24uIERlc3RpbmF0aW9ucyBhcmUg
Zml4ZWQtc2l6ZSBhcnJheXMgKGJ1ZiBhbmQgcC0+bmFtZSksIHNvCnVzZSBzaXplb2YoKS4KCldo
aWxlIHRoaXMgY29kZSBpcyBjdXJyZW50bHkgc2FmZSBkdWUgdG8gcHJpb3IgbGVuZ3RoIGNoZWNr
cwooc3Rybmxlbih2YWwsIE1URF9QQVJBTV9MRU5fTUFYKSBhbmQgZWFybHkgcmV0dXJuIG9uIG92
ZXJmbG93KSwKcmVwbGFjaW5nIHN0cmNweSgpIHdpdGggc3Ryc2NweSgpIGZvbGxvd3MgY3VycmVu
dCBrZXJuZWwgYmVzdCBwcmFjdGljZXMKYW5kIG1ha2VzIHRoZSBjb2RlIG1vcmUgcm9idXN0IHRv
IGZ1dHVyZSBjaGFuZ2VzLiBUaGUgc2l6ZW9mKCkgY2FsbHMKY29ycmVjdGx5IGNvbXB1dGUgdGhl
IGJ1ZmZlciBzaXplcywgbWF0Y2hpbmcgTVREX1BBUkFNX0xFTl9NQVguCgpUZXN0ZWQgaW4gUUVN
VSAoaW5pdHJhbWZzICsgYnVpbHQtaW5zKToKIC0gbXRkcmFtLnRvdGFsX3NpemU9MTYzODQgbXRk
cmFtLmVyYXNlc2l6ZT0yNTYgdWJpLm10ZD0wCiAtIHViaS5tdGQ9Im10ZHJhbSB0ZXN0IGRldmlj
ZSIKIC0gb3Zlcmx5IGxvbmcgbmFtZSAtPiBwcm9wZXIgInBhcmFtZXRlciAuLi4gaXMgdG9vIGxv
bmciIGhhbmRsaW5nCgpObyBmdW5jdGlvbmFsIGNoYW5nZSBpbnRlbmRlZC4KClNpZ25lZC1vZmYt
Ynk6IE1pZ3VlbCBHYXJjw61hIDxtaWd1ZWxnYXJjaWFyb21hbjhAZ21haWwuY29tPgotLS0KIGRy
aXZlcnMvbXRkL3ViaS9idWlsZC5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3ViaS9idWls
ZC5jIGIvZHJpdmVycy9tdGQvdWJpL2J1aWxkLmMKaW5kZXggZWY2YTIyZjM3MmY5Li4wZDlmMzE1
MjIzNTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL3ViaS9idWlsZC5jCisrKyBiL2RyaXZlcnMv
bXRkL3ViaS9idWlsZC5jCkBAIC0xNDk3LDcgKzE0OTcsNyBAQCBzdGF0aWMgaW50IHViaV9tdGRf
cGFyYW1fcGFyc2UoY29uc3QgY2hhciAqdmFsLCBjb25zdCBzdHJ1Y3Qga2VybmVsX3BhcmFtICpr
cCkKIAkJcmV0dXJuIDA7CiAJfQogCi0Jc3RyY3B5KGJ1ZiwgdmFsKTsKKwlzdHJzY3B5KGJ1Ziwg
dmFsLCBzaXplb2YoYnVmKSk7CiAKIAkvKiBHZXQgcmlkIG9mIHRoZSBmaW5hbCBuZXdsaW5lICov
CiAJaWYgKGJ1ZltsZW4gLSAxXSA9PSAnXG4nKQpAQCAtMTUxMiw3ICsxNTEyLDcgQEAgc3RhdGlj
IGludCB1YmlfbXRkX3BhcmFtX3BhcnNlKGNvbnN0IGNoYXIgKnZhbCwgY29uc3Qgc3RydWN0IGtl
cm5lbF9wYXJhbSAqa3ApCiAJfQogCiAJcCA9ICZtdGRfZGV2X3BhcmFtW210ZF9kZXZzXTsKLQlz
dHJjcHkoJnAtPm5hbWVbMF0sIHRva2Vuc1swXSk7CisJc3Ryc2NweSgmcC0+bmFtZVswXSwgdG9r
ZW5zWzBdLCBzaXplb2YocC0+bmFtZSkpOwogCiAJdG9rZW4gPSB0b2tlbnNbMV07CiAJaWYgKHRv
a2VuKSB7Ci0tIAoyLjM0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
