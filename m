Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E2DC43334
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jun 2022 12:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zcq1hBxrPH6fjUa6sDxk9HEQM3BMCuKFfgtqyk2c1cc=; b=OJP7ozdz23EQdy
	FCoWfQPWDsC0Hpg52GmPvhVWJ3u0lWAjFXNEgtd047AHGMZ3g+GNIsVHDVuwIfe3gs1HzqDpjiVtC
	+RrG/C4CJQD2EVnxU9clHzBultYNO0OwdGuMRjKDFCVmR34OBYPasME5dx1CelYm7mNab/hf1Cv0k
	byguwkUn3AX7gCCGw1mF79DquK4HlWumywOg4G6Kb8c7rE87VWd3WT+Eti/TJy89x2jonGIcmFa+L
	nj4j0XjSGVK2gHhuaTIAaMNjtzVofG/MP9JGtMXY/Xibb9aqZ7FiXc+Hg/msWPT7fCPB6BTG/+6OZ
	KIix/STVLJppi95ykoMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHV8-001pgQ-Lq; Thu, 09 Jun 2022 12:43:02 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHV5-001pd7-47
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2022 12:43:01 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2A06340002;
	Thu,  9 Jun 2022 12:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654778575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gauR0IeO9V9B4LdpFBz+k8Phc4tQZsAP0b5/H8FNiXY=;
	b=aBwF1q0l531gsHNFUF30uoJqYrAni6Zi3U59vOuenMU55l6sTd3VE7PbxHWEGRF8gCPouo
	0HiWvnvKvgYZTkWoze4V7YhL1OZJ/dL7KJG9VzjYi/uIhVDbd4u755AUNvAdMDXhS7bXd8
	Z2vPalpt/FvIY/jROQ8Q4I4z8t+EKJbN/D7lR936o6F1nNFKKrOBjtj1DEI+0TC/ujqksc
	oTaRDPfZ526DPqzJ6YcZEDiACQO8fF2lpvaBQGdM89SEvpgSkJ85UY45Yl2kSc7USBxaVS
	BFVPlV6oggUN5W6dIeatIvRTsTnUe+ExWun8WFzaoUDR5H1uS3/v4N7Zv/VyOQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Duoming Zhou <duoming@zju.edu.cn>,
	linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	richard@nod.at,
	vigneshr@ti.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: Fix deadlock caused by cancel_work_sync in sm_release
Date: Thu,  9 Jun 2022 14:42:53 +0200
Message-Id: <20220609124253.133037-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220524044841.10517-1-duoming@zju.edu.cn>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'5d262da93ba727c7dd09e0a247314a0befc2bb58'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_054259_355599_C43AAB0C 
X-CRM114-Status: GOOD (  10.97  )
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

On Tue, 2022-05-24 at 04:48:41 UTC, Duoming Zhou wrote:
> There is a deadlock between sm_release and sm_cache_flush_work
> which is a work item. The cancel_work_sync in sm_release will
> not return until sm_cache_flush_work is finished. If we hold
> mutex_lock and use cancel_work_sync to wait the work item to
> finish, the work item also requires mutex_lock. As a result,
> the sm_release will be blocked forever. The race condition is
> shown below:
> 
>     (Thread 1)             |   (Thread 2)
> sm_release                 |
>   mutex_lock(&ftl->mutex)  | sm_cache_flush_work
>                            |   mutex_lock(&ftl->mutex)
>   cancel_work_sync         |   ...
> 
> This patch moves del_timer_sync and cancel_work_sync out of
> mutex_lock in order to mitigate deadlock.
> 
> Fixes: 7d17c02a01a1 ("mtd: Add new SmartMedia/xD FTL")
> Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
