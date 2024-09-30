Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBAA9CE8341
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Sep 2024 13:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=alD+S+R4q7wDGw5GpcMqhBtDFYxgH+RgfXkyCJnRkFg=; b=J+Ih3H6iqNw45c
	oLYrC657cclnN3DcnPUj4ns5o8GMglqZD+RIoG8YLx5qixmxym5m0P3bstYW9TX201dBphAhtMzRw
	VVsdqwsHXBo6X1gED1cyih+7jpiOZwMeQgNIXZpgCISiGXpRba/fVOpvfgzcwf7FPkbn6zei4IJli
	nkJf9WC35v9YiMYVCYra5w/D+lnY9pw1Y/O6YEC6I66RFYrIEJtMKaTWUQ6HyEba9BFMkemII0LLw
	SL7Jp5K9YBrzj/wUg8h7wbQ6GZhtF+2RJmsjm3LHDI3r/PZVijaDrp5EtB2PF+WkW29C3yC8Keo+f
	S5ElLaytzu4KLC8R9HWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svGBT-0000000HE3v-05ew;
	Mon, 30 Sep 2024 13:11:27 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svFea-0000000H50U-3GiC
	for linux-mtd@lists.infradead.org;
	Mon, 30 Sep 2024 12:37:32 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-42cacabd2e0so33159105e9.3
        for <linux-mtd@lists.infradead.org>; Mon, 30 Sep 2024 05:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727699847; x=1728304647; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GlV+nN18yw3drRT6eHy6/2hr4o+8F6xizJomHusoOY8=;
        b=DDTffrACZH3MMHuNMbf4T2JLuZCl7ye2soiZvTc3hzOgXCfgqRxEza4YVmEck1YGwP
         6QezfbXOxkmAwz9LYjGcB7mg1MKND6WOAReefEMeu4H10nQA+Fu3OhLN6BlzEo6/bQ4A
         fceUxpgVftYdbsrbihBRdTqY9xMVyibcxDsPIyDxCvAKBtzrfKczZAfkLiWradGJHOP/
         wc3X1QZ02CaxaUiSLWL9nk4I8lYJy6pjUnX/Wa9o2h79eYjhzlqUV7FQ/HtZ54JfHmhh
         Nm1EXgI3DHk5O+r0QEzN8DDlOxAGF5mS+oOqxZe8eyPOuV/e+ivkaWKYWY5K6wJIQVDt
         OCwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727699847; x=1728304647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GlV+nN18yw3drRT6eHy6/2hr4o+8F6xizJomHusoOY8=;
        b=EArexKX+P08TXfBwDNFaDRjU2iUSb3HCBRQMwttehbhM4dWdmyINZuYbgTrINiYqEY
         RXTOiFr+AEL41QWSZHb/Hoscourv0FgkNXLpb/hloOFPrEO8miqtEDFdR7EVvVS9zDrF
         H7pzlrd9Sy0yMFOESVqh404HtA4IyDX7+Q/wXoIE+nm56+NZLLhCXk5j9npcePEM62Qz
         z2pTFKHLX1iZC9ZsyxcL935wgD2WgplWT4X/OHLICJCowJx0tD3E1N6Gfx0KGJZNYr4Q
         z06yIn5jqz7MT2ATWSLDwfIrZMF6O2KkVXXWFU/bOWFscgEw3iIukEV1Iy8D/RXG7+P+
         D8GA==
X-Forwarded-Encrypted: i=1; AJvYcCV+EoUlkm4OWQMxw9JIPeQgmSpQidGy7Pp5ThFX+6RgYBG5Cvdx24flmOrDh5knjK7VaMStj57aaDc=@lists.infradead.org
X-Gm-Message-State: AOJu0YzA1X8or7oscJ/cfRSht2f//oxe0NjjAsPy7lWG2cGstG14Hf/3
	+8Mr0VRWxi/otYb3SDAatKCZoCRm9Wsqr/QB4Exr7k+DRNMa61fu
X-Google-Smtp-Source: AGHT+IE0AKmAHzGMSeF7N4UA2hEqVXGKPVEVP5SK27gagSW7PpUlsTlU5xb3Nv2RVaMagE1IaBh5yw==
X-Received: by 2002:a05:600c:6d4c:b0:42c:b995:20ca with SMTP id 5b1f17b1804b1-42f648a27f0mr40922015e9.24.1727699847144;
        Mon, 30 Sep 2024 05:37:27 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e96a52308sm149011355e9.43.2024.09.30.05.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:37:26 -0700 (PDT)
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
	Andrew Morton <akpm@linux-foundation.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>
Subject: [PATCH v3 14/19] bpf/tests: Include <linux/prandom.h> instead of <linux/random.h>
Date: Mon, 30 Sep 2024 14:33:25 +0200
Message-ID: <20240930123702.803617-15-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20240930123702.803617-1-ubizjak@gmail.com>
References: <20240930123702.803617-1-ubizjak@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_053728_918685_5CA50B01 
X-CRM114-Status: GOOD (  12.31  )
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

Substitute the inclusion of <linux/random.h> header with
<linux/prandom.h> to allow the removal of legacy inclusion
of <linux/prandom.h> from <linux/random.h>.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexei Starovoitov <ast@kernel.org>
Cc: Daniel Borkmann <daniel@iogearbox.net>
Cc: Andrii Nakryiko <andrii@kernel.org>
Cc: Martin KaFai Lau <martin.lau@linux.dev>
Cc: Eduard Zingerman <eddyz87@gmail.com>
Cc: Song Liu <song@kernel.org>
Cc: Yonghong Song <yonghong.song@linux.dev>
Cc: John Fastabend <john.fastabend@gmail.com>
Cc: KP Singh <kpsingh@kernel.org>
Cc: Stanislav Fomichev <sdf@fomichev.me>
Cc: Hao Luo <haoluo@google.com>
Cc: Jiri Olsa <jolsa@kernel.org>
---
 lib/test_bpf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/test_bpf.c b/lib/test_bpf.c
index fa5edd6ef7f7..2eed1ad958e9 100644
--- a/lib/test_bpf.c
+++ b/lib/test_bpf.c
@@ -14,7 +14,7 @@
 #include <linux/skbuff.h>
 #include <linux/netdevice.h>
 #include <linux/if_vlan.h>
-#include <linux/random.h>
+#include <linux/prandom.h>
 #include <linux/highmem.h>
 #include <linux/sched.h>
 
-- 
2.46.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
