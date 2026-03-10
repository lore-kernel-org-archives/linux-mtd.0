Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A9FEB1056
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2026 11:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z/mLQuVl+NRj9xj+I4xeKVWZKMaNepQlNUwsR/rcYaE=; b=tL6y0pVXkTrc+H
	cuCeX/QxAysk6Kuz5DR7vgB4TqHG22M1EhCjfUPtvazCLLCDH4sKrUCSxNFLrWISc5XcdaC6vn3gu
	Ib4zYuaQ67QtFab+nWwhMgA+RdVNzV2F1OlOwOUpwBjgDlih20Q6OaipysttU4A+nD/UGQvkk/peJ
	N8BkcHwFCC79J6hHKnGP33/KDh677mPVXLRhSwa6N3VWYJmxy7L6IplyrJApK4DYNzSKAyrH/48AB
	dC/7cKk5I7uEbAmSCSa8lHXfGhkMYHopWXWwUrOEKXzCucT7Z7DvbJQec4KexZZ7DlTJLmmZ7qUzL
	GwvI8AMyQMXnZ64LJuIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvi2-00000009MpD-0oxd;
	Tue, 10 Mar 2026 11:57:10 +0000
Received: from mail.avm.de ([212.42.244.94])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvgc-00000009KXe-03vc;
	Tue, 10 Mar 2026 11:55:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1773143728; bh=qcffqXWHqw29zikXSaMyeqsF5SNAPike03t0qIAEHZQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TM6eg5IsKDZmgxp7GUG67+/57rD9rEUbWduf95eT5FiKywsNOkOROxJd1HgADueu0
	 XiuppY49OLz9JAJVzWK6kmZAydSEKk8Yfb3LCk0edxsTMHOI+GxxxY6TToBD+hBFBa
	 LA63nSKl0Z508Ju4IKsVgpiypr/7gGuby3A+F088=
Received: from [2001:bf0:244:244::71] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.55.2)
	(envelope-from <phahn-oss@avm.de>)
	id 69b006b0-e21d-7f0000032729-7f000001bae0-1
	for <multiple-recipients>; Tue, 10 Mar 2026 12:55:28 +0100
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [IPv6:2001:bf0:244:244::71])
	by mail.avm.de (Postfix) with ESMTPS;
	Tue, 10 Mar 2026 12:55:28 +0100 (CET)
From: Philipp Hahn <phahn-oss@avm.de>
Date: Tue, 10 Mar 2026 12:49:18 +0100
Subject: [PATCH 52/61] gpib: Prefer IS_ERR_OR_NULL over manual NULL check
MIME-Version: 1.0
Message-Id: <20260310-b4-is_err_or_null-v1-52-bd63b656022d@avm.de>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
In-Reply-To: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
To: amd-gfx@lists.freedesktop.org, apparmor@lists.ubuntu.com, 
 bpf@vger.kernel.org, ceph-devel@vger.kernel.org, cocci@inria.fr, 
 dm-devel@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 gfs2@lists.linux.dev, intel-gfx@lists.freedesktop.org, 
 intel-wired-lan@lists.osuosl.org, iommu@lists.linux.dev, 
 kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-block@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 linux-btrfs@vger.kernel.org, linux-cifs@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-erofs@lists.ozlabs.org, 
 linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-hyperv@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-leds@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-mm@kvack.org, 
 linux-modules@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-nfs@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-pm@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org, 
 linux-scsi@vger.kernel.org, linux-sctp@vger.kernel.org, 
 linux-security-module@vger.kernel.org, linux-sh@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-trace-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org, 
 ntfs3@lists.linux.dev, samba-technical@lists.samba.org, 
 sched-ext@lists.linux.dev, target-devel@vger.kernel.org, 
 tipc-discussion@lists.sourceforge.net, v9fs@lists.linux.dev, 
 Philipp Hahn <phahn-oss@avm.de>
Cc: Dave Penkler <dpenkler@gmail.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=943; i=phahn-oss@avm.de;
 h=from:subject:message-id; bh=qcffqXWHqw29zikXSaMyeqsF5SNAPike03t0qIAEHZQ=;
 b=owEBbQGS/pANAwAKATQtBlPRrKzbAcsmYgBpsAaHLW+SPsUXBzKjRGA9Sr6z74iUa0aNCqDAC
 Dpk7k/CQsGJATMEAAEKAB0WIQQ5bPBtrWDUcDQCppg0LQZT0ays2wUCabAGhwAKCRA0LQZT0ays
 2xngB/9RQuwf5oN7K+t7LSQdZxyrxHOJcTw0116pWThU0XUv9UqQRCLX3DDjBAMUn8ivSrQQu3j
 eCXsK6Di/TiAzICtmQnhlrY1llqErJMK6D3gMknGUqPIUGtryg9JlZS983aqFsnI2NTWJkyhY62
 zoummbxiGOU/XB7LGr2KWmHwNok02P+rt7tXG3k25rPUmB1lXXK0IEKQHC6AYoy/xbYJ43MpYYP
 x2moPKs1et3YrKZ7IUmRwsJyLGDoTojj8VT1rAmn5p4RXjrw+bZItwBB2HSkOSM+PFx6Orfgajc
 95nvtBvD0Mtdm01bQJociZB8XX6BHHZ3h1K5cS12ZujFOnCS
X-Developer-Key: i=phahn-oss@avm.de; a=openpgp;
 fpr=58AF7C2E007CDBE62C59E078F50EFDCF8AD04B1A
X-purgate-ID: 149429::1773143728-84E19F2F-525884AA/0/0
X-purgate-type: clean
X-purgate-size: 945
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_045542_306875_8B69DEC0 
X-CRM114-Status: UNSURE (   9.49  )
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

Prefer using IS_ERR_OR_NULL() over using IS_ERR() and a manual NULL
check.

Change generated with coccinelle.

To: Dave Penkler <dpenkler@gmail.com>
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
---
 drivers/gpib/common/iblib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpib/common/iblib.c b/drivers/gpib/common/iblib.c
index b672dd6aad25f2f4f36d2a0ed78a0625651ac8ba..18188228a90178ba0bf7c6c923924a99a8ace1bb 100644
--- a/drivers/gpib/common/iblib.c
+++ b/drivers/gpib/common/iblib.c
@@ -249,7 +249,7 @@ int iboffline(struct gpib_board *board)
 	if (!board->interface)
 		return -ENODEV;
 
-	if (board->autospoll_task && !IS_ERR(board->autospoll_task)) {
+	if (!IS_ERR_OR_NULL(board->autospoll_task)) {
 		retval = kthread_stop(board->autospoll_task);
 		if (retval)
 			dev_err(board->gpib_dev, "kthread_stop returned %i\n", retval);

-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
