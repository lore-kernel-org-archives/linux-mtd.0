Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D81CC00A94
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Apr 2024 10:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aw6NZBbdmITT1cjms0ENcnDIiWu9l3TH/Y0v1Z9NXkU=; b=BMMWjpkk7D+wzT
	u/Z3HEAVS8gDDe/GSLyGHQP+oXg1M6eClJ1OBrx/c7O2kqlTrR0HceIeqEy+8BaLb91i5ICIVCtJq
	Zf4mGY3uVJtt/nXuFg1OQSkSNl3Yp7/nYSYRWOFB6labhx2HjjitHU9ZXaKiZMSxAWdPMTFz7Hqt5
	GxeHT/iaSaCtV82h+qpM7LUyDKts2q41osqNyEBqC/2wIaS0ZxA7OiDIg8GRvIkWy2hhbiA/O5HRP
	7nzx17GEMAgozIGnMpUxTP+6Q/7w0+r5QjgLPAUyRNvPue1lf8aK1ZHOYlnerBdACnhsR5htu04es
	40rpInS7DfG6ctqs+TMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwJEw-00000007oRL-1OlR;
	Mon, 15 Apr 2024 10:07:06 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwJEo-00000007oOT-3k6U
	for linux-mtd@lists.infradead.org;
	Mon, 15 Apr 2024 10:07:05 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C746AE0009;
	Mon, 15 Apr 2024 10:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713175611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g0cicJjCB0pYUGc3CIeWy4etjAY/rbc0DSqQlONwh64=;
	b=cOWr2Axlsxc5zgGlGL5N5xatr95AvVuW6dgEuNyElf/zq5gA7TuOwd8rl0xsEgqymaMxOi
	gGPKbMv71uTSsaB9dgzDp9hlULihjNB3YibaP5mIN8IbAEIWtwXjr/pFtIF0blYf/BNAIE
	eLjRtw3wSa7Hkvvul8FBOb8uA76/GZeOU55JYZ5ZQuDr9sLmN2UCnKqPcAg1mp4W5XlNoe
	w1VGS9cniLFZ0QaUOo9amESU1xMiGovK7C2lK//oHyBFzoONgOPJ1cJZ9UG13Tl1tUQ34o
	0zpCJobQJFwetpfu4lo4ygel0ZQdZGWS9F0hVfDtSlq436Pm7yV6MdZQITRvMQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: Re: [PATCH v5] mtd: limit OTP NVMEM cell parse to non-NAND devices
Date: Mon, 15 Apr 2024 12:06:47 +0200
Message-Id: <20240415100647.32028-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240412105030.1598-1-ansuelsmth@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'd2d73a6dd17365c43e109263841f7c26da55cfb0'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_030659_084582_633597A5 
X-CRM114-Status: GOOD (  16.46  )
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

On Fri, 2024-04-12 at 10:50:26 UTC, Christian Marangi wrote:
> MTD OTP logic is very fragile on parsing NVMEM cell and can be
> problematic with some specific kind of devices.
> 
> The problem was discovered by e87161321a40 ("mtd: rawnand: macronix:
> OTP access for MX30LFxG18AC") where OTP support was added to a NAND
> device. With the case of NAND devices, it does require a node where ECC
> info are declared and all the fixed partitions, and this cause the OTP
> codepath to parse this node as OTP NVMEM cells, making probe fail and
> the NAND device registration fail.
> 
> MTD OTP parsing should have been limited to always using compatible to
> prevent this error by using node with compatible "otp-user" or
> "otp-factory".
> 
> NVMEM across the years had various iteration on how cells could be
> declared in DT, in some old implementation, no_of_node should have been
> enabled but now add_legacy_fixed_of_cells should be used to disable
> NVMEM to parse child node as NVMEM cell.
> 
> To fix this and limit any regression with other MTD that makes use of
> declaring OTP as direct child of the dev node, disable
> add_legacy_fixed_of_cells if we detect the MTD type is Nand.
> 
> With the following logic, the OTP NVMEM entry is correctly created with
> no cells and the MTD Nand is correctly probed and partitions are
> correctly exposed.
> 
> Fixes: 4b361cfa8624 ("mtd: core: add OTP nvmem provider support")
> Cc: <stable@vger.kernel.org> # v6.7+
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
