Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D16CEC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 07:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yQ3t6pHfquQKP+iCB1HTViy5KmnXGlA7vlWWSzTzuJw=; b=gcVD3kgzAslPw4
	EodGjklj8myu+R8bdN02VQYh31nsp0Al++/1OZjjo/OGQPlHxLQZ4KC28S8yl4/95hXWby7/tagKY
	WC4moNDBsKJ6PdxRppriC1vqNjfUqCt3Li1jtp5bKqQT2m0g1V/97KCQKt/O57AiOJwC7sU9W7i8J
	KkhLFC5Wk7zbNgvVSbGUJit8kSqi8UMF9lp4oTLINkUi9qgoxtiPsmmsDIyP1ks2P8GaNoMDn7iRB
	dW3tsn+xoeeBroHn5T36RqAahUtjaWW+idfgNcFbnQ70zPypGmKyheh0nPSoll0it1IiCOkzYrJW0
	SKUqDgZKcrltbmhqJXmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhR5E-00BzE1-CU; Thu, 21 Apr 2022 07:18:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhR5A-00BzBG-Ko
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2022 07:18:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650525508; x=1682061508;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=5VjWDhOEWWTy16cnEQOydQtNxfPjeg6JQr0GkAfQ+Js=;
 b=S1W5Y2o9/u1MJ/y1oA4Nwidvl0PqRJeDRYw9BsPMIx8ugUQjLSLcENHt
 ywFUmrL6CsJlltCg64sbGmne88cW01c6KJiju7Uy2ejY0ICln7XL4e1X0
 N/Wy7TIL/YJAv1qjtqM8xMo7BW3oah0DeX9IlGDB2vtQK+/YogWJGqW7j
 1R4oM7IzuWlv9l0u5ZQXbSufw++mdCMBSC1dnFK9TOvNhm8mA1A/jtfVO
 66U4yJBrDRsucqXt1A7+kyPP5qyTqk4jkNoFjAStfk3Qzow8YuD6XSqGe
 Ms2DNiSeskMPWTCGq9ngB5ozcKlZfCpG8EwEEP4RVJP+PgptmD+0xsYyR w==;
X-IronPort-AV: E=Sophos;i="5.90,278,1643698800"; d="scan'208";a="170386539"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 21 Apr 2022 00:18:23 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 21 Apr 2022 00:18:23 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Thu, 21 Apr 2022 00:18:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iGhYN6fGDziddUdWWE2fcEqzN5bniYCiXl5c+/10HIFIRClMkwVqlVMdkqkIoarf9nqpoKdcAUNI/oyy3x7PxoMHi49DBfZpaMWy2M0lrdr1OKXLWx+aNDFVMkaa66+1OUA5Gk7O6kgagFiAVqLrGkQITuMKhQ4hhMBxykL+ne6Qh2NVW2qWRFYBGl17leCX7/6U/SYOzCwjX6XzIZxNynGe/Opd4BGGumWh1s2vpDvDLa98dg3Z5Xj7ytz722fvsIr5o+btfdZtn7Sa+744Sf4m+iNWEcqnwq3pbsyaWeaSJcN81xiNK4TTqkc1EHhPNFQONd8cUk0Dn6cqsFEhWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5VjWDhOEWWTy16cnEQOydQtNxfPjeg6JQr0GkAfQ+Js=;
 b=BJkxkudzdbL92rNQOoMnB93wWlQaAwBybvs+WciLaSU2mi2sQCljcf+mQnHA4Drbpv+p9KlNSRaO39SCphLoyuHrI31QeUepK+oOqYLRWRu+acFekzFHZXU7vbemHd/f4+8OVt6UAkw6jEJmztssBTKfOjieow7jWWYnCtCeDTv0JpdXbG+xJ6hYkj6ZRzYHEo23ur8Br76cp5aqQM+pQO7/QdgAVPPJHJUcXbOcsFCBdiz28dgWE2DMCz/y59jRtxz2vRFoKxMwFSBeSotVfbfbp39LiSAlv8JR2W1t0sJCw+de5R4QnE7Va6NNxJ3rCPstg1WB3UaBSodNqX4QQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5VjWDhOEWWTy16cnEQOydQtNxfPjeg6JQr0GkAfQ+Js=;
 b=C4hWeojSS0Vm3cG31AXkN4BEQBG8deC1upz9Xp9QjR1/9WaVA/H3B4Mq5LYkUAP5HE0ZzGcVdaceniSLSx0zaYM+yMci6xo7aEus2wefCyxyu1wqpgl/Z15VYoNjTF15N7WagX6IbwL0y1sqWgWX23NeBrhKwr5OpSPxSz1UTQk=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by BYAPR11MB3558.namprd11.prod.outlook.com (2603:10b6:a03:b3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Thu, 21 Apr
 2022 07:18:21 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::3414:43b2:d8a:bc00]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::3414:43b2:d8a:bc00%7]) with mapi id 15.20.5186.013; Thu, 21 Apr 2022
 07:18:21 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v4 03/11] mtd: spi-nor: core: Use auto-detection only once
Thread-Topic: [PATCH v4 03/11] mtd: spi-nor: core: Use auto-detection only once
Thread-Index: AQHYVU/7/NTsfvb/Zk+xiSXQh0nwdg==
Date: Thu, 21 Apr 2022 07:18:21 +0000
Message-ID: <7f570c32-d0be-97ba-0a1b-9aca93cfbbf1@microchip.com>
References: <20220420103427.47867-1-tudor.ambarus@microchip.com>
 <20220420103427.47867-4-tudor.ambarus@microchip.com>
In-Reply-To: <20220420103427.47867-4-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 939743f7-0801-4c75-2de5-08da23671dbf
x-ms-traffictypediagnostic: BYAPR11MB3558:EE_
x-microsoft-antispam-prvs: <BYAPR11MB35585948FB994021B6CDA627F0F49@BYAPR11MB3558.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XTr4JRV6kskGNQcov51nIF6ClEgiyTVyC9eZQnqJ73l9NXpRmUbVbjDNn/vDl79fwE6SvZYbkRpnHxEMJ1++C1wI3N396V2mUyDzOTNmcHG7SJIiMMBKvb1ofBTQ4xl3n7VKvM8AR52948uw79oVE7IINaC5wbmwLF6W+8n9IyroUqe/ODpPy6/v97PjojFHroCHLQ0S9HTTA+TMfyDTmOBjBmhmYd6bHIwny9gSYR7srWqaARGrwzJVBncqtC6nDvSkXd/sdDc/vzaW01Ishdzlg9rmDhJmA4yKYvNf6nh5fdKQwGyLTdlxPqI3PfaO6WnRw3gT5vtOqU6uc3nkQWq2CmdHCLocmgfD5LOXiwhEVHY+zSiWtHVEok6JkGMSiXb0kZqbSOvIK8XaR4apDnk94VwGTVV1wgTi5HYhTFzORyRbLfUHWES7Bwg+PPy4SUTXUA/zKHAyzBIP2NF+RhXByZIPdVKknpnWsY099BKzzRgfHGqUWHQrZVZwa67yUfyRtz6GD1XWWJsMcdxLn7x62YlmHyCY82hhAbtSxXOlmdGLSH1Z7cprpKK55xeF4zEyCF5GtCsd4ouIKaBK60OlvMNTM6CSe9ac1LLKGhl6tc8LOfE6BFHPZDMWzvC4byod4GQgK13InJWpT9AgW6PtOvc51ch1jvcJkdk86YaxOl165+z7WXrC/km7AmPB/b/B/TprVhkTk0geiu5sp7ZedUKn0HLO2D5SgAeHtsB5G4U/2oSq5jEC6fy4MokAew1pbyJ3jOJ8a5kZBnkm8A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(36756003)(5660300002)(71200400001)(6486002)(110136005)(86362001)(31696002)(54906003)(8936002)(316002)(2616005)(508600001)(83380400001)(26005)(8676002)(31686004)(66946007)(186003)(76116006)(122000001)(66446008)(6506007)(64756008)(66476007)(66556008)(91956017)(4326008)(53546011)(38070700005)(6512007)(2906002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MmhpVlMwSWJURjZsV2lEVEhJb0c3STJGajd0ZThzMFR4VXp0Y0U2L1FXa3lY?=
 =?utf-8?B?RDV1T0dBL2ZqSkVvMHRkald3WmhGYUdPUlVBSTV5bDYwL3Fia01yS3dlWTJS?=
 =?utf-8?B?TFNYdTRLNnc4MGNTYXorTnRPY3dTTWFzOWtiazdBbnliQ29FNWFScmMweXhG?=
 =?utf-8?B?cjYyaXpoakNwcnRyU2xKandDT3h4SEY5YWlRemp2SlJZWDdjTmZBbldLblZL?=
 =?utf-8?B?S2gycXdoQWY1K2RBOFVvQzNWeFpMcHdwaU5TUDlCSzJjQW5LdUtPQnpTdTh0?=
 =?utf-8?B?aXh6b0dFN0RDbXZEQ3AwTE51UWZzcTVXZEZXcVNnV3J1R2pRcmNJczRncWt5?=
 =?utf-8?B?UTkvTml0UStxbUNNdUJkclVCdVFRWHhtMm9GalRkaXF2alZUc3dUZkw5WTR6?=
 =?utf-8?B?M2pRMThWVEVXcUd1RDhpdmoxVERZUStDL2tBR2VoOEFycmZ0bWdwc0J0WTZz?=
 =?utf-8?B?TWV6dWN5UVEwSE9FQ3ZuTDgrMHhkczc5bGNpZ28wemFmektHSkpOLzZXNVhq?=
 =?utf-8?B?dkNUWEhGWGwxNDhTUnpWOTZyZU5LOEp6UVIzTTU4T2xJQjBjZXZtM2xlQnNw?=
 =?utf-8?B?R2YzMU1pUVVTQW9IKy9jeHVNL2MyT1BFTHBrYnE1ZHBCVDNrY3V6YWRmelJB?=
 =?utf-8?B?eG1hR2RrMVhoY0F1dXlMa01zQjcyQnJocFJmSDI4anpZaWNiem41ZHFIdjV2?=
 =?utf-8?B?eU9COUx0c2tySTJkbld5S0FiTVg5V3ZzVzJuN0RRdHE1WTBjYnZEMmFvQjFr?=
 =?utf-8?B?TE1pVUU3R1RvRENxMUxCODIrMWVBRjh4cC9lV0RwN0lPcmdUY0huZzFvY2Jo?=
 =?utf-8?B?UmxXb0hEak9WMEVxMngrR3lRTmlJMVc2TVh2YTh1aUQ0TGIrZSs3bmlISkIx?=
 =?utf-8?B?RmZsbHJHL0owSmwweGJrMHNXRFEzS2E5L3dNMFVadUwxdHhvVTViMnNVRzlL?=
 =?utf-8?B?VGhRK1hxT1VPb1p6MkhEYS9veDIwTTEwMjBDSk5HbjE4SmpuellaWGRiaE9K?=
 =?utf-8?B?bFdEc09jN1F2Z2FpRDNYVnBoNlpTZVRiVUd1M2FPcnR6YTArYytsVEExU0N5?=
 =?utf-8?B?UE45c3l5MFZXdkJXWkNBS20rY0J2K2I2cTdiaGJLajMzdHhpRjB6cWpDcmtW?=
 =?utf-8?B?eWk3cENZZ2V1dHcwbERmZWxBalY0dnpzdnRGRzVwVEYvVkNjQnQzMXVRNjdK?=
 =?utf-8?B?Wm5EYi9GcVZCd1M0NU9LOEhQRkpJa1BKblNMOWRUZ01BOGZxMzA3Wk4rWENC?=
 =?utf-8?B?cC84dWxPVFJScnJPRFdQUTh1bmpVaFFBT2IyNHlMYzRVcDlMQ1FTU2pFNldO?=
 =?utf-8?B?TzZ1T1E2bUIyYm8vRHR1eDBDNzEyQ1NJNW1RY2YrV3ZaTG9US29EY1IwT0VW?=
 =?utf-8?B?Wmx5VFBzYitRWHhscFcreWw2ZEhaRDU3VGt1WTRkbHNqRzd6amR1TEZTWTY4?=
 =?utf-8?B?ZlR3U0JYT2xEbUdjajlsRlZpc2RadzZ5ZDNvWWpWbFR6bmw2ZkIyT0xtY09o?=
 =?utf-8?B?WkFTNmdBcFJDSDM1aGQ3K0p0WU80ZUVSbGQ3SFFvWFZsZHZRd2d2RS80Nk9I?=
 =?utf-8?B?cUd2Sjl6c3dHWkd2ZUNsYTlLUkpsZDNLSEZJeURoMThndHRROFZWazRiTWJH?=
 =?utf-8?B?bU9IcFVqMTNhN2lvTzBDcGVkOHAxSndSRWwzelp1MTNmbmFCQ1MyR1lKWVl0?=
 =?utf-8?B?Q3l5cTZQRkRmc1R5UXhoYURTbHFBQ1Y4QWpjeitkVHFCNXRqc2djc0xFT0lh?=
 =?utf-8?B?VjJCcW1zbUptMXNWeDZ0WnBaNEttdk1yUlhPeUV1U2lMVkF3bm9OSFRGWkk0?=
 =?utf-8?B?YkJDYXd4blJBWStjUFhXbktEK1ZCOC9KRy8vVGlZY1VlUkF3ZldoTk5HaC9u?=
 =?utf-8?B?WFZFTU84L2ZGLzBWZGswcmdyL2s1bHgwTkpRZ3BSdTJiVG5OTlQ3cS83R2lQ?=
 =?utf-8?B?R3N0QStsVVU0ZFFZbE8rL05hcWZvQkhkbXYzOUJLcExMSGxIMEZsNFhIZlN2?=
 =?utf-8?B?RjBrWUdDbDhWY0U1QlpBUlJSQW1hdmJKd0Nid0N1TUt4TVFTTXRoOWN0QXow?=
 =?utf-8?B?SEJqZGJhM3pSb3JGS1ZRVWhCUThhYmJ4b3V3bDFJZEhSSzJCK201d24zRU5F?=
 =?utf-8?B?UnJkVHZ6WkZ5b3NFZmIvOEVnUXdnb3V5eW84WThCRi9NVk1vbEtyQ2d5dnNh?=
 =?utf-8?B?L3JDVHhPVVA4Y3lZQmd5b1orS3prU1FyV3J0RVE1YnoxaW9RQWNMSmRKZzJG?=
 =?utf-8?B?eUhvYTc2U3JCZitHMFVvWk1JYjdlNWJEOXVzMkZIZzVrQkFPWSt6NDV3bkFX?=
 =?utf-8?B?SkxOQVFhc2N0bEwrTklxOGd5cmZMYjMvSEdLeE5QbnNPc2RFUFNCMWtBZmlG?=
 =?utf-8?Q?t1TWGjFgBM2Kisj4=3D?=
Content-ID: <8245021287A4B94090B1C0DC8B2A3C55@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 939743f7-0801-4c75-2de5-08da23671dbf
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2022 07:18:21.3549 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2GEjQYACRt6MdyYdpIcLcA9GuNIhDFy1xNo86PuaohHJi3yC8e5g2+PGneJs24wb7wH2hM3Efq0pWZYa31EeoGFk3vHZuNSmcNL9jGx43Hw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3558
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_001828_952190_77F9ACCC 
X-CRM114-Status: GOOD (  22.17  )
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

Hi, Pratyush,

I forgot to remove few checks, would you please remove them when applying?
See below.

On 4/20/22 13:34, Tudor Ambarus wrote:
> In case spi_nor_match_name() returned NULL, the auto detection was
> issued twice. There's no reason to try to detect the same chip twice,
> do the auto detection only once.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> Reviewed-by: Michael Walle <michael@walle.cc>
> ---
>  drivers/mtd/spi-nor/core.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index b9cc8bbf1f62..b55d922d46dd 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2896,13 +2896,14 @@ static const struct flash_info *spi_nor_get_flash_info(struct spi_nor *nor,
>  {
>  	const struct flash_info *info = NULL;
>  
> -	if (name)
> +	if (name) {
>  		info = spi_nor_match_name(nor, name);
> +		if (IS_ERR(info))
> +			return info;

As Michael suggested spi_nor_match_name() returns NULL or valid entry, so this
check is not necessary, let's remove them.

> +	}
>  	/* Try to auto-detect if chip name wasn't specified or not found */
>  	if (!info)
> -		info = spi_nor_read_id(nor);
> -	if (IS_ERR_OR_NULL(info))
> -		return ERR_PTR(-ENOENT);
> +		return spi_nor_read_id(nor);
>  
>  	/*
>  	 * If caller has specified name of flash model that can normally be
> @@ -2994,7 +2995,9 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  		return -ENOMEM;
>  
>  	info = spi_nor_get_flash_info(nor, name);
> -	if (IS_ERR(info))
> +	if (!info)
> +		return -ENOENT;

also according to Michael, this change is not needed as spi_nor_get_flash_info() can't
return NULL. Here we can keep the code as it was. Let me know if you want me to respin.

> +	else if (IS_ERR(info))
>  		return PTR_ERR(info);
>  
>  	nor->info = info;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
