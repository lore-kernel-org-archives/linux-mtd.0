Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E88FC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Mar 2022 15:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zNN3j/TKcWyqgd2Yt0AXp1ghiFZP69NKxW6avVUnUeU=; b=cvV1pb6j4zFf9Q
	TxSi/MrZlOIojPXKe/y35bmn3EfqciJLfGqXr2Ld+WwaF3WXqH+RcsVPdjn/S/nyGZU+mXMyYSiNA
	MJP1gBjZpb3TvldLczZhMpUIAWif8nX3Wa5+Y0F+Y1NW9ezlWrQotoKz0oQOkSfVjWC3ORlIpcrzq
	/a5UzEh56H+NxHZMP70LR3HIbunDOPplmMB4u9JxeKp2occsTf5QSEyJiFkKGxT6NpfYiUhzEmrKZ
	c3gKwSmoKaE150FPpGvA0zsf2Nn4sXL4HdLm6+Wcr0DRgPcThFA58qgh6p3VRkC2p9HTMzl7zEDS0
	7j//Jc5DCFEcrYcRA6pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVEun-002Jd9-My; Fri, 18 Mar 2022 15:53:21 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVEuk-002JcW-7K
 for linux-mtd@lists.infradead.org; Fri, 18 Mar 2022 15:53:20 +0000
Received: by mail-lj1-x22a.google.com with SMTP id r21so4624304ljp.8
 for <linux-mtd@lists.infradead.org>; Fri, 18 Mar 2022 08:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kOpTv9lkGIFBP7PcQ+dEeu2k+vwLtZ1TaYm7R8svoP4=;
 b=AzKXqqaNiXsEsgD2uDia08mzqE7ZS7//xHv1NTY3BCH2my2GckJdnaeYTFGQbYYm/t
 swSiDLCy7D7nqlZTuarRqi/UcATmCkYjw6bi12owriDDX8eOE+TqSWikTNmAv03dS0un
 BgeJOA85jRqoP0YvsUvAOb5WTt3CDKlAyARN1xmtrE2PVfzP2bfCry0Uy1gtdijF0p5z
 pwfLIPnjv00j9nbxl50uFOuGj3jxFo3MeLRQGFjra8/BnfLw2n3jUVMqn1RjYXhTa1VR
 BfNp8NEFjxS/Bj/RHPQ/zHWL2ILdzrhxGmuy0+0uGU5fcsB3wulVFw/uCqtvwPNU6CZz
 7VBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kOpTv9lkGIFBP7PcQ+dEeu2k+vwLtZ1TaYm7R8svoP4=;
 b=dr4lJP2YQkANykIJzdwtyp72XlyG53k3uaBz1B5zQaVAIa73URHYGPG9fQg5qYbnrL
 x6YL8TUFEwb0GPJH9dF562ZjbbTQxxg2vOq3LQoSYpSlY1IoLiHaQJzQrv1Dy4O/0mdS
 /z4KIV+Fg+1cFEkuswg5lPRHh6nX9Y36mQlBKWF1q55eFVnLZdiQWYlls0aiKQWQStch
 EzYAgC5Dd4Cj1sUA0iq3jGnrMNJefacw0XhajVu0FUGejwVufoMIlyUSeeoSHVF8rhrF
 g4Me6jn9468zv7O0AKCKhSzL+nFWfAw6zgqYgxZyAKEkFap520lPzMmlVi1SKxlrlE9g
 VpVg==
X-Gm-Message-State: AOAM531Ctt688AbZhPR024hz07yKajVTmQ8cTwsPHHAzdGte6rwd1qsZ
 EXDIy6HxgFpsds3ZH8BmolN/809LZmc=
X-Google-Smtp-Source: ABdhPJydJc/cgGbSQjYMhV3Az1K1EqL0E2nvjU+HsWVyoRp8d7cmHcwnI3E0CGvDfDElIDxvlIPGWg==
X-Received: by 2002:a2e:bf01:0:b0:247:dfe7:62dc with SMTP id
 c1-20020a2ebf01000000b00247dfe762dcmr6508421ljr.365.1647618794948; 
 Fri, 18 Mar 2022 08:53:14 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl.
 [194.187.74.233]) by smtp.gmail.com with ESMTPSA id
 bp19-20020a056512159300b00448b37c6f4csm899403lfb.12.2022.03.18.08.53.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 08:53:14 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] UBI: support EOF block marking end of ubinized image
Date: Fri, 18 Mar 2022 16:53:04 +0100
Message-Id: <20220318155304.14916-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_085318_290419_C60269E7 
X-CRM114-Status: GOOD (  16.56  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKT24gaG9tZSByb3V0ZXJz
IFVCSSBpcyBvZnRlbiB1c2VkIHdpdGggVUJJIHVuYXdhcmUgYm9vdGxvYWRlcnMuIEluIHN1Y2gK
Y2FzZSBhbiB1YmluaXplZCBpbWFnZSBuZWVkcyB0byBiZSBjcmVhdGVkICYgZmxhc2hlZC4KClRo
ZSBwcm9ibGVtIGlzIG1hbnkgc3VjaCBib290bG9hZGVycyBhcmUgcG9vcmx5IHdyaXR0ZW4gYW5k
IHRoZXkgZG9uJ3QKZXJhc2Ugd2hvbGUgZmxhc2ggKHBhcnRpdGlvbikgYmVmb3JlIHdyaXRpbmcg
YW4gaW1hZ2UuIE9ubHkgcGFydCBvZgpmbGFzaCByZXF1aXJlZCB0byBmaXQgbmV3IGltYWdlIGdl
dHMgZXJhc2VkLiBJdCByZXN1bHRzIGluIFVCSQpjb21wbGFpbmluZyBhYm91dCBmbGFzaCBnYXJi
YWdlIGNvbnRlbnQsIGUuZy46Cgp1YmkwOiBhdHRhY2hpbmcgbXRkMgp1YmkwIGVycm9yOiB1Ymlf
YXR0YWNoOiBiYWQgaW1hZ2Ugc2VxdWVuY2UgbnVtYmVyIDE2NDYxNjE5OTggaW4gUEVCIDExOSwg
ZXhwZWN0ZWQgNTI0NTAzOTgzCkVyYXNlIGNvdW50ZXIgaGVhZGVyIGR1bXA6CiAgICAgICAgIG1h
Z2ljICAgICAgICAgIDB4NTU0MjQ5MjMKICAgICAgICAgdmVyc2lvbiAgICAgICAgMQogICAgICAg
ICBlYyAgICAgICAgICAgICAxCiAgICAgICAgIHZpZF9oZHJfb2Zmc2V0IDIwNDgKICAgICAgICAg
ZGF0YV9vZmZzZXQgICAgNDA5NgogICAgICAgICBpbWFnZV9zZXEgICAgICAxNjQ2MTYxOTk4CiAg
ICAgICAgIGhkcl9jcmMgICAgICAgIDB4MWViMjg5OTQKZXJhc2UgY291bnRlciBoZWFkZXIgaGV4
ZHVtcDoKdWJpMCBlcnJvcjogdWJpX2F0dGFjaF9tdGRfZGV2OiBmYWlsZWQgdG8gYXR0YWNoIG10
ZDIsIGVycm9yIC0yMgpVQkkgZXJyb3I6IGNhbm5vdCBhdHRhY2ggbXRkMgoKVG8gZml4IHVwIHN1
Y2ggZmxhc2hlZCBpbWFnZXMgaXQncyByZXF1aXJlZCB0byBpZGVudGlmeSB0aGUgZW5kIG9mCnVi
aW5pemVkIGltYWdlIG9uIGZsYXNoIGFuZCBlcmFzZSByZW1haW5pbmcgYmxvY2tzLgoKSWRlYSBv
ZiBleHRlbmRpbmcgb24tZGlzayBVQkkgZm9ybWF0IHRvIG1hcmsgZW5kIG9mIHViaW5pemVkIGlt
YWdlIHdhcwpyZWplY3RlZCwgc2VlOgpbUEFUQ0ggUkZDIDIvMl0gdWJpOiBhZGQgc3VwcG9ydCBm
b3IgVUJJX0VDX0ZMQUdfRVJBU0VfRlJPTV9IRVJFCmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5v
cmcvcHJvamVjdC9saW51eC1tdGQvcGF0Y2gvMjAxNjEyMzAxNzExNTEuMTM0NDgtMi16YWplYzVA
Z21haWwuY29tLwoKVGhpcyBwYXRjaCBpbXBsZW1lbnRzIHN1cHBvcnQgZm9yIGEgc2ltcGxlICJF
T0YiIHRleHQgY29udGVudCAoYmxvY2spCmFwcGVuZGVkIHRvIHRoZSB1YmluaXplZCBpbWFnZSBp
bnN0ZWFkLiBJdCBkb2Vzbid0IHJlcXVpcmUgY2hhbmdpbmcKb24tZGlzayBmb3JtYXQgYW5kIHN0
aWxsIGFsbG93cyBzaW1wbGUgaW50ZWdyYXRpb24gaW50byB1YmkgY29kZS4KClNpZ25lZC1vZmYt
Ynk6IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KLS0tCiBkcml2ZXJzL210ZC91
YmkvYXR0YWNoLmMgfCAxOSArKysrKysrKysrKysrKysrKysrCiBkcml2ZXJzL210ZC91YmkvdWJp
LmggICAgfCAgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL210ZC91YmkvYXR0YWNoLmMgYi9kcml2ZXJzL210ZC91YmkvYXR0YWNoLmMK
aW5kZXggYWU1YWJlNDkyYjUyLi44YmVhNGJiY2ZiZDkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRk
L3ViaS9hdHRhY2guYworKysgYi9kcml2ZXJzL210ZC91YmkvYXR0YWNoLmMKQEAgLTk1OCw5ICs5
NTgsMjggQEAgc3RhdGljIGludCBzY2FuX3BlYihzdHJ1Y3QgdWJpX2RldmljZSAqdWJpLCBzdHJ1
Y3QgdWJpX2F0dGFjaF9pbmZvICphaSwKIAkJcmV0dXJuIDA7CiAJfQogCisJaWYgKGFpLT5lb2Zf
Zm91bmQpIHsKKwkJYWktPmVtcHR5X3BlYl9jb3VudCArPSAxOworCQlyZXR1cm4gYWRkX3RvX2xp
c3QoYWksIHBudW0sIFVCSV9VTktOT1dOLCBVQklfVU5LTk9XTiwKKwkJCQkgICBVQklfVU5LTk9X
TiwgMCwgJmFpLT5lcmFzZSk7CisJfQorCiAJZXJyID0gdWJpX2lvX3JlYWRfZWNfaGRyKHViaSwg
cG51bSwgZWNoLCAwKTsKIAlpZiAoZXJyIDwgMCkKIAkJcmV0dXJuIGVycjsKKworCWlmIChlcnIg
PT0gVUJJX0lPX0JBRF9IRFIpIHsKKwkJdWludDhfdCBlb2ZbXSA9IHsgJ0UnLCAnTycsICdGJyB9
OworCQl1aW50OF90ICpkYXRhID0gKHVpbnQ4X3QgKillY2g7CisKKwkJaWYgKCFtZW1jbXAoZGF0
YSwgZW9mLCBzaXplb2YoZW9mKSkpIHsKKwkJCWFpLT5lb2ZfZm91bmQgPSB0cnVlOworCQkJYWkt
PmVtcHR5X3BlYl9jb3VudCArPSAxOworCQkJcmV0dXJuIGFkZF90b19saXN0KGFpLCBwbnVtLCBV
QklfVU5LTk9XTiwgVUJJX1VOS05PV04sCisJCQkJCSAgIFVCSV9VTktOT1dOLCAwLCAmYWktPmVy
YXNlKTsKKwkJfQorCX0KKwogCXN3aXRjaCAoZXJyKSB7CiAJY2FzZSAwOgogCQlicmVhazsKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3ViaS91YmkuaCBiL2RyaXZlcnMvbXRkL3ViaS91YmkuaApp
bmRleCA3YzA4M2FkNTgyNzQuLjIxOGM3ZGZlZGZjMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQv
dWJpL3ViaS5oCisrKyBiL2RyaXZlcnMvbXRkL3ViaS91YmkuaApAQCAtNzgzLDYgKzc4Myw3IEBA
IHN0cnVjdCB1YmlfYXR0YWNoX2luZm8gewogCXN0cnVjdCBrbWVtX2NhY2hlICphZWJfc2xhYl9j
YWNoZTsKIAlzdHJ1Y3QgdWJpX2VjX2hkciAqZWNoOwogCXN0cnVjdCB1YmlfdmlkX2lvX2J1ZiAq
dmlkYjsKKwlib29sIGVvZl9mb3VuZDsKIH07CiAKIC8qKgotLSAKMi4zNC4xCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
