Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B58C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 07:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zkIthfK2GQViFb/u3PH6V3nEY50sZKxKX0wW+vgaPGQ=; b=BPF2+6Uq8lmqYz
	6v2Y64urgD/zYUrvBtmL1VB5CqeJuUzOGcuho43jtKuUphjk5tiW9I1Z6mw6YGmKZ8QgU/VcbNAMl
	mDvalCrX4pEKPajU2lf7hpM4JV9jGR3zNiYhyR2iJ4JoUFjsOvdsg9kbmjxz0ha6q+u+YRC2X55w/
	1gw0JLOd9t/XGuSMQr+fzgRd8PWDd2YkE3r9ukE4D3eCu1hDErKRsy3bydbiAvCnDMzqKez2lu7Rt
	XL9eZQ2ypIDXw1nuFTgg15SHewEq3P9Aon8aPEeytnBDs6n8LowFiD1ezEmk/51O75r/HIUZcZRXt
	OZwu9bT2u4G9Np7jposA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhRQL-00C6EK-8m; Thu, 21 Apr 2022 07:40:22 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhRNj-00C4NL-Kh
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2022 07:37:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650526660; x=1682062660;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=RtfJ89y+Fn6AVr+oAb1AzCAN+dY4Ce0/IPxiD+IQks8=;
 b=jHc/4H8ScgP7vH5Lim3WT46bcRyEKpZttnLQ4nEfoYTUYTRa5tNDv0Cu
 /lgP9wIGHCQGZhDSNHTkgYcBcQLI2CpATLEW5DjZbmMhuAr5C+rntBAZA
 0pv4yVS0wk36q/mcmLpkazwdKT1DnZQi7fu3flnrAVtLJpoxp7lwu5rYk
 mERg/ora+jgFlMDKBb7ouxq7+QWwV5N1ZuA0NIItLFw9cwGLVJwYHQkLk
 xb6psez+3W1ouMNKGYIPmDUGbqpj+od4vy7kAMG7qTqW/RcfhHNM+1Cu6
 GKV/z7P88BDEMk40XAMQtCLfco4PaO3UK1WL3Ccs2g9cTIiiMDLsiV8R1 Q==;
X-IronPort-AV: E=Sophos;i="5.90,278,1643698800"; d="scan'208";a="160810396"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 21 Apr 2022 00:37:39 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 21 Apr 2022 00:37:37 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Thu, 21 Apr 2022 00:37:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gf7qRahMHlYufI8int87DSMkVUooxvUK6RXtpk02EhxEJ+H500AMlObjgdS8bIF7e8paDSkhjNrGt5297ONTS3v1YuqOgSZ3vm2sNueQ3HyZECON+lR/1w/S47/k1JG7ucYojzKG66Gx6POr2SCtjDpn7iN+mPy0CyhjDkftBaXX6VlQ1IhZJIA/YwuWbeueXiZyClLE/bDhhCjaqRntJoI0nmcA6YZMQpK6tAP3lGjf2SbYghbATd1Qw4KH/F8bv2ndkiWEgeEp/XD7mp9xN+utbTjl1h8v9oXiMEnDZPwijDZYJCbLhSrNJ47tMU0y2fslNFqA2/rKzNx4EQ6Beg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RtfJ89y+Fn6AVr+oAb1AzCAN+dY4Ce0/IPxiD+IQks8=;
 b=JGkbGAKsqdcZfeRsaqSf3DMV29XZkp7rruDNCFIwhzxFiM8bl+a2HiLqxHnlu/vV33ScYZSIDcGDXIYNQPzrrT2DyoL/Zrj9QuwobJwnxSM6m3LNvHkdjtwuZFqXouCfJL/kRJOHAiSu3/s0EdbH+8cVwkHBgn/wQ3IIbn8/win6YgF9mBVVDN0kMvUDyBkLORewct16inJYQ2/5gQKo6RyelPSMvJKQx82jMi4CS4xjh1yMCmzDC7bA8LQ/nhzTWG5uwTjIU8HFp79RHs4Rx6iz0b3tli6kf4HZ8xPIDMHa6R5jFze0vmixYeawRXAiH08jjyg2+wJbNVCqDuitkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RtfJ89y+Fn6AVr+oAb1AzCAN+dY4Ce0/IPxiD+IQks8=;
 b=HxCPWFQThTRwvTvSwjB01jP3gMuE8TzWPt3ABNgqb5uVcQ+SYDtDFAjo7ul4YLlg9Cvp7hDpLcSqTLzj2+Rcba0j782KpzQmZlaiRvB4LN5BdSGxpG57Ul33EFnVBF8AkW3v9nLmFqEs3bD6NCgveds2HaQgPMp+Cj+s3KOfvYs=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by CH2PR11MB4408.namprd11.prod.outlook.com (2603:10b6:610:4a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Thu, 21 Apr
 2022 07:37:32 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::3414:43b2:d8a:bc00]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::3414:43b2:d8a:bc00%7]) with mapi id 15.20.5186.013; Thu, 21 Apr 2022
 07:37:32 +0000
From: <Tudor.Ambarus@microchip.com>
To: <tkuw584924@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <p.yadav@ti.com>, <Bacem.Daassi@infineon.com>, <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v12 3/6] mtd: spi-nor: spansion: Rename local macros
Thread-Topic: [PATCH v12 3/6] mtd: spi-nor: spansion: Rename local macros
Thread-Index: AQHYVVKp//A32VUgCk6hVewfIfb7qA==
Date: Thu, 21 Apr 2022 07:37:32 +0000
Message-ID: <b0b37533-f3ed-5445-8ee5-265e399a9945@microchip.com>
References: <cover.1650519576.git.Takahiro.Kuwano@infineon.com>
 <e7d067a754e3361c29960dec266671f0371c38ef.1650519576.git.Takahiro.Kuwano@infineon.com>
In-Reply-To: <e7d067a754e3361c29960dec266671f0371c38ef.1650519576.git.Takahiro.Kuwano@infineon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 28a47db6-2bd4-4e0d-cfb2-08da2369cbff
x-ms-traffictypediagnostic: CH2PR11MB4408:EE_
x-microsoft-antispam-prvs: <CH2PR11MB440815E66206544F1C759CF5F0F49@CH2PR11MB4408.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Qm1M+PU0FMo0Gkyp8d0Zd4PEJDePpqwobEUTDgocOZASkot0CiMBeKjfFBVMNzTsEo5DWTQMMnwBxC8h+M5RLGDBZbTIRGjz3DjXXVV+a0QeqQTw7lLIvSEpObnHIopeKU2UTXKzqkUw+RxB6OwwW3zM0v3ywyuvOpC3tzacpz+DMyX4SbW0k9/cNmtdjR4jGkuSHilXsnxwuyqKjSf1LRSrvKMYYW1pLDgPDiYfNAV6DQJ0fVfWm4GMqvfe8N1tULZCqMAy2MHCUGwicOWqYmZuGl13uTu/oGmjicPWymjdaJdLl9mmAIpYebC3MH5QLtRcxbMOgXO1s0qNH7TIyJLv+w8Q+cuWmMNjeJXqDkzQwz/rHWuTeJOdnMPME/eLI55WWoJATRStf13/0F956IaugBaxs99rkoIPigjefLwaEE5sYy7m2sPXE9RaK6F412YP/+8PMTyXG9ZKBWLYvG3Prku0trkEqXUcJOwujlVSEKMJE1semsYELSw6EWBDXqHLELsV7gF/83A4m0mkXw/irZhURx94Zx9ekKPiPoyX1rVGhehANIAcwY9Wys2zJADp0BkLWC18rcXmRLgHBHbyBdJvBL4GldR6FsKDT7FACHSLT/RmaICK9iR2nPJ3HaRBgT4Y7CafDsBspdr//3oe6treyXQazlAW5iFPI6ON2vXUfB27VRaq1R+Qz/oT4ApC32L6zn/BeuxcU86h7tY9zksSIhnURBCgzQkh6J1wcJ/WRkJtZkMLLwvGlZqIDrTuG1MzeS4dNPoJxMh8cg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(26005)(6512007)(6486002)(2616005)(186003)(71200400001)(86362001)(508600001)(8936002)(2906002)(53546011)(6506007)(5660300002)(31696002)(76116006)(122000001)(36756003)(110136005)(4326008)(91956017)(66476007)(64756008)(8676002)(31686004)(66556008)(66446008)(38070700005)(54906003)(4744005)(38100700002)(66946007)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UUh6Q1hFbUExbWpNaUFmRDlRcXh0UGRhKzJwNnFseGRKNk5NRFpic0M4dTY0?=
 =?utf-8?B?S2plSFY4c0ROblVXbEFGNlYwTUlXYUJxb0U1VU4wbUVxSlg3M0R5eExhZGs2?=
 =?utf-8?B?cnBrNDZQVjJ4Ym00NG9vTk5uNlFJUS9Rc3ZtNmNmYlZycTczUlhrMzE1TjdJ?=
 =?utf-8?B?Y1Bscm92WTBSdW9EbmV6bEdOaVJUWEJ3WGFZUE1seTJuNHc1S0drZXl4NWpO?=
 =?utf-8?B?clBUL1pxdTFGM3lFOU1xTnNKbEhsQ0Z3N0dhRTlNa3UxbGc0dFdOMlJTd294?=
 =?utf-8?B?eFJHTUtSbUNIY3RienBNZWxibTF5bVFCeUEycU9USnZ3VExkY3p1Y2NUZWtm?=
 =?utf-8?B?NWdjdllkOU1sa0lYSVdaMDNYb3dqd3JnNERZa293WUdCTGt3eGpXMDZ1N25i?=
 =?utf-8?B?d0l6ZGFZRkZjYkhGcFByeStxcHhWcENmSDhZczVKNE82Z1JiZTl6UlFMU05p?=
 =?utf-8?B?dDdaMmZKWlNucFNKWEN4aDVnaGcwV25sNTRaQVRTaW0zRkVJMmg3U3NYRE9P?=
 =?utf-8?B?MVJ6aUJRWmJnSUxDVXZTNTBsRWpZcDZpVjMwaWwyelFJSFB4NElCSERLci9U?=
 =?utf-8?B?RFhTM3VRelZQanhwOUtuQkhjcW9WRFZjeHg0NS81Z3p1bW8waFJnclFLb0Fh?=
 =?utf-8?B?cFJESFkvUHJhRXJSdkZxWWZtS1RhallKaTFreGxFODBmbHp2ZWFQUTRqcTQ0?=
 =?utf-8?B?TTNnbVBDS1VLeXZBT1ZqSkJqdHVocmFhV1BtRHNGZFRUNGR1RFEreEwzcWdv?=
 =?utf-8?B?dFJyb0M2QkZzVmlObUVBbVhOY2hPTkNxT2xiSXc1a1JtYThONzVUNXM0Vk5t?=
 =?utf-8?B?c2FaaklPOTBYUjgzSk9GTy9aTzNSTmFObmtrRm1ReDZXeGNLaHI4VmRUZjk4?=
 =?utf-8?B?VVhGb3FxV0VzU1gvblRvcmZaV3FMSktVVlhzdW0zcFF5TnlwZzRPSkhUVjZD?=
 =?utf-8?B?N0FZcFZlVzllem8rTERha2wvNjhJdkFTSWkzYnlRVEQ1VldoZlIweDNIK29n?=
 =?utf-8?B?aEtTMG9tTnFGRFNrL1hDbXJaKys1R3l4VjRITW5pUWx3S29WY3J5TXF1Mmpv?=
 =?utf-8?B?ZkhocWZ3L3g2Z3YzMzl0OFpmS0NkUys2amFzSVdxd2czU2hEUE04UmoyVVBV?=
 =?utf-8?B?Mk9aNDl2a2owZVlScmIvWUcwL0ora01Vdzd0VFZmUS9ybHNmSE5uNkxpYmU1?=
 =?utf-8?B?a00rckFRNDNMcW5rWWppY1BSZFd2ckdsYk1HMmR0L2I5WmtxMWFHdTM2YUZK?=
 =?utf-8?B?dEZqMWVraFNxdk9NWU1xVTJXWU5ZS3NzUXR4V0dGMlo1WllpRFUxeHovaXAv?=
 =?utf-8?B?V25zTmkxMFVGaVNUaVJjTjNvSGgvNDhSLzA1WFkvQlc0RGZWNmlCN1E3ck5l?=
 =?utf-8?B?NElMNXRvT2lSdzlYWFNzdmV2enM1RVR4dVlTb3pnZUg5elJPNzFXV3lIeGEv?=
 =?utf-8?B?MGFMeXdoNUZwaWVqVHRkNzJNK25ucjZWOUxRZGU4NmN4SStzdHRaSFRZMzVL?=
 =?utf-8?B?b0hnaXB6bFlQNE5hMHhEaU9BRG4vYWxqU2tEUjZ3bjl2VytDNWV2OXJzVzNi?=
 =?utf-8?B?N2ZyWjNoTW40R2VYelRZTmp1bnExMFFFYm5WNmpHc09ybmJNWkNnMmhONmVX?=
 =?utf-8?B?eFF6aWZQaEJGNStpL0gxeC80KzBjaXZvYTE3T0pKbVJacTF2K1NKbUt3ZUww?=
 =?utf-8?B?NGYyNzMrMm5uSi90ZU1jMTNVUHhJQldYSXZuK0FwTDdkK2pwQzlURE8zNUd4?=
 =?utf-8?B?WkZqYVJWcm1NaTJrSW1PVEJMTXFmQlRsTWRtOHRIejFFSmFIYnYwUEQxY3lq?=
 =?utf-8?B?SGZXUG9WQjhZb2RIRmhKTVVkZ2g5cktIZjBtRjJHL3drVmx4clFLWmdtQnFm?=
 =?utf-8?B?N0hFSFlUNVYyQUFGYWFaSHRsSDl6Q0NRN2dlbVNKdnBBT0FZOTR2Slh3eXpw?=
 =?utf-8?B?OHBwMkswcnhYbUMyQVY0Qm1mY25IRis3blJuSWMyNVlET0EzODA2aTRFbkRF?=
 =?utf-8?B?YStWVDBlM2lxb1A5QklsNVIxNy9xK3VWcE5xUzFTd1F6aWV6THh5WGMvUlhX?=
 =?utf-8?B?OFhSVWM1MlB2MmFmNlhyU1puMTdRUzk1Q3ZaVWpQUDdOR0pZZW44WkwveExC?=
 =?utf-8?B?OGZ6YzBaeUI3alJUMDlDVm8wTXZJdmxOWWxGejZHVXN2dXoxb29BbXI4Y1Fl?=
 =?utf-8?B?UGlEamZ1SFVtR2JnSlY0Vll3aVd2alVOSU03Sm1QNHc3WGVyTWhmWUZuUm5U?=
 =?utf-8?B?WGJpbzVidzZlRFFSVHlBNk1oZ28yLzJuRmg2bkdSS0JRRDdnc0FMc3d0YUdD?=
 =?utf-8?B?c3p6NnhCWW1TRytRa2RtZkp3dER0RjFTSmw3OWowcy9WdXZGVXI0emE1SkpQ?=
 =?utf-8?Q?/npSr2IqOEA6zu9U=3D?=
Content-ID: <BEACA2342335514C99D5CFB9B133D994@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28a47db6-2bd4-4e0d-cfb2-08da2369cbff
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2022 07:37:32.6955 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QeZyQBR6SbQZZyY5/wbwojA2DJrBntK4TYbWXnJIGSl1ZqhI3buXgCz97j3/Rp89bAvsL5fT6d1MW5GUkrnqGzC0E11j5yyQyTjq0RfItOY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB4408
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_003739_735883_BB975605 
X-CRM114-Status: GOOD (  10.06  )
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

On 4/21/22 09:40, tkuw584924@gmail.com wrote:
> -#define SPINOR_OP_CLSR         0x30    /* Clear status register 1 */

This is a legacy spansion op. So you end up with "spansion" flashes that
use "cypress" ops, which is confusing. At the same time I don't care
about the name, but if you want to change it, I suggest to change all the
defines and get rid of the "spansion" name if that's what you want.
The driver name has to be changed as well.
Other thought is that cypress was acquired by infineon, so what will we
do in few years? Will we rename all macros and methods to contain infineon?

Let us know your thoughts and if you do this kind of change, explain why.

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
