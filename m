Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EAFFC6FA8F
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Aug 2023 06:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7g1Tfak3HjfEQ6GJmXxVykP9sMgwH51NRkYmNkpEe9M=; b=Lg+hYg3wNQ/aYN
	FXY9Dd2rb4QgQeQ1GtZwXV+7GcHL5w0y/bGGuxbLb6i/0/pg+8nbgX5N4wvuxDprcp+x+hOOY4jYY
	w9NyVG7KUv9d2DC7icB0jt5omqYr26xxPeCQeHauRvHJEnM1kfEgcXVZ8mfpbg+16YQ+LsUJi7Q0f
	Sy1nZ+bbQxxWveLgqturO8zy6KjhLajiDt37kbbdWoLWd+Ta8H7XewYRwgMS7CkyyV1rnlA0LhK67
	0+IdtYTyvoQSLdcGHG2PAQDrbeX1X7OZJ0isWiQz9NKaDYA0S4LI800Crad1X8nZeP8D7u+XlXl5J
	fzTPjdCN8tgssekAwJPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbET1-00Cu0L-0M;
	Wed, 30 Aug 2023 06:14:15 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbESy-00Ctzo-1a
	for linux-mtd@lists.infradead.org;
	Wed, 30 Aug 2023 06:14:13 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id D42746732D; Wed, 30 Aug 2023 08:14:09 +0200 (CEST)
Date: Wed, 30 Aug 2023 08:14:09 +0200
From: Christoph Hellwig <hch@lst.de>
To: Christian Brauner <brauner@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Jan Kara <jack@suse.cz>,
	Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 1/2] fs: export sget_dev()
Message-ID: <20230830061409.GB17785@lst.de>
References: <20230829-vfs-super-mtd-v1-0-fecb572e5df3@kernel.org> <20230829-vfs-super-mtd-v1-1-fecb572e5df3@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230829-vfs-super-mtd-v1-1-fecb572e5df3@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230829_231412_671861_008F3A68 
X-CRM114-Status: UNSURE (   8.02  )
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

> +struct super_block *sget_dev(struct fs_context *fc, dev_t dev)

A kerneldoc comment would probably be useful here.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
