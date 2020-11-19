Return-Path: <SRS0=mdPP=EZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8048FC388F9
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 21:21:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECE6622240
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 21:21:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gDlyph/7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECE6622240
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NYwUuMYSgSQx5uSiZahCYqHctKGjlVbg6Vlv85aEkDw=; b=gDlyph/7K9QV2JT0MIMcJe0tc
	+8CWS6hb4xf6NXOKRFfFKNltvxLbgPAlM7dNZ718ikyubk5Na37HT1RTwkRf/N0oM7/EBi20vH+Mk
	1nJI+VwF6XaUi6n0OqbuXSxykTP48cCNNqURgWw7kxQN3Mh2a2rkN4gegYRfhFkzs2ZrvWUrAA1Tp
	T5+ckgMcMh7WyIYCmbFXMUYHDMHcvCeFVyEjefoM5fxVutLAtVQ2q0zsJ6oGPComCAx4iV7oZjSNp
	MbnxlGaDYFW8SZ7z2C7wc/0p5UJL7vZpWo0kYuDMaRV30Op5FGULiSqSiad5eOiGpUf/eWhUARjCt
	zYbg4ghCQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfrMG-0002X3-7x; Thu, 19 Nov 2020 21:20:48 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfrMD-0002Vc-Lp
 for linux-mtd@lists.infradead.org; Thu, 19 Nov 2020 21:20:46 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id A996AC0003;
 Thu, 19 Nov 2020 21:20:42 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Zhang Qilong <zhangqilong3@huawei.com>, han.xu@nxp.com,
 miquel.raynal@bootlin.com, vigneshr@ti.com
Subject: Re: [PATCH] mtd: rawnand: gpmi: fix reference count leak in gpmi ops
Date: Thu, 19 Nov 2020 22:20:41 +0100
Message-Id: <20201119212041.8122-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201107110552.1568742-1-zhangqilong3@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b7e26916648359bcc7382295fac18122aca3bee2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_162045_829972_5BC18979 
X-CRM114-Status: GOOD (  11.68  )
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
Cc: richard@nod.at, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, 2020-11-07 at 11:05:52 UTC, Zhang Qilong wrote:
> pm_runtime_get_sync() will increment pm usage at first and it
> will resume the device later. If runtime of the device has
> error or device is in inaccessible state(or other error state),
> resume operation will fail. If we do not call put operation to
> decrease the reference, it will result in reference leak in
> the two functions(gpmi_init and gpmi_nfc_exec_op). Moreover,
> this device cannot enter the idle state and always stay busy or
> other non-idle state later. So we fixed it through adding
> pm_runtime_put_noidle.
> 
> Fixes: 5bc6bb603b4d0 ("mtd: rawnand: gpmi: Fix suspend/resume problem")
> 
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> Acked-by: Han Xu <han.xu@nxp.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
