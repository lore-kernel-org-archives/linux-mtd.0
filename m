Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF4CC433FE
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Oct 2022 04:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R9B1EXlK/l8K4rvaWzXy6geQVD2O3STOxr891jhB8m0=; b=gVOQyaK3jcGx9J
	uRkE33lFMaij3/5VdNu05EPkuFuuFCAfCjqAgt1BDWXTBq1kGWaeyf/nsNI5wgjCXuvktr4sbDKp0
	eGeNNOEvPl61rXGVMwAcqv6U1S+E4rGvnHXgORgo3/9Fm4WHgUsOpQzHZh1nskWXTkEkYKbVWEDpD
	FuAlREKoJyMsYrbAB9/UIshKf391KEhtC58B/0HMJRkfb5BPC4FHddl3A1r3GZbQdzTZwwjChSdOO
	/nCtRuYr8r7iDATs3uH66ZdBtwehQ0A4S0O6NlaVj/Yzt7536kw77LIdMaZnnFI8V8dtK+wegOh3D
	gem8FvWRu4b9E1NUv7mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogIw6-00HUef-2i; Thu, 06 Oct 2022 04:56:42 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogIw3-00HUdS-8W
	for linux-mtd@lists.infradead.org; Thu, 06 Oct 2022 04:56:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1665032199; x=1696568199;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=wHhVfk6RE34ND7VsGFj3F4Ch91Qt5R2dh2sbWPqC/lg=;
  b=gr6rVh2f1KvYXlNwTq2pTlJ4AhIFcR6d4yOYRhX28L939R2CGImvllvq
   BE5B6QCGUhC8GdIi8bJatYgJBl2QHHr9my0gElpevi/9NiBzNMQE2Z1a+
   HLjz+beBQPCdZ4IPmjUClLzLYv7zfrXHQMQgJ1u9lA3g3dHpF/2PwRNSE
   lRc2I7TH7hy/oK/HOGOc8u6eZFPiYPwEWNpvhTh4VmfNHWfVstHVlccmX
   8qAhnBzTKs8/sNKmfQmqmlV9pwPeG1ULx0c/vchNjQnKbkJrhCBtwKNZh
   WTgsZdOWohuMzfNJs9Dsw91LKHp59P8L8ba62W2f1B0n0eGmulYOCUFGZ
   w==;
X-IronPort-AV: E=Sophos;i="5.95,162,1661842800"; 
   d="scan'208";a="180630928"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Oct 2022 21:56:36 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 5 Oct 2022 21:56:36 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Wed, 5 Oct 2022 21:56:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bsuM+4awzIKBTzoEsAnVr2rddqbTxUGapvi8OMqVmwht8phgsOdtN+iCVTzuI4uqtogr/HK/4lWeeZbn86OA0uhttGUXFasgmu5tWMPuvwsqot0162JmI4oIkBaEuQ3Wk9CHeuVJs0BO2JlWU+LhpXjKM27JptCd0abJA+V7HoAbCTQpjO5lD/mJcW24XtuGdeoXxF4m5yCX+X+2lZoOfzaBzJeHFRvs/fXu2SvXn6EErpJi7NCABvlVFCKCOo8kupxsSRICUPobMTjZIYOuKOTyBgyr2VkZQCpBf/kzfMbEYemP3Tqv5ZZLSoZMIIj4ZJ0RmtcC7P0/pZZHJXxB/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wHhVfk6RE34ND7VsGFj3F4Ch91Qt5R2dh2sbWPqC/lg=;
 b=mHjyvAT1yT/shQrjUYZSPMsdZwNMVlk0teFSZXJK+5iZhjHwaWT4anBjFli9cRqls8k9o7tczIcrx59bYl5ycV/bsq3Dv8lO7XllB7kvYiqgJbgMZfeEdNglLudrnZ+nPjmMxL4hoiHixR0KxofWzVB7tlZ7mSmzF9l9y0ERRIEfFGsR5nAuYXVAU2kTGkVyQcMon00hkutm7BSFP+tPhGdkIeQwxj8JWF7XVc/3wDuexOM23eZ94gAOiCQM1EfwKTc9Z1kK8bBF9HcDFrBVI223WWzKoG99KPxIS/JWwMUw9OIq/LMZ8MgGoXIubt8RlvY/UtOxXwr2K1vzA0Ze4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wHhVfk6RE34ND7VsGFj3F4Ch91Qt5R2dh2sbWPqC/lg=;
 b=k0DaVdavvuCG2WhVukWYpMIiooMM89z643kvi4+8N7SaP4W05n8X+CVMsKo2mkd6nif96JSOonTY++emAXk9MYmYbvmlZl1gkZsBIfjwSXti/08+porKeD3hMWbXmZZ/IRq2eHgXjnv2xSsczqlj1Ux8Ju+l7mE7tDCN3iVWfgg=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 PH8PR11MB6829.namprd11.prod.outlook.com (2603:10b6:510:22f::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.24; Thu, 6 Oct 2022 04:56:35 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::c574:f416:8a72:18f8]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::c574:f416:8a72:18f8%7]) with mapi id 15.20.5676.033; Thu, 6 Oct 2022
 04:56:35 +0000
From: <Tudor.Ambarus@microchip.com>
To: <mika.westerberg@linux.intel.com>, <pratyush@kernel.org>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>
CC: <michael@walle.cc>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<vigneshr@ti.com>, <Takahiro.Kuwano@infineon.com>, <hongyu.ning@intel.com>,
	<linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v2] mtd: spi-nor: core: Ignore -ENOTSUPP in spi_nor_init()
Thread-Topic: [PATCH v2] mtd: spi-nor: core: Ignore -ENOTSUPP in
 spi_nor_init()
Thread-Index: AQHY2T3fePCZ/Lfg1E+SS6lAXFxdaq4AzYgA
Date: Thu, 6 Oct 2022 04:56:34 +0000
Message-ID: <85f9c462-c155-dc17-dc97-3254acfa55d2@microchip.com>
References: <20220923093441.3178-1-mika.westerberg@linux.intel.com>
 <01bb5297-1723-2292-1060-f3a003ddb129@microchip.com>
In-Reply-To: <01bb5297-1723-2292-1060-f3a003ddb129@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6479:EE_|PH8PR11MB6829:EE_
x-ms-office365-filtering-correlation-id: 7e756879-d0ba-4645-6b53-08daa75724f2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1QBH2ijCI6rNk8gggAIOhrJ1ETGJcKQsI2iL1LBovoNhHbD4KB8CWdcKKZZ4e9X6IrZ3yC2uL0G2vTfwX6pmruIrOXD1gR2DGWRHZkCW0Ri2ieZQOUxrBecIr4asdfD0OctLBdPYVecNGQbbAdFdIhsgAxZZ+TG4ypnlqGj4up7bFkzURfz/dNQIqutsHa9Q+55PaDw8Uu9sfxjQ4OsLJ5j7BGYt3mP36jvC9dY97ZAnpbf4FFQHUXOFxMwqpknK4xRVLUzl1U7eq3W2WzFkLrYIZI3oLAiFEpMuHWTWsrSVTXiGkxqfHURYG4t8Trw37jex/Z7cgpKKWBLzx6IzOW1M/v12LjDgl2jzL8tDh0rUd8xW7sNd1lybX8UvHTwJp6+UHSvgJ8GudCiSrYQH+rdyW9lpVbvCG+cbSOkoQfIOzxpYIxzTE8EpWJCcVjbBwt8jiPvrkPe2c2KsMCSgN85FKaldWYy0VMGorvr4h6HCk4CGjMallDZS1GA9ZAPzoa2DvHMJqWWAvJ73n0EwKE5tiasOZQKiVjn93irJ91g2uBTssS+/o7nbvfF9edpsW2XnmIr9OVcAW+UsJz1z1QjwKCES1Sk/FNq/9COUAE0yERAt+mWvaA/i2oTu6n/4e+QbFsJCNjmpeg5jytnfMjlIquVTwDpG7C/6oxMcXievFHwfeg0x2HCEB4J0waTvLlY1UNkI/MWuGuT9m9UYkH4NHkIsuIqLvT5lAn7nxDF3sWHcdSHeaL7HdUS4IWD+FLfR9xDaFmDD2FE296n19C4km4yhogQsnZGGpJ7q4bcQIBxpGWCOuHTVPoyJZIkllbQDK/EDDPnR3ukrIx8UvIuHR81CskEKYHx6fhKeQgR3QJvPqloX4mwVj/MxrEjhlH22NDs3rYP0cKOwcGX7fg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(39860400002)(346002)(396003)(366004)(136003)(451199015)(31686004)(110136005)(54906003)(316002)(36756003)(86362001)(31696002)(122000001)(53546011)(38070700005)(4326008)(38100700002)(83380400001)(186003)(2616005)(6506007)(6512007)(26005)(966005)(6486002)(76116006)(66946007)(66476007)(64756008)(71200400001)(2906002)(66556008)(91956017)(5660300002)(478600001)(41300700001)(66446008)(8676002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WEZGcm1QNUR0TDZSL0Nlb0lpYXhxY1V2U284QUJiYWtObHo4V1BHVkZHb1Zn?=
 =?utf-8?B?VWcySmt4NUx3OW9DNUdQNmlFelJJQnY3N0hNbkZtTDRrSjRObjZ4R05pUnpp?=
 =?utf-8?B?VEwyTksvOXJYcUcxUjY5M2F5TjB2cm90dTMrSEgwdks1cHRaZmpsTjFrNDJS?=
 =?utf-8?B?TEdPamg3aXUzTTArSHlYVjEzbTErbXozL1JhWGo3QWVqSXJ2T2ZqampvdHZz?=
 =?utf-8?B?SXE5Z2huUWlZa0l0TWMwMkxFN3RrMTNXajZNdG5NR1BmNklGRnZnZ3pSa2hp?=
 =?utf-8?B?WEpsMStpYVFtVG1CeTNOejl6L0tMdThvajBZR3BReU53UkRjOGpOWjJ2T01U?=
 =?utf-8?B?dkdvRkR6SVpHOGRjcC84Z3ZUMjEzOHJTcVdsWnRPelhPVitoK2puZFNac1J4?=
 =?utf-8?B?REsvQkFmK1VPY1huUEh1UTMxZGV3YmlVR3RwZ2t5YXl5Q3VxYTNkcXlML2dD?=
 =?utf-8?B?ZFE1L2dYVmwrVHlhSm1UUVpWWVhPUlhWK3k1Z1Bwd213ZG8rMGJPMmNROFpO?=
 =?utf-8?B?S3A4QXYyd3hMWlJLdEFyRlpMT0hjYWJQL0NaMDJkN0xuUGZnemRZbjFKY1Yy?=
 =?utf-8?B?RmFQV0lSV2NvZ0M3Y1Q3MWFoRkprRkJMV0t5czdtbUI2eXVKSkZHTlF0ZVpm?=
 =?utf-8?B?L0RBZW5oTG1ROUdlRnlnMHlXVGRWZTFIYVdKeEo2Tm5BdWs4VkQ4anBYRHRM?=
 =?utf-8?B?S2ZJczdMT0dFb3gxb1lvNXhhb2g2dUFOZnZWaTBrbnhFVDg5RTUxMTNCYitJ?=
 =?utf-8?B?YUNHSkFubk5tMklMVks1dWU2MWNrWEllTi8yZFI5b01PMjMxdUFYYkZoTWRG?=
 =?utf-8?B?eGkxaVkvVE9VaXIyclhzUitUTTgrTG0zckpUaDNQWFNybGYwL29SUVpsVUw1?=
 =?utf-8?B?RVZDdmZCS0tHemI1cDNxeTRkY1JkOTJyTFYvZ2tUdG1Ma1liUEZRbTVKUjVa?=
 =?utf-8?B?UTJPY2UwWHN4TDdvUlNjL3U4RzJ1ZTBRd08ySHJnUktpcWlkN1EyTnBjc3pZ?=
 =?utf-8?B?cDBtcTRqUUNVY1BwSUYyZDNPTEh0NVU0dGh4RTgrOUhsUkdZSkt0aVdrbVFO?=
 =?utf-8?B?MWtZZ0FYdi90dTVFQlozS2ZsV0ovWEowR3dHQnVCNUZ6WElyT3RKSVNTMmJK?=
 =?utf-8?B?ajJ2Vm0vZmUzR2ZCblcrdHByRkVrN0s3SkpYK0U1RjJ4YlRaQWVsUHQvbm16?=
 =?utf-8?B?cGZOSGltWm1oZ1lPamhXZFhTbmRMdFdDcEExcVRiNndEMUQ5UGw3cWsvZSt2?=
 =?utf-8?B?RGFVL2N1Rys4cXFUcWI4RVdGS2ZpV0dyMEx6bzcrSjh3eE5vcC9jZVpQdmEw?=
 =?utf-8?B?VVRteGN6R2EvMGVZVS9tdlVrc3N1NFZzMzZFNkl5Z2UxNE4zRExIbExRK3FF?=
 =?utf-8?B?ZXhTdGR4Zi96TlVseFc3VnUzR3ZzWUQxdGtaNGdsTHNmMk1ib2lzSzlzanlO?=
 =?utf-8?B?MCtsbmxPcjZzZk5TQTNaaWxDbDhwYVo1UktRTHQ3Mm5hbC82Y1ZaYnlnZ1lU?=
 =?utf-8?B?RkwweTc2QWNNbThXL3JBenBQZzVnVTNqWC83cUhKdGttU2diU0RWQ1FyTkZM?=
 =?utf-8?B?TjZ3YS8yc2VEMm5Zc2J0cVNJbUpSR2hxS000TnRPN25FMHBQNVI4TXRkT0tp?=
 =?utf-8?B?eDZpME1IOG10dGh4a3UvZGFBMkl2U21UTTJTaDIrTDJKdGZjd0ZWS04rQ2Qx?=
 =?utf-8?B?RFZBc2o5M0JKTkF0d0FwNkU5eURIaVhWd1M1cmNJVUJLZ2dZcDBucTlERnBz?=
 =?utf-8?B?dkVLM3AwLzc3blJ3TlhqV29jTjFnaTA3ZXg1NDcyMmN1V1RqVWNFZGYyQzgv?=
 =?utf-8?B?ZjlyV1ZWTFpKVi9WV1hCZHkrRW4rRHRhcjVDUmJ5dS8zTkU3ejg3YnFka1JI?=
 =?utf-8?B?QWFoa045SjdJM1Z1Q2xPNnA4dGlKc2F2YlhOczdRUTVqNE1tMUsxbE9EUWRj?=
 =?utf-8?B?S1ExNTBxK0V4RFZGbWMrMG1Scm9tanluQ2tybjZNc0FCRXByOWtxUldCaTJt?=
 =?utf-8?B?aWI3cHFVWnQ3eUsvRVRJNjhTekRyZk5HekY1ZEMveEpLK3hvNEE0L0IyQzAw?=
 =?utf-8?B?dVEzVDY0dG92Z0pwSWcvQUc2SmlNaStkSkpVM2taL0tyQ2FTaVBVOHB1THM5?=
 =?utf-8?B?eVUzRytCRHhleUlZWmFaZ28zUVJnUjZsaU9ZelV4SGhFNjdsTW54dkZoZll0?=
 =?utf-8?B?TEE9PQ==?=
Content-ID: <8943787AF0942A4EAA80522ECB5EA919@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e756879-d0ba-4645-6b53-08daa75724f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2022 04:56:34.9582
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B4kCDhl5gIKqjGskKfiYT+ALfSJ3o+CR5C6fqlWGhK+P7hsQik7kNjARgu88sOUlQ0cBPT3bGKh0fjumJuSakUcbzuHn4QJk2VLfP0o0JFE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6829
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_215639_449701_6D62B988 
X-CRM114-Status: GOOD (  24.99  )
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

On 10/6/22 07:41, Tudor.Ambarus@microchip.com wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi, Miquel,
> 
> It's too late for me to queue patches for next, but I'd like to have this patch
> integrated as it solves a regression. Would you queue it to mtd/next?
> 

A bit of context. You'll see the following checkpatch warning:
WARNING: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP

It comes from SPI. We should evaluate if we can s/ENOTSUPP/EOPNOTSUPP
in SPI, but we can do it later on. I prefer this patch instead of reverting
the offending commit, as it does not ignore other errors.

> 
> On 9/23/22 12:34, Mika Westerberg wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> The Intel SPI-NOR controller does not support the 4-byte address opcode
>> so ->set_4byte_addr_mode() ends up returning -ENOTSUPP and the SPI flash
>> chip probe fail like this:
>>
>>   [ 12.291082] spi-nor: probe of spi0.0 failed with error -524
>>
>> Whereas previously before commit 08412e72afba ("mtd: spi-nor: core:
>> Return error code from set_4byte_addr_mode()") it worked just fine.
>>
>> Fix this by ignoring -ENOTSUPP in spi_nor_init().
>>
>> Fixes: 08412e72afba ("mtd: spi-nor: core: Return error code from set_4byte_addr_mode()")
>> Cc: stable@vger.kernel.org
>> Reported-by: Hongyu Ning <hongyu.ning@intel.com>
>> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> 
> Acked-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
>> ---
>> The previous version of the patch (the revert) can be found here:
>>
>>   https://lore.kernel.org/linux-mtd/20220922134824.46758-1-mika.westerberg@linux.intel.com/
>>
>> In this version we ignore -ENOTSUPP but the other error codes will be
>> passed to the caller.
>>
>>  drivers/mtd/spi-nor/core.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index f2c64006f8d7..bee8fc4c9f07 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -2724,7 +2724,9 @@ static int spi_nor_init(struct spi_nor *nor)
>>                  */
>>                 WARN_ONCE(nor->flags & SNOR_F_BROKEN_RESET,
>>                           "enabling reset hack; may not recover from unexpected reboots\n");
>> -               return nor->params->set_4byte_addr_mode(nor, true);
>> +               err = nor->params->set_4byte_addr_mode(nor, true);
>> +               if (err && err != -ENOTSUPP)
>> +                       return err;
>>         }
>>
>>         return 0;
>> --
>> 2.35.1
>>
> 
> --
> Cheers,
> ta
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

-- 
Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
