Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C711C433E0
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 20:53:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E53964EF9
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 20:53:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E53964EF9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FyPT59pFgoocmIdTzb4Ildw6estPK+APKPeBq2wySv4=; b=P4MsnRwTGLRDGsUe9ncbpUl8p
	DDmmlNvAAGcKMxWmcENRISDngNHeIG1Atxe3o+3W5fUerEdCqQXpebqxanU7pyuCJxPsC/LJHD152
	6Mjdr7wlVisOK/qjRi8QRRYl1WIZf/q0YJZrDL6wEHnPefacKdYA8oKlLb8rDwkTfPdhf0WJQyMPI
	LEkPjrapve16WVvNrZbP4x7DcCpixDwhz4piFKjyZWnPLbqYG60NRaeUo7bdR6HjgovIEwPUToLJD
	0qRBkuHOeR9cTZhe5vK9d5+wCjy/cDRaPtMV8C9JDg55UC+k+yHyDP5ORiP19rTf0qNKjPrRfjzCe
	d9SxZ75mg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHYSv-006ULu-K0; Wed, 03 Mar 2021 20:51:29 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHT7A-005JK3-48
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 15:08:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=eyBbMc4vzURYlUhcnpQkjU6LgE0V6jGun3z7RWYj2qk=; b=fs2HvWfpQImwX/+QI6V0XG4UcD
 QFwUGb4QehOS0qPMQ1dlli7ajUlglan99Okc8F/miI4NYMXWV2f/xgRoVnbuGPo1YxmChRxnNcOZk
 lNwdCkqsbmfwBj4tLG/AdyxYu/SvUq0B56KJWTEcVdvme7XyWUP2gin+Gve1mqSlbQhwynkpQlkG3
 DxAfrvQWIVWKUyNhvUMIzRjKVL5iA3UvqO2Z+YOfJ3P27o6+LTvD/XXX6YCt6+FVF1r746m4OMOdu
 t/v0dJJumYqGun/DZ1opdRm6fHWC7qSBwq/DMQ0bdGunBxQehvHwvTCY6ALL0BVUdYVkFzZnry3XR
 yaccNkrg==;
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH8c0-00HWI4-6h
 for linux-mtd@lists.infradead.org; Tue, 02 Mar 2021 17:15:12 +0000
X-Originating-IP: 86.206.8.148
Received: from xps13.stephanxp.local
 (lfbn-tou-1-491-148.w86-206.abo.wanadoo.fr [86.206.8.148])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id C82F1C0007;
 Tue,  2 Mar 2021 17:14:46 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dejin Zheng <zhengdejin5@gmail.com>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, nixiaoming@huawei.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH mtd/next 1/8] mtd: Add helper macro for
 register_mtd_blktrans boilerplate
Date: Tue,  2 Mar 2021 18:14:46 +0100
Message-Id: <20210302171446.1807-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210213164600.409061-2-zhengdejin5@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: e936761e58935ae9bf5064e29ee05f3128bfbec9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_171512_025349_EBD52E2D 
X-CRM114-Status: UNSURE (   7.93  )
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

On Sat, 2021-02-13 at 16:45:53 UTC, Dejin Zheng wrote:
> This patch introduces the module_mtd_blktrans macro which is a convenience
> macro for mtd blktrans modules similar to module_platform_driver.
> It is intended to be used by drivers which init/exit section does nothing
> but register/unregister the mtd blktrans driver. By using this macro it is
> possible to eliminate a few lines of boilerplate code per mtd blktrans
> driver.
> 
> Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
