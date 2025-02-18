Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16EF1C021AE
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Feb 2025 11:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LKINWgh9WlBPWA10xkIXenbUbKOPfkPUjgl4/KzlW+E=; b=dj49JqRWj9zdvu
	cruVj1cWjmBJ/wY4rV2YUOqm6g3ozfa/yLF2B0aHWgqY0X9kXjTHs9okx1qgtVg1peGxKOjknvdvo
	PgbBbougeaTf3o0vl9L1BCUmSRw5Gm6wrN1ASZ38fwHNhtHFju6p5eFFufTejaSB7GO+fTABoOddI
	zkr2iFWeS7ZyszwJ7WRVurNWzxl3sxTd+910P2UHX+fR8vaLScQAvIIzULB0Yl/5V2MBhloUFEr16
	nuNhiAqo8GSqrDE8rT6xJJbzkL/sauSI16zDIpff1ZEdr/qbsSNJf+n58BlLHImi9r0fgPv/6Wfv0
	A8G5Kq85aDkFzO+YVTBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkMBy-000000082Ve-12QL;
	Tue, 18 Feb 2025 11:55:10 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkLpF-00000007yKk-2jyt
	for linux-mtd@lists.infradead.org;
	Tue, 18 Feb 2025 11:31:42 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-22128b7d587so36721385ad.3
        for <linux-mtd@lists.infradead.org>; Tue, 18 Feb 2025 03:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739878301; x=1740483101; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qrXuYBkO1ks36gosboT7AvQDBBvKi8Im7E6XzgE1Jmk=;
        b=OXapKbKaa19hxs/9qMOpeTyyWcqVnq+Ci3LA85ng4LzjOEvn66Jad3rP4pKECdugpX
         v5o/vaVn7Fs+47QapAPw+iUc0C8K+fswZHQYpxFAuXzaxIIJT0XuAhipmObO8rYiNbL5
         XdncpgtqLP/rqmVoqcnopkrSDRld4BhwtvW2RYTzCn24wTshZsm006CkgB5rVhv1rf0H
         ZHn+dAw19/OY8fvwgUVFx/TDJCWvVoeKzxh11PK1Mu6OCMm7tVOrfwjmuU7kCQHXwyW7
         RN7K6pLVe7vXZMUydMVHkBcjUWY0s7MPhHPqWKrQlCC+yFRS77XXy4YHMkQ4saFLRvlI
         HIXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739878301; x=1740483101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qrXuYBkO1ks36gosboT7AvQDBBvKi8Im7E6XzgE1Jmk=;
        b=uUUD+yCv8F0bJc+E/Wk1egSwHS/zO8o9nXwvHlfBYPdVVFBg9fY3Zizj0o0hk8oEYL
         OeEJIp8zHhN6N+8GAodzj3nuMb7Wg1vQuC1BbkEkayW/l+/glJuGWOfTQEdP++bsM2i1
         PpdBd7/Yqy7q4bZ83VYluWxiG9BwrNO8d6ZOKsO3U2kLCGTyJ/3ya78BboMMzC7GhmfH
         k68iih3eHRz71QPFYUce17F8WVaEuchtSVh+I8SPNbxog5lSH1iAB5MERN2kXymzl5q5
         zz6y3tF+epLhR+kF34DVBkiY0qR+42n3KATwu9ZhifUCKUOY5c2NDO6KUcCc7GEnaSOf
         mTyg==
X-Forwarded-Encrypted: i=1; AJvYcCWaagrI6Dwy1AQYvgj1hTlJxey7RICvzJRIRH1X7rityTv/QIfP1tqtctYMnGUBYrm8QUYnR7deBiM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwCRjZInGgi5v9dHPwBF0rAoyIIZWvmdhbUOs0lDrVMfR7L5Az0
	FEHdvpQhcEM+0BdGw3xc/iNYyhAZaJV4LaOLa5X2V1gKcIRpPZiS
X-Gm-Gg: ASbGncv1b2bZVZE7zo15uVS6vxTH3sA1gajZWdKhFenlfnlKMclhdIi4meMNr+MDsWc
	tEFfNP8bHsRmHyxay37ANopr/24ZSMuYCLvJFWDYo6OBQLoM7z6lPN5Miaw3ISdWP9N4tmgq3Ff
	GtoTa+JPs0kTcphyagKbn5CKR2Ast5Q1bOgH6MqjsHBAkO42oaSMGeEhS7lC4iH2z94hn13p5gE
	TvcaPdPIhwjfC+ybtHDD5Ajus8TMVuKa5ZEUs4P8C+VKyvwUTTjE7ODEPsK58/nUbeCSgb6UWD8
	ORvnJasgXaVgGcnrIMOPe0XbRwmGGQ==
X-Google-Smtp-Source: AGHT+IGM+9n0ArQKcxFEA1Dd4J2EY6rNFGa0M97eh/KVd+HOw3nmCeyAgULbw5gkSgLDEtJtFT6Pmg==
X-Received: by 2002:a05:6a00:14cc:b0:730:75b1:720c with SMTP id d2e1a72fcca58-732619019d6mr19188764b3a.23.1739878300400;
        Tue, 18 Feb 2025 03:31:40 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:e94a:c6e7:6507:f007])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73242546835sm9876661b3a.35.2025.02.18.03.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 03:31:39 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: david.oberhollenzer@sigma-star.at
Cc: chengzhihao1@huawei.com,
	raj.khem@gmail.com,
	linux-mtd@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 mtd-utils 3/4] configure.ac: Add a check for execinfo and backtrace
Date: Tue, 18 Feb 2025 08:31:22 -0300
Message-Id: <20250218113123.1956575-3-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250218113123.1956575-1-festevam@gmail.com>
References: <20250218113123.1956575-1-festevam@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_033141_690040_556363FB 
X-CRM114-Status: GOOD (  11.84  )
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
Changes since v1:
- None.

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
