Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44DACC433DB
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 20:32:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2D6964EFD
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 20:32:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2D6964EFD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eQukJ3VrYZFD3loi9kZsef3PVpBfEsZphmlcFp+pq5o=; b=MfqliePbZINtI3F4mbtH4BSQr
	hgra6mNqA7UdEq7qy5OS1MsXhFDJtLeIFP2R1tUnD3wMlbu82cCFsAd6hghoCqY55Z02IndZTkxmy
	xYNEaSAhBR/edTvzvDZaTVub60KDri+M/SfYFg4CkSN5p4+12XGtx3JrLz7k7UEU6FM82pkZVDWjl
	kmXcxO7uKyzztFbqaQKeSPU0+4ali3xdpkTj60za0cV9h3v+yBGSyCBoX23JbyuJcAE42rX+ZVMGH
	9TolJT6IM2YvvvaKYpPz+Ph5e26jw9ius0WsimH4VjmR6i9azpfp+zZrTqr8/9keS5qf3d1pC2mkE
	LXci7uhIg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHY8J-006QF2-Qo; Wed, 03 Mar 2021 20:30:12 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHT5f-005IpO-Fj
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 15:07:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=QpFfixSfI0IXTUKVxxfkDvRqFlpfOA0zwhqqY5WVyhU=; b=gPMHZbTY9/xJOaIry3AX0FruCK
 P0gKlUjqm8hBvc2nCBuSJZ8wOr++LoONuH4J1OqfzWJEoLolRY8ewp5RhemJYT/ZJFf9OCZbPfUFf
 lch4s/xDHVhbBME9gn7hzArkLRzmMg+QFzYhNSuMDx0P00GtRQ6zVpDmg1Glyqj4c0tX44MBL/trM
 JP072JtCEFKz0FYglmhqF0437pI2W5yNJpl6oGLBiR+1Ut+gJdTl6GDKIwcL0y7+O+Ffq7ES6t0Fs
 IE1LBVzmbsNX+A0z3UYADeTutOOJUj2TI/C+ggYkbpMgSWdxdkXZuEQ3b7RISgiVE3pcrV22kIxaT
 G9jbivXA==;
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH7xQ-00HSEF-SX
 for linux-mtd@lists.infradead.org; Tue, 02 Mar 2021 16:33:17 +0000
X-Originating-IP: 86.206.8.148
Received: from xps13.stephanxp.local
 (lfbn-tou-1-491-148.w86-206.abo.wanadoo.fr [86.206.8.148])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id E999CFF80E;
 Tue,  2 Mar 2021 16:32:42 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Vipin Kumar <vipin.kumar@st.com>
Cc: Fenghua Yu <fenghua.yu@intel.com>, Tony Luck <tony.luck@intel.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: rawnand: fsmc: Fix error code in fsmc_nand_probe()
Date: Tue,  2 Mar 2021 17:32:42 +0100
Message-Id: <20210302163242.23393-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <YCqaOZ83OvPOzLwh@mwanda>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: d49ecd70c82d89c7448f5623ae08d0a4a488dc72
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_163317_575514_5E4C95F0 
X-CRM114-Status: UNSURE (   5.77  )
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

On Mon, 2021-02-15 at 15:58:49 UTC, Dan Carpenter wrote:
> If dma_request_channel() fails then the probe fails and it should
> return a negative error code, but currently it returns success.
> 
> fixes: 4774fb0a48aa ("mtd: nand/fsmc: Add DMA support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
