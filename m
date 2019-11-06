Return-Path: <SRS0=BbO6=Y6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 372C4C5DF62
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Nov 2019 10:15:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01EBA20869
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Nov 2019 10:15:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ls7q+W4o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01EBA20869
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hZOVYYuDp+s1yKzkfz6Z7cv6zGKA74XKJooDJFPNdx0=; b=ls7q+W4ojzSdwc
	R36XCwuUUuA545X98QhzGD0dimPqaT1TYTcbv4UKlnuWK50uqKDrtLhi/jToa0hnOUR71/wBb8Q2U
	hs3xvAVP7Cc5hPV5US3rUJ20JL2SwfrtumDz8PrmHVBmDhXPvuse7UVwoFt1WPMkr0S3diG8iD4Fq
	3LHVsP3SqOYC/LxRUhBdBUXCeEMqdo+jVQ9+OuxUuXf3wtHMf4H/qE9C8TvVBwyBWhgBIO02dNqBu
	QR1GMCvCptSlXwqAKUj2SojaILU4bTBnpopGeKki5VFVIVRVpZAVBzCn59SaCb2jarYg9Yoc+D7wx
	zbsyHYnFCdKt6En58wPw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSILj-0006AI-QY; Wed, 06 Nov 2019 10:15:39 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSILg-00069C-5w
 for linux-mtd@lists.infradead.org; Wed, 06 Nov 2019 10:15:37 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1iSILd-0002Pi-C9; Wed, 06 Nov 2019 11:15:33 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1iSILc-0006Il-QQ; Wed, 06 Nov 2019 11:15:32 +0100
Date: Wed, 6 Nov 2019 11:15:32 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH 1/7] quota: Allow to pass mount path to quotactl
Message-ID: <20191106101532.irqclznlfawz4sxy@pengutronix.de>
References: <20191106091537.32480-1-s.hauer@pengutronix.de>
 <20191106091537.32480-2-s.hauer@pengutronix.de>
 <20191106100515.GC16085@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191106100515.GC16085@quack2.suse.cz>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 11:13:28 up 121 days, 16:23, 123 users,  load average: 0.17, 0.31,
 0.27
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191106_021536_225015_F9166017 
X-CRM114-Status: GOOD (  14.10  )
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
Cc: linux-fsdevel@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de, Jan Kara <jack@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Nov 06, 2019 at 11:05:15AM +0100, Jan Kara wrote:
> On Wed 06-11-19 10:15:31, Sascha Hauer wrote:
> > This patch introduces the Q_PATH flag to the quotactl cmd argument.
> > When given, the path given in the special argument to quotactl will
> > be the mount path where the filesystem is mounted, instead of a path
> > to the block device.
> > This is necessary for filesystems which do not have a block device as
> > backing store. Particularly this is done for upcoming UBIFS support.
> > 
> > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> 
> It seems you forgot to implement changes I've asked for in [1]?
> 
> [1] https://lore.kernel.org/linux-fsdevel/20191101160706.GA23441@quack2.suse.cz

Hm, yes. I somehow thought these were obsolet as the patch was
superseeded by your changes. Apparently it's still there, so I'll send
an updated version

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
