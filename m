Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2089C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jun 2022 14:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FbJKnpxKV7p3xK1X+Cpr756PvoT5UmwmGlz7LPbEe2A=; b=AZ/8f9b9Xc0yMZ
	VKK0XpAowajDb8Uazlt/TNH+l8SFLMAPZyt1wgU3vEYXcPVims0BzU3z7IGB9TlIj3c2Q4g3MXWHR
	Ckay68bgIXQajbAkDXVam/3X73UnkRY8fXKO5tYMS/qXyU87AMBmpkbZmmIiQr2o4KPeXqmwwn2ij
	tQ9a/HrXFRYPrcoy2KceNQOwtJJC/5FOi+Tbfj8SBGGSFV9nUGIyOpkct44xkJWew2GJw3af8m9To
	Fx5eNaBn98VR9JSjdFdx2GrJf/ev4AfVOOtUmslRLteg8RMdPIpp7QjkVnXolFREOaZv2y/utR90j
	4U7kRv8juIpazu+r1nTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1qlu-002zf9-FB; Thu, 16 Jun 2022 14:46:58 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1qlr-002zee-4Q
	for linux-mtd@lists.infradead.org; Thu, 16 Jun 2022 14:46:57 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B498D1BF205;
	Thu, 16 Jun 2022 14:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1655390809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/AgQDX0Gq/OI8+a8WozmyXT5Ol2nvRQf46aPsDnWWlA=;
	b=FW+RdGfEDOT2EJzxbG8UuFhOhmQLknYXMup9cU9f7Pe+BJxanVliVRibxSUTVLCYEM3i8E
	7j+HsYDiMPIWJrhcbZkTZ5liG/u3yyiWFcAvsDgP1Lblv2jIEe95kfcEldOPLUUcv4OoMY
	uLGvEih61OsDvQLDlNhMzbD/eF6kbN+Zk2mB8dai86R9uKAwbjUqE0PHMjLPFpDR1gJtNY
	ickClivueBUTgBlLqb/4mJ4ynUsiPm2rtnP2eEu55gclBILEXOBFRrPNav7GcCUnfo9Ocx
	+jcSAC6hiAPZHkfvzkn/mCvWapS0FE/he7dyKazNaDyc8w5t10TvzQTEInDwAg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sascha Hauer <s.hauer@pengutronix.de>,
	linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Han Xu <han.xu@nxp.com>,
	kernel@pengutronix.de,
	stable@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: gpmi: Fix setting busy timeout setting
Date: Thu, 16 Jun 2022 16:46:47 +0200
Message-Id: <20220616144647.402987-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220614083138.3455683-1-s.hauer@pengutronix.de>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'06781a5026350cde699d2d10c9914a25c1524f45'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_074655_346174_FC0BD124 
X-CRM114-Status: GOOD (  12.72  )
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

On Tue, 2022-06-14 at 08:31:38 UTC, Sascha Hauer wrote:
> The DEVICE_BUSY_TIMEOUT value is described in the Reference Manual as:
> 
> | Timeout waiting for NAND Ready/Busy or ATA IRQ. Used in WAIT_FOR_READY
> | mode. This value is the number of GPMI_CLK cycles multiplied by 4096.
> 
> So instead of multiplying the value in cycles with 4096, we have to
> divide it by that value. Use DIV_ROUND_UP to make sure we are on the
> safe side, especially when the calculated value in cycles is smaller
> than 4096 as typically the case.
> 
> This bug likely never triggered because any timeout != 0 usually will
> do. In my case the busy timeout in cycles was originally calculated as
> 2408, which multiplied with 4096 is 0x968000. The lower 16 bits were
> taken for the 16 bit wide register field, so the register value was
> 0x8000. With 2970bf5a32f0 ("mtd: rawnand: gpmi: fix controller timings
> setting") however the value in cycles became 2384, which multiplied
> with 4096 is 0x950000. The lower 16 bit are 0x0 now resulting in an
> intermediate timeout when reading from NAND.
> 
> Fixes: b1206122069aa ("mtd: rawnand: gpmi: use core timings instead of an empirical derivation")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
