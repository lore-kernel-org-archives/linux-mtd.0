Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC50C6FA8F
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Aug 2023 09:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WKwzApuGMz0NaTWC9nOx2cgP2rpd8AoH4TMDB5fZqjY=; b=z7Lu/fkf8yd+uI
	iolUr7vKeVYcQve2lb5ICe7Vk+BZc1XoUeQwgtiMCzYYzRR/8OknMpiRBvl7mGBJn0rBAzNWNe8cp
	2XAHYRshpRE7GA34lX+5oIfLeRwmxi5kdFudkMTNatv4GcP49X53CeDcIqFZHv8+lPliRwtxxSgzm
	us0zGbbf75X/4fs8aaHSOYIQieSSDGcajpEQfasJBWeX0wqLVj+KyOwRL0WVZXP1HTmEqcpEYi9gE
	sV9c57EOjhqALOQYUq+857yyQzBpAiQ0ZZw/KT3eSZmnqIXlPXOIcfd6irK6jtBFzNzXXa2X/5pEP
	nZ3IZWN/6UgKM9syY6Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbHqw-00DAwK-2d;
	Wed, 30 Aug 2023 09:51:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbHqq-00DAvq-1k
	for linux-mtd@lists.infradead.org;
	Wed, 30 Aug 2023 09:51:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D441A61006;
	Wed, 30 Aug 2023 09:51:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7BE5C433C7;
	Wed, 30 Aug 2023 09:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693389063;
	bh=ehF1qeecU8C9Dk3tvvD0cjYP9mJCNsSMX4fo+qTQ0VE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ENChhhxspR7hLye0MICDkGdbfnt+U6kq3HzpEaKQKcPodnPtQoPoBMQoWkmSmp9e4
	 j+KRmCMQ3mNq48zt1xkRmXocFkn87B4WwTO1RLaQrfHKYigEZAfvB3WltkOQhpnPy+
	 vIZaZu8BoGwpuwmv+DnVXhLC8EJnla3L5BvY8kwTROR1NyOZMMcfGvlKpuqBAMYNMB
	 7HFLqMA0DRf9F9J6/cMy80y8QCB7milHwLHkr9IhWn6Cy+QV7avOdI/FWNe7fMigzn
	 Gc08LyC/ECbuGynnX67zKP62MAY1vX1IhmOZhRNT5Fq93t86q0/KNEWu03/U3LQAY8
	 VuN1yXscoeeqA==
Date: Wed, 30 Aug 2023 11:50:58 +0200
From: Christian Brauner <brauner@kernel.org>
To: Christoph Hellwig <hch@lst.de>, Jan Kara <jack@suse.cz>,
	Richard Weinberger <richard@nod.at>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 0/2] mtd: switch to keying by dev_t
Message-ID: <20230830-strahl-turnier-8e082a720041@brauner>
References: <20230829-vfs-super-mtd-v1-0-fecb572e5df3@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230829-vfs-super-mtd-v1-0-fecb572e5df3@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_025104_625137_DD71D76D 
X-CRM114-Status: UNSURE (   7.40  )
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

> I plan on taking this upstream as a fix during the merge window.

Btw, I tested this all with jffs2:

sudo flash_erase -j /dev/mtd0 0 0
sudo mount -t jffs2 mtd0 /mnt

and then some variants with racing umounts and mounts.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
