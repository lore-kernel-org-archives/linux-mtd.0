Return-Path: <SRS0=4hvs=RW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D85DBC43381
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2019 07:00:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 991BC20857
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2019 07:00:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UOW9MCUx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="MgdEekPT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 991BC20857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3QDNAi8aKPpHXDRSCNJ3S0ZuvplGGrvhg5Xs+n+DSmI=; b=UOW9MCUxQTJp1p
	c/l9r6rsb6ZhOMXbFg33o5d0wFbJRueTFVOAvVbh8sd6afO14Eij7PEujvJvum2f9G6xWV8UyLwEy
	d+xoWyCt19DvrXHhfkxb69p3FfTGRyTFi+gojZnN8uC+M0Ki30kKRYHxgpGqSUCIwcMhyZN6ShLk7
	GV/ZhXA0xsX0Cvc96IuCqQjH0HerA/oJFEHiXxwPYwlzhFPzo3RkORAM/8c2rTZjZHmZw0SDi89WV
	Pe0AdsFcd0vSZjPACK+LLwPHipiYdQEHsx5GfczxXwgceoj+esrW270NH5ZIDN+2WFvbwKNbXuWs1
	EQ66ajPmLcqBf77v9FgA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h68jI-0002BS-1c; Tue, 19 Mar 2019 07:00:08 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h68jF-0001Gm-3z
 for linux-mtd@lists.infradead.org; Tue, 19 Mar 2019 07:00:06 +0000
X-IronPort-AV: E=Sophos;i="5.58,496,1544511600"; d="scan'208";a="28322728"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 19 Mar 2019 00:00:00 -0700
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.49) with Microsoft SMTP Server (TLS) id
 14.3.352.0; Tue, 19 Mar 2019 00:00:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=umtyRj6OzyrvXngGITx916WguLNJMSUpCROs8FGn1ws=;
 b=MgdEekPTCLvNJ1N7/Fkv3vrQQhnU3Ofaqq7ybjKQ3VkDusuRsIp2b/JxGk0cEDoYokviBUhdjElq6y4FhagkDpxSKbQH8wnidxPR2i40TABCRK2FoDMTYgmZZkuioSOLoqjWejdLye/s3pia3FQrEqM8F4oHVYNfHlPB40HPbbk=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB4099.namprd11.prod.outlook.com (10.255.130.101) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1709.13; Tue, 19 Mar 2019 06:59:56 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::85a9:6cf6:d651:128e]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::85a9:6cf6:d651:128e%10]) with mapi id 15.20.1709.015; Tue, 19 Mar
 2019 06:59:56 +0000
From: <Tudor.Ambarus@microchip.com>
To: <Yong.Qin@cypress.com>, <jonas@norrbonn.se>, <James.Tomasetta@cypress.com>
Subject: Re: [PATCH v2 1/3] mtd: spi-nor: always respect write-protect input
Thread-Topic: [PATCH v2 1/3] mtd: spi-nor: always respect write-protect input
Thread-Index: AQHUuB8ZhXd2N1Mh6EWe4SXNj0Cyz6YE33oAgAAMRYCAAcsCAIAAWT4wgADr6oCAAKGJ4IAKNP4A
Date: Tue, 19 Mar 2019 06:59:55 +0000
Message-ID: <41859b7a-98ad-fc6d-242e-6e9ab810e038@microchip.com>
References: <20190129220705.5143-1-jonas@norrbonn.se>
 <20190129220705.5143-2-jonas@norrbonn.se>
 <db7aef53-43bc-2c14-12bc-2f0d452b4bc8@microchip.com>
 <cb41d4e3-d300-89da-3378-6305699d610c@norrbonn.se>
 <6e20b1c1-4eaf-bdcc-aec4-59dcbe2a8a34@microchip.com>
 <BYAPR06MB5893F6DEA9B0965E234983CD8F480@BYAPR06MB5893.namprd06.prod.outlook.com>
 <4ddb8f33-93b1-9aa4-3fdd-c60cfa1d1d7d@microchip.com>
 <BYAPR06MB58937598257ADB18DAF344C38F490@BYAPR06MB5893.namprd06.prod.outlook.com>
In-Reply-To: <BYAPR06MB58937598257ADB18DAF344C38F490@BYAPR06MB5893.namprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VE1PR03CA0050.eurprd03.prod.outlook.com
 (2603:10a6:803:118::39) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3f0d535b-18d1-4e7a-beb4-08d6ac387e37
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:BN6PR11MB4099; 
x-ms-traffictypediagnostic: BN6PR11MB4099:
x-microsoft-antispam-prvs: <BN6PR11MB4099B72A4E1F050EC9A323A0F0400@BN6PR11MB4099.namprd11.prod.outlook.com>
x-forefront-prvs: 0981815F2F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(376002)(39860400002)(366004)(346002)(396003)(199004)(189003)(13464003)(52116002)(105586002)(71190400001)(7736002)(106356001)(186003)(3846002)(386003)(14454004)(305945005)(53546011)(102836004)(25786009)(6506007)(6116002)(99286004)(4326008)(76176011)(31696002)(71200400001)(86362001)(478600001)(229853002)(5660300002)(31686004)(486006)(110136005)(6512007)(54906003)(6436002)(316002)(53936002)(66066001)(6246003)(72206003)(446003)(81166006)(97736004)(8676002)(93886005)(81156014)(36756003)(26005)(68736007)(2501003)(2906002)(14444005)(2616005)(256004)(8936002)(5024004)(476003)(11346002)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB4099;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DtM/ZnQ7cGAL6o+TCsQdjtXQmuwV6mmKfDi7wbFxc671LQj9VeylVGcJbc6QRbYfo9xR2sxxE/tbdJZmrUWrBuUSwzaWKUzgqYvIBg8zbDycNZznryEN4PvcYdLQilQQs33e6uY/ct8tUAoiSw1pO7pMp3vOGC0eMT9jifuZVxN5ih1eUQOC+ePgpqE+CBq2BvcFyWDdVBzGKfUzS/4dgcsyqhvnQ3DMUhTeBU6Cv0VU0gr6tHe1WBa3VRpRa8tT6U8oRx/EaWEtTrk0dDQXuJTTvxqpZ2yg8ogkj3+dYnskFz3D/zkfkWGMNt/s5ONTf2gEdzWjyGIoU+RO46w6lMOsR14o39thUPByMOnxyVbiVsLDyUW6btHIUxYylKJJiua6JzXTqKXAjsl1IGyTaiTwpZW/0labg47keKCT/9I=
Content-ID: <7308F342B0BC3B4E937E109B53EEEA20@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f0d535b-18d1-4e7a-beb4-08d6ac387e37
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2019 06:59:55.8735 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4099
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_000005_294772_BC975D1C 
X-CRM114-Status: GOOD (  19.16  )
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
Cc: bbrezillon@kernel.org, richard@nod.at, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Jonas, Yong,

On 03/12/2019 09:27 PM, Yong Qin wrote:
> Hi Tudor,
> 
> Good question.
> 
> The WP# function is not available when the Quad mode is enabled (CR[1]=1). The WP# function is replaced by IO2 for input and output during Quad mode. With that said, if CR[1] is set to 1 (Quad mode enabled), the registers will not be protected.
> 
> Technically default SRWD bit can be set as either 0 or 1. However, as most customers (applications) don't use this feature to protect registers, the default SRWD bit set to 0 might be a better choice, and reserve the option to change to 1 for the applications do need this feature.

I think I found the reason why SRWD bit is configurable, and disabled by
default: => to allow the installation of the flash in a system with a grounded
WP# pin while still enabling write to the BP bits.

Jonas, Yong, what do you think?

Cheers,
ta

> 
> Thanks,
> Yong
> 
> -----Original Message-----
> From: Tudor.Ambarus@microchip.com <Tudor.Ambarus@microchip.com>
> Sent: Tuesday, March 12, 2019 5:30 AM
> To: Yong Qin <Yong.Qin@cypress.com>; jonas@norrbonn.se; James Tomasetta <James.Tomasetta@cypress.com>
> Cc: linux-mtd@lists.infradead.org; bbrezillon@kernel.org; richard@nod.at; marek.vasut@gmail.com; computersforpeace@gmail.com; dwmw2@infradead.org
> Subject: Re: [PATCH v2 1/3] mtd: spi-nor: always respect write-protect input
> 
> Hi, Yong,
> 
> Thank you for the explanation. There are still few things to clarify.
> 
> On 03/11/2019 10:14 PM, Yong Qin wrote:
>> SRWD bit (along with WP#) provides a way to protect Status and Configuration Registers from been modified unintendedly or by a malicious actor.
>>
>> By default, SRWD bit is 0, which means no protection on registers alternations. Registers can be modified easily by WRR command. (this is most of the application use cases).
>>
>> If set SRWD bit to 1, then when WP# is driven low during WRR command, WRR command will be ignored and Registers can't be modified. This provides a way to protect Registers, meanwhile still reserve the capability to modify Registers when necessary by driving WP# to high during WRR command.
> 
> Does the SRWD bit protect the Status and Configuration Register bits even when in Quad Mode? WP# function is not available in Quad mode. How can one release this protection when in Quad Mode and SRWD set to 1?
> 
> If SRWD bit is ignored in Quad Mode, then why didn't Cypress enable Status and Configuration Register bits protection by default? I.e., remove SRWD bit from SR1, make BIT(7) a NOP, and consider the Status and Configuration Register bits protection enabled by default when not in Quad Mode.
> 
> Cheers,
> ta
> 
> This message and any attachments may contain confidential information from Cypress or its subsidiaries. If it has been received in error, please advise the sender and immediately delete this message.
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
