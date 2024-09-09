Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A15D1CE7AB0
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 07:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R2vJNS8st8YTadAwJcTnGaY05xe0gxJtF+ugXpwQ/XU=; b=bH5FYcSkLfNVsm
	BVpRO4NARIDBTBu2Y5S8k/7ufVrl7qazqmU1izHm/MyPNf8UnlCUErdl+plClNytaQcc75rilOzQK
	+/ociqZLigWtvDMzmAGW2z2vPGaI3yLaRt5oZYvxw5oZqsKdPAcMe6rU28puX+yngaEK5rdF+uqZe
	VmIPZtPY6iD7Yr0jWRAswjS3V1dXt1OC4rDvnfVBuCAHSHHv2p5fBdElWER2JoXy158bi2dJwuxQz
	tnV8rngZAia7AarHS/1RAbCpdQ4dqlW/pWcbE+LgURfK06+jN71nDhrJ55tlL4DFPcVF40tZCEH+P
	lDbyiMiOUHNvcCCE+aOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZHd-00000000x3I-1ZfW;
	Mon, 09 Sep 2024 07:58:01 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZGv-00000000wOd-3J3I
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 07:57:23 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-374c1963cb6so2436272f8f.3
        for <linux-mtd@lists.infradead.org>; Mon, 09 Sep 2024 00:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725868636; x=1726473436; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=diK2vfMDlJNUyXW9lcHoHKMejPsgQZ2jk7i/6JqtmLQ=;
        b=iSvfzjgghCMSSJksNZVRGOXoyvIXrcKx1Jz5fu4+ColET7o/U1D/lg7S64Cq5YGhQQ
         C3PiP1pe0iatP7ACdWDy2IdQE5qd/kOVQMySgOxnCLnxBTrBGVuWGIx5geGiHOy1xDGm
         obV/pxhzR0824lR65QPVXEXv5GYj+IOS3QcTIzYrf7dcPgPuSfAYmDiRs2VHFCoXJPei
         P/w8dIbykqivSWhppzR0AOHm2P+oojIuRgfh5h8B7yDXWSsz0qrYrzuxf2lYHSCeDlRz
         K5ayjwG8ncOt/FarxY3eKOyFHHjQ17gZu2mjTz1wt1+tsC+pj6ALwJQj/aDcfpaB1007
         LIuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725868636; x=1726473436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=diK2vfMDlJNUyXW9lcHoHKMejPsgQZ2jk7i/6JqtmLQ=;
        b=PF4t5A2xxFbZimkKl1k844EOxKlEOpQ1byltL8gfivjpre4HyGNctNkqFjAekAWg3M
         JQ4gl/QbkqCeM5bmC1tUVQ9cfD4IFJKcznyyn73GOTNmilMoX/E/rW4X2U5Z2dI6UgCx
         uEdYvnf8N1DqufkJDhfMqwHR4BJRbyGsYxzV5trBhBI/cWU6+HOzFSrZlyBZjde8xxZK
         igNUXXeklenVtAeXOsJk/XC62NO7Gh+tYbbcWL7omUnFWOruxXEItvceNgcdrKeBUl52
         3WVOTVcStdqXKnFbzb5lBa8SyE52jpbXMkmErF3FzMVuXJnW3VXsEo5dTz/EEnYag9Ny
         11+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVvGfCpzoNQmUZcz5yww5mwncEnH3OF20emCk9yRjKrd+CTQ0N/ExS8TysSiOcb+n3cW9FkoAClRlM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0QN26RRD/dezFjxDhNWE6PfWh7q2il7taMKW2K0330GzFtjWT
	0pPtO+fkqk/fl9+5C1WikswfXHXTDf7HQKFEnutBKXbwN914v06B
X-Google-Smtp-Source: AGHT+IFme0X5nXLgn/ucuf8q8ansjRE1zBSf1qUsO6JYCVp2iHcyiqIaQ+1W/AW6ZFOhV/STuqOK5w==
X-Received: by 2002:adf:fe84:0:b0:371:8e3c:59 with SMTP id ffacd0b85a97d-378895c2578mr7417099f8f.5.1725868635798;
        Mon, 09 Sep 2024 00:57:15 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895675b7esm5303001f8f.50.2024.09.09.00.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 00:57:15 -0700 (PDT)
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
Subject: [PATCH RESEND v2 19/19] prandom: Include <linux/percpu.h> in <linux/prandom.h>
Date: Mon,  9 Sep 2024 09:54:02 +0200
Message-ID: <20240909075641.258968-20-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909075641.258968-1-ubizjak@gmail.com>
References: <20240909075641.258968-1-ubizjak@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_005718_188374_5705F749 
X-CRM114-Status: GOOD (  10.79  )
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

The circular dependency was removed in xxxxxxxxxxxx ("random: Do not
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
2.46.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
