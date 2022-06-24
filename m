Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F0C0C43334
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Jun 2022 18:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xtB+yuS+/k/juo3Hp1vA3UQLYTO94jDA1sDCPfG0U6U=; b=0iiBvC1OrxHUXi
	P5lxgmb1WYYMwQEIwbboafifG3lrioNX+x6QKC3QD9WmElivIkh7O1wZhPg65RcIMtSPr61Dt6vmP
	E9p9vjjho5xIPAF48LPtryOii0YRZeEH+VBGx5H+g2H5IEmq7ay1cD7JymzsGr/JRJjPDib80BGRm
	RKFG5R4lDxSwAGoQ1yimU2ffMt7Yd+9SgDOH9hHXu2zhje3/TMllJzK07YA7vnrlsEsEqYmkhkCTO
	1Xx25y6234MwM4alvs71KNjgUA+VIsiPKC1GZK1xlTFCZuUzNncuM+gRoh8Gaj5caIXJ2YiUMDS1R
	a4ekQkNLWlhX6TcJaR4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4oMd-003X91-35; Fri, 24 Jun 2022 18:49:07 +0000
Received: from relay11.mail.gandi.net ([2001:4b98:dc4:8::231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4oMa-003X6L-F7
	for linux-mtd@lists.infradead.org; Fri, 24 Jun 2022 18:49:06 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 4F0A9100003;
	Fri, 24 Jun 2022 18:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1656096540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/ih1cpLz/KI7jvENNa5R73c8BakQ/fBBWVL3gh1DAWw=;
	b=oUfSu6LWRcfjNA9z+NJke9PkcvVpE64zMMPcnnVCpYUO2IRe8RmTFGQAswe1YxkcjOKKUh
	ROIIscx1j2kS6gMTMWg0SKycM2vXzIA1RfHYgdcahIPRGIQDyfrIgS1TI9KhEW2t0FJfT9
	T5kFk0TL2H2a2ByPm2DVE1kjvIJyvOhjhEv0hHZ/j/+kROQxqOeVI9lsjap2v+Pa2NdEVo
	rv/wgt8O/4H2anWjvF1fBuGr9DV7NKBKM4flGhHRzi448YKzHsDjv/GQKlR2oQKZOVE2bf
	yFUPCi9XaYUv2qirLcr1bwp4ZjcwJrW2dTYoipJI8NuLf1ZJnf3XTvMCALrCzg==
From: miquel.raynal@bootlin.com
To: Jiang Jian <jiangjian@cdjrlc.com>,
	miquel.raynal@bootlin.com,
	vigneshr@ti.com
Cc: richard@nod.at,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: sm_common: drop unexpected word 'is' in the comments
Date: Fri, 24 Jun 2022 20:48:58 +0200
Message-Id: <20220624184858.1888057-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220622160511.11679-1-jiangjian@cdjrlc.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'431eae20a093fe3a47cf617b01b911ef39ce3a83'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_114904_669266_92F32099 
X-CRM114-Status: UNSURE (   6.26  )
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

From: Miquel Raynal <miquel.raynal@bootlin.com>

On Wed, 2022-06-22 at 16:05:11 UTC, Jiang Jian wrote:
> there is an unexpected word 'is' in the comments that need to be dropped
> 
> file: drivers/mtd/nand/raw/sm_common.c
> line: 55
> 
> /* NOTE: This layout is is not compatabable with SmartMedia, */
> 
> changed to:
> 
> /* NOTE: This layout is not compatabable with SmartMedia, */
> 
> Signed-off-by: Jiang Jian <jiangjian@cdjrlc.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
