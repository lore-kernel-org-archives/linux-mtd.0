Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F2B9C433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  4 May 2022 19:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kZNDIpv/BUqu3riFsDK1/tXJq9wgJjmik9/oh+cGcdI=; b=J6JDeygyEAmm/Z
	lMotI8/J/AR2joiyn0MofsOpTzsIQ4R13jZdO8EApUN12cHzscTvHwOh+GwNSN7wHcB5Zh36MYGwC
	uqjrpXYxjGrKOUx1UWZXtJrAXg8jpE6kdm1A05ekOJGUxgJkLt1D3pC9YzR5+aaMEaZF2l3FP7/sf
	97maJnD/50IcL+NXjvKadK7igBYgOA2YPIoj3HIiG1BtACok0oXX+Nk5JIS4lb2OJqOKJtputQ6o9
	Sjr7D2e5fGzqZkYFUdD9Hk5S3agQmd57T3N8rB4en+TlMoLOf6n3fpBLs3JeOKV4gpGLBwFkbAHhY
	nxvB9Jz0bVEq+/Kn5k4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmKvw-00CPsv-PX; Wed, 04 May 2022 19:45:12 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmKvt-00CPrS-PK
 for linux-mtd@lists.infradead.org; Wed, 04 May 2022 19:45:11 +0000
Received: by mail-ej1-x631.google.com with SMTP id kq17so4867033ejb.4
 for <linux-mtd@lists.infradead.org>; Wed, 04 May 2022 12:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lXbSjEbgR2D5btxhA4ub9CSmieSjqXHeqRGJjTDf1Jg=;
 b=Q8WyrFQ7qHqnZAVLO9JfKecswJDZPNLbiZ5dfSba0bfjG/Vp5+k0XEgbItunmpI3N9
 cGrK3mQbxGAaDWfS8EXAP2mh6UiX0UHDPFgf2lwbSk8n0b8TcEJpTt4YnXvhsT3/SMkS
 kWbo2b3gbjHJzGu4XvdFdDHL+/cnz59j77ciTdhDfExQz+NOquft5fHcEVVTWnamFLa5
 m94SSci4QIuK9yC+vfNc31g3Xz9HgglFByaUmB1Xf+1gbWp0L3RYVZvQOSgbZRVe/7h0
 dpvlT3MW6919tVzcsES3XP1bbQhXXMsL566LXBE/SDj1zM+IMlFghT0PpbHhnxoxutKh
 cIUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lXbSjEbgR2D5btxhA4ub9CSmieSjqXHeqRGJjTDf1Jg=;
 b=p385DGn4AXWZuqHlgZB6uE60H0DuonM5YYcWuPnRuG94b+Nieke8n1A4jw4YTOjGEF
 SfwsmPLGM3ZHSsMvl9xIzLusCuHvuvv12k/nQcesHM7oc99uOEQhJIFcxTw+zP4D2pZo
 cRHSkdcM9HTAy2poP0s5DhCY+z8UwJMV17JkwkkxY0NbA5u2c+BMdGaKhh425ofpU5XE
 cCOhesFKNAiXHQO+hVLooUKxoswz6jRq4/nwx7dWEnQdlWH5rI6/+dHNt9zQze/huaJS
 tgTBi0Gwj+I+a6XDIOrIhIGA4TRP4zglgwaDRDKaYfYijNrV7RaXWj17MChzVUL3ws8O
 y32Q==
X-Gm-Message-State: AOAM533JLregCXeMqvaFHAbKyQ0s4dyMb9w8uPr6+8oHF73k5jki3EAn
 AZLrrY7iVhG9mnLxVKvK8xg=
X-Google-Smtp-Source: ABdhPJxEUo8smhIHG6jkOusUD2aYwUP+PdU02qVsvn/UfFp+x/oFaNPG3odlhCukB+UAx3r2CSJS1g==
X-Received: by 2002:a17:907:c02:b0:6df:fb64:2770 with SMTP id
 ga2-20020a1709070c0200b006dffb642770mr22664115ejc.221.1651693507588; 
 Wed, 04 May 2022 12:45:07 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl.
 [194.187.74.233]) by smtp.gmail.com with ESMTPSA id
 v21-20020aa7d815000000b0042617ba63b8sm9479901edq.66.2022.05.04.12.45.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 12:45:07 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Daniel Golle <daniel@makrotopia.org>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2] mtd: call of_platform_populate() for MTD partitions
Date: Wed,  4 May 2022 21:44:48 +0200
Message-Id: <20220504194448.17427-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_124509_862456_DD45FA41 
X-CRM114-Status: GOOD (  16.15  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKVW50aWwgdGhpcyBjaGFu
Z2UgTVREIHN1YnN5c3RlbSBzdXBwb3J0ZWQgaGFuZGxpbmcgcGFydGl0aW9ucyBvbmx5IHdpdGgK
TVREIHBhcnRpdGlvbnMgcGFyc2Vycy4gVGhhdCdzIGEgc3BlY2lmaWMgLyBsaW1pdGVkIEFQSSBk
ZXNpZ25lZCBhcm91bmQKcGFydGl0aW9ucy4KClNvbWUgTVREIHBhcnRpdGlvbnMgbWF5IGhvd2V2
ZXIgcmVxdWlyZSBkaWZmZXJlbnQgaGFuZGxpbmcuIFRoZXkgbWF5CmNvbnRhaW4gc3BlY2lmaWMg
ZGF0YSB0aGF0IG5lZWRzIHRvIGJlIHBhcnNlZCBhbmQgc29tZWhvdyBleHRyYWN0ZWQuIEZvcgp0
aGF0IHB1cnBvc2UgTVREIHN1YnN5c3RlbSBzaG91bGQgYWxsb3cgYmluZGluZyBvZiBzdGFuZGFy
ZCBwbGF0Zm9ybQpkcml2ZXJzLgoKQW4gZXhhbXBsZSBjYW4gYmUgVS1Cb290IChzdWIpcGFydGl0
aW9uIHdpdGggZW52aXJvbm1lbnQgdmFyaWFibGVzLgpUaGVyZSBleGlzdCBhICJ1LWJvb3QsZW52
IiBEVCBiaW5kaW5nIGZvciBNVEQgKHN1YilwYXJ0aXRpb24gdGhhdApyZXF1aXJlcyBhbiBOVk1F
TSBkcml2ZXIuCgpSZWY6IDVkYjFjMmRiYzA0YyAoImR0LWJpbmRpbmdzOiBudm1lbTogYWRkIFUt
Qm9vdCBlbnZpcm9ubWVudCB2YXJpYWJsZXMgYmluZGluZyIpClNpZ25lZC1vZmYtYnk6IFJhZmHF
giBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KLS0tClYyOiBGaXggY2FzZSBmb3IgIyBDT05G
SUdfTVREX1BBUlRJVElPTkVEX01BU1RFUiBpcyBub3Qgc2V0CiAgICBtYXN0ZXItPmRldiBjYW4n
dCBiZSB1c2VkIGJsaW5kbHkgYXMgaXQgbWF5IHBvaW50IHRvIHVucmVnaXN0ZXJlZAogICAgZGV2
aWNlIGFuZCBjYXVzZSBXQVJOSU5HcwotLS0KIGRyaXZlcnMvbXRkL210ZHBhcnQuYyB8IDkgKysr
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9tdGQvbXRkcGFydC5jIGIvZHJpdmVycy9tdGQvbXRkcGFydC5jCmluZGV4IDM1NzY2MWI2
MmM5NC4uNDk3MWZhNjlkMDc2IDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9tdGRwYXJ0LmMKKysr
IGIvZHJpdmVycy9tdGQvbXRkcGFydC5jCkBAIC0xNyw2ICsxNyw3IEBACiAjaW5jbHVkZSA8bGlu
dXgvbXRkL3BhcnRpdGlvbnMuaD4KICNpbmNsdWRlIDxsaW51eC9lcnIuaD4KICNpbmNsdWRlIDxs
aW51eC9vZi5oPgorI2luY2x1ZGUgPGxpbnV4L29mX3BsYXRmb3JtLmg+CiAKICNpbmNsdWRlICJt
dGRjb3JlLmgiCiAKQEAgLTU3NywxMCArNTc4LDE2IEBAIHN0YXRpYyBpbnQgbXRkX3BhcnRfb2Zf
cGFyc2Uoc3RydWN0IG10ZF9pbmZvICptYXN0ZXIsCiAJc3RydWN0IG10ZF9wYXJ0X3BhcnNlciAq
cGFyc2VyOwogCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbnA7CiAJc3RydWN0IHByb3BlcnR5ICpwcm9w
OworCXN0cnVjdCBkZXZpY2UgKmRldjsKIAljb25zdCBjaGFyICpjb21wYXQ7CiAJY29uc3QgY2hh
ciAqZml4ZWQgPSAiZml4ZWQtcGFydGl0aW9ucyI7CiAJaW50IHJldCwgZXJyID0gMDsKIAorCWlm
IChtdGRfaXNfcGFydGl0aW9uKG1hc3RlcikgfHwgSVNfRU5BQkxFRChDT05GSUdfTVREX1BBUlRJ
VElPTkVEX01BU1RFUikpCisJCWRldiA9ICZtYXN0ZXItPmRldjsKKwllbHNlCisJCWRldiA9IG1h
c3Rlci0+ZGV2LnBhcmVudDsKKwogCW5wID0gbXRkX2dldF9vZl9ub2RlKG1hc3Rlcik7CiAJaWYg
KG10ZF9pc19wYXJ0aXRpb24obWFzdGVyKSkKIAkJb2Zfbm9kZV9nZXQobnApOwpAQCAtNTkzLDYg
KzYwMCw3IEBAIHN0YXRpYyBpbnQgbXRkX3BhcnRfb2ZfcGFyc2Uoc3RydWN0IG10ZF9pbmZvICpt
YXN0ZXIsCiAJCQljb250aW51ZTsKIAkJcmV0ID0gbXRkX3BhcnRfZG9fcGFyc2UocGFyc2VyLCBt
YXN0ZXIsIHBwYXJ0cywgTlVMTCk7CiAJCWlmIChyZXQgPiAwKSB7CisJCQlvZl9wbGF0Zm9ybV9w
b3B1bGF0ZShucCwgTlVMTCwgTlVMTCwgZGV2KTsKIAkJCW9mX25vZGVfcHV0KG5wKTsKIAkJCXJl
dHVybiByZXQ7CiAJCX0KQEAgLTYwMCw2ICs2MDgsNyBAQCBzdGF0aWMgaW50IG10ZF9wYXJ0X29m
X3BhcnNlKHN0cnVjdCBtdGRfaW5mbyAqbWFzdGVyLAogCQlpZiAocmV0IDwgMCAmJiAhZXJyKQog
CQkJZXJyID0gcmV0OwogCX0KKwlvZl9wbGF0Zm9ybV9wb3B1bGF0ZShucCwgTlVMTCwgTlVMTCwg
ZGV2KTsKIAlvZl9ub2RlX3B1dChucCk7CiAKIAkvKgotLSAKMi4zNC4xCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
