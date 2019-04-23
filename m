Return-Path: <SRS0=5gbO=SZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD844C10F14
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Apr 2019 12:45:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B671206A3
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Apr 2019 12:45:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N4bBZyUp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intenta.de header.i=@intenta.de header.b="H/DWDGIF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B671206A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intenta.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r7SRjzVVZ4GAd6+NjXLw+Ln69WljLU9Ak3gF8fIw/wg=; b=N4bBZyUpxlvJIp
	AxpO58zrknRCFQvF8paHErNr0RlfwIOSMVJI89v2L8Oh6AdAL/BcRrEJa96kxXLK8FNVtQF59e+fL
	QqrG89TXKfLjAbtEn3G0Jw5kuEq2j+1uulLZNjWDgt3WtZ60k8bT7XYUyzxqfVw7JQ644B9+sPHvD
	RP1B1KfyWtV8yXCYsvSRAkzU57yMaVxSz/g+BpFpy02GimMQVm+grr/QYLekQU6cbhygvywNVuLuS
	jENdBpydpYJVf+to6tNJS1k4Mfs3eeagOyvObV52aIqhl/VY/4ic+qo64A6s5BA6mpbElf1iL4qtJ
	NmuKqaf5JY9VsW1MDgTg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hIuo3-0003dS-69; Tue, 23 Apr 2019 12:45:51 +0000
Received: from mail.intenta.de ([178.249.25.132])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hIuny-0003co-Mh
 for linux-mtd@lists.infradead.org; Tue, 23 Apr 2019 12:45:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=intenta.de;
 s=dkim1; 
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:CC:To:From:Date;
 bh=dmGN8x9EEcfKPEOD8dWs64ViH0Y1wnNH0XCNWju842c=; 
 b=H/DWDGIFbxgYzNB8uPjtE00wvSIZ4WUF8DgHHfAWTfEBBb3btOAonlu3bqq7TH5qiM8clJOJwmPfDVazzqyxjOZmEwiA1yU3w8A4wzICCOXJVTFgl9aA3kj0A6edYabTSsdjhbhUWcUj+mlHZbSNxbBuG4POthHRt2Rz7UApApSr0V6k6JZMeeXToMfKLOC39/jVbAl52ijbTLYZA6sW/0BXwMmG41s8+ovemwU5g7TQ+OeP/D0XF68wLGSZx63PbEn3q9kjR9ZpzbkZuj7ZCqiipjYuWHf6ClQ8JHYeJW3q7DWVp8sutXefOx/i7RL46KDxd+rnkGv8cMTFx9gQyQ==;
X-CTCH-RefID: str=0001.0A0C020B.5CBF08E8.0043, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Date: Tue, 23 Apr 2019 14:45:27 +0200
From: Helmut Grohne <helmut.grohne@intenta.de>
To: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
Subject: Re: [LINUX PATCH v14] mtd: rawnand: pl353: Add basic driver for arm
 pl353 smc nand interface
Message-ID: <20190423124525.axaprwy4qofbqfhj@laureti-dev>
References: <1555326613-26739-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1555326613-26739-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-ClientProxiedBy: ICSMA002.intenta.de (10.10.16.48) To ICSMA002.intenta.de
 (10.10.16.48)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190423_054547_417031_C484BBF0 
X-CRM114-Status: GOOD (  11.84  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: bbrezillon@kernel.org, richard@nod.at, linux-kernel@vger.kernel.org,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, nagasureshkumarrelli@gmail.com, michals@xilinx.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

WARNING: This driver might brick the hardware. See below.

Hi Naga,

On Mon, Apr 15, 2019 at 04:40:13PM +0530, Naga Sureshkumar Relli wrote:
> Changes in v14:
>  - Removed legacy hooks as per Miquel comments

Thank you for the update.

> +static inline int pl353_wait_for_dev_ready(struct nand_chip *chip)
> +{
> +	unsigned long timeout = jiffies + PL353_NAND_DEV_BUSY_TIMEOUT;
> +
> +	do {
> +		if (pl353_smc_get_nand_int_status_raw()) {
> +			pl353_smc_clr_nand_int();
> +			break;

A closing brace is missing here. This causes a compilation failure.

> +
> +		cpu_relax();

You previously used cond_resched (via nand_wait_ready) here. Why did you
change it to cpu_relax()?

> +	} while (!time_after_eq(jiffies, timeout));
> +
> +	if (time_after_eq(jiffies, timeout)) {
> +		pr_err("%s timed out\n", __func__);
> +		return -ETIMEDOUT;
> +	}
> +
> +	return 0;
> +}


> +static int pl353_nand_read_page_hwecc(struct nand_chip *chip,
> +				      u8 *buf, int oob_required, int page)
> +{
> +	int i, stat, eccsize = chip->ecc.size;
> +	int eccbytes = chip->ecc.bytes;
> +	int eccsteps = chip->ecc.steps;
> +	u8 *p = buf;
> +	u8 *ecc_calc = chip->ecc.calc_buf;
> +	u8 *ecc = chip->ecc.code_buf;
> +	unsigned int max_bitflips = 0;
> +	u8 *oob_ptr;
> +	u32 ret;
> +	unsigned long data_phase_addr;
> +	unsigned long nand_offset = (unsigned long __force)xnfc->regs;

The variable xnfc is undeclared here. Consider swapping the line with
the next one.

> +	struct pl353_nand_controller *xnfc = to_pl353_nand(chip);
> +	struct mtd_info *mtd = nand_to_mtd(chip);

After loading the driver, the device does not work. The dmesg output is:

nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xda
nand: Micron MT29F2G08ABAEAWP
nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
Bad block table not found for chip 0
Bad block table not found for chip 0
Scanning device for bad blocks
nand_bbt: error while writing BBT block -524
nand_bbt: error while writing BBT block -524
nand_bbt: error while writing BBT block -524
nand_bbt: error while writing BBT block -524
No space left to write bad block table
nand_bbt: error while writing bad block table -28
pl353-nand e1000000.flash: could not scan the nand chip
pl353-nand: probe of e1000000.flash failed with error -28

After trying the driver, the flash chip was bricked. Neither the old
driver nor the uboot-xlnx driver nor the Xilinx fsbl are able to talk to
the chip afterwards. This behaviour persists even after a full power
cycle. I'll try reinitializing the flash chip next. I've only seen this
behaviour once, so there is a slight chance that the cause is something
else.

Helmut

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
