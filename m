Return-Path: <SRS0=UIyM=HS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1FD1C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 07:25:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4675964DA3
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 07:25:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4675964DA3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FciPKzxCsluT1r2qX+fyKXCO46kkDzoJV4AO7Tltn8g=; b=ho7XdpelGMXIEcZhfjHIuBfli3
	1/+0PKEYlvvoMR+5T16OkX89KZfHb7uK2yysGvGaGzJ8zypvBNnx1FtfbVK6AolT0e3jyK2oZ3K5K
	Hc8gp/HIdqTCjE2BrR4KoX7g3+HkReoMX83oHzBNNNDojcr/3cFXI/nxx6dzCx5Vl1Co3srhFSodC
	QjXZfUCT95n34PsyVpwtbPqTUWYCNSYF6h400Yt127nJlFuORjX6UNS0dlp100XV+1tV59NDHS4rx
	vjeGxn44vEtZ0DSoKERVSxeElgG1PuAyTa9Rqbg+Ngouq3kP1uupPQ7yGtk9Zbo4wgVWLL3hdWYfL
	TqGGuRKw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lBuiL-0000J3-Gy; Tue, 16 Feb 2021 07:24:05 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lBuiJ-0000I3-2L
 for linux-mtd@lists.infradead.org; Tue, 16 Feb 2021 07:24:03 +0000
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <jbe@pengutronix.de>)
 id 1lBuiG-0003lE-59; Tue, 16 Feb 2021 08:24:00 +0100
Received: from jbe by dude02.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <jbe@pengutronix.de>)
 id 1lBuiF-0002Mc-5N; Tue, 16 Feb 2021 08:23:59 +0100
From: Juergen Borleis <jbe@pengutronix.de>
To: Richard Weinberger <richard@nod.at>
Subject: fs: ubifs: set s_uuid in super block to support ima/evm uuid options
Date: Tue, 16 Feb 2021 08:23:33 +0100
Message-Id: <20210216072334.7575-1-jbe@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: jbe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210216_022403_189020_503A6914 
X-CRM114-Status: UNSURE (   6.88  )
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
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This is V2 to support ima/evm uuid in ubifs.

- the previously used memcopy is now replaced by a helper function as suggested
  by Andy

jb



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
