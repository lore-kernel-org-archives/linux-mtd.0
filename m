Return-Path: <SRS0=F3bs=6M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10BB4C83000
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 09:21:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D725E206D7
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 09:21:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dI50MY1h";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="lJM2uZQY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D725E206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W+nTaLkD32yx+C0+H+TTySjbrpd3b0CxO5BaZLarToo=; b=dI50MY1hKgETAP
	sw/hYgieJT72Ecg2MdhPLlhqTaQiAblN/Y2mAsAjCvsa1PJLeapBnP0CNb4B9QmLIkFUjUtB5EtYO
	eXZopouTEtdS991lRwg1iA5SbgWcxC/ScIBTg0rPmz2MvZqju3751WPUgfvv3RqPUTNZfk3uOIiHx
	igWDK4UMOth2BLy8PMnbOi5Nek2E5HeQYoWUykM0Wk5oYf/viK4KTa5j6X9phN0lyyfstGaAX0U7O
	QnYD0oYvrm2/1PcVMIEJ7OS87KLKinw7prhM/OFWdwnpyeDHUnZI9Dc48NGfYQnrA0tQTbcUoQEgI
	22d3T/pQHepwp4HX0emw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTMQv-0000ok-KH; Tue, 28 Apr 2020 09:21:41 +0000
Received: from mail-db8eur05on2076.outbound.protection.outlook.com
 ([40.107.20.76] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTMQr-0000h1-5X
 for linux-mtd@lists.infradead.org; Tue, 28 Apr 2020 09:21:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LvP0/v5b/jdwq+2zqMo8jEaB/5xhQ/EZgzo7dMnzOckRkwowk5LnFzC8hWDDalL/1+T8mO/PXZXhKZH00ACbQqVPR6b32t+QGk81SikMrhAGbkNku91l2cCx/g6D7aE5WwjqqzHvAlsAvJEVx+ykENUjK0eTWmp8wrRrBUo+23DpzaYFAZvQGdxlzvWriZech0bR9HZA+bGVEgMAI7wszLVCNUyH57IdZ260rYBsU0JTTuwRt0WElOFMzPrXdmv5tTqMKTQvV/8qGF1r2AV6CCv9kdwRqPDxoUARGMWk9w+1zk66P/WhWEc4OZ8p7enzlTBsysv9DTu9nD0v0o5YKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UcOAMcEDdLrZNBeoGosINcmjVfGkonSsXRfHaOzPfBE=;
 b=aK7M+mwzxh4mYc/rMU+oc7bmBh11YCiC05IZAWvaPWPziNCTC+tpNvHyjdKWoddHMKCkdlInYIVZbGtJHFRVaXwry2QhRzI9QjN9yYjiY2BLinu3+LO0K07E8VR85lbfHgpiRAOkf96FWrBvspCO1C2vWP1Zu4DhpZtGh5P+eb66OCaLA7CiIC+8dfky1Zj9+NcsBrxPR9QH3M83fyKAzOXYPsJX/aUBF3GhxnocN2O1xJj6vWBSl3s6QUcOpqUN3e7Bt9aXrZzwHYtdVw4YFqls3fMUANya69aNSf7zFCIk8AKzwXmI1H57HjnMGf6B4UEZgjio2slM1YHkmMGUtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UcOAMcEDdLrZNBeoGosINcmjVfGkonSsXRfHaOzPfBE=;
 b=lJM2uZQYgGg4/DHcOK4Zdhf1sb72OdlxiZawrB1aM2M6oYw85vqV1dJBlZPbREl9lcTCk9CimC2M744+vc2U9YraQEKhMp9MO7o/eoDd90gNTDZnZhelPIW9B52wbHYAjoumurk6+gErT5nbX3tlsB/xV1FLDWQylA05h7ytI6w=
Received: from DBBPR04MB6331.eurprd04.prod.outlook.com (2603:10a6:10:ca::21)
 by DBBPR04MB6091.eurprd04.prod.outlook.com (2603:10a6:10:d0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22; Tue, 28 Apr
 2020 09:21:30 +0000
Received: from DBBPR04MB6331.eurprd04.prod.outlook.com
 ([fe80::70e9:847f:d693:197e]) by DBBPR04MB6331.eurprd04.prod.outlook.com
 ([fe80::70e9:847f:d693:197e%4]) with mapi id 15.20.2937.020; Tue, 28 Apr 2020
 09:21:30 +0000
From: Kuldeep Singh <kuldeep.singh@nxp.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>
Subject: RE: [EXT] [PATCH] mtd: spi-nor: spansion: fix writes on S25FS512S
Thread-Topic: [EXT] [PATCH] mtd: spi-nor: spansion: fix writes on S25FS512S
Thread-Index: AQHWF0filqFepYgQcE6Msk7Jfy3JEKiORRlQ
Date: Tue, 28 Apr 2020 09:21:30 +0000
Message-ID: <DBBPR04MB633119CBF8397BCB584C021EE0AC0@DBBPR04MB6331.eurprd04.prod.outlook.com>
References: <191f8894-8392-0d85-62f2-49cfa0285144@cogentembedded.com>
In-Reply-To: <191f8894-8392-0d85-62f2-49cfa0285144@cogentembedded.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: cogentembedded.com; dkim=none (message not signed)
 header.d=none; cogentembedded.com; dmarc=none action=none header.from=nxp.com; 
x-originating-ip: [110.227.139.85]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0d655e1d-ced1-4a43-9da3-08d7eb55897f
x-ms-traffictypediagnostic: DBBPR04MB6091:
x-microsoft-antispam-prvs: <DBBPR04MB609160BF8935C1CCFF003CA8E0AC0@DBBPR04MB6091.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0387D64A71
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBPR04MB6331.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(346002)(39860400002)(396003)(376002)(136003)(44832011)(966005)(478600001)(45080400002)(316002)(5660300002)(2906002)(53546011)(54906003)(110136005)(186003)(8936002)(6506007)(33656002)(8676002)(9686003)(52536014)(81156014)(4326008)(86362001)(26005)(55016002)(83080400001)(64756008)(71200400001)(7696005)(66946007)(66446008)(76116006)(66476007)(66556008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zHSJlp2ljDdpvzakWKNHqKL2dCOdW780HNqLIrqnJ1nOWIgxjpUZDX9QB0Yq5jcWjlsUZIk2NNZRi5DA152ygWL6pkanmj6vzX69Z7Hik01vz42dfAq/sydmu5fKGovR7lp0c71uWdTmGDN8WBnCK0fD31CpQnYxtk71CRpCTrWKd1sImBJws17FdkNBzJmIt85I7m/+q4vInyOP1VWsW0ooi9TPP2wnF1UZFPb4qSIx7uGcI8U9pKimitI0jZURh1sO85xN6FmtJHM4+vbcTIUzanBAvV4B9FLMs+/IJL3HduUXXOjLe1cjhZz2wtFhSCuwZT99t+Qe1OhOAHwx3TZrOveebjxcy/JBojNHYjpSrJyw1b67obPBqd6tbHQnsO3OvVv8kO95pOzHquQAPaqmMMno/o7XggZFWAXvCN9s7nAtsNUdrQe4dpmP0fns2rWWaIU7psnPD1oAm4wm3w1GrclwwPu3I9gB3r4mYtPINsszwmpXevpthXaq9Sf8X/cAVuGpPxr1sUe6+Ky15g==
x-ms-exchange-antispam-messagedata: djfAjeOLwL+oYjjbMZHrK/sJfz7BJZ/Pnx7YRzGfZvPAQCM+JDG9uu24PsHbDZG5tcE1WE2X0vLZ6EUnCQVbgbmC78BxTJNcE+YerZ0UDAE8PdqXDTdArIw0cQp2Rfeow9P37T9Djek9uK9e30ZKSfmpfCM65/sYN52tc5uI0kOxJL25DbIzTfMrcMxyelmwoOQpoussXFLnF4UH3WfGTQid3DUF+DJ94QxxVi8Abu5Nfgz+YLOx6SwJKOacFokQAa0xs/K0RV0SNeri4K5yZsLeqAvLBOdOvnOSY8OqiXXKD5+AXEZ8GC7nisG0G96Tee3q+PNmTOF8BoJ9MBu7tOc4slCWw+5AROBQ5qnimsd33F3P9ObNno73gE33QqPKQ3F5DXbkEq384LOyD4OBygol8rdFsRkM6sx9KVlzhKILLlMgzpRT6O4PYV6ILtrw77uvetQ8dmhtYgHYH3OxyeJiWoYub+Y+2AX1EKEVU7o4YbsSiX1mZU6v5w6mp9a0ryriThSUgxJmE3pkHttevZAwQ/w55JHJ2X6Wb6Kras70+AtmTXckoQi4JY6V1ToDC2zhvaOiMhoKZOGlY8ZbnhZ3V9ew3DVXxU1rfA+0zFt9Yvc4nXeUPvPY1OjUnwY1tC/F/XriunDnSAcSHBCBwkkZ73CdxY3rnhfAfiEidmMq3dBOeI8ztsLlDpOC/OtNXpAXHJlB5fEusJicXLtF4tRUniwbvI9l1ClZw4V1spljmNm8rZMPVpTiRKUV6YLnjsC3Mv7I7m8EOjToiBbXUUxuyUETaSRtHw2nGtZso+k=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d655e1d-ced1-4a43-9da3-08d7eb55897f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2020 09:21:30.7004 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kr4DTGl02f3BevGgZmYqBAqeXuML3OBSzGYiAV+neAsDFF0XtZ9RaL1aiC4HZWVJOZXUMhz4UjZLjmu9VUZIDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200428_022137_941249_A82A6EB5 
X-CRM114-Status: GOOD (  11.07  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Yicong Yang <yangyicong@hisilicon.com>,
 Alexander Sverdlin <alexander.sverdlin@nokia.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


> -----Original Message-----
> From: linux-mtd <linux-mtd-bounces@lists.infradead.org> On Behalf Of
> Sergei Shtylyov
> Sent: Tuesday, April 21, 2020 12:44 AM
> To: Tudor Ambarus <tudor.ambarus@microchip.com>; linux-
> mtd@lists.infradead.org
> Cc: Richard Weinberger <richard@nod.at>; Yicong Yang
> <yangyicong@hisilicon.com>; Alexander Sverdlin
> <alexander.sverdlin@nokia.com>; Vignesh Raghavendra <vigneshr@ti.com>;
> Miquel Raynal <miquel.raynal@bootlin.com>
> Subject: [EXT] [PATCH] mtd: spi-nor: spansion: fix writes on S25FS512S
> 
> Caution: EXT Email
> 
> Spansion S25FS-S family has an issue in the Basic Flash Parameter Table
> (BFPT): Dword-11 bits 7:4 specify a page size of 512 bytes.  Actually this is
> configurable in the vendor unique register (CR3V) and even the factory
> default setting is to "wrap at 256 bytes", so blindly relying on BFPT breaks
> the page writes on these chips. Add the post-BFPT fixup which restores the
> default page size of 256 bytes -- to properly read CR3V this early is quite
> intrusive and should better be done as a new feature; Alexander Sverdlin
> had the patch doing that:
> 
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatch
> work.ozlabs.org%2Fproject%2Flinux-
> mtd%2Fpatch%2F20200227123657.26030-1-
> alexander.sverdlin%40nokia.com%2F&amp;data=02%7C01%7Ckuldeep.sing
> h%40nxp.com%7Cb99b2075b3cc44c5f06108d7e55f0342%7C686ea1d3bc2b4
> c6fa92cd99c5c301635%7C0%7C0%7C637230068559206386&amp;sdata=BN
> ebniG68OFN7uJr1%2Fpm7wiQq6EPASNPrwEusHfc6zc%3D&amp;reserved=0
> 
> Fixes: dfd2b74530e ("mtd: spi-nor: add Spansion S25FS512S ID")
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Tested-by: Kuldeep Singh <kuldeep.singh@nxp.com>
This page size fixup is required for various NXP platforms to run quad mode successfully.

-Kuldeep

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
