Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB1A5C433E0
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 14:18:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73FBF64E90
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 14:18:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73FBF64E90
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eaxlabs.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y/KRUhVyR7HezjPwij4PKNdhzkw/hTN3AUWpX/hFDs0=; b=eHirjIgN6cm5c/mZQWoKAPs4T7
	m3S7191GEaAyZtX3cOtbb/9VYDQRf89XX79zjs+K0XEQ7ieS84YXCy5J72GQr5I5tsbqzzdDI7xuA
	3MUNfv4Jop532XezCABsEqEnFFQCPzFgwyJgO6NQz6VtA1kc6K/oaMcLzoa0ozcoYOUPABaIhRvYe
	8X5a2uO3QjuvNvo3WlGvWLh0DPtSXTW5I082Rcp6MtgwQPvY0mZ22AmnCBGS8b98of9KCulErFban
	sXudMuvLjrw2oXcEc30WE0UGYEggdOEHyLqBnsD041KfdrwS07chjex0S7NFL2odOEMKcFfEp6knu
	QkvuhWtA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHSJR-00561c-SQ; Wed, 03 Mar 2021 14:17:18 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHS6r-0052br-ES
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 14:04:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=Kubqf6k/HZUq1mdBnL+ASxzPtFgpk8F6M2q021zdR3Y=; b=K9zfZxbgd9yZ/QOxvPvrvlkouZ
 +NkPtQLXwaVzxkN21ETmmMVrZGpPvnR5z11ceYbuQq9IIsJ0WtC8I6GQMT3QrLP3JTA9zxrM2ODYZ
 sgaMDGOffETmB0C4+Jg+LGysiNsMJfCg7INsi6FltUppRvUx7jL2AGbglxMG0f3wBwQ6r2sD1uskH
 LeXoMPwJxRHVJiQJCzDU866zD0/JEff6xPlXZk1F2zC8QRpZN7DqceeAcVdBHaCJubTZxD3vBi+WI
 A4zMDVlRypSQMTxlQL5MG0FmIPRlBPtYsGqyo0k1KCpw0Af7uc2+UcdKyANNtlKCzOsgfowhTHwQ9
 mY4nMxHg==;
Received: from ms9.eaxlabs.cz ([147.135.177.209])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHNSp-001whO-GA
 for linux-mtd@lists.infradead.org; Wed, 03 Mar 2021 09:06:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=eaxlabs.cz;
 s=mail; h=Message-Id:Date:Subject:Cc:To:From;
 bh=Kubqf6k/HZUq1mdBnL+ASxzPtFgpk8F6M2q021zdR3Y=; 
 b=q3cEGdXKm06swwTo/nG33yAV4xWpwl9cd3gHGbMo7xPwKclbVADUPWxqJpNBTIE84lg7Tzy0jJH1TOUM1FEzrJXY+d4na5onNrb/wE+pZ4eFd4atmjrksToShNzAywwidXKqtRnPb7k1sx9IB+Zxx/KwZDakFrJGL9wOGbu5FuE=;
Received: from [82.99.129.6] (helo=localhost.localdomain)
 by ms9.eaxlabs.cz with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <devik@eaxlabs.cz>)
 id 1lHNSf-00081H-L1; Wed, 03 Mar 2021 10:06:31 +0100
From: Martin Devera <devik@eaxlabs.cz>
To: linux-kernel@vger.kernel.org
Cc: Martin Devera <devik@eaxlabs.cz>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
Subject: [PATCH] ubifs: Report max LEB count at mount time
Date: Wed,  3 Mar 2021 10:05:19 +0100
Message-Id: <20210303090519.9716-1-devik@eaxlabs.cz>
X-Mailer: git-send-email 2.11.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210303_090639_994004_4D104CE9 
X-CRM114-Status: GOOD (  10.40  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

There is no other way to directly report/query this
quantity. It is useful when planing how given filesystem
can be resized.

Signed-off-by: Martin Devera <devik@eaxlabs.cz>
---
 fs/ubifs/super.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index ddb2ca636c93..178680d2338f 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1552,8 +1552,8 @@ static int mount_ubifs(struct ubifs_info *c)
 	ubifs_msg(c, "LEB size: %d bytes (%d KiB), min./max. I/O unit sizes: %d bytes/%d bytes",
 		  c->leb_size, c->leb_size >> 10, c->min_io_size,
 		  c->max_write_size);
-	ubifs_msg(c, "FS size: %lld bytes (%lld MiB, %d LEBs), journal size %lld bytes (%lld MiB, %d LEBs)",
-		  x, x >> 20, c->main_lebs,
+	ubifs_msg(c, "FS size: %lld bytes (%lld MiB, %d LEBs), max %d LEBs, journal size %lld bytes (%lld MiB, %d LEBs)",
+		  x, x >> 20, c->main_lebs, c->max_leb_cnt,
 		  y, y >> 20, c->log_lebs + c->max_bud_cnt);
 	ubifs_msg(c, "reserved for root: %llu bytes (%llu KiB)",
 		  c->report_rp_size, c->report_rp_size >> 10);
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
