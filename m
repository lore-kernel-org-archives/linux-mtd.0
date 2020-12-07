Return-Path: <SRS0=dr6A=FL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7E0EC433FE
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Dec 2020 11:10:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69D5B23340
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Dec 2020 11:10:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69D5B23340
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8E+GkyIL1VAK8vmca54Is9x1QRKBvRfatbnIHHi0UjM=; b=2KjvSnW5tkr1KlBpItcnKVZ4R
	Ek61FQwdcChqYUrvgVGOP1+BhT35ugwroyj/U/VyNnhm4KLuoMJTbYHs5cLZUHoXwGWWSE9grixgM
	UNfnNAfQxRIVs5659M3vfBF+pkUzWQhCn97MVOqzAAJVEj+i6zX8ro3mHW6p1gi+rARlJDNiZ8SEQ
	j5rNXyLgSiGdT06l+Ex8STSBvKCJPBtZXZvBjunNW4aPFRJMrjKVvbi2fbnQMqgyt2Sazm/Dd1C5u
	y312QWykpMwLKXIDfifNsauKhfDtNR+GdW6tgRSPDarHGwL6ii+r8+V1OQ7hparmKIpJXeU7bhu2/
	GFUo/n2Mg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmEPA-0003nV-J9; Mon, 07 Dec 2020 11:10:08 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmEOy-0003hD-6I
 for linux-mtd@lists.infradead.org; Mon, 07 Dec 2020 11:10:00 +0000
X-Originating-IP: 109.220.208.103
Received: from localhost.localdomain
 (lfbn-tou-1-1617-103.w109-220.abo.wanadoo.fr [109.220.208.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id AD863240019;
 Mon,  7 Dec 2020 11:09:51 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Ramuthevar,
 Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>, 
 miquel.raynal@bootlin.com, vigneshr@ti.com, tudor.ambarus@microchip.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 robh+dt@kernel.org
Subject: Re: [PATCH v17 1/2] dt-bindings: mtd: Add Nand Flash Controller
 support for Intel LGM SoC
Date: Mon,  7 Dec 2020 12:09:50 +0100
Message-Id: <20201207110950.8142-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201110012333.18647-2-vadivel.muruganx.ramuthevar@linux.intel.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: e5ec4db9992be75dd4e18c408e0ea2f6646ae112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_060956_377912_A279BBF0 
X-CRM114-Status: UNSURE (   7.50  )
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

On Tue, 2020-11-10 at 01:23:32 UTC, "Ramuthevar, Vadivel MuruganX" wrote:
> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> 
> Add YAML file for dt-bindings to support NAND Flash Controller
> on Intel's Lightning Mountain SoC.
> 
> Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
