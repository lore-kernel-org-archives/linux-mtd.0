Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B06CC433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Feb 2022 08:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g3vMp8mxiAtFdr7h2sY8ihYtisZwCr3Zy/ixYElZJBs=; b=STdvt00qwWa+hX
	GwZV4UAfn5n8N0Jch0XFT9IvojvJyVSq/tVtomrVdyDoPyr/y7Zj9Sya1dhhRn99BEReAXDpJI+bS
	uBztGMyQyKT9MGn3HSpUP6JeR2pEpxfMJFzZdRrqP9Ivjxv0YTooBrQoUo/rZU7oYk5sTOJvtl8ds
	nFpQVlFuxEynjreAPdFnSbElXx+xt9aWoVzOthbHf+CCjRzFY/jP8TwegBUvrhJB+BCeZ7hg3ePNm
	HuwlXGfAZ7AlnNH40PyFSi66Mvn23jRiVNMTKsozKlYfar1d9la6neEcYz8o9bKgAH1qcpV/m46KX
	ESuiLPPP3HXEEair99Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHiPS-00GdfN-5I; Wed, 09 Feb 2022 08:33:06 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHiPN-00Gddg-Uu
 for linux-mtd@lists.infradead.org; Wed, 09 Feb 2022 08:33:03 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 167D8FF809;
 Wed,  9 Feb 2022 08:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1644395578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4rPFnHcHVlSSnZKzRu4Ncl2lMwdWWlcor8ub3qfc+CA=;
 b=eCsL4raikSTCbREvwu6DyH51SUIv+uIGRTH7jZTvAoWM2toO/5/8rygsyojvQrZOmUWaBw
 QUgRsA/1oZll5nGYTx6dccW1oUiclDIb5t7E0oQ05uxbKxXIIasdeYtjF8TZI4Rd6nFIF5
 dr1MhEGAXQLlJigxSTobxvckdwgIlcJ5vqplBoXbapN+WUDzU3vcWRj27CrcPkyy8jlUGH
 Y8DKKiOZckDM5Wmll1pbGcBpxYuU2znWjQR6mgapk6hMXRABm9uEZPLejoKyCVbYdAXzHD
 R3nkd10YtPcXJhJXz1tQYubIjJuZG71vzZEb5ySYvJfn0NE5ePo8LMbLWbTMEA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sean Nyekjaer <sean@geanix.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, stable@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] mtd: rawnand: protect access to rawnand devices while
 in suspend
Date: Wed,  9 Feb 2022 09:32:56 +0100
Message-Id: <20220209083256.749170-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220208085213.1838273-1-sean@geanix.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'8cba323437a49a45756d661f500b324fc2d486fe'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_003302_185472_99175CF9 
X-CRM114-Status: UNSURE (   7.20  )
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

On Tue, 2022-02-08 at 08:52:13 UTC, Sean Nyekjaer wrote:
> Prevent rawnand access while in a suspended state.
> 
> Commit 013e6292aaf5 ("mtd: rawnand: Simplify the locking") allows the
> rawnand layer to return errors rather than waiting in a blocking wait.
> 
> Tested on a iMX6ULL.
> 
> Fixes: 013e6292aaf5 ("mtd: rawnand: Simplify the locking")
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: stable@vger.kernel.org

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
