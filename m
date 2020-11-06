Return-Path: <SRS0=gQDT=EM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63C78C55179
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 21:38:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C33272087E
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 21:38:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xwDL1lSK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aNVC/iF5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C33272087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7exq9FZcK91QKadC7LkoAj/07LRwSH4wl7Rr5Ki/KgE=; b=xwDL1lSKRerVD07/FHAs6rpbs
	ZI3AVe3NaYZmP8EhDzuVbxyS4oNiU4iP21wogEhy/6Rxc4sArIxLsXXScg0Qd6n8iWmmAI8EsNmD8
	Y0l5F6oEWYbJRy7ndGL8oF+BRtASVLV8f8j2X2dpFyw3BCE6lxU1Ym9hwNNTemmMJj6YRbP63CLQZ
	FATaXR1T5KhmBb/skcZ1tVQCZA6sc/O5BYIq+rpJyH5KREQ0xGwCiMaBEgoCf3tjQiB3SC5lnb2cM
	hngc2s7Sz1UuBpiZFcs3ZzIlmP/LFfPepZiFlR/4Gv4vzkK/uH97GS1mOKDWfT/YlPKmpHx5cLFiq
	0oRhpv6Cg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kb9Qf-0002s2-HK; Fri, 06 Nov 2020 21:37:53 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kb9Q2-0002b7-C8
 for linux-mtd@lists.infradead.org; Fri, 06 Nov 2020 21:37:20 +0000
Received: by mail-wr1-x441.google.com with SMTP id d12so1243140wrr.13
 for <linux-mtd@lists.infradead.org>; Fri, 06 Nov 2020 13:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DaSgExpL1nCtBP1Xc6kSLtHGXCrLErSmtz6Y4QPAfFg=;
 b=aNVC/iF54xkzO7atep0e+rHrJs5H8vdttLCxQgziSDzLUa32WiOQ8huCGi8lAShbNF
 1Yaw85GeA4HE3QUJerIxjFqiTZ/wNriR/RNO0dDgOnn7EL+k2V709I6RbVXVdTtqMN6Z
 HSo1v992TIEiQanj21vvgS7yw0LleNcyKWUy2ohMzI9Y6v7sQ2n7pH1ER96gq83QlE5q
 6gqd8A0tamr6kPYlM5QTjQVxtP5sIkbNTcqutvabpV87c0eefSkyHSAGkqhPVW8J+1tJ
 0SLAgkYeAhj7OxE84gc/yYK4e+VN3KR39yx2SETPxrxjOlBr4nVDJyVh9oFHQM99N1WK
 l8Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DaSgExpL1nCtBP1Xc6kSLtHGXCrLErSmtz6Y4QPAfFg=;
 b=X2CRvHrn0EU8VD6CUptA3Et7PJQB9ZQZX6F4Xuq4JDuT+siOMSLBoGucD8DuNZYb5C
 4S/ZK8INgESJ1MzzpbUy8PSH2G6sOJURBXvU/TvwcbZkdE+mhv53837+bCxAIm02pYzX
 R3uOgbpSpMMTvnSnYPwA7WWwagZIVprji6WPOCdOMmfCUT2RIYBW+guvahbl/udRa6m4
 jvoKSUeRbnikjEV/BiXm5Mj+Ow/fUnmxII7Gv+TDyvVNzCWWOmbCQczMe+IfJkFoBydT
 bqLt85zMglzP/7x8e5mA5mI6CWQ3nJKnV3/2w+cmjjBMPk/hABAabQNUhsaFl8S3F41Q
 /TXg==
X-Gm-Message-State: AOAM530ixfcUf7Pij4+EPpKZxK7lqsTGTfYYjHGArWkcx2ufi7+yWqjN
 415aSK9jonXseZJ8w3+y7787rwMDSkhIqfnQ
X-Google-Smtp-Source: ABdhPJxuW6c6hva5Qax31KQzZv2lyQK5NzLtARwyRUuo7ykdcZ3ZVGCORJ5BMc7Be37NKczsp3Ea0Q==
X-Received: by 2002:adf:ce8a:: with SMTP id r10mr4999613wrn.188.1604698633540; 
 Fri, 06 Nov 2020 13:37:13 -0800 (PST)
Received: from dell.default ([91.110.221.236])
 by smtp.gmail.com with ESMTPSA id d16sm3984942wrw.17.2020.11.06.13.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 13:37:12 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH v2 10/23] mtd: ubi: kapi: Correct documentation for
 'ubi_leb_read_sg's 'sgl' parameter
Date: Fri,  6 Nov 2020 21:36:42 +0000
Message-Id: <20201106213655.1838861-11-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201106213655.1838861-1-lee.jones@linaro.org>
References: <20201106213655.1838861-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_163714_522133_A410EE3C 
X-CRM114-Status: GOOD (  15.07  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Fixes the following W=1 kernel build warning(s):

 drivers/mtd/ubi/kapi.c:464: warning: Function parameter or member 'sgl' not described in 'ubi_leb_read_sg'
 drivers/mtd/ubi/kapi.c:464: warning: Excess function parameter 'buf' description in 'ubi_leb_read_sg'

Cc: Richard Weinberger <richard@nod.at>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/ubi/kapi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/kapi.c b/drivers/mtd/ubi/kapi.c
index 9718f5aaaf694..0fce99ff29b58 100644
--- a/drivers/mtd/ubi/kapi.c
+++ b/drivers/mtd/ubi/kapi.c
@@ -450,7 +450,7 @@ EXPORT_SYMBOL_GPL(ubi_leb_read);
  * ubi_leb_read_sg - read data into a scatter gather list.
  * @desc: volume descriptor
  * @lnum: logical eraseblock number to read from
- * @buf: buffer where to store the read data
+ * @sgl: UBI scatter gather list to store the read data
  * @offset: offset within the logical eraseblock to read from
  * @len: how many bytes to read
  * @check: whether UBI has to check the read data's CRC or not.
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
