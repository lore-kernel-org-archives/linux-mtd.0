Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52913C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jan 2022 05:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B0naUvA5GZlcXx7+30NE7CptYcKs2O5k1wFLIzNsvZ0=; b=nbSPpnHnkKtqnB
	2NhOIbbptMPSaCNXEjJXlwh/V5s+NDCEm4wemE70dnOgHkmU6zQ9taGC32XdzZzQe6prvqWMKj1Aw
	FQMOpY+vDvT7RIx57I+gAwyqJoEtBuz1RLJiy9lDuQn33J14eycbymtd9lXjRIoCLURDPCjFNdMGY
	pR46CRiunqWADQn6BAT2R2HJ7OyvVP7ToWjKEdl8RwgEiY1uR4w0nfyy8EaZeLIipE8J4tVHeb1mI
	BRUT99XYjxX1vsVNavPfELX7Sl8PiWPW5yMloKDE15s7djqOkxNEYKSpXCND0e7ASG86MQsxQLN9o
	GjCn2i7dW1apNN9n28fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA3bo-003rSx-UZ; Wed, 19 Jan 2022 05:34:13 +0000
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA3bl-003rSB-Vf
 for linux-mtd@lists.infradead.org; Wed, 19 Jan 2022 05:34:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qti.qualcomm.com; i=@qti.qualcomm.com; q=dns/txt;
 s=qccesdkim1; t=1642570449; x=1643175249;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=F8b59EQmHBwDdrj/NRqTFVXK6Q6A0e1XsODWReyKDwo=;
 b=dZiVdQ8pVReNWSVSCx9KZ0IIkTIbaeUorWeLcRJUUd9a+YrzXct6mwGn
 aa9H0gmfDO7Dlyvnb3+roV4fQJB6qRfAuNR1FqigX91H21g9PYo03XSwt
 IXq6rTDNy6kexc9e+MALoyIpYaRz4pGY2gRcRayMx0mwFl2GD+vJuxguT E=;
Received: from mail-co1nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.171])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 05:34:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F3qzRlFkBrIK9oOi4kDxb0DCEC6kn1x2yXtPbkJXtIJzz81L04Dx8r/x0/CO3HiY7ImwyGpJPtoXLk4bJ3JyrGgVofllemA8LDiz2dXN6QSAGVQqXr/pxSnl33A5UFeOwbyy2SV6qKm/tDaEDlpfncpyF8SNHfISQ6SxEJyQND6BcD4rGqEocEXejxdsAiXF91J0ipwbqTxZ5PuhUQhMYeDGeYV9PKinDxDUT2v0Jk86L/AigDG68HDLwNGYJcuI6Wdlp8wXZWk0UPxmYsXGSq0oha8svwcRfE4jVBCjqrnmbW4VXYo8QCUyM1WUOTX3ru6l2AdBESHpyoOk5h/Umw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F8b59EQmHBwDdrj/NRqTFVXK6Q6A0e1XsODWReyKDwo=;
 b=mlQMf3TJErs8s5U+a1xarUSmnZcD+mXJ81Yj+4RL5Gv/0qQLcUw4OHNUQmI7HHbz6YftSGnGGWYJkRkrHdA6T+wIFu5Cmdx1rLROqrkB8mEMyRQielGlnehaDJpgCntYBvghy3/V69xHxBmwPvicadl2mP1ES6UmdwwdZyyZ2Z3okm9bwiObAXaXhlqrMejricKeW3BOp/l994kD/fUceh/Q3Zrnq+hHOzpXNt5n821j9zBv7sGn1/y4n5Zp3V0LJ+L/wsIx8x+Omx/E7Ai5YVwhGiYEeRTyccgvDZGMC3JHNhcgSTcp20pwMZKoJPrHOWsZ8LaCIfgRVouR6G6NBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from PH0PR02MB8455.namprd02.prod.outlook.com (2603:10b6:510:df::9)
 by SN6PR02MB4368.namprd02.prod.outlook.com (2603:10b6:805:b3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Wed, 19 Jan
 2022 05:34:04 +0000
Received: from PH0PR02MB8455.namprd02.prod.outlook.com
 ([fe80::8564:d7d6:85e7:5934]) by PH0PR02MB8455.namprd02.prod.outlook.com
 ([fe80::8564:d7d6:85e7:5934%4]) with mapi id 15.20.4909.007; Wed, 19 Jan 2022
 05:34:04 +0000
From: "Sajida Bhanu (Temp)" <c_sbhanu@qti.qualcomm.com>
To: "Tudor.Ambarus@microchip.com" <Tudor.Ambarus@microchip.com>, "Sajida Bhanu
 (Temp) (QUIC)" <quic_c_sbhanu@quicinc.com>, "dianders@chromium.org"
 <dianders@chromium.org>, "michael@walle.cc" <michael@walle.cc>,
 "p.yadav@ti.com" <p.yadav@ti.com>, "miquel.raynal@bootlin.com"
 <miquel.raynal@bootlin.com>, "richard@nod.at" <richard@nod.at>,
 "vigneshr@ti.com" <vigneshr@ti.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
CC: "stummala@codeaurora.org" <stummala@codeaurora.org>,
 "vbadigan@codeaurora.org" <vbadigan@codeaurora.org>, "Ram Prakash Gupta
 (QUIC)" <quic_rampraka@quicinc.com>, "Pradeep Pragallapati (QUIC)"
 <quic_pragalla@quicinc.com>, "sartgarg@codeaurora.org"
 <sartgarg@codeaurora.org>
Subject: RE: [PATCH V3] mtd: spi-nor: winbond: Add support for winbond chip
Thread-Topic: [PATCH V3] mtd: spi-nor: winbond: Add support for winbond chip
Thread-Index: AQHX8NO+WlpZqE5WH0ySDSUiuNAdtawx1mGAgDgzhrA=
Date: Wed, 19 Jan 2022 05:34:04 +0000
Message-ID: <PH0PR02MB84557EA76BD8DDD35A99B915CD599@PH0PR02MB8455.namprd02.prod.outlook.com>
References: <1639476991-25676-1-git-send-email-quic_c_sbhanu@quicinc.com>
 <488aafc3-2fa9-198b-c448-d1ca7ef52f35@microchip.com>
In-Reply-To: <488aafc3-2fa9-198b-c448-d1ca7ef52f35@microchip.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=qti.qualcomm.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bb3605af-e9e7-4809-50af-08d9db0d4e45
x-ms-traffictypediagnostic: SN6PR02MB4368:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <SN6PR02MB43687BBB0128F4648DD3B849CD599@SN6PR02MB4368.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BLadWOEZlikJws4UBEOyfD5VMewf5w1rX50h9OpgRmTaWHaotdKuPO9762JqN1S8L4g46Ur7Qe8v2SueTgkHTYKzFUHBBXnLoo3GR9wxO1VF8cU4USvj+V7krvVCX0mKyqt3+BlwVgjluxgfpWeq92RqpsauHungIcAypqPRVXI2JhbsUOJLD2hsG4F56LuY0gM48G8duJDBB4tLCPv2m5VnEQ3EzrZ1O+K1TyFYVlAtA5L3vqf4WYln2a+1jp9fwPQE9/SzFqBk4pbyvOrx2p9XcKcSwlqw9CDIi/VqyYHdzPbEtc0Rqt8Elju/e8pKEHnQBJrdH32/y9JUq9OVyDwgncZyh5HCMvU3yyW+8qAbMCeHZHVtiXo89K8Cr/FDI4AgrGAWArdtL+iQy/4mb4I5o3/DLbwSu79xpBU96u+JyeN6hYm5Pv3pKSroGFBqTHjYqdzblNigAHE9bBDQGaNF7xyXDiOk+dv54htlNOC1icBDmKzhQQYVSf/+q5Qqfr+ZW/1w99sVgFbgPPblRzh0FO88/pYrm8rL9klaU8kvwKqYQ3YxWJuleoT2OHELQt843BBm9/aig5PxYz1lYh9tfA3FXc5Ct7uYC9rdQuD63n/hlULKHp9Ynbg8wQAXN7Uqpd0K8MzLb/de4jXXAaQ5FGut82aXJySw6udwbvjgJMbQIyNYyAwPSAdNshirDIAsYPFzDE2y9//O8vqEKKOA32T2wjcAKqU6TM7LqJY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB8455.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(7416002)(83380400001)(54906003)(8676002)(122000001)(110136005)(66446008)(921005)(66476007)(8936002)(55016003)(38070700005)(71200400001)(508600001)(5660300002)(6506007)(7696005)(38100700002)(33656002)(66946007)(66556008)(52536014)(2906002)(76116006)(64756008)(4326008)(53546011)(9686003)(86362001)(186003)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aEZSRnUzZGQ1ZGN4aHJjUXZsMUV6ZnZZak5iQTZkalpXNEEreitib29MMDBG?=
 =?utf-8?B?STlPYmVnR2wzWWEwdnJydWpWdjhtdVpIYU5hcTFxMGo5Qk1zTFg1MTBaQStz?=
 =?utf-8?B?WXpVT05aSzduVytFSkRkWHBBSnpGc3JOYUd4RmhLV3RETHBGMGI5aXoyT2Ri?=
 =?utf-8?B?TzJ4UG9ISjREUlI5Ly8yU1NRb3ZneXpPMWlFNjBFZVl0N1pMbm8vdFZGRzFR?=
 =?utf-8?B?ZWtCMjVvL3BVeE5wNmlVSHh2ckZ1RitsMTRVUEFtQzY5WEQwZnRteVhiaHBL?=
 =?utf-8?B?aVk3UEVHait5SG5iZ250MFlRcjBlS2hqSXlkWU5UbFMxSUIwazArSzJNZExI?=
 =?utf-8?B?WkE2bE05VERzN0xjcUhTM1RhUnZjZVR2bTBKQzFKaUdWcllNOFFCNFZLVmtv?=
 =?utf-8?B?N1Z5TDVKeFgvNUFtZTczdU52cHdDSWdoVlBLNFhabUp0b2FyNmoydXlITGxu?=
 =?utf-8?B?b2xId2UxS3R2dE5pZFhIODcrU2FCVy9hWEhyS0VlRnZFT0V5MC9SYStKNUVy?=
 =?utf-8?B?c3hYeGtKK2k1MCtVZ3VlanJKMDdjZm9RbUFpejdnVHF4d1pBV09pZWtGQW5I?=
 =?utf-8?B?RjFPY1ZDeG9oQzhYY1V3MUZBODFoaExPby85N1BtN2JoeEVZWHNaVVkxU1dN?=
 =?utf-8?B?VWNqeGh4RXVYbk1CK0JaS1Q5d3hlbjlOSGIyb0hFV1l6UjhwVDVRalprRFJH?=
 =?utf-8?B?OXB6akdVNE9za3VKWURRdUtKVUpyMFdmRzZ5ZWRRUHVmM0svUEplZHVJK09n?=
 =?utf-8?B?SXVZS01ZTWpEN01WNVVHd0FhS0ZTTm84ZU9Fck1jVkF5eW1oL2JpK2IyR2pH?=
 =?utf-8?B?KzF6UVQ3aitDQngrbG50M0txbHN6VjBWaWc5MzdzQ1RCUC9wWUd4SEQxWmpl?=
 =?utf-8?B?UHdLWFNpWEQrNy95L3JncUNjMzBQTlRLNFNVNFllUUdXWWw3d1F2Y1YrY21h?=
 =?utf-8?B?V0tpWVltMDl5bVNHclRhakJ6a2psNThEQjlEbHhKYlBWenljSDV2eGE2R1Nx?=
 =?utf-8?B?MjR0OThCQTdRWTNYZXZSaU5YNlZPcnJiYW16WERYdW5wMW9QTUtXL2plRVlJ?=
 =?utf-8?B?bGlWU0xPaStJdnlUcjc3Q21SbGNXVU13bGtzYWVqVGhrY3VvMnk0SUJOcjRZ?=
 =?utf-8?B?Z1AyVzZiRzFrc1M1NEU2U3NQNXdQU2RQYlRNbG5Jb1NtNi8wVnJTbDVPUjhv?=
 =?utf-8?B?WFhaS1dNTG85bnlQQkFJWFVBbStLS2U1d2Y1d3NKU1VPeTB2VUFsQVQ0WjND?=
 =?utf-8?B?ZHJxbXUxT1gzcGdkdDFqTkRzYzFaek5KYS84RHVySkJPakxBVytlN3g2WWFP?=
 =?utf-8?B?bk9NY2lGVDdXajBTc1NSbCtyN1d2VS9VbDdSTW1pbjdndmJuam9jSjE0VU1v?=
 =?utf-8?B?ZDZibG41Z1dwNDdkeVRoa2RQRVp2MDM1c0xUYWdlR2JoalRpY3FXNThlSE5k?=
 =?utf-8?B?YkNBdjZYWTJGY2hWbjI3bkdBb2ordE5wQUFkZy8xcW12M0ZMeVZMTW5tekVH?=
 =?utf-8?B?dHc4SUJMc1BRUTArL0FSbWtEMGVhU20ydEtBU28wK3pHMGZzTnppT0hjVHl0?=
 =?utf-8?B?bXE3bW9Ra04yRXBaSllQZm1Nd0pIMHJCUXVYSnI5OEpVd1dHQUFnZmp2MlFI?=
 =?utf-8?B?ekd2SWhUb252OHJwcjNnQ3VNRVBQZG83U2paYlI4QXBsSnpCY3ovaXNVSkNv?=
 =?utf-8?B?YVZxZ1R5aFBoUTR5R0RPUHU3V0JrZGxyRUk1bERYQWdQS0hsWVczTUFNcXVH?=
 =?utf-8?B?MW9FQ2U5cTUwZ211S2oreXprOHdLUE1yQzlVRGFJN3BFaUpZNHIxdStrK0wy?=
 =?utf-8?B?VUtmb21EbThxblVGMVphK0U3c0srdnlRUkg5WEZ2QzVzOGw5YU9TS0FWb2Rz?=
 =?utf-8?B?YU81SGpQUk9RV2lPaHFUZFgrZzBkTTd5cGxCQllMNi9pRVpLaG1BeGZ3UHph?=
 =?utf-8?B?bFNyVmtMZGNPMm1HcGVjODc0YzFVWEl0QWhMV0VHMDlGT3lmSnR6Y3JUYitO?=
 =?utf-8?B?bXJFVGZCYTBNdXhxUm5xZE1Ka1FRQlk2Qmw1aXJScU9GYXFpdnZRSFRyQnJK?=
 =?utf-8?B?NnlLdVFTUG96NmZrcUgrVmxXZWpHZUk1ZTRtTEZ5VkpwYTVURmNuLzBNRHUv?=
 =?utf-8?B?UHlNM1czWnZqdjNaT1MvallYZVBqekczVU54c1ZzRnN5Nks1c3A3Tjh6VGx6?=
 =?utf-8?B?dW8xZnV6ODdZL1ZNTzNSRlFjYVJqd2VYdVZHSTd0QmRITFNRRzQ4WjhlVXc2?=
 =?utf-8?B?a3l2WUNPVXRaenRvamd2aWVFcThBPT0=?=
MIME-Version: 1.0
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB8455.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb3605af-e9e7-4809-50af-08d9db0d4e45
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2022 05:34:04.2608 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D1rMqus4iE2DDfJoTlR5/Oj0lN89apzX8yvc9xbwJBZuw01rKGP7IHD8LnoTyLFrYJtGKnsSGkgdCI0p8LVfS6yh3SaWW9NMEaOPqe0Ko9I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4368
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220118_213410_061891_A9E4914D 
X-CRM114-Status: GOOD (  20.19  )
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

Hi,

Gentle Reminder.

Thanks,
Sajida
-----Original Message-----
From: Tudor.Ambarus@microchip.com <Tudor.Ambarus@microchip.com> 
Sent: Tuesday, December 14, 2021 4:46 PM
To: Sajida Bhanu (Temp) (QUIC) <quic_c_sbhanu@quicinc.com>; dianders@chromium.org; michael@walle.cc; p.yadav@ti.com; miquel.raynal@bootlin.com; richard@nod.at; vigneshr@ti.com; linux-mtd@lists.infradead.org; linux-kernel@vger.kernel.org
Cc: stummala@codeaurora.org; vbadigan@codeaurora.org; Ram Prakash Gupta (QUIC) <quic_rampraka@quicinc.com>; Pradeep Pragallapati (QUIC) <quic_pragalla@quicinc.com>; sartgarg@codeaurora.org
Subject: Re: [PATCH V3] mtd: spi-nor: winbond: Add support for winbond chip

WARNING: This email originated from outside of Qualcomm. Please be wary of any links or attachments, and do not enable macros.

On 12/14/21 12:16 PM, Shaik Sajida Bhanu wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know 
> the content is safe
>
> Add support for winbond W25Q512NW-IM chip.
>
> Signed-off-by: Shaik Sajida Bhanu <quic_c_sbhanu@quicinc.com>
> Reviewed-by: Doug Anderson <dianders@chromium.org>
> ---
> Changes since V1:
>         Added space before name of the flash part as suggested by Doug.
>
> Changes since V2:
>         Updated chip name as w25q512nwm as suggested by Doug.
> ---
>  drivers/mtd/spi-nor/winbond.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/winbond.c 
> b/drivers/mtd/spi-nor/winbond.c index 96573f6..42d5800 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -100,6 +100,9 @@ static const struct flash_info winbond_parts[] = {
>                              SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>         { "w25m512jv", INFO(0xef7119, 0, 64 * 1024, 1024,
>                             SECT_4K | SPI_NOR_QUAD_READ | 
> SPI_NOR_DUAL_READ) },

This does not apply on current spi-nor/next. We've changed how the flash_info flags are handled. We also require to dump the SPI NOR sysfs entries under the comment section ---. I'll update the documentation to add some guidelines on how new flash additions or flash updates should be proposed. Sometime this week, or maybe next.

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
