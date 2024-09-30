Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D7A5CE8341
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Sep 2024 13:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+QrJYhP6LZV6eBi7VhDXQJ0JJcZPtG4GYT5do7J0oQs=; b=eVghj7lHropeKu
	nCJ9GFJ2FMqaEKkzV0EyGTEkZnVly7Rxz0XtEG4nOzilPM7ApDrucFPlgAUNpNY509QSTVJAp2RCW
	o7SMBps+RPthxf1a+Nwh/iYZeQBRIFoVLPVaN6qwyPEAsVujRG4cWAa8Kf2cUC/OeyC+XPz4gKEnB
	2ywOK3fGY7LtDXu0QjChJAiR6PdQlhQxgn/Xwqu/eq8NTctSuPWmxL+WnhLnuoCN9Vl1KHDrRHMzH
	X++/eQX4FGJFbjY6LzwF6OJ9hOrqUJqZE++Evqio9JiuISxOJ872jzhUp6k/P+pnZVvjQgkPA5/Yv
	cmHuUdDB+SJ60wrmgpng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svGBq-0000000HEQr-3P5X;
	Mon, 30 Sep 2024 13:11:50 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svFei-0000000H57F-2JgF
	for linux-mtd@lists.infradead.org;
	Mon, 30 Sep 2024 12:37:39 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-42cd74c0d16so39965125e9.1
        for <linux-mtd@lists.infradead.org>; Mon, 30 Sep 2024 05:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727699855; x=1728304655; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b0+j8HZP1cVf+QQUDZOhjhaodRPqf5Kzd1FP1uUxc6s=;
        b=CM9w5aEMjlM7t8fgBiD/CvEQBxrtr+piED9KqsZEcJN50fassWY+a8QreHkkS1FfHA
         clh+HPSxnB5Ifj4HlRAX7PC3ap9If3REYi/19HbUSFxbeExfdObKoxOiU/eA/CGAk0SM
         vSFEZClEnT/Jl2Ommi8KVhWBcwz3Kbcdh7k8z0THvBC6sSOUdFU6JfVK5BIoIA3o4NmQ
         +unuHMJrJslxFgolfoFI9aOgwspdLl/7tznBwJAKQTimebKnyg7d4gWjV9Xyju00Oanf
         jXeoWxUDFGV+QOHhb3eQjVGKPlVXiWnMtFgcB4jjbeBxQgO/nyW8ERB5rtma7nUMW+KI
         M1FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727699855; x=1728304655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b0+j8HZP1cVf+QQUDZOhjhaodRPqf5Kzd1FP1uUxc6s=;
        b=l4pZWFSff57ytRaM5g8dZzvqZYirl52MVfrdsxw+0Z1h+h90kTYeYaPmiI0rIfQYj+
         jo7XT+6AtFLOnqdL7H/nIpCFEF8iLCsZgqfi/VRi8RTtzqmnnGoVzUPfweP8uKpJuBjO
         Funo0Q3iIsW8aHSauj/+s345p0fOd5Kki2QF6JbWIP7oEQg7yJG7C3MhfIe9SSLJ5reG
         LdctF3b9I4GfdB9DT7CDO5ZrQDBjBRDaKJx4sd+wKFF2XE9wYnYiW/q+Q/hxGQ+vHU6M
         eJjUrIEHbvgVx2qJK8ms1kh7VTLe8ca5rghOrc1vq/op1lmpACkxSg/otkAPGzXtNn/M
         iQhA==
X-Forwarded-Encrypted: i=1; AJvYcCXOgabyNo0ha+GWhAmP3vTCN03rWwxlZVNY9R083T6g4JgiNQHqLeFfL5u4z9HcnW+OMD4FoVpdbuM=@lists.infradead.org
X-Gm-Message-State: AOJu0YyjckkbxHst+q3IxAHNZ0nDSmagVj3ekJPfwXlG4k6FqdivMFB0
	4mMq3ui7W+LwL5tDhjzLa6z/kDlajVi81WBS2iZRQWMnYiXVi74Z
X-Google-Smtp-Source: AGHT+IHdC1cyaWvS05r5143QqcQIcUYzzrxVQfsNi8sq552bi8Bx4Z/Dm3LJ5ZgNcGYz44ssbU9Czw==
X-Received: by 2002:a05:600c:1da6:b0:42c:b187:bde9 with SMTP id 5b1f17b1804b1-42f584a2dd7mr90988995e9.30.1727699855019;
        Mon, 30 Sep 2024 05:37:35 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e96a52308sm149011355e9.43.2024.09.30.05.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:37:34 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org,
	linux-crypto@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-fscrypt@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	"Theodore Ts'o" <tytso@mit.edu>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [PATCH v3 19/19] prandom: Include <linux/percpu.h> in <linux/prandom.h>
Date: Mon, 30 Sep 2024 14:33:30 +0200
Message-ID: <20240930123702.803617-20-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20240930123702.803617-1-ubizjak@gmail.com>
References: <20240930123702.803617-1-ubizjak@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_053736_651081_6307D33B 
X-CRM114-Status: GOOD (  10.85  )
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

<linux/percpu.h> include was removed from <linux/prandom.h>
in d9f29deb7fe8 ("prandom: Remove unused include") because
this inclusion broke arm64 due to a circular dependency
on include files.

__percpu tag is defined in include/linux/compiler_types.h, so there
is currently no direct need for the inclusion of <linux/percpu.h>.
However, in [1] we would like to repurpose __percpu tag as a named
address space qualifier, where __percpu macro uses defines from
<linux/percpu.h>.

The circular dependency was removed in ddd8e37ebaa1 ("random: Do not
include <linux/prandom.h> in <linux/random.h>") and it cleared
the path for the inclusion of <linux/percpu.h> in <linux/prandom.h>.

This patch is basically a revert of d9f29deb7fe8
("prandom: Remove unused include").

[1] https://lore.kernel.org/lkml/20240812115945.484051-4-ubizjak@gmail.com/

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: "Theodore Ts'o" <tytso@mit.edu>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Kent Overstreet <kent.overstreet@linux.dev>
---
 include/linux/prandom.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/prandom.h b/include/linux/prandom.h
index f7f1e5251c67..f2ed5b72b3d6 100644
--- a/include/linux/prandom.h
+++ b/include/linux/prandom.h
@@ -10,6 +10,7 @@
 
 #include <linux/types.h>
 #include <linux/once.h>
+#include <linux/percpu.h>
 #include <linux/random.h>
 
 struct rnd_state {
-- 
2.46.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
