Return-Path: <SRS0=bx7I=26=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B529FC282DD
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 19:16:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84E29206ED
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 19:16:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tZ7mU0zR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84E29206ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=THOpFFuK2p2zuFZTQOCx9I/f2Nf6Pyg921xBavpX/HE=; b=tZ7mU0zRTvzFI7
	6JN9ZtlLtnydfOnZIFU/eEymwYBHc5uFvXShm9TJB6IrftF2po/K4AbLPZwptl8Zr9gXzE3mPr9j8
	6pu2eXJB/si2CJPI3hzhKD+g2BT6CyLxNU5s38eHtPtjSwQiX5lwqrmUs55VJNW2Jagmln273Y+19
	PVSTWyPVEh6+dRcW7Ca7uboSvw9A9XRxUfe1H7wCLcOSzQqvnLL5Z2dBbnsiPggOa1wcvX7Qr3uFz
	kZJRGCSjC2xQOR3Q+i8E/oA2pOb44oaJ4TVHW1gUa4DEqT9EtojLCihFMcd1J3eiuOfO81YIyjW6a
	KJOEo+Zzk65BckaRw8+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipdIJ-0001PV-Kk; Thu, 09 Jan 2020 19:16:35 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipdH1-0008UC-L9
 for linux-mtd@lists.infradead.org; Thu, 09 Jan 2020 19:15:17 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id DCB0E24000B;
 Thu,  9 Jan 2020 19:15:12 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@st.com>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com
Subject: Re: mtd: rawnand: stm32_fmc2: avoid to lock the CPU bus
Date: Thu,  9 Jan 2020 20:15:10 +0100
Message-Id: <20200109191510.10963-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1576486915-7517-1-git-send-email-christophe.kerello@st.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 4114b17af41272e14939b000ce8f3ed7ba937e3c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_111515_867127_C9B54966 
X-CRM114-Status: UNSURE (   7.18  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 2019-12-16 at 09:01:55 UTC, Christophe Kerello wrote:
> We are currently using nand_soft_waitrdy to poll the status of the NAND
> flash. FMC2 enables the wait feature bit (this feature is mandatory for
> the sequencer mode). By enabling this feature, we can't poll the status
> of the NAND flash, the read status command is stucked in FMC2 pipeline
> until R/B# signal is high, and locks the CPU bus.
> To avoid to lock the CPU bus, we poll FMC2 ISR register. This register
> reports the status of the R/B# signal.
> 
> Fixes: 2cd457f328c1 ("mtd: rawnand: stm32_fmc2: add STM32 FMC2 NAND flash controller driver")
> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
