Return-Path: <SRS0=SuWK=44=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5E35C0044D
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 17:34:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 206FB2072F
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 17:34:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s7hXzO6W";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=micron.com header.i=@micron.com header.b="HgpKqJid"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 206FB2072F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=micron.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sAE7l2WqUSt+n/WQ/K+L8HjlFtTinBxk+w16OPYYr1I=; b=s7hXzO6WtpmQDG
	MSta+RsgmbPfP2T0pwjNAi90lOlAencbODEVRmyx0ZQEi6q/1+PFubPMADQuSlBWwuU+joA8+hVdj
	DOFpEWk3nHVjqfjp6J3c3j5khX2uWUljTu9I3kA4TOwCKFvXWTNfDsLQsqxaPfVxJ7rYQ8Fhh/Yu5
	+HcdzaeYPvf1JT2VD0FI6ByjagI0s4gwDbZGt981ZSzFBvVZhYEsI9H0QMUgKdG3ovx72m6pkcfg5
	d+TRudt5lIgyw4LHlxeZlRtsktrv6zX2eZqoRkvHbWJb/oYyS95XCnsTpaL+7WupH4367ccf5K4Wa
	wIZvJsejq+5I3iTB/egQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jC5Eu-0000LS-Ul; Wed, 11 Mar 2020 17:33:52 +0000
Received: from mail-eopbgr750050.outbound.protection.outlook.com
 ([40.107.75.50] helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jC5Er-0000Jy-9c
 for linux-mtd@lists.infradead.org; Wed, 11 Mar 2020 17:33:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SqgdoSPvPd6gDO7S1yw8ErmHh23MiGNtL8Mm7lcSOyEqAfSv7MH755pCqrsD+qUAP8EBlhKjzUVnp8At/RNJkEgiCtSqyUfDPsmQ/TuktQWZ6m2vW55pGrIfSpwBxmo2lGeVaeaqczvfAKNgo+sc2LZsLuLsa+EaLyanzJIXKLzqh97O48FAGeRuu/Dg+iUYcVAR1IhFjKbExM6mKJpGq7YLeDv5wElA4NJlkTe51LKrTIJPxzb8qzhCFKX+Cz2vURtythgmo6FTqRQVhDG/vU5MQBfh6USpNUKYj3NIMhTV3KLQmXnbRyc3DOBXq/mFeAPOVxH0cLxi6EjaYNbHnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dWhV3jmCXxDWPeTdzbQSVVspoCjPdH5Uq6CkBDOgp2I=;
 b=IDqI9uZpJ7K/EaIUIQaZ/USb1bMLC3z2eQ4uuN2egf92CChP44vXpXsAXhdKP1K1KO1db3fnlgfep3OrmBKMs/4TDIcphiWGS8xGTd8oixRYcusy87tIcatqfTBRkB8cVt56AamaCl9tOPyIa3c7QhEn6QYAgy+xwOy79OXHDAr3CYXcZzBLlaARU7ICX4cCQokmbRkOOvg3o1RjH8RUSUP9K0TtldJIMxt0CJ9V7HPm02euyMLwdcvFdIMNckD+Q066l6KSBIjoC4ZWJY5/xS2Bzgz9eeBvKX2mxAWlJovtWQ4QDsuQv8yEBpSxDwS6z5iCV735exj2rJocAnNhgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=micron.com; dmarc=pass action=none header.from=micron.com;
 dkim=pass header.d=micron.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=micron.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dWhV3jmCXxDWPeTdzbQSVVspoCjPdH5Uq6CkBDOgp2I=;
 b=HgpKqJidu2Y5W9A4SSYggtF8GPBLusJKaLkvEUm/BYcGIbjaGtRqgP0hgdd39fMNt1/Tq/ZdCDWyMv0m+xsL64geXxN+DzAnBOT89YeS8OxttuJ20VFhWS9dao4U0syp2Sb2rExscHzB19Bv+UTEJCItIrKzVlIk19x4Zz4XueY=
Received: from MN2PR08MB6397.namprd08.prod.outlook.com (2603:10b6:208:1aa::10)
 by MN2PR08MB5936.namprd08.prod.outlook.com (2603:10b6:208:11a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.14; Wed, 11 Mar
 2020 17:33:41 +0000
Received: from MN2PR08MB6397.namprd08.prod.outlook.com
 ([fe80::884a:b0f5:3cf5:f4a4]) by MN2PR08MB6397.namprd08.prod.outlook.com
 ([fe80::884a:b0f5:3cf5:f4a4%4]) with mapi id 15.20.2793.018; Wed, 11 Mar 2020
 17:33:41 +0000
From: "Shivamurthy Shastri (sshivamurthy)" <sshivamurthy@micron.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Boris Brezillon
 <boris.brezillon@collabora.com>
Subject: RE: [EXT] Re: [PATCH v6 0/6] Add new series Micron SPI NAND devices
Thread-Topic: [EXT] Re: [PATCH v6 0/6] Add new series Micron SPI NAND devices
Thread-Index: AQHV97yqdMFOd0WUj0Kd2FcGzJVvLKhDpJ6Q
Date: Wed, 11 Mar 2020 17:33:41 +0000
Message-ID: <MN2PR08MB6397BAEC050EF2C1A9CE8CDAB8FC0@MN2PR08MB6397.namprd08.prod.outlook.com>
References: <20200309115230.7207-1-sshivamurthy@micron.com>
 <20200311164932.23cc7a42@xps13>
In-Reply-To: <20200311164932.23cc7a42@xps13>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-rorf: true
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcc3NoaXZhbXVydGh5XGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctNzE1YWU1ODctNjNiZS0xMWVhLWIxZWEtOTgzYjhmNzQ1MjUxXGFtZS10ZXN0XDcxNWFlNTg5LTYzYmUtMTFlYS1iMWVhLTk4M2I4Zjc0NTI1MWJvZHkudHh0IiBzej0iMjM0MSIgdD0iMTMyMjg0MjE2MTk1MDkyMTM1IiBoPSJOVHVwYk54WXdxbU5kaURRQ3ZIdkV5eFFMV009IiBpZD0iIiBibD0iMCIgYm89IjEiIGNpPSJjQUFBQUVSSFUxUlNSVUZOQ2dVQUFIQUFBQUNuRHJNenkvZlZBU3VBZ3YreE1QZGZLNENDLzdFdzkxOEFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUJBQUFCQUFBQUlTQjI1d0FBQUFBQUFBQUFBQUFBQUE9PSIvPjwvbWV0YT4=
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=sshivamurthy@micron.com; 
x-originating-ip: [165.225.86.136]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dc52d287-c8bf-445c-0c44-08d7c5e2576c
x-ms-traffictypediagnostic: MN2PR08MB5936:|MN2PR08MB5936:|MN2PR08MB5936:
x-microsoft-antispam-prvs: <MN2PR08MB5936EB61C70B962F6D849135B8FC0@MN2PR08MB5936.namprd08.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0339F89554
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(396003)(366004)(39860400002)(346002)(199004)(5660300002)(478600001)(966005)(2906002)(55236004)(7696005)(54906003)(81156014)(71200400001)(6506007)(8676002)(86362001)(81166006)(9686003)(110136005)(55016002)(4326008)(66446008)(64756008)(66556008)(66476007)(33656002)(316002)(66946007)(52536014)(26005)(76116006)(186003)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR08MB5936;
 H:MN2PR08MB6397.namprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
received-spf: None (protection.outlook.com: micron.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AjykihFX52q5/+Ha6jc1Jo9JnTpH0SMm9xiJZoFBGFLtF80HAG6jaCL7jHoM3Iw/Gfk5jcr5sFhnpwPYVX37TdaBLXsZ1JxyhBqc+OL4hvOMefBal6VmoMrO8lPKMfQbuHMcLFrsYItRI7Wr437+XATF4FXuAbQdR6w9JP7yGo3UP6TnF/jPdHbH8xiCHOQNcABLew+Ncd8/ch6BnaZtFnYJuniAUbcU5CFILs8IpbS8vyxi2gDGVZLA78YrIwQ3GzMyZqo9v03wd6rKYd2NcNYJbKemYyXI7D6bgdAExYQ2DPuuKhZSUOjywDDmcdbXdv4gYzfhx/XOri2BeY/8n0fX8tG2T5VIqNBrKthgHSAig1MOR9vyvBNck0wGLqDK93KgViwdnpAR4BBNM6H+xlYSFPZ98xZv4Zr+Zbfpaiu8Qzjvx4rJ8GjCPwOqp+7X04b6ZHzDwVaMajSDNScmWeAXnT9PSkq4mVKDQlQPCGiCZvods8mOcu01+vXY/oFIQMigDEK3UDdsKBAxpzviHQ==
x-ms-exchange-antispam-messagedata: 2ZBuwFxcJEFwmmZyzSSOOKQvIfHhMD547fYrnXroDtdnIeJ/j9GIhOFgwXsCGO3D4r5kV4fMVFxyG4dPfvWvuDrS9ZhMr0GhPdPdJLxMolM4w5yz+Htvy0w+Z0LH6hZxkNVbvNXsyCWaWFle+oH2lA==
MIME-Version: 1.0
X-OriginatorOrg: micron.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc52d287-c8bf-445c-0c44-08d7c5e2576c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2020 17:33:41.5138 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f38a5ecd-2813-4862-b11b-ac1d563c806f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wS1E46hHTeYaRZz3O9+xUMD8ZcHGjoKZHoa5i2uMc7KdayuK07Y4w57pSIxtoxV6ap0zu8ydt5GXNSJ0teYf3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR08MB5936
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_103349_414650_76886DAA 
X-CRM114-Status: GOOD (  13.85  )
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
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel,

> 
> Hi Shiva,
> 
> shiva.linuxworks@gmail.com wrote on Mon,  9 Mar 2020 12:52:24 +0100:
> 
> > From: Shivamurthy Shastri <sshivamurthy@micron.com>
> >
> > This patchset is for the new series of Micron SPI NAND devices, and the
> > following links are their datasheets.
> >
> > M78A:
> > [1] https://www.micron.com/~/media/documents/products/data-
> sheet/nand-flash/70-series/m78a_1gb_3v_nand_spi.pdf
> > [2] https://www.micron.com/~/media/documents/products/data-
> sheet/nand-flash/70-series/m78a_1gb_1_8v_nand_spi.pdf
> >
> > M79A:
> > [3] https://www.micron.com/~/media/documents/products/data-
> sheet/nand-flash/70-series/m79a_2gb_1_8v_nand_spi.pdf
> > [4] https://www.micron.com/~/media/documents/products/data-
> sheet/nand-flash/70-series/m79a_ddp_4gb_3v_nand_spi.pdf
> >
> > M70A:
> > [5] https://www.micron.com/~/media/documents/products/data-
> sheet/nand-flash/70-series/m70a_4gb_3v_nand_spi.pdf
> > [6] https://www.micron.com/~/media/documents/products/data-
> sheet/nand-flash/70-series/m70a_4gb_1_8v_nand_spi.pdf
> > [7] https://www.micron.com/~/media/documents/products/data-
> sheet/nand-flash/70-series/m70a_ddp_8gb_3v_nand_spi.pdf
> > [8] https://www.micron.com/~/media/documents/products/data-
> sheet/nand-flash/70-series/m70a_ddp_8gb_1_8v_nand_spi.pdf
> >
> > Changes since v5:
> > -----------------
> >
> > 1. Rebased series to v5.6-rc1.
> 
> I am very sorry but actually I had issues applying all your patches not
> because they were not based on v5.6-rc1, but because since then I
> applied a patch changing the detection that changed the content of a
> lot of structures (including in Micron's patches).
> 
> Can you please rebase again on top of the current nand/next? I am very
> sorry for this extra work, this is my mistake.
> 
> Head should be:
> 
> 	a5d53ad26a8b ("mtd: rawnand: brcmnand: Add support for flash-edu
> for dma transfers")
> 
> And the culprit commit is:
> 
> 	f1541773af49 ("mtd: spinand: rework detect procedure for different
> READ_ID operation")


I will rebase and send the patches.
Meanwhile, there will be small code change because of the READ_ID patch.

Do I need to drop Reviewed-by from Boris?

Thanks,
Shiva
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
