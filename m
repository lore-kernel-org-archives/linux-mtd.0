Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C9BCE7AB0
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 07:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=928dmCH6o8q3L2TD9qb9F5Pk0BIiM8N/38zHQ3+8RRI=; b=lE5uVC79rBhfWR
	DCRxNu8EOnC1SMM3zVt3mQvszB2xn81iRt2mHqliXRGHgcGwr8vt6caKEX+ZDfYlE+2IuCfEuJuwE
	Vz5R/vW3ZXBlW4WlBn0Sutp5R02n9ulceHhcG8o2AA3Op3nOAYfDhFFAKFH3QtL1T7eiyp5NvTRx4
	9XVegJWcD+WEXJvlM/WUnX7ySWcHjqHOeAK7rFumwhnqA5aTbQZbKXTTh+Muc1UD44Uktu/rARzjE
	/5tPSJmagsIdhpqrTO5vf4MVlS8eWvuRrz+OSqyZHF7BsomOWIYygjN6mg2TLmBgm6WRhJ/dqRDpx
	aQtz65Yi3FnBCOUNP3sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snYW0-00000000jt4-3V5l;
	Mon, 09 Sep 2024 07:08:48 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snYVo-00000000jfj-46Xg
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 07:08:42 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-371ba7e46easo2611664f8f.0
        for <linux-mtd@lists.infradead.org>; Mon, 09 Sep 2024 00:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725865715; x=1726470515; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KT+qqbFYGAtbtTrUYL5Ww6m96yHmU9B4q+0V5LkESPY=;
        b=kBM/oLOIEHJnPAUXi0p+lhcLAt0F/SCJu6X59uNuw4nPUMZLaFGGUqlifVRVLKkdd+
         4KzksBJtz170d7eFI8Hj0sLiZQ03N6JSjGPHYvVfelZcpjmSrY1z+5VGzbrnIn4Po+wt
         RowWZf9jjBn9PfPHp0k8/LTeVTmtoI4sQ0AOqhU2/ZXZ4CWW5WNH+4VVzbX2Li1gzdJq
         inaDZTJy1Fw2SvB/TCYXHne7P6arrUGRJOzVkwODtHjpHjlAtXqQi1KlHrFWqmi5EuEb
         p2ak4MhQxkG801K1yeoCPk1M6HW/oG1BtMkKxAXCkobaN0BYR7aCKksmlwArVwecGqpW
         ntVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725865715; x=1726470515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KT+qqbFYGAtbtTrUYL5Ww6m96yHmU9B4q+0V5LkESPY=;
        b=r0koYXm0OOmi+K8L7roV+V5g/jkFFc4TUn3ZIU9ubNQSM3bpt7FANwNp0mIn5rKpd4
         FVToE0WThWOl/OtvanymIK+eqcG8itX3I2IZSEptLfK56UErLKdId5tGH2LYCeuAudQy
         v3pfYiMO8IvRrnvCtt1a3zHV4yVXrsQ31k/Ar7bbsHkzOeIXSg/2sSlaraqHWaPdulfA
         XEBkgJIycwzxgvwAXXTcctl4EwnlCYVd9c8SogArCrdytawyRmHVxnouaNwyIE0k2zHJ
         PlVTF/5PwPZbpC97UgxFJXdPWz3nOwWMadW62Qs6w48GsScMwxUG4Fh81JDD8Q5Dz30/
         Lb5w==
X-Forwarded-Encrypted: i=1; AJvYcCUsoQi9qYvjBYNbcOR+7Bo52o1CUjuES5m67sZjwL18qKrRfEx8DybUDCSdpoeiD+cofLmNJUbKamk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxpJi18ySHrdTj9OHcb8U8+iMn/W3Ecvr9hW4zGaM0AgS2Ig8qX
	xB0DsmPBGVNn7cfEhsYQNANHlXLCg1PkaIy7/etscRflM84Z0FOq
X-Google-Smtp-Source: AGHT+IHM6W5yPkPlE3JV0r3wTbIThg1ONa11NIP8C20CX17/Y0zQWpFJHw7ZEl2cY8rMzCAWatYYQw==
X-Received: by 2002:a5d:6b91:0:b0:367:9d2c:95ea with SMTP id ffacd0b85a97d-378896a9992mr5949005f8f.56.1725865715399;
        Mon, 09 Sep 2024 00:08:35 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956d375asm5178754f8f.66.2024.09.09.00.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 00:08:34 -0700 (PDT)
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
	Andrew Morton <akpm@linux-foundation.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH v2 12/19] random32: Include <linux/prandom.h> instead of <linux/random.h>
Date: Mon,  9 Sep 2024 09:05:26 +0200
Message-ID: <20240909070742.75425-13-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909070742.75425-1-ubizjak@gmail.com>
References: <20240909070742.75425-1-ubizjak@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_000837_128843_230C79B9 
X-CRM114-Status: GOOD (  12.46  )
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
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
---
 lib/random32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/random32.c b/lib/random32.c
index 32060b852668..31fc2ca68856 100644
--- a/lib/random32.c
+++ b/lib/random32.c
@@ -36,7 +36,7 @@
 #include <linux/percpu.h>
 #include <linux/export.h>
 #include <linux/jiffies.h>
-#include <linux/random.h>
+#include <linux/prandom.h>
 #include <linux/sched.h>
 #include <linux/bitops.h>
 #include <linux/slab.h>
-- 
2.46.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
