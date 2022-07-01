Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 201DACCA479
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Jul 2022 12:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+JvQ5R7xFjprsM1FdbCjKcmRMh7Vm8WZu4+vF4+El1Q=; b=TYWZk9TfFXKK6Y
	zUIEXCZ4RW6aqXYwzB5rFu1gUrfO5u2O3y1Pd4e3Ts71yYRNWjBI4vf1t4uD/EUAUR6woHNVBCQaL
	PEX9V73LHWDxSjjPML07kfpgpFl6SSxcM+Ig/c9TXvaVWxAk7SkSALYC6Rrps1O1PC07yFLRTMwvv
	LSeQGy8ZgWkSy/ssix3Sr7wA8sXkuyZSEGQ3eB2wc9nleiHxn5xSoSvFd2uAeZdEUbbOy9RAF0tQI
	dMQbRbOjH+/qGB2AxVe2bcxy6NxOWBLclG3ZT9Riz6wnE1DelxVFHUT6Hl6gv5/vOEkAhzKPFBK4I
	pXzvqG9po3lg/FpmJZGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7G9A-004rH4-JI; Fri, 01 Jul 2022 12:53:20 +0000
Received: from mail-dbaeur03on2057.outbound.protection.outlook.com ([40.107.104.57] helo=EUR03-DBA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7G98-004rFU-2w
	for linux-mtd@lists.infradead.org; Fri, 01 Jul 2022 12:53:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z9TQQ277I9PT9KoZcKRXwCrwpdNBcarWvalYTkkisaB6rvd55M4X1vnAYa/pBCmu2dA3u8huXEFbXU2usPCX1GorhreNESV+I7Hd3X/V8FiTPxFV2XWrFA4OgSMF4y2L3eZ7H11LHcvPo6LBCy8zyCFMisl0cbEn5fIDrnsTgK/jo15/zEfCNjOH2uNuNFYT9kvJXl/kUxCbqUPN6zoveiZ8FIuuKP0FcFsqHBBSMf98kczPEOgheq5nSjxbvma61zWBJAXq0ubmCwLl0MPDT1i7vZJ+7ir4ACphp4doSZPgzyXUbFOEEbGHaRapyWIWPCT4Q1bKFhz1qlx1X5/2qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DgHYiaw/oobGc3Lh6CFlTfvDUTXGLjQZlbBrtEDzvDM=;
 b=ksW4fjm+22ny3hZmrrzOphSYEY7OQfWICblzc/M7f2NuRaeEi1EgpVj5ghVSgr6mr2DUYC5Pxa7LHNc0eTTvKOlrXpDvi0tqp6KcvGUdkCkd3hC3ptVjE/pYAI/j7luu/YjIO8mGXd0UzFlOP9/v38EA+lO4icLufw5ydl2zYsEuYoOHQikc97nZxcIQPXSE5ZgUNz0/tSCIviUvKjiRdGBcUGtCsd/s/dhbECl8ZyZHENYND+twubH4RPeOVmJl4EvFr/d8iGyj5qDt2Ctm9xVcDHkJ9Zajs1GXpfFvJMjg0cKJsOmmAEPgocmv6Elt1rduR4NW+TpyDLAiuC+wQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DgHYiaw/oobGc3Lh6CFlTfvDUTXGLjQZlbBrtEDzvDM=;
 b=pxrdwpfD/IYWdYyO8N1Ga/zT0ScFEmzIDMzLjZdmDmTDdZ/Y/koEF/rCsdYrjZ6pDGfqhyLLiFNr965HYKFvCmnsNLE5nISZlA4I3uncklm1nhpGLhd0zxrMNMVF3FdnlHVy8wZoDhHsBYvzhn3M8aCQsiIQ7cYNJSfO0Kor7D0=
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com (2603:10a6:10:2e1::21)
 by AM0PR04MB6529.eurprd04.prod.outlook.com (2603:10a6:208:16f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Fri, 1 Jul
 2022 12:53:12 +0000
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::5c49:dd85:a8d0:2907]) by DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::5c49:dd85:a8d0:2907%3]) with mapi id 15.20.5395.015; Fri, 1 Jul 2022
 12:53:12 +0000
From: Han Xu <han.xu@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>, Richard Weinberger <richard@nod.at>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH] mtd: rawnand: gpmi: Set WAIT_FOR_READY timeout based on
 program/erase times
Thread-Topic: [PATCH] mtd: rawnand: gpmi: Set WAIT_FOR_READY timeout based on
 program/erase times
Thread-Index: AQHYjTo9+2B5QAr1QUum1L0ReOxR/K1peEIg
Date: Fri, 1 Jul 2022 12:53:12 +0000
Message-ID:  <DU2PR04MB877447C730B0E64D7B19399397BD9@DU2PR04MB8774.eurprd04.prod.outlook.com>
References: <20220701110341.3094023-1-s.hauer@pengutronix.de>
In-Reply-To: <20220701110341.3094023-1-s.hauer@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b903676c-42f1-4372-694b-08da5b60a851
x-ms-traffictypediagnostic: AM0PR04MB6529:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  hJh5LD8PXgvbCHSKZsr+v2xtommIbjmsgG7Oj7SGWBSfcENOVRNAf3tE0tdQHHFsVTFcVrbw72iiDgExmOn2Cx8prHsYsHZFc7HjaYGt8l/eek0r2+hEhKWQ8RCCYFCW0ROYzRL42lKZSi94nsHZjyPdDSUeBXZTiVhKLJr8RUdclsqwSZwptjL3YFDx01cdnXju8pC/QlQsNVaXRGFPEDn5k+atFRkQfXdmnNvErb39tCUPzLg64BaMM0qqQrnDDUKvtjx4SHWH6Ra0+EiecblCAM58OAP1Jphmla+FB8YfoSLH88Jp8lkKcT35BCfu9dXZ3T5l20WEZJn1148L8J1A2ToYECku5+90SWnSbwMpJKn37j9EEquIgOBrVHIA7nO95NmdYipmCwcpCrg0E4WSqxHuwDoOBZevLAJ+YwQIckfis1zXwOc8j9kDRBj5OCL7mP+ByxdycceAe7bsCnF0MOczMVH4/9h4cnqKY3x0UMtjRRxsY9DQ2acVtGc70kplMdIIoOLhc+2BehP1eZXeWSx4CD1Ig5xChePzK79t0cvBn0jsusrc47Byru+znACizE7PVhhRGQYjiCkLu5omriyuaHQFzVNof3JE4sCVB+kln3pWWOh9y9gftq64/C7FbQkx/biIhz89tzHaHyLHw/Z728De1xwYNK3TSsFyHSqbf3nq9sbbsdLqg6kOCa0O693MoBrXLlinMsqmm9siNE7hPbL8mc/yHOpH5dG4V13T8MK4j2aHrOCQcHWGiOiDD+c0Zp4aAGRNAW/7n8k+S+kNUEwUsJkFZnlzIbymAGFM3jclQ5yuGimzLmry
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8774.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(396003)(376002)(136003)(39860400002)(71200400001)(316002)(478600001)(41300700001)(122000001)(38070700005)(7696005)(6506007)(9686003)(55236004)(26005)(110136005)(54906003)(186003)(83380400001)(2906002)(4326008)(8676002)(55016003)(76116006)(66946007)(64756008)(5660300002)(66446008)(66556008)(52536014)(8936002)(66476007)(44832011)(33656002)(86362001)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?mHGWtz5JtCaR4a9wtkT1S5KLwnxmZse07Q6BMaq+BSg1KoKaDd/OUEUMZrOd?=
 =?us-ascii?Q?1GfZ1PAG3eNmPhhXw2ucMwbGnIWYN7Lmj1Zuchcad5L+yKJlCDd1ypwBUKgV?=
 =?us-ascii?Q?kMjMTWoCqKtWGyzst0MMzc8pyJxsuUe/UOrGoO02D9P2N70IP8uq/DLTV1X5?=
 =?us-ascii?Q?BI8vFfOSj8S4+ApMHjFQxeCPkbGrgDWUx/R/MnjlBIrSO+Wf5K1EsoXG7AFd?=
 =?us-ascii?Q?8IUr+9upz+yW2KJx5JlDsfVDwx1Ab+FpktC6yLdTpJNbmDB601bZVBpkBtEH?=
 =?us-ascii?Q?avX8NlmGqvfetRYT/gP4rOaqDZvWejr33O+at/BiNFsYk4UTO83UAqAnyw6V?=
 =?us-ascii?Q?8RcJycIrYE/uBZne0tEi+4Ov3xOhcGawNhn0iH8drTEI21sgcJE+mXJB0gjJ?=
 =?us-ascii?Q?DU1NdNvInk4wGTIhfca5VzFdc6hx2tr9tcg/5r7azcuhchXoHUczMwpoSXkD?=
 =?us-ascii?Q?2s2qxI3nO8OhmviCSp3vXNvJM6xH26GUyQMbL9J4/2V4byi1EehjADLbCCPB?=
 =?us-ascii?Q?0HiSxr5iIYGxRsc+Xh3EoZKKs34u4ozcBkj6FCgyLDYn+zD3XLlFVqvlsafQ?=
 =?us-ascii?Q?z51oFQJ3UgJfmb4AVtOAwxwexHAAxQdL8fLkRp/gyol6GH9OS/gFvPOi/TvX?=
 =?us-ascii?Q?IH0pTis9aDug4+jbs45rFUbvFag9Vr540wo8cG5HX5K9kzlVhqZqVAagqywD?=
 =?us-ascii?Q?XpG3kxndt7wE18G389J3X6jNYxNn9FecFnHlsdlHhmnSOBboRUuCGSny5bOM?=
 =?us-ascii?Q?9A0vmV3Qj2V5aqej1GjbGAuRr80EwYhERltx+vT59D+F2xERvkwJdwdu8sIl?=
 =?us-ascii?Q?3CFWtuH4oAHb2EiNau55uZfzTos5feth9l+aIihn6/Ohqli3QgV+5IVfcTbn?=
 =?us-ascii?Q?qMjvb+6dd3L/fNm+p9C9IqDHvXAJ3Lo5/+47ZT348h9IASOog2GchZtFOZQU?=
 =?us-ascii?Q?QGV4AgGBCu4oh3Ycl1ijgMHwxgYtUzWqx9ePEEcTIHT4Y9Wgl0Sv3zEu38iS?=
 =?us-ascii?Q?4Stxz3juYzw3jEOmyChP4zknwqOS7ZGjJCb2nst6D94+PvxZ73Tbj04CN/3j?=
 =?us-ascii?Q?5ov1Wvii7h7ognmnxFwk+cqrGzVcdWgsIcZrjRxlqu2QFusG4gh3SIb2uN2N?=
 =?us-ascii?Q?yFZQ6pctAflgqpx/YzOCf0KI/yy+BLIfcx6VV9+4iL/yq4pShmMQ/zaq5J/B?=
 =?us-ascii?Q?yH/ATL8Vz7+UTiWe3bTYyr+5a89dZyvlQ60U5Tyq8xYgPdQLFKTuVwxQt766?=
 =?us-ascii?Q?KQaKREyL9/IEPXF82D5IZU1KvsB88SEpmexzB7vp/ibGvPt+cApANvv8JwHi?=
 =?us-ascii?Q?CTc3OpELCTB6jsX1rukTEj7tb3YQr2JSc94dn8cuLQ4cdqq+GZOHX93q5F45?=
 =?us-ascii?Q?xnHXF9emSevBfQGBpzObehYtNNt40PEhUVvjRGTXi2sNzVWrRwjRJWaUwHk+?=
 =?us-ascii?Q?R8ka7Z+fVH5XStsiHZR0N4JXQZ5Y+IoWRTrUa4y8Ehbz7TmjuNUdD+5Sso8/?=
 =?us-ascii?Q?Z2VV6dErBIBGKt12nz+CSNIo9zPav/omLJHfR420J/XGHPOyJ50lcGORiJdO?=
 =?us-ascii?Q?W7Q455kI7Ykq/uE6ZsM=3D?=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8774.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b903676c-42f1-4372-694b-08da5b60a851
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2022 12:53:12.5085
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: irf12Gk36I2rIXspuFZBXVC0yAOuX3rRWYLlX9qkOJ8S28jWViAjmtd6lhk3rD2R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6529
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_055318_329689_5D6D7670 
X-CRM114-Status: GOOD (  16.87  )
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



>-----Original Message-----
>From: Sascha Hauer <s.hauer@pengutronix.de>
>Sent: Friday, July 1, 2022 6:04 AM
>To: linux-mtd@lists.infradead.org
>Cc: Han Xu <han.xu@nxp.com>; Miquel Raynal <miquel.raynal@bootlin.com>;
>kernel@pengutronix.de; Richard Weinberger <richard@nod.at>; Sascha Hauer
><s.hauer@pengutronix.de>; stable@vger.kernel.org
>Subject: [PATCH] mtd: rawnand: gpmi: Set WAIT_FOR_READY timeout based on
>program/erase times
>
>06781a5026350 Fixes the calculation of the DEVICE_BUSY_TIMEOUT register value
>from busy_timeout_cycles. busy_timeout_cycles is calculated wrong
>though: It is calculated based on the maximum page read time, but the timeout is
>also used for page write and block erase operations which require orders of
>magnitude bigger timeouts.
>
>Fix this by calculating busy_timeout_cycles from the maximum of tBERS_max and
>tPROG_max.
>
>This is for now the easiest and most obvious way to fix the driver.
>There's room for improvements though: The NAND_OP_WAITRDY_INSTR tells us
>the desired timeout for the current operation, so we could program the timeout
>dynamically for each operation instead of setting a fixed timeout. Also we could
>wire up the interrupt handler to actually detect and forward timeouts occurred
>when waiting for the chip being ready.
>
>As a sidenote I verified that the change in 06781a5026350 is really correct. I wired
>up the interrupt handler in my tree and measured the time between starting the
>operation and the timeout interrupt handler coming in. The time increases 41us
>with each step in the timeout register which corresponds to 4096 clock cycles with
>the 99MHz clock that I have.
>
>Fixes: 06781a5026350 ("mtd: rawnand: gpmi: Fix setting busy timeout setting")
>Fixes: b1206122069aa ("mtd: rawniand: gpmi: use core timings instead of an
>empirical derivation")
>Cc: stable@vger.kernel.org
>Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Acked-by: Han Xu <han.xu@nxp.com>

>---
> drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 6 ++++--
> 1 file changed, 4 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
>b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
>index 889e403299568..93da23682d862 100644
>--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
>+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
>@@ -850,9 +850,10 @@ static int gpmi_nfc_compute_timings(struct
>gpmi_nand_data *this,
> 	unsigned int tRP_ps;
> 	bool use_half_period;
> 	int sample_delay_ps, sample_delay_factor;
>-	u16 busy_timeout_cycles;
>+	unsigned int busy_timeout_cycles;
> 	u8 wrn_dly_sel;
> 	unsigned long clk_rate, min_rate;
>+	u64 busy_timeout_ps;
>
> 	if (sdr->tRC_min >= 30000) {
> 		/* ONFI non-EDO modes [0-3] */
>@@ -885,7 +886,8 @@ static int gpmi_nfc_compute_timings(struct
>gpmi_nand_data *this,
> 	addr_setup_cycles = TO_CYCLES(sdr->tALS_min, period_ps);
> 	data_setup_cycles = TO_CYCLES(sdr->tDS_min, period_ps);
> 	data_hold_cycles = TO_CYCLES(sdr->tDH_min, period_ps);
>-	busy_timeout_cycles = TO_CYCLES(sdr->tWB_max + sdr->tR_max,
>period_ps);
>+	busy_timeout_ps = max(sdr->tBERS_max, sdr->tPROG_max);
>+	busy_timeout_cycles = TO_CYCLES(busy_timeout_ps, period_ps);
>
> 	hw->timing0 = BF_GPMI_TIMING0_ADDRESS_SETUP(addr_setup_cycles) |
> 		      BF_GPMI_TIMING0_DATA_HOLD(data_hold_cycles) |
>--
>2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
