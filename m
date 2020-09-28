Return-Path: <SRS0=6iW2=DF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9035C2D0A8
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Sep 2020 15:01:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40AD1221EC
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Sep 2020 15:01:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LgRn2ND8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40AD1221EC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zT2xxf5+WF0urB+QktMesC8TqHEZs9sBxcIiTSlkR1M=; b=LgRn2ND8njvaHmHEMNofID009
	TtDb2uCaxUODPcMdGQvTvsEw8IngBjFkzcktyCTIZQRLVYXStv1rZTeRFdneSY6mUm97hpW83eDmm
	as6VEe7/uJpxxwPvMvnlTGyMVI3QSLkv1soRvL4x+t5YEa5Ux3O5SpeSaUMzdk93XZwm2AwjUzc9/
	s4WUsMVRg7N94GcPtI2mdgRyOtYmospahJDe7UbH62KuMmQ3BpfuMQV8Rn7e9Y2g0UkBJHhLCSfuf
	OSCZ7czRvv5bU/9/8fmqJstRDLOhb79nrMUY6OOk0bjwU0AgQIRqy9CPxRg7iNz+nGLXZ2UdSMgjm
	AosZg3yuw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMudM-0002Jh-0W; Mon, 28 Sep 2020 15:00:08 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMudH-0002Hh-9o
 for linux-mtd@lists.infradead.org; Mon, 28 Sep 2020 15:00:04 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 5DDD91C0004;
 Mon, 28 Sep 2020 14:59:59 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd: rawnand: ams-delta: Fix non-OF build warning
Date: Mon, 28 Sep 2020 16:59:57 +0200
Message-Id: <20200928145957.9218-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200919080403.17520-1-jmkrzyszt@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 57a57f268ec97432fb99df8d8e8957e86b34a9d6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200928_110003_496045_50577EF2 
X-CRM114-Status: UNSURE (   9.46  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, linux-mtd@lists.infradead.org,
 Nathan Chancellor <natechancellor@gmail.com>,
 kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, 2020-09-19 at 08:04:03 UTC, Janusz Krzysztofik wrote:
> Commit 7c2f66a960fc ("mtd: rawnand: ams-delta: Add module device
> tables") introduced an OF module device table but wrapped a reference
> to it with of_match_ptr() which resolves to NULL in non-OF configs.
> That resulted in a clang compiler warning on unused variable in non-OF
> builds.  Fix it.
> 
> drivers/mtd/nand/raw/ams-delta.c:373:34: warning: unused variable 'gpio_nand_of_id_table' [-Wunused-const-variable]
>    static const struct of_device_id gpio_nand_of_id_table[] = {
>                                     ^
>    1 warning generated.
> 
> Fixes: 7c2f66a960fc ("mtd: rawnand: ams-delta: Add module device tables")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
