Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59534CE7AB0
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 07:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0UqjpPr9wGgiuSnaZY+Kim99mLnGxibgsg3S4LmtBPQ=; b=cFuC7aQQlWSG/I
	kD7vi1wzj8GxHWh+AxBW9Had/4oayN9JQrks3lZXd1BN37kgK/79FztF5EXfyLDswolQu3924vpt2
	zhqN/tEe8vpvhJCOpyaOnIIoK2+mGUnzrD4mlX536UVLn9n9QG63U8njTHg2HQU/KRJyhUdXddCPY
	pEm0v4h++vuKISh/NVYboq9gL1KuIJGDh8g0wEZ2VfP+OffKEZQaCdq+NRJ+u0+YUVQ6whGo3GaC0
	jqf48qYQ20kFNYz+zdKFN+S3Oy85Z6AYPV/9v6KWCY25xUm+h6GZxGMQI+dVIgC3GYUq5pg4u1/5Y
	XlbikbIReyTVHluHMfFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snYWa-00000000kPq-40np;
	Mon, 09 Sep 2024 07:09:25 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snYVw-00000000joC-3XXh
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 07:08:54 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-374ca65cafdso2457365f8f.2
        for <linux-mtd@lists.infradead.org>; Mon, 09 Sep 2024 00:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725865723; x=1726470523; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k/MFlMnrTNocZP8/Uv97NsCue+ROk0MIWVg6GOd8r8g=;
        b=JVPUK/urLzzRhPpQ/D3dooBFZ9/hPLX+bxxVkhEprs6aBNiEHVPn9tlOFO6nOmB3c2
         sxriHg0yux9ytfKMk9dqbs6U5NGPWbJPhjY5njTyt9BnoDfB+oiCJOVbiJtLWiabsHOK
         hZ8SixgZ97em2Q1EbiqqQ0aEiAZs7BG6XfHf9Uocu+daqT2dfgoqAhzfOoge0bRWq5vt
         MDyWj8O74tR6prkiQveGAl5KLRJlqXfXwOcUHaI9gEZpbjE6oUdKH7Y98wN13PMqiX0s
         YwMElb+0cgJUKGuMj1kJPRXqxIjLH25aERbxwSnT/NzCMXoZCZy5Dsrnog29nm7y3IMn
         EV8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725865723; x=1726470523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k/MFlMnrTNocZP8/Uv97NsCue+ROk0MIWVg6GOd8r8g=;
        b=BlF34mo54gE7ycRlQ+K0UsRVjcWcnxZXcY72zxDuvJvW4+E/mAKg2crsB1PZTk9U8H
         DcZwE1/eC3OQnvQBlwKSWTsE9T7EwetqWmcyCh4o/elEQkURx63TFJLhQg9ln38AQAdM
         VmTfRZ/uDo7q+I4qCbuN6dmg3LbElslWQrdMdajb6iSN6f77nMBjhcjUo5JqiY/5/Wek
         tEZNvD00OGybD9JxpU6uaNTqA2jsu49qkbB6z8MyBSQ7SbXETyv5Mw27jqwDvNRuWcrF
         GdZnyD6BaK7WMO972fhngybKkBeM9BhkcftuAHYq6BONhAKwCn99AwxBHfrvS23xNH0x
         ovew==
X-Forwarded-Encrypted: i=1; AJvYcCVHBDxh69p8mDbU7hLtc90BVtv99d6TlI/662T7NgB0J6kxKuhMkiLTwhO9a87jowAsXY+agAwlsGA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxrtiCtLyg/1RRDCn7kEJEw+N5aZQiHroeWt9h0DC9hoOgsHCS7
	YS7McCBnPBtUZH5LdbITXIMugJpiZ7g5mKErXPzHMLqWC4rQivkv
X-Google-Smtp-Source: AGHT+IF/jsmfALn+XbJWo7DbJRUOtQ19Xtb/ZppZO8Lnb9QwaZtsxMP8/xIAWo66GB7XqojzBH2ExQ==
X-Received: by 2002:adf:fd12:0:b0:374:baeb:2fb with SMTP id ffacd0b85a97d-37894a0d0b6mr3746464f8f.35.1725865722690;
        Mon, 09 Sep 2024 00:08:42 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956d375asm5178754f8f.66.2024.09.09.00.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 00:08:42 -0700 (PDT)
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
	Stephen Hemminger <stephen@networkplumber.org>,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	Cong Wang <xiyou.wangcong@gmail.com>,
	Jiri Pirko <jiri@resnulli.us>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH v2 17/19] netem: Include <linux/prandom.h> in sch_netem.c
Date: Mon,  9 Sep 2024 09:05:31 +0200
Message-ID: <20240909070742.75425-18-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909070742.75425-1-ubizjak@gmail.com>
References: <20240909070742.75425-1-ubizjak@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_000845_928752_5F907249 
X-CRM114-Status: UNSURE (   9.51  )
X-CRM114-Notice: Please train this message.
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

Include <linux/prandom.h> header to allow the removal of legacy
inclusion of <linux/prandom.h> from <linux/random.h>.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Stephen Hemminger <stephen@networkplumber.org>
Cc: Jamal Hadi Salim <jhs@mojatatu.com>
Cc: Cong Wang <xiyou.wangcong@gmail.com>
Cc: Jiri Pirko <jiri@resnulli.us>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
---
 net/sched/sch_netem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/sched/sch_netem.c b/net/sched/sch_netem.c
index 0f8d581438c3..2d919f590772 100644
--- a/net/sched/sch_netem.c
+++ b/net/sched/sch_netem.c
@@ -17,6 +17,7 @@
 #include <linux/errno.h>
 #include <linux/skbuff.h>
 #include <linux/vmalloc.h>
+#include <linux/prandom.h>
 #include <linux/rtnetlink.h>
 #include <linux/reciprocal_div.h>
 #include <linux/rbtree.h>
-- 
2.46.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
