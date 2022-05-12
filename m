Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D433FC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 12 May 2022 15:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vN1ZCTIbNMWHbaoPNQQlcsPDsBLpjIFoCEgOSKpe+vU=; b=13gwT+RBvlO/hI
	408fSENYk1cv3f/cj/DpN3wEG32hNPXcwJEGJG+OnElmowSbT8drUZWQqhtSZBzB/Ww2XaMZ4GdcJ
	w1aGLBFEYo4lkQcuR1G/JPIax5DWr8C4DAo0J3RnQu4RdRr5x6KXUYtv1hyM/j1A5hQ29xcBHv3NV
	4LXCumDASVhtswByVV0ocYLjC0aVr6HmVqzPZ7fglD9ZulP0RShByrM7LA1VwQFf9MXWkISP+NCIW
	rIC5YB3B+sieshzf0UhIEeNGxDqL9izZbmfO1OX9q1soGgbg7goygM1x7DBDQVrxUz5MiUtfQtxgU
	tgDU/m4aL+0Q8I3ggdHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npAjU-00CcJy-My; Thu, 12 May 2022 15:28:04 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npAjL-00CcAd-Bg
 for linux-mtd@lists.infradead.org; Thu, 12 May 2022 15:27:57 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0F88B1BF20D;
 Thu, 12 May 2022 15:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1652369273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ryxbj/hbMDpiluY0P3QJ3SMPgo/AK7nhfWgga+S7D50=;
 b=anp53aNS8qZcPRGRZCtXP/0V80hNU2PzkYAVKjccc8htr4LlpsUi6kkCtEGqpKPsI2zJvl
 EqA4Y0AdzfkWCgvCU8mibe6ZmhzgvqtFsWAHH34L01KOFcHLBec5PzLVX/S2RBmWCQfQn4
 cYYWD+C+CxDp/O9sP70iz0xLdLfVIhKjtlB0PT2cN0OqKkoaiNDoqsQYhZgmqqfW02x2dp
 UCS7FuYGlCuCJdHHduyr1iwfZLLY3y2EDyqxC1+CsBD9bmHj71CrGG6ddyK4+ymk06uptB
 3Udqa0v8/mWM0tdK+frbbTbmcxTTxwiLF4lqHWUdkqDMkHPRubdHDE+1WOZDsA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rickard Andersson <rickaran@axis.com>, miquel.raynal@bootlin.com,
 richard@nod.at, linux-mtd@lists.infradead.org
Cc: rickard314.andersson@gmail.com
Subject: Re: [PATCH] mtd: rawnand: kioxia: Add support for TH58NVG3S0HBAI4
Date: Thu, 12 May 2022 17:27:52 +0200
Message-Id: <20220512152752.245210-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220429083931.26795-1-rickaran@axis.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'773898127ebff6056d207c9b5901e97573999b74'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_082755_612723_7560759B 
X-CRM114-Status: UNSURE (   7.69  )
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

On Fri, 2022-04-29 at 08:39:31 UTC, Rickard Andersson wrote:
> From: Rickard x Andersson <rickaran@axis.com>
> 
> Add timings for Kioxia/Toshiba TH58NVG3S0HBAI4. Timings
> for this memory matches the timings selected for
> TH58NVG2S3HBAI4.
> 
> This patch increases eraseblock write speed from 5248 KiB/s
> to 6864 KiB/s and erase block read speed from 8542 KiB/s
> to 18360 KiB/s
> 
> Tested on i.MX6SX.
> 
> Signed-off-by: Rickard x Andersson <rickaran@axis.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
