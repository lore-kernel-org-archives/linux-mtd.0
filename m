Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47880C2BA4C
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jan 2022 10:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jln5c55uNiWQ+xsNCzg/huHWPN/eN20kkfspCBmYlPo=; b=O5bbNySaUgl9aX
	oKzLbA63clhNbUoFmUpFC3v0IzTxI5t2gA1RLIZZWRoItk2rUIvlG7aTJCXUsG5CRN/4AJUITs/O1
	ACjW/HogG2PWJdfKtFzjtppKv6brx54rI9kOvE5m7d4d3GsAj0I5HgAa0OUuWRYl8hX4nVvsPJkvD
	uTOK+ONNpGcNo2dIXNzo0CkNvYHn7CSwbEzzj1Mf0SlJTn+u7DIQkBup+ZohDgXAJ5O366MpUrtdz
	JSK5+FImgV54DAl4q2mDDy4U1adsrXaEMvig2FgQhsOb+bXqGb+jtuNH59l4PRiWtiYpkEJM0tNaP
	nKM8gu9BBypWl5zhTpMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCfuS-00BKfS-2Y; Wed, 26 Jan 2022 10:52:16 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCfuP-00BKeq-E9
 for linux-mtd@lists.infradead.org; Wed, 26 Jan 2022 10:52:15 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6D2086000E;
 Wed, 26 Jan 2022 10:52:09 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christian Eggers <ceggers@arri.de>, Han Xu <han.xu@nxp.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Stefan Riedmueller <s.riedmueller@phytec.de>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Pavel Machek <pavel@denx.de>, stable@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: gpmi: don't leak PM reference in error path
Date: Wed, 26 Jan 2022 11:52:08 +0100
Message-Id: <20220126105208.882283-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220125081619.6286-1-ceggers@arri.de>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'9161f365c91614e5a3f5c6dcc44c3b1b33bc59c0'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_025213_657663_4663E22E 
X-CRM114-Status: UNSURE (   6.48  )
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

On Tue, 2022-01-25 at 08:16:19 UTC, Christian Eggers wrote:
> If gpmi_nfc_apply_timings() fails, the PM runtime usage counter must be
> dropped.
> 
> Reported-by: Pavel Machek <pavel@denx.de>
> Fixes: f53d4c109a66 ("mtd: rawnand: gpmi: Add ERR007117 protection for nfc_apply_timings")
> Signed-off-by: Christian Eggers <ceggers@arri.de>
> Cc: stable@vger.kernel.org

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
