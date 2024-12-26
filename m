Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A9F0E7718E
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Dec 2024 13:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CdAO/ECQ1VhtGF8UTOuoEgh6Hg3xFbf0JheAhSK+3rQ=; b=vfvaZAM4kDmZvs
	ykYfQ/x+94gX37Gi2DI/kvX8WrNKuyob8wtpYLrR4Ynk3LqpTR25PoQGQZ7MgvJewtClwK52hHHXp
	wDlFkCinb6IAyVBcyD2rCKJF2TLISav+36BpbL7OH2yyIAer6inIlsk2T8gfw7uR1HlfZpqPSqclu
	sjqoWL98tp3Zyotx9E2LLftO1WCl6IpyrHAZqJVU7jwLorETM7/49bwyY2/h6jYJUWSbd15qFARDb
	wqdd2VypFhk76a2I57mwjBlyGG7ca0MSD+3r5/L6S38EcH5u5++turu74uoP3ADTp+UYsS7+7yEqz
	wtz8Pat+G/Y3SG/noAsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQoBP-0000000Fqkr-1JKg;
	Thu, 26 Dec 2024 13:45:47 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQoBK-0000000Fqk7-3aQ8
	for linux-mtd@lists.infradead.org;
	Thu, 26 Dec 2024 13:45:44 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-53e3c47434eso7041253e87.3
        for <linux-mtd@lists.infradead.org>; Thu, 26 Dec 2024 05:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735220740; x=1735825540; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VytgdRTfbuNH9Md9DqPU1Q455V115DdX+HATSZEp874=;
        b=JXfHdQBZ7VZSAoKA3fPzrxm5aGv8hun73BnZ3lOW+Xo7BF0MGp8yE1w2wOLmz9u+5E
         E1V8heRXv3+YjLPxYrV4KMtajamjqxRtNSPRPmDfKNfZtlbzmUqggoZwMj8S07IVo3WZ
         2or1t2vZALiJtJDMrH0V6JY3kL+jaxZKIhTZuI6MI5QiAGtfGgFrXdIsr3gJbbpsaG+3
         6P+AUnTkWoP47g5llLi7hBkCuNxF6d/MT+qTFpxyuLBspVkdUfRDnvLLFiZqDdeFnrW6
         2qR8pzrnF0TOChn4Y/q5XEUEbdH3wIBo8hbFw+Wq9uwFdmX+H//twdepY5Hp2zMoIxMJ
         43YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735220740; x=1735825540;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VytgdRTfbuNH9Md9DqPU1Q455V115DdX+HATSZEp874=;
        b=HG77q7NawZ4UboZ+0MshpufCun2RogtAELR5LeH7ZivkziUzJTZo0Of0+cKvjV69Nh
         bCZujlSkylnYvNqi0nWD2KrkTbHPtNywdrG5Rx+68Z5/I660gZ/fxbiLZZGPieKGtT7K
         v73MGdK3sT4PlyeD/fCewlJwfwvHXogTywiN266fnQWoQaUIt/pY4c4nXKSXLa/q5fT5
         o7G1jW2BS9KlHKrJiKAWzg+Qi3wkl4/YIvEpImx8ig4gfazJjFJaTA7szixrD6j+RJpE
         GsPrMixgMuLh7Uwzdq5LRfvT+BD3CSiXzE3ysfl/aVi/ifLNCEeeatfv6TZpOuN0pUZW
         QaSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbefMu5MpSLlKrdsIMolGa+h2soYYC4LuG9jyK6DZ3kJbj4C26t5+b/eiQlsPjMqZFqLg8vGQFR1I=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5+k/7uwFTu3I58XxOOZeOCl3g3y4H/XZsMeeJ/gDhSN1rgpVQ
	NDomwmxIMrFw3FA9m/gqaG2I1QYslxgMgWDWupjmXU+zMc12NVlL
X-Gm-Gg: ASbGncvW+qx3TJPAWGQQkzRYWSljwApyYpSJ7tMva7DHLEyrQ0veQU44jPVBwj2N6RX
	nliikxRFa/B+HQT32kp3VbX5d/84BhYEjrd3DS+BNY1+nTbO5cdL9v2R2ou3hpBFTMqIvkYtUz5
	kYmb7RbhAYxkqY47g2OWjg+o/blC39tSkTd3PNcEixZl+NjUWFWWvX4b19m1DzocZjI4167ZKbJ
	PuX/iEk+ZQFsnZ9Pj71sTumKbJJ312O/wwKVwdMW0LELcso0Kx+75/eYsW/48f+5axfbKJfM84J
	wxiQYn52EW+c3QBFBeV28duu1BMKluXuGqJ47iY=
X-Google-Smtp-Source: AGHT+IGdEO1uC2t3x4EUjHaZ4qcpMZrDfBIYcPCC2fgVr7+xfHihiFUYIaLOLRxsxeljRXp1Sc7qfQ==
X-Received: by 2002:a05:6512:3a84:b0:53f:8c46:42a6 with SMTP id 2adb3069b0e04-542295404abmr6735113e87.27.1735220739856;
        Thu, 26 Dec 2024 05:45:39 -0800 (PST)
Received: from astra-student.rasu.local (109-252-122-202.nat.spd-mgts.ru. [109.252.122.202])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f5d5asm2158854e87.45.2024.12.26.05.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 05:45:38 -0800 (PST)
From: Anton Moryakov <ant.v.moryakov@gmail.com>
To: chengzhihao1@huawei.com,
	linux-mtd@lists.infradead.org
Cc: Anton Moryakov <ant.v.moryakov@gmail.com>
Subject: [PATCH mtd-utils] nand-utils: fix integer overflow in nftldump.c
Date: Thu, 26 Dec 2024 16:46:00 +0300
Message-Id: <20241226134600.72548-1-ant.v.moryakov@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_054542_895919_3B9509BF 
X-CRM114-Status: GOOD (  12.18  )
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
IGV4cHJlc3Npb24gJ2kgKiBtZW1pbmZvLmVyYXNlc2l6ZScgaXMgYSBzdWJqZWN0IHRvIG92ZXJm
bG93IGJlY2F1c2UgaXRzIG9wZXJhbmRzIGFyZSBub3QgY2FzdCB0byBhIGxhcmdlciBkYXRhIHR5
cGUgYmVmb3JlIHBlcmZvcm1pbmcgYXJpdGhtZXRpYwoKQ29ycmVjdGlvbnMgZXhwbGFpbmVkOgpv
bmUgb2YgdGhlIG9wZXJhbmRzIHdhcyBjYXN0IHRvIGEgd2lkZXIgdHlwZSwgc3VjaCBhcyB1bnNp
Z25lZCBsb25nIGxvbmcsIHRvIGV4cGFuZCB0aGUgcmFuZ2Ugb2YgcG9zc2libGUgdmFsdWVzIOKA
i+KAi2FuZCBhdm9pZCBvdmVyZmxvdwoKVHJpZ2dlcnMgZm91bmQgYnkgc3RhdGljIGFuYWx5emVy
IFN2YWNlLgoKU2lnbmVkLW9mZi1ieTogQW50b24gTW9yeWFrb3YgPGFudC52Lm1vcnlha292QGdt
YWlsLmNvbT4KCi0tLQogbmFuZC11dGlscy9uZnRsZHVtcC5jIHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbmFuZC11dGls
cy9uZnRsZHVtcC5jIGIvbmFuZC11dGlscy9uZnRsZHVtcC5jCmluZGV4IDMwMzMyZmUuLjY5NjRk
MmMgMTAwNjQ0Ci0tLSBhL25hbmQtdXRpbHMvbmZ0bGR1bXAuYworKysgYi9uYW5kLXV0aWxzL25m
dGxkdW1wLmMKQEAgLTEyNCw3ICsxMjQsNyBAQCBzdGF0aWMgdm9pZCBkdW1wX2VyYXNlX3VuaXRz
KHZvaWQpCiAJZm9yIChpID0gTWVkSGVhZFswXS5GaXJzdFBoeXNpY2FsRVVOOyBpIDwgTWVkSGVh
ZFswXS5GaXJzdFBoeXNpY2FsRVVOICsKIAkJCU1lZEhlYWRbMF0uTnVtRXJhc2VVbml0czsgaSsr
KSB7CiAJCS8qIEZvciBlYWNoIEVyYXNlIFVuaXQgKi8KLQkJb2ZzID0gaSAqIG1lbWluZm8uZXJh
c2VzaXplOworCQlvZnMgPSAodW5zaWduZWQgbG9uZyBsb25nKWkgKiBtZW1pbmZvLmVyYXNlc2l6
ZTsKIAogCQkvKiByZWFkIHRoZSBVbml0IENvbnRyb2wgSW5mb3JtYXRpb24gKi8KIAkJZm9yIChq
ID0gMDsgaiA8IDM7IGorKykgewotLSAKMi4zMC4yCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
