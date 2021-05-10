Return-Path: <SRS0=B2Jc=KF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FEA3C433ED
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 09:23:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D8FB6142D
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 09:23:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D8FB6142D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rU7w42okHXo/4jWBiyjGGZQIra2hFkanwdMUlgXIqIA=; b=akpBmE6rRG6sADc0XpgXJPzDV
	TpmDrfgFXbgv4EFzG2zgqa6bxvhg9DMx6/wRIPlo2NaZhMyfweOzWSPhFenJR3XRbrQcZgDcfVHeG
	MxCC7E9FiCEUQujKVlwQfhlFUxKhoqxj0ADQKMGohorK1vc51N7Xq9h9NdrrScbMLkTfXTzwgWBWI
	1QBUez6A3sMLjy0MsUgZi08kTiprbvKBGrVZ1G9bgfWouRvzP5T7Yos702KHIA6YB6DWXPqK7pdM5
	98rm/atifQqS4wo2B/sCRVhzoW5fiJedRjzczhfVKF15YhGVl51+WPKrzHDfQk53e0AFmMtcMSlcC
	Q4XH+X5Gw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg26q-00DkYO-HS; Mon, 10 May 2021 09:21:53 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg1vY-00DiRy-O8; Mon, 10 May 2021 09:10:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=dK5nNu9QGzTBeT6vatvyfy6a9OeTUIOFCfeuKdBdXlI=; b=bnaY+9babMFyTtOOXh7kw26iyZ
 /dP65A65Bt6COB9CXhkpNghWUN7GBqcxv9jAuBV6TCzWyEqCJ1Pxrld1vixeQwd+jFx8MOKyizJSz
 rD0trz4T1ezS0SJpgUqVeEqqFFzUFniTEAHXjdqG8BiKDxRsDNEtaBL5qpyzuYcyobPSuuo18YW22
 khH/4pcQ5Yyp7BY/hW/O+AZ0lJsuK+TxH9L1sBfdMJRihwiQHHPdXTnj+ij/Oy6Z/KCbgqlW4Lp4X
 zvtWqA5SVNG+7ArAro6agEM5B5sHQ7qGrYqBw5cW7ZnthntjX6nt2KUqe+fmvDvLJciSUE7N+1jmh
 bW8MF2zQ==;
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg1vW-008RZj-4q; Mon, 10 May 2021 09:10:11 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id AA974240018;
 Mon, 10 May 2021 09:10:06 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yu Kuai <yukuai3@huawei.com>, joern@lazybastard.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 matthias.bgg@gmail.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 yi.zhang@huawei.com
Subject: Re: [PATCH 2/3] mtd: plat-ram: remove redundant dev_err call in
 platram_probe()
Date: Mon, 10 May 2021 11:10:05 +0200
Message-Id: <20210510091005.4100-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210408111514.1011020-3-yukuai3@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'c054de10ae5d6d8b3f417cb8d29e67a7cd686f36'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_021010_337408_0F134DB2 
X-CRM114-Status: UNSURE (   5.26  )
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

On Thu, 2021-04-08 at 11:15:13 UTC, Yu Kuai wrote:
> There is a error message within devm_ioremap_resource
> already, so remove the dev_err call to avoid redundant
> error message.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
