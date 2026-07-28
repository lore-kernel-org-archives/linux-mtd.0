Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A8AC53219
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jul 2026 07:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=udBoFeMqcThE79K9EdWckPOM6ZtSDnUVo6zJWwmJtMM=; b=yP7r5ikr2kzpv7
	JdVo/rppxmrrxiThKineu06mbsGpqs3hJOxX7+5iRYUHaOY8S70JfW6I3xWSbOIKZjpFpLtKxUALO
	HNP5qECCMkW8YbytGy8MDG8jTJH32g/eSRoaD/PDzBkI/0vdnu0QO45+wSSehdmWAc5Q5DvRsBbPe
	YN9ofkaiv18QWUBsMThMaXQaofgnpX0hBCzFaA5LUItnEt6Dx7CKNyxDF4aPiKa2xJfv0RuI1lps5
	mj35nmHyy46/bsJJgGcQUSLoE8GAj6YDAo71moVBZCpaB+dJdw69gxrDMsKcYea2Z9OOkC0VBK6vS
	j7SprnKIysIUDGKA39KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wocdU-00000004fMg-3Qpr;
	Tue, 28 Jul 2026 07:54:00 +0000
Received: from mail-westeuropeazon11010048.outbound.protection.outlook.com ([52.101.69.48] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wocdS-00000004fLM-0MJ3
	for linux-mtd@lists.infradead.org;
	Tue, 28 Jul 2026 07:53:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yLr9pm8KQDMcXvYteu5UOmQic8OCn24TgTIKuCWbIVeLJMtT2rdzTFwCSWs/L7Ko1SvPZq1bH5v3p7cI3vdEowGZhq7QqJuyRhYdfwbwIKJGXqP/WzoU723WUfg9LmLZef5tVJ4eSpj3zTwj2tknjq8FSLgdpcKBe7G5Ix2Julff3FDyT4XghrVnnUzjZuZU2V7TT4T38cH+j9fuPjBkZDXN2Y8XlhnmQqOqdvNB0S33jJlk3NoD7+zGkFu9YBJ/b6Ufw+lbE/LboBiDYpn+3Newfy0k9+2e7BAdx1N41R9BPOvf9afO7l1SkhUr9cFsIf0SzJqhu1Yx/0VrjT95sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4wC4U0XFwib0hxDb8JngBQWFayQIuxmp1qVIXegWSB8=;
 b=k3l1h5W6f+VdoG27JI3BlrtAtSgu9GEe1m7rZW6D2HrVj6D7Ngc5CO74zxDx7aJ2doeXUzzVmT7jRpbyqOX/rozIwRwNuRd9eHfj7BFahB80lLR8YuSzqE0eGKoRiZckfoXiVQWAJkwSjNC9WgfAQ2JcrqY3ds50F4rJuUR2UpnOTd1BEi75T2FX8vyfvyZPdDAJ2kRSk9yzShLoRLrNJdeKuPcxWp0eweViDjAJoAmnAnmz6GLcAG3iNhkrZvJTYiJsTClHjIlWiTAY6uUSPM7zlFYdYs+DyEXo55MLZMyzpDRrAV5w/rTTG/tHKDQYoX9M9SDTnZ3VHA/cfaAEgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4wC4U0XFwib0hxDb8JngBQWFayQIuxmp1qVIXegWSB8=;
 b=VKl/2y8gBJ3NFH08Z1670bSdT9DC5wnnxAPqkC6AiKevkbIlaN5TuX4idwnZi26fgsixodFJ5T3tjs3+DwcONbonROgkjYwohwtO7RDDeORvyCKMtCA/5szZoAgNyKWCMglLKiNJ0JLDq5RTvWA1yBlQ2YqRUNhbz7BD2YzYkL58e0YkB7Hs9939KJZULLvwvELKgCZ1Jeb4h7CNlLSqLMie5yiI+Fn86HNEDxBGmnDn5FcS9Ygp2Hidt+tpnjYvdyFpRFK6dNHmRm/wUBGGKu44DzICPG4pTw1SOkvUNv3gE+lNKeO+vShm36kNt3oHmm4+dA5Fxek8wQ0XzKp1fw==
Received: from VI0PR07MB12386.eurprd07.prod.outlook.com
 (2603:10a6:800:323::17) by AS8PR07MB7669.eurprd07.prod.outlook.com
 (2603:10a6:20b:2a9::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 07:53:51 +0000
Received: from VI0PR07MB12386.eurprd07.prod.outlook.com
 ([fe80::5fd1:4066:ffee:b473]) by VI0PR07MB12386.eurprd07.prod.outlook.com
 ([fe80::5fd1:4066:ffee:b473%5]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 07:53:51 +0000
From: "Mateusz Litwin (Nokia)" <mateusz.litwin@nokia.com>
To: Michael Walle <mwalle@kernel.org>
CC: "Mateusz Litwin (Nokia)" <mateusz.litwin@nokia.com>, Pratyush Yadav
	<pratyush@kernel.org>, Takahiro Kuwano <takahiro.kuwano@infineon.com>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RFC 0/3] mtd: spi-nor: allow multiple erase sizes on
 uniform flashes
Thread-Topic: [PATCH RFC 0/3] mtd: spi-nor: allow multiple erase sizes on
 uniform flashes
Thread-Index: AQHdHmX4gphfLmnyoUCLvD92K15WBQ==
Date: Tue, 28 Jul 2026 07:53:51 +0000
Message-ID: <20260728075320.66745-1-mateusz.litwin@nokia.com>
References: <DK4XCMC44A8N.2K7FFXXSXO3I2@kernel.org>
In-Reply-To: <DK4XCMC44A8N.2K7FFXXSXO3I2@kernel.org>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0PR07MB12386:EE_|AS8PR07MB7669:EE_
x-ms-office365-filtering-correlation-id: b2b536da-5553-4c8e-3300-08deec7d5d52
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|11063799006|56012099006|10067099003|6133799003|3023799007|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: Xk2O1Yy8VZ/aCtX2wjUM2Q4E8g3uO5mdz2/u0z5/9s6G1CNYZ9tOP0s9x4crQtxI25MW/ATXMzGvtZq6TzDFswZkIfJMfficSwFfzy/nMSqqH2BmLvop8U2c3ta4ccvP1MCMnxqZ9bidy8dbbMzSxMew2+6N1fzKiPpxIfJ1pYbkKjV1eg1L4LbDYB3B43LUSnx+0gWWAG/1e0jO2Rt719Yl/9uvDOb0Szm+o0X+lMx920tE93w36y3wTlPmC9gOb1rOou8QyA/5lSHfOotULXwEV9gWZGZeygw+rU+oLsuZP+iERtM3nLxw4x7zBkX/mhAoxPTFH6QJNTtK8GvYEHmPpX53cuXhpX9ltp67dqzl1DKvvHiKwYPNHzFQwcyEv78DeQM+CybppxfHh5xXKAxpRG1QCamUh6fFzfym2GdbPUkac1WyWUNjEFSVjuahGKQXvfwkRkFoubg1+OhhVmO5nOPuMuGGkvWKXV1oKfaD51xLItNUEldp9QDvCDxmp/SWsUcbYRobl3BfHv0vWiY6nQZnYub7IM0k7IO1KGzc9U7SetShkV/xyNPNds0N1MDHxrR5xkVU/p5X6jUOD+prwWS8fiAYYfHNuU/4qlswtyQqf5gPImj9Ahx2iGNGWWmjiV4hGDyo3bT57e4ulzVBZxZMdjpwImhV0Hcxl6wUWlw0P70Qnh9aJ7JPWg5wEQVWbCVIKhpSO9EVwKQ2mw7s6Lf6+Wiz76RY6J2EBEg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR07MB12386.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(11063799006)(56012099006)(10067099003)(6133799003)(3023799007)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Qk1hVlI4UnoyNEVvSytIaHhLSlNmV000Uk1WZFRjQWRwKzIrSjJiRkVTdjZL?=
 =?utf-8?B?R2pVaVAxUW9icnNFTllyazZsRStCcEhOSVJ5bU5UM3BxTkhJQ290eGZ1Q3BV?=
 =?utf-8?B?U0dhQUxURGpTWE14aEpGVDlmR3lxMEI0NXZWbmk3bU56WHV5TnQ0emJYdHZa?=
 =?utf-8?B?OUs0Z1lhdXJiRndGdnRhSmwzb0g0NmcwQU9RRVlCd1NEMCtOdk1oakMvV1BC?=
 =?utf-8?B?YjhPNEdtZkpEV1pXQnZPT1pTUXJ2V1YzNitYd0JZVk93UXdVZ1Q0SFE2TEFJ?=
 =?utf-8?B?S0wxWjhzcCtTa01KSDZnblNuZ2JydXVCUVlJL0NLVE5oNUR2L00xQ0tNcFlE?=
 =?utf-8?B?ZGRZVjEyd0xWUkZxU3JxUFNmenhFT3dCTUhFVkhWejJycDdsQ2QvRkdqWXRN?=
 =?utf-8?B?MTBBV0VhcHplRDlFR0IveGRHWE9oYWVFNjVoK0VkaTdUS2V5UTJoYW9aZlMz?=
 =?utf-8?B?aDdRUnNMTytQL1U4RTEvSVhoZ2hXSHhJUCtNR3VPbGZ2blJrQ01rSmhaRm1n?=
 =?utf-8?B?Ly8wam1tNEcrU0R0dHRqNnBLaWtybkw5RXlCLzFkb2UvbXJDZlNhOTJ0TkhE?=
 =?utf-8?B?bC9UOE9DaXFSaUFZMXpFOHZ6ellCVG1scmhEYUJ3Q0ZyL0VYa01kbTluRXpu?=
 =?utf-8?B?RlN0K2ZNcWEzRjhTNFVKdDlMcUNjOUFmeUJIY08xcHZlOUd5VTFGc0h2cXJC?=
 =?utf-8?B?WDI5NjJ3eVVHdHdzVmFBQmlpWjBOU21pV2dKYWlQbGJkYWtSVndSVVNra1M3?=
 =?utf-8?B?RklQbWltVDk3eGhwY0RKOFFsVS9RL3lkbGZkdnRRM2tucHQwZXNnWWpVTVJX?=
 =?utf-8?B?TjRieVZ3Sm9oNzZsUUNUZTRkRzZaWGd5S21lVlQrdHc4WTV3SW8rbjZTVFRL?=
 =?utf-8?B?OXVGL2tZK0tGM0dtaEpGS0hpN1ljdWFZclE2LzBJS2pQUG51YlJrUklWaWps?=
 =?utf-8?B?Vjc3bmtEQWdueDkzMDNQa0xlVkJEL3dkUkt4VktMNkZWcENkK0JYZk1peDFt?=
 =?utf-8?B?VUJsVkxvM1ExYm1yMUV2cWovU2NSSmxLbmxOUHlobTM1UUVLcEdNZ3RLUTVL?=
 =?utf-8?B?a0pFRm9UMVZnV1lWM0p3REI4WHBtaDlDMi9CSmxNMjJYK25LalhnS0RMSzRa?=
 =?utf-8?B?UVVLR2E4eHlVSitCNmdBejVhemxmM2NTemdjSE5IMFU1WVdlN3Q0Q0hlc3RK?=
 =?utf-8?B?WGJ6dFBrd25sVUZ3YU1XVWVXTHNubUdvUXdSLzBwOENkNDZmWTE4VGthcGFp?=
 =?utf-8?B?bTRoRGdENFFML2JjTW15SUNwb25sNUpPdEVkN082d1JCWXhDU3ZGUTZDS0xY?=
 =?utf-8?B?a1YydEdRbmttdnU4WEVXcEIrdDlFMStwcFR0aTRVM3N4L2lmM1NzclBQeG1P?=
 =?utf-8?B?VVdXc3pEcEJNeTAvL2U4aU83V0lmNWgrRS9QRExMZ013N2tYTUpZVjRJRTQr?=
 =?utf-8?B?a0l0RllCU2I1Zm5Bb1gxMjRZUXkvNkJsUHlaM3VCUUg3MzA0WWROdysrSFgr?=
 =?utf-8?B?eXNTYko3STZVUGQwMmd5c1lzOU5SN29Ja29LcDZFV1B4V29ScmljM2hhNVNX?=
 =?utf-8?B?YUg5RS84cmo1MjY5c1hZMURzVTZjQ2Rvb0JVRnNiTzZ0Snk4a2hJODVINHdt?=
 =?utf-8?B?VU04NUl0eG45ejhBTWRrdWVmeTBSa0t0c204MmZ6OWV0TXA1R0k2MGxZcERP?=
 =?utf-8?B?M1BVVnFwb25FS1JmWC9UdUNwWUlSeDRRS1QzZlkza0ZPeDhvc2NYblFuWm1O?=
 =?utf-8?B?bVZqaGtQS21WbUQxVkUzc2kwTXJmSnNMN1BRazl5eTFwM3BEanl1Um81SlA0?=
 =?utf-8?B?aXp6Wk5WVU11Mk1wYUM0UXR0QWxJS1Z3cXNTOEhydEtxbHF3Z2FxRWZMUGxL?=
 =?utf-8?B?czRSWDBLTjkxYlgrMjRlT3R4V1k4U2NxYldRSlNmRlhydi9lMGlHdlFUZ3pl?=
 =?utf-8?B?a3lyREsxMGFxTmJzOWtJMnp5VFFVQ3djRWFMVGtFejFYNU1GQk83Z1E3M0FT?=
 =?utf-8?B?K3NoUzZsanJzM2phTE53Z0dibzM2azdYTzNJU0xpWHpGU0xFRnk4RUlCVlhL?=
 =?utf-8?B?S1VkNmJyTkNBanhOVXhDaHZhcXZMUnZDbDhmeXBOWlpCcDdEZUhGYWxGNHBo?=
 =?utf-8?B?enFQRUJDZGc3cnlFZkdNREV0K1J3ZVdVSUFZVzRweDhndUVWWGl5b1RsNHdn?=
 =?utf-8?B?VW5pazhpR0svN2JYeXlFRVpYaS9sSzJ0ajFtRFZiQ0ZzVUxqaXhPTDI2UDEw?=
 =?utf-8?B?aWl4eWJHbGM1YUkzdHFzRVJqRHV1Tm5ScWlvWU00bnlQVWNqMDBQTDF3ZFor?=
 =?utf-8?B?MklxcWlJWEtJMENBbzkxandaQzViK1gwU0VQQXdCWEZXdk55a0w1QT09?=
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: NIPQ3bLPxLvMqyKV4JydkOVZRkPjPq9JvwSC2d24SNxvJyXWmSBucMaVswrXoWcU/x9ZQs4CTvRwApK6RwrKegeU1Ta/8pNss26dwdAwDza+cAkAmGoypjOXn/v007HfRjjqHMhXdFjuKSYrBgffS1GKEK8oqDP7rA7OSI2hlgvY+tyGHWl73s691R4NxWU1wovX4T7vSCgi5bshRWtNcZ8i0/lQP+99qLd4e5FHYsKDLWX4A9ftFhHqAqUjrhE4lGd5gGcpiZpHM/SXuqieNKVFU5XPshggZehvF5k8+R7Q2CtZFm7iFCa+N5B+rMgh7RSbahnPXqUP7ykXMSFLHQ==
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI0PR07MB12386.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2b536da-5553-4c8e-3300-08deec7d5d52
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2026 07:53:51.3798
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5rEabyQjh2G7Iaa83xqESjW0fCYU5Cx8sUXkC/oOf7m/bV5PREiq9TThj0HtA1wnpse0vDEiRRDROlrAY17RL2xJQZhW8FVXHbUbT/3KodU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB7669
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_005358_317394_7AFE0F66 
X-CRM114-Status: GOOD (  30.60  )
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

On 2026-07-22 09:34 +0200, Michael Walle wrote:
> Hi,
>
> On Mon Jul 20, 2026 at 5:12 PM CEST, Mateusz Litwin via B4 Relay wrote:
> > Most SPI NOR flashes advertise several erase sizes (e.g. 4 KiB, 32 KiB and
> > 64 KiB) even when the erase map is uniform across the whole device.  The
> > spi-nor driver currently collapses such flashes to a single erase size and
> > uses only that size for every erase request.
> >
> > This is a problem on platforms that need a small exposed erasesize for
> > partition alignment (for example u-boot-env, RouterBoot soft_config, or
> > boot header partitions) while still wanting fast bulk erases.  Today the
> > usual workaround is to enable MTD_SPI_NOR_USE_4K_SECTORS, which forces 4 KiB
> > erases for the entire device and hurts erase performance on large regions.
> >
> > This series introduces MTD_SPI_NOR_MULTI_ERASE_SIZE.  When enabled, uniform
> > flashes keep multiple erase sizes in the driver erase map and pick the
> > largest suitable erase size for each step of an erase operation, similar to
> > what non-uniform flashes already do.  Userspace still sees a single
> > mtd->erasesize (4 KiB when MTD_SPI_NOR_USE_4K_SECTORS is also enabled), but
> > large aligned portions of an erase request can use 32 KiB or 64 KiB erase
> > commands internally.
> >
> > The series also converts all erase-type opcodes to their 4-byte-address
> > variants on uniform flashes, so multi-size erases work correctly on devices
> > larger than 16 MiB.
> >
> > This is an RFC series. Feedback is especially welcome on whether to merge
> > patch 1 alone, patches 1+2, or the full series including the patch 3 PoC.
> >
> > The series is stacked so maintainers can choose how much to take:
> >
> >   - Patch 1 adds the Kconfig option, keeps multiple erase types in the
> >     uniform region mask, and converts all erase-type opcodes for 4-byte
> >     addressing.  On its own it routes multi-size uniform erases through
> >     spi_nor_erase_multi_sectors().
> >   - Patch 2 replaces that routing with a dedicated uniform erase flow
> >     (spi_nor_erase_uniform()), reducing CPU and memory overhead.
> >   - Patch 3 is a proof-of-concept optimization on top of patch 2: it
> >     caches the largest uniform erase type per request to skip redundant
> >     spi_nor_find_best_erase_type() calls in bulk-aligned regions.
> >
> > Patch 1 follows an OpenWrt pending patch already used in production:
> >
> > https://github.com/openwrt/openwrt/blob/main/target/linux/generic/pending-6.12/402-mtd-spi-nor-write-support-for-minor-aligned-partitions.patch
> >
> > MTD_SPI_NOR_MULTI_ERASE_SIZE defaults to N, so existing configurations are
> > unaffected.
>
> No, not a new Kconfig option. Integrate it into the core, adapt the
> current erase handling.

OK. I'll rework the series to integrate multi-size uniform erases
into the core erase path rather than adding a new Kconfig option. These
patches were posted to discuss the approach.

>
> Also, was this assisted by AI tooling?

AI tooling (Cursor) was used only for documentation, grammar, and the
commit message. I forgot to note that in the cover letter; I'll add
attribution in the next revision.

>
> > Tested: backported to a 6.6-based tree on Micron MT25QU02G with
> > MTD_SPI_NOR_MULTI_ERASE_SIZE enabled and MTD_SPI_NOR_USE_4K_SECTORS
>
> Why didn't you test this on the latest kernel?

6.6 is the latest kernel we currently run on this hardware, and these
patches were posted for early feedback. I'll test the final version on the
latest upstream kernel before resubmitting.

>
> > disabled (mtd->erasesize reports 64 KiB).  librsu erases the flash with
>
> What is librsu?

A lightly modified Remote System Update (RSU) stack for Agilex:
https://github.com/altera-fpga/intel-rsu

>
> -michael

Sorry for the late reply - my corporate mailbox dropped the message, and
I only found the reply today on mailing list.

Thanks for the review.

Mateusz

>
> > the MEMERASE ioctl on the MTD character device, issuing erase requests
> > smaller than mtd->erasesize (e.g. a 32 KiB boot header region).
> > mtd_erase() does not enforce erasesize alignment, so these requests reach
> > the driver, where the previous uniform path rejected them; they now
> > succeed through spi_nor_is_uniform_erasable() and the multi-size erase
> > path.  Verified writes and erases on the 32 KiB region.
> >
> > A few implementation details are worth discussing:
> >
> > 1. The previous uniform erase path only required the length to be a
> >    multiple of mtd->erasesize.  With MTD_SPI_NOR_MULTI_ERASE_SIZE enabled,
> >    spi_nor_is_uniform_erasable() instead checks the address and length
> >    against the smallest supported uniform erase size.  Requests aligned to
> >    mtd->erasesize still pass (it is a multiple of that size), while
> >    callers may now issue erases smaller than mtd->erasesize, as the tested
> >    librsu path does.  Misaligned requests are rejected rather than
> >    relying on undefined behavior; please report any regressions.
> >
> > 2. Patch 3 addresses per-step spi_nor_find_best_erase_type() overhead.
> >    As a PoC it may be dropped, revised, or split out depending on
> >    maintainer feedback.
> >
> > 3. Patch 3 calculates the largest erase size on every request.  This could
> >    be done once at init.  The same applies to the smallest erase size used
> >    for request validation.  Where to store that data is open for
> >    discussion if such a change is needed.
> >
> > 4. spansion_nor_late_init() overrides nor->erase_opcode (and mtd->erasesize)
> >    for flashes larger than 16 MiB.  With MTD_SPI_NOR_MULTI_ERASE_SIZE enabled,
> >    spi_nor_erase_uniform() sets nor->erase_opcode before each erase, so the
> >    late_init value is not used on the erase path.  If the SFDP table masks
> >    unsupported erase types in 4-byte-address mode, this is not an issue;
> >    otherwise late_init() or erase-type masking may need changes for
> >    Cypress/Spansion parts.
> >
> > 5. Some flashes do not support every erase type with 4-byte-address opcodes.
> >    Unsupported types are masked by clearing erase_type[].size, but the
> >    corresponding erase_mask bit is not cleared.  Erases work correctly, but
> >    debugfs can show a set bit in the sector-map erase mask for a type that is
> >    not listed under "erase commands".  Fixing that is probably best done in
> >    a separate patch.
> >
> > Signed-off-by: Mateusz Litwin <mateusz.litwin@nokia.com>
> > ---
> > Mateusz Litwin (3):
> >       mtd: spi-nor: allow multiple erase sizes on uniform flash
> >       mtd: spi-nor: add dedicated multi-size uniform erase path
> >       mtd: spi-nor: skip erase type search in uniform bulk erase
> >
> >  drivers/mtd/spi-nor/Kconfig |  25 +++++
> >  drivers/mtd/spi-nor/core.c  | 247 +++++++++++++++++++++++++++++++++-----------
> >  2 files changed, 213 insertions(+), 59 deletions(-)
> > ---
> > base-commit: df415c5e1de0f1aeefacb4e6252ff98d38c04437
> > change-id: 20260720-spi_nor_multisize_erase-d644cfd4a5fb
> >
> > Best regards,
>
>
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
