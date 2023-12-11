Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D82B1C10DC3
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Dec 2023 06:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=818WtaXplDEcZSmpn2m80STy20F5drUGLIxw69Bt/bk=; b=2+U37BORBxX+nu
	ZYThTnNKouTBl0YRDNXWf1/wc3JiUVju9Mt2uoqxp1Xg+bqeAF4D12oUy+jQY2dk5UwdPAjR+ydJH
	S6kqXZx2654AhheyDIfJFqQO1D0ZRGk3P41PdwhWkVIvbZuUyOJFfvNJITFWEk0YH7XaQ1Cqu5kEL
	u8tRkOXmgDEE7dswFO7H5VWRB3e3VNZLST4TbitO8umxOrNghiZ4y6qHpNa2uDRDyDPJHuLNNNFpt
	3LaUK8te5DK+P4ZwiRv+i4Wfl0SqQZcGfySAehAQOmG6PlMmXEfzqUgPj5PNMwnODPWzIO52//MAO
	VB7Ns9RWLNpsG0ZfCIRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCaDJ-004DJQ-1Q;
	Mon, 11 Dec 2023 06:56:25 +0000
Received: from mail-mw2nam12on20607.outbound.protection.outlook.com ([2a01:111:f400:fe5a::607] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCaDF-004DIt-0H;
	Mon, 11 Dec 2023 06:56:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F369Yqiw2UMejwZr2SouTsuCcV7NLO1w2DHIC0bhLAq/Op6NIt6CTTFU2yliWAqwqYRIQ9DZDr1WLNleLlSRUjA8XquN4Ank3PZMKrMdudIqt4lOP3crMxiXDbP8S3zVrHafrK9n8v1xJT6oahS30Slfe3QIupE1NGIf3Qb2T9XHKH4fdGGE7+0BHov59yYri7+aWoNkwWnKtJwEVuA/QKM8dVr16LvCEYBrGV1ZA582vVNMFKqWPUemOvmdajH2N16wZtp50qcREG0B1DtneiIygBBr12jH1YnzGuyZiOvEpMEeUOzB7AlnW+DH/C486RpYWaZ/DPiuF4bp4d1qFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TkiWMfp/AVvxkXEkKehnqndLhiQ/9xPpim2ATrltnzA=;
 b=SxL7Jnjpn3cbT+aYhzXpPhQI/Pd9VxMu5yic/69zn0M18GplMsZzCWZVCPWa8TBPW6wsQ7x04Qo8tHM/wyV2bM8Yz6WPuu7uedT4WRYUGtx9WvCVU5wq5eOY4XS+OHS+Z9RhPzrIJIX6rjOSVd4Hb8IK0ArttINNmwyOpn2JpULbeswAjW3L4HugKmmZfAAfx90bl+HRValP3CjsX+TJidHkpHWGUsWnmaaGOKyaqW4826bwhrOq1KuJft4DdHZHdm0oSOzJZtTN7Srln6qXfqdPF7H1Nb3vXoMnaB7b0u9XFe24cVsX3UEp9iI3joA/fEoVpelrm0nXTNpqW+T/uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TkiWMfp/AVvxkXEkKehnqndLhiQ/9xPpim2ATrltnzA=;
 b=bcM43vX2gxi3+LptBW8+ufUY/vlH8l3P1R+SIrlNylnfUnTLjgAE6YzKr5BZbq3FtKSJVH/c3GnRFYf3cSF5GGuNwkOwwNZaKKrNmykSb4MoHAnLttPN8XSuMLkI6s3W3rEV7IM5fK8Wj3puAyVskYJJZm3MyhAGNBHnpIJTAzE=
Received: from BN7PR12MB2802.namprd12.prod.outlook.com (2603:10b6:408:25::33)
 by BY5PR12MB4244.namprd12.prod.outlook.com (2603:10b6:a03:204::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Mon, 11 Dec
 2023 06:56:06 +0000
Received: from BN7PR12MB2802.namprd12.prod.outlook.com
 ([fe80::2a35:852d:bc78:ed64]) by BN7PR12MB2802.namprd12.prod.outlook.com
 ([fe80::2a35:852d:bc78:ed64%7]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 06:56:06 +0000
From: "Mahapatra, Amit Kumar" <amit.kumar-mahapatra@amd.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, "broonie@kernel.org"
	<broonie@kernel.org>, "pratyush@kernel.org" <pratyush@kernel.org>,
	"miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "richard@nod.at"
	<richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
	"sbinding@opensource.cirrus.com" <sbinding@opensource.cirrus.com>,
	"lee@kernel.org" <lee@kernel.org>, "james.schulman@cirrus.com"
	<james.schulman@cirrus.com>, "david.rhodes@cirrus.com"
	<david.rhodes@cirrus.com>, "rf@opensource.cirrus.com"
	<rf@opensource.cirrus.com>, "perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>
CC: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"michael@walle.cc" <michael@walle.cc>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, "nicolas.ferre@microchip.com"
	<nicolas.ferre@microchip.com>, "alexandre.belloni@bootlin.com"
	<alexandre.belloni@bootlin.com>, "claudiu.beznea@tuxon.dev"
	<claudiu.beznea@tuxon.dev>, "Simek, Michal" <michal.simek@amd.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>, "patches@opensource.cirrus.com"
	<patches@opensource.cirrus.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "git (AMD-Xilinx)" <git@amd.com>,
	"amitrkcian2002@gmail.com" <amitrkcian2002@gmail.com>
Subject: RE: [PATCH v11 07/10] mtd: spi-nor: Add stacked memories support in
 spi-nor
Thread-Topic: [PATCH v11 07/10] mtd: spi-nor: Add stacked memories support in
 spi-nor
Thread-Index: AQHaH4D9pFM5xtDoeEuMNIpXuxvtzbCcYmwAgAEJ+aCABhoaAIAAMcLw
Date: Mon, 11 Dec 2023 06:56:06 +0000
Message-ID: <BN7PR12MB2802BB3DA682D9C13EF7DE08DC8FA@BN7PR12MB2802.namprd12.prod.outlook.com>
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
 <20231125092137.2948-8-amit.kumar-mahapatra@amd.com>
 <e2305642-55f1-4893-bea3-b170ac0a5348@linaro.org>
 <BN7PR12MB2802BEDFB821A1748185794CDC8AA@BN7PR12MB2802.namprd12.prod.outlook.com>
 <f5a47024-514a-4846-bc16-08cf0f9af912@linaro.org>
In-Reply-To: <f5a47024-514a-4846-bc16-08cf0f9af912@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR12MB2802:EE_|BY5PR12MB4244:EE_
x-ms-office365-filtering-correlation-id: 9c096ba5-ea66-4abd-1ba7-08dbfa163f66
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NHqilMMqy5C0ETC47US1dnUJCqcWVcT1YVHMCRjHP/Z5r55DTPqIYPx1fqDVf59z8iD8VMKCDF6LXsneSkzsLZ3+oUHBIDtHZophhEsNXDJPtk2WhRQjYU17W7bcPxLCQVTb+FGt46dfZJcZIgdmVzVYf+iDVr85XGqsog0wblgZJgVYPsxLOoP1nRyRaxeftR4dYHb2QhAdGQHmXuHvmvRR8VAtXuk0MI6IYlLIbvYBx2+0iljlv8Kja+5NBXBANTy2jFhxxmKxzxcU4Tc1Ww/hilGKWRVHSNydyylUkRg57+JAvDKXN+riumuzeUkS72V6UXIYSf6dpOvRuAdNcj3MtS/1KXCqznV+DqzSXg3LGAOWoQO+nPfrOqQl2wwuXBZk+LG0T21trT82mIY+9M8xAjPRdvgye6vNJ22HXM+RMRKa8BXp1TLwoGfBG6ows/T7E3X9fxRAENOqH7HxiN2lTqESFF1a/4dU/QiDfdP2uOWOIBbnJrI99OfJYYwIOsLgOqk0MMNsevWoeH5jGBkBI2eDE1Zpquz7OJh2gKyH034WErF9Lq//P7qielLhf/67fr1sr7HWzqxEJ3+ZvKMMdvEDdSV44K0qqYlGKI8O9ZgeT2ACU9i5gtccIzIQpzIRa8HPfjPf4eDGDzok6lkxLnwh+vhM+6M9/5clyGfFhiSJINkEtszJuzE2qnTqwX8DiaFS1q3aijT0ycGXNw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR12MB2802.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(396003)(346002)(136003)(366004)(376002)(230273577357003)(230922051799003)(230173577357003)(64100799003)(186009)(1800799012)(451199024)(55016003)(478600001)(26005)(7416002)(5660300002)(966005)(54906003)(66946007)(64756008)(76116006)(66476007)(316002)(66446008)(66556008)(110136005)(53546011)(6506007)(7696005)(9686003)(71200400001)(83380400001)(8936002)(8676002)(4326008)(52536014)(921008)(38070700009)(2906002)(86362001)(41300700001)(122000001)(38100700002)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YmJHZGRDWUN3aXdZcFBaOVpYVG9rV1RoVktFREZ5eXVIbUM3NGVFRGV3OEFm?=
 =?utf-8?B?R2x1aG40VUgwUndXNTRXMGZCV3k3Z0x1VHg0WjkvdHdiZWJycUJ1a1NjaC96?=
 =?utf-8?B?eDNMQTBhVnpJb0g3dm10KzhJQ2x1TnExeFFQRTg1ZUlncGFhTkZDNlNReTdE?=
 =?utf-8?B?OTg2c1RKV2FtOEJISDZldDUzZ3JkdnhyVDFRajlKd3daTEZuZ0xabFFZLzMy?=
 =?utf-8?B?K3J5cTVWejVTQjd6VldTVDJJOEsxVzkrRTF5aGJMb2NGRGRIdDNmdDRFMXVr?=
 =?utf-8?B?WUhSUUlOVnF1NllRSHUzMDlWZlcwa2NxVkswWUxmNTVtbE1RVUtxYllsbytm?=
 =?utf-8?B?QnV1bGNBNkNOTkEvU3ZORE5BY21BRCtiYXI2Yk5Ma1gzOTNRb3FlYWYvcW1I?=
 =?utf-8?B?d3BRRzM2NzhXbE15cDNFZFh0RHFGbHEzaGEyeXNWT044dUlxa2VrbUhVWi9S?=
 =?utf-8?B?WktUTXllWGs5YW11MVVXeml2SmZFcWswbVViVUxzZkxTRmcxSGNvNWd2QVVm?=
 =?utf-8?B?MVdpTml2Z2E0M08zTGpvTlhObUFiTnVLS0NGaW5Da2NYMWE1UTFNS0ZLc2lF?=
 =?utf-8?B?ZE8vampJSVQ3MWtyaEwyZWJ6K3NpZ1VHOVE2VlgveUJnSHpLUElxRW9jSktY?=
 =?utf-8?B?dWtFdE56UVd5K3JOMW4rV0VMVVN5OWNRcWZCdWJ1YUZKb1ptNXUrV1NrZ01O?=
 =?utf-8?B?bEJOaGJOMFQ5K3dnbmM1YS90dUwzTDAxaEN2eTFGN0k4djFOYzgrSUVCMDV0?=
 =?utf-8?B?WTh6QzhLV1hiMFJ0MWJ5aDVuSkVQbnVxUThpaDZYVTltWGRLV2trQ2ovL0Y4?=
 =?utf-8?B?ZWdRT1E3eVNqbW9GMDNnR056RG0yVDNCMWZpeVlrbUpjUUZPUklabER5aktE?=
 =?utf-8?B?alE4b0xCRmlacTJMTkpkMzhMVy85YkJMdnNtako5d0RJT29kbW9lK0UxL1Jq?=
 =?utf-8?B?NTlaVlFmWlg3THBCbzFPWnA3aG0xaUtuZXByZVZLRk54K3NvdWh6WmVMVVZT?=
 =?utf-8?B?S2NabWxpbFBaVWFzcld1ZllUQXhrbnBaY0U3NE5Rc011OGdRYXlYTUtnS2M4?=
 =?utf-8?B?TUZud3hNd0FERTFhR3QrOGIwOUdlZm1GWHB5aFZlNVozRjJucExoMTJTU25U?=
 =?utf-8?B?bVpJYzlmUTdOOGczWjNBcEhtNFJvQkNPY2Q4SEgzVHFNbld3YncxZVd4MVpR?=
 =?utf-8?B?d1VLSm96Q283bUllNTFrcDU5bzk3SGxyM0J4b1BSemhkSlJSdTF1c21TaVZ1?=
 =?utf-8?B?Mk9kZ0tJS0EyUGtPWlZPLytnZFdvSnczRmRBVVd0dVE4OSsvUmZuKzYxN3ZS?=
 =?utf-8?B?UmUzVlFzTGh6K1JYK1VOb3Y3TzkwMC9jQzd6ZW10bjVoY20wcUMzZ0dCMDM2?=
 =?utf-8?B?RExMZmJTOXNuckZCUWNzRFAzYVBFVElBUnd2NklCNGV2Nm9UdXhwbGkrZ2Q4?=
 =?utf-8?B?cVh4VDdpVjlWcEdpT1FhVjUzdEpNL2RCUXczeUFXR3dobm9OZmZvM2pibVEz?=
 =?utf-8?B?ZjIzVWMxa3Bic0k0ZXdIWG1xSUd4bEtxT0p3cFJXdW5EYS84WmRUdURaek5z?=
 =?utf-8?B?Z3pLSUg2bzA0SGNMYXBOT0dvYk5xdE5VTHBqQVlrUDdaTFVlb1FSdi9Sdnhk?=
 =?utf-8?B?aEtnN2RqWnhPRFA2VDh6b2hjWkc5UVVXWGg0cGVPdmlIaE9hUXRRU2JydVY4?=
 =?utf-8?B?dlAxYnU3YURQZ0FDRnpneFNmMGxhaENFbUVub3k1Q3JGeVJkRlhqOHkwM0ll?=
 =?utf-8?B?TjQ5dHNlcElDUWRNWG5xWlNBUFduOUl3K1hVNVNlMm05V21GZVBvSkJab3la?=
 =?utf-8?B?SStuWGdXWjdod3h0d3F1NEZURkJFeWNoVDZobEszTksvN3lXWEE0K3dUNG5w?=
 =?utf-8?B?Y29tTFdKa3EvREF2V2RhbFF4M2tUbFpOelY1QW5vMnQ1WWVLVnZ0MUpXaUR4?=
 =?utf-8?B?OW1Fb3B0dW54YTlKdmdiemRRT28rTkpjM2dkdDFJdWhzRmZNaXFmdzdiejgz?=
 =?utf-8?B?Y05QTjNIVG1kMDY3bzZaMFdHSkx6a0ZlMWx6U2M3ZXlqc1dWTW03NjdJVXZj?=
 =?utf-8?B?MWFlSHdmWW1LM0lzTXpmc01haG5ZbHhLT0tLclN3VTRZQUxwM05qclprdWZC?=
 =?utf-8?Q?nIho=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR12MB2802.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c096ba5-ea66-4abd-1ba7-08dbfa163f66
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2023 06:56:06.2544
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: btx/67p+DsrZfGLxBhDh0hpERYfdI5Irdp0mqg01YfxOP1edG4dji+y7sbVJPYp8/k9W55a1et4P5zZCOg+TwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4244
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231210_225621_300118_5A6ACDEC 
X-CRM114-Status: GOOD (  25.23  )
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
> From: Tudor Ambarus <tudor.ambarus@linaro.org>
> Sent: Monday, December 11, 2023 9:03 AM
> To: Mahapatra, Amit Kumar <amit.kumar-mahapatra@amd.com>;
> broonie@kernel.org; pratyush@kernel.org; miquel.raynal@bootlin.com;
> richard@nod.at; vigneshr@ti.com; sbinding@opensource.cirrus.com;
> lee@kernel.org; james.schulman@cirrus.com; david.rhodes@cirrus.com;
> rf@opensource.cirrus.com; perex@perex.cz; tiwai@suse.com
> Cc: linux-spi@vger.kernel.org; linux-kernel@vger.kernel.org;
> michael@walle.cc; linux-mtd@lists.infradead.org;
> nicolas.ferre@microchip.com; alexandre.belloni@bootlin.com;
> claudiu.beznea@tuxon.dev; Simek, Michal <michal.simek@amd.com>; linux-
> arm-kernel@lists.infradead.org; alsa-devel@alsa-project.org;
> patches@opensource.cirrus.com; linux-sound@vger.kernel.org; git (AMD-
> Xilinx) <git@amd.com>; amitrkcian2002@gmail.com
> Subject: Re: [PATCH v11 07/10] mtd: spi-nor: Add stacked memories support
> in spi-nor
> 
> 
> 
> On 12/8/23 17:05, Mahapatra, Amit Kumar wrote:
> > Hello Tudor,
> 
> Hi!

Hello Tudor,

> 
> >
> >> -----Original Message-----
> >> From: Tudor Ambarus <tudor.ambarus@linaro.org>
> >> Sent: Wednesday, December 6, 2023 8:00 PM
> >> To: Mahapatra, Amit Kumar <amit.kumar-mahapatra@amd.com>;
> >> broonie@kernel.org; pratyush@kernel.org; miquel.raynal@bootlin.com;
> >> richard@nod.at; vigneshr@ti.com; sbinding@opensource.cirrus.com;
> >> lee@kernel.org; james.schulman@cirrus.com; david.rhodes@cirrus.com;
> >> rf@opensource.cirrus.com; perex@perex.cz; tiwai@suse.com
> >> Cc: linux-spi@vger.kernel.org; linux-kernel@vger.kernel.org;
> >> michael@walle.cc; linux-mtd@lists.infradead.org;
> >> nicolas.ferre@microchip.com; alexandre.belloni@bootlin.com;
> >> claudiu.beznea@tuxon.dev; Simek, Michal <michal.simek@amd.com>;
> >> linux- arm-kernel@lists.infradead.org; alsa-devel@alsa-project.org;
> >> patches@opensource.cirrus.com; linux-sound@vger.kernel.org; git (AMD-
> >> Xilinx) <git@amd.com>; amitrkcian2002@gmail.com
> >> Subject: Re: [PATCH v11 07/10] mtd: spi-nor: Add stacked memories
> >> support in spi-nor
> >>
> >> Hi, Amit,
> >>
> >> On 11/25/23 09:21, Amit Kumar Mahapatra wrote:
> >>> Each flash that is connected in stacked mode should have a separate
> >>> parameter structure. So, the flash parameter member(*params) of the
> >>> spi_nor structure is changed to an array (*params[2]). The array is
> >>> used to store the parameters of each flash connected in stacked
> >> configuration.
> >>>
> >>> The current implementation assumes that a maximum of two flashes are
> >>> connected in stacked mode and both the flashes are of same make but
> >>> can differ in sizes. So, except the sizes all other flash parameters
> >>> of both the flashes are identical.
> >>
> >> Do you plan to add support for different flashes in stacked mode? If
> >> not,
> >
> > No, according to the current implementation, in stacked mode, both
> > flashes must be of the same make.
> >
> >> wouldn't it be simpler to have just an array of flash sizes instead
> >> of duplicating the entire params struct?
> >
> > Yes, that is accurate. In alignment with our current stacked support
> > use case we can have an array of flash sizes instead.
> > The primary purpose of having an array of params struct was to
> > facilitate potential future extensions, allowing the addition of
> > stacked support for different flashes
> >
> 
> right. Don't do this change yet, let's decide on the overall architecture first.

Sure.
> 
> >>
> >>>
> >>> SPI-NOR is not aware of the chip_select values, for any incoming
> >>> request SPI-NOR will decide the flash index with the help of
> >>> individual flash size and the configuration type (single/stacked).
> >>> SPI-NOR will pass on the flash index information to the SPI core &
> >>> SPI driver by setting the appropriate bit in
> >>> nor->spimem->spi->cs_index_mask. For example, if nth bit of
> >>> nor->spimem->spi->cs_index_mask is set then the driver would
> >>> assert/de-assert spi->chip_slect[n].
> >>>
> >>> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-
> mahapatra@amd.com>
> >>> ---
> >>>  drivers/mtd/spi-nor/core.c  | 272 +++++++++++++++++++++++++++++-----
> --
> >>>  drivers/mtd/spi-nor/core.h  |   4 +
> >>>  include/linux/mtd/spi-nor.h |  15 +-
> >>>  3 files changed, 240 insertions(+), 51 deletions(-)
> >>>
> >>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> >>> index 93ae69b7ff83..e990be7c7eb6 100644
> >>> --- a/drivers/mtd/spi-nor/core.c
> >>> +++ b/drivers/mtd/spi-nor/core.c
> >>
> >> cut
> >>
> >>> @@ -2905,7 +3007,10 @@ static void spi_nor_init_fixup_flags(struct
> >>> spi_nor *nor)  static int spi_nor_late_init_params(struct spi_nor
> >>> *nor)  {
> >>>  	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor,
> >> 0);
> >>> -	int ret;
> >>> +	struct device_node *np = spi_nor_get_flash_node(nor);
> >>> +	u64 flash_size[SNOR_FLASH_CNT_MAX];
> >>> +	u32 idx = 0;
> >>> +	int rc, ret;
> >>>
> >>>  	if (nor->manufacturer && nor->manufacturer->fixups &&
> >>>  	    nor->manufacturer->fixups->late_init) { @@ -2937,6 +3042,44 @@
> >>> static int spi_nor_late_init_params(struct spi_nor *nor)
> >>>  	if (params->n_banks > 1)
> >>>  		params->bank_size = div64_u64(params->size, params-
> n_banks);
> >>>
> >>> +	nor->num_flash = 0;
> >>> +
> >>> +	/*
> >>> +	 * The flashes that are connected in stacked mode should be of
> >>> +same
> >> make.
> >>> +	 * Except the flash size all other properties are identical for all the
> >>> +	 * flashes connected in stacked mode.
> >>> +	 * The flashes that are connected in parallel mode should be identical.
> >>> +	 */
> >>> +	while (idx < SNOR_FLASH_CNT_MAX) {
> >>> +		rc = of_property_read_u64_index(np, "stacked-memories",
> >> idx,
> >>> +&flash_size[idx]);
> >>
> >> This is a little late in my opinion, as we don't have any sanity
> >> check on the flashes that are stacked on top of the first. We shall
> >> at least read and compare the ID for all.
> >
> > Alright, I will incorporate a sanity check for reading and comparing
> > the ID of the stacked flash. Subsequently, I believe this stacked
> > logic should be relocated to spi_nor_get_flash_info() where we
> > identify the first flash. Please share your thoughts on this.
> > Additionally, do you
> 
> I'm wondering whether we can add a layer on top of the flash type to handle

When you mention "on top," are you referring to incorporating it into 
the MTD layer? Initially, Miquel had submitted this patch to address 
stacked/parallel handling in the MTD layer.
https://lore.kernel.org/linux-mtd/20200114191052.0a16d116@xps13/t/
However, the Device Tree bindings were initially not accepted. 
Following a series of discussions, the below bindings were 
eventually merged.
https://lore.kernel.org/all/20220126112608.955728-4-miquel.raynal@bootlin.com/

> the stacked/parallel modes. This way everything will become flash type
> independent. Would it be possible to stack 2 SPI NANDs? How about a SPI
> NOR and a SPI NAND?
> 
> Is the datasheet of the controller public?

Yes, https://docs.xilinx.com/r/en-US/am011-versal-acap-trm/Quad-SPI-Controller

> 
> > anticipate that SPI-NOR should throw an error if the second or any
> > subsequent flash within the stacked connection is different? Or would
> > you prefer it to print a warning and operate in single mode (i.e.,
> > only the first flash)?
> 
> Both options are fine, but I haven't yet decided on the overall architecture.

Ok.

Regards,
Amit
> 
> Cheers,
> ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
