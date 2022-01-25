Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA0CC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jan 2022 11:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w+aHqIIgcwBjUc8OWwp1lxZ59+QeyLjeSNc1n0UtZV8=; b=disnMRYYLFaGss
	mjMmucJtF2ND/+KdS0DEbmewzERtMZARzNDpOX0XX0L3PuzjmdlrOqtRjqQNrKCluKNVtAl7WOchR
	S0DhglgRpdWkO3UBqWdeElAhmEGvUcO6hBOxS8/FwcsIQjSGDuDLK0S91m8SGPMivva+mI68U9EId
	60gI6/kjb78CYyGE5ZabSa+4zpG7td6ql9b6q5HeT2iZFkgKGF7V9vwUr56XgxUF8B4S2T8lQJ8RG
	SNv5BJHLivWVZukQgLZs0fK/vUn6peWPsGrmR69rQ3scyfZuXIFww8RCj1Hm5yWderWg8y9U0i9cH
	1jWdRdiJeWHD3RluwIzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCJo2-007bV2-Ky; Tue, 25 Jan 2022 11:16:10 +0000
Received: from mail-mw2nam12on2052.outbound.protection.outlook.com
 ([40.107.244.52] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCJnz-007bUQ-Qx
 for linux-mtd@lists.infradead.org; Tue, 25 Jan 2022 11:16:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KMknvuhyBS81wySiQ/tfoSAbXYwUvEU/RO9KBlrYZMmcOgFVL1XRonfNcJSjWPIm3vbIOvMwlClQAOGvJFiSAvQ4JHloCMbIzShNSG0T4syos2QgsK+NDLedqoQ3y5i6P3JOInZcY6kzKe845uY/mEnENhvoFdopx/gbR7sf93M97rT7SFMWDmkTMHqrehWz05K1/MNiFPq8mOcb6w4AegSkVfpEAHCZxeO7TU4glYO/aneGGaT9HSnAAwtNKDfojq1KOR5pVkH/tF4I5AoddUw3DLSk9C4JZeUpifZh2vWjauiwn8epghTJDkmXWW25X92Dqdq+U4dAmbeL8k3OuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=75ze25e9GtU/54Vy/lGDSb+qD3CLpkbFq71NH24TJVg=;
 b=HFocykOWANCGczYp3ZFVxNWC7K1wSxoAzgmDu0Gd4GY8+zpWAASdraGwmBaK5kjk9tAwOw32Aj8nWRMkx5c0o82aefGHzzTcjfrHcwvmLu+ngNUzTd8pxDjl6ziU7pCvSiWzKsct+Rt4ASb62FkvLG9iSuBgUAyvcHawTE1HVFrtvG4o4oBDqxztg2CfkIr41STg4zeYLaC0JyN+V8fl9xZRfa5dX4WCm8j0Bkk/ZX86x5UiyJTLXXwSfPGR1JgJfBevIjegYq98bPuF4h6WeqqTe97Rhdo+m8RNW96M25VOd57W8hy4PD8P7yWzyutEemyHbkWYRJPrdtSqNKfzqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=75ze25e9GtU/54Vy/lGDSb+qD3CLpkbFq71NH24TJVg=;
 b=IPZQ5IiXm2HMgQ4wCTxnP54OtVFz/lBSiwGYMvySUsw45Dcd29aEyCj42WdV2PaRfHujfazIXJZbu38DYDWy2TUVfPTHbyKcao4Yo2zUCuzShTuiEd8pB7ktd7ryn7o/AXo6qaKajf5pL3gTflsn33izbRHHin5OvGBLV8aYb/Y=
Received: from DM8PR02MB7926.namprd02.prod.outlook.com (2603:10b6:8:31::9) by
 MN2PR02MB6768.namprd02.prod.outlook.com (2603:10b6:208:1df::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Tue, 25 Jan
 2022 11:16:02 +0000
Received: from DM8PR02MB7926.namprd02.prod.outlook.com
 ([fe80::1da8:d2cc:796a:2879]) by DM8PR02MB7926.namprd02.prod.outlook.com
 ([fe80::1da8:d2cc:796a:2879%8]) with mapi id 15.20.4909.017; Tue, 25 Jan 2022
 11:16:01 +0000
From: Amit Kumar Kumar Mahapatra <akumarma@xilinx.com>
To: Michal Simek <monstr@monstr.eu>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Olga Kitaina <okitain@gmail.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Naga
 Sureshkumar Relli <nagasure@xlnx.xilinx.com>, "richard@nod.at"
 <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] mtd: rawnand: arasan: Fix clock rate in NV-DDR
Thread-Topic: [PATCH] mtd: rawnand: arasan: Fix clock rate in NV-DDR
Thread-Index: AQHX5ou2Bf7LXMmLqE2BkrzECsGUyqxz6uWw
Date: Tue, 25 Jan 2022 11:16:01 +0000
Message-ID: <DM8PR02MB7926290BAD4269B690A3C074BA5F9@DM8PR02MB7926.namprd02.prod.outlook.com>
References: <20211127180758.30884-1-okitain@gmail.com>
 <20211129095559.01aa63a6@xps13>
 <3da5dff5-53d4-15db-075d-9b195f2f75dd@gmail.com>
 <20211130082017.1400f24b@xps13>
 <fb6a4b49-7c10-4ed1-7054-5dd8ce2d8073@gmail.com>
 <20211201090941.73e67f65@xps13>
 <734dfe79-6e3f-1e68-c167-bab3ae9e8d52@monstr.eu>
In-Reply-To: <734dfe79-6e3f-1e68-c167-bab3ae9e8d52@monstr.eu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dd18779d-39d1-4450-0a1b-08d9dff4121b
x-ms-traffictypediagnostic: MN2PR02MB6768:EE_
x-microsoft-antispam-prvs: <MN2PR02MB676849ECB518EFFB6758451FBA5F9@MN2PR02MB6768.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: x9b1uqcporAlpJvEYvwebSty+EhwBwSAIOk9+fxvwmLAjKWe7x6bcKAoyEuglG9A+iGR1RKSnqxIBb7kyafAKU6/vv0nhmeMceP5CvNLZlFIyutcqFBkpfnIyDxDcmiTTx8ozyhmFOMAeWqPx665Pol4Gh1hBjLOjnBnVEnnw82diPm4xHOTFtTiZzvEy3TUTg3CaeTaaT8HVi6EVkBkHYFwquE3yO5rdv/M2LrN2aQguur8jra7asamKm0GRhe7+oGUmFQgcDoKgNPKq/BFMIn5nCKmFGTL5dHRrTcF6g/MOpuhsOYpLX33oV5Y2Nzw1z80WjsXjlL4EKd5u5ysEdUzWX0RC0lyk0tmyL8IRGX7hc+jZwAW4FABU1m83DWDrZxdOhpIuDBc3os965hFdllDXZUPFy6c3qGUmPqovmJzQDmlP80x5Ft0/rZQKupMDxBYWsG/kOQ78DuTyQrw2TbM/4k4SD4NZaLa/4OkRHb1QOzd2FWQQLH1x9nGKIyAAyLGfHrA2xNYn2XxsyVIfX3USRKnad1qh8oGlUJjezJDTqwVxHpnqgqpVGGN1Q585bJGZ74My8qLwVQ3p8HnGmP9RZTfsKMqy7hjkDXFBkd97lePuQWXmvwTphATK+mjsQ4yyF6d1Ziu4ozGuLOdfz3G4UnYs/oTj3cHGBvCZFD8iAOPmcfbvXLBwycSujeHWCR6rpn7nr/UAyff4bJQHsd0wB/HyIHCW3F8PB8l989W7xil7mLUFC1ZrB+Ia+hCyRXKPsoV6SCeDLdTscl9bFzthe+MynF+AbC8NkecUbM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR02MB7926.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(83380400001)(8676002)(186003)(8936002)(4326008)(71200400001)(66446008)(64756008)(66476007)(33656002)(66556008)(66946007)(76116006)(54906003)(316002)(38100700002)(26005)(508600001)(86362001)(15974865002)(122000001)(110136005)(52536014)(38070700005)(5660300002)(7696005)(2906002)(6506007)(53546011)(55016003)(9686003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TTZ0eCtvL21SSDU2ai9QSjluY1Q5aHZTenFnazdSS1hGdU54U21nUUcrbTRR?=
 =?utf-8?B?a0lHenBlSHk3Z2xmSkhJbjVTWmFqUmlhZFY4bG1Bc1d4K2RFS3NCL2c4TzZq?=
 =?utf-8?B?YkhwS3BjZmJqVlV3Wk5mdzgyYndBM0VZMDhTZjhBbUkxSEFyQWJEaFQ3YlNO?=
 =?utf-8?B?L1Z6WW5XS3RINE96SFh0TU53SW5scEtVWlJva0srSWlpVTJDbFp1NUxMWnV3?=
 =?utf-8?B?M1BDejFtRFV1dmxObktVNFYvS2FmZjN4V1RTSTNFeURPWlZJMFFZbFY4K3Zo?=
 =?utf-8?B?UGY5WlJjNXNqVDN6S0lVaTM1WjNPUTdwbURCajlZS2NOUU9tWWY3VmI1Tkc3?=
 =?utf-8?B?UHFIdUltbE1meDFibVVXeklsRmFTSDRsVXMvMlV0MUQxbU9OdkhMN3RSQUZp?=
 =?utf-8?B?dWh2MkQ0VlBTNXR0QWJiT1RiZ0EyYVMrU0cyazMydXIvUHlQSlZrcTZ4UzBo?=
 =?utf-8?B?ZXBXQzVHQlBVRXphSW1YWC9Od0tBY1hCWGp1NkE5SFZjbml0Um80SzROQmN0?=
 =?utf-8?B?b1AxSCtUVDBvVnZ2SlVLUUMwbFJrNHhZWHVxRVp6cVVaZVd3RUJtRVNRV0c0?=
 =?utf-8?B?cVg0WndKRnNSWFF4YUtieFlmazZVRzBtRXRwQWFDK3RLM1RpdzJRRVY3K1Bw?=
 =?utf-8?B?ZnVRczZQWWZoMEd1ZUl1MjZxemNaaEQ4Q2JIZWlPMnlVcjhTUWxldlE3b1Ba?=
 =?utf-8?B?OWZGR2RJWVVOWDU2bFFSRndCQWhPVExTVngwdUczaDZCeUtZSW5lT0dyN21X?=
 =?utf-8?B?WXFEc3JYcWd6U0hSYmFSd0lKVXUwckh2SjZNaWVuS0pDVGlGMjhzNitEY21i?=
 =?utf-8?B?NzYwVEp3cjJoQVlOWnhOdXo0SzZ2a3NiamN3SnFmQndoTTRBNVVQaDJhLy8z?=
 =?utf-8?B?U2ZLZ1ZCQkRkbHcyTWFodDAydkxIZ29TRGRSZUlhTVU2MnlKVTV1ZmU0UnMy?=
 =?utf-8?B?Sjh0T0FzZWN4ZkoySU9vMkFjeHJ4N3dmZlVjT0JrUkxGVGJXOVZCWU9WTkhT?=
 =?utf-8?B?cVplUEtHblVieUpIRnNtdUxSZm11Ny9CMkszR0hZb0FTWmRuaWN3R3JQMVBi?=
 =?utf-8?B?SnlBL1A1Nlc3bDhaWUwwa0JvTFQ2TTczVThEQnA2emhvRU5zemhxZElXNGln?=
 =?utf-8?B?eVFCTEI2TnFlT2JMRDZQVHZqUzJRaU1UbStTNW1yMlZRMlFkSCt3QkxUVlB3?=
 =?utf-8?B?YkNxbytYREpvdDlFQUd1OEEvRXVrZkNIaVY3RVdzNUhJRVdLV09HMldVTktU?=
 =?utf-8?B?eTc0V2hON3ZlcXRMRkVIblhKSjByT3dPcys2dnZrdUVCWmVQV0Y0b3FZVkV1?=
 =?utf-8?B?SzFQRmF0QXJINzc1UlRlSkFBSnhuQkRpR0NzaTkxaUlaSmZHUC85aFA2VFND?=
 =?utf-8?B?UVVXNlBHemhWWEoxZDhQZzRLeG5LK2JYWDJ5TDJGSDcycFA0dVVhZFFmcUFU?=
 =?utf-8?B?MGZFTVFDdjRzaXJUYnRjR1V6K0dmc0NkNmU3TnVpc0FEWEpvK1kwQlB5Smsv?=
 =?utf-8?B?bzJSbUlraWZUUTI4bTRKdGJySXIzRWk4TkJjNitXOTZNWE5VS0pZTEJ2Q1Ay?=
 =?utf-8?B?d3R4SUR3amwrZWtKZ3UzQkcwdmN6WXNZTHRxL1ZtQktIUzNwK2RuMGhGcitl?=
 =?utf-8?B?UjhvNGtSZHFRczZHZCt5TmVvdXozQytYempWT3dhZUcyZFNoeWVSbzBBdXRv?=
 =?utf-8?B?T0hvbTRZSGpuWitXL0xvc3JrRjR6c2xJazdFbGZhSWM3RzZZVE5jTFB3anNZ?=
 =?utf-8?B?eGYvdlY4Ym1aWTcwZkh4VlZqbThoMU04clZSdDk5RjFQdnlhcWV3VWwwV0ZB?=
 =?utf-8?B?L2xnQmd4L2VRUDFvdklzaVFuVnpSY3hjbVVhbUZOWnhveVZFQUFaR3p3S05S?=
 =?utf-8?B?OENlT1UwdDUzNFJpanV0dXZ0YUJSeWhFcSs5ald4bTVVVEdEbThxUVBZdUpS?=
 =?utf-8?B?ZW4vSUtiUWpaM1VNL2owUVl1VG1hRGo1Ym9TY2lNTGxqanJUMGVVdWgvV3pN?=
 =?utf-8?B?b29FU0pvSk1lYnRGRitocHFGYlJCaVI2ZkVyQXp3VFZsbE9NSXhwS1F4bklP?=
 =?utf-8?B?UXpTeUQ2VG5MTzBIMGlQN1FoWDFaZkJyMHNUNzZYUmlta0pjZFdNcGVla05G?=
 =?utf-8?B?Y05sTkZRUzBzcFdqbU9Fc3hSdGNCYVZCUmttZC9IZXVwNHUyV0lFV1lYSUsr?=
 =?utf-8?Q?e2A1u8PwLvSyknAH8AUQDAA=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR02MB7926.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd18779d-39d1-4450-0a1b-08d9dff4121b
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2022 11:16:01.7318 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vBW/pSyOG2aoy3G/W6zdpSGDN07b73WeF6g3JVZdzXgcDXn/MS6618modPrLyLs4TOWo1RCtNnr9lfz6Iamllg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6768
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_031607_927676_1E54FC41 
X-CRM114-Status: GOOD (  36.05  )
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

Hello Olga,

> -----Original Message-----
> From: Michal Simek <monstr@monstr.eu>
> Sent: Wednesday, December 1, 2021 1:46 PM
> To: Miquel Raynal <miquel.raynal@bootlin.com>; Olga Kitaina
> <okitain@gmail.com>; Amit Kumar Kumar Mahapatra
> <akumarma@xilinx.com>
> Cc: linux-mtd@lists.infradead.org; Naga Sureshkumar Relli
> <nagasure@xlnx.xilinx.com>; richard@nod.at; vigneshr@ti.com; linux-
> kernel@vger.kernel.org
> Subject: Re: [PATCH] mtd: rawnand: arasan: Fix clock rate in NV-DDR
> 
> Hi,
> 
> 
> On 12/1/21 09:09, Miquel Raynal wrote:
> > Hi Olga,
> >
> > + Michal (please add him in Cc of your next iteration)
> >
> > okitain@gmail.com wrote on Tue, 30 Nov 2021 23:08:20 +0300:
> >
> >> Hi Miquel,
> >>
> >> On 30.11.2021 10:20, Miquel Raynal wrote:
> >>> Hi Olga,
> >>>
> >>> okitain@gmail.com wrote on Mon, 29 Nov 2021 21:06:05 +0300:
> >>>
> >>>> Hi Miquel,
> >>>>
> >>>> On 29.11.2021 11:55, Miquel Raynal wrote:
> >>>>> Hi Olga,
> >>>>>
> >>>>> Please add all the MTD maintainers in copy, as requested by
> >>>>> get_maintainers.pl.
> >>>>>
> >>>>> okitain@gmail.com wrote on Sat, 27 Nov 2021 21:07:58
> >>>>> +0300:
> >>>>>
> >>>>>> According to the Arasan NAND controller spec, the flash clock
> >>>>>> rate for SDR must be <= 100 MHz, while for NV-DDR it must be the
> >>>>>> same as the rate of the CLK line for the mode.
> >>>>>
> >>>>> I completely missed that, where did you get the information?
> >>>>
> >>>> The "Data Interface Transitions" chapter of the spec contains
> >>>> timings for flash clock setup in NV-DDR and NV-DDR2 modes. The "time
> period" of those clocks is equal to tCK in NV-DDR and tRC in NV-DDR2.
> >>>>
> >>>> The same chapter should have information about necessary steps to
> >>>> switch from NV-DDR to SDR, which includes setting the flash clock to
> 100 MHz.
> >>>>
> >>>>
> >>>> Just to make sure i'm not shooting myself in the foot: am I changing the
> right clock?
> >>>> The documentation points out that we have to change flash_clk,
> >>>> which i thought was
> >>>> nfc->controller_clk and set up by anand->clk, but it seems like it might
> actually be nfc->bus_clk.
> >>>
> >>> I believe I made a serious mistake, re-reading the code it feels
> >>> like I'm changing the system's clock (which basically changes
> >>> nothing in our
> >>> case) instead of changing the NAND bus clock.
> >>>
> >>>> In that case, does setting nfc->controller_clk to 100 MHz by default
> make sense?
> >>>> There isn't a hard limit on what the system clock might be (beyond
> >>>> a specific SoC), but there are timing requirements for the flash
> >>>> clock, and so setting a specific system clock frequency seems
> unnecessary for most devices.
> >>>>
> >>>
> >>> Please create a two-patch series:
> >>> 1- Setting the right clock in the current code base (inverting
> >>> bus_clk and controller_clk where relevant, setting one to 100MHz and
> >>> letting the other as it is)
> >>> 2- Changing the default NV-DDR rate based on tCK (below patch).
> >>>
> >>> Do you have the necessary hardware for testing?
> >>
> >> I'm sorry to say - I do not. The SoC this problem was initially
> >> noticed on can't run latest Linux, and even if it did I have no way of
> acquiring an NV-DDR-capable flash.
> >>
> >> Since Bootlin merged in NV-DDR support into the kernel, is it
> >> possible for you to test the next iteration of this patch series on NV-DDR
> hardware as well?
> >> Say, by purposefully preventing NV-DDR mode 5 from being chosen in
> anfc_setup_interface()?
> >
> > I don't have the hardware anymore.
> >
> > Please send a v2 with the necessary changes, then we will ask Naga (or
> > somebody else from the same team) with access to the board to test it.
> 
> Keep Amit in loop. He has access to HW and able to test.

Kindly send the next version, I have the required setup I will test it and let you know.

Regards,
Amit  
> 
> Thanks,
> Michal
> 
> --
> Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
> w: www.monstr.eu p: +42-0-721842854
> Maintainer of Linux kernel - Xilinx Microblaze Maintainer of Linux kernel -
> Xilinx Zynq ARM and ZynqMP ARM64 SoCs U-Boot custodian - Xilinx
> Microblaze/Zynq/ZynqMP/Versal SoCs

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
