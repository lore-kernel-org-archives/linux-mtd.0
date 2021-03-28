Return-Path: <SRS0=g52K=I3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2A4FC433DB
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Mar 2021 17:50:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37E4561981
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Mar 2021 17:50:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37E4561981
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eIJAl2uNufsIVvu52qacYLP5VDplXSiIV/YQbIVvIW8=; b=QTorfmUQMNOKfEkxxqefSVFh3
	/WgUaFtxi3DNMgOk2/yGuPniqxv7W709Ov9cLnIJkhNayw0PpNQSDaedIPgpGB6Qg2dzT7xpIsj5/
	h5Z+B2lFZr0z8FbdtkNG8ib3JNLYtukj60nabpY/kTKkAbnm1qnTk8IfS9FvBtfa87bIAzBDHq7yr
	mT0+a0FfycTFhPaVV/rvEErkc0/nD3ohQQmX1AGuZ71+dWPR/TaH7vr4D2RGQ1/2G6Gw/kfQMel+D
	f2C20evEcnJ3N34bIkfdIHDzgv7def0aF02qhKaGC/prKN8yi5AHtX1fe6ud+2fQpxhFBZC7ZAMiz
	sjNXkKlXQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQw0S-000w7d-VI; Mon, 29 Mar 2021 17:48:53 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQowX-000ZcA-8D
 for linux-mtd@desiato.infradead.org; Mon, 29 Mar 2021 10:16:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=MsrIqPXFDVJM5VCsX+s8TT9qnJAbVBN99MT961mPpE0=; b=Vp7XUKO5yUgXxT3DnZkHfpgbcN
 o1xbCteSWBZdSMWCJuXy/mHFVEGMIiXwXH6WQKolNnuUCE6OBQjrbpdgYnWRBeBDeZDDubFi9o2NF
 7uw0gndKu8iEd9IOZgC+11ilv8K/WliRM1h5X0t0U1Tzv8BQ1FFFmbVmD/qyz5ZVpsLldGbHxXTJJ
 b8AErfB4LeD49PdoWCqv37stOTDU0C6bSx5nfhyUXjENofnNB5uQt6jrOg6CQe9bIWqIOz748TFn8
 DQ1VM9vAyD46aMknbVxGjgs+UU5qg7q1JzkmbcJ/LEBqWJGGQ7IT865rb5WRDSHrNiMoULAdM3Q03
 0v9tmPag==;
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQZ0N-000JnA-2l
 for linux-mtd@lists.infradead.org; Sun, 28 Mar 2021 17:15:20 +0000
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 453F8100007;
 Sun, 28 Mar 2021 17:14:51 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Kamal Dasu <kdasu.kdev@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: f.fainelli@gmail.com, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mtd: rawnand: brcmnand: move to polling in pio mode
 on oops write
Date: Sun, 28 Mar 2021 19:14:50 +0200
Message-Id: <20210328171450.7711-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210311170909.9031-2-kdasu.kdev@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'22ca05b82d3e3abc2b116a11ee41b6b692b95530'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210328_181516_743496_7FA2786F 
X-CRM114-Status: UNSURE (   6.17  )
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

On Thu, 2021-03-11 at 17:09:09 UTC, Kamal Dasu wrote:
> This change makes sure that Broadcom NAND driver moves to interrupt
> polling on the first brcmnand_write() call.
> 
> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
