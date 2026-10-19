Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D51CCF2DA
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Oct 2026 06:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7M7RPT7Go4CCXkScEHxcHfAL/oHMO6Xzg/zByVUo5p0=; b=av+l5Cy1f3NBn5
	X+JHTQschrnLzZtweg3nS7U87rY4+rXWmnwneANIYQyAdeCIg4uOyLadkZZ7O86qs8CDuVhaiA6ef
	wyZxnrSts3o9Gte9h2bKS26ioE0lIlWRG+Xs8KRO87jnwtbMEPmjsNsbBLnTWx9Hp86jDT0CTD0lc
	NsOuA5ydFcZz8NKUI9yFLENkN8UIYsgY7Bbx3hFzZnoiwCpyMS/SAfAYcgo0BswNFVzfY9CslvlVm
	dNMdVJ62j9w8ZLQt8z+OEkviRQQ5mQfMTtiATySN/mB6T+79t8MdYIbZT8R0ZWnZeM6D2WyS5It91
	07nQ7r71nafEY18/YLyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIhCQ-00000006j1t-0rkB;
	Mon, 19 Oct 2026 06:50:22 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIhCN-00000006j0k-3pyK;
	Mon, 19 Oct 2026 06:50:21 +0000
Date: Mon, 19 Oct 2026 08:50:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792392615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=emrArgPAsqjY08ePzydEuGzwJRc8mfRvNdYNfd+oT14=;
	b=A+jIjzxXNlwnaYRh3MCvTCxo+i9IXaPhGLvG2oH466t1wTayWoBberbLAa2GuRB/wHQgTC
	da2tJmZEYQOBdTmUpl+dQDW/kbTi+6wuwI07icPzElp34f7sgapAxeSU028PxHEAfjbzsR
	0Hw81pH3Tf39waNxC2ODPVF0kgQpH29elyjev+0uCfBpDrmis2ZCz92in7o6+VkKiqkzSl
	GZkKEgGxy0VAVBDGX4vTtulhRD7wbW0gcCwP5kQG1fHjuUE9BVU9w2xmyfkJke6LrYsNX/
	pOBOu0P59WVHGR1DGkdep5xRghY6FyD/+HgUN7MK66WEGNBihMDovhjLGbLhxA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792392615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=emrArgPAsqjY08ePzydEuGzwJRc8mfRvNdYNfd+oT14=;
	b=N0nc2AwPluQ0WZBDwpFX2oxBUxd7FztoVVAORN9RA8l+QPlwEeWSIu1c/c+AuEx+nY1D5I
	CZgehYvF36e2EEAg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Brian Norris <computersforpeace@gmail.com>,
	linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev, devicetree@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v9 05/18] mtd: rawnand: sunxi: drain interrupts before
 reusing the completion
Message-ID: <20261019065013.QUQYpnz-@linutronix.de>
References: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
 <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-5-b624c09e3ee5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-5-b624c09e3ee5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_235020_102099_860AB445 
X-CRM114-Status: UNSURE (   8.33  )
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

On 2026-10-17 13:46:00 [-0600], James Hilliard wrote:
> 
> This keeps additional synchronization on the timeout path, without a
> driver lock in every interrupt and wait. The caller can sleep, this IRQ
> is not registered as shared, and the handler does not acquire the
> controller mutex held by the caller. The tradeoff is unbounded cleanup
> latency and no priority inheritance: a starved IRQ thread can prevent
> timeout cleanup from returning and block other operations on the
> controller. This is a handler-lifetime boundary, not an RT
> recovery-latency guarantee.
> 
> Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/r/20260909085434.C8F201F00A3A@smtp.kernel.org
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Sebastian

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
