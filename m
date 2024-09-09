Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB58ACD4F4C
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 07:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sqt7Zu56FhUZMG55ZK55WS1MXKkzNJTwmJ0zpKjn/HY=; b=nDnwk46pgD0R6v
	pSbMCP2LtKXqjkVin7hfVG1o+qsH/J+DKtfgfkyfRh2FRdRRHdZf9bzYZW2HrkaiY+1/p931s93Fl
	yv613OZDzgTI+n45Ut2w4/YKKRAW2DPuY2mzkVifsjlCbwbEVAysiCJRNAI0BGr3XLqTfqXjESXJo
	N/lE1qCewWRafQ2jA3wPVPpm62oYsgCpiHonVywlu9wXwjmJlwH940DgKDFLD/ZspimlFC9SAA9sk
	/LqlzXhOACkwrtJIEGcozQNSFZD++YkIbsQASHCYhjKd9IlAsiQUcUS0VqoOuw4TOKC4QJtZEClPQ
	FS7bOG0rJKd+3szTnJOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snYWP-00000000kES-0Gh9;
	Mon, 09 Sep 2024 07:09:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snYW3-00000000jun-0pUc
	for linux-mtd@bombadil.infradead.org;
	Mon, 09 Sep 2024 07:08:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=BivEb0WMZmwNev7ojy/Ht/ekf32lny20AzsfLsOF+vY=; b=IWKhVGGYCnWk5pOMD6u4AxzyQQ
	MDTSSF+m8lkMlsjXI+DWXdaJb/vAjlrAp9h5xUFVB11RX1nD7f7BYf4RQYiIMDHVLJGKYcrguKiu1
	r5PVI0TzYHfEdObMHtlRHW2mzwoW/3fzkL1jNHws8dP0S0D5Ybp0u/jfy4blAzaS6nMqJImzn5YSA
	PrVndhonSxOxjHXveuUv6HKtrX1B7ezYMmHexsjBy/DFaT1GKGCKx2AobiYcD90nSbC9TUtPoPHUK
	Lm9FIuN3eH8jnQOys1iX7hycBw6xiOTY9ulcyMNe45e6QWgSe1l363igEKeokrCXey18xGwIwbGaT
	LhgDStXA==;
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1snYVy-00000000Kj7-09r0
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 07:08:49 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-42ca6ba750eso13433545e9.0
        for <linux-mtd@lists.infradead.org>; Mon, 09 Sep 2024 00:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725865724; x=1726470524; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BivEb0WMZmwNev7ojy/Ht/ekf32lny20AzsfLsOF+vY=;
        b=VgeyYnFkoxE834La4SG9GxizRSkniR/eYWskPhmsVYw1FVSBLn6axxpr7U313hRLPW
         lTKcj3HOjHO8WZ1N6CwRTxa2zojKfxDlYm2OWYNYTBLU93pai69WcHTpjMeVU4Zyv+SO
         C7Q9pZj91hnqys0UH1aIEYi4iAt2Oa5XK+/ika7F9xS5mRn9uIdOjTJmmfmz6l/wx0aX
         t2UnndpAwkFUgAIcV9X+DLtBGpDKB4aHXLhgruHQKugptD/6/Te/MH2wHw02vk5bK/SN
         MXejAUwT4phIRErNhs8bdM6T/l7PWtwcrbRCB5/OIit8JlQOs8MGN848lw31Ina//XA/
         iPBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725865724; x=1726470524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BivEb0WMZmwNev7ojy/Ht/ekf32lny20AzsfLsOF+vY=;
        b=nAgQmipOuF5PqJCh1LKgifOiv2jA1xu3mHOsJBIKqY2X7wKqNBecrxyAk+uKXp+BqK
         3eBS3YEyVv9rhqqzYEv2pxXvazE0IWxL0+67S/cZ11ul2mheX2At5OTlmGIg0whk464s
         xdwBEQYjs0/vsI9sczIjoZV7OZrD9Rzwi4DkeBSJzSlemLrQ7p9AN0QYdPeCx3DtELDG
         DvEWap4LDRPzVChy6VLbLibQ1EPMm0RR6/JBVEkZL0SjM8LHGYFmqwu18eVy0QJxY0dK
         sYw7YUb190ZHGtik4qHmHYm7Q/NgJIL+0qHuM+j3HSaApzxSlSxluW8MGdXlTo1i95a1
         oIyA==
X-Forwarded-Encrypted: i=1; AJvYcCXGJe3Pn7WwbwChX1U8PGaQv6LSrwnP0Z05eoCbDOz2Wjd+QSrVSbxs2MiXMDhJUwIoc2ybRFuGUlg=@lists.infradead.org
X-Gm-Message-State: AOJu0YxEeUlWqukteMr1gkEKxCgmqakF5r8S4ys/B+liQkdsPBmBGjCH
	Zcnvy/IGOxTfQZzUgLcIMaA9xeHtnSV4OR09xpcjKi3FU8dBkyhL
X-Google-Smtp-Source: AGHT+IHr6jnt3r1zP3GHq+t+AZJwdIrHH6hLL5Qy5jAi/UzNGLkV9sIPHS79jlfQirVSgFmx9JKzEA==
X-Received: by 2002:a05:600c:4e94:b0:426:5b17:8458 with SMTP id 5b1f17b1804b1-42c9f6d1d95mr61186805e9.12.1725865724488;
        Mon, 09 Sep 2024 00:08:44 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956d375asm5178754f8f.66.2024.09.09.00.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 00:08:43 -0700 (PDT)
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
	"Theodore Ts'o" <tytso@mit.edu>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH v2 18/19] random: Do not include <linux/prandom.h> in <linux/random.h>
Date: Mon,  9 Sep 2024 09:05:32 +0200
Message-ID: <20240909070742.75425-19-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909070742.75425-1-ubizjak@gmail.com>
References: <20240909070742.75425-1-ubizjak@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_080846_216057_E19279A4 
X-CRM114-Status: GOOD (  10.10  )
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

Files that use prandom infrastructure are now converted to
use <linux/prandom.h> header instead of <linux/random.h>.
Remove the legacy inclusion of <linux/prandom.h> from
<linux/random.h>.

This is the "nice cleanup" part, wished in c0842fbc1b18.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Fixes: c0842fbc1b18 ("random32: move the pseudo-random 32-bit definitions to prandom.h")
Cc: "Theodore Ts'o" <tytso@mit.edu>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
---
 include/linux/random.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/include/linux/random.h b/include/linux/random.h
index b0a940af4fff..333cecfca93f 100644
--- a/include/linux/random.h
+++ b/include/linux/random.h
@@ -145,13 +145,6 @@ declare_get_random_var_wait(u64, u32)
 declare_get_random_var_wait(long, unsigned long)
 #undef declare_get_random_var
 
-/*
- * This is designed to be standalone for just prandom
- * users, but for now we include it from <linux/random.h>
- * for legacy reasons.
- */
-#include <linux/prandom.h>
-
 #ifdef CONFIG_SMP
 int random_prepare_cpu(unsigned int cpu);
 int random_online_cpu(unsigned int cpu);
-- 
2.46.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
