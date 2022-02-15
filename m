Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56DF1C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Feb 2022 10:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ifIDr4Gr8PuOC7xIEHJV+HuJYkCBKb1PUD5BoomMj0k=; b=y2BCCggosX6TzS
	C32dr7p0ofBdq5IjbvT3zx+wcK0ye1GEkokZe9PpWR+86uglUh+roxaLKW0Gui02sCBV6Nl/70O+Z
	lXocYvVJ2s9GVG/LwWArj0OYiXM8HcbhZAxbGfnfCrBjJtd0dlqGiL4KluE6uHekGeD7qiIyCBhTY
	1meIuz/chyLKdoPfc0xANYyv+pKtVgCNya+D6WXlkQO8y6UG7DF03PIdVvWr+SuIsH9j3HUB1Lw5T
	CbDgi2MwkoQAS7ZLGJb9QlnAqQUjM1ZqsO+SvND3xuID+cTUHNF8WIbeRIuIxX3QyPC97o/73YHRy
	q+6w8RV7nfAtzE5gnY+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJup3-002GKz-VX; Tue, 15 Feb 2022 10:12:38 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJuou-002GGO-OY
 for linux-mtd@lists.infradead.org; Tue, 15 Feb 2022 10:12:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1644919948; x=1676455948;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=+gPG/Utsr0tky39gQNifCQP058d8tvDR/lK/FoK2H3s=;
 b=EKNAqSVkcZQrTDC3Wm2cgyUmxZw86HtH1ZmpaabctSCogOhaVd4a+Oy1
 rO7Xk14zxeyDONrGBpl6wQSfhzD9tXunRzwwsNUrlVQGEAhAm7O4MrUXi
 6fziTHuizuvChHnby1wLMBrTksx/BXixs7In/QcKzBVoTc6UHVvGb/P5p
 VqSRsed7BZEW7eabAcALjqffAuR20de0VQc4DjUOy1tzj3ueAhumIozow
 Tj+8S6d42FKAVl5pcIhkBqYijzf6dSGEL4J5NKW2TwDm62tigt+Qxbv/K
 NHBYwbdd4H/zpuHALk9YROhywYU3+TcHt6eQ8EwjiNsZREGmdxFSNL0Vk Q==;
IronPort-SDR: pj3yIQO2kNh3QB0MCwq9aZW6kcFMnKOsnt8HIb4DBk7TyMvkWAdkFbW/V+87Mc1KQp0kcc+jh4
 R/i7SOgGkC+RAXHyAFeSmi8IKOXhNljSQm1Zrur24s6ctEfjhXO0kSSvM3tP5f75O8GslpA6Nn
 ZoLr1qIQbsCDhHEZs21NEbsLxbuGV3Vbp4jCwgD6kUZwY91klhREdnK/8U54c8zWWuO8F5T5nu
 kG4aYEPSpNrMm3tDz4yYqthTauMCl4CgNFPLQH5/s0Ctq+Vg8BZMXZEu135W+9WP+vYeZXwA6U
 nFqahpt3UVNXYOCw1Lz9Blxb
X-IronPort-AV: E=Sophos;i="5.88,370,1635231600"; d="scan'208";a="85767723"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 15 Feb 2022 03:12:26 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 15 Feb 2022 03:12:26 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Tue, 15 Feb 2022 03:12:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N+5bGyrRFDokDmdISYTEelIwE/PqKyXMwSzIkmiPpM8boPhAwOeC76BOcT2XXSteOZsttIeGcCJBo1ThGFsmpVWVwB7jOMMVFJBNWwHJYTG9n0Tu8BF5DiXpfMLnRDIx0OPNP5yUFbLmADd20RkohdIqMyOPubz0tHRfwin/AsKN3Q+u5KAZozr//v1G/qWZMpPjgG9vhf5hY5Wbm0n/PCYqArH/x+CRnNGbxWLgaFWuAyxEeKP9ZYoBzL2GSlKcT2Q4tLNU6c+dfA7mr3ZT3hpiRVH4+XNH6CXlYjG4cIJhwLAWNHByML1X/FoL9lNGna+HcGngw2RgaQ1+vcDG8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+gPG/Utsr0tky39gQNifCQP058d8tvDR/lK/FoK2H3s=;
 b=GQGdHq/EbKptv9Rb0NY9ONffQ5OD04vTSpkWzEfBs+MOXDHWu61UK8yAWGwVhXacu0q0a7mTne71AP5sSgoG1syxowcLd7uPRW456M4pCEolBnbqlFXEOe/GWT3neiU2+75lnG1J/nb8t/3mbUsLINXQxZjd2uw6nV/WZbnxckUTDN3yRTJd9ir/cBnaNcgokHd1KnfnFb/kB297HGPGIjGx/JaKB5SCwDWnncOO8QoLO6AuMx+nD4q088Fnr2FR7WliB2dgyUOiG/BU/thyzZTcjfd33UNNjGVN0RlLpQU9f3WjiZvFBWv5ldzvpuSZw9iTqN/WSMK/RsWEcxNb6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+gPG/Utsr0tky39gQNifCQP058d8tvDR/lK/FoK2H3s=;
 b=l40/RMg4BIbUyQVUxRvF4Vyayj54aSVTxEDph6zafnXuOpqErXIIZcZPQWyYZTJgqbf+fz4sVHIdHycltkMyFsqSZRaPN/yylTIdBezzg0R+1yOflWdaijDDz+K8qBb3OGwE1RLMQtrgf9iIWJ4zJnCK66Thm+nc6gNMEvbM7Mg=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by MN2PR11MB4677.namprd11.prod.outlook.com (2603:10b6:208:24e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.12; Tue, 15 Feb
 2022 10:12:21 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49cd:dd25:384:e918]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49cd:dd25:384:e918%5]) with mapi id 15.20.4975.019; Tue, 15 Feb 2022
 10:12:21 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>
CC: <miquel.raynal@bootlin.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <p.yadav@ti.com>, <richard@nod.at>,
 <vigneshr@ti.com>
Subject: Re: [PATCH v1 05/14] mtd: spi-nor: xilinx: rename vendor specific
 functions and defines
Thread-Topic: [PATCH v1 05/14] mtd: spi-nor: xilinx: rename vendor specific
 functions and defines
Thread-Index: AQHYHiuFz8+evF2o8USFiXwNjUvH0Q==
Date: Tue, 15 Feb 2022 10:12:21 +0000
Message-ID: <9b389632-66f6-dea0-da96-7d7560ce8517@microchip.com>
References: <20220202145853.4187726-1-michael@walle.cc>
 <20220202145853.4187726-6-michael@walle.cc>
 <68aa414b-7a9d-1330-531c-37b2db2ab09d@microchip.com>
 <73d3d8ed2cb4ca1b06902b767fe529c3@walle.cc>
 <d76f21dd-4038-57de-f2f6-6afa947b62cb@microchip.com>
 <c3a58de8ee39dd473483dfd0ed8a0058@walle.cc>
 <7d8b7581-4610-6c04-9033-dac9ba27038b@microchip.com>
 <3d5bb9c9480092c64c5574b6551e64f1@walle.cc>
In-Reply-To: <3d5bb9c9480092c64c5574b6551e64f1@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 485b2e2e-f101-4290-75ed-08d9f06ba7db
x-ms-traffictypediagnostic: MN2PR11MB4677:EE_
x-microsoft-antispam-prvs: <MN2PR11MB46775D57B504B2D803D4A4BFF0349@MN2PR11MB4677.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1jF372cfO7Q7VrYkpLHKZPU8sgcbNixvAVICaJbnTOJmp7tpN477jUtVB76ENnEG/RITu2sRxMf0puMCHvQTPeI9Zx55UIFaQat4beWQZqdGHPDL6Az5uhsg4mcGN00ohBvDDUCTfRxMp97m3p/RF0NiBNf5SllzzPGQfMYSCym6YzJVvX4zpwyd5wGYOfWxBYyuOSr/5e8z+L9OkwUcOhDrhndy69mJnAz7Px+WgaVJ5diImBXBv79XLZneN2OxsynALXeyoRleKJ3yO9v/H1028CzZXJN98wvuaDwgwWeJlIBaTUFLPqRvH2N5Sh1JqK2try+U/JTXKOkxDm3Qo6wWg+Xn5vLPjVX/5RVvmVKX2L96YK3Fnq8ce9ACy5T26Ol09DC3KVZekOf2Lps/pX0oz8k3qgGm3gcsbCRnGAQvnOL3CxyO40i8QsgEcBtibSzx/Fc12jdXW13zhWSgQ5R76lcyTjeQaf25kXpubNWasykZqwiDpIT24qr4/kmOwuhKT6JrREVdS4a2dz2mg4UBTHGw/kHLgK51BR8fSi3XpnG+IGQ1xUYi3z/p4MvBJJBDQv6WOBJHnrW7UDTar/68HRySMaonU/1p1GVEMYg1b/B6XuTEBgHfVZwjNBIxYPcEgqLWjV/LFuvAZhdBvVRSWh/BKDErT9foxFviP1L9AmEz36901rafogf/B/w6xsFdxv2wlKNeqgRvPAM/2gMU+B2oYVoNBKugnSOngLA5UN5OJFcwWAfk4pBEBwU9DFmwX3xeev7mf8Rbc2f5fg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(86362001)(31696002)(122000001)(5660300002)(2906002)(54906003)(91956017)(38100700002)(38070700005)(508600001)(71200400001)(6506007)(6916009)(6512007)(6486002)(53546011)(26005)(316002)(8936002)(64756008)(76116006)(8676002)(66476007)(66556008)(66446008)(4326008)(66946007)(36756003)(186003)(2616005)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SGROOW0veWc4SDk5Nm1IK0NvSHhJQlpQTWxsbDZLU25mQ0pramhGa0FvcDFl?=
 =?utf-8?B?YzUzQXZxdFdLSUE1OW9QYm0vcnA0YnhSR3hzalZkWHJTSVAyK2p0RGwra3kz?=
 =?utf-8?B?Y0ZxQjkvc3hBaEZlY0FpdXpEVzUwYzBZQXk2TytGV3FwT05SdHdkdnFKVWVP?=
 =?utf-8?B?TnFCc28vZnJ1OGQ4a21OY1RWMnFaeGg1TTJMRndyMmZrZjhuTWxkK2NWUzhR?=
 =?utf-8?B?aFR5OHp0TUJkT01VUnJhUFc3a2pvYXZESnVkWU9vWXhuWkVKdXpMdW5iM3pH?=
 =?utf-8?B?NWszdmVYZzNLaXBJbjZoalpQRlBRRW9TenFSdVJQSXBNSTk1SFB0czhmakxs?=
 =?utf-8?B?UFFkR0FlVUoySC9pbjR2RFZ0Y2lYeFh1OGU5WDAwMTcwOHdHdENKMGRySHdB?=
 =?utf-8?B?UUhpaWl6TXkrcE4zZnZvZmNDbjM4dEdod2krZlFaU0lZMDZEOVQvRjZDZHpJ?=
 =?utf-8?B?dW4ybFRIWWlYTHd0dnJPS0wwK284STZaVnkwVWdGTUdUVVJDQ0lKTDBGbWVS?=
 =?utf-8?B?aytUMWpnUEVBeGMxVzA0YUkzbzN0RTJJTktucnRqU2h6ZGdtSkpsQVdFaEY2?=
 =?utf-8?B?eGF6WWszdGlCSFZTeUNJS09YQUhjNDVsRm5VMTRYcis5YnNGaEt3cE9jUDVi?=
 =?utf-8?B?dVlzeWpwaEEzK1VadStHUlhLc0ltdklWczZadHhGNXdKb3MzU3V1enBnUUVB?=
 =?utf-8?B?RS9LQUkrVld4dlUwTEtXbE4zL1R0VlphdWpOUTFTRXZSRTBDYzh1QUJGbE5z?=
 =?utf-8?B?SnpMRGJGc0YyeHlRYlZNNkljSkdqSzBPczMyUm9pK2dhbDZFWE1CSG5xSmpq?=
 =?utf-8?B?dFc4LzE1azloQ29HTTdpZUhLNGh2dVdIb1Y2K3RJOGhZdzBzVjVlaGQ0Z3Vs?=
 =?utf-8?B?UW4wWHQ2amU1bWIzRlA3a1NiMmxrcHZNVXNCY3FkVHBiOElDVlkxWUZybEt4?=
 =?utf-8?B?ems5TjUwUklkdUlEK1lLNm14WFpJMnBORVpWVlk2c0FKcWp1SWRqc2kzUlVv?=
 =?utf-8?B?cEllRVZlNk1VSTBRZ3RvOG1lcXVCNEVBalY1Uk4xTW9zcVprMTJ2cXl6YW1F?=
 =?utf-8?B?cW43QVU5UEtsN21ReTh3VDZDZGdHNS8vaXMxamp3ZGREOWQ2UUd6VGEwZ2cx?=
 =?utf-8?B?dGNhWFo4Zk9LS0xEdHVVTDFEd1JWUllUUHZTb0NBSzhmVUJGcG1hK0hOekpL?=
 =?utf-8?B?Wm9LcHgyU01tYmptTmFSZUJJNXVvVnU1T28yRWdTWjNGTkxxaTh0czNKOGNl?=
 =?utf-8?B?M090a1ZUaWtnSVRTQVdCdHp1bHFvbFBNenZFS0V4UUU4eTVLVGlYUWtKa0dk?=
 =?utf-8?B?ZnFoaXRiajRRQ0g4RnUrL1RuVU8rUU1vYkFiSHhGMzRnSGlleHZ6cEF1VFFN?=
 =?utf-8?B?d0RzRFVGaUpjM0ZhY2JXRkIvbzlpczdTZkVsSmtQbjAxVmFVOWdmUG5QY0xi?=
 =?utf-8?B?Q3JEOXZRMy9BK1JiWHRWV04rS3hucUI3a2ZMUkF6bXRvd1V6MXhxaGFocnFh?=
 =?utf-8?B?RE9WQ0IyME14dHdSTDlDNWVWb2xPUWRBOFh4N1VBQkg3VWZDTzJnd2F4SUc2?=
 =?utf-8?B?SWI4TnVFMXVadWhzTzlrL0ZFNTI5WC9MN3F0bEp6b09UTGoxaUNoSlJNVWth?=
 =?utf-8?B?aW5RQzhDWEZVZW9RdmJhU1hDZDVzdUJnMnQwTFNwaTJRSFBTQnRsdFJFTm43?=
 =?utf-8?B?dHNrZlM0T2gvaVAzZ2tPdEpiNEZlV2lHcDRaMmRMYzNmT3Bxb3JseGVQSnRB?=
 =?utf-8?B?UGNvZm1Ud3AwQjRIb0tjRis1TUl1TVpla0ViR1ZDTGdJdGRSakF2OFA2Z0lo?=
 =?utf-8?B?SDk2NDJmLzliOGhaM1M4K3NzR3B6QUxsMTF5MCtiY0hHaGlnbUsrMmNMWlZU?=
 =?utf-8?B?SjErUGJ5L2E5aHdROTRvdnZQTkd0WDNmQmlhZUwxejk4Vm5wbXR2MytsZXVT?=
 =?utf-8?B?SFV2OVFQWkwrbTQrOHEyRlNUUW5VUllsMS9teWxpQzZRQi9RUktYVHRNMmlz?=
 =?utf-8?B?bllvOGl3U0N1c3VXakd6MFhjKzJMcW9ocmJobnlpZ05peXYyU1J0bWxmck5G?=
 =?utf-8?B?R0NkMHY2SGd3WFdkV2lFbkc3cUNHdHlBUi90eWR3VS83K3ZTQ1FKbFQ5NU5Q?=
 =?utf-8?B?SVNyMnRNMjFIay9ZQkRMWGZXcVcxQUV6cnNNdVQwVzFwdFhCbC91N1JtS2oy?=
 =?utf-8?B?YkJTdmNRdkgxVk1KUG1nYXprUDZCazF3bTJEeDJDNEttdzByR2tOVGdjclBI?=
 =?utf-8?B?UUxLdkJrRjhaQVh0QTNybTBhTTlRPT0=?=
Content-ID: <C9BE1EF583A5794EBFECC14BBD69C88E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 485b2e2e-f101-4290-75ed-08d9f06ba7db
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2022 10:12:21.7355 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a6jk9XpU6tCJpHYaNJ6JRKkbCc6TrOBVtEW4eXpKk/QUpYnKpVS77wf6Tue7NezHYwA8w0CRD9eku0o4VcQwxbmwRSLHUkPa7Xke8u0V8As=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4677
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_021229_020542_5705FE2C 
X-CRM114-Status: GOOD (  20.95  )
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

On 2/15/22 11:58, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Am 2022-02-15 09:52, schrieb Tudor.Ambarus@microchip.com:
>> Miquel in To:
>>
>> On 2/15/22 10:25, Michael Walle wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know
>>> the content is safe
>>>
>>> Am 2022-02-10 09:06, schrieb Tudor.Ambarus@microchip.com:
>>>> On 2/10/22 10:04, Michael Walle wrote:
>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you
>>>>> know
>>>>> the content is safe
>>>>>
>>>>> Am 2022-02-10 04:08, schrieb Tudor.Ambarus@microchip.com:
>>>>>> On 2/2/22 16:58, Michael Walle wrote:
>>>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you
>>>>>>> know
>>>>>>> the content is safe
>>>>>>>
>>>>>>> Drop the generic spi_nor prefix for all the xilinx functions.
>>>>>>
>>>>>> mm, no, I would keep the spi_nor prefix because xilinx_sr_ready is
>>>>>> too
>>>>>> generic and can conflict with methods from other subsystems.
>>>>>
>>>>> But all the other functions in this file start with xilinx_ ;)
>>>>>
>>>>> I don't have a strong opinion here, other than it shouldn't
>>>>> be called spi_nor_read_blaba() because that looks like a
>>>>> standard spi nor function belonging in core.c
>>>>>
>>>>
>>>> then let's prepend all with spi_nor_xilinx_*()?
>>>
>>> I'm still not sure what to do here. Have a look at all the other
>>> vendor modules in spi-nor. they are all prefixed with the vendor
>>> name? E.g. there is a sst_write() which is far more likely to
>>> cause a conflict. So should we rename all these functions? Or
>>> do we just take our chance that it might have a conflict in
>>> the future (with an easy fix to rename the function then). TBH
>>> I doubt there will be a global symbol "xilinx_read_sr()".
>>
>> I doubt it will not be a conflict.
>>
>>>
>>> But I care for consistency, so having some named xilinx_, sst_,
>>> st_micron_ and some spi_nor_read_xsr sounds and looks awful.
>>
>> yes, I agree. Take a look on what's happening in NAND. They prepend
>> the name with vendor_nand_*(). Or in SPI NAND they use flash family
>> names which should be unique. So how about aligning with NAND and
>> use vendor_nor_*()?
> 
> Sounds good. Regarding the flash family.. take a look at Winbond W25M
> which can either be NAND or NOR depending on the size ;)

right, vendor_nor_*() should be just fine

> 
> But the main question was rather whether we rename all the function
> names at once or bit by bit. To proceed here with this series, I'd
> use the vendor_nor_ prefix for the moved functions (but still keep
> the micron_st_ st_micron_ rename patch).
> 

let's rename them all in a single patch before moving the vendor code
out of the core, and then you can fit with the moved bits in an
elegant way ;)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
