Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A98C4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Oct 2022 09:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eRJpPSg1veHBvgcBh/MBb5aKrZ5KaKIZOuD7qqZu0TQ=; b=OBdf0yx/oMXtSk
	VQW5fnXEGUCYMUjLNWCW7svVB+kH3uZigkG2kPQfrBqtrY7uAXwSiRL9u/Zm3wCPGseXEbEDGpjBc
	07M+bApyszbhlg++ifqBGjxKCssdxFGmL7wQySmEn/bOgvNFpz9sVEeGGz6sl5M4sj08f+kG4JrZf
	ciTwkgjjQZ1UNl+YDLpQGCsMvq5GuLHY59joVgI5uzvR/X4Z9nAZOel3WY+456ZiQkDu7be/jQtiH
	1KgmT4PhDwFcujifP4kOkZpZkT0zYrVITvvx29kh2wvSuaDB7nhl1wdUiZ6yZGRl72ASJ+CAv2mKc
	fjQIFDdq+YhCYIPbZWNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okiV7-004f7E-Tm; Tue, 18 Oct 2022 09:03:06 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okiV4-004evp-Jf
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2022 09:03:04 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 072EB1C0018;
	Tue, 18 Oct 2022 09:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666083779;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0uH11NRGsseB+E0uz7YJ6zSBDJuyzfaoWq8A/NEfOro=;
	b=KpHE0ceOTgDV/M69o+3ATNnxQEiirnL0PMYiYrlfcwfkhvtwUGyFLvjaRtD0PetYiBOoTf
	1QHMKSFvy8QpbvuAgFs8JOyQDN1pDKGjbHQRT7NZZJmLgtKQHRmEVLb1OAQNi6BIlOLHIH
	rvbF29TJThTIoDYOVFOcspA1VjPMijZjkF+n7bHMvwd7d6FdK3kWGHhOH4/ztLk+rwGTvA
	9A/MbKA13N0rXZ3p7i6WNCjj2HzLZsCKguZCYPd/iQC3/hKPzVQ42rfb5YULibyzzxaO8R
	PC3xam0ik7ctGtEST++AvVu44UmORZZ/QPPH2MLW8r1eIzUaSjL9Z11GBQCIMQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yang Yingliang <yangyingliang@huawei.com>,
	linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	martin.blumenstingl@googlemail.com
Subject: Re: [PATCH -next] mtd: rawnand: intel: Add missing of_node_put() in ebu_nand_probe()
Date: Tue, 18 Oct 2022 11:02:57 +0200
Message-Id: <20221018090257.393914-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220924131010.957117-1-yangyingliang@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'1f3b494d1fc18ebb37aaa47107e9b84bf5b54ff7'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_020302_804634_CB39559F 
X-CRM114-Status: UNSURE (   5.59  )
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

On Sat, 2022-09-24 at 13:10:10 UTC, Yang Yingliang wrote:
> The 'chip_np' returned by of_get_next_child() with refcount decremented,
> of_node_put() need be called in error path to decrease the refcount.
> 
> Fixes: bfc618fcc3f1 ("mtd: rawnand: intel: Read the chip-select line from the correct OF node")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
