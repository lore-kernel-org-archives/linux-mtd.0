Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A019C46467
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Jan 2023 11:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lenQ3ROZTDlg9CfjVarFX0X6387Ct/nt+1pnWnMCKn0=; b=tb6TS103YTbWdu
	8Pfdqhd7tMtq/u8RjuvRYSpVEKNvfikA17w9dHRAnn0rVRtGXkY8eJsNRtZUrMjcWlA2vnAhumbuu
	+WD+bJiS0NVdyYETGwsMAk2iDB8E3jWm13l063oVbiC2DTxMGD8FutA8CoAWGr8KVthKiZgTaVBOr
	olvw8MU/Hm9EQTeIYGE+QlvXN+3n5sYWMxQz5BSlbNQa7A0P2WKSAA3ko8PkBATz1/xhsFovICSHv
	751641u/Q9rRXN+/+d5kfoCLPQNUVRsw1QPD2OHTVqjyIqttU6XVAq2Vd8pZ+/bEO2HsY0wKOOLAT
	Y6pL6s1Hj+CE8d71uorg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCIts-00Akv9-9S; Mon, 02 Jan 2023 11:22:40 +0000
Received: from relay11.mail.gandi.net ([2001:4b98:dc4:8::231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCIrb-00AjUt-Dq; Mon, 02 Jan 2023 11:20:24 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 5E606100008;
	Mon,  2 Jan 2023 11:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672658412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N7TQ4TvrTvrJPMfHspAvP+gisAsh/2xMjTMPVTSfd7U=;
	b=IdbGqCCJh4+VvT6tHQLRj9e/YC+ZXKojvE2Hei/lKu7Wakc7tNGPzaWamWIyp+Ym2WX5yu
	7wWAUS+cnZOf4POflsF6JRcBV0t9jAuBbbf5DR5kXKOrq/GtxFe0wVfvoVmlBVSWi833wk
	A3IAvO+40CR7fpb+qxnC8/YpRNjqKPrahR2wNB2Xnv7BXDDoIAbjkQn53H4GRVt2tT4Rz6
	MU93kYJbD2xd71FBWM81CpCX/x9qn8YG1sAu2fy+IH4nzReNORyvOHcwG9irWhUcEm2hBR
	VeGgNAs5a3IGMyZmtNPl6pvjiJBFOpldZVS0p0RNCy54jcODnhJ/W4C9CbsbKQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Samuel Holland <samuel@sholland.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>,
	Brian Norris <computersforpeace@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 5/7] mtd: rawnand: sunxi: Fix the size of the last OOB region
Date: Mon,  2 Jan 2023 12:20:08 +0100
Message-Id: <20230102112008.250724-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221229181526.53766-6-samuel@sholland.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'34569d869532b54d6e360d224a0254dcdd6a1785'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_032019_770853_409AF3AA 
X-CRM114-Status: UNSURE (   7.60  )
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

On Thu, 2022-12-29 at 18:15:24 UTC, Samuel Holland wrote:
> The previous code assigned to the wrong structure member.
> 
> Fixes: c66811e6d350 ("mtd: nand: sunxi: switch to mtd_ooblayout_ops")
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> Acked-By: Dhruva Gole <d-gole@ti.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
