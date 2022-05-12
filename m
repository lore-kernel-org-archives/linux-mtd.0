Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B3E4C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 12 May 2022 15:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AZI1mXFTw3TCuLHH9YmnkjU/rrZzKHB2mfYfJQgP+Pg=; b=Eqc2yhdQ2GD4tc
	HESBB1exoKFeqtloVvGnE6DciS7r8MyKjp7tWMxkNU2pi7kSRw9CyuPNq9fwiz1c4J/YOAKTnmgEH
	Zd2NdgpMSPW6r/19sQR5NgQOsT0hg515si0hCZO1ydFYnRyNwLbMoWCpNbKGs1WP5RhVlXutUtFoZ
	ahlQ8/GXSmDAgur1c6/fxkuZeeFwKF4GxHSFtzHg8Sp/d+xgrbGAUotb6qLC7mt5kW/dNeZyQj8q0
	pOL3E8v6gw75IH8csBLqORL/qS5u+Exj8f1HoWKUCfPexxLyNPbAuny0/GcHOA9cww0ga2kmeT4PL
	lAZ+exiRtC7/1QFyZSdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npAiv-00Cbsj-BM; Thu, 12 May 2022 15:27:29 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npAis-00CbqQ-9d
 for linux-mtd@lists.infradead.org; Thu, 12 May 2022 15:27:28 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 287B020000D;
 Thu, 12 May 2022 15:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1652369242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CqboCWzVkcmkkQi3DnBuxah5KaOTeztT0z2EnIjbHQ8=;
 b=Xdvmg6pzHeRMTnAMPovYZSHEQ8yc0Ie92xefxgAXgyGelzOuSwfRDYvW2Xq37O4iOf3qUH
 BZZhTdZQDdHbQJjNY0FZWeOWS1kyiFelWhrqPwPgk09zpnyDalv6qaEobQtDrUANdIoiyB
 XIc5F1B6R/AkXYSN8cvtSsMlnzGCraJbfrav+8GnZXwlWMRxrCCe2eJiXkLe+qP4UWAuT4
 DpkcaSjCaaLCYha/4QZ8BZGLb/SrNbcl7N5SsZ9ahsqh8aHa+JnG3rlUs2+e3T2C/ePUhn
 VxpX7tw5cXqrOah+OVxljewtGQR1loQLr548DMIfv6sQ9kDy4eu+Birqk6KmVQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mikhail Zhilkin <csharper2005@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Hauke Mehrtens <hauke@hauke-m.de>, NOGUCHI Hiroshi <drvlabo@gmail.com>,
 INAGAKI Hiroshi <musashino.open@gmail.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Karim <Karimdplay@gmail.com>,
 M <x1@disroot.org>
Subject: Re: [PATCH v3 3/3] mtd: parsers: add support for Sercomm partitions
Date: Thu, 12 May 2022 17:27:20 +0200
Message-Id: <20220512152720.244806-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220503155140.2339899-1-csharper2005@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'4213e556fe2a18782e91a87fec70d98c48f1ee41'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_082726_517202_C85A9297 
X-CRM114-Status: UNSURE (   8.99  )
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

On Tue, 2022-05-03 at 15:51:40 UTC, Mikhail Zhilkin wrote:
> This adds an MTD partition parser for the Sercomm partition table that
> is used in some Beeline, Netgear and Sercomm routers.
> 
> The Sercomm partition map table contains real partition offsets, which
> may differ from device to device depending on the number and location of
> bad blocks on NAND.
> 
> This is essentially the same code as proposed by NOGUCHI Hiroshi:
> Link: https://github.com/openwrt/openwrt/pull/1318#issuecomment-420607394
> 
> Signed-off-by: NOGUCHI Hiroshi <drvlabo@gmail.com>
> Signed-off-by: Mikhail Zhilkin <csharper2005@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
