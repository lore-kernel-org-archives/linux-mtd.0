Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00B7C433F5
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Jan 2022 15:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2vt4xzPGqfiOfoe3EjyCwbVCfOF5m1T35R57bMdp3Xo=; b=CR7ELGHecZTlad
	b4+axXulvWPvbS+hutUNNS+tgH8wGuirLP+rPAQNbSFuwL9jrYfQQ4Mz2BvmzT6nuxFwL+00/uriA
	4+HsEYtoJE1pxwDzm77SR4MiRg/9sBP+vFx4NRd55UvtE7cy2oVMFD1vrVtUrLI7MoraEoytKBAIt
	6AnciSPJjeks7NhLISq/Wm/hXJsT8jdCxj5uHC0WpAfQ8+5QdRrNtSzxQBHBfGg7xUgyqVm3sbxY8
	xO5whTB9HNpx7JrKbZkZ+DXg9dWVRBkApuAZGHpCv6nfUbXo3hy2S4j0xhrXPDfR635QACOpmur+p
	ZiIdP9rz+0q+FTEhwsPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBf43-001AD7-La; Sun, 23 Jan 2022 15:45:59 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBexz-0018MR-Ug
 for linux-mtd@lists.infradead.org; Sun, 23 Jan 2022 15:39:45 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 69B2560003;
 Sun, 23 Jan 2022 15:39:41 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Han Xu <han.xu@nxp.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH 3/4] mtd: rawnand: gpmi: validate controller clock rate
Date: Sun, 23 Jan 2022 16:39:41 +0100
Message-Id: <20220123153941.673301-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220118095434.35081-4-dario.binacchi@amarulasolutions.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'15e27d197a7ea69b4643791ca2f8467fdd998359'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220123_073944_396413_14ACEACD 
X-CRM114-Status: GOOD (  13.18  )
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

On Tue, 2022-01-18 at 09:54:33 UTC, Dario Binacchi wrote:
> What to do when the real rate of the gpmi clock is not equal to the
> required one? The solutions proposed in [1] did not lead to a conclusion
> on how to validate the clock rate, so, inspired by the document [2], I
> consider the rate correct only if not lower or equal to the rate of the
> previous edo mode. In fact, in chapter 4.16.2 (NV-DDR) of the document [2],
> it is written that "If the host selects timing mode n, then its clock
> period shall be faster than the clock period of timing mode n-1 and
> slower than or equal to the clock period of timing mode n.". I thought
> that it could therefore also be used in this case, without therefore
> having to define the valid rate ranges empirically.
> 
> For example, suppose that gpmi_nfc_compute_timings() is called to set
> edo mode 5 (100MHz) but the rate returned by clk_round_rate() is 80MHz
> (edo mode 4). In this case gpmi_nfc_compute_timings() will return error,
> and will be called again to set edo mode 4, which this time will be
> successful.
> 
> [1] https://lore.kernel.org/r/20210702065350.209646-5-ebiggers@kernel.org
> [2] http://www.onfi.org/-/media/client/onfi/specs/onfi_3_0_gold.pdf?la=en
> 
> Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Tested-by: Sascha Hauer <s.hauer@pengutronix.de>
> Reviewed-by: Sascha Hauer <s.hauer@pengutronix.de>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
