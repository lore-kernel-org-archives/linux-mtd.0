Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20AABC7EE23
	for <linux-mtd@archiver.kernel.org>; Tue, 23 May 2023 13:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:MIME-Version:Message-ID:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ioZb8JXsOENqjqK6Ige3UQjCmhwlQuo3WmM/wsIUaQg=; b=GeStWT/mHETPEu
	Ix90xrtKHZUjIE+yuNa24YA2dO9BtZmCEtkgs1dkONCs1zxeml/mWXuqgJmigCJmLaJb64AnTFPE1
	2DRG4yZTmlj7E4GJtWlBTKMddEi0S9oCfMcsL+mPnbq8tZT9m+sqtHuV2Ta5iVA9gV1dlFT0WGSaj
	y/4q5KO7iDpCnQfez/oXbVExSN535lyCmcunBp5OzGbcRTYVVK8gIT63Vvtf05vSkC7V232IH8lgU
	bmtPhTT+DO/v4yjwFxQjh9149wMxfFMvVJ1mxTEgCuidmyXxOQCUjRNXsmhxyizrRjhzBahhmaCCN
	7vQzfietAmhZqwiB8lVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1RoX-00ALJU-0f;
	Tue, 23 May 2023 13:12:33 +0000
Received: from smtp1.axis.com ([195.60.68.17])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1RoT-00ALGG-2p
	for linux-mtd@lists.infradead.org;
	Tue, 23 May 2023 13:12:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1684847550;
  x=1716383550;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=Oi147oEa3nhPtkW+NY7SaOGr0dK4fTZurgjJRfIU1zs=;
  b=XrPxiGczi3wxYbci9og98ZASPZqlPjju0RaxR8bA+pkF/7KB5+NbE2mK
   R3/ij7Oqm9dpUkJQyLlJ0PDMaje65eQT9+kXvub+24jk2Q9SCuu81aupm
   nGgmAOzttlAjVS1YUJTEpz+pnzlNIH5sjW8ZJM87n+xxpFLWhqrlcKS2Q
   1UlETeqSPyKjwwjR8FPb0qvStgNLSlhE745OPNXgcQ80r/PyBzuj60nZe
   1aSBQTF/kpSUVLOmwvcwGscuCGJOZ5XU1cmbqyvSmodHWTC+acfeT28t9
   ktdUoSjd3NTAxXxNNdjGgGKiCvIM3ZmrUbXD8PFLUYGKB6oFCrh2birh8
   w==;
From: Vincent Whitchurch <vincent.whitchurch@axis.com>
Subject: [PATCH 0/2] ubi: block: fix use-after-free and deadlock
Date: Tue, 23 May 2023 15:12:15 +0200
Message-ID: <20230523-ubiblock-remove-v1-0-240bed75849b@axis.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAK+7bGQC/x2N0QrCMAwAf2Xk2UDX4hB/RXxIauqC2kiKQxj7d
 zsfj+O4FZq4SoPzsILLok2tdhgPA+SZ6l1Qb50hhpjCMSb8sPLT8gNdXrYICvE05jKdUgnQK6Y
 myE41z3tXzJg87ubtUvT7f12u2/YDeDoMensAAAA=
To: Richard Weinberger <richard@nod.at>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@axis.com>, Vincent Whitchurch <vincent.whitchurch@axis.com>
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_061230_614382_227AFA46 
X-CRM114-Status: UNSURE (   5.37  )
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

This series fixes a use-after-free and a deadlock in ubiblock's removal
handling.

---
Vincent Whitchurch (2):
      ubi: block: Fix use-after-free of gendisk
      ubi: block: Fix deadlock on remove

 drivers/mtd/ubi/block.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)
---
base-commit: 44c026a73be8038f03dbdeef028b642880cf1511
change-id: 20230523-ubiblock-remove-eab61cf683f0

Best regards,
-- 
Vincent Whitchurch <vincent.whitchurch@axis.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
