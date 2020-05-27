Return-Path: <SRS0=kTjQ=7J=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4059FC433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2020 14:13:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9E25207D8
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2020 14:13:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HJlE4rbe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9E25207D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZWFFFYE8QMKM+7qpUM7N5fL38hf/MyusO4xs6rLJkiA=; b=HJlE4rbevxXXB2
	oKooSe8wdz1OAc+/VoGNeRuZRuq5iRpnDaQLYiJGn44UgVUMg7or2Y/K+KZC5cPLEJkJ8oC0jaFT5
	zw5HITgEvmaYPeHMpWdpO+zRP6s1DSATs/HyTA0taOeWBISQIF0jxf2wis/Yd/BvqvFgQdG8xm/6k
	rA62i6kfKhj/sy8V8FB5uHO+lmOxXjkMhUeM2+aFudiJIUz9s6C9DSrklVw7qHkSV3JEyYzqHJOIL
	FbHQbH1xrEZr7NC0UTuEv566Gkreeak1NSvlpD7CKrdwv58kKXtAbLbbKdmVm+oVqXcVkliazChJH
	o0oQVCHLa02KzjpS67fw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdwoI-0005C4-5t; Wed, 27 May 2020 14:13:34 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdwn3-00046o-8r
 for linux-mtd@lists.infradead.org; Wed, 27 May 2020 14:12:19 +0000
X-Originating-IP: 93.23.196.54
Received: from localhost.localdomain (54.196.23.93.rev.sfr.net [93.23.196.54])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id EE68FFF812;
 Wed, 27 May 2020 14:12:04 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 15/17] mtd: rawnand: nandsim: Manage lists on error in
 ns_init_module()
Date: Wed, 27 May 2020 16:12:02 +0200
Message-Id: <20200527141202.24406-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200525085851.17682-16-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 4409480dc258fe7879eef26cc9640a43a2045682
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200527_071217_472479_76ECE73A 
X-CRM114-Status: UNSURE (   7.20  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 2020-05-25 at 08:58:49 UTC, Miquel Raynal wrote:
> Lists are filled with calls to ns_parse_weakblocks(),
> ns_parse_weakpages() and ns_parse_gravepages(). Handle them in the
> error path, all at the same time.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
