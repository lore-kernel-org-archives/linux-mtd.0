Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6930FC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Apr 2022 09:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SWkqaPpP81ZpEcKuZmj5jXjUTMRAystlES4JS9r5Rr4=; b=tUN4g/aDd5by8+
	p7wEyfXIG1E332VPbFCOqUkoBmfa7naEDtKyEXksvjpDMrQeoS/qtvQX8BwBbugoDxOfBIg833lYt
	SBgsdFPJhC2mHay+S5+j/98QIWrCxh/CIIP5V6jnE/KDMN8pQBLObs1ss0YGOZRxADl1iIC70mx7+
	I4+BygEelVLeiT+mxsCKZNhTQLm2ad7ZDjCerwYiZFeXu4lcQUt4inKSsa9b5E7piu55S0+RdvH2J
	5CzlKit1trV279baayGpZFhn1U7SeCivB1nA96AWOyhMH+w8sqsy23qYtTmUGe9iOg9HS9hlk9Bnk
	AxV/r/0niAfQPVXwyd7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndpwW-007iz7-EI; Mon, 11 Apr 2022 09:02:40 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndpuf-007hiB-LW
 for linux-mtd@lists.infradead.org; Mon, 11 Apr 2022 09:00:47 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 14CA11BF20E;
 Mon, 11 Apr 2022 09:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1649667641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=++jLax8sR9pn5mPU9t/CMQ0Kj/6sNh+shn1ykS+deAw=;
 b=A2UVo0+sSv2C3acp212wvCCjmE7zzudbRXzQb4q5gT7AYicz67d2HVkU1jcKi8a4sVhw6l
 Tu/PPe8hNd3pQbSDZl7UedEDNP3ot+jrv527UbdnocNe+fXBQNxcBLNvzVv2xM1nZ0mKzT
 1YTiK9PVuQlfg/C0bswoj2hWKWCYZ/TByatVei/M5G0D+EIKsQV3U36ELb3hSD1cEj0Msq
 BBWFMQ5n5ND5+SWkTyeYKIxmadNJ0GnYkD6O+jnU1DH5VTJFuqG1X33NWrmVNhq4If6aj8
 p0h6zmi5UpCJfRHM5aHyFwQZ45QqulVvTVP9PTG8dewfhq9rue4ZvQlmT6alcA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Roger Quadros <rogerq@kernel.org>, miquel.raynal@bootlin.com,
 robh+dt@kernel.org
Cc: krzk@kernel.org, richard@nod.at, vigneshr@ti.com, kishon@ti.com, nm@ti.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] mtd: rawnand: omap_elm: Add compatible for AM64 ELM
Date: Mon, 11 Apr 2022 11:00:39 +0200
Message-Id: <20220411090039.11071-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220326080726.30372-4-rogerq@kernel.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'51a4a71d974c25dc102216a52462ff6d53eced15'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_020045_897931_9CAD6837 
X-CRM114-Status: UNSURE (   5.09  )
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

On Sat, 2022-03-26 at 08:07:26 UTC, Roger Quadros wrote:
> The AM64 SoC has the Error Locator Module. Add compatible id for it.
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
