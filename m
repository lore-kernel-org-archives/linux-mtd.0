Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 329A1EE7FF4
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Sep 2023 15:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M8Xk3YoggbCRSZfA8vOkIIZaZfwT9zxrjYq+9wgGyyg=; b=iXuswH2U7R3ib3
	QFdL89hOvSlSQcus4d8+koFpdVDMJyGOJoWff4rAE97PyPugxP7n+lQzXP/hAr6CSA/Jr/FKFNVOm
	8zEwk48xcJk/Kr4IOy1EINqhTaG/yoLRUZQoH3YKCARjrezMHSOC3wXSnXvJEzsgCmVQwX7Q+cL5q
	M0mVj+DHmYyPuEbFYC4CmKIs+uCGhmgHsuFLFrBlC2/L7U2pMKKJDU+7ZqZMyvOpG8c7+VCW8VU2+
	buqR9BswvLvK2E6aIri2xmLOKggdccwGc/kKJD2j9MSsOxx7d3E2tiALpE5IerJGBp4qqIUIo8PD2
	uPucnh5uVX+lll6bGpYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfjID-000x6j-29;
	Mon, 11 Sep 2023 15:57:41 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfjIA-000x5u-2y
	for linux-mtd@lists.infradead.org;
	Mon, 11 Sep 2023 15:57:40 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 85A7D1BF217;
	Mon, 11 Sep 2023 15:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1694447853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TcFTsMd4fHO74CNS/RMQWzBEkslu6fs0uuYCF1qK7u8=;
	b=XgeWyQbrqq5fyTEouWK5lcXw7uSE0/1oWoQ6d2Y0xzfaiomDOCOJE93Q+skULblOrsgceR
	poi/VRy8fWqi+ET/jEWYkqPWn70ZHEnOUHVegJql6iZB7DOzahRYtp8kOQKUSWJHGxn+Ji
	g9VGCqQutlrqZc2FBhHqU0VGSSybUaCj7YbuwwHmVUqpVu1Eb1Rn2T1LjG6tM2oZ8MjtJw
	NIuFlVcjOwJr8gbllfQu4A6SDCQFp7Y6bckCJx39Fx3q8WEfFiYm/AmtknYu42BWta4eUI
	nP5p4ewPP7Qt5TNAx4VX2d6HKFLXB4WMmEjCY6h0VkPm1c977XGzpHv/hWOirA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Denis Arefev <arefev@swemel.ru>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tom Rix <trix@redhat.com>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: lpddr_cmds: Added literal suffix
Date: Mon, 11 Sep 2023 17:56:48 +0200
Message-Id: <20230911155648.688138-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230824130215.10396-1-arefev@swemel.ru>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'8ffd18a6744b18ff9b58abf7261aaccd78be98cf'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_085739_102664_D7D1E10E 
X-CRM114-Status: UNSURE (   7.50  )
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

On Thu, 2023-08-24 at 13:02:15 UTC, Denis Arefev wrote:
> The value of an arithmetic expression
> 1 << lpddr->qinfo->DevSizeShift is subject to overflow
> due to a failure to cast operands to a larger data
> type before performing arithmetic
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Signed-off-by: Denis Arefev <arefev@swemel.ru>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
