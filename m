Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 809E2C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Feb 2022 16:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FfmO3T8qnByU5Cxn+a7zO3KD1P7HqXmuqK8EtryNAF4=; b=LH9OonRrNhqheT
	bYm/5KVa04iSEWULJ6cNpuwrSFJ/aaRhqrEeJjCvX6eo9c8r0TcSDHWjB5fRg0hC8xq6ISiK4fqQP
	txQ0+5GOruKncLKFBye3oZlxeDoUAOjx9jsvp396PNo+GMkg4sk8YMC3yeVUQwmSoo3dQynQYdnGv
	NSnfyqyIGCMuxfmFbr7q6hzky0ZKRaSeYse5t9b9kU+jB8/NMtCBrs/vUqzez6VsIMFsc5dPKG++H
	TvBaADFb7GXFxQyBHKE5Ysm/LctmDCG9TPlWSqN1pwFWmDGQxoeIi8x6ld+Ph6A937x/fNhU/JabZ
	rMvfmFvNLZkV9I53+UEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nH6bg-00AzuK-QC; Mon, 07 Feb 2022 16:11:12 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nH67G-00An5n-IY
 for linux-mtd@lists.infradead.org; Mon, 07 Feb 2022 15:39:50 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3DC37FF80D;
 Mon,  7 Feb 2022 15:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1644248383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=owOcAnjX+PJ5g3z0qRPYwI6jTUZoFW3Nfrfu/H3vrD0=;
 b=aIbasiSxXW919EnFmj2qVO8RrHjkgKrcNjkoyUyod4BNWjeS+yZuJxDpJKGBzzQAVmuca0
 YWqaANRpQVinaLj362eWF4Dv5voxkt/SpWZCivbRLGZqg5kdosfTz0UpAfPvXPeIVJIBLz
 ZgxDD7WdlSo5ciKA7Vt9DjXbwjUSenVuf2XqSZtnQgjuqSgQUErmbYDhYoSYY4A3v5iNyu
 UoMYAfnZKk1boS5KnFdiIdfd/kmwJnJ1yA3Y8cU47bUAbW7xNqzBN3TxYk4U7wF2/hosU5
 agNl+nJnLrjQi5rRG6JeCSeF1Yyvf5reN3pLE41sE71/9UwahxL3J7zlan5Anw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sean Nyekjaer <sean@geanix.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Cc: stable@vger.kernel.org, Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: protect access to rawnand devices while
 in suspend
Date: Mon,  7 Feb 2022 16:39:40 +0100
Message-Id: <20220207153940.710464-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220131215138.2013649-1-sean@geanix.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'0ff4eb01ffb923d68e086cb817f173c7464ac6e9'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220207_073946_784193_DFA1065E 
X-CRM114-Status: UNSURE (   6.82  )
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

On Mon, 2022-01-31 at 21:51:38 UTC, Sean Nyekjaer wrote:
> Prevent rawnend access while in a suspended state.
> 
> Commit 013e6292aaf5 ("mtd: rawnand: Simplify the locking") allows the
> rawnand layer to return errors rather than waiting in a blocking wait.
> 
> Tested on a iMX6ULL.
> 
> Fixes: 013e6292aaf5 ("mtd: rawnand: Simplify the locking")
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
