Return-Path: <SRS0=UNLD=RO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E35E0C43381
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Mar 2019 04:33:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B05A7206DF
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Mar 2019 04:33:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kvIqyu+n";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="QkTuLygt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B05A7206DF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xilinx.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j602QkoSmkgToIVXXBL9Atb/RLKvzW4KKgAP+KxX6ig=; b=kvIqyu+nLIr7YI
	x5z6jZCjtQ9CKwEkDKTHHlybtk8mIf0APih+dTeD3cxJoX5DYSch1P4KgK4DRczoJTa1mx7ccO0D4
	dwkJPTtTXIfShRoWxILHyIElQDjINA11LVAkMD6F3UKhsb6qpLEy29YeKXC5QH6WevQyBPXhxQqnk
	Kqvjx1NmWLDMZ7ntIyj+9AdpDsKMIVHFyDu8ml4oZSg87aEKoL0KrfNuqRA/h05UMRJvot6cGtiFw
	ul8MrYnmd4PSm+2nCXeYIrjgz3AGJV26MPHQclM+wiyuwJM/JUWHQBqGj+FrJuvbtzvYENbPZrQGG
	CoHoT4iJbYHvZFTBLDTQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3Cce-0007fb-Vq; Mon, 11 Mar 2019 04:33:09 +0000
Received: from mail-eopbgr730052.outbound.protection.outlook.com
 ([40.107.73.52] helo=NAM05-DM3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3Ccb-0007f2-5x
 for linux-mtd@lists.infradead.org; Mon, 11 Mar 2019 04:33:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=np9o1Tw04K0KNXEu7Zy8WXdd5I38MDXwjT/B9rZ4aWw=;
 b=QkTuLygtAZn7dynOgQeV0w3pjtZroqEwbZ54872c1BEMdqvhF7SYoXfST7WOlFYy2Gw4vW04QkTdZWb6oIpKOZIJM4U+KxVsoW8+btbhb99/eNDrLL6fBd3wQSYQ4dgENu/kuqhEipKMCslp2kI44dkrzv8tNiY66uwWjRI0k2I=
Received: from MWHPR02MB2623.namprd02.prod.outlook.com (10.168.206.9) by
 MWHPR02MB2222.namprd02.prod.outlook.com (10.168.243.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1686.18; Mon, 11 Mar 2019 04:32:58 +0000
Received: from MWHPR02MB2623.namprd02.prod.outlook.com
 ([fe80::c89d:e485:cb5e:89cf]) by MWHPR02MB2623.namprd02.prod.outlook.com
 ([fe80::c89d:e485:cb5e:89cf%5]) with mapi id 15.20.1686.021; Mon, 11 Mar 2019
 04:32:58 +0000
From: Naga Sureshkumar Relli <nagasure@xilinx.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, "broonie@kernel.org"
 <broonie@kernel.org>, "bbrezillon@kernel.org" <bbrezillon@kernel.org>
Subject: RE: [RFC PATCH 2/2] spi: spi-mem: Add support for Zynq QSPI controller
Thread-Topic: [RFC PATCH 2/2] spi: spi-mem: Add support for Zynq QSPI
 controller
Thread-Index: AQHUzzOoSBENcbUE5E66VjcEuxsjhqX2j+qAgAAInUCACp3tgIAEsX7g
Date: Mon, 11 Mar 2019 04:32:58 +0000
Message-ID: <MWHPR02MB262362EC0116C64B84874740AF480@MWHPR02MB2623.namprd02.prod.outlook.com>
References: <1551337361-11665-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <48dafcc4-1b9d-9ce2-9228-78e73252781f@ti.com>
 <MWHPR02MB262310CF8152AE170FE7443CAF760@MWHPR02MB2623.namprd02.prod.outlook.com>
 <602dd5ed-48b6-2098-fc2a-e36192b6a8e7@ti.com>
In-Reply-To: <602dd5ed-48b6-2098-fc2a-e36192b6a8e7@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
x-originating-ip: [149.199.50.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a8044280-d4fb-46a8-6a61-08d6a5daa3c8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR02MB2222; 
x-ms-traffictypediagnostic: MWHPR02MB2222:
x-microsoft-exchange-diagnostics: =?utf-8?B?MTtNV0hQUjAyTUIyMjIyOzIzOm1MWEN3cHNGMDhIM1FBWUtoOUZ0QkVtN29y?=
 =?utf-8?B?VXY2SzFDUDZ4T21jTyt1TGNxMmxQVzZlU2hERWVNcjhyaTJ6WExaUCtvaEdj?=
 =?utf-8?B?VGlHMkRlN1BFcWltL0RZcnBzZXdXVWkvWUxFTFlTOGk0d3NuVkFpVkUvTko2?=
 =?utf-8?B?Y21CaFhxSG4rMm9vTkRFbGNGNEZZaXlsTlVaNnRSZ3BVd0M3VmhsMXVLSnJR?=
 =?utf-8?B?VHFnU0JQNlFCOVczekVzRFpZQ1BWUDdEd042dXJHNk1KTzUwc2swQ21BSVFn?=
 =?utf-8?B?bGFXTi9PMVBWb3dULzh5UHdTSXRkMlo2b2J6Tm5ldXVNOFIxaGZqUVBEV2VT?=
 =?utf-8?B?MVZSTzd6eElvMzBuK1NEc1ZvRU43ZUtzbW1vQjRSWjBJck1pc01xNE4zVlVq?=
 =?utf-8?B?eEVuU3doazU2S2g2bVFkUWt2UEY2cUd0YmxDWDU4YStpLzB0N0p5RlA5RW0v?=
 =?utf-8?B?SDJlSHUxR3l2VHRVVWdMbEkxMlNPQkpBWWtMS3lXb2g4eWxuQ0pHalRtL2pT?=
 =?utf-8?B?TTBRYyt1a1RaeTh0RDBIbXQ4S3o1SVZWd1pxem5QNzJjTm5jb2JMdElhbzAy?=
 =?utf-8?B?QWowNlJPL2NKUGZQNU5JUmtsTDNuU0FaTmJGTzlITTB2WU9xbjBCS24rZDFk?=
 =?utf-8?B?Ri9iaS9mOW5XNmYxdDlRUm43UzRuRW5ncWwrSmhxOHMvQVgvK1VmaGlwYWxT?=
 =?utf-8?B?cnVUdjFtcDNDdEEzL2lFMU9MRG1LRm5CazNkRUhiUVRFZUJTT0NhK01GYkZ4?=
 =?utf-8?B?TUJaTTB4S3ZWMW1BOHlaLzJuWUY1YzUwa0I3dTgwNUdhU2xUNC93NUNpaXNj?=
 =?utf-8?B?VjVxVE80UjdDZ1Q2aHdrVGp0M3dDWEZVbzRqcHpWbktodExZWFFBQzc5dWxy?=
 =?utf-8?B?enlGTStlQW5wbkdJNTE0ZHhWQlRCclg0OTBNRG5wNDlPRDN2b3Q2K1NTdVA5?=
 =?utf-8?B?M2JTaFVPTjkxZ1RYWDlCaDJ2Y2NwMzZBMXRRUEdHcXJnQjFxTnNIZ2cvS3F5?=
 =?utf-8?B?a1JPSHRjL3krZzBPQWJwbENhUEFSM095UXdTejVibFM3c0xPMHpKdE5pcVE3?=
 =?utf-8?B?NmVXRDJiY2c3a3pLSXYraUpFM29LOFE2bFk1cmtjMWFMeng5REtmZUIrVTZp?=
 =?utf-8?B?blB2aFA2YmhYa1RVVXlmVEdpRUlmN1o4S0pyZUE4VnhTMURSSDFFRkxkWUNN?=
 =?utf-8?B?aW1qSHV2dXIzcnZGWlZmc3RzWWNuNEV0b2U4Q2xuM0t2MTFjTUlOOUd2Mzha?=
 =?utf-8?B?MmlzbER1ZXNJNkM3cnFJVFBETzJoN3F2SXNFSTJncUJBTFNueXpVZWhQWkQy?=
 =?utf-8?B?MlZuU3ZHd0NBU3E0K3ovVDQ5WlJWY1lHMnZSTWwrZ2lkZlRrU2U5cHBUSnMr?=
 =?utf-8?B?QlZrb1MzbG9sUW0ySVJqeDA1SmpvVGVZQ1hWY0diUUtCNnlHZm9NcklHNTNv?=
 =?utf-8?B?T2dJRDJIaFVxQzkzWnZMRnY2UWl3SkpIbkJVVDRQdklvdFBiVUcrNytwQVpD?=
 =?utf-8?B?Ulh4WnFQSkkyeVk5TmdORGJ6RXBlYlUzZVVPZ0F5eCttRk1xZ3ZkUmpyRDNP?=
 =?utf-8?B?b3pnODA3bE90UnQwY2l5R3NrWG54bXA5Q2F4ZmlqdU5WOHo0dUtEZUNZVWtC?=
 =?utf-8?B?TW1oM1I3MUJXemtuWUI5NmdwajgxcS9OMUNHLzNBTnBJOGloa2VzbTFobVVY?=
 =?utf-8?B?OHZsL3lvdWxJTGNvd2ljb3B3dVE0SW1sTXF3NTRaOGFhbHRBRDdtaHFuenVY?=
 =?utf-8?B?NGc3TzV3OXl0aVlMNTVTUGxYU0MrNjM5NnhrQ0luYWlxNlZkUlVOWTFGRmx4?=
 =?utf-8?B?a2U1eXF5Wjlkeng3QVpZOThNV0NQdWpna0E2OVljUEtJT2hZbWhxN0RpVjZS?=
 =?utf-8?Q?zosZ1uvmrVY=3D?=
x-microsoft-antispam-prvs: <MWHPR02MB22229EEA8529F0A0F4EA1C54AF480@MWHPR02MB2222.namprd02.prod.outlook.com>
x-forefront-prvs: 09730BD177
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(136003)(376002)(396003)(346002)(366004)(189003)(199004)(13464003)(14454004)(7696005)(478600001)(102836004)(53546011)(14444005)(6116002)(6246003)(6346003)(105586002)(106356001)(33656002)(76176011)(3846002)(7416002)(6436002)(2501003)(71190400001)(2201001)(71200400001)(66066001)(186003)(6506007)(229853002)(316002)(8676002)(446003)(26005)(55016002)(476003)(486006)(2906002)(8936002)(25786009)(97736004)(68736007)(256004)(4326008)(86362001)(99286004)(53936002)(54906003)(110136005)(305945005)(93886005)(81156014)(81166006)(11346002)(5660300002)(74316002)(52536013)(9686003)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR02MB2222;
 H:MWHPR02MB2623.namprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
 permitted sender hosts)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=nagasure@xilinx.com; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bfHm0/JWVncuiAvYkNO32T17cHhdv4jzOtKfgUK9qrL65ny+Yhh1v83zhPUgg48BOL19R3mKToNji0zH5hJbhObI+VItRsY+QQY9VWmT3UZB/MHDgMcTf91NX0Xe6rvYLOMFWKyWdfR5ybug/bENNBSCcbUWfPwlziu6ZJ6l1FSPnTmnfFSB3lEnUwdmTVYXHXdaCXetHKYIlMLij7RhgkSaSvQdWsPbyc1foWxufNXDDVMLiuDlQQFxmTA4OwVm88W63IU66hO18RjF3wybeOIw1IlFxdEhb7oiijkVkjOfdQxgv2Mk595a70YwHDX3WBPedckAsTCKR2H5aseWy+uo3QrkGidMNa576jdTTdjWcs3IlFs1jIj+TOg5qweoFa3A2+kUIF8GAANUJqnmT5S2jOB5eMMUQ4E/ajwzfZs=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8044280-d4fb-46a8-6a61-08d6a5daa3c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2019 04:32:58.7517 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2222
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190310_213305_284073_71E60164 
X-CRM114-Status: GOOD (  18.94  )
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
Cc: "richard@nod.at" <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "nagasuresh12@gmail.com" <nagasuresh12@gmail.com>,
 Michal Simek <michals@xilinx.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Vignesh,

> -----Original Message-----
> From: linux-spi-owner@vger.kernel.org <linux-spi-owner@vger.kernel.org> On Behalf Of
> Vignesh Raghavendra
> Sent: Friday, March 8, 2019 10:20 AM
> To: Naga Sureshkumar Relli <nagasure@xilinx.com>; broonie@kernel.org;
> bbrezillon@kernel.org
> Cc: linux-spi@vger.kernel.org; dwmw2@infradead.org; marek.vasut@gmail.com;
> richard@nod.at; linux-mtd@lists.infradead.org; linux-kernel@vger.kernel.org; Michal Simek
> <michals@xilinx.com>; nagasuresh12@gmail.com
> Subject: Re: [RFC PATCH 2/2] spi: spi-mem: Add support for Zynq QSPI controller
> 
> 
> 
> On 01/03/19 4:32 PM, Naga Sureshkumar Relli wrote:
> >>> +static bool zynq_qspi_supports_op(struct spi_mem *mem,
> >>> +				  const struct spi_mem_op *op)
> >>> +{
> >>> +	int ret;
> >>> +
> >>> +	ret = zynq_qspi_check_buswidth(op->cmd.buswidth);
> >>> +
> >>> +	if (op->addr.nbytes)
> >>> +		ret |= zynq_qspi_check_buswidth(op->addr.buswidth);
> >>> +
> >>> +	if (op->dummy.nbytes)
> >>> +		ret |= zynq_qspi_check_buswidth(op->dummy.buswidth);
> >>> +
> >>> +	if (op->data.nbytes)
> >>> +		ret |= zynq_qspi_check_buswidth(op->data.buswidth);
> >>> +
> >>> +	if (ret)
> >>> +		return false;
> >>> +
> >> spi_mem_default_supports_op() already has this code.
> >> Could you change, spi_mem_supports_op() to call
> >> spi_mem_default_supports_op() first before controller specific
> >> ->supports_op()? So that, above code can be dropped.
> > Ok, I will update it.
> >>> +	/*
> >>> +	 * The number of address bytes should be equal to or less than 3 bytes.
> >>> +	 */
> >>> +	if (op->addr.nbytes > 3)
> >>> +		return false;
> >>> +
> >> Hmm, how does the driver handle flash devices >16MB in size? Not supported?
> > Zynq QSPI controller doesn't support 4 byte addressing.
> > So to support > 16MB size, we have to use EAR(extended address register).
> > As it is initial version of driver, I haven't added this code. This needs to be added in spi-nor.c.
> > Previously I have sent an RFC patch to support all these.
> > But Boris suggested to upstream the basic one first under spi-mem frame work.
> > Not only this support, there are other features like dual parallel and dual stacked.
> > All these features require additional support from spi-nor framework.
> > We have another QSPI controller on ZynqMP SOC, which is also similar(but it supports
> 4Byte addressing).
> > So by consolidating all these, I sent this patch.
> >
> > Please let me know your suggestion on this.
> 
> Sounds fine to me. Support for > 16MB flash using EAR can come later.
Thanks.
Shall I wait for others to review or go ahead by addressing your previous comments?

Thanks,
Naga Sureshkumar Relli
> 
> --
> Regards
> Vignesh
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
