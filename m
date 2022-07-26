Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B48BC43334
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Jul 2022 08:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fbL3PQ2iq0974OlOeQFXrROFeben3/CkTeo7JX0W4YY=; b=a14pOZJOda8G/K
	jjKUoUHe0eowQk4Ypr3lgtE8rm8Y4QMjjmqlgy60IDp1rIj+QrpCzl57ne4pC/JyXw3TtnI4WU9iJ
	+o3xNoUBIfpjm3MoRXMQiFaItfFvEnbGnRbnuuCsNLm0+519UrXZyO6lkOA+ZPnKlOT+jmDwKMFLk
	/7mbS7GcUY20NQlnie2fBTRDP9YCzcLIc0COCnZnEkqTTyZgXEcwGRjYGSZ2rleSNuZo7h9btUlY8
	JHbogOegwrI0zenqb/690T5pjmsttOFepkbSmK5h5iWfrhPegalCUOYhJwq48hoYzJjRcqJ9wMs0d
	we2dPjiE8TPBI8zeHgZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGFa9-009sOP-9S; Tue, 26 Jul 2022 08:06:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGFa5-009sI7-Kh
	for linux-mtd@lists.infradead.org; Tue, 26 Jul 2022 08:06:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658822778; x=1690358778;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=HGlsa2yQeAcmhp5nDeXtqkCQItYyuqxtpfPsy509ITc=;
  b=SB2dq2fItl22Ku5y84AGBA0T6TGOyOlcE18JRuHVjCONQgq5bRenTwGx
   J0w/vRrMrW1mqJhlT+yqyHnF3a4YOo5Q/yRrcN1JIOJCHHifDWTlRlnso
   ibb6l+9awsyCZTJbduVSixsmtdaCzfGJi0m6QiPx9A4TjoOPJDM/OtZH0
   1NNrOn5N/Hqk9OFGzkNjSMEv0osL0DIw7ryqSYDME9e8q1VPaJ/xPDzj1
   d1FQpiM7C2VDrQDsbpH2asyw0j8/oC7TKyWwxZS5EFRK7YGd478QuT1/k
   i3dIpqYAawaArggMs0aGPpCn/cGYp0hhrqbIL626f/QIInIg96mXKL0GG
   A==;
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; 
   d="scan'208";a="166395279"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 Jul 2022 01:06:17 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 26 Jul 2022 01:06:10 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Tue, 26 Jul 2022 01:06:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NQpiXN27PXvrLWJCaPdg8lOxsxhWY8oNkPh79X9vSWj5pwwp9N8pX2QRk75kymGrynz91U9sBo05ha8RidE3QGjsCJR5yt3I4tGtWVB4iy+zhtdJctbPS/+smOqJmbXhmiiJ7SEG9cSjhSslnYmjjfvM5XVyaRZRDBigfVKohnSbWSV1TXs8WeIzhVdz/5LGgKHUnOcieOb2v6C5Z/Rsc96xvoZUcP9Ni/AeOw5tNrEq3VT62XpHDoLLdMONgAA1M47q8n+Gjt+RjL/iTXSZylWAab0wG63BNRfPfZRROZVjTLP8PKqmXiKEuycjxKOr6zKZlvOTcGP/WswZWnJySA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HGlsa2yQeAcmhp5nDeXtqkCQItYyuqxtpfPsy509ITc=;
 b=fM/hb9ayrIFiR+5yd+98lGQdtXDCVXKyByiLW33okA3LyoB201T8udFe54OxDi09ZgY7DJhxHUMhixTHnKlJd/ki6SWoKlG7Dxkk+mHHz3ZQ3s7w3tQQr2RquNlN55DV4TRNRdxPm0Yjzks1AkBIPjVm4YruNAPomx6NPaKDd68hB0uV2D6uQbnflSs1dNGc+yTEhJ+bzSSleKRZR3B+E+SFPb4eR1X+7LCmOlPgrqgFGbZKncT3F6WIdfqdbOGSbmRd2GHrfr4cbYO1Btzn3GAWqcstoE507D9+YR2wQExrMrkm5sDvqBAQL7BbJwv8lnDNDiXU0CMUDJgwlrb0rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HGlsa2yQeAcmhp5nDeXtqkCQItYyuqxtpfPsy509ITc=;
 b=HKhokSjO2lgJf9I3LKVUP7hZPxNPuHj4U61tif2mhG0KIfwBTIS6mHbZ1OHZ1SynWsAfkevXuEyWCg8z4pG5x+6Y4rs4AGqWQ0KeCk/jOkZ/AY9OnGg49awjbZz473FuoekC1jj1Ik6ni1yDOwVfujq4No7rINHbNOCJemExmsg=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 MWHPR11MB1551.namprd11.prod.outlook.com (2603:10b6:301:d::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.21; Tue, 26 Jul 2022 08:06:05 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::7549:c58c:5e93:7c35]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::7549:c58c:5e93:7c35%5]) with mapi id 15.20.5458.023; Tue, 26 Jul 2022
 08:06:05 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <p.yadav@ti.com>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <Takahiro.Kuwano@infineon.com>,
	<tkuw584924@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 0/6] mtd: spi-nor: generic flash driver
Thread-Topic: [PATCH 0/6] mtd: spi-nor: generic flash driver
Thread-Index: AQHYoMaNVGoFuICE5kiLshJW1ov3CQ==
Date: Tue, 26 Jul 2022 08:06:05 +0000
Message-ID: <b3d5ecf7-39e4-d6f1-93a8-9efc8e352c9d@microchip.com>
References: <20220513133520.3945820-1-michael@walle.cc>
In-Reply-To: <20220513133520.3945820-1-michael@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 017de404-8074-4290-f8f6-08da6eddb06e
x-ms-traffictypediagnostic: MWHPR11MB1551:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JaVHBTn/YoVrDGq8ZNj6ERgn+KaSL/2mx0RDsbx59CfnVe316Q+/pF/sGjXD5dQGtSpRgWB17ctMvWWsQdX6oCjPKOHBz4BX2GFzL1og+5Fuco7QeTWTsDFLaZe95ePcHeGvwX7sxjQUofSHFL/4jZSQfB5yjBgGKSm3XawlMnslUbx5q4wGcceMHcq/yMT1HvJcSq9A/y45LM53XLq8aEWLujMJziJdYaSFDPDUgLCU04GG8rJA1bQC8ha7/a5x6moourgIuXIgDEkxCFcq3p+UJjah5jcObLa/noVyGfsEmo+ALcRkeitc8c+p93EDRTEDFdmMA59gfxivvzcyR0G9nUnnUHGNVyNVuB52Y4rRbjj1yyVYkOqQwIdKdnK65KShViWBSyg++iyCFzX9hYqDlPOqbNh2YwgNixOW6izZ6PUigWtLBkO6c580Ae8UA9EzaEZNjOTTK+6Lq561K1jEk58KZA9PAn3XVdWPn0W64ak3kzllrrEqUitCblTiEstI5XGu1OWZUMK2kjuue0YBU1/IWMv1NxnUgxZMp7VtMBySyhoPds03hnjYFH1auw+AsyAbPPAOckKR5MUbGekYi+Nd3ZSMc/Ny1rbodpWfzONyU0j/gJVjiRE9RDQGzXXvBbpQ6SAh8dICCbUUcG+CyYcI166iaFJWXO78qWn/j4X6i4BZzfyD0ZVSJTy+EEPSimTSO4obZSatsPaP42VkR0ttYvBV9K3ijC5WxYLSwkpS0cKK8EzlZwE9Qi6RCiBM4ULrPBFKasxRlfqi46Owl//bb/KROi5VeSefjfN3s9mpkkWbmXTO/reRtoEXsp0ybb0Kf4T7b/tiBxmlQrbEA4nuD+DbSy6a9gB1x3x0Vg0XynMs7N2mGg8BJwA7VTTj9VAIOytRZlh+R7Z7uw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(396003)(376002)(366004)(136003)(346002)(8676002)(66446008)(122000001)(110136005)(66556008)(4326008)(54906003)(66946007)(64756008)(66476007)(53546011)(6486002)(478600001)(2906002)(26005)(76116006)(316002)(2616005)(91956017)(6512007)(6506007)(38070700005)(8936002)(5660300002)(86362001)(41300700001)(36756003)(186003)(31696002)(71200400001)(38100700002)(31686004)(83380400001)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MlhPWHNqcTB3LzdTbFk1d2lSYlpRZmVFTkUwd0laWHZpWUxWZzg3d01nVlF6?=
 =?utf-8?B?YU5HLzR0eTFNcURDaE16VFFNdkNGYUh1cENuSE1kaUd5WU8ra0EyUlhPKzhx?=
 =?utf-8?B?ekVxd2NjUGU0dE5HNFlsVmc5ZENGTnNuYVBmb0pXdVhjdTNkR1lwNkFvRWxX?=
 =?utf-8?B?ZUhVZ3liTmtXTTZsMUxkVU81UTNrU2J3RGpqQS9VUnM3NEhtem9WUktjWGQy?=
 =?utf-8?B?b21FbDgzQVhZK1RsR0xNL1BhTjVnejVoRkNUT1VSdDJYR2xRVVl5dUhrUmpK?=
 =?utf-8?B?KzBzVklraDJyR2l1Q3Z5VTR4c1U1c1RObDVrUHpTY0daM0hwbmoxZDlqaUtG?=
 =?utf-8?B?STh1clcrQWdzcklQZ0lHZTl3NXU3cXZ5eTRob2s5OTVISmdjejdNcmdrSzY1?=
 =?utf-8?B?WXI4Y2wxcWxDWEJTOUtoelFZQUNvU1lkdE5hWVMrb0ZYZDVNTDFjcDFQbVhW?=
 =?utf-8?B?a2FXVDNuVUpyTzI5NXl6SWJibkdtVUdXdTdvek5lSU1SMUlCRmlPNWxLMWlx?=
 =?utf-8?B?bE5qUTlDT1paU1VhZWFvOGxReEExei8za1d4Rms5U0FoQWtlUXVqb0FEVzFj?=
 =?utf-8?B?RlFxeWxpWC9yeDBUTWZ3a05vaWY5ckFrRmlSQldPVjh4bjg3L2M1QlFENlNT?=
 =?utf-8?B?MjlWRWxGdW9nL3JwY2xRMGQ5M01qcDVVS2xRR3VpZThTMVZianRmUVlJL1R5?=
 =?utf-8?B?dkVPTmJweUFOT2x1Z3Q5VkZ6c2ovMG1yR0tBK0cwRUoxTkNBVURqZWY1OGxh?=
 =?utf-8?B?MW9rejdubEQzMEJ3L0xnSEp2bFh1RTcvdTJFeXhmaHhWTjJjMjBXMFFuWVVO?=
 =?utf-8?B?djB4dmhmZXhOazNvVUJQWGcyaGkza29FQkdlalR0UTNpckRGV1JKT2NILzVV?=
 =?utf-8?B?cGdodTNOeWJORTl3VnRBNWwxc1VnVytwK0U3ZkFVQW9kM3JCMTQ5V08yTTY0?=
 =?utf-8?B?YU9rcXBRZzdhV3l0Y3ZuYmlITTRPOXdvT3BIOW1KdU5ZOHhyMDVZVGROWTd1?=
 =?utf-8?B?QXBOaG95Wm5zeE1IR3BpeDNQVU9SWmh5RjMwbVJzWDBzRnZ3RnlqWU51ME9W?=
 =?utf-8?B?RHhzUzVDLyt2TFVhNVF0QzJ5RzUvNkdPQ0c3cXVhZVI0ZmxHREY5UzJJNlM5?=
 =?utf-8?B?MFhJcnUvRitUM0Y5THZHRExHNUd2czExTTFJYjU5bmNiK2h5TVlVVGNtcy9Q?=
 =?utf-8?B?S3BIRlJKeFQ2ZjhnSkVzM2N5VTI0enZEck9ZRjBUZFVuK2lTa21QcCtlcnRo?=
 =?utf-8?B?SFBBYVBialpGbnNQTzBRMThvQURGRmdKeDkwbGNyeVRJNC9NWW5jeTFOM3Z0?=
 =?utf-8?B?M3kxZGhCektMZ21rZE9rNHhXaWVtUGlKZTJLeWFsTHVWVG5adEZzSUxaelpu?=
 =?utf-8?B?cnRGMTk3QisrdDZlNXdROG1iYWFqR2g1enpoRFQ2Z2ZPckJQTUJkY1BEWERa?=
 =?utf-8?B?bDNjVFduYUd1cVg5V1lqVEx4bGJ6ZVhVK0N2cXFVK0JjKzZMQk5FdDhUMVBs?=
 =?utf-8?B?SWdhWHJTejBEYWlsU0tKeFk5SkZUalQ4MjdkWHFzbTJSZlNsdWxtMGxreTdQ?=
 =?utf-8?B?SU41dGhFT09KdFdmOWg0UnF6ZEN6Y05KUDNkY1QvQVVnQ2VMSkVzOWl5aGZU?=
 =?utf-8?B?Q3UyeE5GZGd2QVZvRkhCTnRHeE5vMDBLNkNqUzR2N0xwRy94Z29rUWIzdGNS?=
 =?utf-8?B?aEFtb21JOTBlTjVzNlVoM29GbHhheXJtTUM5Q0gzTzdtSlRRQ3JRVDNjL3Q4?=
 =?utf-8?B?OUJEMjd6a2IzTy9uZ05oM05FbTRjejlFN0x6VzA5TWxvcHo5TjVpbGd3Zm5E?=
 =?utf-8?B?aXdWQ1NhZVc2YUlXZWg3SEQ1MDJMUCtqMXpEUEU5V3l4TnB3ZVJXbC8vOUhU?=
 =?utf-8?B?YllzTVRLRkQzUDM4SjQwYmhQcXVTOEVDN0xIMnFpeS9xbmI5ZjN4VS9jZFNz?=
 =?utf-8?B?NmNHdWt0dEJZZDdLNjBkYlBGN3RnRHdsMkxsNDBONlBFT2JFRXBSTGc3cnVp?=
 =?utf-8?B?em55YUVMdjJ6ajBNbDR4a3NNd3M4Mkx4ODM0QkJTSzJ0VmZ0ZUlPYjA4UlhN?=
 =?utf-8?B?ZGxBMTBxVWl6WmVMaFRGSUN0VzdUamI3Z1ZqZGROS0hNNWpRSURTZWwwelpv?=
 =?utf-8?B?VWRIcjlqeXg4dE1WUmZkeEZYY010VDVuRDJWSmZSaW1Xa0RKZk5pWVpIRnl4?=
 =?utf-8?B?Nnc9PQ==?=
Content-ID: <417A972630933B4FAE19F4D31CF7389E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 017de404-8074-4290-f8f6-08da6eddb06e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2022 08:06:05.2924
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EZyXHFNl73w9VSLxG3QT++oqCKErMI6LSccijhTWOg74b+6TxpGmcVUYR5kQW5cjvAxbeRKgXfbZGXZNKKGp3sDL0VWg6IiLgL3f1MZyEOo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1551
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_010617_854283_77DA33DE 
X-CRM114-Status: GOOD (  16.88  )
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

Hi, Takahiro,

Would you please review this patch set?

Thanks,
ta

On 5/13/22 16:35, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Add a generic flash driver, which is used when we don't find a matching
> flash in our database. All the basic features of a flash can be discovered
> by SFDP and most (if not all) newer flashes support it.
> 
> Michael Walle (6):
>   mtd: spi-nor: hide jedec_id sysfs attribute if not present
>   mtd: spi-nor: sysfs: hide manufacturer if it is not set
>   mtd: spi-nor: remember full JEDEC flash ID
>   mtd: spi-nor: move function declaration out of sfdp.h
>   mtd: spi-nor: add generic flash driver
>   mtd: spi-nor: sysfs: print JEDEC ID for generic flash driver
> 
>  .../ABI/testing/sysfs-bus-spi-devices-spi-nor |  6 +++++
>  drivers/mtd/spi-nor/core.c                    | 18 +++++++++++++
>  drivers/mtd/spi-nor/core.h                    |  3 +++
>  drivers/mtd/spi-nor/debugfs.c                 |  2 +-
>  drivers/mtd/spi-nor/sfdp.c                    | 27 +++++++++++++++++++
>  drivers/mtd/spi-nor/sfdp.h                    |  2 --
>  drivers/mtd/spi-nor/sysfs.c                   | 20 +++++++++++++-
>  include/linux/mtd/spi-nor.h                   |  3 +++
>  8 files changed, 77 insertions(+), 4 deletions(-)
> 
> --
> 2.30.2
> 


-- 
Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
