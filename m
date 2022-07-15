Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC578C43334
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Jul 2022 15:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KzFq/PD/0mcbodef54N4ljveYNdfr2J28sFBU5mKjWo=; b=HYQRvu+Yym6CYa
	rg3D1gVKehPwmnBThpDdKGY0rbP/4kq/k6wjf0LaYgkffWIyyZ7UJO5s+1v+ZfTmaPaYZi3PhK9eJ
	UZC/tbgcVJm0RzoBL79z2ub7D8o39c94Rli87upqh/WteFMPGYD4d9SEwd7MxXlXLSTFGNv75GFJp
	cGj5uheKRLMfB0FPLYxb04IG2QsOVbGnJ437ONVZeB5f8AfEQVogQzKN/cScFudERb64W7vlQRdh2
	VZLqjPHgguPE6UYNU+3qOuzQP2QEdO17ocq+wU6Bv0/e4HlLFi5zw68XP6kRhpkYPuCWv1BaC4nCV
	KLwOANouVH/TsKSTzOjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCNMc-008Hm0-6B; Fri, 15 Jul 2022 15:36:22 +0000
Received: from mail-dm6nam12on2054.outbound.protection.outlook.com ([40.107.243.54] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCNMP-008HHl-9s; Fri, 15 Jul 2022 15:36:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bT2ITppzT+OXIdLRWGrQPdsMUMYsb19mxympZUXzvFI0Btn6SQuKaV4Qgjxkw4fNURX96Tc2UBDEYrPI1ekL1JIcrsq1AOYnwd/3GxI5YEXAtmXIkcEqlgakZIuDYie+Y2eNplF6vcBbT2TBad5mEoIfB9tHr9GC2G1l/JyycfynrP5SEVOfi79NRHwiZez1mYaZudnkSyQxtHFcedFEGDmDQ/b6kQSYUUCkDPQOoLT5U5nJq4QaCt/QBfgDA2sjq4gdHiEplzPbt5i+mIUI9C9nlv1HfAEcn1i79J3E9E+67V3OMu40W3veDO3stw2+jk2SmznRXdT8xUHcT8ka9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cDYmd+1FQ7QMFmpXFRip0Hi4q5QS9uZ6m1ibE3JabEo=;
 b=kFYWxzuIm1gUHakfkms/Kf1qQBHQkRqVBRzh8CKesZnX5CqKOnYWhdSpBkleNLxC+U3JL4xbni/Rq54myedZACDr2+N00zKeS47shxsJO3ZwfEpj5ie7sVV4yo8dowC2/9d59/Y+GkbkrKxy3NsGPuKr7GA3ogW2SpkYSX4tTzlwfAMD0oFuYyvFrDCnyFK4lZ5yTQ7X8y3OPfVJ4QhO75zYFi8TLH3kGNR4NPncwt00xDRR9IL8xdO1JgCWz5vBEDW8MyH29ffS7JX7B5oGaRh9O5fCbGcRDUJSNRjVkomrcb9fap1frhWoDZ2QQ4ojPvHlYYqAKpJzuOvAwxRFVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cDYmd+1FQ7QMFmpXFRip0Hi4q5QS9uZ6m1ibE3JabEo=;
 b=HNWZxcLmRnBM1GMA0qcBuDD3uk3sfStzLhQ95DNhaa6KCUMKfP155Hg+FEzY/Vx93/9SqsuE1un+7nJu86dgZnavCgAsrH5phVyyy/zFUgCB0KdvqTftr1etErLsktJYVQebAMwVSII/+PyXefHKsSb7GVNIl6OfQJEn7QJuhd0=
Received: from DM6PR12MB2809.namprd12.prod.outlook.com (2603:10b6:5:4a::16) by
 CH2PR12MB4937.namprd12.prod.outlook.com (2603:10b6:610:64::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.20; Fri, 15 Jul 2022 15:35:50 +0000
Received: from DM6PR12MB2809.namprd12.prod.outlook.com
 ([fe80::fcd1:f8aa:6c69:eacb]) by DM6PR12MB2809.namprd12.prod.outlook.com
 ([fe80::fcd1:f8aa:6c69:eacb%5]) with mapi id 15.20.5438.015; Fri, 15 Jul 2022
 15:35:49 +0000
From: "Mahapatra, Amit Kumar" <amit.kumar-mahapatra@amd.com>
To: Mark Brown <broonie@kernel.org>
CC: Amit Kumar Mahapatra <amit.kumar-mahapatra@xilinx.com>, "p.yadav@ti.com"
	<p.yadav@ti.com>, "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
	"richard@nod.at" <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
	"git@xilinx.com" <git@xilinx.com>, "michal.simek@xilinx.com"
	<michal.simek@xilinx.com>, "linux-spi@vger.kernel.org"
	<linux-spi@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "michael@walle.cc" <michael@walle.cc>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "git
 (AMD-Xilinx)" <git@amd.com>, "Mahapatra, Amit Kumar"
	<amit.kumar-mahapatra@amd.com>
Subject: RE: [RFC PATCH 1/2] spi: Add multiple CS support for a single SPI
 device
Thread-Topic: [RFC PATCH 1/2] spi: Add multiple CS support for a single SPI
 device
Thread-Index: AQHYeZhXApErq+32kkmuJFVVfXogSAG7F8aMAeAoVR+snXQgIICishAAgCJ4JhA=
Date: Fri, 15 Jul 2022 15:35:49 +0000
Message-ID:  <DM6PR12MB28091BEB013B6F1903B5CDE3DC8B9@DM6PR12MB2809.namprd12.prod.outlook.com>
References: <20220606112607.20800-1-amit.kumar-mahapatra@xilinx.com>
 <20220606112607.20800-2-amit.kumar-mahapatra@xilinx.com>
 <YqHfccvhy7e5Bc6m@sirena.org.uk>
 <DM6PR12MB2809F6C7D80B60556218D627DCB59@DM6PR12MB2809.namprd12.prod.outlook.com>
 <YrRXTrYN3BuShbzg@sirena.org.uk>
In-Reply-To: <YrRXTrYN3BuShbzg@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f33014ad-b0b9-41e1-981e-08da6677b1f9
x-ms-traffictypediagnostic: CH2PR12MB4937:EE_
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  hF4Aui7lDDBBTgCeOE5whNL8obJ79TtUNYERNmtbs2A1mlqrMqXDwqKK8LN81rLg8O+dQE6Il2/7siPxOqi954BIFJzXAF/VMCyzmeyxrE0WLK/0kAc3JtgVOUIr0O6kTgEEE0Y+kBjMdmmbl+5pakDxzwrEuYlpnxel8jIHIPkKTv9mZBMcgze3D38ey+kiRxPiqOWA/0zhSfduNy5SdWpoUAZGNhGmSwRajGf1BTqPmbIbDXlVjSHqSjGF8bO9lpezB54jLOTD8DJc+VodqiDwvZssjJl4l2W9KYVn5NbWw5ug0OitN/MpWfrFFlWNL9UQWT+01VoyJOoPie2lkFTXJGcW/AZhx3iK7uIYD1ccu2b/fGvoGNoTVozx65nmmQf9ywM3Efk9qryHcXsEX8dPzisjBg8L96upnTb0ux3qye5rdk9Udouc5kPWikwrlAYvljs6gMJrtEdh9k7eK3eVdrNPwOMgXuolHM8g1vmabUOjDNA9jLZqLt8JnElRWMeILUqUhuXiq5luAr6P/ngPNVcrmUvVXx6nFB/59BID2N2HXRu8VPPDIbRJVMf8pi8RoXaFDRfPvmxbG7mJmnOI/JhJk5uzW+3IHqMTLd0/85iKcWxgTyybxC+zZcpVSEizmfHtto99CWTuI3LjUFZWmNxIHNzUnB9Cxo1XkHLLamr6P6hkFmvuGhnghvoZMoDK3GxNu8S5W6O9YIAu3uoxcQASYgFV/qJAtOOT7J1z/UdmyO9pPpST2oCYVnFPWoQ2ErPdeTAVuQndKFDDHxk2dzuaJ9/ceLEnYnvOk6hWMcnM8Wv2RyPLYl7JFeCq
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2809.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(376002)(396003)(366004)(39860400002)(64756008)(66556008)(53546011)(8676002)(41300700001)(26005)(4326008)(2906002)(8936002)(66946007)(66446008)(6916009)(6506007)(9686003)(55016003)(478600001)(76116006)(316002)(71200400001)(66476007)(54906003)(86362001)(7696005)(38100700002)(38070700005)(122000001)(52536014)(7416002)(5660300002)(33656002)(83380400001)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?r5C9uW3wjnWG7x92+3NKg1RvDRR9R1xfuflz0iQJ+UEB+MSOB73IkXAwiIyo?=
 =?us-ascii?Q?Ijd/YvvNzF/55aHrw6HC6gKRTKCGs+w5nQcoYdpPVN4rGHAANxINDuI8vbEh?=
 =?us-ascii?Q?9VkRPZxrKDGNvF9p//IrklofYDWzsnHNsiZuf3+NmSZDnmrTvYeCjPZbZJaw?=
 =?us-ascii?Q?X9ryNtun1rUK65q86g43wt92rCETR0fhHeBxRwSp2PIJ+d6YXxq4AuWxUct/?=
 =?us-ascii?Q?IDy13Hg8p8tgLW7Rpahx6ad2iDuYIyDxAeWdKxW2ViZ9jC9XndoX/5jv9ymf?=
 =?us-ascii?Q?w45EFfzzt+CRBIj+vv7/KHbC6LUfyYpXTFopI4aFfGgYkqQYES+9+Q3oQ93e?=
 =?us-ascii?Q?jYGb3Sn0e4a+JqxuZGIvEzgRLP08qNcclLooNYGEDD0XfLRKdhQmA42s3/X9?=
 =?us-ascii?Q?rV5KSv/WtJAnaNhoVKEuz8ESbzolqpIciJX83lHd3/Lsms1uwb+7ASQpb9Qa?=
 =?us-ascii?Q?zU0YeLZk8C84aOBFph5zUcO5hzEXMjvZRlmQ4eouYzUrcyFnxmbglGmn8uUv?=
 =?us-ascii?Q?Xzl11DBEwnqU5rcj/tmkKjeR03Xz6ZOR3Irxxt7AGFeoWnG1bGWfWu4RYFkU?=
 =?us-ascii?Q?AR1asSte2G9N/Sj6uymP+R40NDOF5lpH9fjbYjrTzD+l7Jk2Dn+WTuDqOxuL?=
 =?us-ascii?Q?QzM0A4boPcICY+LGokE1ra9yCIDNnF7PtJiXfSOB3Kw3R4ewFq00wt9XtH+i?=
 =?us-ascii?Q?xB2ajQX2fDwpHgclyn3qOJfCjEuZjDdeVNEEp/p2fRpBQdQ0wngr+EBExv/e?=
 =?us-ascii?Q?+w0MZO2LBU4S2gR4PmzRKeBQGkVpFEAXPBUnfsiG1AE6vlklYMZOuxLsqVil?=
 =?us-ascii?Q?4Y6i9JxE+gVac5N83CFrwr2318M65Z1f74JzzTrsV9H+m4Wk84mcy44DkbhM?=
 =?us-ascii?Q?0wOeUYk28wAe8yX0gaPOFUKhQf7mDusYxEiYKxZqM9u5ExSdY0NpTrpEyFSw?=
 =?us-ascii?Q?T3HDcLi4kX3TOVZTCG0LlmpX/pfXrhzNBWayvuuXMriBglOgPAWddxlIWAcc?=
 =?us-ascii?Q?9a1G8IHgxhhnuvLYVSTZKdxff/of8usBXLu1OJz9GCZtoONCzXe+jklOn+me?=
 =?us-ascii?Q?eLKfYybUv9Mx/nCjWF3kPNGUkzR6WG3hajIe3JIM7nq+7HmTKL/GtZ+CNzbD?=
 =?us-ascii?Q?k9tlgE9ujVAI7jHy3sBedTkOHeLKZ1hY1PrA8rn9OZKn+nDS6omUhtNhkyRX?=
 =?us-ascii?Q?l5xAVAjlV5D77jhAuByzVTVkq6UWBIPPW/xsnf6WalHwUG0W6Lh4vWRVPJB+?=
 =?us-ascii?Q?YEL7RK3aS3ZcAp4u7Yox2QnOXeiZ3QShb7DfIJDMqtAih7LpaKDiEJM58jCI?=
 =?us-ascii?Q?D1oIhhuO2vXDr5AuEBW8Hwfj4ojxrnzjzFQQ/d0jY0dlWWwW8QdS0nhecn/6?=
 =?us-ascii?Q?B3AldaZVOo19MhnuKmiWN2ABC8Gi08CXBdVTBysaAJQ5hNB3QsWcYL+yM+iz?=
 =?us-ascii?Q?BBDdaiTVsnMbNKA283AQJOC78lN7BQNTNSuERVYRe7vpsR5emPrPGPIKYL/9?=
 =?us-ascii?Q?aW9Uk7phVWsYZ9EhpCXSmFWzijNYTZpAV3Ztiv8BSYtdpx9W83tNRKiJKzhG?=
 =?us-ascii?Q?EKlfhTHycSf03fEM0Xw=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2809.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f33014ad-b0b9-41e1-981e-08da6677b1f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2022 15:35:49.8787
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HY7lR6YttW1uv2LwnDVu6uDdMDvIdpn/yl2iEkUZRklV4XrGQNutolKxnJbDdC9dkv4grpaJhx3hDIqcGZ+Ymw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4937
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_083609_395568_81C7E7A4 
X-CRM114-Status: GOOD (  26.71  )
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

Hello Mark,

> -----Original Message-----
> From: Mark Brown <broonie@kernel.org>
> Sent: Thursday, June 23, 2022 5:37 PM
> To: Mahapatra, Amit Kumar <amit.kumar-mahapatra@amd.com>
> Cc: Amit Kumar Mahapatra <amit.kumar-mahapatra@xilinx.com>;
> p.yadav@ti.com; miquel.raynal@bootlin.com; richard@nod.at;
> vigneshr@ti.com; git@xilinx.com; michal.simek@xilinx.com; linux-
> spi@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org; michael@walle.cc; linux-mtd@lists.infradead.org;
> git (AMD-Xilinx) <git@amd.com>
> Subject: Re: [RFC PATCH 1/2] spi: Add multiple CS support for a single SPI
> device
> 
> On Thu, Jun 23, 2022 at 11:39:19AM +0000, Mahapatra, Amit Kumar wrote:
> 
> > > >  	/* Mode (clock phase/polarity/etc.) */
> > > >  	if (of_property_read_bool(nc, "spi-cpha"))
> 
> > > This is changing the DT binding but doesn't have any updates to the
> > > binding document.  The binding code also doesn't validate that we
> > > don't have too many chip selects.
> 
> > The following updates are done in the binding documents for adding
> > multiple CS support:
> > In jedec,spi-nor.yaml file " maxItems " of the "reg" DT property has
> > been updated to accommodate two CS per SPI device.
> 
> This is a change to a binding for a specific driver, this is changing the SPI
> core.
> 
> > > I'm also not seeing anything here that checks that the driver
> > > supports multiple chip selects - it seems like something that's
> > > going to cause issues and we should probably have something to handle
> that situation.
> 
> > In my approach the chip select member (chip_select) of the spi_device
> > structure is changed to an array (chip_select[2]). This array is used
> > to store the CS values coming from the "reg" DT property.
> > In case of multiple chip selects  spi->chip_slect[0] will hold CS0
> > value &
> > spi->chip_select[1] wil hold CS1 value.
> > In case of single chip select the spi->chip_select[0] will hold the chip select
> value.
> 
> That doesn't address the issue, the issue is checking that the driver can
> support multiple chip selects.

To address this issue, in spi core we will check the number of items 
in the "reg" property of the flash node(which is nothing but the 
number of chip selects) against the "num-cs" property of the spi 
controller(which is total number of chip selects supported by the 
controller). If the number of items mentioned in the "reg" property 
is greater than "num-cs" value then we error out.

For eg.,

rc = of_property_read_variable_u32_array(nc, "reg", &cs[0], 1, 
						SPI_CS_CNT_MAX);
if(rc > ctlr->num_chipselect) {
	dev_err(&ctlr->dev, "%pOF has invalid 'reg' property (%d)\n", 
							nc, rc);
	return -EINVAL;
}

Please let us know if you have any other approach in mind.

Regards,
Amit

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
