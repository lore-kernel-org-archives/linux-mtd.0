Return-Path: <SRS0=J9sr=ZJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBB1FC432C0
	for <linux-mtd@archiver.kernel.org>; Sun, 17 Nov 2019 17:45:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDE1D2075C
	for <linux-mtd@archiver.kernel.org>; Sun, 17 Nov 2019 17:45:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d3kLzG/Y";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=umn.edu header.i=@umn.edu header.b="nouW5bnh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDE1D2075C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=umn.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=7nwnPO/xTXxv7eBEYYtsj+DiqWZDhSFZxKG8MdmQJq0=; b=d3k
	LzG/Y9/7vGrS7XDirslUtif/WkKD4Jj2jE/NgDOarGEwD8p9FdYVh4hIUGLBNoRE/9gNDcv7R5txE
	Ak0BMKUvBFKfPyaINW5+TWB21FdsB3Ckwcixt1LuWlOMD9RWa9M3hsVVuRXJoftx80HTgVQjQZo5X
	fSQV4w7mHAE49sYvsuk5gsuuIxWQZszS6U9zFtpMAnJhOmAIDF0UxS6DQs19mxr1l7JOKFb+mpEme
	cN9xkZpbwEgufmgz/t/oNSmFF6dk2FAlnD48jUO1UW1H9gzNoEW3Fog3rmVmgDFV/i7V6HL50PAWU
	xw1ldtBQ98th6wI4ly9H48sJmt3sRRw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iWObL-00069Q-AU; Sun, 17 Nov 2019 17:44:43 +0000
Received: from mta-p7.oit.umn.edu ([134.84.196.207])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iWObF-00068x-KO
 for linux-mtd@lists.infradead.org; Sun, 17 Nov 2019 17:44:39 +0000
Received: from localhost (unknown [127.0.0.1])
 by mta-p7.oit.umn.edu (Postfix) with ESMTP id 5D33395F
 for <linux-mtd@lists.infradead.org>; Sun, 17 Nov 2019 17:44:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p7.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p7.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0of4CyBtoVlH for <linux-mtd@lists.infradead.org>;
 Sun, 17 Nov 2019 11:44:34 -0600 (CST)
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199])
 (using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p7.oit.umn.edu (Postfix) with ESMTPS id 31CC595B
 for <linux-mtd@lists.infradead.org>; Sun, 17 Nov 2019 11:44:33 -0600 (CST)
Received: by mail-yb1-f199.google.com with SMTP id b202so11795102yba.12
 for <linux-mtd@lists.infradead.org>; Sun, 17 Nov 2019 09:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=mw/Vlkzgb0El0NgG+DOgWe9VKjNKfsd7T66YcI7lk7A=;
 b=nouW5bnh81fiK2GHy9gbyrglpuSBnRnypaqCYXUs73el/DrH1SM7Lqio9sMJ0rffZq
 q4PB21vYm8aMgrD/Hv7++x780RkHvayKQQjmJGMCUF2Gj6YRPcFDUue2n2MeJ7zDDUQg
 kXXMjj5Q4mvganZCikxTcMdxBRGwG9PqJvpP6hmL7TsrQA5b/uC50RYL61as66DCx5KZ
 etPqQ3Mt9GM3fSvo3bDBixJzFDqQf/YXqs81+YPiGti7A2gbAJx8JjIGsIAfG5nwaqme
 +sDB6VV4IB3JYhdVZdCbDpdoN9/4xX3vLmVvq0Och6ryCH6qZheFXevyqRYAWLIJi2Ug
 p0dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=mw/Vlkzgb0El0NgG+DOgWe9VKjNKfsd7T66YcI7lk7A=;
 b=Q36EyG8k5KvQolTz/vDXd3oC5EmgVeeosfXPmbgx+YcrBh/SsAwumK7G8fg8dgYX3u
 L4f+EuXCLU1n9BU+zsunPRm3nIsuQrc29kL1OqKxFKfV/TMnwqIZMy6jspBDbz3rH+U6
 RCnRzFC0h1wywM+0hLnnM8iadwSW7AXY3j2qrY9cZL+K05xMqRi8CVHOUyKvyX6yulTu
 NjvllCvXSXICb0oeMp8Wld5acQeL4UBojgytxd2jH0iH++ITz4mLOXHyKixyEqciWQvV
 mox4jOw/rig/gbW6WtjDDgFLesjSjcRg7qCrNYHUf/z3yZIAAgzD/2OEQqMdAcg5CHLN
 MiBg==
X-Gm-Message-State: APjAAAV3GUHs32+ahdj1FZjXQBMFloQDzk34BflLogBtBMH3NcvsfFk3
 FZCoTPJAz2Hi+bsGvuAtFG+k5A4g4E50IrH6QM2y8tY8Up9DRnj3QUXhlL28xSpuDmE63hN8vk4
 MePB2MDq9HRta4S5aD0XGVBK1a0gxtQ==
X-Received: by 2002:a25:2443:: with SMTP id k64mr21290818ybk.69.1574012672777; 
 Sun, 17 Nov 2019 09:44:32 -0800 (PST)
X-Google-Smtp-Source: APXvYqxpBTogweemKa79wfzPNbsHtrixwjsjnmo4IwYBoUO8ucS52TaPZMbffuxkMrolaHWZppACPg==
X-Received: by 2002:a25:2443:: with SMTP id k64mr21290797ybk.69.1574012672478; 
 Sun, 17 Nov 2019 09:44:32 -0800 (PST)
Received: from cs-u-syssec1.dtc.umn.edu (cs-u-syssec1.cs.umn.edu.
 [128.101.106.66])
 by smtp.gmail.com with ESMTPSA id f10sm1914590ywh.86.2019.11.17.09.44.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Nov 2019 09:44:32 -0800 (PST)
From: Aditya Pakki <pakki001@umn.edu>
To: pakki001@umn.edu
Subject: [PATCH] jffs2: Reduce the severity level of logging errors
Date: Sun, 17 Nov 2019 11:44:12 -0600
Message-Id: <20191117174413.2876-1-pakki001@umn.edu>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191117_094437_757036_EC9D5DC9 
X-CRM114-Status: GOOD (  11.72  )
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
Cc: David Woodhouse <dwmw2@infradead.org>, kjlu@umn.edu,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Unlike other instances of critical errors that call BUG(), kmalloc
failure in jffs2_wbuf_recover does not require pr_crit. Replace this
error logging with pr_warn().

Signed-off-by: Aditya Pakki <pakki001@umn.edu>
---
 fs/jffs2/wbuf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
index c6821a509481..59e145220b51 100644
--- a/fs/jffs2/wbuf.c
+++ b/fs/jffs2/wbuf.c
@@ -339,7 +339,7 @@ static void jffs2_wbuf_recover(struct jffs2_sb_info *c)
 
 		buf = kmalloc(end - start, GFP_KERNEL);
 		if (!buf) {
-			pr_crit("Malloc failure in wbuf recovery. Data loss ensues.\n");
+			pr_warn("Malloc failure in wbuf recovery. Data loss ensues.\n");
 
 			goto read_failed;
 		}
@@ -354,7 +354,7 @@ static void jffs2_wbuf_recover(struct jffs2_sb_info *c)
 			ret = 0;
 
 		if (ret || retlen != c->wbuf_ofs - start) {
-			pr_crit("Old data are already lost in wbuf recovery. Data loss ensues.\n");
+			pr_warn("Old data are already lost in wbuf recovery. Data loss ensues.\n");
 
 			kfree(buf);
 			buf = NULL;
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
