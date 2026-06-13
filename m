Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26AB0CD98CF
	for <linux-mtd@archiver.kernel.org>; Sat, 13 Jun 2026 21:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eCIald+Q7XJ9vpNj3erWSE53mVovFeHO8eMAeO4esE0=; b=n78hzxiYQVXq9x
	SN432miTfHMwQNwI9BrwjeCVv5cDWw8TA9eptNf18UmKaE2cKwiL8K0iOQqTjYXKWufQRCNnaFqms
	exbO6XtLwAEsA++tW8Hm5PKQwgFLqn1zlgq3/Ec7tfwnOvn2esE8/uEybOgSRh5zMhIhtwMxsYuGk
	6aksy5dJWcp7bvfri407eIAGj/fLN99Oj1ZqIfuv6TchJcUOdwt2yWamQzTwT12Y74xX9vEWdb9wh
	+aYHRQhJCgZmGK+z2a1/4XTfACqmsaCaiSr7YDflNfbnvjToEZRiU8fY4tfTdzXOp0aaHjrEu5xcz
	CFFB9wJMA6TWumLw01Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYVcm-0000000CY0u-02w7;
	Sat, 13 Jun 2026 21:10:40 +0000
Received: from mail-dy1-x1341.google.com ([2607:f8b0:4864:20::1341])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYVci-0000000CY0X-2eAs
	for linux-mtd@lists.infradead.org;
	Sat, 13 Jun 2026 21:10:37 +0000
Received: by mail-dy1-x1341.google.com with SMTP id 5a478bee46e88-30807ba471bso6021542eec.1
        for <linux-mtd@lists.infradead.org>; Sat, 13 Jun 2026 14:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781385035; x=1781989835; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=coh4rqjKZIC8Jcem5U7E85AcHmOjE6sxJohiAW73BkA=;
        b=eMFXvnd4QyqexUx2J7CD8k6nwc9r66icPooZYELcXkbaEz7elTbj6H334sx7ewZ3ja
         wB37ijziqB8/2bYuqkMEPnBi55X8a+XmBZ0L7238CTYgdaQfIdRygVDIRi0faIMrPIDH
         bphFdkadukTe4xjZEeBOtlx5p8y5TnT23j/fbV7d69YKcU9uckmbqW7h9hiI2BQzDK9y
         3FNYChp8TkW+NKSw9t9xw4YmMr4XbRjBhXsgfv8402mwUVMZe6JcaL4nBFyA+zr+7qgq
         QxBg45Ndoyf5e6eAGL+n/xjsjdEP5sP/4AuMrzbq1orjcJX8bXuBE+KSZ/PsK0UJDtUX
         RIWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781385035; x=1781989835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=coh4rqjKZIC8Jcem5U7E85AcHmOjE6sxJohiAW73BkA=;
        b=ZKGAZJzxWw6U0M+S0GXW4OiF6cRHmwLIJEwz8XFA0U4LrGSMcK7WQkCNACX4EY1SSc
         xguR7TZtvaEB6YSAzxuwJSBRs64oQyVt5VeZDjrhrwIbyLSSUI28USKXKuqaDDkXDclg
         cMSCRsJQdTfrwNiBLPSff5BI0rPua1YetcJ5Yu393cdVeR0kSG4/y7E3ecxnM0e4TVEl
         2ameAehoJscfEJFdzj3onCMgw74l+YOk1t1neJpdupC1t9T33WEoOWocfz3QR5KKzvMC
         78AGWv6oUj3oUflfFAn8JA4XjLXcGlVK9/nGEeTejB5ELRcA5eX7attE0AnjmXJSctl8
         FQ/g==
X-Forwarded-Encrypted: i=1; AFNElJ+G9Az/Hwbzy4O70uAzvkisUmmYSioiDBumT0tE0FLkkFJ97ax0EKrUr/rcTZFJVWkYgvKH2kp9vTs=@lists.infradead.org
X-Gm-Message-State: AOJu0YxVvO6pJjsVmDkCDZgKmXxky1XqE+S2lSVHi3+OQhfFWzVHqFVq
	syZ9Hxcx4RmXkHzZzMYLg8DYR9RW2E0JMKZpVebM0kkkwOLOURqLYrzs
X-Gm-Gg: Acq92OFbrvyDMep+eF/yyHNrcfYoPEn/a6mgGIcled3BPNl8EeR+G2p1kYB5S26X5j2
	avfEBkEZltAmnbR2++EVHkKf/KOfreMw0lb8ysblRbtD5uLPGftIiVJjEtgZy+VTmzyZR4pQtL1
	ssuy5ssEM4RXg5Ry66IZC7L10xMRb3Ao45Hrddnf8sVhlt5kmuTs8qRpcNFv5LvYZpz+OPbaaNi
	mRYV/a1wW0CtDQXGJ7tNbqIFyumq/qx+I6ROqC0LtKovrIaNK05LezjUFN4syz2Wgndf1fSa4U2
	8pBGa6sxuH8UhJzX2zX5EyfnAkIch6WWmt5hEify1FFX74K/K0a2ampNhYjkDc/tDEumj4xRtLc
	jeudN013hfJ4P4DRAZerYN+hZf7jXcDPU7Bc6hXDi7/+494wuhwIuY4jGBhf6xfmDv2T3BtBTJX
	fWVXjJWSPmD8YIevnNV/Fqx2Xmjooc6hOHlm95eIAv4OMYKOeWcFUinBXYupEemIIkxiz1x9Ymd
	SKDtFZzPd33q8DMcVXS7WByIn6R/lJaU+sNBjwksI3sqQK9mXGBxIzVSeFj+LcBjmxecjNKeDWt
	GuaZHkTk1UyCJdB63A==
X-Received: by 2002:a05:693c:68cb:b0:30b:6181:4749 with SMTP id 5a478bee46e88-30b61814926mr736679eec.16.1781385034884;
        Sat, 13 Jun 2026 14:10:34 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d810fsm8973538eec.12.2026.06.13.14.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 14:10:34 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: "GitAuthor: Ethan Nelson-Moore" <enelsonmoore@gmail.com>,
	linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH] mtd: maps: correct CONFIG_MTD_COMPLEX_MAPPINGS macro name in comment
Date: Sat, 13 Jun 2026 14:10:28 -0700
Message-ID: <20260613211031.85166-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_141036_702094_65961839 
X-CRM114-Status: GOOD (  10.14  )
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

A comment in drivers/mtd/maps/map_funcs.c incorrectly refers to
CONFIG_COMPLEX_MAPPINGS instead of CONFIG_MTD_COMPLEX_MAPPINGS. Correct
it.

Discovered while searching for CONFIG_* symbols referenced in code but
not defined in any Kconfig file.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 drivers/mtd/maps/map_funcs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/maps/map_funcs.c b/drivers/mtd/maps/map_funcs.c
index 1a4add9e119a..b0054933cae0 100644
--- a/drivers/mtd/maps/map_funcs.c
+++ b/drivers/mtd/maps/map_funcs.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Out-of-line map I/O functions for simple maps when CONFIG_COMPLEX_MAPPINGS
+ * Out-of-line map I/O functions for simple maps when CONFIG_MTD_COMPLEX_MAPPINGS
  * is enabled.
  */
 
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
