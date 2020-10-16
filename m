Return-Path: <SRS0=K4do=DX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7BCFC433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2020 06:40:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FFD8207C4
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2020 06:40:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ymBox9d7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FFD8207C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UpE/nXZa0DOxY9wF19tVP1dYM8crWoG/nN9+rwEpflY=; b=ymBox9d7yodYJOc0CJxrzQqtO
	ZWk8luXdaCK8pMM8B7lkyvt5bB09scVbEaQpXfyMFzyJpIqQT12q1aRbLpzRUHgob6MERG19lM9j/
	pdBdlk5kYd7KsJIK2YD0gCcLjhwXYLRaUFvSaokL710RiScT6W95iSDQSnCNxQ4kpIrzXXRPsbOUC
	JUZHdaFp4K66g1vHqSlIpas3tkoBORWdHedbtzgkKBoK2lvxJl3S66THOZ8aDPAJGRSkQeDQ6mOeB
	IgBdsYCDUaD+Op9fh9n5L70sMzFaTJGLzdIw1Uf1Xsr0qNblbAwVEOCmcVpCNWVhOfNjXCvRC7jMz
	NP5NV47lw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTJOX-0008QM-67; Fri, 16 Oct 2020 06:39:17 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTJOU-0008Pn-S2
 for linux-mtd@lists.infradead.org; Fri, 16 Oct 2020 06:39:16 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1kTJOR-00007D-8l; Fri, 16 Oct 2020 08:39:11 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1kTJOQ-0006lo-Hb; Fri, 16 Oct 2020 08:39:10 +0200
Date: Fri, 16 Oct 2020 08:39:10 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: imx27: Unsupported ECC algorithm
Message-ID: <20201016063910.GK13710@pengutronix.de>
References: <CAOMZO5DnGGbZg_th=kjwBmNa8FznYErYCGvmD6dKgBbMV869+w@mail.gmail.com>
 <20200921094010.GH21278@pengutronix.de>
 <20200928172012.712035f8@xps13>
 <CAOMZO5CzNrGnwAB4zuUzeO3LVUqxaD4u0UXfYO8HBNcKSS-mvw@mail.gmail.com>
 <CAOMZO5D8W+Z5enehxFt7XTPn6sEXe9pWM6Tn1SixMntkZ31Wgw@mail.gmail.com>
 <20200930165831.418b8edd@xps13>
 <CAOMZO5BVHBqxLSEZgEqHEdAXstaK8GHHqjQnY+FtOJhXjX--qw@mail.gmail.com>
 <622a62489fa717fe8a94cd2e9cdf3d906da5141f.camel@pengutronix.de>
 <CAOMZO5Cq6v0OvpLSYwqqpHQFDjviM3mwozHcH35qoOTFvdnJ-w@mail.gmail.com>
 <20201014152659.6ef6a2fc@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201014152659.6ef6a2fc@xps13>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 08:37:47 up 239 days, 14:08, 126 users,  load average: 0.61, 0.27,
 0.17
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_023914_943582_2F2A2371 
X-CRM114-Status: GOOD (  17.82  )
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
Cc: linux-mtd@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 Sascha Hauer <kernel@pengutronix.de>, Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel,

On Wed, Oct 14, 2020 at 03:26:59PM +0200, Miquel Raynal wrote:
> Hi Fabio, Sascha, Lucas,
> 
> > 
> > The ECC issues are still present on imx27-phytec-phycard-s-rdk:
> > https://storage.kernelci.org/next/master/next-20201013/arm/imx_v4_v5_defconfig/gcc-8/lab-pengutronix/baseline-imx27-phytec-phycard-s-rdk.html
> > 
> > BTW, ECC errors are also reported on a Freescale Layerscape 2088A RDB Board:
> > https://www.spinics.net/lists/iommu/msg49772.html
> > 
> 
> I supposed the failing division is this one:
> 
>         /*
>          * Set the number of read / write steps for one page depending on ECC
>          * mode.
>          */
>         ecc->steps = mtd->writesize / ecc->size;
>         if (ecc->steps * ecc->size != mtd->writesize) {
>                 WARN(1, "Invalid ECC parameters\n");
>                 ret = -EINVAL;
>                 goto err_nand_manuf_cleanup;
>         }
> 
> Which produces the warning right after. This would mean that
> 
> 	ecc->size == 0
> 
> But this entry is set before calling nand_scan() in mxcnd_probe() to
> 512, and that does not make sense.
> 
> I guess we should be able to reproduce this error with any board using
> the mxc NAND driver with hardware correction (now also called "on
> host"). Do you have such a board available to at least verify that the
> beginning of my logic is right?

We have a board, I'll give it a test

Sascha


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
