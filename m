Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB692E77180
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Dec 2024 00:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=59a+z9bH91iCXE42aKCscFXPuXT9UrKZ58qdA/rPXt8=; b=NAAcA+094V/jgs
	Dx/8+vsLpjYROjZd7OQPcgcXIhXxBJ/2UWjjzu2PzXFu+3L09mH4s0SvsNcvMbHGifZEAYHlP1ym5
	uyDbvDz6FUq+UZzP6E3UbxaJ0yv+G6N95qNgYcAfRlYAMFTcQi6SkNibqzk+nqhNTzGKaeqz7em71
	xZ2Y/xH4CD4wnPl9AHMi9VGN9zbfX/aH6/SMzWywzj/ofuyc7fprcO1bkYlVjSFaRYLP12VRAuCYu
	Cq5/Ltusbh+kBdCiAC3S1mien4GCOdiGAJQ4QJr85PttKy8psO8roQbQRZxxxzcWzoe7pZoUjbCkk
	C45P9OTz00jFgQwgWq/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKnmd-00000009ej2-1XUV;
	Tue, 10 Dec 2024 00:07:23 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKnmb-00000009ehD-0CGl
	for linux-mtd@lists.infradead.org;
	Tue, 10 Dec 2024 00:07:22 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2ffd6b7d77aso58472151fa.0
        for <linux-mtd@lists.infradead.org>; Mon, 09 Dec 2024 16:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733789238; x=1734394038; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m/0WTJFmx30o9gQF+pM6xrDy+wizMbs67uq40FZ9DWg=;
        b=gspjuwUnLEmGRWWV8+BGAeLH9hZadkHyvmTNqnZEhrT+pMNdfFTSbTak9m3yKYXsp4
         YiQ6kokVEx5vxVuxaRhUTUdRszXDRNiiJ0GUJnCMZPxgL/zVliMAfS16Bf8QrZofCTIu
         xmsPQAVYro+H2Yv/EUQqa413rfy4YFSOjONsUB404WE9W4fofyTQxst2K2L5B72VCJne
         3M9jmt8Cyls2WsKEUTLTk8jgCy0OftJkCSACPT/Ns7Didl+JXPNptocnC5QEpsm74okg
         DMVU9AokkG0he0JIH126Medhe6xeSA4PJ5tMYA9fXqJ3+AYkI7N6JrjwMzVMajsHIvHm
         SHKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733789238; x=1734394038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m/0WTJFmx30o9gQF+pM6xrDy+wizMbs67uq40FZ9DWg=;
        b=igjr2wMp7VdBxHpc5Iy9ZsFyIarlDO2DfhFCfmQ0dr1VKxlXK3/RlfOD4E8gOLjhD9
         zEGdzPu2fppvYGpyYBCbJiRCIg5W2k+wQQ4RNKVI3UcAjqxNpJ6usTUlbsTxzJwCrlxA
         uV8jmDzoPK8PrOI6hBb1eSGAIeHVtsAiERZgV5D3ij35f+u62zWZjVTUkFFYnd7/yYgM
         Vru5RLMJswCAlUlKv5hLUAYV1VUSlS67TlMsTa6w6O/wlfkGrQ4wPIThUdjZjI7xQc6O
         BEkP7ZEhiS6pzc17qNMSkS/BP3G6QZuSXWxcWgayOAoHbW7HGWmNoSe6rTnTch0y2Nco
         6sfw==
X-Gm-Message-State: AOJu0YwtI76JnvjVDbTbZlJz10m9nvRMSANTqcfOZsO3U2fjFO4F+1kP
	g1nqn0rWQl2BS6hdluS40lWealvh5scUtho9QWOamZX+wKLFWyPIz+EMf6/ninc=
X-Gm-Gg: ASbGncsw8AkTjRWwiwEGwzLS1ludGK/77B1lnVmqCRaGRDsyLwQhkYMheozGuPFAG91
	oOZdkj6ufSf//rwDkd4GK8NIlEKnCDRFSl2y0JkacL/ob7XBh3fbF+A4Ek7OdXqOuWqovPVecBh
	Ply6bWXjX9ziPtF7VwO+7PeUjmSo/c3p4BSeEHOHTy1LcHVGRrYnjBE1WBgYcdD/k9lQwwBkC8U
	MaKcFMFlBjnWe37Uxc6nmZvNLndLgu1Or8kQ7lCmW4hw2c1zSJLdhxETTgheJbXHC7Wk+Z1ATMh
	2BN7Lv8A8JCMz0nLKLXBW79va0fMcQYL9THy
X-Google-Smtp-Source: AGHT+IE16du8Iu855zHfMnlMUKlc249pFG+hsLHUCHRajGrgQgJS9XBi74GWd1R1U+1MCrQIyNiOEA==
X-Received: by 2002:a2e:9fc9:0:b0:302:183d:199d with SMTP id 38308e7fff4ca-302183d1dbamr30236461fa.18.1733789238295;
        Mon, 09 Dec 2024 16:07:18 -0800 (PST)
Received: from astra-student.rasu.local (109-252-122-202.nat.spd-mgts.ru. [109.252.122.202])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30227fa251bsm3300381fa.26.2024.12.09.16.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 16:07:16 -0800 (PST)
From: Anton Moryakov <ant.v.moryakov@gmail.com>
To: linux-mtd@lists.infradead.org,
	chengzhihao1@huawei.com
Cc: Anton Moryakov <ant.v.moryakov@gmail.com>
Subject: [PATCH mtd-utils] ubi-utils: ubirsvol: Fix integer overflow in ubirsvol.c
Date: Tue, 10 Dec 2024 03:07:26 +0300
Message-Id: <20241210000726.798402-1-ant.v.moryakov@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_160721_078075_DF8857A5 
X-CRM114-Status: GOOD (  10.61  )
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
IGV4cHJlc3Npb24gJ3ZvbF9pbmZvLmxlYl9zaXplICogYXJncy5sZWJzJyBpcyBhIHN1YmplY3Qg
dG8gb3ZlcmZsb3cgYmVjYXVzZSBpdHMgb3BlcmFuZHMgYXJlIG5vdCBjYXN0IHRvIGEgbGFyZ2Vy
IGRhdGEgdHlwZSBiZWZvcmUgcGVyZm9ybWluZyBhcml0aG1ldGljCgpDb3JyZWN0aW9ucyBleHBs
YWluZWQ6ClRoZSBmaXggZW5zdXJlcyB2YWx1ZXMg4oCL4oCLYXJlIGNoZWNrZWQgYmVmb3JlIG11
bHRpcGxpY2F0aW9uLgpBZGRlZCBjYXN0aW5nIHZvbF9pbmZvLmxlYl9zaXplIHRvIGxvbmcgbG9u
ZwoKVHJpZ2dlcnMgZm91bmQgYnkgc3RhdGljIGFuYWx5emVyIFN2YWNlLgoKU2lnbmVkLW9mZi1i
eTogQW50b24gTW9yeWFrb3YgPGFudC52Lm1vcnlha292QGdtYWlsLmNvbT4KCi0tLQogdWJpLXV0
aWxzL3ViaXJzdm9sLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS91YmktdXRpbHMvdWJpcnN2b2wuYyBiL3ViaS11dGls
cy91Ymlyc3ZvbC5jCmluZGV4IDA4NTRhYmMuLjczZDJmNjggMTAwNjQ0Ci0tLSBhL3ViaS11dGls
cy91Ymlyc3ZvbC5jCisrKyBiL3ViaS11dGlscy91Ymlyc3ZvbC5jCkBAIC0yMzEsNyArMjMxLDcg
QEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiBjb25zdCBhcmd2W10pCiAJfQogCiAJaWYgKGFy
Z3MubGVicyAhPSAtMSkKLQkJYXJncy5ieXRlcyA9IHZvbF9pbmZvLmxlYl9zaXplICogYXJncy5s
ZWJzOworCQlhcmdzLmJ5dGVzID0gKGxvbmcgbG9uZyl2b2xfaW5mby5sZWJfc2l6ZSAqIGFyZ3Mu
bGViczsKIAogCWVyciA9IHViaV9yc3ZvbChsaWJ1YmksIGFyZ3Mubm9kZSwgYXJncy52b2xfaWQs
IGFyZ3MuYnl0ZXMpOwogCWlmIChlcnIpIHsKLS0gCjIuMzAuMgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
