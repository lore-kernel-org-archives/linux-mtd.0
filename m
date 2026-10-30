Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B946E606A31D
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2026 14:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ae+OkgdU;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=MoLOTZrj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lEow7l/liTZHYKO8daUxMixYHIy+RiT79ivW8W16ySQ=; b=Ae+OkgdU0wEjOE/xNObCrD25Bf
	I5sEQPC0W/Y0zXkessVPf4CBQfIBWrDk7Mf7ULr9fb1OnOP4HYL3ULqB/I1U8F514B3XkcdFAI79d
	yyfXY/pMePKKv/3mwDjOAfTWxemkNog0B+yFLOqcN70UN+WAfTgsYd6D2wRxCzdu1Gc5An0iYtfMc
	lsx2a9zVwG2Qf+d63bOJMNI9BbnsT3JxizK4cK6b+Y+y2m6Ty9XSj8dVUqsVnvzaO9qjd3dpvAScQ
	eBM8i+IDXgHXkRITepDpXXX4cxod7jdyhNIyF1qerIcluuVHbJwOe3fo9iprgh4GhUBbgqRstFO/9
	dmd/qMVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMo2V-0000000BuJD-20DG;
	Fri, 30 Oct 2026 14:57:07 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMo2Q-0000000BuIL-37Hc
	for linux-mtd@lists.infradead.org;
	Fri, 30 Oct 2026 14:57:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WLO3kIwZIL9BI+lCRr8wHoRQIqwx+uML6zYpMiE4Mj+ZrqFv7feNjfBbt6NTB7zoxV7lR2YuO8nDvrMOkhfyWNNxWpljlXA5HVAvmCT9marKiRxX1asP0HFB/gVgHdoiuokECzcKeuGEXOZ/phDgNol44M5TDnOy6xPLOsu2EDG+e4Acf/lQx8q9jdx/TKnzHtMcSTnPEJjBbDJpmnutUSRr/dKhtABTFJsGQZg7YW2ONP7a4MFlhytrcRjkydWq3V34wXUlHehu4rep+CQ6K4/a4jwCxghT9hAFHDkUGRKChUIMmCTMgSvrX8XN+f0x3Tfjpp26bCXIF63fZVwvFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4GiA4AvP6nLFyzEPwyp6Cif2UUoEWQ4mZJz8ZgDL7Gs=;
 b=WwWZ81Nd243Mg6uiH3uF+GgO0+lLGvHxDcAbE8GqopFnYVjdv80Bj5bxqKIY3R2iwdnBq2d3PPLW0S/OF/nCEj03zybtok10KeFqVLo7U4va7Wo5IzoV/EZnO/arHtQiVhvU5anhYK8t8VHyVpOwBSjxEL9USfuTOZxAwuckLnmzCfJftcpG3Nv9hOBoi7rG+xEA+WSAzYgJ4hP7dpp64QuH68zNVT3tiYymp+D7wxzFiDVEO7tqsDdCtEWqDF7DgCiK2sQGIAdfufGX5Gb8eWzWzblv4WYJTedIxFEMRdM6ZmfEYwOx1EepaH9zQLimMNM72rplxjE0jO2JTsv6Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4GiA4AvP6nLFyzEPwyp6Cif2UUoEWQ4mZJz8ZgDL7Gs=;
 b=MoLOTZrjZMvf37MKoRNlKVUNG21IiX25XWKAkyXs+0DaRkoS3DvWYsu6p83aev6Gg3ZgTeo66epNSaOprt6+J5B/B+PI8lO9COsfUILZzru3gYuhfKbupdN8Sn78TWoZNwLreRoLmaYLujclvfg5ngOh2DHu3vBtffCFgYNgdg/9Q98axhYYlmPuCeOCUI+Nj7k5DmYqzamrucFdKNQyGZpATfjzIhZdapDaMzJZX4h20S4HbXK+irP+koqgHxjq5FaNmadyMxJl1T1iEaMaVzJ6eB75CkM77AjI9aZtA+d5WeiwCawl5shvEKTHZj/tUNInj7wIrPIFeXSgf0Xv1w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 (2603:10a6:20b:75e::21) by VI2PR04MB10224.eurprd04.prod.outlook.com
 (2603:10a6:800:228::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 14:56:55 +0000
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06]) by AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06%3]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 14:56:55 +0000
Date: Fri, 30 Oct 2026 09:56:46 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Samarth Narang <samarth.colleges@gmail.com>
Cc: Han Xu <han.xu@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Richard Weinberger <richard@nod.at>, imx@lists.linux.dev,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: gpmi: terminate the DMA chain on
 completion timeout
Message-ID: <auSwLrB2ewr2j-c2@SMW015318>
References: <20261030143945.2923554-1-samarth.colleges@gmail.com>
Content-Disposition: inline
In-Reply-To: <20261030143945.2923554-1-samarth.colleges@gmail.com>
X-ClientProxiedBy: DS7PR03CA0344.namprd03.prod.outlook.com
 (2603:10b6:8:55::28) To AMBPR04MB12445.eurprd04.prod.outlook.com
 (2603:10a6:20b:75e::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR04MB12445:EE_|VI2PR04MB10224:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dd638c4-d5d6-4f82-241a-08df36960a1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|23010399003|376014|1800799024|366016|6133799003|18002099003|22082099003|10067099003|56012099006|11063799006|261026140227099003|261021121427099003|261028144727099003|261022105027099003|261026121527099003|261022075727099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: Cwb5jiPmAcmxYBNK2Ssv9EH/+tNqjbvUNFEf4w9Uh6NcgoNA5O51SsDaMRc2WaBGA0dddD5FJvfQ+tp67rWnwPm6HFZYP9u95dyOxUFCo9RBiC3R+F6QP3DaZPJJR+TZExPEi01a0AX6F9w6OT0WHoVddCrvpikdBtr6Wji/TqScovry99LKpMbwIDflQkJwIUqCV9wTbvjb7EQ/o3VgJFznia5lsl28EX1srXwhRgmoQ+I0ywTZFmmB45qGJ0h+lNdQlzGxEZH5IUPe63T5Fa2av4DXV6WFiYgaCP24UAcxQVn20Ea/ZxPton6O1TeghSEDLtbtaUHMH6gaNHUayNtXGpHyOZyAs/IcKYx6JRiY31x2cjLIhkfql8y+Us/Koea+M+JouvsWkKE1hzh9PNVk1GPlRfwWLu2wmI7kAqttZHvvRtyd+GJyiIPFjvtaY7GJKgRgA020uTzHrnIyOfPd5RfdQaJm8taUBYWp99sJXMpL8E/eMUz/pLJqLCDsANV2VdHGcBqr4aRyYd+Wp93l2fX9mOTk7udHg5w3QCer9MZJmcg5L72TokAo1Da8/y1E8Ng1frVjnwTCvMnephGs9FZgknB30aGmwwlZhFiNaWi8nUncfqnAUz2JV3GiXs2268cIBLy8sEk03ycwfqye6nX1MD+0iZmp+Co2lww=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR04MB12445.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(376014)(1800799024)(366016)(6133799003)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006)(261026140227099003)(261021121427099003)(261028144727099003)(261022105027099003)(261026121527099003)(261022075727099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HY8PNDbOaIm5DTJTZnR0HgcZrt1j5bChzyttpFVViA9s8We6fUEXyELGyrpn?=
 =?us-ascii?Q?NTdeEi4CV2EwiIRXiZR3X3qVUg7eBXf6IIcGhdiqVAa07uyjgUTgHYAo607m?=
 =?us-ascii?Q?rtaQ+WY5Q7EplC+N7rUFCyaO3OHIm/9EYnRGlg2vPvz7qH3hP0zQ+pPjzoRT?=
 =?us-ascii?Q?fPf+vdXv9174FHhHxDjpaQC0u7vg0FK45LL2XnfSKsRjS6u7opGXN8dRWA+R?=
 =?us-ascii?Q?sbg6d6cnrID/+0pQLaqrW9tmHl0W27Hj4G5YmwXOQ91c08gMEQVBkfqZPEHv?=
 =?us-ascii?Q?4WWxKFelBy0T3NW24szueKMEfn/RRKrvD3eiIac+EmhSuMMzkjlaU0nJ7E8T?=
 =?us-ascii?Q?EfM3U8n+CPb9eQuYlPf0q+3oLAglUTokNa4hfGo0fz8T3oBPH3xJMdign9R3?=
 =?us-ascii?Q?X6JVhBADVe+YWpGnNyy7hbaLvboa1BZxvYPZRRExo7rG0GaFazMc+dtKgkom?=
 =?us-ascii?Q?FOn3gcAq7FVmKTOpC6pC5jA6kGMxBXL/fBl76z17V6hwfCEzirdxqBRbpT56?=
 =?us-ascii?Q?dKEjqV64h179ZX2HaZideqIbFHTOOH3xK/rBUk0X0M/4MICfU0TZfUCto2DQ?=
 =?us-ascii?Q?L5WK4UG1a6u2bM02ptwLDFmTqE2CA/mpIW3vXJnmi3W+64QW2Ed6Y635w8Ni?=
 =?us-ascii?Q?iqPixIoDmtUCBiDwUto/mwlDT30eVtNnGpxvhAWk5VwjbAb+Rcj++9YN8lHw?=
 =?us-ascii?Q?DV3VBM7dSSPfa8pWD7FwU4UkNwgtOoZbvYYsS7JCZHnUPZjLi6mkZa2EEbL0?=
 =?us-ascii?Q?nXVrYJZlSI/HcwGil5b3myKENVg4yj188qo+9PWhR3I76ylkiAITL/WguxYe?=
 =?us-ascii?Q?+4xb5XihwqBvPKk2AOpuRhDIOrGvKyaGUapdFUMdeucnbQluD4fLlNOlLBMI?=
 =?us-ascii?Q?8ubGkTpGNG5Gby7Hz51Rfs9OzC/L/Gy25MvdIgjZx2sti4W5vYhsYT7H+uoI?=
 =?us-ascii?Q?wUIJQMMi90nzLQgJBU9O4aOwXVuB+fAyxH+bx1peTVnSS0KHs/QXNHypvG0E?=
 =?us-ascii?Q?jAnykjuTAQAEFwVVPyYojOopDtWBUQevMfPAZwS7g8egvrCqQXzIB85b+phe?=
 =?us-ascii?Q?BYuyP14kNYy55OqDuZVWhtroy1vFs7kEySiXIObeOjhvPiZ3XBe/aPSCfAhN?=
 =?us-ascii?Q?bkLlUUzm0FEjdC4HEoYZxu8dipSRItvQmXVYMvpRZ/TUWXiMOY1+0P3MK2ol?=
 =?us-ascii?Q?3u4YZOzQ3pGiybCZ354OwFsLcFeKXq/H2CiKXLFDEjPXg/aNZ+Fb2it2AJFE?=
 =?us-ascii?Q?e4c62cWkNd/1mPBV6gXY56pP0yeX7NiWvzAnxkmz5QbKjRvmrsftR21haDnH?=
 =?us-ascii?Q?BoIh4B03D+7QYF/y0VOMhL+kxGtohmWf3+NO5TrXFNgSqKrLauc0rO0926EV?=
 =?us-ascii?Q?MljlT/8eg4bD8dr0rUTuNAuNRUD1i9fWcr001YQZXckwhYdUgiLp1rNs046C?=
 =?us-ascii?Q?iMTGEKUrLyyDxL1RC2y8QQMN1h53Z/IvwYsX+NMmErsnquviJAt6QNyOwZaY?=
 =?us-ascii?Q?rU3Wi269IB3O60yVZNVDK/CMBSW6jZ9ZDbfBBOig07TPiWxjw+Q3c9wbQviP?=
 =?us-ascii?Q?kD+7i+TOV+Obpm0F5JzWqrxzZFHYrR33HMRJT2Dj6r6Uz5dCez5Kk7NrDWse?=
 =?us-ascii?Q?egQ4ZbHV87Ew2w67K8LSU/aESNixOnhi+DS9gFgFzwP4v7wvn2/ZMiEAG6qM?=
 =?us-ascii?Q?OWxhuvEKyu9w7SlUP+qA8NN/PyMT1jeDMm+9Phq4dvgnjeFl/oTE6wFfbhwa?=
 =?us-ascii?Q?OyNdO5U2tHFiJvNSOJILYKGYICv/sR3Bjpe1pAUpZODfvoKYqtfX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dd638c4-d5d6-4f82-241a-08df36960a1a
X-MS-Exchange-CrossTenant-AuthSource: AMBPR04MB12445.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 14:56:55.4181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4+gBRPVJx06nxQQ1H4MDnEGpgfBhYuQCGqu4KtYxeNNOxdlURfVCBquogy3/KegShP7Bw0yzL7YTTF31flJZcwCkSRxbKuO5D3kpKI8acLGV7PgbLOrMT26u3Nq4YeAx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10224
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_075702_788127_9E11B9C1 
X-CRM114-Status: GOOD (  21.08  )
X-Spam-Score: 0.0 (/)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 02:39:45PM +0000, Samarth Narang wrote:
> [You don't often get email from samarth.colleges@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> When DMA completion times out in gpmi_nfc_exec_op(), the driver unmaps
> the operation's buffers and returns -ETIMEDOUT without stopping the APBH
> DMA channel. Since mxs-dma leaves the channel in DMA_IN_PROGRESS, the
> pending descriptor chain may resume after the timeout, while a
> subsequent operation can append new descriptors to the stale chain and
> cause the old DATA_IN transfer to execute again against an unmapped
> buffer.
>
> This can result in DMA writes to memory that has already been released,
> including buffers freed after ONFI parameter page detection in
> nand_onfi_detect().
>
> Terminate the channel with dmaengine_terminate_sync() before unmapping
> so that outstanding transfers are stopped and subsequent operations
> begin with a fresh descriptor chain.
>
> Fixes: ef347c0cfd61 ("mtd: rawnand: gpmi: Implement exec_op")
> Assisted-by: LLM
> Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> This issue was identified by a research static analyzer for DMA
> lifecycle ordering and has not been validated on hardware.
> Compile-tested only.
>
>  drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c |    2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> index 527165ccc..a8106de2c 100644
> --- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> @@ -2659,6 +2659,8 @@ static int gpmi_nfc_exec_op(struct nand_chip *chip,
>         if (!to) {
>                 dev_err(this->dev, "DMA timeout, last DMA\n");
>                 gpmi_dump_info(this);
> +               /* Retire the APBH chain before its buffers are unmapped. */
> +               dmaengine_terminate_sync(get_dma_chan(this));
>                 ret = -ETIMEDOUT;
>                 goto unmap;
>         }
>
> base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
