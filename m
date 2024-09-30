Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61DE3CE8343
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Sep 2024 13:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ryRjd5TZJ4mBdm1Zvx3LYOfqV5nOmGeEkDKXpk6tnuA=; b=RMvOZS9agohghn
	di9Rl/Ps30q/t43E7UBhdCXOQ3AgfDH3eIupTCwaOBydrSN5T848jRDDQ82ZOCCUF3CfycA58suC0
	bcjDfNONJUahwDnTciKRehHriomoH2DucdVrKC7QgvxVitW5jgQ693D7pG9amWcVki+GfX7lEEbGr
	jwTIjjk1thDbvK2tbXcAnKJut41GuJ350msuF0hVX839iuUUkFXqn40XbLNfP2rxkvqmLNFgzosfV
	HIcx68Ue0A4RSCnThgK6EoO1ym0p3eyyQ4IdAdYNQt6Ovydmn96FQIk1jmBjjXj6SYN4dUrb9JV9j
	8JjqB3hvhMrY9DNIQvtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svGB6-0000000HDix-1ck7;
	Mon, 30 Sep 2024 13:11:04 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svFeU-0000000H4tk-10f5
	for linux-mtd@lists.infradead.org;
	Mon, 30 Sep 2024 12:37:26 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-42cc43454d5so31345315e9.3
        for <linux-mtd@lists.infradead.org>; Mon, 30 Sep 2024 05:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727699841; x=1728304641; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6rs5JfkaX4vjLfXsqAZRoDkbs0NL2Tu6uf8tfOBZdKA=;
        b=fYlQlBks8wRp9hyY01Cdvfz1ttfXBYEHG5wiA1RC1GaNKcyFTyn6VFxcJH72uayNRf
         vT6Saa4A7a3er6LTC27UYuBEQ9iuq9BZHKdJ6cSp/hPXIxm7dDQ6GbzbuhFFV/QWv4E7
         XBPsIaK+8985UTSEMl73GMtZ56ESnBXBc2NFW5M1GdzQNRpadG0J6JuvpG90909SwESA
         7ZlLeGeNkL3oH5unrmjRmueyx4+v0KW7kCqWSqAi1g6LDODB3E7zuQUVTy7GFbDXHsbz
         5K+t7QO+QI60Lu6Ebtv2lY/FxBIOaV2wJJfEDJ47lZnWvTGC4AjzyS7f9Nsv1eNgORLi
         5z6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727699841; x=1728304641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6rs5JfkaX4vjLfXsqAZRoDkbs0NL2Tu6uf8tfOBZdKA=;
        b=lJFFQ9/odnFGC/TPJ/w0G1H84QcADEFgBB+j5OVjZuN1tbUETpwT+N1tl9HIbbRsJr
         3zU39NLnue8lwUTpnlvZ3IL/Mq/lf14YGpCeocoY1aOUfq4agYj3BTaP+8RGXyVUk+IR
         JE+sRFkHTbz3zvvsV0SKMjvGEMceytgFMrMwEtGCmgRf5TVmmfv69aNBG2g5R09wUhyv
         hEBpKX1taZTzq32w3zzBfAgABWGAjZE0ziyCU6xLKkeoY8CqgMusTfiDJYvHSHn8G3IR
         Wu4cXG9jjY1m6mjEX2ApbtCR3ldiQ2xfuyvDTtrXLyRAfL/sX96zOMUGaDbg99sK9Dn7
         BPHw==
X-Forwarded-Encrypted: i=1; AJvYcCWtzxsv/fe4L9s5yCHo8KZSTdB9hkUi2uoMmvu4WKYC1dZMwixscCmcY96ndi91qGS1i0c+HVsvs/E=@lists.infradead.org
X-Gm-Message-State: AOJu0YyqhsJ7bINhqQ3JUorx5Gt3nkTXDRI+fQj+EQSvj4H6FYCCuBB9
	y6uSQwoj/vz0Z2A8YW4oYtrhDHM+H8OsD0NGxSf9XVlQWfGigDSh
X-Google-Smtp-Source: AGHT+IFHgMvS9GhqstV2aQ3xEgJPZmWF5RO5X6f+ra7fPCRYNUY7uUx6XjXf5I/swT371oPEEJv2gg==
X-Received: by 2002:a05:600c:1d8a:b0:426:593c:935d with SMTP id 5b1f17b1804b1-42f58409f9dmr84281535e9.5.1727699840695;
        Mon, 30 Sep 2024 05:37:20 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e96a52308sm149011355e9.43.2024.09.30.05.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:37:20 -0700 (PDT)
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
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>
Subject: [PATCH v3 09/19] bpf: Include <linux/prandom.h> instead of <linux/random.h>
Date: Mon, 30 Sep 2024 14:33:20 +0200
Message-ID: <20240930123702.803617-10-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20240930123702.803617-1-ubizjak@gmail.com>
References: <20240930123702.803617-1-ubizjak@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_053722_436497_641AD9E2 
X-CRM114-Status: GOOD (  11.38  )
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
Cc: Alexei Starovoitov <ast@kernel.org>
Cc: Daniel Borkmann <daniel@iogearbox.net>
Cc: John Fastabend <john.fastabend@gmail.com>
Cc: Andrii Nakryiko <andrii@kernel.org>
Cc: Martin KaFai Lau <martin.lau@linux.dev>
Cc: Eduard Zingerman <eddyz87@gmail.com>
Cc: Song Liu <song@kernel.org>
Cc: Yonghong Song <yonghong.song@linux.dev>
Cc: KP Singh <kpsingh@kernel.org>
Cc: Stanislav Fomichev <sdf@fomichev.me>
Cc: Hao Luo <haoluo@google.com>
Cc: Jiri Olsa <jolsa@kernel.org>
---
 kernel/bpf/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
index 4e07cc057d6f..66474021f84e 100644
--- a/kernel/bpf/core.c
+++ b/kernel/bpf/core.c
@@ -21,7 +21,7 @@
 #include <linux/filter.h>
 #include <linux/skbuff.h>
 #include <linux/vmalloc.h>
-#include <linux/random.h>
+#include <linux/prandom.h>
 #include <linux/bpf.h>
 #include <linux/btf.h>
 #include <linux/objtool.h>
-- 
2.46.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
