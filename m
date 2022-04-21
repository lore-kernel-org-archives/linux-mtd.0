Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C74D0C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 07:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yW7swdDb15W5QYjIMuoOIhaNiTH6oWcvOFQnOxwtKzs=; b=h4WnhB0aFGTLtd
	CeI57KI4pf/DG4F/Jf7iikkHi/7YseTxWexKefLWP/oKX+z4jzdYl12TT7Rw1zR2dfRSfPznPW43V
	+fvbFpADnkOIyY4vwxnnOmdIsHCru02/hVqKBNBBn+EOzf/GiCYEqCAc6yJMbiIZcrfUU/WIr1wCI
	ANI+Do6ycD5Cyu0+IpqR3C3GluzpbEj0+sZd7foo/WPZjRSlnxv0vtMotfmSCTBcG5uMBs9gRFDxZ
	MK1uHbzRaxSII/R6rWFjRzIsie1UcXQK575rWP/GBvHvAcTJDaPVxKm1j5kanRNL24H9vXQ28Nuc+
	9i5gjm/r/lZavCfPDGUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhRPo-00C5pd-Ro; Thu, 21 Apr 2022 07:39:48 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhRNE-00C3zf-VE
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2022 07:37:10 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A80A9FF80D;
 Thu, 21 Apr 2022 07:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650526627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eXUITSnEEhArhh41XtuaK/zg1C1PeaWksHzqxHExQWE=;
 b=Z9sqQ5C3VcC/gzSwuKAlsnkx4SWhe+crBVLcKml8NEgITIMHSWS2/2hIvj3pp80mlHy8EQ
 hJypibenUlVstXLP1VuxGA2Lm9ABFPRZ+kdLlEQUh5i5Ld1K9FZPAnpfzo6r0Rw9T9zzca
 Aaelvnu4ieY9G8nKgAMaCMkVHbFbBntXiboOdavi9B2h7NWAeQLhccQwcAYQj9sJ9xr9pV
 IuI/fEaIaj0Mj9E879HbNfahYUIAOTVTHuC61Ec3BlpwFRsKI7PmPq5w0OAp8vrg9sd/C4
 nidckbp3rlGl2+UBY6fJ9dnTvIYWwoMsD+C7hh7v5n2iHCcqFHEnNcpQsy2HUA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Han Xu <han.xu@nxp.com>, sean@geanix.com, frieder.schrempf@kontron.de,
 festevam@gmail.com
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, ye.li@nxp.com, peng.fan@nxp.com,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v4 2/5] mtd: rawnand: gpmi: Add strict ecc strength check
Date: Thu, 21 Apr 2022 09:37:06 +0200
Message-Id: <20220421073706.72686-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220412025246.24269-3-han.xu@nxp.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'd10af38a2e3b60dc46ca9727dfc24d0ea57136e3'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_003709_178929_CE245CCF 
X-CRM114-Status: UNSURE (   5.19  )
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

On Tue, 2022-04-12 at 02:52:43 UTC, Han Xu wrote:
> Add nand_ecc_is_strong_enough() check in gpmi_check_ecc() function to
> make sure ecc strength can meet chip requirement.
> 
> Signed-off-by: Han Xu <han.xu@nxp.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
