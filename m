Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA058C63684
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jan 2022 10:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Eh3tRXxJF0h+fOtwhZRPtVQRbVaE8lMQMbDmEva03MI=; b=S6Zdjkeg+tK0eq
	yUCLjER9N7ChO9h1MrbIDmUkd9Hj+6WkyttXnfdIkpgvEuSnmFDHEY84w+CtUeI+ErPOvEMGKpRrz
	7P+W6qUshCKK/AberuYVlvPJfOfVXK42IFP89zyMLRLjVoZ6wadlY61wxyd6uRQqqv5GVPn7795Nq
	+/gdUm7wiC6ec51i7t2ADn3NFGW9P9r2SDk96PlpikmyRr6lz8TQPOqaylaOR/bA8DrCir3L3ZRQ3
	MFjJ0XJcjbUB1tmzjE6OrczvmL5XtUd5t6byLV9f0MTBg2CfDTbsidyo3a6uolAkD9OPNVSOiZWED
	1Znsmxvdlo3KJ8zJMT5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCfur-00BKlM-At; Wed, 26 Jan 2022 10:52:41 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCfuY-00BKgI-8s
 for linux-mtd@lists.infradead.org; Wed, 26 Jan 2022 10:52:23 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0D31960003;
 Wed, 26 Jan 2022 10:52:18 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Florian Fainelli <f.fainelli@gmail.com>,
	linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 kernel test robot <lkp@intel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 bcm-kernel-feedback-list@broadcom.com (open list:BROADCOM STB NAND FLASH
 DRIVER), linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH] mtd: rawnand: brcmnand: Fix sparse warnings in bcma_nand
Date: Wed, 26 Jan 2022 11:52:18 +0100
Message-Id: <20220126105218.882414-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220125225243.15201-1-f.fainelli@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'd430e4acd99f3f2cd5fa30fa6e27dd39261cc967'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_025222_472574_A59748F1 
X-CRM114-Status: UNSURE (   6.83  )
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

On Tue, 2022-01-25 at 22:52:43 UTC, Florian Fainelli wrote:
> sparse was unhappy about the way we woulc call cpu_to_be32/be32_to_cpu,
> apply the appropriate casting to silence the warnings.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org/thread/ZNHPJFYLO64EGI5QUT7HZ63J7O5J2G7N/
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
