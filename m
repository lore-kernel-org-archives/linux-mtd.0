Return-Path: <SRS0=cUeG=NX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 147FBC4320A
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Sep 2021 16:52:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D808261059
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Sep 2021 16:52:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D808261059
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=abaco.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+5W2lVlicyA9rUupvUOZgtorBKv3iBlbMuA6EEqRudM=; b=MgIx/JxLFwa9mM
	7I9jl6dgm5b5vu1CZctZr4wpvVzV3QnWlF8YjvpI/pkAXJI0cUMn8aP7dWdWo0VLV7Xt5PW7z2ztx
	7sByfnnELeTtgIECptHcgv2SgAWKzZt+da+yCcec4Obb02UW383NoIV7dMjX6vJFr5jADw2c9ZRFC
	FnbYFRCyf6IwJnND2ym2ryOAwxaYa83ugRCDf101CAktfZ4+V4riHU8kANKZGmxnpfU5FaL/AsaQF
	bf9w8OfpCG8baPrWFK3ak+SAk/Jo5udFJNZKGLuDnfMNf1JAkAoj0A72kqEXF2/DX0+vkQ/2jKhmh
	yLYZuz3cmgPNcT7YBbLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLTSZ-006caC-AN; Wed, 01 Sep 2021 16:51:35 +0000
Received: from mail-mw2nam10on2135.outbound.protection.outlook.com
 ([40.107.94.135] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLTSS-006cWS-JC
 for linux-mtd@lists.infradead.org; Wed, 01 Sep 2021 16:51:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dm+jmIncumX7xL2yOpHtmxeboByCTeuySqfuFqmNo3mc87rDq4pFAcQVFiaAOeav/PEEYFEmPhQfgAHR4yV+1LEzod88x9GlZEJRlED6CdSWKmtRI9hUBZuSLeXIXeTsEPR3Jm6o+cCxKGm4Za4uZW62Onm4EYluvMX/vFNqXwxpNH1dFDirRnzC1eU00FkXx9JR9KBWpu/LPnGRdhPzijmgxWlVKfaC5UtNJ4Py0jCCCo1OH34qLX4zKquWidcnjvpt6lUPYU43Mn4nP2yyR30EJRAdUeIyrGJpuyrqPPZtBWdj4QdkeOrn9pekvX6onJoHA92qccBmr0CXZSAhWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=nU8rAR3UmlELuzPGEGuOJdR+vSVyhTbmO/zq7X0Qmj4=;
 b=QyBKttBy9HVpgp3da4K1XcYlaLWdJTsBbLsKKpnTYWysz0IGND4uITxSA4K7FsLZlyJ01nIp2VehvqTC7pk82Ah7AozpwuU+8jTL3TKdjcRlOn4uGKx6ihy6rSJw1ZbrwW9O3v+KHunnpjuKwiPrLMo2ECURaelGajaZjtmcHOX5gXL5TMY1R+FFqJPfqwbOk8uILX/p7QMBz+bzQYukw8by0WQKqz0TxCl+8w+0EzX8YpODhSl6APp6Co1RqqgHujX5U/7bFVQW7eIRi5W3iu+FXwHfZImtsAO42XVg3R4+LhBMn6bUoOIF6d1F6h82l0eC46ie5lMSYk4/qdxTVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abaco.com; dmarc=pass action=none header.from=abaco.com;
 dkim=pass header.d=abaco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=abaco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nU8rAR3UmlELuzPGEGuOJdR+vSVyhTbmO/zq7X0Qmj4=;
 b=n+tQ3uHYRYEexbwGO83bBjU/+mvy4uiQ/FNzqQdRGgnn0LZXYZzNjcHAigrlbJgLotQKc5r56VQJTwZU1EfLBCaSLp4nrtgRZoL+b29zNZrwaHG7tMrW7RxF192dZFYb5/aAQI08tHYRkotAAQSc7hkpEXyIPGnkJNoPOz4wKJm9aELpMrjPMxj+E9SFwpDDZT+C/FqckyJZpBbfF7S0ahkc4iEjEoemu5cUGFjWy9pZCfMVEcwgarEG+sHGJTI1nxL6JSCFnvezg+qyDqZRbtCxQ0Q1mqcycST7XleVD0NPKqAsVyj+qF0oyemyrGFMF5wjxzNLX4fQoqKQL8w+Wg==
Received: from MN2PR16MB3135.namprd16.prod.outlook.com (2603:10b6:208:153::31)
 by MN2PR16MB3310.namprd16.prod.outlook.com (2603:10b6:208:13e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Wed, 1 Sep
 2021 16:51:23 +0000
Received: from MN2PR16MB3135.namprd16.prod.outlook.com
 ([fe80::75bb:ea2d:9ab8:b38b]) by MN2PR16MB3135.namprd16.prod.outlook.com
 ([fe80::75bb:ea2d:9ab8:b38b%7]) with mapi id 15.20.4478.017; Wed, 1 Sep 2021
 16:51:23 +0000
From: "Barbier, Renaud" <renaud.barbier@abaco.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: S25FL512 vs S25FS512
Thread-Topic: S25FL512 vs S25FS512
Thread-Index: AdefTssbJZFggj2ZRgCkCCRr1Q2RSA==
Date: Wed, 1 Sep 2021 16:51:23 +0000
Message-ID: <MN2PR16MB313511219F7BFB2692C4C8B191CD9@MN2PR16MB3135.namprd16.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=abaco.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a4565c5a-9ec2-4225-fe04-08d96d68bb3c
x-ms-traffictypediagnostic: MN2PR16MB3310:
x-microsoft-antispam-prvs: <MN2PR16MB3310E048C69D4BE74D64997391CD9@MN2PR16MB3310.namprd16.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UZYqq6pi5wrkwYUU35sGkgRZeW+KQgUjsEDDBTRQaIlrVlGhotc+xKp0nn0s0v2t0G8RMSWkYqaFJy/7Ho+9q9lNRz+Bs7oPMME7rJvhoAkyRdwxhMnIYqEK2nedly95A0CGqZizPg7b8AIOLvd4D3Sctga00uEW2go4aioY6p6jfYGxOb8/volSceCayful0FspOuSEpHw51JRYZMtVfPJBDSbGlb/2rnLXGt1eprl+ycoG/MmcEhKaz1mAOOFqfmROzjRVTKszfi23zcxXWnvfcpYv+8OJu3V3gMTCcURsE92onpOA4bQxU+kVUHYqwVT0QEjWyGUSGpRLXJAqNG1ZktTdGcYh3RNZyh12ZtbFtRXQfGq8xswDAQRaKmBFnf/wlpseFRfZv5bIlTyCDAEIbKlDh44mMNpaITc/vSynweww+Ypx3X0sDkrPJ+J3XYGFG2rY4+aNw67UGmwHLQS7q2aMN5t1nI3NlxJMv4xm5uB7uuNsMxOm0yoy0IMAOQe5gg7ZY+Ku8SrZ9IsXD+jgOoLRo15kt73f5Np7yec54oOgJFiSgCl5p9wZkHpg5lvLq7lPM67sACyT8HYrRfYMs6QC+tzhbqXC/gfo9koPXlSMxwZuCsfuVsduua1IJfeaR723JTE1NDCO2ah3XM9DT2CPp++QGQ0MUYV8pn0FC5w6lLICwCYE5io1bam0tw5qST4Y/YJoZF+rC261kqmj2LL96LAJVJNCz3nc0eE/RLsbCFZDcFcWVW34hNpcFjgz9f+1ie1t9aNCuiyxkA5WK4yfbGSS2yfyQOEE1JI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR16MB3135.namprd16.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(5660300002)(83380400001)(7696005)(316002)(55016002)(7116003)(8936002)(86362001)(186003)(2906002)(71200400001)(33656002)(9686003)(6916009)(64756008)(66446008)(38070700005)(66946007)(6506007)(966005)(76116006)(122000001)(508600001)(38100700002)(52536014)(26005)(66476007)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dUck75IS6diS+YT1rXmgj65cfRKleIuqlUFjfQova9mjRNwt6GGM4DI3zzvF?=
 =?us-ascii?Q?vXQrcDeiywGcuMm/H7eFFuTcJfeICiz1tbWxLzbImUbxMVIaZEIbntQCLSY9?=
 =?us-ascii?Q?spyE8Z+diTAG6wIzgb50zFlqElD+hsWUxehQzaluWnJ7tSZAu6EbJ8HgyUq6?=
 =?us-ascii?Q?GsPYBanlTuNn2Jx1X6R+pYy6fFXqnfNRaoiLObfC/i5KS3C0wO/PGwbSITeB?=
 =?us-ascii?Q?8ydI+k/Mn71vkrBG5Qn4alabXktQTrmsXpdLVSmzki3SwgPPCQ/D2wZtDpiF?=
 =?us-ascii?Q?5idGO7Y9PRu2+BNADtVccVkuvYqNDQdZc5eLUyBjurgYYp0zru0NGgaSpcS1?=
 =?us-ascii?Q?qJva20reEii3z0QRa6C6xkg7M3sLjElyYMUe9g/s7S0tEBjFtkoNRdgQFEyK?=
 =?us-ascii?Q?N9ljlZFs0h97jC3KCWo7xAC4KsuWNfTBeanlSG72BXbEH0nXKTtYSnYDrxE4?=
 =?us-ascii?Q?AogjWnHcfDkf3bhgtn89UmcqDEJZdk+7Ao/iBKl/f0vhR5ciPJTzxk1R6x7F?=
 =?us-ascii?Q?DET92U4Gw1Mwc97SokyK7Psy+/SnHHGmMevGhBivzWHiIGt0Pki8Z52EniPI?=
 =?us-ascii?Q?PMpBpVTLNWebd1tJ3E031NhPtfWL9agG78+vxukM56b5dhJ3KetQM5i0J8PM?=
 =?us-ascii?Q?t5kaIDJdA/twyS7xUjWd6SDaWuVkUH/pjydO0Fr1OWo8oPx0QchOt0nrWATf?=
 =?us-ascii?Q?xxkuLoWtXZY3xv1BOi8Su1P4yGk+IQ9I5wTV8/dIz2yesGa/efCTq9yM1xSE?=
 =?us-ascii?Q?j7lAfE+geFvZl7vUF8sB2mLC06hhKWUuUdnL1TBqtH6od53kOeFTaXmnYTq9?=
 =?us-ascii?Q?DMzW4i6NwtolxLXlZtSCmTDSjS0ow3pL97l043P35+RaxK6/QvRG39QGAZHI?=
 =?us-ascii?Q?oaiLyOXX5lBtUg+/T/9T4X/KbHNQcSJp3m0Y85CZhVL92oad0qWiwWK8ByeO?=
 =?us-ascii?Q?WZrkSp2Uum5XTbXfj3LqZ6dnq1/1pUgloszedYzdPACVVLEYVgTR9ttMrxEy?=
 =?us-ascii?Q?fshmGBoMBClAWgf7TKGvoEkD5xJsZVER8E/5sXBBGefdGmXa57/g9inLa8Ya?=
 =?us-ascii?Q?3mmy9lUaghVvTH2sv8C7kYntnnVc6RU9aTmAXgh3aJI6f0vWxY50Ak99TIUR?=
 =?us-ascii?Q?A5RORLYGxDCnDTBhDahcuv8knDdoMRG6NeDMWHQk6aGd80mCHpMchUlSgfwp?=
 =?us-ascii?Q?GwIf6DB9vnwuUJEA1plwRUnEorxA5JIO47cbKlYsPwMVB8MZGKvhtaHQEQxd?=
 =?us-ascii?Q?p3CABmBj/CZHRoz9pfXcXr4Qhf7FvysFATrQ1VeV20H6BBU2oH9zOvCjZ1oJ?=
 =?us-ascii?Q?a3Y=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: abaco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR16MB3135.namprd16.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4565c5a-9ec2-4225-fe04-08d96d68bb3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2021 16:51:23.3579 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e6f27451-899d-4d0d-b8fa-88baafa551a7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zufr+Luq/pd1VvBuGiZHBJqB9YcqF2SnSGEouaJCDvXa2bNhKhuOE/Bn+NNFdIeLkc3WKfkWse9fEIA0/vQ8dVET9FIdhJm4wDWGr8rrGvc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR16MB3310
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_095128_815566_7A8D7943 
X-CRM114-Status: GOOD (  10.79  )
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

Hello,
I bought a NXP ls1046ard evaluation board and saw some issues erasing the SPI NOR from my boot loader or ICE.
The boot loader reported the flash as being a S25FL512 which is a uniform (256KiB) sector SPI NOR as per manufacturing ID 1 and device id 2

The eval board has in fact a S25FS512 SPI NOR which is by default a bottom boot flash. This can be disabled through a configuration register in the SPI NOR.

I also see that Linux describes both the S25FL512 and S25FS512 as uniform sector flash:
{ "s25fl512s",  INFO6(0x010220, 0x4d0080, 256 * 1024, 256,
			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
			      SPI_NOR_HAS_LOCK | USE_CLSR) },

{ "s25fs512s",  INFO6(0x010220, 0x4d0081, 256 * 1024, 256,
			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR)



According to Cypress PDF https://www.cypress.com/file/177971/download, this SPI NOR S25FL512 is indeed a uniform sector flash but with a device ID of 0x19.
While the Spansion documentation I found (https://datasheetspdf.com/pdf-file/831993/SPANSION/S25FL512S/1 ) described it with a Device ID of 0x2.

The S25FS512S has Device ID 0x2 according to Cypress documentation https://www.cypress.com/file/216376/download  and is a bottom boot flash.

Is the SPI support for S25FS512 in Linux 5.14 disabling the bottom boot feature? I have not found it in the code. Only something related to page size.

Cheers,
Renaud



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
