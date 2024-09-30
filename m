Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE730CE8340
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Sep 2024 13:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bxeMrBUVzNSec3NltJEHA05u1D616/oaOv+PobDIK/k=; b=JSVcmeVeeL5D8D
	N2cOmyAfmEO8gO5oU2nkgx+WpQn2ThIfVfOcCTUQp9P8FKuGBOJdH6bkUYoZZVYnHC3pWVA8hIlA1
	7jrmy+cL68oP1J05Ns8OhKpSLkvnSBpyNQVn642jMdGqdlAZLsNtslzMMFH69ozmdPRN+djlJwpbg
	g1WlYnnCYMbObm2RQLr+jlHz6iTNUA+QNr/+1G+q4hho4C/hfNPtM7ceHhB/FwNq2A4ydjyBb57oz
	6KzmFV8rAPL4SnHayA9FYUDHs9V6r7PI+5Awk34Rb8TYVnI6z6YxK7pvoR5Fsw3UIWSLRW9yFwZEj
	GvuQ/47aWCfXdiMLFGzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svGBi-0000000HEIi-1PnG;
	Mon, 30 Sep 2024 13:11:42 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svFef-0000000H53j-1mGB
	for linux-mtd@lists.infradead.org;
	Mon, 30 Sep 2024 12:37:34 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-42e82f7f36aso34403765e9.0
        for <linux-mtd@lists.infradead.org>; Mon, 30 Sep 2024 05:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727699852; x=1728304652; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QP8C+iJ4JK1Je/p5BuVlufkcfyY44goQKWFtPIGK2ac=;
        b=hkZV60ImSH3g36l7udA7svoVQKkwIjYN5UsjHIYuNp2EWe4ZIhr/4d56icBwEkIp71
         +6TCiU52/BltamXAFdXyAhby4wGP7fmSMUfCZoj/o7wqW7xbFCAsiZIddhQJVGyYqj9W
         yNOO+8ZZ/JVRep72jhfgpWHHFx0IvqEzb31L0NR3ReM7eTJ7VqFdmbHJG4M/gryzxCif
         SxmAqy6XVhJK6KuKvHaauJXejiXCca8WC8HQE1atCNG/XGtQqzUD96fE5johjePxZfM4
         cy0p1VGAEAph35CjuUHhIgdL021wxa1GFGL8rmyZRHJExABGCF9IafAaAFtwiqqTC0lj
         8hzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727699852; x=1728304652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QP8C+iJ4JK1Je/p5BuVlufkcfyY44goQKWFtPIGK2ac=;
        b=DBWf58cccR4KX29Zkuk1Ow7/gEI0x7r7xh4sASd3IKSTlZo0zxXr684V3qOEX9eAIk
         pHfg4eX6Mm3fGZ5f10SNsAyrc11hUw2AaW1nPKgVGIONBxeNHp14RuFwBIxZ04A5wfUl
         gzqsjOd/A1fV0DDVpwVlHUpQYUjVaoNC0z3Rpa+/138t/LcSGjuEDKd7d1p4unU7iea4
         4tosPGJQL39166T3bbtzPJOFwbifTDloY3UBKFcGomNtEa2UX6cR5jHfcavpDm+z8AZo
         6Mz+5YJBpW2YqzDuiasnNuLVtZRTRmUSS8opZKl2SlZ7EKTanfA84BvAK24z03IVdIj1
         AuMg==
X-Forwarded-Encrypted: i=1; AJvYcCXm+vK2UJlRdVDiO8uJP78anOKuTz4yASs1Oqlrk2lcDrFRI8dRSiDhzkR5nid5yZ2d0Z7ySlVE9zc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9vbeTZiYCrznZ+2gT6hjSgj2K46qrcrb7OMtWmcyhbmjUBSQn
	5PtFPZz6JUGEgwJZYr3f8i9kYYapDelDH83hMsZ/jDwhozoduNJ1
X-Google-Smtp-Source: AGHT+IFhXFsuzmbiOuOqLO3F1XUYhHCyK1gMZJdEjcH96x1NbPGi/KaJvtZi9F1OwQRNBRa/x7UBZA==
X-Received: by 2002:adf:f1ce:0:b0:371:82ec:206f with SMTP id ffacd0b85a97d-37cd5aa9c14mr6102871f8f.16.1727699851849;
        Mon, 30 Sep 2024 05:37:31 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e96a52308sm149011355e9.43.2024.09.30.05.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:37:30 -0700 (PDT)
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
	Stephen Hemminger <stephen@networkplumber.org>,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	Cong Wang <xiyou.wangcong@gmail.com>,
	Jiri Pirko <jiri@resnulli.us>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH v3 17/19] netem: Include <linux/prandom.h> in sch_netem.c
Date: Mon, 30 Sep 2024 14:33:28 +0200
Message-ID: <20240930123702.803617-18-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20240930123702.803617-1-ubizjak@gmail.com>
References: <20240930123702.803617-1-ubizjak@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_053733_489252_99FBF14E 
X-CRM114-Status: UNSURE (   9.57  )
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
index 39382ee1e331..fe6fed291a7b 100644
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
2.46.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
