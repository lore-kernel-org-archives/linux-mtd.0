Return-Path: <SRS0=eMUk=JE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 353CAC433B4
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Apr 2021 09:07:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD70361177
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Apr 2021 09:07:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD70361177
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cQdAbh0/ozOMGEFRBDSWTXgnZYVYflNYJEQ0j+ojtCw=; b=GLRKoB9S+YSJHgRZJcuqXQZOp
	toMFILSw2+tNSgO07N8cT2xjDyOzsTaa2b/1vQB5tilpcdM1+Zfppd79uORV7Xua6KXPGDF8wFdsT
	KpemNs0bRX9c+jMxX32XiIMEvQWb+WyF4v/gtgeo3jDTLaNPneJGi0mOvryEDEdXKRjiYO9TPpqIN
	sjRrRDUGTt78CpCXV9OKTSMOD/h/3F860BQ2dHPV0UD6S/1BY/ZJND0VXihVoE9KuvHKOLoyQel/h
	DmUHce7aiVx4blhfGy+/xcXbvfC9c+IEls73wCRIApDfIAFFB4WCFMO15tFqb4zBKJH7t8/YmNHma
	K72U2ai2Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lU49E-004Y1w-17; Wed, 07 Apr 2021 09:06:52 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lU48y-004Xz3-5e
 for linux-mtd@lists.infradead.org; Wed, 07 Apr 2021 09:06:38 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id CC587E0013;
 Wed,  7 Apr 2021 09:06:33 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Lv Yunlong <lyl2019@mail.ustc.edu.cn>, han.xu@nxp.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 bbrezillon@kernel.org
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: gpmi: Fix a double free in gpmi_nand_init
Date: Wed,  7 Apr 2021 11:06:33 +0200
Message-Id: <20210407090633.45393-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210403060905.5251-1-lyl2019@mail.ustc.edu.cn>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'076de75de1e53160e9b099f75872c1f9adf41a0b'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_100636_532585_3300B609 
X-CRM114-Status: UNSURE (   9.61  )
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

On Sat, 2021-04-03 at 06:09:05 UTC, Lv Yunlong wrote:
> If the callee gpmi_alloc_dma_buffer() failed to alloc memory for
> this->raw_buffer, gpmi_free_dma_buffer() will be called to free
> this->auxiliary_virt. But this->auxiliary_virt is still a non-NULL
> and valid ptr.
> 
> Then gpmi_alloc_dma_buffer() returns err and gpmi_free_dma_buffer()
> is called again to free this->auxiliary_virt in err_out. This causes
> a double free.
> 
> As gpmi_free_dma_buffer() has already called in gpmi_alloc_dma_buffer's
> error path, so it should return err directly instead of releasing the dma
> buffer again.
> 
> Fixes: 4d02423e9afe6 ("mtd: nand: gpmi: Fix gpmi_nand_init() error path")
> Signed-off-by: Lv Yunlong <lyl2019@mail.ustc.edu.cn>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
