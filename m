Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A54C4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Dec 2023 07:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nhuNM9UrtnscERh8RN3JHeaKBEPu8ZLceoN73q9TMhg=; b=M+YB3v5rMYFkc4
	mKWhIUSYMUa3Rzjz+hEDot7uHCb9CHIMNa7cwB1YoEPTyxHXcX9L/jcVW1xusppVkt5cnRQreQHq6
	4ZzZkuLbtAnWNBKYHlTU+Wrgxr1v1Xw0I2sUKTeI1pkS8NlMYrXi+lRKMbby/ATeYhxscrwzKDWV5
	r3Ltf9VXI7xNKfm0Vu4FK5/Ej23ziXr8E6za0w5D/9PFDlXHQBO+lsltMFw19nfKHltNHsnTULhgL
	JBINoB+zDpw65DcIVzQ2YbAmt9uS2FBCPkpWfmNwTqerlkIRaB7gGaz8YiU8ZxV6W5zsidLqpKuAf
	pjyGmvnRTAtNhTQYRr+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE32p-002NGg-2L;
	Fri, 15 Dec 2023 07:55:39 +0000
Received: from mail-bn8nam12on2062e.outbound.protection.outlook.com ([2a01:111:f400:fe5b::62e] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE32k-002NFB-30;
	Fri, 15 Dec 2023 07:55:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hSGjM65Bcn0mDsEQ7n5OSK0CFLQymtCX5ZNx4Wyokwnnv632V/o9sNfZRbNpR3ByzYJsuJqKjN2HLLUCaByv48ghYl+IGNOv3T4WRoWIE0ozsWXHGH9BqjnLzDofMK79nWBU92UAier4XylP2Yccjp9BTa/YzT7m8nlvLb/iSt36b1BPVexPoriPfOqJZWtgIbGGqhcQcA5l5+EVpHn+YbOssun5g1UzWldc/0QZhgaY7MKqEHsUk6M/DjNw1HTAzDddDxyKGkc/HaTxa8fsaipciRAri9b4er/A5mihIHnHx9o5i5Skyc5VjzzV+Jy4fSeoOIwdWtGdAjW85Goanw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vt1Nfjq7n6uySiDJvizoYG0pNt8789q1BI7reMdqufs=;
 b=W2p3IpWbLUrJWSREEhm+BMol5bh2yTqvjfs7cAddzIf9KU/Yw40pgf2lrfAUSFh4OV3NB78pL8rNlDomamqGb6H70CjwRmQjqZwvwAZ86w9rsSI1yllkFmCZtO5drILyRFGjF0wrrAdzb+aruHifVXr9F8+kKF8p9FiX3a7kuo/cd9z/V+6FH96yWrzfJKFf72SWHxplsIkDcPsZLVwXyM800FTuKufB296bANFhff20AFie/A2+zGPyANLhGovkMQOrJ8fOySaRCASATPGkRGOCvBDPaNeOLMcXEqF4790cYESaSpQ+zXVSbmbbq2Czlync8eOJYMqCQug2w6A6SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vt1Nfjq7n6uySiDJvizoYG0pNt8789q1BI7reMdqufs=;
 b=gcBFqIVPhCTqPLRZIVOUqSID1D21TIkGRBtIoNU0klPOybkwVVuICzxvsd+IIDMuvzNErf8XVG+fy5h9J3Znw8B54vsDtBtWlgh7/S8kNBkGua8ret+SwdO7zc5fyjiWlCvEN2ac+/HzD6SOFbG9y5ZjF+pqKJ+bRYRDa6C1oaE=
Received: from BN7PR12MB2802.namprd12.prod.outlook.com (2603:10b6:408:25::33)
 by DS7PR12MB8249.namprd12.prod.outlook.com (2603:10b6:8:ea::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Fri, 15 Dec
 2023 07:55:26 +0000
Received: from BN7PR12MB2802.namprd12.prod.outlook.com
 ([fe80::2a35:852d:bc78:ed64]) by BN7PR12MB2802.namprd12.prod.outlook.com
 ([fe80::2a35:852d:bc78:ed64%7]) with mapi id 15.20.7091.029; Fri, 15 Dec 2023
 07:55:26 +0000
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
Thread-Index: AQHaH4D9pFM5xtDoeEuMNIpXuxvtzbCcYmwAgAEJ+aCABhoaAIAAMcLwgAAzdICAADdZAIABtmWAgAQ4ECA=
Date: Fri, 15 Dec 2023 07:55:25 +0000
Message-ID: <BN7PR12MB2802E87F1A6CD22D904CAEACDC93A@BN7PR12MB2802.namprd12.prod.outlook.com>
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
 <20231125092137.2948-8-amit.kumar-mahapatra@amd.com>
 <e2305642-55f1-4893-bea3-b170ac0a5348@linaro.org>
 <BN7PR12MB2802BEDFB821A1748185794CDC8AA@BN7PR12MB2802.namprd12.prod.outlook.com>
 <f5a47024-514a-4846-bc16-08cf0f9af912@linaro.org>
 <BN7PR12MB2802BB3DA682D9C13EF7DE08DC8FA@BN7PR12MB2802.namprd12.prod.outlook.com>
 <5a6f6764-6779-42b0-b6c6-3f638b85ef78@linaro.org>
 <BN7PR12MB28029EB1A7D09882878499A2DC8FA@BN7PR12MB2802.namprd12.prod.outlook.com>
 <c3fa1e04-92ed-48ab-a509-98e43abd5cd6@linaro.org>
In-Reply-To: <c3fa1e04-92ed-48ab-a509-98e43abd5cd6@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR12MB2802:EE_|DS7PR12MB8249:EE_
x-ms-office365-filtering-correlation-id: 654fc680-83e9-4bec-9e28-08dbfd43324a
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S0Ccb5XwnK9GmiwrOj7vdNr3wU+k79g+dSYP/bmyYU8T7Gu2Vt+QwLG/9sFITqZ0twRZgt5KYnwpxLctPtW2ufR2FE2JrsFvLKyYxDuAQdUYuBK0M8eOSYsssnaU0aQeqHbTaK5yq6EpET4vaKdqJtYWFCYlaF8hEBX/sqz4ybaZCbb4rdvhZ4oBIKJKS3o6frcFOVnoxV2SiYP0y3ZpL0LEBTXPmNIdHGyUcXwum877cNlMcp4N7QBKjmiDFCVjQc41WNW/DskLC3BrgTCiiKWxXxO8jnOmimsqh0IekzKjcl533rIntxyWJ731ATYkFSDqqDAn2TIsrs+cfEB5Cs3j7Hm106HMF963AnPzOzrYgKR3Y63ZPEMTDl+EgiobulBio05eQtYzNZX9taVJJihL73QKMCinYQwJhIIG0WVFEiI1p1MbHIww8xoaDT7I6vVZy1UnmeXeHAouw5cH3V4E+1j0Z0cvlNv2qPLaQ9lj/U5d3j1AMBPgvwC1mW6pRFPTBEbBX7G6wO8F9pNkExioeHVTxh2E8M5gdOOHWNzA8/Nrrj7OUdLEC9SSbgJTcrC42A0nHETZig5uQDECi7sNs9nZZisAbr/XLXkGQRZQHtOL+YZtYalGpRAT3eWRof3UbB27i19EyrRCF//z3QTxC09ZQmLHvnhB2POJZ4Q=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR12MB2802.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(396003)(366004)(136003)(376002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(5660300002)(966005)(478600001)(9686003)(7696005)(6506007)(66476007)(66556008)(66446008)(64756008)(54906003)(316002)(7416002)(53546011)(2906002)(122000001)(26005)(921008)(71200400001)(86362001)(38070700009)(55016003)(52536014)(76116006)(66946007)(110136005)(4326008)(8676002)(8936002)(41300700001)(83380400001)(38100700002)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OUNja2RQUldVUGNHNVpaU3ByWk13a2RPalZiMEJ3dXVlNkptbzNCMGNPMzNn?=
 =?utf-8?B?RHU0dUt6UFZWSHhGVFJXQjlWeEMvSUxjdnVBUDRhelU3b2NWcUVnMFlZYTg1?=
 =?utf-8?B?YW5Qa3A0UFlyNS9JaEoybEpBZXhtdlVEWWVaNlFycGNpcTd6bmMyTCtlcEhX?=
 =?utf-8?B?aHp0WmoyZDlyN0NVNWU3dnQwL3d2Syswb0pJbjdIYlN2WnNkeHc4enYzRTVk?=
 =?utf-8?B?dkpwNmdTemw1YWFVbEgvUFQyNmJoZVdlZHA3MjVpMVRXK09CckNjS3VjZWJm?=
 =?utf-8?B?WnlYcE96M3BISXd4WjhSTVBja1BqR05JNGlicTgrVWtNNVZ0d0Z0czI1R3lZ?=
 =?utf-8?B?QnZ2eUlZdVA3dnhXOXA2ZWlNakVTbUd3cUdtMlJ6VURWMXNsQnFENzJJRElq?=
 =?utf-8?B?cGtYUHRuMGRkRzdtTHZZMmVnQVpJQmNsRFRnS0NXWWw3c2pSUDlOempBOXZt?=
 =?utf-8?B?eU5TTVdMTHRuN2xzNlc5QW56UDRuT0w0TUdzV0sycmNqa1FoVG9TVkdNaVZa?=
 =?utf-8?B?Nm9XajlENm54MGZGQkpKM1NkdkwrZ3l4dXJvQ2VXS205T1M0eGNlRFZjWWdN?=
 =?utf-8?B?SmVWY2ZiMDgyc05oMFIzbGlWRU9STTVpKzFDSVBML2NPZGJLVGt1Ym5ROXM4?=
 =?utf-8?B?RWwxTndkZVBwdXdXdGl4ckpUT1VJYVZPK0YwNXJXY2ZmWDU5U2NucWt4SnVO?=
 =?utf-8?B?MUlSUzN2QVJYS1hBV1djMjJDMTVpY1VXUkV6Rk5YTVRNWnpIWGlkWmhBamhS?=
 =?utf-8?B?ZllqUVJoZ2d4Ti9TNmltS2RnZ0hvVjhRUVY3dEpOdkNVQUVJVnBQMEZFQUxS?=
 =?utf-8?B?TGFMQ0lGQlV3S1ZhbGUrVW03OFFhczN3TlIwNmY3eGNHNE51djA5TzRVUFh6?=
 =?utf-8?B?SnUxZVN5L3BoQ3ozWEpPejl5Tkg4R3pFMnRSMnFKN1hNcmI3VEg5T0cvS2pk?=
 =?utf-8?B?amVsMC9pZklhdGUzQS8xRWc0OUl2N1p0dlRFeU85VDJSS3l2NCtBci9taWN6?=
 =?utf-8?B?ZFdUZkFUcENiMHBBZnIwc2piUEJML0pQYUdteTE2OUw3WlZFdFRWcW1scUZS?=
 =?utf-8?B?a0xHcXhqV3J0K29DV2NWMXI2UWFwb01FeklCUDF0NklPek9zejBlZ2NaQUlm?=
 =?utf-8?B?eDZNTmpRY0V4ZmFVRFFxaHRjdlBYTFhSRHFDUTROUWpKaExrQ29KMWJwYlg4?=
 =?utf-8?B?V2NUTG1lYkc1eHFVcHJlTWRQNDNpc2haaWVneGI4RDRWTjB1YzFhVmF2cFZq?=
 =?utf-8?B?cGJ1TTVQRVhpbndqbnpqNEJDR1cyM0tlclVaa21PMlR5SGR5RllRTEJPWkU1?=
 =?utf-8?B?Z05PTm5BS3o4UDZMUEtMS0w1UEIzcVkycTVPem82Q25lVlFlVXl3dU1jK09R?=
 =?utf-8?B?Nmt3aWJBWCtXSlpSL1FqUnVqeGtvanZqa2F1WDVRRVNxayt3K3pjck1YTWd2?=
 =?utf-8?B?Z09jTmhpS1pabjI1bTVmdjB5Z21EakoxV3pHcmZyaFdFRnc1Lys2YkVqYk11?=
 =?utf-8?B?UkhHMlE0dFFERWNiWDQ3U2Q1Y3R5VDA0R0R0ZmRKSzIrUTRXL2JXajd4bnNy?=
 =?utf-8?B?MlEvUmxEMkpTaThPV0h1NnB4RHp5RnY3b3RsclFNZTlUNTFwbTFYbTlUMlUw?=
 =?utf-8?B?aE16SnBLRElYdUFqcTBrRkRaT3llWXNkTURlUENQSVVDR05CdEtkRktKWlZo?=
 =?utf-8?B?bGN4SytPbHExM29BKzliS2pSTHQvcDF5YTNyU0h2amkyNWJlV1Qxbld2M252?=
 =?utf-8?B?Q3RZcnE4UG1oY0YxcnBzU2hZa0M3NFRRclI4a2YwQU03VE1WcDZ1aXVRbXJH?=
 =?utf-8?B?c3E1TGxzSS8xeXN3RWtMeXZJZ01FOThIZmVWUnRyZExmT29YdXhzMHNaanFY?=
 =?utf-8?B?K1NoR3JOWVFwMC9SUmJUdTZuRGVaR2VzL1N6bDNJRWJiWGo3TjR6T1VHdnhM?=
 =?utf-8?B?VWk0VmlReFJWWS9LSnViK2lWWmZUZW9IWVVpeTBTdGNoKzJ4WTdBQ3NmS2Jm?=
 =?utf-8?B?WDJvTi9PQVZSREdrNHFZV0E2K29jNldGQTlGUzdPM0VWdm9YZmxuZ1VkWWxF?=
 =?utf-8?B?RHBZRy9vOTBKK3B4VkNDcE95WGJ2Wjc1dGY4RjhKNnRIcnZQQWJCcS80TjNy?=
 =?utf-8?Q?brCA=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR12MB2802.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 654fc680-83e9-4bec-9e28-08dbfd43324a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2023 07:55:25.1354
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SgEPsE+V/MTL0Oqmk8YExnxqHEW4bnsLfQSylYG18OtR0uRCWJm/1QjUvawGQOfQPdFnInUr4wR0K8NwUKsVUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8249
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_235535_036389_C645BDF7 
X-CRM114-Status: GOOD (  25.98  )
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
> Sent: Tuesday, December 12, 2023 8:33 PM
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
> On 12/11/23 13:37, Mahapatra, Amit Kumar wrote:
> 
> Hi!
> 
> cut
> 
> >>>>>>>  drivers/mtd/spi-nor/core.c  | 272
> >>>>>>> +++++++++++++++++++++++++++++-----
> >>>> --
> >>>>>>>  drivers/mtd/spi-nor/core.h  |   4 +
> >>>>>>>  include/linux/mtd/spi-nor.h |  15 +-
> >>>>>>>  3 files changed, 240 insertions(+), 51 deletions(-)
> >>>>>>>
> >>>>>>> diff --git a/drivers/mtd/spi-nor/core.c
> >>>>>>> b/drivers/mtd/spi-nor/core.c index 93ae69b7ff83..e990be7c7eb6
> >>>>>>> 100644
> >>>>>>> --- a/drivers/mtd/spi-nor/core.c
> >>>>>>> +++ b/drivers/mtd/spi-nor/core.c
> >>>>>>
> >>>>>> cut
> >>>>>>
> >>>>>>> @@ -2905,7 +3007,10 @@ static void
> >>>>>>> spi_nor_init_fixup_flags(struct spi_nor *nor)  static int
> >>>>>>> spi_nor_late_init_params(struct spi_nor
> >>>>>>> *nor)  {
> >>>>>>>  	struct spi_nor_flash_parameter *params =
> >>>>>>> spi_nor_get_params(nor,
> >>>>>> 0);
> >>>>>>> -	int ret;
> >>>>>>> +	struct device_node *np = spi_nor_get_flash_node(nor);
> >>>>>>> +	u64 flash_size[SNOR_FLASH_CNT_MAX];
> >>>>>>> +	u32 idx = 0;
> >>>>>>> +	int rc, ret;
> >>>>>>>
> >>>>>>>  	if (nor->manufacturer && nor->manufacturer->fixups &&
> >>>>>>>  	    nor->manufacturer->fixups->late_init) { @@ -2937,6
> >>>>>>> +3042,44 @@ static int spi_nor_late_init_params(struct spi_nor
> *nor)
> >>>>>>>  	if (params->n_banks > 1)
> >>>>>>>  		params->bank_size = div64_u64(params->size,
> params-
> >>>> n_banks);
> >>>>>>>
> >>>>>>> +	nor->num_flash = 0;
> >>>>>>> +
> >>>>>>> +	/*
> >>>>>>> +	 * The flashes that are connected in stacked mode should be
> >> of
> >>>>>>> +same
> >>>>>> make.
> >>>>>>> +	 * Except the flash size all other properties are identical
> >>>>>>> +for all
> >> the
> >>>>>>> +	 * flashes connected in stacked mode.
> >>>>>>> +	 * The flashes that are connected in parallel mode should be
> >> identical.
> >>>>>>> +	 */
> >>>>>>> +	while (idx < SNOR_FLASH_CNT_MAX) {
> >>>>>>> +		rc = of_property_read_u64_index(np, "stacked-
> >> memories",
> >>>>>> idx,
> >>>>>>> +&flash_size[idx]);
> >>>>>>
> >>>>>> This is a little late in my opinion, as we don't have any sanity
> >>>>>> check on the flashes that are stacked on top of the first. We
> >>>>>> shall at least read and compare the ID for all.
> >>>>>
> >>>>> Alright, I will incorporate a sanity check for reading and
> >>>>> comparing the ID of the stacked flash. Subsequently, I believe
> >>>>> this stacked logic should be relocated to spi_nor_get_flash_info()
> >>>>> where we identify the first flash. Please share your thoughts on this.
> >>>>> Additionally, do you
> >>>>
> >>>> I'm wondering whether we can add a layer on top of the flash type
> >>>> to handle
> >>>
> >>> When you mention "on top," are you referring to incorporating it
> >>> into the MTD layer? Initially, Miquel had submitted this patch to
> >>> address
> >>
> >> I mean something above SPI MEM flashes, be it NOR, NANDs or whatever.
> >> Instead of treating the stacked flashes as a monolithic device and
> >> treat in SPI NOR some array of flashes, to have a layer above which
> >> probes the SPI MEM flash driver for each stacked flash. In your case
> >> SPI NOR would be probed twice, as you use 2 SPI NOR flashes.
> >>
> >>> stacked/parallel handling in the MTD layer.
> >>> https://lore.kernel.org/linux-mtd/20200114191052.0a16d116@xps13/t/
> >>> However, the Device Tree bindings were initially not accepted.
> >>
> >> Okay, thanks for the pointer. I'll take a look.
> 
> haven't yet read the thread from above, but I skimmed over the AMD
> controller datasheet.
> 
> >>
> >>> Following a series of discussions, the below bindings were
> >>> eventually merged.
> >>> https://lore.kernel.org/all/20220126112608.955728-4-miquel.raynal@bo
> >>> ot
> >>> lin.com/
> >>
> >> I saw, thanks.
> >>
> >>>
> >>>> the stacked/parallel modes. This way everything will become flash
> >>>> type independent. Would it be possible to stack 2 SPI NANDs? How
> >>>> about a SPI NOR and a SPI NAND?
> >>>>
> >>>> Is the datasheet of the controller public?
> >>>
> >>> Yes,
> >>> https://docs.xilinx.com/r/en-US/am011-versal-acap-trm/Quad-SPI-Contr
> >>> ol
> >>> ler
> >>>
> >>
> >> Wonderful, I'll take a look. I see two clocks there. Does this mean
> >> that the stacked flashes can be operated at different frequencies? Do
> >> you know if we
> >
> > In stacked configuration, both flashes utilize a common clock (single
> > clock line). In a parallel setup, the flashes share the same clock but
> > have distinct clock lines. Please refer the diagrams in the sections
> > below for reference.
> > https://docs.xilinx.com/r/en-US/am011-versal-acap-trm/QSPI-Flash-Inter
> > face-Diagrams
> 
> Thanks! Can you share with us what flashes you used for testing in the
> stacked and parallel configurations?

I used SPI-NOR QSPI flashes for testing stacked and parallel.

> 
> >> can combine a SPI NOR with a SPI NAND in stacked configuration?
> >
> > No, Xilinx/AMD QSPI controllers doesn't support this configuration.
> >
> 
> 2 SPI NANDs shall work with the AMD controller, right?

We never tested 2 SPI-NAND with AMD controller.
> 
> I skimmed over the QSPI controller datasheet and wondered why one would
> get complicated with 2 Quad Flashes when we have Octal. But then I saw that
> the same SoC can configure an Octal controller (the Octal and Quad
> controllers seems mutual exclusive) and that the Octal one can operate 2
> octal flashes in stacked mode :).

Thats correct .

Please let me know how you want me to proceed on this.

Regards,
Amit
> 
> Cheers,
> ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
