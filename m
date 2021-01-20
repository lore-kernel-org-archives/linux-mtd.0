Return-Path: <SRS0=AumS=GX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1ED2C433DB
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Jan 2021 13:39:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C30A22573
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Jan 2021 13:39:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C30A22573
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:From:MIME-Version:Message-ID:Subject:To:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YE3U0g5bbZgDfbHAfARJ8DTz6iSkt9qwsd2/5vIGIDc=; b=xjgp1u60rSZLM1E+PICgCU1APH
	X8h6wmLj1zU9wU6QLTGnJeRX1e4FnE+/I+AZlTisfhsgfqep+MR5mfT1fEZyYlEDJSbHIH1MGzgIY
	UZb4AaLBuqcST/WMMLWXRkMF0VOwakKfeCTxSrLx+WvX5YSOB0xsBRARGDNZGYHVEzJMOGkY3prKx
	3kg6GmgbnOiXSzJc+0gMIVKYOJASrXPepXT8pcxkjcJb3+le5bBqAH/7YbTAU0/o+goyMViiVWWQI
	lEVEMLr6Ump3K+9fBNGymdREf5ZnHUttriJGmBNkw+81Li1dbEJgWKmJ3fKspS2X13ks8HnXTqOSl
	AtAsYDtw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2DhC-0000p3-Vk; Wed, 20 Jan 2021 13:38:51 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2DhA-0000oR-DF
 for linux-mtd@lists.infradead.org; Wed, 20 Jan 2021 13:38:49 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1l2Dh9-0004IC-Dg; Wed, 20 Jan 2021 14:38:47 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1l2Dh9-00065T-3G; Wed, 20 Jan 2021 14:38:47 +0100
Date: Wed, 20 Jan 2021 14:38:47 +0100
To: linux-mtd@lists.infradead.org
Subject: ubifs: ubifs_purge_xattrs() wrongly called
Message-ID: <20210120133847.GA19063@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 14:23:22 up 49 days,  1:50, 84 users,  load average: 0.08, 0.13, 0.14
User-Agent: Mutt/1.10.1 (2018-07-13)
From: Sascha Hauer <sha@pengutronix.de>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_083848_495594_518F5A7B 
X-CRM114-Status: GOOD (  10.59  )
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
Cc: Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi All,

I just noticed that ubifs_purge_xattrs() is wrongly called from
ubifs_unlink() when a dentry is deleted. Deleting a dentry doesn't mean
that the inode the xattrs are attached to is going away. Removing a file
that has hardlinks will result in removing the xattrs when instead they
should stay until the last link is removed.

ubifs_purge_xattrs() only removes the xattrs when their number exceeds
ubifs_xattr_max_cnt(). Otherwise it does nothing, so it's unlikely to
hit this bug in real life.

I am not sure how to fix that. Maybe calling ubifs_purge_xattrs() from
ubifs_evict_inode() would be correct, but I haven't looked deeper into
this.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
