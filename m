Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19071C197A0
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Nov 2023 10:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CSs3HGiMBeNoF4R/rrCsxKFc25R5ApMCqTgblXZue/4=; b=dJbWpxABYiD3uX
	OHe3nG1meMO+JNg7fAACYrVBYrlQyK+GEmdKtqPZ3+PpTt12YZBS4v+m6Cz8e8VAFWjnWtv4B0YmW
	sqZj5/8EhpiEW1lMpD0U2Nz4G6m7AvmPXiqfzZv0aW9GEIk6QfN1OdUHOQJvKJ/3EzAeNrFJ0JxeV
	yjZQ2sqaGb7kPBxDuMCrv//Pi9CK7QmP7pZqjUb6G4R/1dNQOXVjA2rA2tYdrV/UIif8oEn35udBS
	rU8U2joaXv0DNy8rkfLSA2TKcNQOnkdKOe07NcaUetzRI+fegPdVgbkrvrK0aphdZX9vEX/pP2TxB
	KT9jLM94s3N7FnxVdRrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r51nk-00BoXk-1l;
	Mon, 20 Nov 2023 10:46:48 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r51ng-00BoWD-2s
	for linux-mtd@lists.infradead.org;
	Mon, 20 Nov 2023 10:46:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9CB6924000F;
	Mon, 20 Nov 2023 10:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700477200;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jp8xDlTKHw0X2EagTkm2Mx/zhDz7J44QLcdr/8aP10s=;
	b=o77SBd9D6+b6eM/IFzIavj/aya6sOa5EYCaOvOW+JbMIttzuVGUvhHQ/KRUVwhJjnj4NjP
	d9PyEV5GMe6kBGZnokG0sYTuNtdLBV1qGLoRpDB/ZlMJeW/oOsqNu5a8dO0JCA1dPVSC81
	4PQab6GMNYR4IF6V801Zfo+yJnusV3FUxyKfzRpWf6/ICSCaWa2bI3fKXuW5Q1+mJPUaq4
	UZpm8HteHoVYcFQ1341NHtoqkyQh8eZTRCGrExPZ0Zu0uGCRWU1mg36ehDF7larY64tStj
	Qc1Hm3mMycUhPcrnpnpvDbcnjFpOdAPWRwpYxTshVSR1/TD9hWW+heGlTwKT5Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Ronald Monthero <debug.penguin32@gmail.com>,
	miquel.raynal@bootlin.com,
	andriy.shevchenko@linux.intel.com
Cc: richard@nod.at,
	vigneshr@ti.com,
	heiko@sntech.de,
	martin.blumenstingl@googlemail.com,
	paul@crapouillou.net,
	robh@kernel.org,
	u.kleine-koenig@pengutronix.de,
	AVKrasnov@sberdevices.ru,
	r.czerwinski@pengutronix.de,
	jaimeliao.tw@gmail.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Roger Quadros <rogerq@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Poonam Aggrwal <poonam.aggrwal@freescale.com>,
	Dipen Dudhat <Dipen.Dudhat@freescale.com>,
	Kumar Gala <galak@kernel.crashing.org>,
	Li Yang <leoyang.li@nxp.com>,
	Liu Shuo <b35362@freescale.com>
Subject: Re: [PATCH v4] mtd: rawnand: Increment IFC_TIMEOUT_MSECS for nand controller response
Date: Mon, 20 Nov 2023 11:46:37 +0100
Message-Id: <20231120104637.3524982-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231118083156.776887-1-debug.penguin32@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'923fb6238cb3ac529aa2bf13b3b1e53762186a8b'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_024645_076226_AC6D6780 
X-CRM114-Status: UNSURE (   7.62  )
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

On Sat, 2023-11-18 at 08:31:51 UTC, Ronald Monthero wrote:
> Under heavy load it is likely that the controller is done
> with its own task but the thread unlocking the wait is not
> scheduled in time. Increasing IFC_TIMEOUT_MSECS allows the
> controller to respond within allowable timeslice of 1 sec.
> 
> fsl,ifc-nand 7e800000.nand: Controller is not responding
> 
> [<804b2047>] (nand_get_device) from [<804b5335>] (nand_write_oob+0x1b/0x4a)
> [<804b5335>] (nand_write_oob) from [<804a3585>] (mtd_write+0x41/0x5c)
> [<804a3585>] (mtd_write) from [<804c1d47>] (ubi_io_write+0x17f/0x22c)
> [<804c1d47>] (ubi_io_write) from [<804c047b>] (ubi_eba_write_leb+0x5b/0x1d0)
> 
> Fixes: 82771882d960 ("NAND Machine support for Integrated Flash Controller")
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Ronald Monthero <debug.penguin32@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
