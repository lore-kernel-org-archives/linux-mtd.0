Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE38FE77184
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Dec 2024 16:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Kt+tIpUioRnf+ZLKfXzESqC4E+GO5ek+NIxWiTGR8KY=; b=oJ+sgEOpDztCxh
	tmADZXYo9loAFtGJqkW/1e+XWQO8k+0Ng5o9U7Hv41F7Du+rlRAv5ZMy7to/Xvv+4VKUCQh0S0Xe3
	rE6B2Xgl5Du2kuI5fzB4w49MqY+1AI3JtpY52jYaCl/6qC0trYTM7tJRMzgVO0t5neJJjqx3T1/iI
	bw7ZatvwAEh4wiHCUz3QxkufuZqG5BPiNJWdp+Ld1gm6c5ifHrddeWLEfV5jN92LOsP/RCFXdNuD8
	tg9CxVHkk3q4+3uzzrStLc35PdXhRo77M8vtc28jpCJa6pqRH6LzFnQ6iGsdau/uOywkWESss2OKX
	UqIGqg+xx23OfuHFy3Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNaa3-0000000EDbk-3YIo;
	Tue, 17 Dec 2024 16:37:55 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNaYq-0000000EDGz-3hsK
	for linux-mtd@lists.infradead.org;
	Tue, 17 Dec 2024 16:36:42 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5401fb9fa03so5519591e87.1
        for <linux-mtd@lists.infradead.org>; Tue, 17 Dec 2024 08:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734453399; x=1735058199; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J0cmd3mL/sj0uQTs2dEeQi45QR5YZHgstC/vEtDe9xk=;
        b=BTweOSuMtEj2JXuWI77mfqWQcMu7yclQlscYKugoEcWrIKvWCqKPqhhkY4InEsqxXw
         +8Oa4ef3Q1W5VwqXKfuAdh6JikbFSM/uTuEgYLo7ycubSfFMK8BQf8fMxCVNKB2FSKUN
         CIYEThHyfwSCWpMz8frYSH/3T8CImgToWl2HAGTtcD3B3VhQFvGHswzvmKdJS41QV5tS
         s/cTTqWcR60pAlQkX9iss2uSc1m3LRS91XLokfMjW6YVQTMe7RHb2THSVZEPunNGChJd
         k30QuOGyPJEvxTCwEuUXDUIWVyASJeCUKmrw4AehY4HwA0xCdhs7BMDQjoafhACqM09u
         zsnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734453399; x=1735058199;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J0cmd3mL/sj0uQTs2dEeQi45QR5YZHgstC/vEtDe9xk=;
        b=Ti2KOJp5OZNPMSjki49dHy4MdKA5aQ/BtUTxr+mQVUuSC2FFo0t63KnKy4Bup650TW
         WjS/MCTkm0B8jHJ+mzcRL4PIGWl5SIvBuG8NHhGpuQEK63LcCZD9xliUgD432BGDq0RI
         j88JlU3FFrDY3TTOxC1QsZs9+dEUwQx6m00pnjrV7aU+gns/MJLsGVv+z5kHzpiR3pJq
         5OR3LRX0Yh30NgZsj5RfTS7i6JCr/ry2XIdy5s88unA+vvJJJX2CxzdU3yuZwizsh9Bm
         016a8mHdAbkqEpnWs0RgE6k6FvDPorJmF1L6stf6jOrWoxgOJ9p4qfGSLBOr22coJXRK
         vOBA==
X-Forwarded-Encrypted: i=1; AJvYcCU3IqNSo+8PVrm3fqVW2OB1EWeFwEuCNpjtuiuTI4Kx+jLF7naOcOF3hafZ+zm9ZR0XcErhKU1VXAs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz46G3uSBVl+SiLEqIWKay2h3O536BSrgWGjCxJtYv/Mhh7K7qO
	IIQzImuv0wUmtCdRQDrLaS8kfaKbod3Zjyoq1tkOBFY58Kny+nA8FNJ2gBoGvfBk0g==
X-Gm-Gg: ASbGncvsqampLZXPfRYx/YL6rfv23XhoCm9mkwPKEa1UXXaAD6ZDxOv4R+owuH0ELLr
	YkhwUYEGKGEMN2QUDTy4Ipq2iM8TzRg6CE2ISoxsuXCCjcZYPQaXew9Y8HzdUMKxOyJj0+9dOtN
	GsC6F3Eq22vWK1I+Gk4LPXuDFu6Wc6E450gHF7gdr0BeVqJj71EAsz3FlZQeycWFyk6GoBFWXiV
	TCVmKd8KoVSQqWaQWa0Zr3GnPk8CJtsJtk4YuQpVtIXSm6rR6hU72dGrOhiqSMbVfGhiCZDI6TO
	BHXvyapVHHt0BuOoszt8P7i5Zfxi1jtRqKe+4Mw=
X-Google-Smtp-Source: AGHT+IGMKkKIqlbefF80dbxLVM3YqZt62ko3sUxJUYOS1Yh2jpYDsF5o21cfNnKJ9fFYB76FsV6TSg==
X-Received: by 2002:a05:6512:1195:b0:540:1b4a:9177 with SMTP id 2adb3069b0e04-541315a0e81mr1323522e87.22.1734453398667;
        Tue, 17 Dec 2024 08:36:38 -0800 (PST)
Received: from astra-student.rasu.local (109-252-122-202.nat.spd-mgts.ru. [109.252.122.202])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120ba9945sm1229832e87.60.2024.12.17.08.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 08:36:38 -0800 (PST)
From: Anton Moryakov <ant.v.moryakov@gmail.com>
To: chengzhihao1@huawei.com,
	linux-mtd@lists.infradead.org
Cc: Anton Moryakov <ant.v.moryakov@gmail.com>
Subject: [PATCH mtd-utils] nand-utils: Fix integer overflow in nandflipbits.c
Date: Tue, 17 Dec 2024 19:36:53 +0300
Message-Id: <20241217163653.298586-1-ant.v.moryakov@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_083640_971652_4A22DD62 
X-CRM114-Status: GOOD (  11.68  )
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

UmVwb3J0IG9mIHRoZSBzdGF0aWMgYW5hbHl6ZXI6ClRoZSB2YWx1ZSBvZiBhbiBhcml0aG1ldGlj
IGV4cHJlc3Npb24gJ3BhZ2UgKiAobXRkLm1pbl9pb19zaXplICsgbXRkLm9vYl9zaXplKScgaXMg
YSBzdWJqZWN0IHRvIG92ZXJmbG93IGJlY2F1c2UgaXRzIG9wZXJhbmRzIGFyZSBub3QgY2FzdCB0
byBhIGxhcmdlciBkYXRhIHR5cGUgYmVmb3JlIHBlcmZvcm1pbmcgYXJpdGhtZXRpYwoKQ29ycmVj
dGlvbnMgZXhwbGFpbmVkOgpDYXN0aW5nIGJpdF90b19mbGlwLT5ibG9jayB0byB1bnNpZ25lZCBs
b25nIGxvbmcgZXhwYW5kcyB0aGUgcmFuZ2Ugb2YgdmFsdWVzIOKAi+KAi2FuZCBhbGxvd3MgdGhl
IHJlc3VsdCBvZiB0aGUgbXVsdGlwbGljYXRpb24gdG8gYmUgY2FsY3VsYXRlZCBpbiBhIHdpZGVy
IGRhdGEgdHlwZS4KVGhlIGFyaXRobWV0aWMgaXMgcGVyZm9ybWVkIGluIGEgc2FmZSByYW5nZSwg
cHJldmVudGluZyBvdmVyZmxvdy4KU3VtICsgYmxrb2ZmcyBpcyBub3cgYWxzbyBzYWZlLCBzaW5j
ZSB0aGUgcmVzdWx0IG9mIHRoZSBleHByZXNzaW9uIGlzIGFscmVhZHkgY2FsY3VsYXRlZCBpbiB1
bnNpZ25lZCBsb25nIGxvbmcuCgpUcmlnZ2VycyBmb3VuZCBieSBzdGF0aWMgYW5hbHl6ZXIgU3Zh
Y2UuCgpTaWduZWQtb2ZmLWJ5OiBBbnRvbiBNb3J5YWtvdiA8YW50LnYubW9yeWFrb3ZAZ21haWwu
Y29tPgoKLS0tCiBuYW5kLXV0aWxzL25hbmRmbGlwYml0cy5jIHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbmFuZC11dGls
cy9uYW5kZmxpcGJpdHMuYyBiL25hbmQtdXRpbHMvbmFuZGZsaXBiaXRzLmMKaW5kZXggZWY2NjNj
Ni4uYzQ2NDJmZSAxMDA2NDQKLS0tIGEvbmFuZC11dGlscy9uYW5kZmxpcGJpdHMuYworKysgYi9u
YW5kLXV0aWxzL25hbmRmbGlwYml0cy5jCkBAIC0yMTMsNyArMjEzLDcgQEAgaW50IG1haW4oaW50
IGFyZ2MsIGNoYXIgKiphcmd2KQogCQliaXRzX3RvX2ZsaXBbaV0uYmxvY2sgPSBiaXRzX3RvX2Zs
aXBbaV0ub2Zmc2V0IC8gYmxrbGVuOwogCQliaXRzX3RvX2ZsaXBbaV0ub2Zmc2V0ICU9IGJsa2xl
bjsKIAkJcGFnZSA9IGJpdHNfdG9fZmxpcFtpXS5vZmZzZXQgLyBwYWdlbGVuOwotCQliaXRzX3Rv
X2ZsaXBbaV0ub2Zmc2V0ID0gKHBhZ2UgKgorCQliaXRzX3RvX2ZsaXBbaV0ub2Zmc2V0ID0gKCh1
bnNpZ25lZCBsb25nIGxvbmcpcGFnZSAqCiAJCQkJCSAgKG10ZC5taW5faW9fc2l6ZSArIG10ZC5v
b2Jfc2l6ZSkpICsKIAkJCQkJIChiaXRzX3RvX2ZsaXBbaV0ub2Zmc2V0ICUgcGFnZWxlbik7CiAJ
fQotLSAKMi4zMC4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
