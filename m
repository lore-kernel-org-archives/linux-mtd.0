Return-Path: <SRS0=bXaR=LX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9C05C11F66
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Jun 2021 06:38:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 618E261D6C
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Jun 2021 06:38:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 618E261D6C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1ZyZe+sKmRFbLfxR5s3Em+M4rqOmLSXS2bBh+EghJSA=; b=IWqi7AvmMzobT4
	Z2CALOMxZq3l9f3kkMf0wGJI7KADxVE/WYIT21gNBiieP/cpKXOulilm9rOZwSaBnDJdNHm4nePTh
	HNiZF/I2BoHG51Lx4Fwbxtsj40tViV+T7lfQjmzn4YKhZBhpPbbPAdyETk1Cj6qNFxL7y//lkfE33
	rFSFbX3cviOHiPDRC1RdY2QnSpV5zTj1Jxm1dmYSFk3Oqu80buHZVs+300HzUjoSyDGnJkffIdzA/
	rfh9QtCIuUfsXG3ruvpRUBfvmOlP1utx/IkFfTFNKJbDDyHL+QAYLVGOqA3oB1eAYmgFwUi177doR
	Yf2jkj7GjbZ96f5Pt/0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ly7Mt-009wpJ-SO; Tue, 29 Jun 2021 06:37:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ly7Mq-009wnz-5T
 for linux-mtd@lists.infradead.org; Tue, 29 Jun 2021 06:37:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1624948628; x=1656484628;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=5Mnzj29eIRM16sACWvzisWfjedpCx9taKr18TxytdJY=;
 b=VlDdRyJky+NEla9q/JgDzB3q11dut+MBNb3tIlmgVEo52dJYCk1vvqiA
 D1bJ7QU2VpbAZfY6JRsqqv1WBDSBPXqhFYu4205MvFV+6T4/KCxBSj1pE
 BYQ6jMRqH+/WWIc8goIiS7zFxxNZZM+bVBs5v6z+o8KhaHcp8iAP5R0fR
 qddKM6WjO64RSAP2By0HF5X+/SCoipANR9eSOVKTYu/G+GEpJK4grnD+Q
 KY/cWVnxZEGAarym6B0cxLxBTPShmU/fJHD6jRJYe5U8McRHq+cbdZguB
 8dDRzl4mjoJFWhL1MLcuMSjO9HBluyN3cRhXkPuS/6mZs2BewVUi4T9V+ Q==;
IronPort-SDR: 1pEubXjgxomXB4Eq6pVPuj69JOq5VbHHMkFmDZTznjua1BsqcRMtlvO5ZkAe8THr53+oYegDLt
 pa4R9AmZO3e0iATyqe087hjpArnT9bfQ9i7jW7L86lOYqD/nLy2ZgPDd/H04AxU7e1Hda+bt2K
 gqJlQC7Wjxx6g7lQUeYwqFUKzqutQZQ3qpJ5bwQYn31m3JylY4+E95W6Lw2rZuPnSzANKey4lU
 O/nIYejiM5Vr8U0loweltxWegTehe4aAzgdkAE/nsz5pHjMSkPRSeWG6OtdeWEuhZtUwaUSKFr
 4W4=
X-IronPort-AV: E=Sophos;i="5.83,308,1616482800"; d="scan'208";a="126998658"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Jun 2021 23:37:04 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 28 Jun 2021 23:37:04 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2 via Frontend
 Transport; Mon, 28 Jun 2021 23:37:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k7Gy13F5pIcK3PS8rGcPZQWoigydU/kWLdEiDzKuXM0nwpQ7Eov5niFYJVWq+5hCFkoRVYbTBZc5iyX4BVsTULP5HOVFEbeLcHOHBLKxTXwvvKxV+bm28FrgGFZidQddSosbiijHyXnnPjo966suA1JERKvrwUIIi8IlSU596qB/xHBatv6+UvmD62Gfwv5fTn7a7Q1XuFuFZ0pG0E4QEDQV3+MMljP00R4WgCnY21D/GSldXuh+y+Rw3i6HsUUxFodyvDOQLeVUGVvgyLXHNx7mzy/LrGYfH3UDlQJyF0bVrQenkeD9DaNcKo6inSh0cpYa3D1seXoBxDmk6MR4zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Mnzj29eIRM16sACWvzisWfjedpCx9taKr18TxytdJY=;
 b=M9tdwiasC0VTbCSaRNygIxNAa4ab/vIDkP8jWiRrkO/hiFk5GFiQ4i31aTrCklC9mYOAYwXqgprmdvMuVoDW5XIWIW0vPA3+l7XYGpVFCKg5zePftk9e8SPVVWSKJQXQMrLwPKIyd6y/xeRTG+sLA/A8jHalm7gKRik53PFDPy9mDq0xEXkLNc76BboR5Peaffr8W907LyYtFjqASsnypW6o+gNB81tDBlhLFFOGDrOwveMhZqqQkS2ammeC/7U9nlxq0YKeN8Q8qk3g9uyfYBPa7BTv9Z2Mzk4zUkgEnEtda+dZAOOFo0rNXqwjT69e04/nzewqpbm0meY5qhX3Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Mnzj29eIRM16sACWvzisWfjedpCx9taKr18TxytdJY=;
 b=jkRO2f8yGx5Y1qAgYfUsXLnTRRq6NvzzIqXu349z+Db4Mh1mt84NNoBY0Aqugn0pS2QAAqf8J15TxW6l2wT1oGy5RIAzLybMvkFYjqS3fhcYOuorgS4wUYW3aiYISNiSNPthWH5EPH6U5eatpGYRxi/tBcg7ee7BJ3QdlBl+U9Q=
Received: from PH0PR11MB4869.namprd11.prod.outlook.com (2603:10b6:510:41::8)
 by PH0PR11MB4919.namprd11.prod.outlook.com (2603:10b6:510:34::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Tue, 29 Jun
 2021 06:37:01 +0000
Received: from PH0PR11MB4869.namprd11.prod.outlook.com
 ([fe80::5067:83f9:991d:2ab4]) by PH0PR11MB4869.namprd11.prod.outlook.com
 ([fe80::5067:83f9:991d:2ab4%9]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 06:37:01 +0000
From: <Tudor.Ambarus@microchip.com>
To: <zhengxunli@mxic.com.tw>, <linux-mtd@lists.infradead.org>,
 <linux-spi@vger.kernel.org>
CC: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <broonie@kernel.org>,
 <jaimeliao@mxic.com.tw>
Subject: Re: [PATCH v5 1/2] mtd: spi-nor: macronix: add support for Macronix
 octaflash
Thread-Topic: [PATCH v5 1/2] mtd: spi-nor: macronix: add support for Macronix
 octaflash
Thread-Index: AQHXbLEq6Sj/2A0DlUip4R14yxJLfA==
Date: Tue, 29 Jun 2021 06:37:01 +0000
Message-ID: <59855ba0-31d8-25b4-3000-ca493a83fe00@microchip.com>
References: <1621232088-12567-1-git-send-email-zhengxunli@mxic.com.tw>
 <1621232088-12567-2-git-send-email-zhengxunli@mxic.com.tw>
In-Reply-To: <1621232088-12567-2-git-send-email-zhengxunli@mxic.com.tw>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: mxic.com.tw; dkim=none (message not signed)
 header.d=none;mxic.com.tw; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9fe1bd49-d22c-4c25-28df-08d93ac84d6c
x-ms-traffictypediagnostic: PH0PR11MB4919:
x-microsoft-antispam-prvs: <PH0PR11MB4919DF3C8B86497921E096D2F0029@PH0PR11MB4919.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: h/r/LmqIMXM9mrRDE7YZhUxVI0HXfJqaPAhENsQtx62d/HH/Xi0SGY5q0I4dT0kETMPqJvDYMM7aGUciVik3ZDcfOqE5+VzczI9MsKucuzMjofQx65VoszHUWRw87pUzhinXSB79Gip+cg1FzRgUkWeNTURTawTIb99i8TtlSfvBvin7BCcylFn3Mz5Zm9j4rR4aenyhYFITQR7pbkc32xepFcuKEc5NMRigQW4WK5YYWcPu5mCXOT1GTPA7MJqGlcGDL38rvT0lHAY53QdY05iI3IdpdFNk7GMmVsJDBAMXzVXcKRNm9iSE+iLAtQLlYeJworufJ6BPuz0T6wyBHV9O3IcQfN9taLeRFlqFpgQNacSIeMp9JhxBhxIfd8lcQV40lyoz4Qspc9/DFDjGZimcfo9v7VWNy63RGLjeKN0zlEiCUU97MVYDHobM4Ih9MDuAWDsU4VX7lRZZ61p1WLUp9Ze6k4icgOUeRVaHzJvI1JGAaPLZhdLnZKPKPghuOOPHYyQ9xHU5ZcUW3di36zCUqwBEcwySP8auEGumeIaTRLiYSngo60ei5GZLnEOdZk3qcsYLiyOqZUe7paDo5w0UIR3/MxfWP+YzHudO9nKkH9F1a3N9YjyS5kqfWvxVgTO3emGrgnh2tOlPESIz5R7Pn5KEcN/7i784vfHwbYTd0PEeVCsJitltkOTEM3e/HZd6gQ75aGRtoBnAms87X1jolp7bItW+P769MVn6Lk4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4869.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(346002)(366004)(136003)(376002)(396003)(38100700002)(122000001)(4326008)(31686004)(53546011)(26005)(6506007)(71200400001)(8936002)(6486002)(8676002)(2616005)(186003)(2906002)(91956017)(76116006)(5660300002)(4744005)(36756003)(478600001)(6512007)(86362001)(110136005)(54906003)(316002)(31696002)(66556008)(64756008)(66446008)(66946007)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SlloTm5mVGtvZjZHT3VlWVNsL3hIdnhFcGxKNWdUQ1Bma1puRjd1RHRORU9Q?=
 =?utf-8?B?d3VoazFvYnlHVXZyRTJ1d2oxL0pOc0FHdnAwS0J2UUNHaDl2NTVPUGovU1lN?=
 =?utf-8?B?Kys1MVcvN3IzZEx0Vjh3NnROYXJ4RUZPVGJHY29RWUIxVGMzdGJ5c3hNdWpn?=
 =?utf-8?B?Y2dWMWZNdmtkTENRQ1ZXcDRuTEgxNnRseXdNUHROdThoYjFvaTg2L29DbXI5?=
 =?utf-8?B?OTJOYnJaNlNWSUI0cTBIblU5eDFvQnFrbVlOQzFkT0JjQlpVS3dCNFd4REFw?=
 =?utf-8?B?Qk1DTkJkSEROYndsOVp4SXhTYnhEZnV1UTRzcDhwdzhOMVZWMHY5MCtJTE9h?=
 =?utf-8?B?MC9iWGpJWU0zc0tucVJSdlgxNWtsT3BKUG9OTWx1eExLMG5VSFhPQXl3WUJR?=
 =?utf-8?B?UzVDN0xINkJ2UXpyaXluVkIvZkdDTzRlcndHeGJUdDl6OEZtRHJRNHE5WVk0?=
 =?utf-8?B?UG9OaXdVbEZlK2p2Q1hZeGpkc3hTRS8xV083MldHUjhsV1luSVZwSS9lTFpL?=
 =?utf-8?B?bUNKZGZKbWtYSFFBWFl6eS9xT2UyNGwwNkpaWklmUzAydllLc3h0bTlYN2JN?=
 =?utf-8?B?U0gxUGZpNC9XOHVhWklWQUlHN2wzNTQyZS9VL0dDNk95emJxeDA4RXgyMjRr?=
 =?utf-8?B?QXJJR0tISzJ2RkJxM0lkd3kwYlRDVXFSUm4yRUpsbjhqclgrTi94VjFnbER6?=
 =?utf-8?B?ZzcrSFh4bkxrTE14MWcrZWlzOCtsMHhIbURrWGNtN0JOYkh5WDh4QWZ6SzM0?=
 =?utf-8?B?ZmVwTkgvejAwOExBMXZwT2NsRHdFU1dtZ05OTEp2T1g5eUlWMHRma3BHSnZ1?=
 =?utf-8?B?bkNPby9JdTBoWXYzaTdhckxtNjZML2JBbmxFRnhLaWtQL1BLbGNUcTdiNXM0?=
 =?utf-8?B?WThOTENNS01zWFYrUmJ4dWdSWjBNd3hiT2lmWHYwd0paWUtYQ2w5SXhYNEJW?=
 =?utf-8?B?RThUS0NCZ250VHZlMWZ0ZW02QjVCSzBISGtTUlBwTVVlbWI2YS91d0ZQWEFv?=
 =?utf-8?B?V0dHRHB5Z01ucUwyRmswVU8wU0tVVDRlTGRlaDNMMmZONW9tTGVrdWkrNzVp?=
 =?utf-8?B?dUp5WStwcExQM0t3VDRsVGluOXROMTBQcFlUVWoxTzJaRHgzZUFFdWQ3RnhF?=
 =?utf-8?B?bXRyOVRYMUhKNTVHMUlCdTE0UUdXb2ZHcFlMcUhuamluZjBtYWRVWWNhVnRi?=
 =?utf-8?B?T0w1Sk00SXBMTlBMVWdURDd2SVhjekRmRlM5TGxDcFZxVW16eGZMMzZrTUFV?=
 =?utf-8?B?M0ZMcW9uNk1yNzFWd3Yvc3RKVmk2alBDaXlHSXdiYU4vYnhEVDdYeDJ2OERP?=
 =?utf-8?B?RjRYNk9qTVlzWXk5ZURraEpVSDlqVWJuMWJPMmxHWnRRNU5PMXh3dGFSOVpj?=
 =?utf-8?B?Z3ZmVG05bEloZzNBUzRzY1B4eWxxOTJLODV0M0Vnc3lHMzI4ZVBZVURwdXdp?=
 =?utf-8?B?VWx0aTdMTlQ4WE1aaXVMOUMrOCtMNmppUllTSi8wOGRkK3pmczRIbC9BWWNE?=
 =?utf-8?B?UGk5Ky8wem5ad3R5cEIwSDh6dE1QdXEwSlVHR215L0syVWxLdDRtNGR2TGRE?=
 =?utf-8?B?bFh4Vk11V0R6by9iajVLc0V0WWR0ZklzZmhVUVpKVW9rQ1huWXBkRTFTZzNG?=
 =?utf-8?B?dllhYnloTHJnQlNCWXNUNy8xazY4RGZIeWNINkZtVUU2cE92WWdIcENSLys0?=
 =?utf-8?B?U042ZVhwK2UrS25zVXFTdjkwb0NqRzhCOXNIUGpKZ3ZrenVId01XM2JTYmlX?=
 =?utf-8?Q?Zyoxbs/UXCmRckQxrM=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <F72524BE71994A41B5ABC130B404C812@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4869.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fe1bd49-d22c-4c25-28df-08d93ac84d6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2021 06:37:01.5105 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5fYc4n3gto4sk57yNSW2ekAbm4jWUCEmC5fOARK/vB5BDVNQoV+kYOenKu+8WdQ8tZRWmbqg2A66KWMwwj+UiJZuxgzchgDzrGqxAs/vGQc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4919
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210628_233708_336497_684E91AD 
X-CRM114-Status: GOOD (  11.02  )
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

On 5/17/21 9:14 AM, Zhengxun Li wrote:
> +       { "mx66lm1g45g", INFO(0xc2853b, 0, 32 * 1024, 4096,
> +                             SECT_4K | SPI_NOR_OCTAL_DTR_READ |
> +                             SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
> +               .fixups = &octaflash_fixups },

I have a mx66lm1g45g which does not define SFDP tables, how you'll differentiate
between the two? Mine will fail after reset. I'm working to address the flash ID
collisions, will send patches soon. I won't queue any new flash additions until
we'll solve the ID collisions problem.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
