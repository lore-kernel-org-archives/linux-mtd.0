Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B7BC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Dec 2021 12:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y2id3sD1BMf4JHxpTHCE9Uy0ixqQis2qkPylH4xNnP8=; b=p1/ErJ/Wl/9eYH
	g6RpgsZbcWGGlsjN3szlA9YSbpHQ7xXp2I8rCfDIJ9uDs+2+pYXGE00F8QU6DzELvTq90ZBACdczl
	d8thFT8HqoRs2H1ZWbsqgf9GQjxrOgw+ojGnzb0cGBQWvwJTTCnRyQ/W87FjD03RupK6lg2idpr2n
	VI5Up0ozcUBzpLcqTTwMNZUSYOfxhpdLo1zdtZAlbpCfZrnYghJBCBBnRmf7875wwMXOLOoc8hiYz
	TelB9sJlIjSPUfuIcDXr8GY5IrLwX0BTtwxqcc80PNrE5koHrm7JbXyC0QMtIfEsh8QM7UWYYVRNF
	tSRiSxbl+IKDmhWARQBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myCCs-00A57G-1P; Fri, 17 Dec 2021 12:19:26 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myCCp-00A54b-7E
 for linux-mtd@lists.infradead.org; Fri, 17 Dec 2021 12:19:24 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 2A341240009;
 Fri, 17 Dec 2021 12:19:19 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: cgel.zte@gmail.com,
	miquel.raynal@bootlin.com
Cc: chi.minghao@zte.com.cn, han.xu@nxp.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, richard@nod.at, vigneshr@ti.com,
 zealci@zte.com.cn
Subject: Re: [PATCH v3 nand-next] mtd: rawnand: gpmi: remove unneeded variable
Date: Fri, 17 Dec 2021 13:19:18 +0100
Message-Id: <20211217121918.327550-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211213112627.436745-1-chi.minghao@zte.com.cn>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'35a441eea7032d08844b6466ac490a92446045fd'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_041923_429554_A5D0ACE0 
X-CRM114-Status: UNSURE (   3.94  )
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

On Mon, 2021-12-13 at 11:26:27 UTC, cgel.zte@gmail.com wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
> 
> Return status directly from function called.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
