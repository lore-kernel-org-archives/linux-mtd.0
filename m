Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1795C433F5
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Jan 2022 15:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TXIvPlJKwKZJJxwLgPTOQeceOI0pHPqcxYG0Uijnmw0=; b=ncJ/cWxuOu3bNK
	v9UfnFVLc6zUq2cGSQPPhriQlPJx20i/N6YXMQWtkL29QZTqJw7Tv/+ZMMCYuHSrJUvegBkJKzrdW
	dg+aBUv5Xm5jKhtLHbqBz71Bx51Z+tSQwIIjYW/+62A+EubFUc+BnDG1FjdMvU/EiOji/CPwnALs3
	Uo+W85aCrgehi5bW+h1P8P62U2KexodQs88I04T/Fql65cr+QWf5fjcccCeUQf3ANevYHn9us/2x+
	czdDIDOzUotZZAcAae9sPbN5dq9zRArTQLiFNm2IU13Xd5n0r1L3o2JEcqhLEijxT6cWICSR6kANg
	cNbyfpGBVmAOFwooSg4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBeiM-0013Lp-Cz; Sun, 23 Jan 2022 15:23:34 +0000
Received: from relay11.mail.gandi.net ([2001:4b98:dc4:8::231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBehx-0013HL-RV
 for linux-mtd@lists.infradead.org; Sun, 23 Jan 2022 15:23:11 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 106DD100003;
 Sun, 23 Jan 2022 15:23:06 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Boris Brezillon <bbrezillon@kernel.org>, Han Xu <han.xu@nxp.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH 2/4] mtd: rawnand: gpmi: fix controller timings setting
Date: Sun, 23 Jan 2022 16:23:06 +0100
Message-Id: <20220123152306.529424-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220118095434.35081-3-dario.binacchi@amarulasolutions.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'136101c26073ff34b27b0b8fadd0abc5c7ad51f0'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220123_072310_064888_D702F32A 
X-CRM114-Status: UNSURE (   9.62  )
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

On Tue, 2022-01-18 at 09:54:32 UTC, Dario Binacchi wrote:
> Set the controller registers according to the real clock rate. The
> controller registers configuration (setup, hold, timeout, ... cycles)
> depends on the clock rate of the GPMI. Using the real rate instead of
> the ideal one, avoids that this inaccuracy (required_rate - real_rate)
> affects the registers setting.
> 
> This patch has been tested on two custom boards with i.MX28 and i.MX6
> SOCs:
> - i.MX28:
>   required rate 100MHz, real rate 99.3MHz
> - i.MX6
>   required rate 100MHz, real rate 99MHz
> 
> Fixes: b1206122069a ("mtd: rawnand: gpmi: use core timings instead of an empirical derivation")
> Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Tested-by: Sascha Hauer <s.hauer@pengutronix.de>
> Reviewed-by: Sascha Hauer <s.hauer@pengutronix.de>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
