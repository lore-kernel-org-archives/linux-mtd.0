Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD2AC021AE
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Feb 2025 00:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rhrboyRT05/qz/HvdZZE6VNujzF94gjwTOlM0KspGNM=; b=WAylMQM3AO/lWP
	8J01dkTM8MT973LtQPhJaIyh3FGuARLEZNGpesjA7sHwru2upGFvVuW+J5nVZ/ZDsh022PyFyWfaT
	j0yFpYmP/pu2ml1NzS2IjSWst1i/xYJEX68dEUssVV5eBVW9UIb7sJ1VB1wYJTILvwQfb6yE836K+
	DQ926ejqv6+3bJnoJ5qgz50DX96LwIGt3TbmWUmYf5S+ZbeGGmVvRF4+90P8ruGamczu5M7aFSJmg
	BdNNyVk2ERn7PBXBxC9RYEkhmtoxV5Ikn2f5v7XEl2GxtrMfT1EcWZdT5Oyd+72UzDhi2aWHIRcSc
	Qe8K2DNdWbAKHL9r8B+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkBH6-00000006JSn-0Pz5;
	Tue, 18 Feb 2025 00:15:44 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkBH3-00000006JRa-0u0Y
	for linux-mtd@lists.infradead.org;
	Tue, 18 Feb 2025 00:15:42 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2212a930001so39384385ad.0
        for <linux-mtd@lists.infradead.org>; Mon, 17 Feb 2025 16:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739837740; x=1740442540; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gjjcl9/es/6laHXF0dfxVFYG1GZB5ZhnhpV0I2NzVC0=;
        b=KyT/TrqZ/98zBhym0QMQ9UYxbyNzWJvpnVnvG8/6G9qZASLz1aMgVQYl31ncb1wCEZ
         rtPCRg/q3F3e7WmJrwgDfZWEn6/v0J7Dta7eYRcry8Wad+6VscXHb75jkYASAZHUiQiB
         GL+oq8D4pchDyDncVedhXm0BiK+G7f57yGh9X3ZRhW7LVe7F5fdm0AzvfsWDfJdVCwOB
         tyNkggKzrc9eJefQnqiVin3PQmaXy8izWtiz7BHSzMsGRTDxLDuyAW6i+UsCRNRCNtmR
         DQ886eA4zC0SBehwN/2m+5Rozb7ZIR5jMm0Gz1h+OxgMNVL+IvgJgTgC9NvEefFhMyz6
         DNSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739837740; x=1740442540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gjjcl9/es/6laHXF0dfxVFYG1GZB5ZhnhpV0I2NzVC0=;
        b=GV8o8LkZuJL+kB4lQY781MO0SZLto+GgldTZp+rEes2FT/ygD/ZV6zoayRLs//zrHi
         DVtlI13PIYnRfETSaTc86R3qT5kJlCTze3q8BqfpRBrfHHs7MqYJF0ecqkilsx3otNBF
         eXm0UZ3s9YfnNkUW67g+FbwtkQzYnjfv8BiGrUNg5+qJyAP4un6GYGpSACBxrn2pE18D
         oxiLhAd30ibnJ6ih7SqQwZzBG8Tabd8ai8+vnZpdHeBmgN0LCXkUyhZiBv8dC7fWCJ0m
         Bw4NT+fDkf8NVPuhtLaE+VYVnUsR7ZXHp4RpHCHpSIDY00zjOjeQiNWbhKD1b1nTTrjD
         WCrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqmPWNlqo7ZIAvyezdRk6VtLy0iPltFSronou+KsajNnCQwRJXgbc6VLVVIhljkY/oChU7Y8/h//4=@lists.infradead.org
X-Gm-Message-State: AOJu0YyGJMzF9hglYT8utRMKfB8rDF930VtOWloDau6uE3E85IELG1m9
	K7LeJQV+97cPJ6VlWmPNgsXckhNSDEu5RuOxCICHPSKJTnz20tAF
X-Gm-Gg: ASbGncv94fEPWim45AaqdPoo2vspQEAsvC1CGX95+Xq095bYpZVmQDkzLxVu856VLv2
	iz1Cg7hoI1jB1xalthHfNGEW61u8Spr9LcEQigkk7E2/MVuV2VnwPWtAOVrjzSxAb9eqSK6vtqS
	JqIPQtWyBDP1D/Q3A1XCKsFH8Pz4CFPn3Ak5QTT+vmW2hAlecLxdPC3c7FzPSJU7OEQYLF5CXWY
	gUAz6kuyIB5+907V8mkZfJ1AAep0uz4ro/64jyA2KgRw3ncej7ugqE2GT+2sdyjeVV9aPpP7vkt
	AjwyUSODPPCNQgKHkpoSBxbfhXzZcg==
X-Google-Smtp-Source: AGHT+IEhe/Opx93xdRHt0iJrYhgORUpLUPfjU0gwxZliHSHF/bpZkfRVAP59afVCeisAPckEaAhe8g==
X-Received: by 2002:a05:6a21:3992:b0:1ee:c8e7:2032 with SMTP id adf61e73a8af0-1eec8e72208mr384331637.19.1739837740297;
        Mon, 17 Feb 2025 16:15:40 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:e94a:c6e7:6507:f007])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7327eb20b98sm2554519b3a.147.2025.02.17.16.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 16:15:39 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: david.oberhollenzer@sigma-star.at
Cc: raj.khem@gmail.com,
	linux-mtd@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH mtd-utils 4/5] configure.ac: Add a check for execinfo and backtrace
Date: Mon, 17 Feb 2025 21:15:11 -0300
Message-Id: <20250218001512.1862030-4-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250218001512.1862030-1-festevam@gmail.com>
References: <20250218001512.1862030-1-festevam@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_161541_255466_1AB5B57D 
X-CRM114-Status: GOOD (  11.93  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

musl relies on an extenal execinfo library to provide backtrace
functionality.

Add support for it.

| /work/festevam/oe/poky/build/tmp/work/core2-64-poky-linux-musl/mtd-utils/2.3.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/../../libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/14.2.0/ld: ubifs-utils/libubifs/mkfs_ubifs-io.o: in function `dump_stack':
| /usr/src/debug/mtd-utils/2.3.0/ubifs-utils/common/defs.h:71:(.text+0x25): undefined reference to `backtrace'
....
| collect2: error: ld returned 1 exit status
| make: *** [Makefile:2959: mkfs.ubifs] Error 1

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configure.ac | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configure.ac b/configure.ac
index 2a79ba820fc0..65afb245d89c 100644
--- a/configure.ac
+++ b/configure.ac
@@ -238,6 +238,7 @@ if test "x$need_cmocka" = "xyes"; then
 	PKG_CHECK_MODULES(CMOCKA, [cmocka], [], [cmocka_missing="yes"])
 fi
 
+AC_CHECK_LIB([execinfo], [backtrace])
 AC_CHECK_HEADERS([execinfo.h])
 
 ##### produce summary on dependencies #####
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
