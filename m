Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 422ACC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Mar 2022 13:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xnb4b0DFhtJUFQdS8/qgQJ1bhB/ICyxSge3fj/Wwg44=; b=pR6+dd5WQuLTAa
	wXoQedRhst2gPVpl0YOHKrt6lPxR6NDzZnmSTOv8Jv+SaCz3tQBXAAqddwx0tuXEpp/c0CoehyhqG
	QjELhYXMKqq0BI2eNf5svp12NCAMyJe1IphUkkhlrODcY9uC01iCwbsS86pkamQ2gqDKisuBJeEDM
	o9quQMhAEfm306KDmVL6dhYDK9e4Uas4QFLeE9CLzEehcz/yih+F81KknXzhGh2wG0MXO4T+LgLEr
	C3r4h5qZhR2JcJ3hEfmlcsyyP4qOs1TaWPXqcuGYxNkZdfuqeCErrUx/Sjd+qNPg/ShAOaD6oBAk7
	3Oe0Mrs8Qu3skOy1LjYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWHvz-007puU-Jk; Mon, 21 Mar 2022 13:18:55 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWHvx-007ptU-1O
 for linux-mtd@lists.infradead.org; Mon, 21 Mar 2022 13:18:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1647868734; x=1679404734;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=qSYNmMRMjSUARuEj4yh1w8tkeOusuOaeckSbL1nz6dM=;
 b=0SM31iA+/S8uTuFbUPxOcPCuZ/crcJan+yEcr4VBvI21WAYl17mbXWbA
 ShfwOwpjmwsYVQ8Rb0XXRViIhzGmTAL8OIvX72+ct13Lo6ZGAbgJ56XVf
 qlrUYnrn90Hh2sZtUJDzIn4kYuwfbMgfmY0st3bt+GiWrqW6n3Rtt8wmF
 ILzSXxBM/UUWsE1IP0XefBd48ZKMdPZEPXWkW+NrT50MR/ArCSduyZ6Jg
 DS8QW4AR5qSk16o9kxB78I94T1IXJkyODvEZpP7TF3GcssqgGDkuitmvZ
 138yO9CtyTYTdlj3RfOnyFKgC97TPi/qHPMk2fczOVATZq/LjGNfJzPxG A==;
X-IronPort-AV: E=Sophos;i="5.90,198,1643698800"; d="scan'208";a="149856822"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 21 Mar 2022 06:18:52 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 21 Mar 2022 06:18:51 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Mon, 21 Mar 2022 06:18:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fLzt3mkrTZFtZ7OK0Roa3wQF8EfB/2rLdx7I9VU2dihXGCFtYi3sttTP3rDI/eT8zh1WaEcnLRdBLQrGYWChsf3Oz8mk4EE/06WAXTftG7pP3T3OkmTwgLhsn7mAuaQe918prsBRc6aB60zh281fJvceeaZ1uFjVCYsYShAE4Qe5RB98SrZ4DaqNY5RZ//W7c/IOUYwhKqsYck3ZTuGoHOHeWyFRp3B1Pqepz9lOEvzXWYWdggXwqs7Sh7Q5pgqtMQUQ9+B5MpZ7f3VpDUsxPmEKwOPlUqDZtj3VCIOwjNqwcJjuIHkwV6XPVA68wSvaMCOYKKoCrWihFkjk3CTBEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qSYNmMRMjSUARuEj4yh1w8tkeOusuOaeckSbL1nz6dM=;
 b=XVz1IEGqgwPkyGAeDogFADw0JPO0TqIsxFifts1hw1+H3klNrAB7AVZ5JoHceBtaqbVdByWGk9xWsGXokJb7JzHwC7xKVUSS5sG5WYk2J7u2pl1/5AqJVlQpqqtbpGf+0nvZKKfJirRcrvqE7CCN+VpV6/BPvFZDXlxck9ckdgaXen9xerhWguWGXU6TcBz1PXAHnDhwYgBVzwN0Z0853IxoIOS9Qw1CWGxax77foMBFWo60yzFawJ6/UTnAK6Q1LQuQVsqgUNMpU40QtO6PjbPDDtdKoOx9ug5Yo56ExOZPkJV9FcdYjVPU3J3803Jp0+uSHh18UXJVdQoaD2PPEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qSYNmMRMjSUARuEj4yh1w8tkeOusuOaeckSbL1nz6dM=;
 b=bAoS5K1T4YI2VNkbprIfoecEjK+hGj26WK8E4ivGHwUnO313Eg57+quLN8QAj5wzgPMqJVcV2uCdsh7IeevtfKmEee9DZrKkA56yhXpC3e89e/Njkr4dtEPVOLNncuAFVap6f/Gsz1i9Xrf40+/FjkF5JXKX1wRIHAfcsXkb37Q=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA2PR11MB4969.namprd11.prod.outlook.com (2603:10b6:806:111::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Mon, 21 Mar
 2022 13:18:49 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::b828:b4ef:5cb:e551]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::b828:b4ef:5cb:e551%4]) with mapi id 15.20.5081.023; Mon, 21 Mar 2022
 13:18:49 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>
CC: <michael@walle.cc>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <Nicolas.Ferre@microchip.com>
Subject: Re: [PATCH v2 4/8] mtd: spi-nor: core: Introduce method for RDID op
Thread-Topic: [PATCH v2 4/8] mtd: spi-nor: core: Introduce method for RDID op
Thread-Index: AQHYPSYy5Uot3kf5wUC4x8ym1emt7w==
Date: Mon, 21 Mar 2022 13:18:48 +0000
Message-ID: <32b3449a-66db-3ed1-da96-47e124800500@microchip.com>
References: <20220228111712.111737-1-tudor.ambarus@microchip.com>
 <20220228111712.111737-5-tudor.ambarus@microchip.com>
 <20220321122149.dvqyml4riqkr3gqi@ti.com>
In-Reply-To: <20220321122149.dvqyml4riqkr3gqi@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3a3208d1-a767-491f-b89e-08da0b3d5602
x-ms-traffictypediagnostic: SA2PR11MB4969:EE_
x-microsoft-antispam-prvs: <SA2PR11MB4969B1CAC8A1BB24CC6334ECF0169@SA2PR11MB4969.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6LQYo7VmysZU4S+Zl91XuXthIbx8GqlPDeHauzwFgjm9ViQ4vgijuOnT/rMimmYPzSWCAlEuPEXQZw4nyuBcJzLkh3xn4XPpZwl/wCKtBM1CYrxGsQA3vzvRCZh50Etur7K+HBpltvzcmwUEB8avkDgn5olAYHHdyqz9YK7Qs9Hjdume2J0bBnAf2hn10JT3LKnLqr9otOJwCMKvy76o7C/g0WXZfFOmxWXEihqdlLMnUnKEEYQ/nUrDE6onw4x8EbeGN9EIYrQ2EkQyyIP6NlCWuSReUD0CnQMY+Vp53atokj/aip8Y//xmsrX3hgbtReyv8Cr3SlACVBqyS61Io56zTggraQzk1o2RKBqpeS4yzKlSfkfkHHxQtH4t4nTmiu7doNa8OwYvSn8Q4pkfFfdflAMIvF8qVuYpCsF7STI6XQ/hWZrDrgemiWYFjnBlm39aOEJH4QzMY5+NYTLEPwHlA6q8GrL7JEJIXAuwG0uzvUvi3qU2MqaMW6TAW4roVHq+Es8/BJQpGJjQF0pXjB81xTZVbEdpCwMejlmPG4ENE1O34FNru3tjN6dRnSCo969NuslZWpwg1vlKL4g8QZprl/I/ypmCE5XmT1UgseumDVZtu/mInmr2E5k2+CA4R4+8gVtO/rtsJ0hrhd6ucE00fY/AcPeiumYsP1KOQrNv3QEAi5kA8k69jRTuuJ28D3G7yAn5fdq7vReLkOxS9xWuE8MfUe0hwCji2GfRO2GoJZkh6daxPpdCgHg9uHlOC38S23qEFBbjkC/un3GN6Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(2906002)(2616005)(53546011)(26005)(186003)(38070700005)(6512007)(107886003)(83380400001)(122000001)(38100700002)(316002)(91956017)(8936002)(76116006)(8676002)(5660300002)(4326008)(66556008)(66476007)(71200400001)(64756008)(66446008)(36756003)(86362001)(66946007)(31686004)(508600001)(6486002)(6916009)(31696002)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?czI1cHJjb3poell1K2hER3J5Wkp3dGF1ZFhzcTJyYXRwc1Z0WHF3Z09MYjdj?=
 =?utf-8?B?Ymlyc2sybHl3N1NEMUM1anJjUDI4S3ZMWThyY09XM29WZmdoeUJRc1M5Z05R?=
 =?utf-8?B?NXJ4b0FVZXV1UUF4Njc3aUk1aHZRRkx1VE54MWRYRTR0LzJtRE5kNHRlcnVU?=
 =?utf-8?B?emxVamtqQUlXUGhJUUV5WjE0UWVUUUVjNWJhTDBKRnBnNTVVbEdZdWNiSWlK?=
 =?utf-8?B?dHIrY3crby9yL0o3aUdtVStqV1FpQ3RJL1ZCbEhBZTlIaVBtRUp2MFdTZTV2?=
 =?utf-8?B?Z3VtNVpmZFU2amZNdEFwalYvWXVzM0lIODlVby8zTVhpdDVHY2NEZUsza0ov?=
 =?utf-8?B?cytzNHVTZlpDVVRUKzFJWDlGSnUrUkdZUGxCd1YxWThDdnZ5SWNLYUxEUmVs?=
 =?utf-8?B?OVNOVERUcXFhOWpZbW9yNDZWeExTa0JWSFovTmFlT1FBT2kvemh2dVdJbnM2?=
 =?utf-8?B?aUsrOHNrTzhzVVZQMy8yblNLKzRZVmdsQkQ2TUhQdmhRTXJrem9KanJZNGhR?=
 =?utf-8?B?SFA1a0xURHpOWWNwRW1TckhUWGlrNU05RGZDQkgrRzc3ajN5bUYwbEZCdUJZ?=
 =?utf-8?B?RDJlZys5eVVMbjZ2OTI1OHZacXF3eW5MVmQyK0dOTHpQRXRMK2w4K0lhZGNW?=
 =?utf-8?B?YkljckdHRndTeVNpRm9aaTgrWG00ZU4xaUVSOXBlbVlMSTZncTVNdVkwWitX?=
 =?utf-8?B?U1ZucXdySDZFNkV4aHRtd1d0VHl2dnUzbVh3Z3BUdWJNbGZpbGl3UUNxdWkz?=
 =?utf-8?B?SVZHRTRmcTR5UFZlOHNya1JxUHYreklRZ1VMZ3VZV3BKdk1hc2VaNVkzUFV1?=
 =?utf-8?B?WGFGUTVGR1Rrc0Z2MENRY3YveVp3SVBnaXl4eWtCbG9mK2tySWNaUC84bEc5?=
 =?utf-8?B?bXlKWTBVK1dIMzBtTzRGOSsrMEVubXJvZlpDT3Y5SEpnUDNPbTZ6WFhjY2VY?=
 =?utf-8?B?YXAycm4wWXBUN1pScitQdXJVUDQ0Nk9hOTZmb0NFT0psSjZpSWFOMThyaWl5?=
 =?utf-8?B?SlBFakhkUHEzT0piYUVqd1YzNndqNitnRmxBS0srNy9kUlJHWkN4RS9RY0k0?=
 =?utf-8?B?ZTVWMXUvZEhGOXhQMTRXdUY5ZzFxbmlvOGFWRnZJU3pqeVFOVWNUWElRak81?=
 =?utf-8?B?VFlhREdwWlJKejd6QjVEQkZmdzBCSzljNjVRd0xMdVd6ZGU4aHlIZmFhWXpq?=
 =?utf-8?B?ZzR1b2RUbnVQWHY4TU1ZY0pTZGMvYnlsdTRXZERodjVPaDdRUDBNOUNkYWFk?=
 =?utf-8?B?VmE3ZE9NRDFDWDFMcm12Q0xuTGgyZ21tS0d6a2hlekZUaVFkL200YXVuTUdJ?=
 =?utf-8?B?bFF2RnpXczVJR0orSFlUclU4cVZCKzFqWFFTQktPYzEwcVpvM1Q4ZVh1Slg0?=
 =?utf-8?B?MUppWTlMMHlyV0JDMjJuWHl5bkhpVWVtWGwyUC9EeDF6TXFFTGtSMG14OFhF?=
 =?utf-8?B?UGIyK0hTRnc5R3hpMTdFQWRiWU9Scko1RFhxZE42c2xKNFdpY1crenJJNlJ4?=
 =?utf-8?B?R0xpdzJER1FEOWtnY3Q2RGJ5Zy8vMUt0OHdPWUdwVGxuTWxZL2tNZVluUVpK?=
 =?utf-8?B?T1Q5ZW9pM1IwOXcxUGVqQzQ4ZmtvbnFFV2FyLzdTaExmdXkwcGZxMkN3dXc5?=
 =?utf-8?B?NzZUWldZNHVaOG1CQWlFOTRtSmkxbE9CdCtHZzRUeVVnS0dlc0RCekNPZ2hH?=
 =?utf-8?B?N3dMVmZ6YlF4QjltSTZGZkFsZEVkTm40UE9WRkJGLzhPVjJQcTRUckpJMUt4?=
 =?utf-8?B?aVYwQUZHNmN3OWhab2IwYTYySVhraUYxVWloMnFVMWU1blVmcDZRRGhPZUZK?=
 =?utf-8?B?ZWR1ZnlKcytJVW9ndW15K1JIUTdkWkJuOTFNM2gwU0NuL1B4SjAwYjNUcWpr?=
 =?utf-8?B?WVNlR2djdkNabmlsN1VEZlhkN2tNOXlQSGYvdnB6cGNBN3p4NExNdDhtZzJa?=
 =?utf-8?B?UFFycXRKendGamVjcjR6UzN5Y0N5bm9yNHE3MnlTK0RHdXNjK0w2OFF2TTBm?=
 =?utf-8?B?eW5qSlg5MDNnPT0=?=
Content-ID: <E64BC9893EB05945B2EE8A03DCA20E35@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a3208d1-a767-491f-b89e-08da0b3d5602
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2022 13:18:48.9807 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8lcIbx6MMyIKACP6TD4glOI1o4Hket0S1I7Dghyf7PbTxAWPgE1pA90VJXdkt5aLA2SY+Sdp32WL5Tg0zoWZNZyoDFYZPhqQLBO+YdbZqHU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4969
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_061853_207533_0378D5FA 
X-CRM114-Status: GOOD (  24.58  )
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

On 3/21/22 14:21, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 28/02/22 01:17PM, Tudor Ambarus wrote:
>> RDID is used in the core to auto detect the flash, but also by some
>> manufacturer drivers that contain flashes that support Octal DTR mode,
>> so that they can read the flash ID after the switch to Octal DTR was made
>> to test if the switch was successful. Introduce a core method for RDID op
>> to avoid code duplication.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>> ---
>>  drivers/mtd/spi-nor/core.c | 58 ++++++++++++++++++++++++++------------
>>  drivers/mtd/spi-nor/core.h |  9 ++++++
>>  2 files changed, 49 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index b1d6fa65417d..281e3d25f74c 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -369,6 +369,41 @@ int spi_nor_write_disable(struct spi_nor *nor)
>>       return ret;
>>  }
>>
>> +/**
>> + * spi_nor_read_id() - Read the JEDEC ID.
>> + * @nor:     pointer to 'struct spi_nor'.
>> + * @naddr:   number of address bytes to send. Can be zero if the operation
>> + *           does not need to send an address.
>> + * @ndummy:  number of dummy bytes to send after an opcode or address. Can
>> + *           be zero if the operation does not require dummy bytes.
>> + * @id:              pointer to a DMA-able buffer where the value of the JEDEC ID
>> + *           will be written.
>> + * @reg_proto:       the SPI protocol for register operation.
>> + *
>> + * Return: 0 on success, -errno otherwise.
>> + */
>> +int spi_nor_read_id(struct spi_nor *nor, u8 naddr, u8 ndummy, u8 *id,
>> +                 enum spi_nor_protocol reg_proto)
> 
> Nitpick: Could just call it 'proto'.

sure, will update

> 
>> +{
>> +     int ret;
>> +
>> +     if (nor->spimem) {
>> +             struct spi_mem_op op =
>> +                     SPI_NOR_READID_OP(naddr, ndummy, id, SPI_NOR_MAX_ID_LEN);
>> +
>> +             spi_nor_spimem_setup_op(nor, &op, reg_proto);
>> +             ret = spi_mem_exec_op(nor->spimem, &op);
>> +     } else {
>> +             ret = nor->controller_ops->read_reg(nor, SPINOR_OP_RDID, id,
>> +                                                 SPI_NOR_MAX_ID_LEN);
>> +     }
>> +
>> +     if (ret)
>> +             dev_dbg(nor->dev, "error %d reading JEDEC ID\n", ret);
> 
> I think this message should be in spi_nor_detect(). Let octal DTR enable

As of now every SPI NOR operation that return an error also prints a dbg
message. I like this because it offers a smaller granularity on the error
cause.

> methods print their own, more specific error messages.

How about duplicating the error in the octal dtr enable methods if you
feel it is worth it?

> 
>> +
>> +     return ret;
>> +}
>> +
>>  /**
>>   * spi_nor_read_sr() - Read the Status Register.
>>   * @nor:     pointer to 'struct spi_nor'.
>> @@ -1649,28 +1684,15 @@ static const struct flash_info *spi_nor_match_id(struct spi_nor *nor,
>>       return NULL;
>>  }
>>
>> -static const struct flash_info *spi_nor_read_id(struct spi_nor *nor)
>> +static const struct flash_info *spi_nor_detect(struct spi_nor *nor)
>>  {
>>       const struct flash_info *info;
>>       u8 *id = nor->bouncebuf;
>>       int ret;
>>
>> -     if (nor->spimem) {
>> -             struct spi_mem_op op =
>> -                     SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDID, 1),
>> -                                SPI_MEM_OP_NO_ADDR,
>> -                                SPI_MEM_OP_NO_DUMMY,
>> -                                SPI_MEM_OP_DATA_IN(SPI_NOR_MAX_ID_LEN, id, 1));
>> -
>> -             ret = spi_mem_exec_op(nor->spimem, &op);
>> -     } else {
>> -             ret = nor->controller_ops->read_reg(nor, SPINOR_OP_RDID, id,
>> -                                                 SPI_NOR_MAX_ID_LEN);
>> -     }
>> -     if (ret) {
>> -             dev_dbg(nor->dev, "error %d reading JEDEC ID\n", ret);
>> +     ret = spi_nor_read_id(nor, 0, 0, id, nor->reg_proto);
> 
> Hmm, I wonder if it is better to explicitly use SNOR_PROTO_1_1_1 so
> clearly signify that this is intended to use 1S-1S-1S only. What do you
> think?

I would keep it as it is for now, because it offers flexibility.
If we ever gonna determine the protocol at runtime this will come in handy
because it will work without touching the code. JESD216 suggests an algorithm
that tries to determine the mode depending on the SFDP signature.

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
