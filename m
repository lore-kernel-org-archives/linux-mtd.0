Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3756C4167B
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Dec 2023 17:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EmvrIIT8oATIhX8Kd+JApzkZVwEs8HnfTTGtk/yuIWc=; b=CMsyN4t86BXKhW
	gS8LEsATX82pOXiJEO05o/lib20tTQKWhsnU5+WG0vk9PmAgXx8DbQBpUt71zVF4wNnaxkVU7Z9cr
	AcQl4aYcpNUqMOVyl3nekEdfrzwcFHmh3+XdOFzlNggSRvPOa+G8TUGCDDa3wLAUFXl6Q2y9rEuNq
	nUdewfY7KWJSNwpGhnrW/U1ANzYmZn7PXdsUXLu1ARMdzl0KhFif9UVS9ss7a+k1ZyKD7u2JHiFVX
	ny+020f69CJ5K9McMfOVqjCzPI04wKuMo1g995HCL75qz0InHU2/xQkx7XSd15ExxmlHLYpdI0irg
	ZgcThhQ1vHaqVqMQR0Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBeIQ-00G79o-2U;
	Fri, 08 Dec 2023 17:05:50 +0000
Received: from mail-mw2nam12on20618.outbound.protection.outlook.com ([2a01:111:f400:fe5a::618] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBeIN-00G78k-22;
	Fri, 08 Dec 2023 17:05:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U3LPzl2zRbfrY9i4qzZwl86GBAIjWDrEf3Ic7FsZwQare1vqlf/Z3wvalkVqhh5bWw7PJp9WKBxHr/IMyOHEZPNkl/J3KBtFVSnVOM1noJ5b8CymIm3cd5cO5kG5mIGHBBNoc31m8vCw81vD2NtpRFHne5QbchjiFAiDOmz+ll4YtuSTOCoEqiDWQQYG9NWaSbq73FahmTMzlACt/2h8Zie5wM9C8XZHKY8WFnvnuboRyE4vF0ngZXXvAsIwV4B/B2RtHIg2r5i038aFZNTXE1HMCh4Q9bLvHgZT2F+DNoMtnMGlHsoi5caZD+21pzR37eZ6MFUgP2u+3PxMTAw+JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CmL6xVwOmtW3NZf+3Op/LrLjwAeU5ciP9cUAgiLR06Q=;
 b=GFBFHeejPpPfOXPgYzh5IVqrOxHPEGQFnYhjcItPCPcHZ9n3gRmjIy3qQX9lPw5eK9rkT4KrWjjegVwCJfNG4ai6W8IJ8wXz5UnaOg2FZ7ZIaODLR5rlUd5yXQIcapMVD3mJTNUb6SWkkf7R9OMLnsCMEFWQ2p24WN/Oap3VE+Zl0LT7G9S7b1ZjFMmrTygTB579dwIfxQCbT4ArCckExt9ZPOyhU8m5WJNxNRgHPE8cc82ojwKlV+IpPhA7JhfUsGuUcq9tg0itjYO/GQkTybOVGR5FrJdHmUiP3RJoRzrGQqp/LML6UifAqHaP0H2cffKFHdJTqpj6noT629ovcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CmL6xVwOmtW3NZf+3Op/LrLjwAeU5ciP9cUAgiLR06Q=;
 b=FshwX/GR9CBK2pRwuUIRVWb37lD6qQXGtzcVkYstNww7u8Xtgz5E9tponzLntMA2byIJIRMTwn+RosBUJ/PFjBX5cJkkqgedrOcjuOdeaFYGTMe8NMW4SCyccTQyhywL5S1GvznZa7zs1hqPtx/BKTUSzmzXrNUCVIB3fDV3po4=
Received: from BN7PR12MB2802.namprd12.prod.outlook.com (2603:10b6:408:25::33)
 by DM4PR12MB8557.namprd12.prod.outlook.com (2603:10b6:8:18b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Fri, 8 Dec
 2023 17:05:34 +0000
Received: from BN7PR12MB2802.namprd12.prod.outlook.com
 ([fe80::2a35:852d:bc78:ed64]) by BN7PR12MB2802.namprd12.prod.outlook.com
 ([fe80::2a35:852d:bc78:ed64%7]) with mapi id 15.20.7068.028; Fri, 8 Dec 2023
 17:05:34 +0000
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
Thread-Index: AQHaH4D9pFM5xtDoeEuMNIpXuxvtzbCcYmwAgAEJ+aA=
Date: Fri, 8 Dec 2023 17:05:34 +0000
Message-ID: <BN7PR12MB2802BEDFB821A1748185794CDC8AA@BN7PR12MB2802.namprd12.prod.outlook.com>
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
 <20231125092137.2948-8-amit.kumar-mahapatra@amd.com>
 <e2305642-55f1-4893-bea3-b170ac0a5348@linaro.org>
In-Reply-To: <e2305642-55f1-4893-bea3-b170ac0a5348@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR12MB2802:EE_|DM4PR12MB8557:EE_
x-ms-office365-filtering-correlation-id: 3f3b7867-eec3-402b-041b-08dbf80fe469
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fMK4tA5fsoJEFbTqmBqIk6HDocUMXi/QKU8PqcBiott3ktLuwRK04FuJNxr7kUnhZb2/y0nbHhN3zrCRHk5oRDkEQ/J+6nr6thT1PnCvwyu4PWVM15sjF44lJhuIAUYWFro5regdRhgty9+63S3PYl2fgjGIxvBJjf2ejvjdfbBa/lCMDaxKP6q+O7P+JVEn6pUNpObDBEgI7DpqaYLIHpfF7ry15bTsuUtSfknxVfF9qmV57rOfeYsvOfWkxZAYUX6rfK1mwgAw7Uvlf8NitbG2KpXAgDXEU9juft20G4QhRHsrm8UvqYnwOYQqpTYZnG0FexEK0axvIXtFO9xFRsGL5eo6zj6/Xir6iYzuQDWOBUVToOuvhOKYGkaz4yxFYxJ+b74gM/ZRF/AI8lwjRM49j11pTpkR2acOVSRchrCjGrcTHSFYfcGmnJ0ddEOzWMZffSFzQIdDMKHKkTzQnYz7qTOrg4X/OJCxV8iM0ldxhYOI2lJ3Wbad1nQJFn0tbmsRYjmaryrQcQ/KBIzoU6Lhd1j6QwVGMs5iakdYy0V3mqmdPGPpo9V+0H8DCResdVkfjM7JEJYBsrVMwY/DgBZAcg3CxtOarAI6iA2fdrVxUs5n5hOAZ4EhoqOT54EcxVQo9WMGobDs2lo+zTsb3YnoeMWkM1sUPO6i3EGJ4seq5tSJqhIo8wM5r29Yp5F2
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR12MB2802.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(376002)(136003)(346002)(366004)(230922051799003)(230173577357003)(230273577357003)(64100799003)(186009)(1800799012)(451199024)(55016003)(41300700001)(122000001)(38100700002)(2906002)(7416002)(316002)(38070700009)(921008)(5660300002)(4326008)(8676002)(8936002)(33656002)(76116006)(9686003)(53546011)(71200400001)(6506007)(7696005)(26005)(478600001)(64756008)(86362001)(54906003)(66556008)(66476007)(66946007)(66446008)(110136005)(52536014)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZjZEak5kN1V0Z1NidkpxclBPaGNILzRWakdJNVNlVHF6TmhpdHNneEh2aWVw?=
 =?utf-8?B?bERXWlIxU3pGSEN1S2cxUHpWL0FTTUtNK2dHK3ZKU09nNDdHVHczZ2kvdkV3?=
 =?utf-8?B?ODJwanFSWFMvbll4Y2kreHIzR21NMFBIN3p2Wm40SmtTUHRDQmpBOVB1SjFW?=
 =?utf-8?B?bWVnRmlNeVg5SnM1V3NPeTJVVTNvYjBkRkhabDV5VzMxU0Jnb0IxLzFiUGVI?=
 =?utf-8?B?NnljMFVQVUJUYytWaW9JV1FpYnBkVnZGYzRvT1BuZXVJWlpuQXFkbVZhejVo?=
 =?utf-8?B?azFDR0FLcDFtWGRuRmRQaUt1aGZQSVZ4SFl2bFRYc0hDU2ZhbmpxY04xblJB?=
 =?utf-8?B?RTV0R1U0QXl5TnFudHlqeTgzUlJUMGVFSklGZjFPVzlVNE5JWFNvZGJCMlgz?=
 =?utf-8?B?Z2hNOVhWMmFpOG5WTnVZNzE4cit5ZHZLZmFXRDl6dUxVYTFKUjlleDhueDZu?=
 =?utf-8?B?VUtoRDBCU05XdnZmL2gwMms5Q1FlMHpQUC9RQS9NckVnK0VZQ1c5cmVGK0li?=
 =?utf-8?B?YklqdWYrOUJza0dIVWszbXRISXpZTmZDOWk5VDBFZU96bkw2UzduanBaK0x0?=
 =?utf-8?B?VVNoZ3RFU0VoMkVMV3JHdjVMNThIcjU1emdvVGxjVFAwd0tsbjF1cFZBM29T?=
 =?utf-8?B?bGZvdXl0OUhYNkluSm5DYnRPMDNQQzlvSC9LQjEwY2M2ODFxTDltV3NKSkdR?=
 =?utf-8?B?eUp3UjlZSmx3MVJqOSs1K3ZCME5xWnVvRFQrbEo5L21Xd1F3NnlpRlh3Y0dH?=
 =?utf-8?B?QWJUYVp6UG1pUURKSkw2VjgrMmF1VllzaWdoWjhEUzFyd09hYk9iZXlFa1ls?=
 =?utf-8?B?VlpwTU1FUDhZMkhreGtZUWF3azVLTVFDZGJwNzBmWDVIdkxQaVlsOEI0OVhB?=
 =?utf-8?B?eGtuWFhNaDA4dGYwZXBuV3JscnY3c01ZbDlZUy9QV1IwYVJ5ME9DcHFtN212?=
 =?utf-8?B?blhFdm9qczZJNzJST2hmMHVnUW9SM1B6cHoycFlwdDUvc29TbTZhV1h4UlFn?=
 =?utf-8?B?d3lSRnk4OWorRFZCVGppZEtSZXQ2NE9zZFUreU1YamFEbkxWZ3ZoYXF1UWZJ?=
 =?utf-8?B?SGk5ZHFCRGJwaDZnV055eGVNd2xGajI4WDJIa3JWZ3V3MW1nM3E1dEphNFd6?=
 =?utf-8?B?QlpJK0lDWmZkd0hmc2h3aGNabEJtL1VjaURnL0J3Z0ZWSklzOHdTMlFTZzhv?=
 =?utf-8?B?M3lGMFJUZXF2cGc0TzRWNlJpV2RBSUx5Q2twZnBINVUzcEk2L2dNZ3RFV2FK?=
 =?utf-8?B?V09LQzJoc1dwdGJrVnlYVkhtQW45NjFkU1cwWjk4cjROMDNpUzF6WmtMQmZ2?=
 =?utf-8?B?Z2hvemxXSHNUZ2pkVHZzbHRxWFBSOVJ3M3JYZklnMndNN3dSamYxVW96UHJM?=
 =?utf-8?B?cHZ5bE5BNnBNY0ROaDdURDArd0VpclNWaWkzWHNGM2xkc3VjWU9zZEIyRG1s?=
 =?utf-8?B?T0R1VjNtR3QzK2t2ZitWWEJraExWbDZkT3ZlODdYTnQ3MXlzSDJTbDFrdCtz?=
 =?utf-8?B?eTRMZ21OWWd5MWFUSmlsTUZoNjM0TTY4aTFKL0hyUDZiazRZVit4ZTJTeHJ5?=
 =?utf-8?B?Rzc4bytJdk5rVnVHMy9XTUxMdzBOcnEweXZ3ak9uTWhjZXRTMkk4MjY5aXZM?=
 =?utf-8?B?YXJzL3hFSDZ0R0wyaEZPbjl1K2kzNkU4U0dESVF6UXJIZ25BOWJsOUZYLzdR?=
 =?utf-8?B?dzQrSEhsanpmYldzakVpZ1ltVnA1aEF2TTh4MlRXcmx5eGxDVVlwMVRnbEJn?=
 =?utf-8?B?a0twbXlmNXVlVDdabjN1OHJseDRFVThpOUhoSnRiQzZsYzZ3ZDNhSmdwcXEz?=
 =?utf-8?B?R1Z3VGprVDJaa1g4dndyK3poZHdmRlJnMGkwM3dpUG5vZExuTld3czh5aFpH?=
 =?utf-8?B?bmdRK2QyWGF3TVh3SG9DM0JqVmROc1JKd0VacEZFZzc2ZUZYNUNrMTR5b0pv?=
 =?utf-8?B?L21TRnAzUGkrMjRWRkVEYnZHcHVYM01CNi9MKy9LcTkwV3UzajZGQnRCYjN1?=
 =?utf-8?B?dFlOUE5ydml6OUs3KzdzaUxxdFYvSUdaOXZCdk9DdUFhQjhaYVRGbzlDVy8x?=
 =?utf-8?B?ZWZTSTRFbWo1V1RjNUdrUElGdk0rS2VJb0pPbnFKWW1lM0ZXWGxIRUNxRFVv?=
 =?utf-8?Q?yR/U=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR12MB2802.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f3b7867-eec3-402b-041b-08dbf80fe469
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2023 17:05:34.3251
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iaRprxwL+2pDF7e6PN04lhFaMSP4k7HlbYcMlkR7d8NDP2zod+iFzlaUP24BGR83iI7vQgU7Ln7rvK1zyDdwBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8557
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_090547_758372_96FC7F7E 
X-CRM114-Status: GOOD (  33.12  )
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

Hello Tudor,

> -----Original Message-----
> From: Tudor Ambarus <tudor.ambarus@linaro.org>
> Sent: Wednesday, December 6, 2023 8:00 PM
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
> Hi, Amit,
> 
> On 11/25/23 09:21, Amit Kumar Mahapatra wrote:
> > Each flash that is connected in stacked mode should have a separate
> > parameter structure. So, the flash parameter member(*params) of the
> > spi_nor structure is changed to an array (*params[2]). The array is
> > used to store the parameters of each flash connected in stacked
> configuration.
> >
> > The current implementation assumes that a maximum of two flashes are
> > connected in stacked mode and both the flashes are of same make but
> > can differ in sizes. So, except the sizes all other flash parameters
> > of both the flashes are identical.
> 
> Do you plan to add support for different flashes in stacked mode? If not,

No, according to the current implementation, in stacked mode, both flashes 
must be of the same make.

> wouldn't it be simpler to have just an array of flash sizes instead of
> duplicating the entire params struct?

Yes, that is accurate. In alignment with our current stacked support use case we 
can have an array of flash sizes instead.
The primary purpose of having an array of params struct was to facilitate 
potential future extensions, allowing the addition of stacked support for 
different flashes

> 
> >
> > SPI-NOR is not aware of the chip_select values, for any incoming
> > request SPI-NOR will decide the flash index with the help of
> > individual flash size and the configuration type (single/stacked).
> > SPI-NOR will pass on the flash index information to the SPI core & SPI
> > driver by setting the appropriate bit in
> > nor->spimem->spi->cs_index_mask. For example, if nth bit of
> > nor->spimem->spi->cs_index_mask is set then the driver would
> > assert/de-assert spi->chip_slect[n].
> >
> > Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
> > ---
> >  drivers/mtd/spi-nor/core.c  | 272 +++++++++++++++++++++++++++++-------
> >  drivers/mtd/spi-nor/core.h  |   4 +
> >  include/linux/mtd/spi-nor.h |  15 +-
> >  3 files changed, 240 insertions(+), 51 deletions(-)
> >
> > diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> > index 93ae69b7ff83..e990be7c7eb6 100644
> > --- a/drivers/mtd/spi-nor/core.c
> > +++ b/drivers/mtd/spi-nor/core.c
> 
> cut
> 
> > @@ -2905,7 +3007,10 @@ static void spi_nor_init_fixup_flags(struct
> > spi_nor *nor)  static int spi_nor_late_init_params(struct spi_nor
> > *nor)  {
> >  	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor,
> 0);
> > -	int ret;
> > +	struct device_node *np = spi_nor_get_flash_node(nor);
> > +	u64 flash_size[SNOR_FLASH_CNT_MAX];
> > +	u32 idx = 0;
> > +	int rc, ret;
> >
> >  	if (nor->manufacturer && nor->manufacturer->fixups &&
> >  	    nor->manufacturer->fixups->late_init) { @@ -2937,6 +3042,44 @@
> > static int spi_nor_late_init_params(struct spi_nor *nor)
> >  	if (params->n_banks > 1)
> >  		params->bank_size = div64_u64(params->size, params-
> >n_banks);
> >
> > +	nor->num_flash = 0;
> > +
> > +	/*
> > +	 * The flashes that are connected in stacked mode should be of same
> make.
> > +	 * Except the flash size all other properties are identical for all the
> > +	 * flashes connected in stacked mode.
> > +	 * The flashes that are connected in parallel mode should be identical.
> > +	 */
> > +	while (idx < SNOR_FLASH_CNT_MAX) {
> > +		rc = of_property_read_u64_index(np, "stacked-memories",
> idx,
> > +&flash_size[idx]);
> 
> This is a little late in my opinion, as we don't have any sanity check on the
> flashes that are stacked on top of the first. We shall at least read and compare
> the ID for all.

Alright, I will incorporate a sanity check for reading and comparing the 
ID of the stacked flash. Subsequently, I believe this stacked logic 
should be relocated to spi_nor_get_flash_info() where we identify the 
first flash. Please share your thoughts on this. Additionally, do you 
anticipate that SPI-NOR should throw an error if the second or any 
subsequent flash within the stacked connection is different? Or would you 
prefer it to print a warning and operate in single mode (i.e., only the 
first flash)?

Regards,
Amit
> 
> Cheers,
> ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
