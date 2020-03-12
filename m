Return-Path: <SRS0=7qHi=45=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E221BC10DCE
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Mar 2020 19:17:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B881F20716
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Mar 2020 19:17:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rq8POZ6W";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=micron.com header.i=@micron.com header.b="0aiWvHNU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B881F20716
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=micron.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cIVSemUtRyPwz6uqh/KM1dHMwMmfRgCt71Ow84xprQg=; b=rq8POZ6W+tUAxj
	4uqG/oVTUFeG+IRvHDbY0L3QqA3T3lBNUxn0BvmxPuKwV0Qfcl24yKmz15JCAd4yK5NQ/2HG43/zV
	W9sfyjwJ5VB2gabdhCXk4g9zSlWHw5Z8zB4JGjNjKdcLIwmMHNrO3WggqkCNeWh0/8U7HkKNct1DQ
	DfvF2sHOyTSvNmdtFStmjoOCucz6ybJo+s5V8OTcEGAuXloKUzIF8Fyuy+M5szbpoSOWfICg9nkq9
	OFkHE2LhNbbwHNQeKvzg/NCnEgFc20iU2bGfOWtYMlr5U9BUHt35wvTMHdI3R0VaGFb/QVO5Id9xy
	3x9QutgMm+/YdkJfIepw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCTKI-0003k1-Ag; Thu, 12 Mar 2020 19:17:02 +0000
Received: from mail-co1nam11on2076.outbound.protection.outlook.com
 ([40.107.220.76] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCTKC-0003jI-V5
 for linux-mtd@lists.infradead.org; Thu, 12 Mar 2020 19:16:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a9yRUoGhyk10D2Zj5zwA/PETCkNa6BVQhMs7CFF2XPOU72NBi0svLUzj76zGiWPBWxRVddSGhmn7AreFn+g59v20mAwY/HatR/l/RlJEXfp+y3W7b81Rvr0VYrt/z8Cve9A+ibdQvfyE5bi0aADv5zb0zKIok+QzOA330XUfnlOzsl5/nl48ug16KMyePfzrqN6JbJQJjYmXkFb9BdGKOSpLV7e7uZYqKl34GAvadMO1kWoiFL77fqRaJ7TraD+veaMfIY/KUkySs4gRUkyNJBYTQidPTfNZgRZQaeL/NJreyuW1LuB/YAT49Qld4ACo+redHKJ/Vy+pOHAVrzYHNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NUXBb/9N2TsKphU2iB9zpIe14AmpkHTSsefnkBJ+TiE=;
 b=MBBIQGGIB9VQ0aqyghTtRJSjLZdej2DcoJx3VEMNmGXeiW4dnC7EdWAEbn8N8pATc/kKs1E2wnN6PjvtpgdMcM8Xl8qzolfWpv2goZK5cG0PdrTvkTCpbUexxIahjQPJuvzJRLKkFrtu3gTzhFlP6mvpJtkRWYnDzHAjl1YqoToBmnU5IrIH9RoUAYAI+viW3VK2ray6CoUkLp2HdB/P1aPgq1DjbLOd/cG8JbMCG+BeLwfbBQh5rlUOxNNqy3UpAAwuB1ryrCTKirAvQGX4AAduJdiM6OHLCJIAA3s7iofmJIswRiT1MqYiuDT0WlLKfcvoAXIG/RHvO7i3D6sl7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=micron.com; dmarc=pass action=none header.from=micron.com;
 dkim=pass header.d=micron.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=micron.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NUXBb/9N2TsKphU2iB9zpIe14AmpkHTSsefnkBJ+TiE=;
 b=0aiWvHNUykiWZ4GGYEuWkaDfo65/mvKpdNM9U+8v56lBoip66VH1iwSdBGK5ekTePCtArvGuaoL62Q/1wMSUfaKysknClzVsefAlrPzTfXzDh30kdfJMpCYqpjobsFOUFCPmKyY5KJiPTfZmNWQRZuX3Lotr6ZOY/KBY5ZmXxJU=
Received: from MN2PR08MB6397.namprd08.prod.outlook.com (2603:10b6:208:1aa::10)
 by MN2PR08MB5983.namprd08.prod.outlook.com (2603:10b6:208:113::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.17; Thu, 12 Mar
 2020 19:16:53 +0000
Received: from MN2PR08MB6397.namprd08.prod.outlook.com
 ([fe80::884a:b0f5:3cf5:f4a4]) by MN2PR08MB6397.namprd08.prod.outlook.com
 ([fe80::884a:b0f5:3cf5:f4a4%4]) with mapi id 15.20.2793.018; Thu, 12 Mar 2020
 19:16:53 +0000
From: "Shivamurthy Shastri (sshivamurthy)" <sshivamurthy@micron.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: RE: [EXT] [PATCH v7 0/6] Add new series Micron SPI NAND devices
Thread-Topic: [EXT] [PATCH v7 0/6] Add new series Micron SPI NAND devices
Thread-Index: AQHV9866uhwb+Mv+wkqSrWiS3pCYoqhFVTeg
Date: Thu, 12 Mar 2020 19:16:52 +0000
Message-ID: <MN2PR08MB63972889C83C279694ACDF85B8FD0@MN2PR08MB6397.namprd08.prod.outlook.com>
References: <20200311175735.2007-1-sshivamurthy@micron.com>
In-Reply-To: <20200311175735.2007-1-sshivamurthy@micron.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-rorf: true
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcc3NoaXZhbXVydGh5XGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctMDVlYWE5Y2EtNjQ5Ni0xMWVhLWIxZWEtOTgzYjhmNzQ1MjUxXGFtZS10ZXN0XDA1ZWFhOWNjLTY0OTYtMTFlYS1iMWVhLTk4M2I4Zjc0NTI1MWJvZHkudHh0IiBzej0iMzEyMCIgdD0iMTMyMjg1MTQyMTA1NTE0NjAyIiBoPSJSUytUZlRwMFhVQ3lBeFF4M2ZJbGNMazJpQXc9IiBpZD0iIiBibD0iMCIgYm89IjEiIGNpPSJjQUFBQUVSSFUxUlNSVUZOQ2dVQUFIQUFBQUJxNGtMSW92alZBV01GTER1YlFUem5Zd1VzTzV0QlBPY0FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUJBQUFCQUFBQUlTQjI1d0FBQUFBQUFBQUFBQUFBQUE9PSIvPjwvbWV0YT4=
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=sshivamurthy@micron.com; 
x-originating-ip: [165.225.86.96]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c7506013-090d-46c7-7541-08d7c6b9ec36
x-ms-traffictypediagnostic: MN2PR08MB5983:|MN2PR08MB5983:|MN2PR08MB5983:
x-microsoft-antispam-prvs: <MN2PR08MB59837D5AB815CABFEF664480B8FD0@MN2PR08MB5983.namprd08.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:1468;
x-forefront-prvs: 0340850FCD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(136003)(376002)(366004)(396003)(199004)(33656002)(55236004)(76116006)(966005)(66556008)(66946007)(71200400001)(66446008)(478600001)(66476007)(6916009)(64756008)(26005)(186003)(5660300002)(81166006)(81156014)(8676002)(86362001)(8936002)(6506007)(2906002)(7696005)(54906003)(316002)(55016002)(4326008)(9686003)(52536014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR08MB5983;
 H:MN2PR08MB6397.namprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
received-spf: None (protection.outlook.com: micron.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rM27sZSSxJxkMFHll2HQ5rRqayFSp6hi/TyBJ5XocMVHsjlDgNvChL9qFYRk80GRycm9J6brHXDZItaWbWNunVV8ssAdELt3gTT4G4wn/v98VRpZKKgFDLqeHiO0Gfna2V1MiGMO+8WTIfvTeD/psbkd1B50NHXYgVFn59cQI7H7Byarg051BsWlFjZxTMt3BQCiBiRvIxd0eGGQJHVH79yVzA6mQgIuIb+iaxJ5eWkhHNyhBz8L7Jn2BLBQ9mIISWiPdDtzXO95kPzirc1nT7jcgjAiiIZ2WuJ/gEUSaT2tGPwrOGWShL4ATgpBeeRcNL+V5M2bLXogeu6UHyi0kagsdRcxypKkz2W5syhSQxp0hTvGzt4v1RK8GSZsdIjTryBI02onT+zEzrXrlf8MwfhMmVCzWMDnefWFcA2so06PdY4y22v/nPfbGHHws+BDetdZr9aIL9Q9Ic5Ynivz9r741m6u2IdH738WL8IFCqowZchqiZ36A9BWpzzSeN8SFQCcDB2dPrspEiVSEw6Tlg==
x-ms-exchange-antispam-messagedata: FVEc6cTS2zFY9ZVMKFIzVXBxuJlgvuikHuZp3T6kOxSt6NALm6bQp7kNYGB+GGMNSS+UDLJqDdqotd6Q0sBKWa5fh/UORzqxRDMVrlr9umc1kCysnuj/dthgi+VofV/uTDOHkzG/skpVLUPwdL5WcA==
MIME-Version: 1.0
X-OriginatorOrg: micron.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7506013-090d-46c7-7541-08d7c6b9ec36
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2020 19:16:52.9709 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f38a5ecd-2813-4862-b11b-ac1d563c806f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BNkJymU/zkn4muSCPSzabRWTYnpcdWTnZSUjwoqE39CugvA6Yc4mWRJFfPi7dV9KrpYI3GkKr2AuFNBXU9SGYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR08MB5983
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200312_121657_073912_F77A37A0 
X-CRM114-Status: GOOD (  12.90  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 "shiva.linuxworks@gmail.com" <shiva.linuxworks@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Chuanhong Guo <gch981213@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel,

I have rebased these patches to nand/next as you suggested.
Please let me know, if there is still a problem.

Thanks,
Shiva

> 
> From: Shivamurthy Shastri <sshivamurthy@micron.com>
> 
> This patchset is for the new series of Micron SPI NAND devices, and the
> following links are their datasheets.
> 
> M78A:
> [1] https://www.micron.com/~/media/documents/products/data-
> sheet/nand-flash/70-series/m78a_1gb_3v_nand_spi.pdf
> [2] https://www.micron.com/~/media/documents/products/data-
> sheet/nand-flash/70-series/m78a_1gb_1_8v_nand_spi.pdf
> 
> M79A:
> [3] https://www.micron.com/~/media/documents/products/data-
> sheet/nand-flash/70-series/m79a_2gb_1_8v_nand_spi.pdf
> [4] https://www.micron.com/~/media/documents/products/data-
> sheet/nand-flash/70-series/m79a_ddp_4gb_3v_nand_spi.pdf
> 
> M70A:
> [5] https://www.micron.com/~/media/documents/products/data-
> sheet/nand-flash/70-series/m70a_4gb_3v_nand_spi.pdf
> [6] https://www.micron.com/~/media/documents/products/data-
> sheet/nand-flash/70-series/m70a_4gb_1_8v_nand_spi.pdf
> [7] https://www.micron.com/~/media/documents/products/data-
> sheet/nand-flash/70-series/m70a_ddp_8gb_3v_nand_spi.pdf
> [8] https://www.micron.com/~/media/documents/products/data-
> sheet/nand-flash/70-series/m70a_ddp_8gb_1_8v_nand_spi.pdf
> 
> Changes since v6:
> -----------------
> 
> 1. Rebased series to nand/next.
> 2. Added Reviewed-by from Boris.
> 
> Changes since v5:
> -----------------
> 
> 1. Rebased series to v5.6-rc1.
> 
> Changes since v4:
> -----------------
> 
> 1. Patch 2 is separated into two as per the comment by Boris.
> 2. Renamed MICRON_CFG_CONTI_READ into MICRON_CFG_CR.
> 3. Reworked die selection function as per the comment by Boris.
> 
> Changes since v3:
> -----------------
> 
> 1. Patch 3 and 4 reworked as follows
>    - Patch 3 introducing the Continuous read feature
>    - Patch 4 adding devices with the feature
> 
> Changes since v2:
> -----------------
> 
> 1. Patch commit messages have been modified.
> 2. Handled devices with Continuous Read feature with vendor specific flag.
> 3. Reworked die selection function as per the comment.
> 
> Changes since v1:
> -----------------
> 
> 1. The patch split into multiple patches.
> 2. Added comments for selecting the die.
> 
> Shivamurthy Shastri (6):
>   mtd: spinand: micron: Generalize the OOB layout structure and function
>     names
>   mtd: spinand: micron: Describe the SPI NAND device MT29F2G01ABAGD
>   mtd: spinand: micron: Add new Micron SPI NAND devices
>   mtd: spinand: micron: identify SPI NAND device with Continuous Read
>     mode
>   mtd: spinand: micron: Add M70A series Micron SPI NAND devices
>   mtd: spinand: micron: Add new Micron SPI NAND devices with multiple
>     dies
> 
>  drivers/mtd/nand/spi/micron.c | 158
> +++++++++++++++++++++++++++++++---
>  include/linux/mtd/spinand.h   |   1 +
>  2 files changed, 145 insertions(+), 14 deletions(-)
> 
> --
> 2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
