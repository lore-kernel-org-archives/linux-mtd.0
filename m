Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3212FC87FCA
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jul 2025 11:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KIVtALgouFLl0gcIjimJX4mKkOT1lD5HP6pEOrteijQ=; b=nG65LdT97rcMya
	kxwQlPUDaZjyBAbU+LG/8/Teujb2BRR8Nmx3pBJK5k6lDNhi9GpuR3+CkjaqVUkP3U1VNZ16WIVHt
	OaiHnh45g9X4tXr0s7IWcST9AR3NanNeOinCOE9EmqUr9iIaGY3p4rXABEU9yUtPHoroVb1G/y45s
	dj4Ou83apc0FZKQfpGcnPe9QGrSrK1N1nFzjp4uRAIeoUuDjB4Ym7hztDN7+Jz0WAaG47ID1SuY0c
	uEtdILXCIxLOxcrfwYDnizfsDRyi5WpOOIPyklpXSUwYjA4OLuz/RAMgmIlsqi0XvkySBr950uMRS
	ZeNnL27gfyp7ahv+f6HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueXfY-00000004o8m-2qSG;
	Wed, 23 Jul 2025 11:29:56 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueXeY-00000004o5s-3eIu
	for linux-mtd@lists.infradead.org;
	Wed, 23 Jul 2025 11:28:55 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-45622a1829eso21351755e9.1
        for <linux-mtd@lists.infradead.org>; Wed, 23 Jul 2025 04:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753270133; x=1753874933; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RYqwGQGg9G+li5qGdiXaV1zvCAaRtSwFqLFaij08br4=;
        b=nlWmW1m8HpMQDzj8YMt9rGt9w6Kp07iens8dmdlsqfXRyOAXMk+Pqif9JXxvesryEl
         Y1zIOVUYEhnFjg/ncb1JsvETV9IOtXa+HLnaD3D0avltqK6WkCStXpcFNKscmevZ6QWZ
         lUivsHx9J0FDaJLwfz55o09/4KN/KZHfgkeAIYvQvZJH+/1PLCZiITqcc3h+ZhsbHWNw
         pFdJkNSwqxhH/mghKhrPcyM7nq0EhjVTvpYaybP1F7YPAL8DLcm464E1rZBNbLIin9t/
         Ys3KoyIxfQVyNLAzZb1/FNIHApHPBll64njOYHQzZIgUauiiBfNTCfPf6MyDBac/TJqE
         3lXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753270133; x=1753874933;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RYqwGQGg9G+li5qGdiXaV1zvCAaRtSwFqLFaij08br4=;
        b=NEC1E4tQ6Bg+4EEGx0yuN0CPIN0P6Go0Hjf2nox0UaNRhaXzIcMeM5/PC2AjcUATxW
         MkAPG3qJrYn2DecFtZFmE0VDONUcct7/nIwykDc/KZDlRb0W/aU2v2uMmoCaOFziE1PC
         p51T/1z8p/8vzpQgQmXprfS9YAoXUbhpMGv/uu69MVh+7aoPEc0QrSxBRU9lwX6KUEkq
         Q8f7UPGhrl10kT4irfPsUEnqqbFHdPSIiLpTjLQY1p+egtFqSCfDST4lMzcxiyr/3fX5
         MaYY7GnLVjj0+51+gOSUcJVVGiy5axHcBoYcVEHTdHCZo/iXg3oguivPHZi83diPNDVs
         Hl1A==
X-Gm-Message-State: AOJu0YwOtgPyOlZWzwtCrxbDghD+ZvQFP4ub3F9VTO3I5mS5PXLr9xlI
	7tAcfcbr6gJZaUH4Okz4jbkEoeHFP5KSmfA4ET2FKwZOH64HKwNXnc5eaZh3Mw==
X-Gm-Gg: ASbGncsuSSlylR+aH6zXvPJzDqB1Mz8+8Tv3Mw18GhdIbqmC4REVoc03g84JZkuKvbI
	8xHzZP8k91bOi1+OaBc5HgIxxBDbKX7uzS+caWbKMB4sKq31G93CkWuXxfejy7Qgkc9y7Z3Qe8M
	YgqYyLPjZOoKtgoz05bgdfnG/va5sm9hEZBE/A829acOBHKjHWrRR9bhJC7JMg1x5W1rZQoGypR
	dLf4fO/ZBmxFdTzFPW7iBR4ybb5ax/kRpDDT4SmhMBCI5Do2UshurY0xhq/zCxc2Gl6ZwYx7V3p
	jtdBa5xGggTC5Or2cUfaC1/wZzU/bx1A9R1Hc5X9ZyOm/0c8STk0Uvse71sSGAe3d/MhYLVDoTq
	bkqbBo4xnXLy4XwRlKCWcZ6UJzB22dab25qojoACCnWrGStVG/R0=
X-Google-Smtp-Source: AGHT+IFHMy8KbpGHwSEjcPSbC5uRlEwgSTCpU5f1NEQZ+JTAgLHf/NV/PtzVzqkxRPquvh0LQUYn5A==
X-Received: by 2002:a05:600c:524b:b0:456:1d4e:c14f with SMTP id 5b1f17b1804b1-45868d69f9bmr19391905e9.28.1753270133072;
        Wed, 23 Jul 2025 04:28:53 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b61d7fe48fsm14880259f8f.14.2025.07.23.04.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 04:28:52 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Wed, 23 Jul 2025 13:28:41 +0200
Subject: [PATCH mtd-utils 1/2] mtd-tests: flash_speed: really skip
 destructive tests
MIME-Version: 1.0
Message-Id: <20250723-flash_speed-fixes-v1-1-9a7e52d26fa9@gmail.com>
References: <20250723-flash_speed-fixes-v1-0-9a7e52d26fa9@gmail.com>
In-Reply-To: <20250723-flash_speed-fixes-v1-0-9a7e52d26fa9@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_042854_911017_0DF3C6ED 
X-CRM114-Status: GOOD (  15.16  )
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

Although both the 'multi-block erase' and the 'read-while-write latency'
tests are destructive, but those are executed irregardless of whether
destructive mode is enabled or not.

Change the code to skip these tests if the DESTRUCTIVE flag is not set
to avoid unexpected behaviour.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 tests/mtd-tests/flash_speed.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/mtd-tests/flash_speed.c b/tests/mtd-tests/flash_speed.c
index 11f396c597153632432bdbe6f22369b1a4bb8579..ee162891d5c9288ffb9d09eb2c649db027eedcba 100644
--- a/tests/mtd-tests/flash_speed.c
+++ b/tests/mtd-tests/flash_speed.c
@@ -490,7 +490,7 @@ int main(int argc, char **argv)
 	}
 
 	/* Multi-block erase all eraseblocks */
-	if (!skip) {
+	if (flags & DESTRUCTIVE && !skip) {
 		for (k = 1; k < 7; ++k) {
 			blocks = 1 << k;
 			printf("Testing %dx multi-block erase speed\n", blocks);
@@ -518,7 +518,7 @@ int main(int argc, char **argv)
 	/* Write a page and immediately after try to read another page. Report
 	 * the latency difference when performed on different banks (NOR only).
 	 */
-	if (speb >= 0 && mtd.subpage_size == 1) {
+	if (flags & DESTRUCTIVE && speb >= 0 && mtd.subpage_size == 1) {
 		long rww_duration_w, rww_latency_end;
 		long rww_duration_rnw, rww_duration_r_end;
 		bool rww_r_end_first;

-- 
2.50.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
