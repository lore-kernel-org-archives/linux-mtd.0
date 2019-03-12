Return-Path: <SRS0=+O2D=RP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8E4BC43381
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Mar 2019 19:27:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 928AE2147C
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Mar 2019 19:27:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nwCjdVRb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cypress.com header.i=@cypress.com header.b="rshiZ5G5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 928AE2147C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cypress.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yvpTgzdKpSdTxHQnEC+7KrCddNwl17HcxAOxhSeLr4U=; b=nwCjdVRb7aczhN
	L7ySDhDIy+kqLLgwSwXOIAXkpfBcSSVtOPWZxuDCsA6V3gTvq83SIdsbc4ZW+Wt1Vy0cTExOs817Z
	jgBbDl/crMo1oKUOWoGlEJD6TmFNNEVeCtU7P0OZci0BO/JZNKBDpV2l0Hg2OqC/fw+Gtfsw5V4ae
	cvx+e64V5aKeN/3bS0pziPjzIoBIVBgbOhDC8InnK1jiYFV+aucNfdBO6uF1eBcQmg9MS6MxH0vhB
	VxpD1Io7nYN0wmPtwc4A5EuK+R/3kovg7fGhIPbnpCsPSjPWWdRVc8oqLTJPZdOsQfzgiv0NtmPSm
	ffNw6L4df8gEtXJZMyLg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3n3X-0003r3-6h; Tue, 12 Mar 2019 19:27:19 +0000
Received: from mail-eopbgr770113.outbound.protection.outlook.com
 ([40.107.77.113] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3n3T-0003qJ-IH
 for linux-mtd@lists.infradead.org; Tue, 12 Mar 2019 19:27:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cypress.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z97jUEtuybQj42MiJN5IHWi8BmD3pE8nwZNQCF2shyE=;
 b=rshiZ5G5hFa68RgeX9zJDsmIl8gpm0h0GmIp017Vz22xWf3bmoanNIS/VpJKrrXzI4+0y8cg/0JAd/FFUi3rT+HcytfY6yvqWbLdxbCI7uVONPgbQbWJe3t6GfYYNqxnkehXdHPrYMYK+f4T6EfXZJrZ8CX0+MYMFpuKPwfC3Ks=
Received: from BYAPR06MB5893.namprd06.prod.outlook.com (20.179.157.74) by
 BYAPR06MB5512.namprd06.prod.outlook.com (20.178.54.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1709.13; Tue, 12 Mar 2019 19:27:11 +0000
Received: from BYAPR06MB5893.namprd06.prod.outlook.com
 ([fe80::9995:d549:6e1c:c360]) by BYAPR06MB5893.namprd06.prod.outlook.com
 ([fe80::9995:d549:6e1c:c360%7]) with mapi id 15.20.1686.018; Tue, 12 Mar 2019
 19:27:11 +0000
From: Yong Qin <Yong.Qin@cypress.com>
To: "Tudor.Ambarus@microchip.com" <Tudor.Ambarus@microchip.com>,
 "jonas@norrbonn.se" <jonas@norrbonn.se>, James Tomasetta
 <James.Tomasetta@cypress.com>
Subject: RE: [PATCH v2 1/3] mtd: spi-nor: always respect write-protect input
Thread-Topic: [PATCH v2 1/3] mtd: spi-nor: always respect write-protect input
Thread-Index: AQHUuB8ZhXd2N1Mh6EWe4SXNj0Cyz6YE33oAgAAMRYCAAcsCAIAAWT4wgADr6oCAAKGJ4A==
Date: Tue, 12 Mar 2019 19:27:11 +0000
Message-ID: <BYAPR06MB58937598257ADB18DAF344C38F490@BYAPR06MB5893.namprd06.prod.outlook.com>
References: <20190129220705.5143-1-jonas@norrbonn.se>
 <20190129220705.5143-2-jonas@norrbonn.se>
 <db7aef53-43bc-2c14-12bc-2f0d452b4bc8@microchip.com>
 <cb41d4e3-d300-89da-3378-6305699d610c@norrbonn.se>
 <6e20b1c1-4eaf-bdcc-aec4-59dcbe2a8a34@microchip.com>
 <BYAPR06MB5893F6DEA9B0965E234983CD8F480@BYAPR06MB5893.namprd06.prod.outlook.com>
 <4ddb8f33-93b1-9aa4-3fdd-c60cfa1d1d7d@microchip.com>
In-Reply-To: <4ddb8f33-93b1-9aa4-3fdd-c60cfa1d1d7d@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Yong.Qin@cypress.com; 
x-originating-ip: [99.228.74.150]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3123ecdf-d501-455c-5417-08d6a720b9b8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:BYAPR06MB5512; 
x-ms-traffictypediagnostic: BYAPR06MB5512:
x-microsoft-antispam-prvs: <BYAPR06MB5512C93BA3887FFB1B3595798F490@BYAPR06MB5512.namprd06.prod.outlook.com>
x-forefront-prvs: 09749A275C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(366004)(346002)(376002)(136003)(39860400002)(13464003)(199004)(189003)(76176011)(72206003)(66066001)(7696005)(5660300002)(99286004)(86362001)(106356001)(105586002)(93886005)(14454004)(2501003)(478600001)(26005)(6506007)(53546011)(6246003)(9686003)(97736004)(186003)(229853002)(102836004)(52536013)(53936002)(6436002)(25786009)(4326008)(55016002)(476003)(446003)(5024004)(486006)(256004)(8936002)(14444005)(33656002)(3846002)(68736007)(6116002)(11346002)(71190400001)(71200400001)(81166006)(2906002)(8676002)(316002)(54906003)(110136005)(81156014)(7736002)(305945005)(74316002)(6636002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR06MB5512;
 H:BYAPR06MB5893.namprd06.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: cypress.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LZ/oWlcWEO+rbolU8AIA99wwz93TSZmAWwHTkGTO0OcMcIrPsmcgeYNrTONFvxUJpC+AzhN7YtKJApoMINXIeuxtd+VbgkOxcKcMPnCqhTEHlmOGdYChuoQRF5r20py0sj7hgp3vwLdQAfHFqqHwi55JL1R0/SUr2rYzFthIjo54mhty24xUb46y2RoZcNhrrs34M99rHVpSKJXFFtYBhgLcftaNZkm05LuPGJoPmFqhxll12WWRnvLm6Th/wioJeVKTVcmz3xOXwRIqbjz/Cmf1cx8cd5FMuJT6fgbFcPIBEShrAfDVwQ11jL78uRYGg6ZkDNuUNQlm/ukUq5YIkLECjeML6m3ARHvNOdVoq1JqYzx4hFD+Vm38vLJB3wsGvkwqnilU0QKv+mny/MIabx9iMpPCtKAwU1QKeI2uUI8=
MIME-Version: 1.0
X-OriginatorOrg: cypress.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3123ecdf-d501-455c-5417-08d6a720b9b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2019 19:27:11.4119 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 011addfc-2c09-450d-8938-e0bbc2dd2376
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR06MB5512
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190312_122715_714690_E3B89C07 
X-CRM114-Status: GOOD (  12.55  )
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
Cc: "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "richard@nod.at" <richard@nod.at>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Tudor,

Good question.

The WP# function is not available when the Quad mode is enabled (CR[1]=1). The WP# function is replaced by IO2 for input and output during Quad mode. With that said, if CR[1] is set to 1 (Quad mode enabled), the registers will not be protected.

Technically default SRWD bit can be set as either 0 or 1. However, as most customers (applications) don't use this feature to protect registers, the default SRWD bit set to 0 might be a better choice, and reserve the option to change to 1 for the applications do need this feature.

Thanks,
Yong

-----Original Message-----
From: Tudor.Ambarus@microchip.com <Tudor.Ambarus@microchip.com>
Sent: Tuesday, March 12, 2019 5:30 AM
To: Yong Qin <Yong.Qin@cypress.com>; jonas@norrbonn.se; James Tomasetta <James.Tomasetta@cypress.com>
Cc: linux-mtd@lists.infradead.org; bbrezillon@kernel.org; richard@nod.at; marek.vasut@gmail.com; computersforpeace@gmail.com; dwmw2@infradead.org
Subject: Re: [PATCH v2 1/3] mtd: spi-nor: always respect write-protect input

Hi, Yong,

Thank you for the explanation. There are still few things to clarify.

On 03/11/2019 10:14 PM, Yong Qin wrote:
> SRWD bit (along with WP#) provides a way to protect Status and Configuration Registers from been modified unintendedly or by a malicious actor.
>
> By default, SRWD bit is 0, which means no protection on registers alternations. Registers can be modified easily by WRR command. (this is most of the application use cases).
>
> If set SRWD bit to 1, then when WP# is driven low during WRR command, WRR command will be ignored and Registers can't be modified. This provides a way to protect Registers, meanwhile still reserve the capability to modify Registers when necessary by driving WP# to high during WRR command.

Does the SRWD bit protect the Status and Configuration Register bits even when in Quad Mode? WP# function is not available in Quad mode. How can one release this protection when in Quad Mode and SRWD set to 1?

If SRWD bit is ignored in Quad Mode, then why didn't Cypress enable Status and Configuration Register bits protection by default? I.e., remove SRWD bit from SR1, make BIT(7) a NOP, and consider the Status and Configuration Register bits protection enabled by default when not in Quad Mode.

Cheers,
ta

This message and any attachments may contain confidential information from Cypress or its subsidiaries. If it has been received in error, please advise the sender and immediately delete this message.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
