Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F157DC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Mar 2022 21:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xLA21pg5XdVkaiY/maoqiYLz93GptxvW96T1dCMmrNw=; b=OcWIpoiDmHX7wn
	8gJn0+o2DOxFjihLMUpITns+pXtiAx0jzhcMSUpo9oAlb6DI7Ca8UDIgH2Zd6FI7AvL3gB0OUJsxk
	K6bFeFWSnZdQFqdNOajaK0Qvtt1bpH/zZnqrFw1obPA/tmtBGmM1d5VLVpXanin8t0RTNpEOgw4xs
	BqxUGFjHbRFUFtcvLyo9JLWys81vBUsR5thil+x10BYjcpier8ZU2oWNCPhKd/SBw8r025pJZ89hB
	JXX+bIBcVTO20H1AJUu4ZGVKJopI1Htxo+5BFBxZ7Ods9F1vw3YIuHEcVEPL+yvphxzHoKpocVi3M
	WJqhcAUNJsV1mQhQUvBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nX8LP-00EssI-ES; Wed, 23 Mar 2022 21:16:39 +0000
Received: from mail-db3eur04on060c.outbound.protection.outlook.com
 ([2a01:111:f400:fe0c::60c]
 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nX8LL-00Esro-MW
 for linux-mtd@lists.infradead.org; Wed, 23 Mar 2022 21:16:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gc+cxpdNuWpPC0vKuSOLvFAGYnQL/eW+yz7GDLTc95XHHvjy5teVgYZErOtoX00NlMI0J3g0t9lMFhzM4m4yHSbMpIV1vHTALMY+YuG/MbyLoTFuucaJVrpKQptL5MXxFMwE1oLwQPQhi6h2Ifv+sbeVrH5uln4lC5xn4mHtTJFF8RYbCPjBoNmp1TV9tx/Ww0pkPTPK1c4uTccrAaejZJEpx2QjZ/PUHOEbI+Gpc7jL9bveVFCJcp2GA7iAU4+Q8tsekF7r8j62geiE0puf4V7tuS4Blie8PO0cc7AHMW2TDUY4/kxxoI7mqqk9wgcbLDgqQMtIU7hM2TJBi2norw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=URpa5jSV9KvSoIR+Uj4lX9CYl3byglmsdr6NPXiavNQ=;
 b=Rll90hHTO7xovTC+MceNOfSrCIeg4/P07Z2rqWiEvrNAFYwL3zh5zjYpPfy3t+eWwCOflELQl+0hGhbAM1ecg+9ByeaWpgvZ2GUrlg/qZrSf1LifYVg8dL3hI4T67RDYwl+B5aOCSpeZ8J1bEpVLS61WPUWrTPU4kTzAjgygTATueAADuaR2jI4qg7CepmZMbN3mEieYgsykCPjoRdstjXg8HVtphdZZx7xJLqUAafvqmG8i+qWZB7UJkzp8uMWJRyuwf0PCEdipq1YuD5KGFAjVIF0wejYLzSo4Kxg7dYYKVhyVQ2jtXkKYfKvtTZxp8vCalsijmPlEFAOSdGdiVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=URpa5jSV9KvSoIR+Uj4lX9CYl3byglmsdr6NPXiavNQ=;
 b=hJ1j3sOyIdUXxE8WcybXEdUnvK/8zD7Tv+e839sN3zBGlpWZ4U8uE+LN7AKF4CKPqiOQE3S+Js7elKCMdCfSUHsGZoDjcHtqStM7VhGtLWvkQWupf6s+ixEJw/ZgYGTot2U0XNO0kAwNF0dwP72yLrWYH4yvomd7hPEn3umAuds=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com (2603:10a6:10:2e1::21)
 by AM9PR04MB8305.eurprd04.prod.outlook.com (2603:10a6:20b:3ee::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Wed, 23 Mar
 2022 21:16:30 +0000
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::5416:5d1:cc34:ca9b]) by DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::5416:5d1:cc34:ca9b%7]) with mapi id 15.20.5102.018; Wed, 23 Mar 2022
 21:16:30 +0000
Date: Wed, 23 Mar 2022 16:16:23 -0500
From: Han Xu <han.xu@nxp.com>
To: Tim Harvey <tharvey@gateworks.com>
Cc: Stefano Babic <sbabic@denx.de>, Sean Nyekjaer <sean@geanix.com>,
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>,
 Peng Fan <peng.fan@nxp.com>, u-boot <u-boot@lists.denx.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, dl-uboot-imx <uboot-imx@nxp.com>
Subject: Re: [PATCH] mtd: gpmi: fix the gpmi bch setting unalignment issue
Message-ID: <20220323211623.x2vpdcbfxksmqkch@umbrella>
References: <20220321201834.28546-1-han.xu@nxp.com>
 <CAJ+vNU3REM8k1aKRKE8yDRMAWnCqFBYVvPSSWV4HQwOeHKz-8w@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CAJ+vNU3REM8k1aKRKE8yDRMAWnCqFBYVvPSSWV4HQwOeHKz-8w@mail.gmail.com>
User-Agent: NeoMutt/20171215
X-ClientProxiedBy: BY3PR10CA0019.namprd10.prod.outlook.com
 (2603:10b6:a03:255::24) To DU2PR04MB8774.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7bcdc1d7-ad10-43cf-d622-08da0d126600
X-MS-TrafficTypeDiagnostic: AM9PR04MB8305:EE_
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-Microsoft-Antispam-PRVS: <AM9PR04MB8305FC6150F923652FF291EE97189@AM9PR04MB8305.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KeLq3WG8HE/2pqbVaiLMQS+ibxK5rOHJKgT0NetvQIvhuobYuFUDEC60uzhkTdiEbkyz6Scz4sdZqhABs6cQI38zIbBDgYB9/BmRHfZRbAMbnA6NS1GCrV+HFhupVBZYKDZRCcIekexlWmYkV4o6Qzn5yJZYXlZn6Bxly5yxq02IznWWmKF7gzrrxcz2lLpK4xk4E5TM1skwoIJFXtNSD/qwydEZj1DvKQyWP1QqqFPgQyzeQv8adgTbntWW2OQkJti1g5GLjuFfTFKUY1wcmmU5moA7gVkpSPX1Mq0C0j9qSuCzyxF7dAG/hL5Ae6IjC/ddRcE0Cyo0pg3ego6L1AtU6rsmZLbZysx4Dns8fcboK+nDucK3IRjV1m9lB78Pe7RkB3IRZAJXU8FtQfFzaJy46xkGyGVldX3W0qa5kv7Lin7vVW3V5B4x/fSZtte6akVFTroaRITDCGGsfEwVO6LUJTE5dtXQCPx418A5LBzuT/1aVifAqDbb8c643Ss2YE7hjg8RBLGKtlC7LE4i85NFXwyhlXS755YW0Bkz/ljglP1ZDjBOcWVhs53C4AbXe20vzy5HL1RAcX4jClvqUr68Id97CYDmkcaAijZm15DYSvTLq6gt2wDY8Buiyxya9smryqbJHfcJRa6BzpoWKsLHwkyDOZFef9nH7fVh36J2m8v0EjPncaB75wymRlUFHGBBgVlsEOEsWFDsiSNRa/ThH90vMfLqj9gyh+IxWE335L8uVyI+cnpUeTmDIX/Lge9rZF1/2kAtD4Nol62xoA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB8774.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(4636009)(366004)(2906002)(8936002)(316002)(44832011)(5660300002)(4326008)(66556008)(8676002)(66946007)(66476007)(6916009)(54906003)(6506007)(6666004)(52116002)(6512007)(9686003)(966005)(6486002)(53546011)(508600001)(45080400002)(33716001)(38100700002)(38350700002)(26005)(1076003)(186003)(83380400001)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?inSzzYUPAR3rkse36Gv5otgHVYC236GlCvx1GxGI7gfNLAEVlFmrkaSuKWCj?=
 =?us-ascii?Q?nriklIZSx/deBH6EJ44Dm/uRVDNdkdbq7svaXg438b4hlYkW+pfpbCWUkDGC?=
 =?us-ascii?Q?+NdXKq0ZQliQJj+kKhzNcFj7meAF/CDAogFwPxZ0B/m2LfncNHBzMbfusQWf?=
 =?us-ascii?Q?qkUXo9IC3lyP0vxyG1wPO9IyOHbBE9JGzmmCBNoggcZVxVztlE5FexBY5rq0?=
 =?us-ascii?Q?vjczmbNU3FQIMf/UhxHyJMBHnQGE8cj9HIjsDRjnLrRLevbJMScjq+V9/CFC?=
 =?us-ascii?Q?TFtUCqOmz3nWngEozRakv9R+YZaim/Bg9PHcsP4RbUjKASh3HOIwW1w7vlrk?=
 =?us-ascii?Q?I6GCYDir9CPcDXjOQW63Bjk4TbAqzjBMcmkZXkr7OiMdv15/8mpJg+pvPtkb?=
 =?us-ascii?Q?jRIinvww9iWaAGE8R5s9rDU/sVMdgbk5a7w+nWjKDqONxz8MSPPZ6O+YD9he?=
 =?us-ascii?Q?mqczazMmx//yw6ApVDxiOgcL1oMhqBub9KAyALxaCm8Nx1WrFiUGpNjmxlf3?=
 =?us-ascii?Q?n+e7e8uN1DpGZOj7Zzk6Y8+R3WdlG8h8oenYZCxa40lVKHF7ieXiNcu1yNt8?=
 =?us-ascii?Q?541+TC+mGgGOf7/xquWacHd7lbCAnqQdzgpdm8KNIzxYkT0JcwlFQZRHA6oe?=
 =?us-ascii?Q?FVOtBtEiJpay+42oGGCleOK+PqIe4OOfEPFRujMwZRuWQFeGVHGKCGVMKWqs?=
 =?us-ascii?Q?ZfGwwyo38KmBGa5wSB5wAh0NKbss6PsCoJbge/v3KldHFZCzP9QGebSdkLIr?=
 =?us-ascii?Q?GRoNL28IYjKusscIehSEGJLD8PB7GEiLfVwQ/B7Oq0rKoqd9z7w0LmQ/9yUJ?=
 =?us-ascii?Q?yg9QZdIYwGKHyRLDKujROfk/wG8Fo8a5P6s1LQzelM5VjmlNTj88X79tg70+?=
 =?us-ascii?Q?3N4dXTUWgH7f34ycyZG/eSxh0mV+34pFIbnnRsi8Jtzfob2ejZPgBc+uFwHe?=
 =?us-ascii?Q?g9He3tXX5dDghzD8d8TX4lw1d8uJ5NgpNqJmzZt2GV3EHymqWzyaw7JejeH5?=
 =?us-ascii?Q?oJHzeyln2t0Kn9dPK74NdFxkhXbE0FGbQw1IDesuo3aga+lEQtadVcVmxHVJ?=
 =?us-ascii?Q?6s+rzQXR5RFaqzvuuOszVcAZmrz4H0OM5+bf+PChmhcp6W7Wx686yhshvpt/?=
 =?us-ascii?Q?pJTm48Rziur5yr3co07+nsiEBG8iH/zT6QLbBtNYpJZ7XeQkazsWqJwjq8XB?=
 =?us-ascii?Q?kG0ECLA5kcfoclqnx8/ToulDqmjEaYOhUQYVSYkX2DTB3VvPYXEi37ePRV3D?=
 =?us-ascii?Q?Qjgze1eaF1mnWMUCDUlDa+pHdpx8RKCeGOe2txVj58x8oABtU8FoxHnP9c7l?=
 =?us-ascii?Q?teogSwLfybGWdFYr20e3oYU6RWXewkhzfOp/oOB6Ryxpr3wDhgzOr5P9hg8y?=
 =?us-ascii?Q?Z8V2xmUlyd8Uv6+7hDwhf9q9c0bcJynf/m3hv8HlGPWnoMaSI7Ivyc1syT8j?=
 =?us-ascii?Q?pUwvLcl3w12s76TREUsWqFfN1kIq/a0A?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bcdc1d7-ad10-43cf-d622-08da0d126600
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8774.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2022 21:16:30.1999 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /rrX2PIPS0ntsyU3yoLBf79ToUEmhaJR5aQ9BvmoFM2JEULqyv6V9cB9rO5qFHhx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8305
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_141635_991600_1C1F9AF0 
X-CRM114-Status: GOOD (  36.28  )
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

On 22/03/22 12:34PM, Tim Harvey wrote:
> On Mon, Mar 21, 2022 at 1:37 PM Han Xu <han.xu@nxp.com> wrote:
> >
> > The code change fixed the kernel gpmi bch setting not aligned with
> > u-boot settings issue. It still uses the legacy bch geometry as the
> > default option. If users need to choose the minimum ecc strength that
> > NAND chips required, it can be enabled by either adding DT flag
> > "fsl,use-minimum-ecc" or CONFIG_NAND_MXS_USE_MINIMUM_ECC in configs.
> >
> > Fixes: 51cdf83eea mtd: gpmi: provide the option to use legacy bch geometry
> > Signed-off-by: Han Xu <han.xu@nxp.com>
> > ---
> >  drivers/mtd/nand/raw/mxs_nand.c | 71 ++++++++++++++++++++++++++++-----
> >  1 file changed, 62 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/mtd/nand/raw/mxs_nand.c b/drivers/mtd/nand/raw/mxs_nand.c
> > index 748056a43e..ee5d7fde9c 100644
> > --- a/drivers/mtd/nand/raw/mxs_nand.c
> > +++ b/drivers/mtd/nand/raw/mxs_nand.c
> > @@ -195,6 +195,7 @@ static inline int mxs_nand_legacy_calc_ecc_layout(struct bch_geometry *geo,
> >         struct nand_chip *chip = mtd_to_nand(mtd);
> >         struct mxs_nand_info *nand_info = nand_get_controller_data(chip);
> >         unsigned int block_mark_bit_offset;
> > +       int corr, ds_corr;
> >
> >         /* The default for the length of Galois Field. */
> >         geo->gf_len = 13;
> > @@ -225,6 +226,17 @@ static inline int mxs_nand_legacy_calc_ecc_layout(struct bch_geometry *geo,
> >         geo->ecc_strength = min(round_down(geo->ecc_strength, 2),
> >                                 nand_info->max_ecc_strength_supported);
> >
> > +       /* check ecc strength, same as nand_ecc_is_strong_enough() did*/
> > +       if (chip->ecc_step_ds) {
> > +               corr = mtd->writesize * geo->ecc_strength /
> > +                      geo->ecc_chunkn_size;
> > +               ds_corr = mtd->writesize * chip->ecc_strength_ds /
> > +                      chip->ecc_step_ds;
> > +               if (corr < ds_corr ||
> > +                   geo->ecc_strength < chip->ecc_strength_ds)
> > +                       return -EINVAL;
> > +       }
> > +
> >         block_mark_bit_offset = mtd->writesize * 8 -
> >                 (geo->ecc_strength * geo->gf_len * (geo->ecc_chunk_count - 1)
> >                                 + MXS_NAND_METADATA_SIZE * 8);
> > @@ -1111,6 +1123,7 @@ static int mxs_nand_set_geometry(struct mtd_info *mtd, struct bch_geometry *geo)
> >         struct nand_chip *chip = mtd_to_nand(mtd);
> >         struct nand_chip *nand = mtd_to_nand(mtd);
> >         struct mxs_nand_info *nand_info = nand_get_controller_data(nand);
> > +       int err;
> >
> >         if (chip->ecc_strength_ds > nand_info->max_ecc_strength_supported) {
> >                 printf("unsupported NAND chip, minimum ecc required %d\n"
> > @@ -1118,19 +1131,57 @@ static int mxs_nand_set_geometry(struct mtd_info *mtd, struct bch_geometry *geo)
> >                 return -EINVAL;
> >         }
> >
> > -       if ((!(chip->ecc_strength_ds > 0 && chip->ecc_step_ds > 0) &&
> > -            mtd->oobsize < 1024) || nand_info->legacy_bch_geometry) {
> > -               dev_warn(mtd->dev, "use legacy bch geometry\n");
> > -               return mxs_nand_legacy_calc_ecc_layout(geo, mtd);
> > +       /* use the legacy bch setting by default */
> > +       if ((!nand_info->use_minimum_ecc && mtd->oobsize < 1024) ||
> > +           !(chip->ecc_strength_ds > 0 && chip->ecc_step_ds > 0)) {
> > +               dev_dbg(mtd->dev, "use legacy bch geometry\n");
> > +               err = mxs_nand_legacy_calc_ecc_layout(geo, mtd);
> > +               if (!err)
> > +                       return 0;
> >         }
> >
> > -       if (mtd->oobsize > 1024 || chip->ecc_step_ds < mtd->oobsize)
> > -               return mxs_nand_calc_ecc_for_large_oob(geo, mtd);
> > +       /* for large oob nand */
> > +       if (mtd->oobsize > 1024) {
> > +               dev_dbg(mtd->dev, "use large oob bch geometry\n");
> > +               err = mxs_nand_calc_ecc_for_large_oob(geo, mtd);
> > +               if (!err)
> > +                       return 0;
> > +       }
> >
> > -       return mxs_nand_calc_ecc_layout_by_info(geo, mtd,
> > -                               chip->ecc_strength_ds, chip->ecc_step_ds);
> > +       /* otherwise use the minimum ecc nand chips required */
> > +       dev_dbg(mtd->dev, "use minimum ecc bch geometry\n");
> > +       err = mxs_nand_calc_ecc_layout_by_info(geo, mtd, chip->ecc_strength_ds,
> > +                                              chip->ecc_step_ds);
> >
> > -       return 0;
> > +       if (err)
> > +               dev_err(mtd->dev, "none of the bch geometry setting works\n");
> > +
> > +       return err;
> > +}
> > +
> > +void mxs_nand_dump_geo(struct mtd_info *mtd)
> > +{
> > +       struct nand_chip *nand = mtd_to_nand(mtd);
> > +       struct mxs_nand_info *nand_info = nand_get_controller_data(nand);
> > +       struct bch_geometry *geo = &nand_info->bch_geometry;
> > +
> > +       dev_dbg(mtd->dev, "BCH Geometry :\n"
> > +               "GF Length\t\t: %u\n"
> > +               "ECC Strength\t\t: %u\n"
> > +               "ECC for Meta\t\t: %u\n"
> > +               "ECC Chunk0 Size\t\t: %u\n"
> > +               "ECC Chunkn Size\t\t: %u\n"
> > +               "ECC Chunk Count\t\t: %u\n"
> > +               "Block Mark Byte Offset\t: %u\n"
> > +               "Block Mark Bit Offset\t: %u\n",
> > +               geo->gf_len,
> > +               geo->ecc_strength,
> > +               geo->ecc_for_meta,
> > +               geo->ecc_chunk0_size,
> > +               geo->ecc_chunkn_size,
> > +               geo->ecc_chunk_count,
> > +               geo->block_mark_byte_offset,
> > +               geo->block_mark_bit_offset);
> >  }
> >
> >  /*
> > @@ -1159,6 +1210,8 @@ int mxs_nand_setup_ecc(struct mtd_info *mtd)
> >         if (ret)
> >                 return ret;
> >
> > +       mxs_nand_dump_geo(mtd);
> > +
> >         /* Configure BCH and set NFC geometry */
> >         mxs_reset_block(&bch_regs->hw_bch_ctrl_reg);
> >
> > --
> > 2.17.1
> >
> >
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Flists.infradead.org%2Fmailman%2Flistinfo%2Flinux-mtd%2F&amp;data=04%7C01%7Chan.xu%40nxp.com%7Cdd88699d0a5a420924f608da0c3b0c34%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637835744992699148%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=cVwFQPYbDPPcZ5fRRxhD8rBsNcDTEkm1h6mWMQ8wzFo%3D&amp;reserved=0
> 
> Han,
> 
> I have boards (gwventana_nand_defconfig / boards/gateworks/gw_ventana)
> that support several different NAND chips:
> 2GiB Micron Technology MT29F16G08ADACAH4 (4k page size, 256k erase
> size, 224 oob size)
> 2GiB Cypress S34ML16G202BHI000 (2k page size, 128k erase size, 128B oob size)
> 1GiB Micron MT29F8G08ABACAH4 (4k page size, 156k erase size, 224 oob size)
> 256MiB Micron MT29F2G08ABAEAH4 (2k page size, 128k erase size, 64B oob size)
> 
> commit 616f03dabacb ("mtd: gpmi: change the BCH layout setting for
> large oob NAND") did break NAND for these boards by forcing a change
> to this 'modern' geometry that never even existed in the mainline
> kernel
> commit 51cdf83eea ("mtd: gpmi: provide the option to use legacy bch
> geometry") does not help my boards as like Frieder, I don't have
> access in DT at this time to set the flag (if I alter code to force
> legacy mode it fixes it)
> 
> This patch does resolve the issue on my boards by using the legacy
> layout by default. I would say that this fixes an issue that pre-dates
> commit ("51cdf83eea mtd: gpmi: provide the option to use legacy bch
> geometry") so I would add:
> Fixes: 616f03dabacb ("mtd: gpmi: change the BCH layout setting for
> large oob NAND")
> 
> I agree with Sean's comments that the commit log should not indicate
> anything about the kernel as there was no change done in the mainline
> kernel and this was simply a breakage of U-Boot and that a follow-up
> patch is needed to remove the unused 'fsl,legacy-bch-geometry'.
> 
> Tested-by: Tim Harvey <tharvey@gateworks.com>

Thanks, will send patch v2 with changes.

> 
> Best regards,
> 
> Tim

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
