Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 492BEC0015E
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jul 2023 12:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UmO4u+MX/wlRV34Ogj+SbQ8FSub3flkMHL/z6Y6T2Yo=; b=zIIumYZqMbGlw5
	HnBH3GRB/qLHeHF59hAKeA+l+2xF9XlcNt9xyplDbgWoTDXnSVtGYU3Pimb90XUVTaOL4WovXEUtN
	HDfcJrPrTwpPniSGi83TqWPYYBZ1DevMwekRGTKM4pYucTXX9PruVYb+AHjiuCi3yKuGzQBE2qOyu
	7xAJDv4t4d6EYa50NCmLk75/RRdD8OXiUt2FS0qYkcYd99zNLeyRrZFGMRNCOT1fmGT0EwghSUCx1
	+pJBkALYIyxy1e24SLf0Hb0dDWlAA/sWPimvNbsnBLup7OxDVmc5SUZqTAZKVAAAx9mvpzHoPT7LG
	hFFRxjjiQaNmy3ARmETw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPMfx-003KfS-2R;
	Fri, 28 Jul 2023 12:34:33 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPMfu-003KeY-02;
	Fri, 28 Jul 2023 12:34:31 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 125BD1C0004;
	Fri, 28 Jul 2023 12:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690547664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hOQi55zewL8qDptR460/yfCRJyoOKkayv9fPyXa6DvI=;
	b=E6jAVUvWvvRPAdGB9s2caDim+QvPBAlxu3STNwAvcnZMv3DnSfMZ/ht9/g2bH/T7MqUyiM
	mKkFkOiIhtFI/O+iFLS9/wLVLPqp6NYlcUPRJmU1YQYUhTFqMD/8XPQk/xOI6GRE0stYse
	5Orn0kWGINlJPik8H82GdGbFPm7kjHHJ/NEBtKvTGaoGcDGhYsX91GNrnLngWH00/jt4GM
	OMd7CgJ+8qNFCqT71FQRFNMwZ2Ui58PvF0DBGNdTcYwcTkVy2bIdg6aoC1BPCRwPJ2lu0F
	Bx/zWFnECCtKRWvZvyp1MjWqj47QnipXiAT4vwKBAcZQrZDVqo0YdxmRxoa2Dg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <AVKrasnov@sberdevices.ru>,
	Liang Yang <liang.yang@amlogic.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: oxffffaa@gmail.com,
	kernel@sberdevices.ru,
	kernel test robot <lkp@intel.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] mtd: rawnand: meson: fix build error
Date: Fri, 28 Jul 2023 14:34:18 +0200
Message-Id: <20230728123419.640606-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230728093810.2985324-1-AVKrasnov@sberdevices.ru>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'4622daf4b5c89cd6a689910c523b8185b8a20338'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_053430_204637_C189059F 
X-CRM114-Status: UNSURE (   6.29  )
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

On Fri, 2023-07-28 at 09:38:10 UTC, Arseniy Krasnov wrote:
> Fixes the following build error:
> 
> drivers/mtd/nand/raw/meson_nand.c:244:59: error: initializer element is not a compile-time constant
> static const struct nand_ecc_step_info axg_stepinfo[] = { axg_stepinfo_1024, axg_stepinfo_512 };
>                                                           ^~~~~~~~~~~~~~~~~
> 
> Fixes: 0e1db39336d8 ("mtd: rawnand: meson: support for 512B ECC step size")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202307281007.MMuVjmJ9-lkp@intel.com/
> Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
