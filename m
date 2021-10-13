Return-Path: <SRS0=kZCR=PB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 981D8C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Oct 2021 05:03:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A46A60E96
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Oct 2021 05:03:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3A46A60E96
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4TuuP03/DRrnNB52EGuWBUVBhUpP2NRuc38LFm3p2jY=; b=AxRwbud1j32GrB
	pC2Njdi4PiQK/sNQE5950bA+gWsaMcTJBieuK94SgFWcNIvAj6qLJRR8a8UCtgxtiGn29P/3QkREb
	BdYrvgF1MOqruQMd1X/smuMihzA0YAMi5kNoTjSq0YnBIn5G3nsLMF0ZvfASI5aKX4OnQo45+DmOG
	V1RshI4oEIckqaookp+b15P+FX+uX1PcI/aMEvVPTzvgt1j2JnMAKo6MfyobiwyMs4/DtZBN9x+Av
	4qzp45vi81KCQAfMQmvOyATUfS/b9tFg+cEdGKCxqYkuZ2yvLjPn4J51K3mP/BFmM0c0NolYHzluE
	kL5kuwdn82iJpnbZ3YAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maWP8-00ErVG-7H; Wed, 13 Oct 2021 05:02:14 +0000
Received: from mail-eopbgr60087.outbound.protection.outlook.com ([40.107.6.87]
 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maWP2-00ErUD-CX
 for linux-mtd@lists.infradead.org; Wed, 13 Oct 2021 05:02:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S3jPoJhVuapbEQ87ofdw3/rhLnDLwlqSMnJA+3lo4HKH14KoIje6DMH8XhMvhVdfTvaiQ7WONcWGCurtYMLytaJSn5GrlDnLHYnGM/k1k40Dqy/5w9zmrmhmdrigBbWnTBgCbG5T/Kx8ZBbtm//gLISndpxSfC9h3xTHpo85QD9jVJCNEu4EwLocRBmXEivWLBNq1r33uX42HvWxBuCmJ73L3FJSsHAsH963Juf/nIbm40ZjCeFa7xT1N6yPmM7jwyos604UKcR5g31o2BcepkYh5fbceyr9d21Gt1B9Hf/ZhZG3UulGSSXn8RdYdpcmJmuagBKNLnz3pjlNOyIRUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EirIsY2COsNQBp6YiWqLYaaNFe49XZbDVKMy7BMdmro=;
 b=g5O2uAoQYs94hqZ7j09B5Ac2jBqCiqOBWpTkTQ6Me6Q9Uw4it+gKmJx+YRfj8rHenGsNSWhkL3EJd9SZYLWaEY2dwVWflQRu8TzjFDb/bhppg2/n8M3ifYiY+SkbUXOiT1uJ7nqn6rO/Ua10W6ZUpedheoespplzBeJDMO8jYqw5Frw2YiU2tXtz/80WagEYuW5br4ctWt6JGjzfT74JPdeJ/kRLqTq0GL0clBwFQn3f4Tf8wIvuzOMznBecDrYHHZeKu77X1GOdDDbY/WLj3lDD/lUPwTyBXMYPHnkrG+bkvYB6/Lc4JQ9AeFweAd8RBfY+n8cvocvRn7OOLZLzTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EirIsY2COsNQBp6YiWqLYaaNFe49XZbDVKMy7BMdmro=;
 b=kR2/CzLS4ACLYZqZLaALcnlYCpmveDw+C2NK7P/rT1BNPA/vKLM7G4wnf30J6CYgw4rrzBV8k89IXdtO2WJo54jDJpVT5ljGcYh1Pj7uUQV5Ep7jdYijszmQjmfZzFrko8KTzETKyQDIs0kATKBzGS/r+h3Bxi7UWRFUUFynywU=
Authentication-Results: phytec.de; dkim=none (message not signed)
 header.d=none;phytec.de; dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com (2603:10a6:10:2e1::21)
 by DU2PR04MB8885.eurprd04.prod.outlook.com (2603:10a6:10:2e0::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Wed, 13 Oct
 2021 05:01:58 +0000
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::f96e:198:8fae:c59]) by DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::f96e:198:8fae:c59%9]) with mapi id 15.20.4587.026; Wed, 13 Oct 2021
 05:01:58 +0000
Date: Wed, 13 Oct 2021 00:01:48 -0500
From: Han Xu <han.xu@nxp.com>
To: Stefan Riedmueller <s.riedmueller@phytec.de>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Christian Eggers <ceggers@arri.de>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Greg Ungerer <gerg@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Christian Hemp <C.Hemp@phytec.de>, Boris Brezillon <bbrezillon@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [RFC PATCH 2/2] gpmi-nand: Add ERR007117 protection for
 nfc_apply_timings
Message-ID: <20211013050148.2w373kpbfaeuxbwm@umbrella>
References: <20211011084607.27a840e0@xps13>
 <20211012090224.4101984-1-s.riedmueller@phytec.de>
 <20211012090224.4101984-2-s.riedmueller@phytec.de>
Content-Disposition: inline
In-Reply-To: <20211012090224.4101984-2-s.riedmueller@phytec.de>
User-Agent: NeoMutt/20171215
X-ClientProxiedBy: SN7PR04CA0163.namprd04.prod.outlook.com
 (2603:10b6:806:125::18) To DU2PR04MB8774.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::21)
MIME-Version: 1.0
Received: from localhost (70.112.23.252) by
 SN7PR04CA0163.namprd04.prod.outlook.com (2603:10b6:806:125::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Wed, 13 Oct 2021 05:01:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf97b56e-8f2b-40b2-af9c-08d98e0695ca
X-MS-TrafficTypeDiagnostic: DU2PR04MB8885:
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-Microsoft-Antispam-PRVS: <DU2PR04MB888507C46C5C96CAB994D5AB97B79@DU2PR04MB8885.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QSFM8Tl/5bFhymzez8suPZ79PWm7UepUD81T6uNFjVkNgJyJVugCr9vtPCS92tGtDN0GBuQPDPr93rAnqN9vq0Od9mftNX99Ix9kcbV8c0EwiwLwzUyZiafRuB8gCcwVdal3Eii5o0RrWiZUZ3jGciq1lrnjFdiENNGdsgUoDYugGD7Z1AvGi3NAtK2Nks8BOQL59p1tnpf61fh77/aJRHWPiY9eYKpBDG3G2R/zlwt9yg47PB5Q1m5U1edUDp4VnM+gP+AP3cgkikpKpJuY+lNMRTSKnI90uC1aeLcIkmU6ttv9oZlz6MKUNR7wz1HqgzauZzFqoLefA9QMKgm20Jc35HvwoJDuujlsCWBV+sX4c2Cxyk99KxUPXG8OHVRE/4vtmaQ3WvSY5oAcmVjfwAjANFThCFcZlElt1NjJXEA+WFjuto6mnNnnDLPEICiYDDkCEedGA06Nw/5Tdy3m5aNlbXn0qMalAKk0xdf3EbQlyitwBCojQ8X0DJ2jqyZMCjQruMfqvuD1TjmLvAoFpdUdg7NAh+7HCuLlhyDJ8zyb7VjWYy4gH2dT+VaCkiWQ0juSQB0+AZN/TOMBVoutb7ICSGIgZgSVpO3cGPWc5plUhKAkFYqY/TS4wYZtG7+fjY6oGqYW+eddkarVoKKIlEVHSLMALaH0GWLallu1HD8fRbQQMpdRwPB5J1KbTVARPJU+or3cDDfB7q2Ro154GA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB8774.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(4636009)(366004)(1076003)(5660300002)(6916009)(6486002)(52116002)(956004)(6666004)(6496006)(26005)(33716001)(186003)(38350700002)(38100700002)(66946007)(8676002)(8936002)(66556008)(66476007)(83380400001)(508600001)(2906002)(316002)(4326008)(86362001)(9686003)(54906003)(44832011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4+2WnTWkmvly8dIpjl8y1DpN99e0V/m6n0y8BXQQRCmdV7AvZlkitt/JRm/M?=
 =?us-ascii?Q?+y5Li6CA2Qkf261quV0k6bL/uw/HSEgL6zVAO3VAUqQVCsf4XX6/bRvICOsp?=
 =?us-ascii?Q?r0Ep1D20wKuhrEezRQAe3Kn2WXZWlb+cQuGNpoBLynwp20Ar6nbTlvVrmfUt?=
 =?us-ascii?Q?fYnTfP/QaxJVvwWf2O2OosMkzZGHkVpz1w6HvPHHViDyxDi2ZJl3hzWT5AFo?=
 =?us-ascii?Q?9kMfPBcolB+QLHQ6FrkBvBbbuCqM2PjOV5U0pn5/ieIwN0v/gxjvLa9Uj5eA?=
 =?us-ascii?Q?gfzsmKGxTs88PEgcYGa+6cGarOe5w62Ox1ZG7pHCknPFkb2WFZgoLbajkzkq?=
 =?us-ascii?Q?Kfdt1G3a5V3/mBJxNkMQSNpu1jnYEM7CmVAmz8h8Iy3FzlKqpiAXXNmsj0Kn?=
 =?us-ascii?Q?BXxWa7bUqvVCDvwRqfBajkzkI/rC+kIaRAwwDSP0ya7irdJCVSeQGlROs4dQ?=
 =?us-ascii?Q?4FFMaXy5dODahcc26zmPVvex5mGBe6Ji6GPhSwgt8u7iUtFk94QQ2yjBUWXC?=
 =?us-ascii?Q?Pu1rqdVsdaLNGfxtwrfcS/eee21ORefuKW2bKH9K3WkyfLkRDKyATEe6si0L?=
 =?us-ascii?Q?STHH2jdiPdmxVdk03DPpB4IOTOKTbphK2QOipUWuGOBO4gEgdZ1rxAsHOi7y?=
 =?us-ascii?Q?8NDqXE+8RLCTEjZU0lpusy1jqd1VR7/skAZZGS7/rgaQcS9LtcsXQBYvufhK?=
 =?us-ascii?Q?ojEqXpxnqIaPDZ0NE5/Pn89oqGu0QxUEpeWayjf0W/Lgk1JYIpVbdWJ0wYxg?=
 =?us-ascii?Q?VXMbhensz6saa9nmHPYjj2TNo/9GCBvo7zV0iUztA9yAPNtwClc7KyJO+yvI?=
 =?us-ascii?Q?yP39ULVyeiwF3Cy3TNsSPklQ1Voj/R+bX0xJNH9V40RWVkvOO8Afvzxdnlp8?=
 =?us-ascii?Q?vWYvkRlFGdqJkC3ciXhTe1mesEfRj0y1nxjc59h/sxlRR5bHU+wIOsqtvmYE?=
 =?us-ascii?Q?ao/XWMOdmhNjsr7THv3dwXdfS6RUtCE2wrSfwc3Js87+3TlQU3ziEeNjTOkf?=
 =?us-ascii?Q?6Uk2GptxJRYUcYwDy3kDDp4YTeVO8DGEj7c7JE3j/ISZcQIAFmFZkem4B5kW?=
 =?us-ascii?Q?RviLgOEhuF9V1mn0Y8vjawng2+0mK9GEqyZK3hSMhlzrXsbrq8IYYfXy/UQC?=
 =?us-ascii?Q?5pQXoNAWF2KVUIhm9QezYoAbbfUrpoIepqBjGW+pLidl7YSw7IVz8eN8Uxqd?=
 =?us-ascii?Q?buGhohjZUVHqb34KCxOkcc2vxdJ2p+ww6tC/AYky1n4f5Gp02JJDmI2RG2vw?=
 =?us-ascii?Q?t63nwQy7/JiTv0FkVBV7pUlfn4GCadew6VO98uV5l3RXhiprC3/J+aIpM2y8?=
 =?us-ascii?Q?XFPC9VAIPvkizd1cr6Tv5skA?=
X-MS-Exchange-Transport-Forked: True
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf97b56e-8f2b-40b2-af9c-08d98e0695ca
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8774.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 05:01:58.5205 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U69vGCDB7zljrxaUx4bym+27pnJxosga50xJMhRWbUq+xv13coBl/0MAb1iJoIm6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8885
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_220208_561524_05D8514D 
X-CRM114-Status: GOOD (  26.96  )
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

On 21/10/12 11:02AM, Stefan Riedmueller wrote:
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
> 
> I'm not sure about the error handling here, if it is actually neccessary.
> So some feedback would be nice here.
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

Not only for 6Q but for GPMI_IS_MX6

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
> -- 
> 2.25.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
