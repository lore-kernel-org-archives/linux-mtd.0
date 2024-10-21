Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C51F1D0E6D8
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Oct 2024 10:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pId/Rf3mGPprPTAi8+9382H7+tqRDdhsJgQPxilKPGQ=; b=pzhyhvBy2WHo6A
	QLaO/k18/QO//5evvGDDuLIykJQ+RYt7jtjWLvjHqs7mtYmbhbb+UAVMsfCQmi68ublERabHtcjlH
	RItj336pOY31P6Ja2AEkM2tup6eCdA/FSnsU06bQAAW97627S8y4UvudzNFmvQARRJxcEYArCYc/U
	ZjwayZr/JaEfK10DjoWIgkskmBrKN8yrHE0fJJe0Tvbb0b7eZFWUqZ2WFMxdLgPE42fgFsjAEpNfh
	Z520War2NVnoFAaPM1+0GSLDqWddB2uKMw5aVH+0I6afbz9a3X6HD1zvjxDWlT3eB1MReZFzirhmw
	w+/G54YMtRV2W4qxnBqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2pH4-00000006oOV-0aVF;
	Mon, 21 Oct 2024 10:04:30 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2pFL-00000006nrt-1OvV
	for linux-mtd@lists.infradead.org;
	Mon, 21 Oct 2024 10:02:44 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 50C56FF813;
	Mon, 21 Oct 2024 10:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729504961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jt4ag5MKyMd3xgYncsPFdm31U3M1z0irrsL8f/DQljI=;
	b=nVvlQPAUCCdLBIJWZ9hiWMraywkcDWO2Y0kLB4GGWQQOQXTL1UpZkZfS8JHZlYodhZsAMc
	JELm0CH5+uoebbZPgy1ktk7KdfNUXJVXghPoApSp4QoK+5MTim2ezKjS5BrYcYn8wLpwOS
	TOR+J0o0U0y5dhW8tgC+t9RcPoE2K9lMm6YoRLhkMyaV1f01gh3hpWsGSte+AnBWuMZ0X8
	kT4ZeiJSHGaApwvItirBExtns+esL2I/wqjNI9oTPmj+XY99eXoZUF0bvuuc7PrAzWDrsA
	yLT0+r8CL9HW2o9giaap/EcQ9zNFnkIW5eUI18ltuGaqbRebgLkBOMSoM2aTlA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Han Xu <han.xu@nxp.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: imx@lists.linux.dev,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] mtd: nand: raw: gpmi: switch to SYSTEM_SLEEP_PM_OPS
Date: Mon, 21 Oct 2024 12:02:40 +0200
Message-ID: <20241021100240.173393-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241007191319.220775-1-han.xu@nxp.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'bc1bd939c4caa57a421c8cf3492140e2820a4860'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_030243_537766_F1B14FC2 
X-CRM114-Status: UNSURE (   5.43  )
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

On Mon, 2024-10-07 at 19:13:18 UTC, Han Xu wrote:
> Replace the SET_SYSTEM_SLEEP_PM_OPS with modern SYSTEM_SLEEP_PM_OPS
> alternatives.
> 
> Signed-off-by: Han Xu <han.xu@nxp.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
