Return-Path: <SRS0=Oqae=H2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CD2FC433DB
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Feb 2021 08:03:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8D5964DF5
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Feb 2021 08:03:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8D5964DF5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kgt7hbufoD6hLJcpX1KUgB77hurYvLyl2FGThrCEl+0=; b=z/Am6Yn5MHptQNewQRAxblSoz
	abOF+eJyvGZl1e7FUsP2BR/jtVXu/f/nFTMBnoqi/IG275a8zKTThAFK+kAemuROOrU1wkN3kzLgY
	Es4Cat7zvjyZnE0ZhtqlMCZzrfseX99bgYGu3N8FB4gHkfAam0NAmb/MUVuNQmOb3m7FQGwND3Llq
	9E6ZCp0s5zzMZS5lTm6+3ZU2N8GXZjf67PL3IVyoByi8ClEgtd8ryexyutocfjjplXEw0wwQ+NZII
	RL+eN2M3Rlmx+3e1cboi/qFAk9bnQ0MIxiae9j/pFbRciLVEB53uuLgN1/t7odbxgxPErW6JJQvl7
	lcfFoo9Lg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEp7h-0002Hw-G8; Wed, 24 Feb 2021 08:02:17 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEp7f-0002HK-Gh
 for linux-mtd@lists.infradead.org; Wed, 24 Feb 2021 08:02:16 +0000
Received: by mail-wm1-x335.google.com with SMTP id m1so985256wml.2
 for <linux-mtd@lists.infradead.org>; Wed, 24 Feb 2021 00:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z7NDGuuBGpr0KObSoWksVh7Rk18owzLbRpVZKUClVHk=;
 b=phSaXRdNBIcPj+25JdRCrfUfBMQMOTXde8Kv7aE5D7NUM4w/odWQeDNODqpanDm+Ji
 c+tQTl0IERpCPCtIITxwUmaPGU6kJoCZEatltPyS0zhTpVskoTJNXd+PkQWNZCTvisl9
 8EeMzXJLoFXID2nXlKpAYlPMrgXu4iagh8RIQ1EoGFGVJcoMyV3OZn3D1t3nuWZuEmpn
 Ny41u/6ZoQE90f2SIAaHSqaL9sA8poFnJw0IY80cceDubkCvERoStM/UAZO9Zl5igqL8
 qh48P5Hw2XO55yZJ5h7tU8Aq0FyM+wOXSHGxgbYnQdxSaMibVu5c7NVE9KvdBvtUJuCv
 UxdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z7NDGuuBGpr0KObSoWksVh7Rk18owzLbRpVZKUClVHk=;
 b=jqh8y+o5f3hknfmvU4n8mS65vHmeyIZDMAk2tGNBPgKlN35a/GVtt9Oe32aWpPIZQe
 7Vc0Fzrrtiz6ESClYiFLayjwl2uACoUWL1bC551tF48oYvnNyOI4qPhJ1uCC7WgZiNeo
 dsYJ9zidWTTIlReXXsFDWTXD0iGUNgaIfVUwV7MvOvW3JZcggZNVHqk7SfCTaUnZg8vO
 zfkd+s2z+a9IMzFnFMX7aPY8kD9e4Le9Gb3BIzeOYDkY9ADNidTpoRiwC+UwbTCdBKpj
 aixigdG6d3VTXSMM1rzM1cN3MyMbg0SNI1XBJVRKmFyVrUJltJu0QFyuC8UdounZ28s2
 iwGw==
X-Gm-Message-State: AOAM531wkT7uUuaEogUNSh2GzVpkYVrpMBv/tJD480pqJGicQvQz0i8C
 6KGny31j04SfKumucDICIaF8Op4BF0LhNW1J
X-Google-Smtp-Source: ABdhPJxj2t7kjl3+qt+9micKV54J8dXmVOUHc/fDxjZMccJim1Rw+YD+y4T3p+Lc1UcOzaLYVjee6A==
X-Received: by 2002:a7b:c20a:: with SMTP id x10mr2486521wmi.137.1614153734148; 
 Wed, 24 Feb 2021 00:02:14 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net.
 [88.1.105.170])
 by smtp.gmail.com with ESMTPSA id 2sm2098489wre.24.2021.02.24.00.02.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 00:02:13 -0800 (PST)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: f.fainelli@gmail.com, Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] nand: brcmnand: fix OOB R/W with Hamming ECC
Date: Wed, 24 Feb 2021 09:02:10 +0100
Message-Id: <20210224080210.23686-1-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210222201655.32361-1-noltari@gmail.com>
References: <20210222201655.32361-1-noltari@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210224_030215_607097_8FAAE772 
X-CRM114-Status: GOOD (  12.51  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGFtbWluZyBFQ0MgZG9lc24ndCBjb3ZlciB0aGUgT09CIGRhdGEsIHNvIHJlYWRpbmcgb3Igd3Jp
dGluZyBPT0Igc2hhbGwKYWx3YXlzIGJlIGRvbmUgd2l0aG91dCBFQ0MgZW5hYmxlZC4KVGhpcyBp
cyBhIHByb2JsZW0gd2hlbiBhZGRpbmcgSkZGUzIgY2xlYW5tYXJrZXJzIHRvIGVyYXNlZCBibG9j
a3MuIElmIEpGRlMyCmNsZW5tYXJrZXJzIGFyZSBhZGRlZCB0byB0aGUgT09CIHdpdGggRUNDIGVu
YWJsZWQsIE9PQiBieXRlcyB3aWxsIGJlIGNoYW5nZWQKZnJvbSBmZiBmZiBmZiB0byAwMCAwMCAw
MCwgcmVwb3J0aW5nIGluY29ycmVjdCBFQ0MgZXJyb3JzLgoKRml4ZXM6IDI3YzViMTdjZDFiMSAo
Im10ZDogbmFuZDogYWRkIE5BTkQgZHJpdmVyICJsaWJyYXJ5IiBmb3IgQnJvYWRjb20gU1RCIE5B
TkQgY29udHJvbGxlciIpClNpZ25lZC1vZmYtYnk6IMOBbHZhcm8gRmVybsOhbmRleiBSb2phcyA8
bm9sdGFyaUBnbWFpbC5jb20+Ci0tLQogdjI6IEFkZCBmaXhlZCB0YWcuCgogZHJpdmVycy9tdGQv
bmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYyB8IDYgKysrKysrCiAxIGZpbGUgY2hhbmdlZCwg
NiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5h
bmQvYnJjbW5hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMK
aW5kZXggNjU5ZWFhNmYwOTgwLi41ZmY0MjkxMzgwYzUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRk
L25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMKKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcv
YnJjbW5hbmQvYnJjbW5hbmQuYwpAQCAtMjY4OCw2ICsyNjg4LDEyIEBAIHN0YXRpYyBpbnQgYnJj
bW5hbmRfYXR0YWNoX2NoaXAoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCkKIAogCXJldCA9IGJyY21z
dGJfY2hvb3NlX2VjY19sYXlvdXQoaG9zdCk7CiAKKwkvKiBJZiBPT0IgaXMgd3JpdHRlbiB3aXRo
IEVDQyBlbmFibGVkIGl0IHdpbGwgY2F1c2UgRUNDIGVycm9ycyAqLworCWlmIChpc19oYW1taW5n
X2VjYyhob3N0LT5jdHJsLCAmaG9zdC0+aHdjZmcpKSB7CisJCWNoaXAtPmVjYy53cml0ZV9vb2Ig
PSBicmNtbmFuZF93cml0ZV9vb2JfcmF3OworCQljaGlwLT5lY2MucmVhZF9vb2IgPSBicmNtbmFu
ZF9yZWFkX29vYl9yYXc7CisJfQorCiAJcmV0dXJuIHJldDsKIH0KIAotLSAKMi4yMC4xCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
