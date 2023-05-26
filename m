Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3B4EC77B7A
	for <linux-mtd@archiver.kernel.org>; Fri, 26 May 2023 18:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DY3gk1XIgOlb3eM81jEUjZ9fx1iBKto2OmoGgxjQPb4=; b=ThuUndDclwxBzD
	CQnh3V77C5BY7iliYESn8OYwXgN5XcRKuxe7dcPfARgWkBjqGgCVQcsGkQuO113OPC3U1LSmzDJov
	7z6K15xLKRTjozwkP7v79Ck15exqhY4o3LRWgyJqPROKUXibUwe0pIXhmb7pyAx91BQMGbU0npjfj
	WJDdFiBS2TCGHJgV6f7F34XQAUQrWv1aqUWlmNzQ2sVlDyAHDSe8DtynYvRjkc/lIxhnKupRaO91p
	Zw+aMp5Da1Q+v/n4gn7A9FrFxEeDEWjP+hNrjUJGxnX7jh5bp0hvVCG/Xagmr8YXTj9fZCLBLfB/W
	H7inH1T4THPLL/0gBehA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2blm-003Oxm-11;
	Fri, 26 May 2023 18:02:30 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2blg-003Ov3-2X
	for linux-mtd@lists.infradead.org;
	Fri, 26 May 2023 18:02:26 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685124141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JOmTTnUJ0QiDzTvM35S+su84JQ1WbaoWgG487kovL04=;
	b=UHAE0Fl+cmDWIlGMUpGuIDafwMBLn0sGS3msBfhyI5iw+NYSBtc46e/muYjNbJMevX3+Lw
	5zqbvPnRLvZuV6v5ObdpeZqrVzMgprEJImXXzN5dU8Ndk77tsnpAezJi3e1RnA4IQ/TBtV
	TSCZCntpscGbvBetLbCFwjDLAQXTGnRBSJKnh22pxtqeM2FyrU3ftVMylF9gI60Hw+YuBt
	pJcIfJI6M4xylW2xmG4IW6wDS/+SqyjNoK/VjQwPQj3hlFZOp2TLxWBqYPMk6kczEcR/dI
	hmw/v0kB726TFsF20FasCp5HmH7JHNUzI0m/OJlnS7UzbglsDRhJGCaXc0OxIw==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E931C1C0006;
	Fri, 26 May 2023 18:02:20 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	bbrezillon@kernel.org
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] mtd: rawnand: marvell: ensure timing values are written
Date: Fri, 26 May 2023 20:02:20 +0200
Message-Id: <20230526180220.924379-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230525003154.2303012-1-chris.packham@alliedtelesis.co.nz>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'ce8a0b2602b221d564fee38847d15c1dbe05d382'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_110224_979359_F787639B 
X-CRM114-Status: UNSURE (   6.19  )
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

On Thu, 2023-05-25 at 00:31:52 UTC, Chris Packham wrote:
> When new timing values are calculated in marvell_nfc_setup_interface()
> ensure that they will be applied in marvell_nfc_select_target() by
> clearing the selected_chip pointer.
> 
> Fixes: b25251414f6e ("mtd: rawnand: marvell: Stop implementing ->select_chip()")
> Suggested-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
