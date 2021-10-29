Return-Path: <SRS0=Jpfl=PR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4502C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 19:06:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7352E610D0
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 19:06:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7352E610D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=70tXtY9C5T/01FEgbeg3NQdiymTsm8wM/q7Y3uHlHjE=; b=B+Kg2HALCPlo/C
	18J2GbGUmixWQRCPd+U6lmjIDLf91wVQf5m6izKSslJsIVf+gV7EppXkjE0Uq2f7xkxf0DdfvPEb/
	7EbI4LzN7jUaM7ntDWcDfG6eqtHXv80dP80eIovlhX2S4TaEa1+gGTBOEXaL0xIllO7vkaksPLa+L
	v+GBdqWZW/K+HsYrkbkidaPxb9J+D/wCOjS2dx2TfAKomfNmbwd+IIPMCMm5DL1K7+lecJuJOdmmB
	Wshj/XAJ7QkoZfcaZVYASY78gOSIyd5te7gYolwNPsjeeOmgp4d6ADNjQjWkpLWVw8K5uD9SIVb6n
	3x/UaWrWKECcCBBGxRTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgXBI-00BuvW-2o; Fri, 29 Oct 2021 19:04:49 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgVlF-00BbDh-2f; Fri, 29 Oct 2021 17:33:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1635528828; x=1667064828;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=g4yJnZ7qtKlI16W7ra+zGlYZ2NPb4ABfuT0JTSzUGug=;
 b=ycG3PIlqpovnzpXYfGgCipjbWJrNBAQEIJDLcVdljtcAGfH8cp+VL9iM
 F8ANZMJv+MlNF+M/D35kkf1BbkYuc2q1srz6CvtBlak05wq1owQ6Ia6cJ
 +Cnxh9dQfuaRKddOqNhJUJioFOYdAgDYaJR84UKnLzZT7/KOzej+x8zdd
 UIO1Yv/vLZiQiV++1u9j+l/dydHwirGFuWFy7bnWRPo3FvDylbdJpPk+d
 CD6N65PmoIrxhV0VzNGAIlEYq2JIyQhSMq2dh3jIv8joMCFE53d9sgKtn
 Rklf1ZbiNC1e0MIlPG7x5fWLBjPYcQ+rlHwaqFneghfSsbMW/UO/F+nPL Q==;
IronPort-SDR: /Md2zQ1WstYHluL7qzKKK1ovjezokNn5yeNBX45GMaciEIewg7wTN7q0+zblYsaNTM8524Fjqt
 F2ZLsPalRPR4ZoG+3vVQAvoFffCVgUEEPEWDlEL9olF5o05bvTlgY51GGCAu2WF4bDrm1vjm3z
 Wku/Zam8Ms484aNP2JncKzVI+t6WAMChet6dd6z/P8QF7tu1JyJbk5Q5jy/ZvhaInbHptms1q/
 po4fLtZmInkCHPw1bxA1tvCCa1UuAvR+srkaFeNSsmyS6xlTO7E53PrvU/uv/j89dbdEZMUjbO
 jdVAsIwTyT9oGSQXu9PmkXzf
X-IronPort-AV: E=Sophos;i="5.87,193,1631602800"; d="scan'208";a="74734149"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Oct 2021 10:33:47 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 29 Oct 2021 10:33:47 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14 via Frontend Transport; Fri, 29 Oct 2021 10:33:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GzAOpGic7xYnckvNnMYhnmzAztAtauokWA40gXBxpZBjoSKlQPtr0HNk/juPkuD+k5blCUPNXg0f9m6fid1a0OHUKhE5xZ1irCCAWpRxtzl/6fdsr/oba1Md6Xh5PBcgUcoVYbynJOs8yK2JUBv/SSFKM87TMofqPczIOBJnque0kLrIuYbyqmpS55FW3VT0CSCQ9LsoIgQYfsFaAkq7N5smjuU+1wMzWokeoamvi0w+RWaYC6ogAmpgzOplmuKHDhcnw4WeQtmFG5+iZ4UYn7Vs0ws/g/m56/MvutVSjmYErjL0t1zkFhUplqXD6D3/Od2nw2fskALNL4VNTkCLsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g4yJnZ7qtKlI16W7ra+zGlYZ2NPb4ABfuT0JTSzUGug=;
 b=OlaW6nHcvUiV4ZoN3Lku274t+GEpTdmp08bPoyvrDcb5uaq/CqTf9y1897rIHncZWXnI0DZFdgUYJbcoxJsdfHsZVbpq+ClkdhMh7dIDyxUH6ZX7cto2ke0hHvW/chJ11eHCkYEcrXKHnilUx4OkffWeYkDGF/2e05L/CdGJvw0ig+ybFP1FcVAxUsYqMztA8+oUYzlwFVfgJej78vsYFKofMIWhji9ZCKQKQrqRKKQPJn5unzAUcPdZ7lX4f9Oph/YPOItLXtI14Q/WeVbv3XiNriPXV4HAfhmo92BYSrAZlFA4F0fbTLin6VckHHzYeOr5bk/1WWd2gfaGe8rIGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g4yJnZ7qtKlI16W7ra+zGlYZ2NPb4ABfuT0JTSzUGug=;
 b=PIKfNfb483XR3ubPx4oLbqi4//u/GDscSjqi5Q9XR0KNRt7/7wdrE0VEE3lpxa9hOFYy2ZAx0zyvkdAaZxjuNLHsg1OCEUi0AXkt6JEo0jFC/2ASclHjL3bF4C2GdTXfkG5fGp3uHVi/IIMGfYUZJ+x1R3AscXdTODgY4EtlonM=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB3535.namprd11.prod.outlook.com (2603:10b6:805:ce::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Fri, 29 Oct
 2021 17:33:45 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::38e9:ee20:d712:2fd8]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::38e9:ee20:d712:2fd8%7]) with mapi id 15.20.4649.015; Fri, 29 Oct 2021
 17:33:45 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
Subject: Re: [PATCH v3 24/25] mtd: spi-nor: issi: is25lp256: Init flash based
 on SFDP
Thread-Topic: [PATCH v3 24/25] mtd: spi-nor: issi: is25lp256: Init flash based
 on SFDP
Thread-Index: AQHXzOsf1egG/oGJ8EWedzMhDNce4w==
Date: Fri, 29 Oct 2021 17:33:44 +0000
Message-ID: <ed3f2066-b4cd-1652-30ce-5032bfea1e88@microchip.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
 <20211029172633.886453-25-tudor.ambarus@microchip.com>
In-Reply-To: <20211029172633.886453-25-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5031e1c4-c722-4734-bb6f-08d99b02420d
x-ms-traffictypediagnostic: SN6PR11MB3535:
x-microsoft-antispam-prvs: <SN6PR11MB35354E84202C229739F69FB9F0879@SN6PR11MB3535.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1122;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yeHEDIVcfvcPCwUFIfwd9ELbnLoXSt/x415TjF2BlYP+Ew2RzIWNHy8uhXao9bgt9+r1baeJ++gFeZcV5Q0wevrJSy0ukxb5eRBgfaUcpCbnmOev/mjbIKd5u2dtuxKg/6swTY09Nz/Iy+yWEvwM3ppN9vrrFsPT8h65yiTEogfpVXtVy/dB7ZjMYSDgWsf8Er8IScERdcmDUjxZhaaTnCzCW5dlyMASc4b1rR71LpQYbOm2wvK+Xkawwq9LME4Arw2naQmf6TnGOS1dpM1I3bmLIU70usun5OfYbGcaCJuNUvm0L3uDJNZyDH2mDfAnLlXUNcGa6waUWwy2PiOAgy2BWl1DmSFPlDFoR90XOYZ9Sinavsbvj+fZSKl3yV7Oaw1ktTkpDpAg9jg6sZ0Ea0gPEGJoule5FHy47eo8b6GY0aaPZoQB3fn1TfbyaP+lJK87vR4sIZloaF2CnmF5p02r2gjOXhNrcFqn98CXL/tECEHTc6HvAI7G1KdgQ0oyJBQJA2RcP3autsVaFhp1AiZ4jiEPygv+7BECURCMMS8FT6vlaMWKshYi61E38tToECBtXbqgygWL+XAPiqsGpKf3Y8DHkV4OnKb/2ViD7eN/gpGlJKNLVw/TR9XUJJL7tjJn/KHuLwd2e8DJ/QQ9pB5RueV2C8bH9NaUZSI0fW5qG4TlogMqqH7McdSogodfsXNXxutisBhP6tse55Y5spUhqqzBokDuoMyD1BMf9jkMrBQxoG1/1YFucZgeLw+UeA9nTJF2BzDc/dqJdLhLjQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(107886003)(2616005)(36756003)(71200400001)(66446008)(26005)(31696002)(83380400001)(66556008)(6512007)(66946007)(64756008)(508600001)(38100700002)(186003)(91956017)(122000001)(66476007)(76116006)(316002)(54906003)(53546011)(8936002)(6506007)(38070700005)(6486002)(4326008)(86362001)(31686004)(7416002)(110136005)(5660300002)(2906002)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TE5pZnU0NTN3VEo0eDJvVWROTDU5eU8yRXFzeVlsUUQxS1hyOFkrWGYyWmxP?=
 =?utf-8?B?RU9KQ093a2U3Y2hvY1AzU1U4YjRmZjA1QXdRMUZRUEsxQnRKQy9HZ2Q4eCs3?=
 =?utf-8?B?YjZhaEdaTmVLeWR1UVBsekhiVlN4cnk5WmhwUU1IcmtRVmlONlJEN21XVDY1?=
 =?utf-8?B?SDhpdEdMMEZXRnZhVGk5dnVBVWZPRmV3UEZiRzcvL2xjVCszL2hRMVJQRjRF?=
 =?utf-8?B?b3E1bzBOUXFMS1hSVmJEdkd5WGI1TjVrNkUxbjlXaEhKb0p5eUgxK2RMdE95?=
 =?utf-8?B?L3dUclgySDdFOWpydmJ3TXJCWWVFL01jd0ljK0N2WS9zeVlsekZaVGt6VTRl?=
 =?utf-8?B?cmplYTJ0bWMxQlVPb0ZjNE5wdE42SVBuN2Q3d0Y1TldFQk5jL0pxMC9MSmd2?=
 =?utf-8?B?WHUvWHZ0Q1dvTFZDeVJRN0lkYXpSaHZxL2ExTjlzOTVDVUxoOXJLNzlqN2tI?=
 =?utf-8?B?RXR3V3QvSW9ZWVdvWnJ6TjBXcElNNmJwY1piT1RNcWFUZ1pZbDg1SGs1Qnh3?=
 =?utf-8?B?YUozbHZxdVVrcFZSUlRHU0pyR3VadUUrbDQ1MENIemd0UEdMVktBKzA4Tm8w?=
 =?utf-8?B?RnN4aXQwaVpuSmV2VVdueTdXczFaZ3dmS1A4OGVmN2V5S2xWeVA1TFdyZ1kx?=
 =?utf-8?B?aGFnRW1ObUFIcGg0dkRkUWtFeHBvNDByNTJrNi9rM0UxR3paUDJob2RKSi94?=
 =?utf-8?B?akkrUm9jc2NxNzlJNnRvYUFFTEk5MTVZVW1PZXYvVnJ3QmF6UTFYYlZCOHpG?=
 =?utf-8?B?VkpCaTc1MVFZS0JFODZsWVZXYUtiQ2p1NHl0aVlUWmJ3UVlKaVNKM0MwNDFI?=
 =?utf-8?B?SXVxYzZiVlk4eGtJUktnRkdjaHNDMTQ4NDR6YkJMbTZ4cGhScUs4TEVDcHNy?=
 =?utf-8?B?UHNreGx5Q244UEIyeHNxQmRCdmxQQ29ZclZTVGVmTFhDTllwbStvak5lV3dp?=
 =?utf-8?B?blh0cTBic3pCUEJ6VUtlQ3lYTlY3YlhFQWZLZVV0djQrcFZ6eC9lZ1BFM1NK?=
 =?utf-8?B?WFBSOUlTNHQ4RmJ5R1BKYzZWY2lNZEFkQUYreEpZK3hxVnJ4dmhOWFdHSGs4?=
 =?utf-8?B?SFYvc1ArUDJEL3RwOTJOMDlpZjgrTUFjd1dsY2JxeGdVNXB1TU12SVlaTW5U?=
 =?utf-8?B?dWZYbUJXSDl1dVJSSFV0cmpmdkJOL01rYUM5OE0vbnVNRXpPSlFqQ1NnZFBj?=
 =?utf-8?B?SmxtT09tMnFwY0NnSnhLZDVpVWRsTXFYc3lHRDhyWXEvZW41eE1kNHU4VHVv?=
 =?utf-8?B?NXdsd2x0M2hnQVFveW5xNVY5NW1nSWc2SmV4UG9aNmxlbnZRZW8yNFQrNVRY?=
 =?utf-8?B?TUJUVmg4bzc1OTRNK0d0a0c1Rm83c2xoQlhOWXd2a1hqR3RZd3psaGMxSjNl?=
 =?utf-8?B?a2VoK0tuME91VzRUaStjakVRL2dnbUhiR3AxU3BVNFk1TU9TbGcrT1h6emla?=
 =?utf-8?B?QXpybUtZOWtvTExTbCtWMWtCVk9EYWhQR3ZBdFYxc0NWdHFtZDdoc2lVMWtO?=
 =?utf-8?B?ZEI0MmZxVzlrakJqMVE1cHI0Nkg1OUNCR2FqdklsRC9HVSs1NXJvc3RleGVo?=
 =?utf-8?B?dlpEcWZPTm1UaCszY0YwdWxHa3cvRUdYYVhHbktnVTdhYkorOGdGb3Z2UkRF?=
 =?utf-8?B?M0d2YUFlMEU3b0pDdFRJRHN6L092WDduM1Q3VndrMkhmWm4zV0UxSUZqZzZz?=
 =?utf-8?B?a0M0UDRUMFlBWDBHelhmRFFlNkJLZFdpdWFPZ2xadFZNR21HcW1zRFFYNE1T?=
 =?utf-8?B?RGR2YU9nS3FucTRhUDAwaGcxdFJsVk9LdWJ0SzBMQWJZMzc0TEFxdnh1ZExZ?=
 =?utf-8?B?aVNXdVV3WnFOblhKOC9RdkQyL1l5UlVsRlZKRTRBVHpINFp0cFNnMEtrYnkz?=
 =?utf-8?B?N2JIMlZJT1RBWHRldWx3bm4yaGNUY0hkbEQyYXZuWHdidUhNTWk4aEJ6T3hp?=
 =?utf-8?B?NXlxRlpaVU9WRTRhWDVHS3Z6RG9YMG5kWlJkYkdsR0JqNGE2bmE3MDhjZ1Q5?=
 =?utf-8?B?dyt3eGdSdzZnWm5kTHJjKy9GbEhQNHRPN2xGSTB3Rlg4OGJSUGJGUEpINUpQ?=
 =?utf-8?B?KzdLK0tRYmdlcjdWNFhmQm1OVHlHczl4UnpYSkp1RmZIdEZWbXhHK2RTeTNa?=
 =?utf-8?B?aHJWSU14aldWNHdVN0FUOVNGSVplL2RZMjQ4enUrTUE3Mm9jSVpwT3J0aysw?=
 =?utf-8?B?ZEJ4djg5bWFNeTZwVFlmeXROcGtBY0E2V3hrOE1kdks4cWdZTm1nWnBLU0lV?=
 =?utf-8?B?MnBPMk8wVjh2MHdEaE1HalJaYUZ3PT0=?=
Content-ID: <E1982148750DC1419017D380681B11AE@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5031e1c4-c722-4734-bb6f-08d99b02420d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2021 17:33:44.8946 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O24QgqDoxrUuvRdu1ZlfrC43Ph0GBqY7/k+HGr1M2Svc+uOruccXZGEuomwJjQFtglz3iGH1PezMWD3Ri6NA0Kl+E5X3U7i/aZZxTW8L1iI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211029_103349_251012_664A8163 
X-CRM114-Status: GOOD (  12.23  )
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
Cc: macromorgan@hotmail.com, jaimeliao@mxic.com.tw, richard@nod.at,
 esben@geanix.com, linux@rasmusvillemoes.dk, knaerzche@gmail.com,
 Nicolas.Ferre@microchip.com, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, code@reto-schneider.ch,
 miquel.raynal@bootlin.com, heiko.thiery@gmail.com, sr@denx.de,
 mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 10/29/21 8:26 PM, Tudor Ambarus wrote:
> Get rid of the static initialization of the flash parameters and
> init them when parsing SFDP.
> Generated a 256 Kbyte random data and did an erase, write, read back
> and compare test. The flash uses for reads SPINOR_OP_READ_1_4_4_4B 0xec,
> for erases SPINOR_OP_BE_4K_4B 0x21, and for writes SPINOR_OP_PP_4B 0x12.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/jedec_id
9d6019
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/manufacturer
issi
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/partname
is25lp256
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/sfdp > sfdp-issi
root@sama5d2-xplained:~# hexdump sfdp-issi 
0000000 4653 5044 0106 ff01 0600 1001 0030 ff00
0000010 059d 0301 0080 0200 ffff ffff ffff ffff
0000020 ffff ffff ffff ffff ffff ffff ffff ffff
0000030 20e5 fff9 ffff 0fff eb44 6b08 3b08 bb80
0000040 fffe ffff ffff ff00 ffff eb44 200c 520f
0000050 d810 ff00 4a23 00c9 d882 ce11 cdcc 4668
0000060 757a 757a aef7 5cd5 424a ff2c 30f0 a9f2
0000070 ffff ffff ffff ffff ffff ffff ffff ffff
0000080 3600 2300 f99e 64c0 ef8f ffff          
000008c
>  drivers/mtd/spi-nor/issi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
