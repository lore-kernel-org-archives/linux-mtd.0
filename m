Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F080FCE8341
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Sep 2024 13:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pxQONLjBmCPPQnAdCtxl9w0RLVXqNNuSbkXagqOK4LQ=; b=LXc+nRBDy75rYi
	ag+MNiYH3ri4GdtNU6+xWHNTL9oNmDcn54KADraLX0MyZMbmMrdqm4xul8dJ3OczYzKzexqBFvRBE
	q2YMvwWyQEDtWAftnUqKgy2DTWqAzj6qnDKWAqBXTL+Da4Sh37mqfXWXbFck5vHDWAN14kHN2qsv5
	h4FEjVmiyqVbN9+/PPYSRLQAvTQoEfGaEKYcP0XUdVgbDobmmYXBbjTrcvQ7MaihG3SyVly24w2eN
	eXYrjgURrHveb8wpk+rLBTPNrijMwlyMPyuPj1j/maU3OuSyWuD2BrrGUIQZqHiQimLOeBUaEw3gF
	nDC/GTSKsXOk89v3aXEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svGB4-0000000HDhw-3WPg;
	Mon, 30 Sep 2024 13:11:02 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svFeU-0000000H4s9-0rpP
	for linux-mtd@lists.infradead.org;
	Mon, 30 Sep 2024 12:37:26 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-42cb0f28bfbso33243385e9.1
        for <linux-mtd@lists.infradead.org>; Mon, 30 Sep 2024 05:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727699839; x=1728304639; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tn+GOzQztHgHcIfRc1gU/LmX7CJxu4Do9s+iY4ufzHw=;
        b=HDOE9HyFnjuKMUmKZyVDTDjbud52aLA616g7+Y9Ic47Q21o407aH003zFlGsHvfQ83
         24eiRrAu9aBdm41uMGoVIbE9wiX65RYlemvxYh1bFMpitOXy5enIAOR7E/3tILIKE0Q+
         WsFTOrVPnOAbWhZVeSAL6UmR63reL5NEXhwerNXrnSP2c9ZVKC+VUC6oTvqknZU5PpiC
         nFTb7fn2uTpm1vILjs9wRiuFpeL1FnSh/0GRg1SucBlnYH1YB8Cqk/aUqkNFzi4aoWC9
         PY9z4zOiDHqRFhN8ObE7QSugRAfGqy7gh4wk5l4dwBKpn3xcB2x5e35fd8jgCfXVWP7p
         5KCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727699839; x=1728304639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tn+GOzQztHgHcIfRc1gU/LmX7CJxu4Do9s+iY4ufzHw=;
        b=RXbCFgtLrF8gCmFe8zK9Vn2ToCU3XegClN8gIkdOVqUMInJCcX9eRWGPjr/o4zbYn0
         Yrk+9Rf9O+sEqwvc0uhK2RnfKKuzPPhRlP1pQfhPcnxolbxGWjtG6uzWsJ9ICmUesWan
         yYqgLmZB4k6mMIrVB+ILqTnPcJ0D0WS90kb0ktEnV8I1xzJzW4cP9O6XUi44TgQe294u
         Qmc3cCNdHWbtDouhL0hAEQccTdbQe5PvwJoITGCMtJKtjJcn+0GueKhQ3LWO1z9pB8VC
         Ru7YIG1NLh5GHAQn4AhDWz526CN9uiUW7EF1Vlp/3KpCXM7sD7w4A2x2+6QPwIMqOGS3
         Z2aQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCT81Lp+OMyy1pcqZ94oy8LlSX7LA/7gBaNIhjdaScbAmPhmxHk+mYLUfLX/QXwe5Dfv/l7oe1y9w=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2601iXeApcpyZqlJPzxpV5mM9m6Q0uNXQjXP4eM6IJ0UfSLLC
	XXxMcCLzSAo4JOUBQwXSNyzavkn4CDILhAsoRWJQO0Bj3zo9xMt4
X-Google-Smtp-Source: AGHT+IGvq6NRT6JufQmn6LdLh9JuzzheTPsAQprqBquWz6qQ+pBzTt6Ksdb4rtzF4i0KxoWpmKQ3VA==
X-Received: by 2002:a05:600c:1c26:b0:42c:b950:680a with SMTP id 5b1f17b1804b1-42f5843a723mr78695175e9.20.1727699839348;
        Mon, 30 Sep 2024 05:37:19 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e96a52308sm149011355e9.43.2024.09.30.05.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:37:18 -0700 (PDT)
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
	Bart Van Assche <bvanassche@acm.org>,
	Hannes Reinecke <hare@suse.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Subject: [PATCH v3 08/19] scsi: libfcoe: Include <linux/prandom.h> instead of <linux/random.h>
Date: Mon, 30 Sep 2024 14:33:19 +0200
Message-ID: <20240930123702.803617-9-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20240930123702.803617-1-ubizjak@gmail.com>
References: <20240930123702.803617-1-ubizjak@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_053722_379934_75E9F59B 
X-CRM114-Status: GOOD (  11.60  )
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
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Cc: Hannes Reinecke <hare@suse.de>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
---
 include/scsi/libfcoe.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/scsi/libfcoe.h b/include/scsi/libfcoe.h
index 3c5899290aed..6616348e59b9 100644
--- a/include/scsi/libfcoe.h
+++ b/include/scsi/libfcoe.h
@@ -15,7 +15,7 @@
 #include <linux/skbuff.h>
 #include <linux/workqueue.h>
 #include <linux/local_lock.h>
-#include <linux/random.h>
+#include <linux/prandom.h>
 #include <scsi/fc/fc_fcoe.h>
 #include <scsi/libfc.h>
 #include <scsi/fcoe_sysfs.h>
-- 
2.46.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
