Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED9B0C4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 07:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IlQEv2K8mhYwRCGIB+2ilimC7o5gGOP2GQKrz81dsHo=; b=rh7/ooOAsjCeBJ
	mRFW38495WO90cmczqimXoTGkzglGdVXYSY8sq/A7aqg7fwqE9KkSUJPUKYr/k5cwLOmGZG56lZB/
	pf1D0QXRH8+NHKs3KpCZ1SI1hvzoU06wmZQ9tTf/yh7/TXdL1xLjO4TmRagOxsqXr2+d1JQJiJ1PY
	gojoKZ4GJRZR7oGn1yzx9rMsIpKBqMXldwTy2BsYTM6gUDmri45OICYSKdauNGar28/8GYqCqVjY3
	kuWR4oTLAgnndpPYvAneeHWA8gv/VO7DJBv9MmhCpDauRm1xMQxaspQ4GSSr0JFhd55rX5pMbfXmf
	QMOkYFd2c7xmNJXt0SEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhRLv-00C2vm-7n; Thu, 21 Apr 2022 07:35:47 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhRLr-00C2t3-R8
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2022 07:35:45 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 19572FF80D;
 Thu, 21 Apr 2022 07:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650526540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4jU55ttnkGA9W+XKCmJXdLWIsz4rp3Q076zooBZ1bjY=;
 b=clT3/67CqxmY3hfrSvsstLcHrhFXDFRERcvVI8evEAfUsSJZ8s1NWP6+aHOtTla54sdNTQ
 LflefWK98THbIKM48sAok0bDep2v3FVhzddSYd7TyZ/oaFrNRjSPLx6CKMiOWhE/0fmLEJ
 3xV7WrYt2b8HHT1/HF/Zhnth7qrLn0hZfEVfRGQkmahQBLOiLfWHoh+sNC+ZLFvpKc13m8
 iqgrNydZ9sYUZ2dUaAYVnvnB51GDuUhvYMg5QUEmTmk98d6Lc2+g2AD0UB2LRCtH+XyUG3
 2j7t7bZ4k4RDPLrsMJit86iJ0bSBCYW31eEtNuosfTpB4udW3pGOgJJk65a17g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miaoqian Lin <linmq006@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Pratyush Yadav <p.yadav@ti.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Bastian Hecht <hechtb@googlemail.com>,
 Guennadi Liakhovetski <g.liakhovetski@gmx.de>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mtd: rawnand: Fix return value check of
 wait_for_completion_timeout
Date: Thu, 21 Apr 2022 09:35:37 +0200
Message-Id: <20220421073537.71822-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220412083435.29254-1-linmq006@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'084c16ab423a8890121b902b405823bfec5b4365'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_003544_068992_1C94599D 
X-CRM114-Status: UNSURE (   7.47  )
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

On Tue, 2022-04-12 at 08:34:31 UTC, Miaoqian Lin wrote:
> wait_for_completion_timeout() returns unsigned long not int.
> It returns 0 if timed out, and positive if completed.
> The check for <= 0 is ambiguous and should be == 0 here
> indicating timeout which is the only error case.
> 
> Fixes: 83738d87e3a0 ("mtd: sh_flctl: Add DMA capabilty")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
