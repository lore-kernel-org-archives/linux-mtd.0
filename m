Return-Path: <SRS0=7c/v=ID=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CAD8C433E0
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Mar 2021 08:23:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83CDB65015
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Mar 2021 08:23:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83CDB65015
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HO3u6IrqpxaE7lXv793FGS14kK4WDku501MMkkP4nmk=; b=KGs7fW0o7eTNXnDels/Fv9HsZQ
	W0oGbgguEHcQMq8OrgeqAfnbb5569mKTY2FWuOnO26yLYLpc6QEsCtlUgMXaAapz/poTGCgDgj9ZR
	qmaof2zD8JHSysG1VMHG1vEQn1AtEdoa3JYR5q1aURbhc/iDua64AUv3o+PuXtTqwTjXKbu85ybIz
	vOkzAIUS6bqy+Xb4lPQXonSPpD7pv8xQhVX5jbl5ayIuNjcDH7md5AP+fDCsQd+rgnGDcKG07oKAB
	69f8aisqUoq+30v9BrK6vETFRWkcztUanWxcUN5QsS44tJMC9aZZmLveCIAGfJZoknTdrvQR6XwSh
	Pf8YsfFg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lI5jE-00DyIj-Ln; Fri, 05 Mar 2021 08:22:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lI5jA-00DyHW-So
 for linux-mtd@lists.infradead.org; Fri, 05 Mar 2021 08:22:30 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2AFF364D74;
 Fri,  5 Mar 2021 08:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614932546;
 bh=Vfm/3xKY58u7in+dQGJX80A4aCCKvonFzzMRt83pjsE=;
 h=Date:From:To:Cc:Subject:From;
 b=E82kKsDg5yjDRMd7HE3tnw1X8caSFXjwBZnkPxrrBaPUSSQR9zlAE0+odFDlg0O7q
 ZZcXzYV17/vIOtgUuGogMw0LAMOn+r+16bBRj4X0FdP6DUNSGIBBVgPEvcpUVwV4GR
 WOsmtvVn7iCAPHhLlpO4Sczz1xY/YvPtWlTFEfL0hmz3VpGnt0YPZQWgqWBbKvlfqa
 cpbWOysxfBD0foxRW7vInQac1tW07RoN6dG7fEcxIpU0hIJPrMJEF62dEGeGGHkO67
 Xde72yErDWkA1MaJ9lnV+2GBN6OBTjQLCXtsqiKd11vgpiCLbaAKf+JAQ7eDkvHQpY
 5rqu3J244d04g==
Date: Fri, 5 Mar 2021 02:22:24 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org
Subject: [PATCH RESEND][next] mtd: mtdchar: Fix fall-through warnings for Clang
Message-ID: <20210305082224.GA137360@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210305_082229_185597_3DBA029F 
X-CRM114-Status: UNSURE (   8.06  )
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

In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
by explicitly adding a break statement instead of letting the code fall
through to the next case.

Link: https://github.com/KSPP/linux/issues/115
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/mtd/mtdchar.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 57c4a2f0b703..998d86f46488 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -983,6 +983,7 @@ static int mtdchar_ioctl(struct file *file, u_int cmd, u_long arg)
 			if (!mtd_has_oob(mtd))
 				return -EOPNOTSUPP;
 			mfi->mode = arg;
+			break;
 
 		case MTD_FILE_MODE_NORMAL:
 			break;
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
