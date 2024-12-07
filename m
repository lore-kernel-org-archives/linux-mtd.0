Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A238E7717B
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Dec 2024 14:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vpNhe4y09Xqmdb8yuHo4dRJCiuL72+dwShkE3GDXDSM=; b=g5CYd6HTVqc794
	iYQYmIxlMHKQl5vQC+DksGsbJ819ao5wxSgCIjdCVFfvzshK6b2qVQSIAWl/4XuLj49P8zqKJDNZl
	1UPYh38Lmh+1OGUpjhMZ3zW6pjpqYQgyXolZ9dLeH9w0Sm+gICRksMPh/1j1i/Jy1bq6Pkgh6NWOc
	Ik2DRT9bFq4LH0M+GVmCjVVDoTBPG9Y8/N5svwfOwi2VgXH65/YKq/QfqbFmkZI0MNyHuqcMf5lQz
	ZV4yQP1ywWAyWMTtSQ+JeHVn8z7gNLAlPazBfeiTM7t9tjw3nw3s0QhJrc/WN8v2xWd1B/lhbtr0E
	/nEOWfLTdih254FymphA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJveg-000000041Wm-0KsK;
	Sat, 07 Dec 2024 14:19:34 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJve4-000000041V0-2yDD
	for linux-mtd@lists.infradead.org;
	Sat, 07 Dec 2024 14:18:57 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-53e2baf3160so2287382e87.0
        for <linux-mtd@lists.infradead.org>; Sat, 07 Dec 2024 06:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733581134; x=1734185934; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WacOwFXFuO287Gta3CgDPTD8xJO9G5zWW+G8MYC/y6E=;
        b=NH9DOdfhQdL4NOyNDdn5yQNpmJnEsq0rvH6nzBRS1Wc4sFNVKmu2GbiXY4MAVmLXDu
         4/ioNCUaReUSMkcJ6XdUm/JwDIuDAm8dbxgGRSNaB6FCYwq4uZlAN9YIVUPbC77ZFRIF
         rhnJe61KFIJeMGofsV9FvMXpVkfKA6UhWFoBxVyo7qqzDRuSX73EHGdjLku5QdSFUMul
         /rX+1shkboH/UZRrHVwGWPOE75xsxVTmYLHuCHFWOfvpK9LVnniu2a7VdRO2o1H8SYFJ
         NoqsED9f1RrbdkLYJMwtHLOlEtsQeW4PzNh+baoTKO3BFbY7ByXL/SPhd4jagzk1oq7X
         X6qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733581134; x=1734185934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WacOwFXFuO287Gta3CgDPTD8xJO9G5zWW+G8MYC/y6E=;
        b=PqqtPeXXJr1IBOD5NxinxMtqMVTV0aIR+/PRpTFKq5d+nMVlGJVtlONToL8dqgL/FM
         ZK4vLeyeez5YN4kMOJGeEudUlvxgOSlmxB1wAZGyV00aulORZ65AdQrpMSX4vya/WH/q
         QlhjDqZD6iiAVf3SLTQGvMZbB/PooYjV0Q75fBW3opzDMRL+oFZYcFh2iY1HReSlD+K4
         nDt66zKyYbDEHB768xj+LdxbIAb17WOe4ok1BRlk0hrIzTNfu7VN6hbfs5KhUKT6YtPr
         3vRcLZ1n+rywNVLEk187R0mfKQq8xcsmgm9Yx4TAyI3ixpRIU5skSy/J0va88cskfu+b
         MIEQ==
X-Gm-Message-State: AOJu0YxZKb3W9DzrWRewofNmN63g35jzljK/QZsYMiOC6yDpdl/oBQxz
	8MaGIrHaQ0E6rOmHIqcR/DPjLp4imHM7xaFCStWC0HMC4fsap+EgeuLT/A==
X-Gm-Gg: ASbGncuPkT7FTKsWns2MhYgmB11pDtiR5RI4XGYL73suuBlcYIo4rn99umaLcJ7mk7f
	xEJkRG69zmLFl+uWno8w6EVYYuUXfzir/IRUUK4DZQehH5Uu7f7FEiyqSNt/6PoSpoymBSB2THG
	FngbNkMIrnmpYkp1YgGg86gxvS6wdCJiM3gKyoQg/E410uX3+oUYwTsxIU/jI170pTKMSGExHMz
	hBOzQFmyVKo3Wy9Da3ZQqdoVEvfJ22TQ5JwNTnpNfdddLYOOwEH88b3VyJLAZv6oL/MdSjmRuKH
	zwVMjJE6POU4BHLSKIEkKmF0lmkEM1KO
X-Google-Smtp-Source: AGHT+IEOfduWiUB8X/E7YEIwBH/W1jNaFzSGJu0vc7Vop+jHwpLgiOhDg1/AoaNL3orLxiJL/l65Hw==
X-Received: by 2002:a05:6512:1150:b0:53e:2978:d067 with SMTP id 2adb3069b0e04-53e2c2efb3amr3847546e87.49.1733581133272;
        Sat, 07 Dec 2024 06:18:53 -0800 (PST)
Received: from astra-student.rasu.local (109-252-122-202.nat.spd-mgts.ru. [109.252.122.202])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e229ba9fcsm786250e87.113.2024.12.07.06.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 06:18:52 -0800 (PST)
From: Anton Moryakov <ant.v.moryakov@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Anton Moryakov <ant.v.moryakov@gmail.com>
Subject: [PATCH mtd-utils] ubi-utils: ubirsvol: Fix integer overflow in ubirsvol.c
Date: Sat,  7 Dec 2024 17:18:55 +0300
Message-Id: <20241207141855.240376-1-ant.v.moryakov@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241207_061856_749194_175591CA 
X-CRM114-Status: GOOD (  10.27  )
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
YWluZWQ6CnRoZSBmaXggZW5zdXJlcyB2YWx1ZXMg4oCL4oCLYXJlIGNoZWNrZWQgYmVmb3JlIG11
bHRpcGxpY2F0aW9uLiAKYW4gZXhjZXB0aW9uIGNoZWNrIGZvciB0aGUgbmVnYXRpdml0eSBvZiB2
b2xfaW5mby5sZWJfc2l6ZSBhbmQgYXJncy5sZWJzIHdhcyBhZGRlZCwgYXMgd2VsbCBhcyBjYXN0
aW5nIHZvbF9pbmZvLmxlYl9zaXplIHRvIGxvbmcgbG9uZwoKVHJpZ2dlcnMgZm91bmQgYnkgc3Rh
dGljIGFuYWx5emVyIFN2YWNlLgoKU2lnbmVkLW9mZi1ieTogQW50b24gTW9yeWFrb3YgPGFudC52
Lm1vcnlha292QGdtYWlsLmNvbT4KCi0tLQogdWJpLXV0aWxzL3ViaXJzdm9sLmMgfCA2ICsrKyst
LQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS91YmktdXRpbHMvdWJpcnN2b2wuYyBiL3ViaS11dGlscy91Ymlyc3ZvbC5jCmluZGV4
IDA4NTRhYmMuLjg3Mjg2ZDQgMTAwNjQ0Ci0tLSBhL3ViaS11dGlscy91Ymlyc3ZvbC5jCisrKyBi
L3ViaS11dGlscy91Ymlyc3ZvbC5jCkBAIC0yMzAsOCArMjMwLDEwIEBAIGludCBtYWluKGludCBh
cmdjLCBjaGFyICogY29uc3QgYXJndltdKQogCQl9CiAJfQogCi0JaWYgKGFyZ3MubGVicyAhPSAt
MSkKLQkJYXJncy5ieXRlcyA9IHZvbF9pbmZvLmxlYl9zaXplICogYXJncy5sZWJzOworCWlmIChh
cmdzLmxlYnMgIT0gLTEpeworCQlpZih2b2xfaW5mby5sZWJfc2l6ZSA+IDAgJiYgYXJncy5sZWJz
ID4gMCkKKwkJCWFyZ3MuYnl0ZXMgPSAobG9uZyBsb25nKXZvbF9pbmZvLmxlYl9zaXplICogYXJn
cy5sZWJzOworCX0KIAogCWVyciA9IHViaV9yc3ZvbChsaWJ1YmksIGFyZ3Mubm9kZSwgYXJncy52
b2xfaWQsIGFyZ3MuYnl0ZXMpOwogCWlmIChlcnIpIHsKLS0gCjIuMzAuMgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
