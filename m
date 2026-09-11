Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FEFBC88E40
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Sep 2026 02:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:Subject:Date
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0Gx1MQU67cpzZbLbzciGISTU5Aq4TDRBfJe5rO/wAUc=; b=uJcvmU/gJmsyAo
	MbMqvpwgz8qe2mnHL+PAkK+9AJ0iuTh/sE+tffQ3EfEc4h9IbS1/gOmIDejJK204PR+05Z2vYNBJj
	8V20azK+LBNpcJwFUWFG4LQrRXLO31hNFChKK89+J1RJArn8lEBq3n56HOiL8UG8maiFAtpzhVAoN
	lIC6JmH4uGrSCR943RFXf2dgHQiKmIsZ20kd7WIrOeNO4RI+y/Mq2FG4zWNdxrFcmpuBJGB5+OcmD
	5W/OOSXOicaYfw3P3WIuwHxu0rgW9h3WyBksFVqXri0gOgzTdeo/wKIZH3V6lVRHAHBC67qm6sWSo
	o58WaILxs+l6+Hjyf6zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4qzM-0000000FiDY-2Nl5;
	Fri, 11 Sep 2026 02:27:40 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4qzJ-0000000FiCf-2N0T
	for linux-mtd@lists.infradead.org;
	Fri, 11 Sep 2026 02:27:39 +0000
Received: by mail-pz2-x10.google.com with SMTP id d2e1a72fcca58-8692a856865so379078b3a.2
        for <linux-mtd@lists.infradead.org>; Thu, 10 Sep 2026 19:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789093656; x=1789698456; darn=lists.infradead.org;
        h=cc:to:message-id:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XTZufsgY5jIPStSEuwAUSbEj1W0xSX3oqSzNV/+6YeY=;
        b=i9ero7pRQ1RmK+s5TqakIHOvr4u4HyCzmWLTKdaCTXyUdu9PeXrIbIZ3wB8iyb7GGX
         MWLywyRwEI3JiYobEBHvI/9PKbprDauSCbQpzd07kt+80n0vcZjxpChYWj6qyOdgh/ui
         bf/OceCJ8CuPKlrfsQyZofbSlvq7J7xd3CJP7m4lXneIducTarrV1NqjJ9glMZR/G/yH
         ycp7e9w/INGmJ5c3Uj5Wo7KKLbVG6Nrmb7QPsBMYPkf58hxvBVdNRYn4i11+DDfB6D5u
         MN032eb+UuGCI0a96grcmSQtJ5gYsHxU35XtZoc2B2tlkcTVHRLhRT7NlG2hLw2rq+gc
         gDCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789093656; x=1789698456;
        h=cc:to:message-id:subject:date:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XTZufsgY5jIPStSEuwAUSbEj1W0xSX3oqSzNV/+6YeY=;
        b=JcZsWk7Ig6Vsa9aXvRbOWbpRUx/vfiYGjP+eiu40MA24rcEV4xpAodj4VbA5smj9ti
         sGkswu6RXulw+FJlOf1UQJsEHxQw5J6jD45qEp7TjduhzP52KUsPb0140ogb0p85LR0l
         Ln92TBXHAqAPHr9l0BIw8OPQ4AZrJB7Kt6DEs6myPUeVn0H3YOOI8lM9aCpD+l/mVSMP
         RwGjhcnvCKkHbu5SYmtUPTerkzrbSik/zJa/mSoE/nLwy07o6axGEKUeXXyQEQEzWFYi
         AzOEd53ItnCjnv/f8ZC+ugsDJfoKLgjZshskENLkdUjLovVjQoxDIFggY7cV8rDy2LKF
         NuyA==
X-Forwarded-Encrypted: i=1; AKwUvBzmIM6CgGZZRr4nmXi1tL4mHjXWO/A4OGnC3h9B2XiKS/dabPgohS/vQ8tNr7sOHtJWHf4NpyPhr28=@lists.infradead.org
X-Gm-Message-State: AFuF++mdRFLcleotiA8bBtHU8GXivSJLKWbibDQFuC42BTEHsi0JVn8C
	P7O/I/FMVRxldIxT7dQZSQOGXE5zsuhoLZNtCTzsw4D3fk3Om1JYuq4h
X-Gm-Gg: AYBFou0nJcBJA376Rgvaiv8cu4XTNeOti73cMguYdkKCiGEPsxDHWXgxtZKG5Ps/hsG
	Te4Q91EKngU+652IwgUxvStH9MIqHcz9fA1ceSKnndi5m1lZg77F+9828HkeTR/AO/pUNHZVNs5
	XXpZg+TdKpLKmUn5ApmC6kiqOQTzw956QK8ML3ADvAbm2KmKWQKKk7Lj3klOmFF0lnEDnwCfvEc
	fUso/1mAOwEJJhlTJbkxA7+rVXTCKlZx4ukGBncUC3GjYuaZfAbJ3u3sKxPImOOcW11f8xd1PZN
	zIPbogVmLW4WVzFIwoh6b2sJI2XMmBilFIkhUfkYKqAtq9FtQTnYaer38mEsRlfSuJnX7yEfvYX
	3tnrZgsVgzYcCa3Rbi5jOWJO1Jx1kgpSqx3qJlrnA2rNQeOGEt2UPRPV6WJJzPvadQp11ekeAqB
	0fPAcJQdsNffnaEzi9vSQh2hUwL/RHb4ItL90AVNYLcQcgXr49XVepUivDyvAt71EcVpv2MraZx
	pY1JMyf8A==
X-Received: by 2002:a05:6a00:448c:b0:86a:5a9b:32a with SMTP id d2e1a72fcca58-86b31706dbemr3550402b3a.9.1789093655991;
        Thu, 10 Sep 2026 19:27:35 -0700 (PDT)
Received: from smtp.gmail.com ([185.151.146.146])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b286c3f70sm377098b3a.18.2026.09.10.19.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 19:27:35 -0700 (PDT)
From: "lichen.wang" <wanglichen9110@gmail.com>
Date: Fri, 11 Sep 2026 09:23:09 +0800
Subject: [PATCH 0/2] ubifs: add KUnit tests for scan and key helpers
Message-Id: <178909365090.247910.11265261850560199708.p0-of-2@gmail.com>
To: Richard Weinberger <richard@nod.at>, Zhihao Cheng <chengzhihao1@huawei.com>, linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_192737_610282_F03A1BD4 
X-CRM114-Status: GOOD (  19.65  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This series adds KUnit tests for fs/ubifs/scan.c and for the helpers in
fs/ubifs/key.h, so that the node parsing code can be validated offline
without an MTD device, a UBI volume or a development board.

Baseline:

  commit df2908090cda368b01ff43709f51890076c56157 ("Linux 7.3-rc2")
  git describe --always of that commit: v7.3-rc2
  (the describe string is that of the base commit itself; the patch
  commits sit on top of it, so a describe run at their tip reports
  v7.3-rc2-2-gaf7a59658 instead)

Motivation:

UBIFS has no test coverage for its on-flash parsing code: checking a
change to scan.c or key.h currently means bringing up a real NAND
device, a UBI volume and a board. KUnit makes the same checks run in a
plain QEMU boot within seconds, and it is the established in-tree
framework for this kind of unit testing, so the tests are reusable by
anyone touching this code.

Approach:

 - The tests are compiled into the ubifs module itself (ubifs-y) so
   that they can call the non-exported ubifs_scan_a_node(),
   ubifs_check_node(), ubifs_add_snod() and ubifs_end_scan() directly.
   No EXPORT_SYMBOL() is added to production code.
 - kunit_helpers.h builds a minimal fake struct ubifs_info with
   kunit_kzalloc(); only the fields read by the tested paths are
   initialised. The node length ranges mirror init_constants_early()
   in super.c, because a zeroed range means "fixed length" for
   ubifs_check_node() and would make the length checks pass for the
   wrong reason.
 - The node constructor fills the common header and payload first and
   computes the CRC last with the kernel crc32(), over exactly the
   bytes that ubifs_check_node() checksums.

Testing:

The whole suite runs with a single command:

  ./tools/testing/kunit/kunit.py run --arch=x86_64 --timeout=300 'ubifs*'

Two consecutive runs of the final tree reported 5 suites and 80 cases,
all passing:

  Testing complete. Ran 80 tests: passed: 80

with zero "not ok" lines in the KTAP output. The archived logs are
reports/round-1.md, reports/round-2.md, reports/ktap-20260910-220005.txt
and reports/ktap-20260910-220802.txt; they live in the project tree
only and are deliberately not part of this series.

The fake ubifs_info environment was additionally checked against the
real stack: a nandsim smoke test booted the same kernel over a complete
MTD -> UBI -> UBIFS stack, attached mtd0, created and mounted the
volume and wrote and read back a file successfully (SMOKE: PASS). The
report is reports/smoke.md and the raw serial log is
reports/smoke-qemu.log.

Known limitations:

 - ubifs_scan() and ubifs_start_scan() are not covered: they read from
   a real UBI volume through ubi_leb_read() and are exercised by the
   nandsim smoke test instead.
 - The tests build nodes in memory, so they cannot catch bugs in the
   on-media layout itself; they only pin down the behaviour of the
   parsing code for the layouts that UBIFS currently writes.

Notes:

checkpatch.pl --strict reports 0 errors for both patches. Each patch
also carries the generic "added, moved or deleted file(s), does
MAINTAINERS need updating?" warning; that reminder is emitted for every
patch that adds a file, and the new files live under fs/ubifs/, which
is already covered by the "UBI FILE SYSTEM (UBIFS)" entry in
MAINTAINERS ("F: fs/ubifs/"), so no MAINTAINERS change is needed.

Signed-off-by: lichen.wang <wanglichen9110@gmail.com>

lichen.wang (2):
  ubifs: add KUnit test scaffolding for scan.c
  ubifs: add KUnit tests for key helpers

 fs/ubifs/Kconfig               |  16 +
 fs/ubifs/Makefile              |   1 +
 fs/ubifs/tests/key_kunit.c     | 555 +++++++++++++++++++
 fs/ubifs/tests/kunit_helpers.h | 222 ++++++++
 fs/ubifs/tests/scan_kunit.c    | 980 +++++++++++++++++++++++++++++++++
 5 files changed, 1774 insertions(+)
 create mode 100644 fs/ubifs/tests/key_kunit.c
 create mode 100644 fs/ubifs/tests/kunit_helpers.h
 create mode 100644 fs/ubifs/tests/scan_kunit.c

--
2.43.0



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
