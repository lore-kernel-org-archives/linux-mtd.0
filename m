Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 654F2EB64DA
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 08:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ia5rXMFh7mVU0eQgo05xQYMaUKfxyU+74yJm/d41+CY=; b=a2RinQG/3DCv6M
	mCF9kx9qW/92cKFAqhXW08U6moK2qe5ydjtuHR0x0UXoiT7tIiZJKxP3teZO7Qs9/Hh5CdWGPtGpr
	GOab5VnZ0xR2Y/5cCJXtfV/rOIA+5trsH5Nqj+VMrlZVW/cneNR/PGf3tz9Ti+A2ekdXSDtjoj8br
	BPF6PV1svlV6S8A74sU+ct7uHNmIzNYkuXeLpnh3R5zrUV4KD6wDXSYEtOyQss8Mi9cyeYckrovin
	0WzLvfBhrtv04aeXSOGZrGb+pUVyNl8BWuxPCrGZppBC5klHAA3FktwkSaMOi1hkqksV1VqQ7yioM
	zeAMpT1i9UMzIUBjqVGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2ma-006RFj-2j;
	Wed, 19 Jul 2023 08:43:40 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2mW-006RDd-01
	for linux-mtd@lists.infradead.org;
	Wed, 19 Jul 2023 08:43:38 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4fb761efa7aso10790456e87.0
        for <linux-mtd@lists.infradead.org>; Wed, 19 Jul 2023 01:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689756213; x=1692348213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W5ddj1W5y2+i6mTn3M7drUHtyK+ci5gECjWGM0qKQwY=;
        b=KeLe0tNwrtT/eNtiMfPRtD7Sf1Mp8v336SZYHwqDA99RIx/xYuUFe817g1zrq7RU4F
         j+LtIoHZQccIw+2LLfUUvTbm6iCQc3akHJzJInJir95FprbM1gx35SX7zRbxKhWVt7/a
         WJUwc/6igXqHqrxkygVsIYuGLDWr0ecngy/bRhugPLsHmtVBV7kIzx0FSrjCk4TTtxm2
         6Im5dowkYZV/Ai8qjomuVXsBOBfA0HTm2HTWumfkUlyjzswmQWlHnSVb0GyO6ElzP9m3
         +WUYMrE77ylMLQwZT1CnUvg+EWhkhv7C87ErVwRyuoJIVyfhy0fIXBjwlR+/QKh4PVHK
         o0bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689756213; x=1692348213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W5ddj1W5y2+i6mTn3M7drUHtyK+ci5gECjWGM0qKQwY=;
        b=X+xsj4959QDytda4QREU8Lqlo9zFfRNV6h0NySLy6YfHTsFKY/N8VRiGPB7klx7md8
         ByLDm/YM1Wjtr/ZFFe6XhbnxBvdqjlfx/i8BxEFwdnLH5hX+IdGqWtpW0ms4rjUcA051
         C7P1Zi5ToblgWdFqH8mv/M+t2E2pNlCwyf0bfMsCCkd1MHLHvUrMaAkrSdfasieZR1Wp
         Z4t/DvoZ+zmBrmYFEshV/SWMHF1YktsgPgBTKuHfrOZQ63S+DfOew8mjrODHfe4p/4Iw
         VV2KbXVoDFmS/umcxdrzo94gJoMxfk7Xd9GyHfn2aoU0rbYkfACrb7EH1JFy77tvDh9K
         LdJQ==
X-Gm-Message-State: ABy/qLajnVB+H6t7ZcmL9uZ59yy/5vychSn+udinVAnR7m2Nu6kRhjr4
	IG6yhBgRGTMUb85LxgERv38=
X-Google-Smtp-Source: APBJJlFV6fQ9CrXqgJmoMYdMvkONCnphDRXSCFFa7f5kg5qb4qp6iLCA/wq/N+SJHL9KN5Pq54S+bA==
X-Received: by 2002:a05:6512:348b:b0:4fb:8616:7a03 with SMTP id v11-20020a056512348b00b004fb86167a03mr10860772lfr.4.1689756212434;
        Wed, 19 Jul 2023 01:43:32 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id h18-20020ac25972000000b004fdc0e37ecfsm837717lfp.227.2023.07.19.01.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 01:43:32 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
	Kamal Dasu <kamal.dasu@broadcom.com>,
	linux-mtd@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2] mtd: rawnand: brcmnand: propagate init error -EPROBE_DEFER up
Date: Wed, 19 Jul 2023 10:43:24 +0200
Message-Id: <20230719084324.14799-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_014336_066736_38BBD71E 
X-CRM114-Status: GOOD (  12.65  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKTVREIHN1YnN5c3RlbSBt
YXkgcmV0dXJuIC1FUFJPQkVfREVGRVIgaWYgc29tZXRoaW5nIGlzbid0IHJlYWR5IHlldC4KSXQn
cyBpbXBvcnRhbnQgdG8gcGFzcyB0aGF0IGVycm9yIHVwIHNvIGRldmljZSB3aWxsIGdldCBwcm9i
ZWQgbGF0ZXIuCgpTaWduZWQtb2ZmLWJ5OiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2ku
cGw+Ci0tLQpWMjogQWRkIG9mX25vZGVfcHV0KCkgLSB0aGFua3MgTWlxdWVsIQotLS0KIGRyaXZl
cnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMgfCA0ICsrKysKIDEgZmlsZSBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9i
cmNtbmFuZC9icmNtbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5h
bmQuYwppbmRleCAzOTY2MWUyM2Q3ZDQuLjAzNzY0YjU4OWVjNSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYworKysgYi9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCkBAIC0zMjQ1LDYgKzMyNDUsMTAgQEAgaW50IGJyY21u
YW5kX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYsIHN0cnVjdCBicmNtbmFuZF9z
b2MgKnNvYykKIAogCQkJcmV0ID0gYnJjbW5hbmRfaW5pdF9jcyhob3N0LCBOVUxMKTsKIAkJCWlm
IChyZXQpIHsKKwkJCQlpZiAocmV0ID09IC1FUFJPQkVfREVGRVIpIHsKKwkJCQkJb2Zfbm9kZV9w
dXQoY2hpbGQpOworCQkJCQlnb3RvIGVycjsKKwkJCQl9CiAJCQkJZGV2bV9rZnJlZShkZXYsIGhv
c3QpOwogCQkJCWNvbnRpbnVlOyAvKiBUcnkgYWxsIGNoaXAtc2VsZWN0cyAqLwogCQkJfQotLSAK
Mi4zNS4zCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
