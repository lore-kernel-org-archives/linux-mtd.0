Return-Path: <SRS0=SuWK=44=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77B3AC10F27
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 10:46:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37F2A21655
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 10:46:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mYsWtCaO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=micron.com header.i=@micron.com header.b="vPQwHgJL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37F2A21655
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=micron.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tMYMmgJbTcwjCjijn1HUMgcLpsimLc9nOaWKAiGWdbQ=; b=mYsWtCaO7m0+rg
	PYwnUJwMCBSuh14TEBLNGt3c0RQkWOKmYrDBkR/y6Y3SsvtlqoO4NfLoG72hXBblM2C9JfUHMHEN9
	6JQRTrV2nDZQTXDesXSJ+r8r+Y5cyoGoAEl88Z/SOaHA7j9COKYMurv0LcvswId+6XSyun7lSp6MS
	Egd5jtc6MODBGcGa76HsNqQcZ8404Bkgqe+3463yb3CpMu+TeXpSYllFLiDmB9cKlcrhdxkUN5ckY
	OEd1cGTP/aoA6ZkkSJlzY5Y/CU/RPPO/Zmm8oQotB9WhQqjhqGDwgiew9hliXLxJMMagRJ9+ZJkdt
	Peye9Q2mfPiZrnnVFQWw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBysT-0005V4-7g; Wed, 11 Mar 2020 10:46:17 +0000
Received: from mail-bn8nam12on2067.outbound.protection.outlook.com
 ([40.107.237.67] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBysQ-0005Th-2d
 for linux-mtd@lists.infradead.org; Wed, 11 Mar 2020 10:46:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n2Oc/Fla7MYHcdTjwS4Lvha+3iLDAdTsYJF1lp91LA8GEd0cuqVj4JElnOndQyDwqFZJp+1YnOaUmDjQT1KXEAeLgl+8gqe5a3jjXJ+gAQ4xkGiSlB0Gtqx6STfE0gsbgLI3Ms3EYLhinGWfAzCDGI7CSNJkI49HWRiL1NrjiwwuJKgKA2kwZHb5DEKw1Dacx5NGidxAjbXMjbw/rKETK7Ng7uhg0NbHJeW79t0bYVlv8hlQBfOPquq4Iu4job2L0yDhRCOZtoxlH/875+SMez0qwj5+bTUnjGNULM1mQDr6o1VfNEaSaxxxlq4tj2I3nIHjf3NfG36zuX/D6tRLwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y7zrrZy+C/nbNfF/QoVkp0ypT1XtO38jMkqz/R2+qjc=;
 b=jOeJgtP5G7Po6Tn61llPzCoAo0+JKq0Z08BO8nmBAB1JuV50aavR4IRB5pnTf6BEc+j+0j0eqCJCooCkErXExGyijhyAYOgKR1HxW0q9iowoHoF/nnYgKDMplVF2gNY/39lhJkjflRaLThEq6rgMeBi2POkSJ1t8b/YnlGiNbPrp+ehvm+PY0IRSIZndcfdv2Kw2QEdOUuvVGq6n3oKKV59iTfYOBNMydZqHGYDdYK6eq/JKpv+8hcjykFChhBrwGsn1aRMMNV517ZQvBuJZIGZNFgEILvDskJE9EpZtTv52X2S1s8Bcves8nQjLn4CA4A9nXE0u+cD+rceVqBvsbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=micron.com; dmarc=pass action=none header.from=micron.com;
 dkim=pass header.d=micron.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=micron.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y7zrrZy+C/nbNfF/QoVkp0ypT1XtO38jMkqz/R2+qjc=;
 b=vPQwHgJLYM4ujfZ36hxhjJYi89CpGSqegYL5mvNl1Bx7HcsZM/Qe0PFSr7IpqbY4CMiCBc9I2xaXyU6wLyE89vBbafZ9s8gm87f2P8SkrhZ2DGGdpnf7lr+TXh2yyOkoLipP9OJj5KWXG3SXXZOw3TshT2lHhUzi6/lS/Wjjkgc=
Received: from MN2PR08MB6397.namprd08.prod.outlook.com (2603:10b6:208:1aa::10)
 by MN2PR08MB6173.namprd08.prod.outlook.com (2603:10b6:208:11d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.15; Wed, 11 Mar
 2020 10:46:10 +0000
Received: from MN2PR08MB6397.namprd08.prod.outlook.com
 ([fe80::884a:b0f5:3cf5:f4a4]) by MN2PR08MB6397.namprd08.prod.outlook.com
 ([fe80::884a:b0f5:3cf5:f4a4%4]) with mapi id 15.20.2793.018; Wed, 11 Mar 2020
 10:46:10 +0000
From: "Shivamurthy Shastri (sshivamurthy)" <sshivamurthy@micron.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: RE: [EXT] [PATCH v6 0/6] Add new series Micron SPI NAND devices
Thread-Topic: [EXT] [PATCH v6 0/6] Add new series Micron SPI NAND devices
Thread-Index: AQHV9gmnJCpFuJN0LkOTHmMRqJbTd6hDJ4lA
Date: Wed, 11 Mar 2020 10:46:10 +0000
Message-ID: <MN2PR08MB6397D2050B70490F28AFEAABB8FC0@MN2PR08MB6397.namprd08.prod.outlook.com>
References: <20200309115230.7207-1-sshivamurthy@micron.com>
In-Reply-To: <20200309115230.7207-1-sshivamurthy@micron.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-rorf: true
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcc3NoaXZhbXVydGh5XGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctODMxNjVjYTEtNjM4NS0xMWVhLWIxZWEtOTgzYjhmNzQ1MjUxXGFtZS10ZXN0XDgzMTY1Y2EzLTYzODUtMTFlYS1iMWVhLTk4M2I4Zjc0NTI1MWJvZHkudHh0IiBzej0iMjk5OCIgdD0iMTMyMjgzOTcxNjc5NDczMjU1IiBoPSJFNWJiWU10UEh2dHVNWUg5aTZ3a3VTUWtEc0k9IiBpZD0iIiBibD0iMCIgYm89IjEiIGNpPSJjQUFBQUVSSFUxUlNSVUZOQ2dVQUFIQUFBQUJuem01Rmt2ZlZBUmNCNitmOWV6amdGd0hyNS8xN09PQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUJBQUFCQUFBQUlTQjI1d0FBQUFBQUFBQUFBQUFBQUE9PSIvPjwvbWV0YT4=
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=sshivamurthy@micron.com; 
x-originating-ip: [165.225.86.136]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c296afdc-141e-4ef0-249e-08d7c5a9697c
x-ms-traffictypediagnostic: MN2PR08MB6173:|MN2PR08MB6173:|MN2PR08MB6173:
x-microsoft-antispam-prvs: <MN2PR08MB617352620B04D63325994CAEB8FC0@MN2PR08MB6173.namprd08.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:1824;
x-forefront-prvs: 0339F89554
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(39860400002)(396003)(346002)(136003)(199004)(8936002)(55236004)(186003)(8676002)(86362001)(71200400001)(316002)(33656002)(81156014)(81166006)(7696005)(54906003)(6506007)(2906002)(4326008)(5660300002)(66476007)(9686003)(76116006)(55016002)(66446008)(966005)(66556008)(6916009)(52536014)(66946007)(26005)(64756008)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR08MB6173;
 H:MN2PR08MB6397.namprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
received-spf: None (protection.outlook.com: micron.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HqAW16m6SRrIiNHOMKdCMA3+xXUFIp7mOA3LjWvc1eHM8MwYA3qse6tba6vp/8o2Zb9yRvqtK7mrEKiz+CeCMa4mg9sv9wCAv99WFRbddXEA5VSoknlRJH8gCZccEJUD5Xl0Y626j9nNx0Lnw7jrFPWHYT8sstYh+/zwtgWNF/zw9AbOY3WDQRiOIm8yH1vQA3uHz/SpLEgcBmk/bq5FO4+UxdyjT1srEu7sSP1oR0nlb0NE22pebtGtFGjM0X41RTR3zzJqdERaYbozUByYcZYIGrJIT6EPanUoY+85Qx8PADra3qBKeq6vZypdr3Ttk3cOjeVzoLbzzAuvsWzgZZ6q3YzpCcvzBsAVax/nUPK3ph6PW0tfkDf8OnEIptYWCLM55EAmE9X32PChN7pLY26Wuu5SrcP8ZSarqGrK7DLokbt3z5POqBy4VhfzNovhdAJ3WoOgKurmyY0jQq7VSZ2Z9PKaGbZgE71Fl6wzfLYwzMKTQYaYfanTzrds42hmSiToJIMvPJEtGuzWuvTaSg==
x-ms-exchange-antispam-messagedata: OFVrI9Xk5LlOg+48Aai2fP7/0w84NJ4+XZdR0DGbaTvRUf/qJeHbUIlF/iLH+XG6UmEtSlqCnCBAzBnPv1/W5VvlaOaRsOxEJYs+aAij2rjibl6RUXBkpkb73IRtVwMpFq7Wy8lBTCtoF6wbjLB5gA==
MIME-Version: 1.0
X-OriginatorOrg: micron.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c296afdc-141e-4ef0-249e-08d7c5a9697c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2020 10:46:10.4345 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f38a5ecd-2813-4862-b11b-ac1d563c806f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kgp5MZ//c6T0IbtKJrnJH71JWKTdtv2SvORacaMC8TBipaDx+At8RuTEnzoM/lPoBXrK3vPHEDVjD0MGrpWk/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR08MB6173
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_034614_190966_CF8C1007 
X-CRM114-Status: GOOD (  12.52  )
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
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel,

I have rebased these patches to v5.6-rc1 as you suggested.
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
>  drivers/mtd/nand/spi/micron.c | 150
> ++++++++++++++++++++++++++++++----
>  include/linux/mtd/spinand.h   |   1 +
>  2 files changed, 137 insertions(+), 14 deletions(-)
> 
> --
> 2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
