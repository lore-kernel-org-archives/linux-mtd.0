Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED943ECE57E
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 08:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RGpobesyMPxo2EzYhky7qpMYd1pQ3Q2JKtnh4eDLf5Y=; b=OXtoy3H/w8zxcf
	G60otMXc+Kkae7w/r8SexettJVEjLmAke7Kxb3MdgxpF64eS9BGaVlly4A83ThiyqVJcpqqYmNk4S
	P2KsGVqvOIRRo5wktPh0xnlOwEyaup2E2tw0q7QWNyPICyTUe9FLo/BCQjeQ4Wp/XwnDm/zndXQGp
	APFfgoTLeSp13J2m61Jtyx7LbH5R+NU+uqn4/Pm2lC5yMABCZpwOrCMG3UWAPSj+4/pNKceYspGRM
	/t9haMWQuwesMRigZQPy2LppXMUNCzdyU32B2NHoaaTS0YTV7kuC6cVphl/KZt8XLJlauyURhzHuG
	cmCuvgzL9cJLbnpTKDCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZYO-000000011kY-24Zj;
	Mon, 09 Sep 2024 08:15:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snYVr-00000000jit-0tcr
	for linux-mtd@bombadil.infradead.org;
	Mon, 09 Sep 2024 07:08:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=yJ+e64efHlSgzeDsuneltxPlkbdvNmJYnADy0syd420=; b=ia8kgpCTS2wsT25FQ1MyxBMlLP
	brBI48TbbRHZNcJXSTLEL5C+sBb8j5IU/VjS9BdD9QAhRdd5tdHrx4BB0iRyjMcsh6z3ikjqwQA3G
	/DqpjBWn0BXeX0qG0audMyW7oGy891S+zWO8sczGhXxI+gI+VbD3ouZUetlfQztWpQPAUGnXm/pz2
	my//Yt4/XojTTtOwAHi9E+/yAt7RurQB7VZwF3oVqyWD4QuHia6j4Suo63RE78WQ3L/8NHfGF/MMy
	oHLlqIx9IqhzaS3yzQ9aQshElBrsjKr3AYGOK57v4am+ha20aKKfdZ69wqZGRe8XLGzJN6IV0rZC7
	ubOdFfnA==;
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1snYVn-00000000KZT-17t3
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 07:08:37 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-42ca573fd5aso23807025e9.3
        for <linux-mtd@lists.infradead.org>; Mon, 09 Sep 2024 00:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725865711; x=1726470511; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yJ+e64efHlSgzeDsuneltxPlkbdvNmJYnADy0syd420=;
        b=b7CxbbdTrRuoQa8KCA5rzDF1NKzQNbrGkGji5GaZMXcJy0zYg7CRs4M7fnP6LlD6Qq
         HkvwgQWTMq6Fw2+H7sSn9reDKgjBaOsS5i0utr+s2+PeJwx+gJTnqFRFYvg9MikREChl
         H5Z+5guPJU2AE7asQ3QHP1n9gTeL1IUaYsTlhBGCr+lPVpzJorOVrk7zr5vovhW3Ynjs
         JnjXU1M2nRmJ7f4PDwHQNUebs6Mfn9zlPznL4M7CwAhITHTjkUm3NSDfZP+4dI8JnYpU
         g8V5Nc3S1YqIN24DSl07UKiw5XIGT7kjzLc/qbrAv5A629oL/R18uwGvvKHJXCxXicg6
         8oxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725865711; x=1726470511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yJ+e64efHlSgzeDsuneltxPlkbdvNmJYnADy0syd420=;
        b=RwqB1JvWCKn6zz15uLwrBVPsD9a4T2jC+xuwslOICqsAAqP1kfyd6TmgIaYUM7/JOj
         n31iuPRMYKEvQpZJvPaucqyfm/OmLuFoSpfRjj5cxusiNEMaR8Hd70AdZOWCSd170y10
         A8kE0XDLMwK8lmMTK83xAfcTj+W36hviIqMFpBX6Dcm8zRebEQOCu2XwWhtWt/SvW8jC
         Ab47US/kxQwWZI2G2iH3WtlZ+EvkY4P2jwQyuJkmWCvNRNBeSPpkcTcJuAlqGDut0s/1
         0aSLsGZ9RCjPqWiTPIXMOLF1wcCNardm3QYG2M1Z3lPcvefgjhKTyWOupYoB2fOjfH3n
         aFEA==
X-Forwarded-Encrypted: i=1; AJvYcCWDnc4ZwJ4qANMbLRWhkBIN77g1/apqxudI3dSWTAh1cXskzy1Oo3fje1cxABwLDP6P6hSe3apS1C4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwbNsNkmSyY8SmIdjdu+0xq95rd0RqrSC/uhU+dYuAkIQBtf5ft
	YGFfGewBaemXPA5ER6AhIoP2anShVt6yNj6F2/3uI34lxuCgW9I6
X-Google-Smtp-Source: AGHT+IHjuyDeJOTuWU6U99A+nUhTDj2Ftw6vRJiQ+Ht+n2ZbU24Uupr5vdNYk+vcq93VCNsDOFt8cQ==
X-Received: by 2002:adf:b305:0:b0:374:ba70:5525 with SMTP id ffacd0b85a97d-378895c32e3mr7328314f8f.12.1725865711376;
        Mon, 09 Sep 2024 00:08:31 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956d375asm5178754f8f.66.2024.09.09.00.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 00:08:30 -0700 (PDT)
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
	kunit-dev@googlegroups.com
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
Subject: [PATCH v2 09/19] bpf: Include <linux/prandom.h> instead of <linux/random.h>
Date: Mon,  9 Sep 2024 09:05:23 +0200
Message-ID: <20240909070742.75425-10-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909070742.75425-1-ubizjak@gmail.com>
References: <20240909070742.75425-1-ubizjak@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_080835_630063_7B5D27B9 
X-CRM114-Status: GOOD (  11.26  )
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
index 7ee62e38faf0..3f0d1eb7f5b0 100644
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
2.46.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
