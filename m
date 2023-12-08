Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B287BC10F05
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Dec 2023 17:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zthXnZPsgpMQymaZNQ/g3mHQmLbBB4vtEaE5bgHrjiA=; b=jekAHjYn2jXIU+
	4hGO+9Vz9wjnxXAX+gwKYIPHPN/kI9yhaAm8EZlJsBxggb4DStaEFnKCxF/GMZiwXu8Wz4XljH+VJ
	4fi5/GmcPFJUIrU5W55EblY77fuO8lRsqQeFu6qg7uDX+p4vY67wr7XuPZa1vMaphv2sS9l+4Ogw0
	5iLanyWonVIQkDwm9H1unz9I0FkLrOhxExboXk9dRxC7jHVaP1+OooZOG9E+LOzEUwQLUKbgKvEDh
	QqfNRC/p0CCk2WQwlI0CLp0QpS/qAaHniydDbat+XS9UyEhR+Wz8t7SjMqS3dIQmFf1AXnp8fk0R4
	Tbq4wULkhTGIh+EN5XPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBeJ9-00G7JP-0y;
	Fri, 08 Dec 2023 17:06:35 +0000
Received: from mail-bn8nam11on20601.outbound.protection.outlook.com ([2a01:111:f400:7eae::601] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBeJ7-00G7Hw-0C;
	Fri, 08 Dec 2023 17:06:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PUlayxfNGWb2zrmnUy9+Z8skvEYFX2JMvlOQbLZmQaFVHNd5eQtaS4eg39M8oXuye1UiNxLWvMDO+dsdbPtjlk2omNqmfq4W0Ww06bRCXfIuG+hMgnKl6FYHYq6oCPSkMbBJBHP71ld6RMEoJR4UmmA/NxhgcqPhDX+7RNaTfGOytulRiWlBLRrQZZQYpxzmfg4XkCXJ9sxFWV8Sh5/VU0QXQLcUEUgM6bnI7tunU1I1sUeNrEjYeHWJqmrvBg1nZkJSHsNcLxHBb4m7aTWOJvgx7gDv0jbdXN25thV3/8cIZFrftFTXLjfmMQZ1FR/+xr7103hP8HNTrOK2knlhGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e3koL2KXWeRIPSIfturxjqO3lbK0MmkVxq81KyfENJk=;
 b=MxL6sLVNbiAtb2ADUH8b4TVgPu3s9lovmJ/s0exN8u2hpbBSYZjo/W2ayDQb6RhIQ2viB80IFmLj6rd4nLNseoVGOM7QHYI8tdrtXHp/WBKhGeUCywK6fYp2bl3kqZEzPWB/qE3doWtx/a8+Xq704Q3Pvz4bk8161iPs5KzkWtt3J7saHfjz9R7m50YbAtCkFsCj/A1Wrn01ASV2ONvjoGNYuZ6J+ISDeuUY++35Sp4lEGaygg0w9+ltywg9FlZgzAjr+Yeazyk0CzNElV/h3vMxz995Mj015qsQxicvhOFFwl4KgBAJBmt8WECx5eKwSQW4Ju02FtmelMl5073mUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e3koL2KXWeRIPSIfturxjqO3lbK0MmkVxq81KyfENJk=;
 b=o8jkyptLx3zvhXiMh4WEvVXPKdKECw9kiPCp18fFq1CM9PRDrQ2p+GwWUvdeeg9hZqeUyYfdYbLxM6ubEa+ZlrFGQ+4uvKDHZ0vPwXSoV/KB4LxAYb9QTw5KdPivLmIiWct7HKtGTIOARxfc+ylurXZS6XgYRxUBoU63UaoRqjw=
Received: from BN7PR12MB2802.namprd12.prod.outlook.com (2603:10b6:408:25::33)
 by DM4PR12MB8557.namprd12.prod.outlook.com (2603:10b6:8:18b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Fri, 8 Dec
 2023 17:06:24 +0000
Received: from BN7PR12MB2802.namprd12.prod.outlook.com
 ([fe80::2a35:852d:bc78:ed64]) by BN7PR12MB2802.namprd12.prod.outlook.com
 ([fe80::2a35:852d:bc78:ed64%7]) with mapi id 15.20.7068.028; Fri, 8 Dec 2023
 17:06:24 +0000
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
Thread-Index: AQHaH4D9pFM5xtDoeEuMNIpXuxvtzbCcYmwAgAAD2QCAA0mkcA==
Date: Fri, 8 Dec 2023 17:06:24 +0000
Message-ID: <BN7PR12MB2802C8279CA95FA08F8DDCF2DC8AA@BN7PR12MB2802.namprd12.prod.outlook.com>
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
 <20231125092137.2948-8-amit.kumar-mahapatra@amd.com>
 <e2305642-55f1-4893-bea3-b170ac0a5348@linaro.org>
 <9f577482-30d9-4e1d-9469-812d323b18c6@linaro.org>
In-Reply-To: <9f577482-30d9-4e1d-9469-812d323b18c6@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR12MB2802:EE_|DM4PR12MB8557:EE_
x-ms-office365-filtering-correlation-id: 0b4e3074-7ea6-4e6e-8fd7-08dbf810021e
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Qnxq/xDhTRh7V6XIvdREG0WcnM43lfWw94jE5zp+32RHWqai9Lj5bExwPwSbFU5p8VNE36Aeu4HrtCa3ZUmhpHCCfgXtoqsZKXBMFhvlRXoGs5QwQQrk3kDVJfDxpLqWi0XIO48w61C2EZyVLHxy0xjyGygcbLimSREwH6M/JvuM8JCLACNE5CKr1UaZ1AXRKi6H+SuWIf9jxoY1BkmWqax3iaDO6wXRPrQz2XoqtXJ6xtbx9vMjdFyom/NhrlkxvR2/0rBUXPHarjXVyGKrVRZhufV+NE4ApLs8cwKnBK3Vyzn5126qGSznAV0NSAOGx0bEALBM2SaQ1umw4T9aF6j7XLefkbmzvcJmOodI1ISbyqqTdThcT8rW7ejJc0nVr8FgCvedVCZ3DwcQ1tDzmCjDDNPaZ5s2nxtwjB1jHf3mton7Qi/I9epgUsrg4GG2lE0NEY/2Bk7ynhgqopItj7cG9rUa2sjvXcivbY6QBlj62EDlCxj67ahQf3imcG7iSTwEwT3foHGCfybEF8IeNGloSf/TlTAnuVEFH1RGB+44/z3CDDh7W4BuogqP+RgbT7RY8rwNLV4NF3nD58MrQKjr1ZmO7NFNQY3/RjIKctUEsaH7GsoNSp1oKUvZoANv
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR12MB2802.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(376002)(136003)(346002)(366004)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(55016003)(41300700001)(122000001)(38100700002)(2906002)(7416002)(316002)(38070700009)(921008)(5660300002)(4326008)(8676002)(8936002)(966005)(33656002)(76116006)(9686003)(53546011)(71200400001)(6506007)(7696005)(26005)(478600001)(64756008)(86362001)(54906003)(66556008)(66476007)(66946007)(66446008)(110136005)(52536014)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eUVtZVFhZ2xlRlZlNDZSaUF0K2FxZjRha2t2dkQ4MGluSHFBTkkrM2d3MDJp?=
 =?utf-8?B?a2RRMklNdWpKelYrd0NQZ3NUVkpBMWZPOVVJVXJJQWQ0bkhFZ010TXRHd1lo?=
 =?utf-8?B?MXVlc2FXN3p1UGtQMDFLS09Jd3RKek1YbFpjbG5ZRXVCNnFieTZBZ2NEamR5?=
 =?utf-8?B?ZWlWN01PbXRHVUxNMG4wMVI2WEVydDhzeTNPN25OMXRzWnhpOWY2NHlZSHlX?=
 =?utf-8?B?czliNitTZVZybDBLT3ovMTlNV1VsL24xTnhqYisvT3Rkb3lRay9CRVNtQ3Qv?=
 =?utf-8?B?N1oySWRGYlpBdzlSZmlQKytlbTE4eG4wQnBBSnR0NmcyV1ZTWThpdWFpeTZ0?=
 =?utf-8?B?RXdEOWlyVkI0SlY0V3FSVlJRSkNpbDZpaWx5ejdxRldQOGkyRERKa3VOMlgz?=
 =?utf-8?B?a004YzA4SElpRGNvVmNCZDJRZDIzakN5U1dna0RMSHZZdWhCdVdKWUFZeUVv?=
 =?utf-8?B?K0J5ZFJEbG9pVXVPNU83VERYVEdaTWYzLzhEaGJHS3JTMHRXekN4S01neXg5?=
 =?utf-8?B?Z0x4M0Q3QWcrTlllT1NKcytnV2tsc1p2TzVuVTBOZTZGY1lzR3RwcTVoK0o4?=
 =?utf-8?B?NndsVWEvdlZ6U3ZPekJDSXh4cmNJZkpLVk5kbmwrYUlybXUrb2tGdmRqVVNT?=
 =?utf-8?B?TWRvaU93NFN0WHFFQ015NWhjR2tHK1pBNjl6a3lnU3pZSTU3bWF5blVyWnVa?=
 =?utf-8?B?S2RVVytBeEM0dy9TeWJTQ0xyUGJJVG1ZYVppNHdSd0t6Z3d5T01Rb1Yyb0kx?=
 =?utf-8?B?SmwzOVJzTjV2TW5MOXNNZS85aGtpTTJTT0xNKzhNald5cUYzSnJwWXBzREVt?=
 =?utf-8?B?VFBWZHBYbXROWHBVeHFhM3k1RFVPWmxuSzkrNUgwL3BZVTdlcnZDOGFqbzlY?=
 =?utf-8?B?WUFaVmsxSksvcm9pQlVOVXozNWdFMHF2cUpmbVdRMFJPZUgrU3E4QU53ZXY5?=
 =?utf-8?B?WWRuU0JNdnU5cGYwUHpuN1lNeEpXcG4yVkQ5TmxjTnhFVGdYNmowK1pmNXdn?=
 =?utf-8?B?QXcyOGFlLy9zTkFZaWhqdEJCVUFLenlHdzQxc2tkK29lL0V3bEszaXhKQUFt?=
 =?utf-8?B?VkNGYXNTTTFNYU5FSnBBWUxYZGJUUXZ1VStiYXFxckJZZk0xZm9OeDEvMWU3?=
 =?utf-8?B?YnRoTzBrUUtRTzBDRy9mQy8rQVRCWURnR0VDeGowZXJtU0lVd2ZaMUNSZ0R1?=
 =?utf-8?B?TytLRXhOcDllS0lUNUpBa0RMcWZ5OUxsOWJmaDkvY3ZGZm0rSGg4QlF2bEdo?=
 =?utf-8?B?TVF2Mk1Sd2laMHFJOFg4THhiUWtrdjRQNlhtQjgxV01lNmpQWkVMWURiTndD?=
 =?utf-8?B?NHBtMHk2ci9IV1lQdS9kY1pESDdQR21SQVFmampxcG42NW5yVFMyZ3JYM1ph?=
 =?utf-8?B?cDZLcWJVcytTZW9SdW1QNUJuTk1md00rUVpYWVhQb0pXRUgwNW03R2dGcGpT?=
 =?utf-8?B?SzA2T2FPWUNVUEFvVzJGYmh0c3VtaEwyVWgvS24zMExvaHd6MXJrRStTUCtr?=
 =?utf-8?B?NnU5TUE5b2FHcVk5bG5YM1pwcDRndHo1SWoxM0FNc2lMWWJpY2xyNzg5T3Qw?=
 =?utf-8?B?biszMW9CRGFtdlJ1dnNGYTRmZU85UEh6bDZmY3ZzdzBKNlQwTE10QnBnS1I2?=
 =?utf-8?B?bHdMNURrUU9SUWsvbFJXUmpjMjk2di9Sc3VBbEYyNVpiOVhDZFJYS3YyZmMv?=
 =?utf-8?B?N3JncjRJSnN1YzVMRXdGRjFKVFB6eEtBMjhBWUowV1R0K2cxY3A0RWFJUzh4?=
 =?utf-8?B?dnVFbG1vZTEySlFOQ2c1SDV2dVo2Uyt5ZWd5Y21Yb1pGQUdKbXhiNmdsQ2FJ?=
 =?utf-8?B?eEo5bTlYVWl3NFJKQ2hsUmU0dTUvNCtRM3hFcWg0T2dneTZjTndHUVp5ZWpS?=
 =?utf-8?B?T0FtVVlHT1Rwc2VJZHYyTmZYRkcwdk1JWnhZc0RYenlaSjRPS0ZKU2d6WWkv?=
 =?utf-8?B?ejI4Z280OGNxWTZIdkJJT2FDVzY0SVFjQUhMR053blc1T1d6Qy9NUjh4UHFZ?=
 =?utf-8?B?Wjh0eUo1eDNvdUorMWtHOGVZWW5Nanp5NzNzY0tJamtndmVIcW5raHdHYlkr?=
 =?utf-8?B?ckEzenBaemVmMXpxajQvTitnczRYUUZTNHpYOG9PL04wMGhKcnE1TVgwdmV5?=
 =?utf-8?Q?UPWI=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR12MB2802.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b4e3074-7ea6-4e6e-8fd7-08dbf810021e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2023 17:06:24.1561
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yb0UVu5Wzw7GsFHO0S3GcT7vTiASRp0hJbS1jU6vbe6HjUu6KJdGQrJ0CHAT0MXN3Mc+6K1sOoSeGB80K+USBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8557
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_090633_241140_98473E8D 
X-CRM114-Status: GOOD (  32.98  )
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
> Sent: Wednesday, December 6, 2023 8:14 PM
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
> On 12/6/23 14:30, Tudor Ambarus wrote:
> > Hi, Amit,
> >
> > On 11/25/23 09:21, Amit Kumar Mahapatra wrote:
> >> Each flash that is connected in stacked mode should have a separate
> >> parameter structure. So, the flash parameter member(*params) of the
> >> spi_nor structure is changed to an array (*params[2]). The array is
> >> used to store the parameters of each flash connected in stacked
> configuration.
> >>
> >> The current implementation assumes that a maximum of two flashes are
> >> connected in stacked mode and both the flashes are of same make but
> >> can differ in sizes. So, except the sizes all other flash parameters
> >> of both the flashes are identical.
> >
> > Do you plan to add support for different flashes in stacked mode? If
> > not, wouldn't it be simpler to have just an array of flash sizes
> > instead of duplicating the entire params struct?
> >
> >>
> >> SPI-NOR is not aware of the chip_select values, for any incoming
> >> request SPI-NOR will decide the flash index with the help of
> >> individual flash size and the configuration type (single/stacked).
> >> SPI-NOR will pass on the flash index information to the SPI core &
> >> SPI driver by setting the appropriate bit in
> >> nor->spimem->spi->cs_index_mask. For example, if nth bit of
> >> nor->spimem->spi->cs_index_mask is set then the driver would
> >> assert/de-assert spi->chip_slect[n].
> >>
> >> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-
> mahapatra@amd.com>
> >> ---
> >>  drivers/mtd/spi-nor/core.c  | 272 +++++++++++++++++++++++++++++-------
> >>  drivers/mtd/spi-nor/core.h  |   4 +
> >>  include/linux/mtd/spi-nor.h |  15 +-
> >>  3 files changed, 240 insertions(+), 51 deletions(-)
> >>
> >> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> >> index 93ae69b7ff83..e990be7c7eb6 100644
> >> --- a/drivers/mtd/spi-nor/core.c
> >> +++ b/drivers/mtd/spi-nor/core.c
> >
> > cut
> >
> >> @@ -2905,7 +3007,10 @@ static void spi_nor_init_fixup_flags(struct
> >> spi_nor *nor)  static int spi_nor_late_init_params(struct spi_nor
> >> *nor)  {
> >>  	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor,
> 0);
> >> -	int ret;
> >> +	struct device_node *np = spi_nor_get_flash_node(nor);
> >> +	u64 flash_size[SNOR_FLASH_CNT_MAX];
> >> +	u32 idx = 0;
> >> +	int rc, ret;
> >>
> >>  	if (nor->manufacturer && nor->manufacturer->fixups &&
> >>  	    nor->manufacturer->fixups->late_init) { @@ -2937,6 +3042,44 @@
> >> static int spi_nor_late_init_params(struct spi_nor *nor)
> >>  	if (params->n_banks > 1)
> >>  		params->bank_size = div64_u64(params->size, params-
> >n_banks);
> >>
> >> +	nor->num_flash = 0;
> >> +
> >> +	/*
> >> +	 * The flashes that are connected in stacked mode should be of same
> make.
> >> +	 * Except the flash size all other properties are identical for all the
> >> +	 * flashes connected in stacked mode.
> >> +	 * The flashes that are connected in parallel mode should be identical.
> >> +	 */
> >> +	while (idx < SNOR_FLASH_CNT_MAX) {
> >> +		rc = of_property_read_u64_index(np, "stacked-memories",
> idx,
> >> +&flash_size[idx]);
> 
> also, it's not clear to me why you read this property multiple times.
> Have you sent a device tree patch somewhere? It will help me understand
> what you're trying to achieve.

Miquel submitted the device tree patch; here is the series.
https://lore.kernel.org/all/20220126112608.955728-1-miquel.raynal@bootlin.com/

Regards,
Amit
> 
> >
> > This is a little late in my opinion, as we don't have any sanity check
> > on the flashes that are stacked on top of the first. We shall at least
> > read and compare the ID for all.
> >
> > Cheers,
> > ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
