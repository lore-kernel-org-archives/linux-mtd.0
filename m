Return-Path: <SRS0=dr6A=FL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38862C4167B
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Dec 2020 11:10:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D782223356
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Dec 2020 11:10:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D782223356
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/LrQQkW2flH2DP7KsFCdmSY7zxAq+/I/6N9SGE4KhN4=; b=QudIe68U/gcfauUJVnlfgfu3w
	u3Gdq33Ef9p9Y12R4s5V+RTnHqWFQ+tnmk0OpECsxVPWP9VPu0xDNOs3VUktiLixD5SPZ3FhGFmTs
	H1kPEuRSnwYGML4gryDI1nLhj/X0bbVMfFipTFnomadPoOUrtlZr+3roxvoJhcgi5eeo7PH0vdBi+
	v3osDS2hGmufsCmRBxJ3c5MY78vUKBQx4zI1LOzqu5zi1VXLAvzovtZaSxvAR1LOVywvViG6ulfJK
	Cttj/3WZfUik110ed3BP+PQ64X/8tiVUpxpWodqE9jvzPEFY0eyppLY9kdSq3YjwSfbLT9LOz0pSR
	LPX2aGQZg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmEOs-0003em-Kx; Mon, 07 Dec 2020 11:09:50 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmEOq-0003cx-C9
 for linux-mtd@lists.infradead.org; Mon, 07 Dec 2020 11:09:49 +0000
X-Originating-IP: 109.220.208.103
Received: from localhost.localdomain
 (lfbn-tou-1-1617-103.w109-220.abo.wanadoo.fr [109.220.208.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id B19EC1BF20F;
 Mon,  7 Dec 2020 11:09:43 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Ramuthevar,
 Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>, 
 miquel.raynal@bootlin.com, vigneshr@ti.com, tudor.ambarus@microchip.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 robh+dt@kernel.org
Subject: Re: [PATCH v17 2/2] mtd: rawnand: Add NAND controller support on
 Intel LGM SoC
Date: Mon,  7 Dec 2020 12:09:42 +0100
Message-Id: <20201207110942.8080-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201110012333.18647-3-vadivel.muruganx.ramuthevar@linux.intel.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 613b6e4e3baa90de4dc16c4d12fa5463e89f966c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_060948_528244_F59EF3BE 
X-CRM114-Status: UNSURE (   8.47  )
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
Cc: cheol.yong.kim@intel.com, devicetree@vger.kernel.org, richard@nod.at,
 simon.k.r.goldschmidt@gmail.com, dinguyen@kernel.org, qi-ming.wu@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 2020-11-10 at 01:23:33 UTC, "Ramuthevar, Vadivel MuruganX" wrote:
> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> 
> This patch adds the new IP of Nand Flash Controller(NFC) support
> on Intel's Lightning Mountain(LGM) SoC.
> 
> DMA is used for burst data transfer operation, also DMA HW supports
> aligned 32bit memory address and aligned data access by default.
> DMA burst of 8 supported. Data register used to support the read/write
> operation from/to device.
> 
> Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
