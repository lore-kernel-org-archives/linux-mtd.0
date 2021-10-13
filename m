Return-Path: <SRS0=kZCR=PB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05DEAC433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Oct 2021 07:36:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C55B360E74
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Oct 2021 07:36:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C55B360E74
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arri.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ybO+trQ+jFhgzQ8OyvbYvibDMfOdGYiHEIWRvSHnsqU=; b=dVG6jUKgRCu94j
	rmQKMumou4hJQ9byqLxsFlK2vOEkvQN98uex9YdbJkdvLiBtEkqPmUtNLtK5D0ud9eH2qVH4iPKuN
	L4bXyyCzGkpiCuz0M1RX6ExEGlIWur4sFs6fFnvC2rsSb+Nas1Gq5EzXWCBat6QqG7rpabXpvngtO
	KXKjT1lmPFy0Hgjm+oK0HavscUxYEjnuO1UWOVH47DZd0aUx/UHFVjfOUTo19T2b/4KUoXY5pmTEJ
	BHArlb0z0wRjj41vVPzIKfNQCYNZevslTxK9Gfxl8216LabStzVror2Ngrq0h82hW6NfmwypR71tb
	OfcOFzhXdnPxovAxGHlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maYnd-00FOW2-Tm; Wed, 13 Oct 2021 07:35:42 +0000
Received: from mailout03.rmx.de ([94.199.88.101])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maXTB-00F60Y-Oh
 for linux-mtd@lists.infradead.org; Wed, 13 Oct 2021 06:10:31 +0000
Received: from kdin02.retarus.com (kdin02.dmz1.retloc [172.19.17.49])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mailout03.rmx.de (Postfix) with ESMTPS id 4HThwL3T2lzlkYP;
 Wed, 13 Oct 2021 08:10:26 +0200 (CEST)
Received: from mta.arri.de (unknown [217.111.95.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by kdin02.retarus.com (Postfix) with ESMTPS id 4HThw4056Gz2TRlF;
 Wed, 13 Oct 2021 08:10:12 +0200 (CEST)
Received: from n95hx1g2.localnet (192.168.54.63) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.498.0; Wed, 13 Oct
 2021 08:10:11 +0200
From: Christian Eggers <ceggers@arri.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Michael Nazzareno Trimarchi
 <michael@amarulasolutions.com>, Greg Ungerer <gerg@kernel.org>, Stefan
 Riedmueller <s.riedmueller@phytec.de>
CC: Stefan Riedmueller <s.riedmueller@phytec.de>, Sascha Hauer
 <s.hauer@pengutronix.de>, Han Xu <han.xu@nxp.com>, Christian Hemp
 <C.Hemp@phytec.de>, Boris Brezillon <bbrezillon@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [RFC PATCH 2/2] gpmi-nand: Add ERR007117 protection for
 nfc_apply_timings
Date: Wed, 13 Oct 2021 08:10:10 +0200
Message-ID: <2799559.e9J7NaK4W3@n95hx1g2>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
In-Reply-To: <20211012090224.4101984-2-s.riedmueller@phytec.de>
References: <20211011084607.27a840e0@xps13>
 <20211012090224.4101984-1-s.riedmueller@phytec.de>
 <20211012090224.4101984-2-s.riedmueller@phytec.de>
MIME-Version: 1.0
X-Originating-IP: [192.168.54.63]
X-RMX-ID: 20211013-081012-YVMJMpRStmCJ-0@out02.hq
X-RMX-SOURCE: 217.111.95.66
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_231030_070443_197B759C 
X-CRM114-Status: GOOD (  29.12  )
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

On Tuesday, 12 October 2021, 11:02:24 CEST, Stefan Riedmueller wrote:
> According to i.MX 6 erratum ERR007117 gpmi clocks need to be gated off
> when doing a gpmi_io clk rate change. So gate the clocks off before
> the rate change in nfc_apply_timings and ungate them again after the
> change.
> 
> Otherwise this rate change can lead to an unresponsive GPMI core which
> results in DMA timeouts and failed driver probe:
> 
> [    4.072318] gpmi-nand 112000.gpmi-nand: DMA timeout, last DMA
> ...
> [    4.370355] gpmi-nand 112000.gpmi-nand: Chip: 0, Error -110
> ...
> [    4.375988] gpmi-nand 112000.gpmi-nand: Chip: 0, Error -22
> [    4.381524] gpmi-nand 112000.gpmi-nand: Error in ECC-based read: -22
> [    4.387988] gpmi-nand 112000.gpmi-nand: Chip: 0, Error -22
> [    4.393535] gpmi-nand 112000.gpmi-nand: Chip: 0, Error -22
> ...
> 
> Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
> ---
> Hi,
Hi Stefan,

thanks for providing the patches! I am suffering from this problem for some
time now and I am happy to get this fixed!

> 
> I'm not sure about the error handling here, if it is actually neccessary.
> So some feedback would be nice here.

IMHO errors should always be handled.

> 
> Thanks,
> Stefan
> ---
>  drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> index a1f7000f033e..326c8a895f1f 100644
> --- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> @@ -713,15 +713,28 @@ static void gpmi_nfc_compute_timings(struct gpmi_nand_data *this,
>  			      (use_half_period ? BM_GPMI_CTRL1_HALF_PERIOD : 0);
>  }
>  
> -static void gpmi_nfc_apply_timings(struct gpmi_nand_data *this)
> +static int gpmi_nfc_apply_timings(struct gpmi_nand_data *this)
>  {
>  	struct gpmi_nfc_hardware_timing *hw = &this->hw;
>  	struct resources *r = &this->resources;
>  	void __iomem *gpmi_regs = r->gpmi_regs;
>  	unsigned int dll_wait_time_us;
> +	int ret;
> +
> +	if (GPMI_IS_MX6Q(this)) {
I would like to explicitly see i.MX6UL(L) here (in order to make clear that
not only Solo/Dual/Quad are affected):
#define GPMI_IS_MX6UL(x)		((x)->devdata->type == IS_MX6Q)
...
if (GPMI_IS_MX6Q(this) || GPMI_IS_MX6UL(this)) {

But if Han Xu is sure that also SoloX and i.MX7 are affected, GPMI_IS_MX6(x)
is fine for me. In this case I would like to explicitly mention this in the 
commit message, so that nobody will change this later because ERR007117
exists only for Solo/Dual/Quad.

> +		ret = __gpmi_enable_clk(this, false);
> +		if (ret)
> +			return ret;
> +	}
>  
>  	clk_set_rate(r->clock[0], hw->clk_rate);
>  
> +	if (GPMI_IS_MX6Q(this)) {
> +		ret = __gpmi_enable_clk(this, true);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	writel(hw->timing0, gpmi_regs + HW_GPMI_TIMING0);
>  	writel(hw->timing1, gpmi_regs + HW_GPMI_TIMING1);
>  
> @@ -739,6 +752,8 @@ static void gpmi_nfc_apply_timings(struct gpmi_nand_data *this)
>  
>  	/* Wait for the DLL to settle. */
>  	udelay(dll_wait_time_us);
> +
> +	return 0;
>  }
>  
>  static int gpmi_setup_interface(struct nand_chip *chip, int chipnr,
> @@ -2271,7 +2286,9 @@ static int gpmi_nfc_exec_op(struct nand_chip *chip,
>  	 */
>  	if (this->hw.must_apply_timings) {
>  		this->hw.must_apply_timings = false;
> -		gpmi_nfc_apply_timings(this);
> +		ret = gpmi_nfc_apply_timings(this);
> +		if (ret)
> +			return ret;
>  	}
>  
>  	dev_dbg(this->dev, "%s: %d instructions\n", __func__, op->ninstrs);
> 

Tested-by: Christian Eggers <ceggers@arri.de>  # on i.MX6ULL with MT29F4G08ABADAH4
Cc: stable@vger.kernel.org




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
