Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB369D2FFE1
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Oct 2024 09:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vMzFonjTFJqpm19m8gekhn/guvPQOO1NcAkehAtWXVg=; b=ZHLHVR+fSre2JC
	uD+vFyCIoOm+ToH5f1dMEOyi+K+jj9ercm3HbVZQ6N+5rQGRwFHqOeqHmIEo8Gszr2hy2KWux4Pn/
	XF+TV2Eq+vnjnpyDbS4t6pB4wfXb8chVPPqfFRFSPLRtr5jkgp9Gg4GBe2ONXVf2eY5tQBM5gqhhg
	XC7LVcONC90p7fNP16Qy7N+teV6g7r7AVfNnLRfuXBdLAbNCIkPrasP5/ds9pLFVIZZ7znik1Q2p9
	0QKdo0YQ4MzwPWoVPwkf+4jLWyZHDoEG4L0u+vDHxtzcevXpXPlr6X7DpNC15B6ugGVcALVj2QWjZ
	Rou0q7BmxUGm78fSHaBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1jVn-00000000E7i-42Iz;
	Fri, 18 Oct 2024 09:43:11 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1jTz-00000000DjU-3TnP
	for linux-mtd@lists.infradead.org;
	Fri, 18 Oct 2024 09:41:21 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1t1jTS-0006BO-Et; Fri, 18 Oct 2024 11:40:46 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1t1jTP-000Bil-2D;
	Fri, 18 Oct 2024 11:40:43 +0200
Received: from sha by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1t1jTP-000Qi1-1r;
	Fri, 18 Oct 2024 11:40:43 +0200
Date: Fri, 18 Oct 2024 11:40:43 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Hui-Ping Chen <hpchen0nvt@gmail.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	nikita.shubin@maquefel.me, arnd@arndb.de, vkoul@kernel.org,
	esben@geanix.com, linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/2] mtd: rawnand: nuvoton: add new driver for the
 Nuvoton MA35 SoC
Message-ID: <ZxItGw0m_w0jgtAq@pengutronix.de>
References: <20241018022519.721914-1-hpchen0nvt@gmail.com>
 <20241018022519.721914-3-hpchen0nvt@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241018022519.721914-3-hpchen0nvt@gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_024119_876801_FA14B4A0 
X-CRM114-Status: GOOD (  20.98  )
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

On Fri, Oct 18, 2024 at 02:25:19AM +0000, Hui-Ping Chen wrote:
> +static int ma35_nfi_ecc_check(struct nand_chip *chip, u8 *addr)
> +{
> +	struct ma35_nand_info *nand = nand_get_controller_data(chip);
> +	struct mtd_info *mtd = nand_to_mtd(chip);
> +	int i, j, nchunks = 0;
> +	int report_err = 0;
> +	int err_cnt = 0;
> +	u32 status;
> +
> +	nchunks = mtd->writesize / chip->ecc.steps;
> +	if (nchunks < 4)
> +		nchunks = 1;
> +	else
> +		nchunks /= 4;
> +
> +	for (j = 0; j < nchunks; j++) {
> +		status = readl(nand->regs + MA35_NFI_REG_NANDECCES0 + j * 4);
> +		if (!status)
> +			continue;
> +
> +		for (i = 0; i < 4; i++) {
> +			if ((status & ECC_STATUS_MASK) == 0x01) {
> +				/* Correctable error */
> +				err_cnt = (status >> 2) & ECC_ERR_CNT_MASK;
> +				ma35_nfi_correct(chip, j * 4 + i, err_cnt, addr);
> +				report_err += err_cnt;

This is still wrong. This should be

				report_err = max(report_err, err_cnt);

You have to search for the subpage that has the most bitflips and return
the number of bitflips on that subpage, *not* the total amount of errors
on the whole page.

That said, the statistic counter should still count the total number of
bitflips occurred.

Sascha

> +			} else {
> +				/* Uncorrectable error */
> +				dev_warn(nand->dev, "uncorrectable error! 0x%4x\n", status);
> +				return -EBADMSG;
> +			}
> +			status >>= 8;
> +		}
> +	}
> +	return report_err;
> +}
> +

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
