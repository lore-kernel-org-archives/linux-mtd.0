Return-Path: <SRS0=9fF3=LE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDF7FC48BCD
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jun 2021 07:05:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABCF6613F5
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jun 2021 07:05:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABCF6613F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=xilinx.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2n1gbfLazLzrYmYUfPsP/aExicDZPkQe5BbeI06VRs0=; b=qb4uCsftG6yJ6K
	7RFJh7Ev314bmWb5c1fMEaNPtkMvNSUHpcNhjtBydwCjzFQY9E13WjlnbZ/RhHIPgo1woQ22TA90V
	Jg7XNkHVHzCcKhtRiPVJTf+XFI6YwDjS407D5N3yU4tQruA85pp1mgNL743kn08WWmDKjUgobjSpq
	3H/lleAxx8+Gb5aOfpaEvAXhbESrLWYgUUrxDlvHLrWq3uRUqbJ0/Du0xJQro0i/W2blZCMQFbKXD
	qddjyWhQODzMsfLn1GHXnpfW/SMZTGjqhj3U3Chp681VSwz5lq8O3lcE0lC1dbPFLJ72DDAVt7RvV
	AQQl/FxAwP2/Bi+tS7VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrEkj-00HA7W-34; Thu, 10 Jun 2021 07:05:21 +0000
Received: from mail-co1nam11on2085.outbound.protection.outlook.com
 ([40.107.220.85] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrEkb-00HA5S-Dc; Thu, 10 Jun 2021 07:05:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lx8T8IO5OFophjtS8ZCc7/sOThIvnzKhlWxX+Z9I6K+tu4Y8HpfMYK5wfwk1vD5J4jfMduXm5sNAnxzh3Q4qXm8/KE0krZedH3mzIGVnGBZNS5aAh2qKFJOaJgGg6LkXQ4WAyIgl9jo9l/djqvH/vLhOsxOaWkPIca4VLIy/E0ByWJ89Jmu/ZQc8c+dgtWBl+/y5khqMGQhLs7rAbDp5s9EoqhYDL0YQzWTW0tWdUBjJu5D+Ucsn1Ws3ttFpYNv6nattDKEAJKje9ErlmTiu4mTZNspFxNosTYyuMG9I5V2cUj+bXQUd/YjARRVS4wDGS2l24ogLAh3elnl5Jms+1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SXarlD2hU3+FkPXl2iJPIaXJ3LEZ+FB7sKmrhM1vFOg=;
 b=YptU3fLDrpcJIqQzKLVQ71zPQvp5akLEfVFzGB5+HA8RVSXKYQX22+azIrHINsswySRxzvlc6aNz3nOVT5J6Zwjxhy3+JdqsQYyeWuCI1KvQJCSYcvU5SVgFpCG6/R+pet4NKkSgxWbUJ8zqgRuJuOYIWkFR+zgICQfaNaC1e+ikSDlyOLf3WGFuBuPDGvEny2wzmB4AWRkdcZEBxJs3SwuwcIFKrQQr1bNg365UN6OcEZZWwrS+rqaUM52P60FSnbPFoNMILbdrpTGIBWNJxCv+4kBt3q6OXgfnwmi1SJjICHSVb8inuvl2km4oAGz9IeLPjTWPDPi3EhrzKD+gsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SXarlD2hU3+FkPXl2iJPIaXJ3LEZ+FB7sKmrhM1vFOg=;
 b=cVM6EKnJ0JxZsaL2+SbIedYvWgFQcz/P8THD+lpBTC1DfKIGEQUv7f1XdbxYhB/1qMShTpdnB3+w9n1F7K6M/IMZj4mnYPiT8O3IiqqxTX08WYCX5IhYAbd2qFHJYExDOMgEmoFnozwcWHr4SM81hGJyJVrM94hBA6KyMxUapb4=
Received: from BYAPR02MB4280.namprd02.prod.outlook.com (2603:10b6:a03:5a::29)
 by BYAPR02MB5272.namprd02.prod.outlook.com (2603:10b6:a03:69::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Thu, 10 Jun
 2021 07:05:07 +0000
Received: from BYAPR02MB4280.namprd02.prod.outlook.com
 ([fe80::19f2:a0be:769f:44c4]) by BYAPR02MB4280.namprd02.prod.outlook.com
 ([fe80::19f2:a0be:769f:44c4%5]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 07:05:07 +0000
From: Naga Sureshkumar Relli <nagasure@xilinx.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus
 <Tudor.Ambarus@microchip.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski@canonical.com>
CC: Michal Simek <monstr@monstr.eu>, Amit Kumar Mahapatra
 <akumarma@xilinx.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "helmut.grohne@intenta.de"
 <helmut.grohne@intenta.de>, Srinivas Goud <sgoud@xilinx.com>, Siva Durga
 Prasad Paladugu <sivadur@xilinx.com>
Subject: RE: [PATCH v22 16/18] MAINTAINERS: Add PL353 NAND controller entry
Thread-Topic: [PATCH v22 16/18] MAINTAINERS: Add PL353 NAND controller entry
Thread-Index: AQHXXQW5i7IWheILN0SmnRSCpAwThqsM08cQ
Date: Thu, 10 Jun 2021 07:05:07 +0000
Message-ID: <BYAPR02MB4280EBF6A071385B106E1831AF359@BYAPR02MB4280.namprd02.prod.outlook.com>
References: <20210609080112.1753221-1-miquel.raynal@bootlin.com>
 <20210609080112.1753221-17-miquel.raynal@bootlin.com>
In-Reply-To: <20210609080112.1753221-17-miquel.raynal@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [149.199.50.130]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 40330973-97a5-4dd5-cccd-08d92bde146f
x-ms-traffictypediagnostic: BYAPR02MB5272:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB527225ACD7587FE9F1B13299AF359@BYAPR02MB5272.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:849;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DLRRNCyKUZOqoveDpbSZo195ak1fORbDopzY4ovVGt/lMyjiS377s0kErayy35TqXxBRFsJ5Do989TdGCFV1YIRzYqj9xBifIf/50rJNvcfN28sTiNCZkAAiDkVoK+cVs291Jxp6uSskuxrEIV/l/3q1n0BCbgnCah0rEKQVBaHFpld+nODukcZtzjbTtPSrl3CqHNaS+GWtoyjVl+aCSprHQl9/WDmdKmpfJBy0aQlPdYHZKU+XJOOWvkacof80VR91g8l1HB7R5GQUumFmBDV21E+jLjN9oO5CS06TjjsANcYWycnUr8/AZqJUgnfPi9v/3VCn/Ogm861EMhRn44iRbsD3mxJUPZ2mQoToXbalayNPwtffoLSQ9WQcc8gszxUz/7qNXJw9v9/0iKrAoKaC/AmEmah3YLJ+UUFYLTjTi7l5jCWxOPC8qbIaDxadmA9nHNFEEaB0INio9vqEPer3OR/bJUE0RjTnVldnJTq1s/h8Bnkmq/1l6pj1CwBCoVrIINoSzXUFVrYgljy88bK2BYSbtU9fNxYDFil0CIz7Y5VzsIifz5sb29Rp90vPiK1Jp0LHGAxInJVSbD9Pfa34EWml0xLFJdtsTQDQzNQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4280.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(396003)(346002)(136003)(39850400004)(7696005)(478600001)(8936002)(6506007)(52536014)(5660300002)(7416002)(86362001)(66946007)(64756008)(33656002)(66476007)(26005)(66556008)(66446008)(9686003)(76116006)(53546011)(55016002)(8676002)(83380400001)(4326008)(2906002)(316002)(71200400001)(110136005)(186003)(54906003)(107886003)(38100700002)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cVNXeHJCdTNzUkRXYk5GbnlCcEVkU1JDMHRwM245QzBCVDZGUEZKOVdnOFNZ?=
 =?utf-8?B?NkNEZjJ4clVBZUZDWFR1Qno5ZlFkWmFERFNyVGg5RUsyNGVRUkNteXdqQ1d4?=
 =?utf-8?B?RUtjZE1HL29SalZDOVBGMjdZTVFSSlVRYllOMlB1T1c3TElpcHBYRWF4dUl2?=
 =?utf-8?B?bFE4d25yTXBPaDA5SjAvQWcySzN2SWh2dG9YbUM1ZllKMEw5VzFXODhRTXZ3?=
 =?utf-8?B?Q0U0TjVyMzZ6LzlkQkdmK3lPMHM4SVE4R1lHV1RPaVVLaUpzbm0xd003U3o5?=
 =?utf-8?B?TS9tMktraEptaGtNZGt4M3MzNllNaTdtaUF3MUFucEl3OWc0VHprc0NIYzll?=
 =?utf-8?B?bTlxeFZxakFqZTRneUg3dWhyWmRLa1Nkb05SWjg0TUptTitmTGNSUXd0MlBS?=
 =?utf-8?B?a3JQTjRkQ0NjNlBudXliK0x6d05RYUt0RU5VODdPNTNSYys5SGd5SWhBMldW?=
 =?utf-8?B?MnlvbDJkYk81QWtIWlNHQ1IvRHlXbDhrMDBBVHl5cFA2bEpyV2hDSy81c3Jt?=
 =?utf-8?B?RG9ES1Z6UHZSL3QwTWdnUy9xR1Y4N1ozMm52RWo1ZDZoaDdvN2Jmc2tsNGZi?=
 =?utf-8?B?N05zRHlFMUVwY0tBZ1FobDdpQmtYZnJxeEM4Qk9OVmhpVEt1ZTREcWFEYWxS?=
 =?utf-8?B?aC9QMU52cnZta0xNMHg3dUxyOWFlN2FKaW5jM1hyZWh0WitLSzN0VFg1ZEM5?=
 =?utf-8?B?cHM1NFRBNlprSHRXN3QyVHRMNFZFQmkwTjJoRnBsR0dzc050aDQxODFUdVdU?=
 =?utf-8?B?SnN0ZjhSTnlPL2VrL3lQMnZZN2oyS2tQZkFPTzhkZ2crUUwya0Q2VldBUDlO?=
 =?utf-8?B?TGRqSCs3NkR0R09OdXpIOEJKaXl0VktnTXhoTzdwaWFwNEE1N0dDS0xjMHpD?=
 =?utf-8?B?MVhseWV5L1RUb2p3K3l6WkNDeDFsZ1FOTXF5RllsNlphUmdjM1lqdnIzUG9O?=
 =?utf-8?B?SzYyZElndXU4VDU3RnRETG15UjMySFJjR25aTkpSb3R0VW9sVm9hdEVBY0lL?=
 =?utf-8?B?MlB6ODdBYmlCRWs1eTJYQVhzRU5OdFo2T2dBdTl2WkY4aHF2d1VndXhHcGJu?=
 =?utf-8?B?U1M2WTZaa3JCcXh2NGhxUG1keWlVMzlKSlJkT1psK1c2ZVhrRGlXZ3JZMGRj?=
 =?utf-8?B?dWFNaVJSREplSTBEOXZWSHl2cmkybkRyWVczV3MxVUVTdlJoOTdUWWU1dEF0?=
 =?utf-8?B?dUJ2d2s4K2NxenBqNFJvbmtTRkF3cGVwQ3U2UWN0NFpFTWc2NmtLYTgxVElx?=
 =?utf-8?B?dVM4QnJWVkRpVnlqR1MrUm8xVks5TkVWL1RUVlBpNDNMYXJqNVB1RjVIWWM5?=
 =?utf-8?B?dSt4YWVKSlFxNEFSMmJMSnVoVFJuV3BORE9LSkpvSUxQOUdTNmc0bjJJdGd6?=
 =?utf-8?B?U0pBSTE2KytZRVFzeFF4RHAxbXlhTDZJcjhyK3lob0hxNzVZUUxHY290S0NC?=
 =?utf-8?B?M2RDby96V3B0YlRGVDlDRm9XZyt2NkhrVGhuam92MUxzd2YwWC92K0t2dk4y?=
 =?utf-8?B?WWx0WUIxMWJYRGN6d3hML2ZqMEJac2w1a2Z2UlFTYWxzeGNncmxnRndUMG40?=
 =?utf-8?B?N2Zyc20zdXI4aU5FdzIvOXdCVUJIZ24yS0FFU0MzK1l5MVdLY3NGK2JzMHA0?=
 =?utf-8?B?ZWNHcXJOUE9ReDEwOHBiRzZSSmo1VEM2VmliUnN0bjBqNUpUQVJaN0hvdXI4?=
 =?utf-8?B?a29ScmwrMXB3U1VrRFF2RTZ1MU9aMDcxWFQyYkFMOHpzVUR4dGtPQktLUFBw?=
 =?utf-8?Q?7VxIotKR3STuRbq35yCjCWn3NdLLQaMlCwm1sI4?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4280.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40330973-97a5-4dd5-cccd-08d92bde146f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2021 07:05:07.3851 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iyb/IPx1jOAm4IAj23gnaqBJOCWI/jd5BtXys3f9ZyieAdNKRbxa/GeDh8c7JjPJg8w3D87JOzewpW3ks9UvqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5272
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_000513_494716_89B94268 
X-CRM114-Status: GOOD (  14.44  )
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



> -----Original Message-----
> From: Miquel Raynal <miquel.raynal@bootlin.com>
> Sent: Wednesday, June 9, 2021 1:31 PM
> To: Richard Weinberger <richard@nod.at>; Vignesh Raghavendra
> <vigneshr@ti.com>; Tudor Ambarus <Tudor.Ambarus@microchip.com>;
> linux-mtd@lists.infradead.org; Rob Herring <robh+dt@kernel.org>;
> devicetree@vger.kernel.org; Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com>
> Cc: Michal Simek <monstr@monstr.eu>; Naga Sureshkumar Relli
> <nagasure@xilinx.com>; Amit Kumar Mahapatra <akumarma@xilinx.com>;
> Thomas Petazzoni <thomas.petazzoni@bootlin.com>; linux-arm-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
> helmut.grohne@intenta.de; Srinivas Goud <sgoud@xilinx.com>; Siva Durga
> Prasad Paladugu <sivadur@xilinx.com>; Miquel Raynal
> <miquel.raynal@bootlin.com>
> Subject: [PATCH v22 16/18] MAINTAINERS: Add PL353 NAND controller entry
> 
> Add Naga from Xilinx and myself responsible of this driver.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Acked-by: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>

Thanks,
Naga Sureshkumar Relli
> ---
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b4315b76645a..a36fb919e913 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1452,6 +1452,14 @@ S:	Odd Fixes
>  F:	drivers/amba/
>  F:	include/linux/amba/bus.h
> 
> +ARM PRIMECELL PL35X NAND CONTROLLER DRIVER
> +M:	Miquel Raynal <miquel.raynal@bootlin.com@bootlin.com>
> +M:	Naga Sureshkumar Relli <nagasure@xilinx.com>
> +L:	linux-mtd@lists.infradead.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/mtd/arm,pl353-nand-r2p1.yaml
> +F:	drivers/mtd/nand/raw/pl35x-nand-controller.c
> +
>  ARM PRIMECELL PL35X SMC DRIVER
>  M:	Miquel Raynal <miquel.raynal@bootlin.com@bootlin.com>
>  M:	Naga Sureshkumar Relli <nagasure@xilinx.com>
> --
> 2.27.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
