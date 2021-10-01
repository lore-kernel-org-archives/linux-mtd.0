Return-Path: <SRS0=UGcd=OV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 022A4C433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Oct 2021 12:31:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C53306124B
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Oct 2021 12:31:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C53306124B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=noDfMJWwE4VrKExpLSAPj4dT8Pgdu0V7RuwgkAEN590=; b=FyTlluy/nk8cXE
	LwVD9eGfpmg8clu3gcCiQx79+OkiK/YADI3ERmn1B0K7Tz7wjOuHaST4iLAndWHFr3BgpsjLKg9AX
	KqxIGCRGoEkO8Xk0AmSLrcXmFq/1LamciF4d/ZDANUGEbRhMLjbrqeapP1JZ7FTcAAx1xBbocoNLW
	fVmGaRV3ZesPWbqGl5Z6RZVfT8LyGm9t2ecfNy7V6ICWE0TzYAcYRYcZQI2vaYKj2QFpWK8gFPAqv
	OtHzxNSFhEQUaJl+z7WJn+jON0hzyetFiQdMOQDQgN5tNe1Z6zFWE9nVO/xwche5ydnUJOG4zzJb9
	Pgn6QwZCvBwpoFceVjkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWHh0-000K3x-0c; Fri, 01 Oct 2021 12:31:10 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWHgw-000K3C-Au; Fri, 01 Oct 2021 12:31:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1633091466; x=1664627466;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=uNeWR+MpLjLBz50/kpIfDJHA6Yz4ZJ9f4HMo44l046Q=;
 b=JSJ+GTdfn87FpSlKjjnek+QjmcmGS0VWsw8twIYlFpt/bbG4A+ZDOS25
 J/5Cq/WBgD/lD2lvT3FN2l4LqSupwWfMzc0yZoYZ4GD13nQ8TWBMTsRim
 Y2GNVwbDplNCAoVOR3dWEzxg5ddZps9WsMQWfr/oVS/voKXPrPT1TS4ZM
 AjO8AIBYVJ480Gnxp9KoACXGvVwdc32ublVOjcsKJo19KuzbwXxC7dopf
 O7GRVCC98QioiOkjH6COu3/W1cBgCWcTidse9XLxkM2BmMFwcn9PMp2rE
 97O2hRQeAYbrvDQvv6/YfgjAHHdLzmbkRXC9+eUSLkP6Qt4Aj3RQhmm1c Q==;
IronPort-SDR: NbVGefAFSe0Igom/EqnHkPG0sGX1SZev2mMRxC/go8nOvAEK4yYrAKZ6pIRgaXHfM2vVsbC6Kx
 iu6Gkng866GRAwjNu7lfHpmcyYHpCMsveHmBvn4gLDh7nGTxp8Y6/PSze7PAQF9IbMBO9uchkT
 0DMUXYPWfRGwIGGZFa+zPzv6WU7Jzqez+TWRL/mtwub0Gmyr16x1YHL2esIjTFjxetQ8MTaCqv
 Uj8xwq9l3YKgW/z4yP9QunR3eKarKfRjO/m963VyMBHjjex+emupvT/YgPbbMlvg+Cz9SgxBaM
 niG9x6pwnQuaXaEEIlQvLeH6
X-IronPort-AV: E=Sophos;i="5.85,339,1624345200"; d="scan'208";a="138704866"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Oct 2021 05:31:05 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 1 Oct 2021 05:31:05 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14 via Frontend Transport; Fri, 1 Oct 2021 05:31:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ej0yYmIaBTew8Qkk/oNPhBIOB1I5mET4tB/bH8g/XWKvCvRLJsIyz1PAh+FHIlnEqjJMhO6QLQi/+JaoMrW767yhueWVWeVo1UJY34uNQKTpsN519rzHie+ICjeDJfvKFi6kNBFuMuG8yd+9TZ8TLsx+yn1cX+fw0l0MYut/Q9p/e1abnNJaZWwAWSRKBc2ZXVmnUnJVdHKzIDc8ZA6GRGHN2XYibPqDn18M9THCQn3FTDHfJ6FVZpm3M0zEOlAGwnLCS5Qve7gARJJXdqz6YXQ9zBC1giZ4mfG3cJlhO/dlYHNpRpXQ1qAh4MaHkadBOCzZHEVdviDxslWJfhKHPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uNeWR+MpLjLBz50/kpIfDJHA6Yz4ZJ9f4HMo44l046Q=;
 b=aZYZzsCoODY83BkQPNMxUQIdu4pEyNISdTcc2ZDRWsurqY5TS+UGS0Gq9HPkGhQqaFo+rsOX1/muZ34roqFZe1oIIZjHOWctqA9gHZ+UkOI4TMzpuOwPBCT2o4ZMOOCklfEJ4xiNccniOKQ0A02sfHXR4yRsDVVzNMf6oSp6KnFO7K+g6R75VjDzMjRwB2MoYavi/hOGQAlerZNSrWZyuhQQNn3KGRbpQP8rz+SLGPe1udYvUikw4zscshEEKXyVcjhJ8AWpTSa6Oi6tdeg3U0u9GkjOa/XrTz46u3W3wc/7kylsu52BP+/dIs6zUCwApqETW3YFt9pdmD8snuyNMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uNeWR+MpLjLBz50/kpIfDJHA6Yz4ZJ9f4HMo44l046Q=;
 b=E7WfDHdwNQqJigsp4X4aPourXqKQoBuog5C1qtpTO1glvBIVVP3xKeBT6P642XHR89lpkQzAcxOllMNFEprlzG89o7tZk5pdOlLrICFXg8hupPxk1Q/1bbMkyEn5TH6/Sblrhssf9d12ejI9zzrRW4cdZsS8VU2QQnP4t+9E8P0=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA2PR11MB4828.namprd11.prod.outlook.com (2603:10b6:806:110::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.17; Fri, 1 Oct
 2021 12:31:03 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::a496:d4af:df74:5213]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::a496:d4af:df74:5213%9]) with mapi id 15.20.4566.019; Fri, 1 Oct 2021
 12:31:03 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>
Subject: Re: [PATCH v2 15/35] mtd: spi-nor: core: Call
 spi_nor_post_sfdp_fixups() only when SFDP is defined
Thread-Topic: [PATCH v2 15/35] mtd: spi-nor: core: Call
 spi_nor_post_sfdp_fixups() only when SFDP is defined
Thread-Index: AQHXtsAy8DxwNdxsDEGCF4dejzIaOA==
Date: Fri, 1 Oct 2021 12:31:03 +0000
Message-ID: <ef9b5335-413c-5bd8-2987-df95c73f6b4f@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-16-tudor.ambarus@microchip.com>
 <20210816193137.xyb4v4edgyge3k54@ti.com>
In-Reply-To: <20210816193137.xyb4v4edgyge3k54@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b3dac648-cce1-4702-69c9-08d984d75565
x-ms-traffictypediagnostic: SA2PR11MB4828:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA2PR11MB4828C5D288B65808299DCD80F0AB9@SA2PR11MB4828.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2dJ65GI7ZL7wrbcA+kfW/vQAKbhZBEndKLLNnsMZH6qh/l+B+hvI1+8RPegdQy1X5c1icBbmkYEwKaLX4lZueP5tEqxIkkovHLWjl0Cg4rtfAtjZLFCxHzc4RiHEJf3k7nfxXoI8T6rqUWK1AqNmWVRU4A2IxoK8kqZz7ndmRKKF24iEkoBuWSbuOxdCM2RGmtN4kmrUZYIz/KwJifqWCNbhUWuVeAUzcFBRe2MtkJGVPNyI94lrVjXuT8BlE+bd1ul4BLUH00s5IQbOr47TaIFn572OSdHgc2MowGMQC8ZzvDKyMpqYTcD+fS8pZm29pZaT9dqH81sCfzHoVe1uXnSsreLnS3KJcBLg18hv7A+LKROsfGwysItbFpsvLMj3G+yHXTsYuEO7ugR5ndz7Dn9hl6gLSPpW44nw5Ris8G2asLeVJUPpQGNcvezUG9lAU+YkIKiVN971jdGt6cDYNTuzE728bcIeqeYHEl3PZQ/2/9qM5s7is4PWk9vjA9vaRjL2WheQEv5dvxS93eZiV71zvyfqAtmBOWnGrAK4QXsTqTF/7PX+Gs3agA6JRI3wTGpV+hJR78ucbmd+N0EN9UzFwwxHbEYDt9i6noXb8RJZWqUrF6pINhAGem+BU+faoKyWyw+5D+MtMfbgd0MqNMsQtp2RHICPg1nJXJ0hzHGNjtTKqR2OCXeo6Aph8FMZt7guaoKvElnZVg1UhJmNFSfvDhbrHzdvXwe93edS7+VMZ1j3gL33RI8c+/ut6ALTGARqZzHi3xbIKTQxmNkn4Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(122000001)(53546011)(54906003)(91956017)(66556008)(66476007)(6506007)(66446008)(76116006)(107886003)(316002)(38100700002)(64756008)(2616005)(4326008)(26005)(186003)(6916009)(6486002)(38070700005)(66946007)(31686004)(86362001)(71200400001)(6512007)(8936002)(7416002)(31696002)(5660300002)(2906002)(36756003)(508600001)(8676002)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y2lrUFBxRUVNQlVpY0dwTVBOV0hLbDQ5d3pMNmZiSXNsa2NHdzBieWl6ZXhD?=
 =?utf-8?B?ZmJ3VXM2a1VNV1VSODhPSjBFdWdkMUFNdVF3L2xPYTVvL01DajFtN2tITU90?=
 =?utf-8?B?bUNvbTVSRjRUcjR1WFdoc1F6ZnQrcWkraWZlUmRDb0s0ek10eTA3MXpwKzkw?=
 =?utf-8?B?SmtoSUZFaUlRVmFaaGMzY2VQK28wS25FMUtnQ0JaVUNiUTN6Q3pTS0RvaVlX?=
 =?utf-8?B?QjdCbTR0a0lDN28vQzJSNXhSd1NUTUYvcmtjM3lKZTBYRkVyWWpXZTMzVEoz?=
 =?utf-8?B?VG9nazIvMjBONmR2SWNpNTBEL1F3UGg2OWM4YmJZb2ZHM3ZZTEVPMHUybTZB?=
 =?utf-8?B?RGRnbmkwZGx0OTRxY3lYVzB3aVFLeldCVjdQLzVxdUcwdE1nWmZDbytkYSs3?=
 =?utf-8?B?UzV2WTBKTEtLdkZXaS9oNnBmN0wrdVQzOVQyYTZzSDhRc1llbXZsNVpnblly?=
 =?utf-8?B?YnNZcVFYOXUxYjFCc1VlWHUyOUEvdkNHdFY0eFVtbkxzU3U1WDVBYXFwOTkw?=
 =?utf-8?B?ZlhXem5iOE1UOG1Cb2dRUEJWMEdSQVpTQXd4bitKaTZwUmgzTlEwamZVbEJT?=
 =?utf-8?B?TEYzbG93SGRwRHVYY0FDQ0ltN1gyOGVlazMzSXd1OGRZVUhiRjJRQ3ZkS25u?=
 =?utf-8?B?eWNaSVczL0UvRlphZm5TNEV0YzlWQlZLRHVYaTViQUcvUWRIaVFnUk5kcTNH?=
 =?utf-8?B?bEptTmtuZUVraDdLT2hJZFVKOWFTcjhFeXZxa01QSG1HeDFJM3NBWW1DRjZ2?=
 =?utf-8?B?V0xCc2dHbzBoZzI4a2pReGxlNnZxemI4TWp4SHJ4aDNTUVZsbjBYajNTdFlu?=
 =?utf-8?B?cDJkMlR5alpBcXM5Slo1TUJFNEUxckk3SmFDOFZmS1lySThQTGtyR2hDcG9C?=
 =?utf-8?B?YlB0cFgzTk53L1ljYTgrcm9qUEdzVVE1Tm5MSGxuSjgwVkZiano0S05tWjVS?=
 =?utf-8?B?QzhGWFpPSjZrWHk1ZnV6c2hjWGNDYzhjTnZWVFJkdVFBV0MyN1ZzSDlUZ1hR?=
 =?utf-8?B?Vzh2YytUV1ZWdXFOendsTGFsUlg3bW9lWnp3MEM2bXpidGVDNDVLVFF0Mm1m?=
 =?utf-8?B?YmhIVDR6SlpxZFptYlN6UXE5ajVTVjh2UEJZVk4yN3UydDJFOG5MUTUybnZu?=
 =?utf-8?B?TEdCZmVUV3NVSnhPOVo1c0EybzhqQlJia1NhSVZrbmcybmFtV05Lb0Nrb1VJ?=
 =?utf-8?B?NDVEUlNRWnJPZHNsUTdFYUxNalIzcnBReENPNlhtMVN2NU90VnpEazhMc3Ix?=
 =?utf-8?B?bWhJYW1BUnZuNGdkb25yL3FXWFBTZDhOL25UQ2o5WmVnVEtuRENSalVQNTlu?=
 =?utf-8?B?cUJBOTlyTXBTOXcvK0JwYzRUWS9HbStwZXExekJraGJ4eWp6d05vQU1kL0NM?=
 =?utf-8?B?V0dDMnRHWm83akxGVWZua3pydmhvTUNOU0R5N1lqbDNZUFlHV0lpOUsrbENz?=
 =?utf-8?B?VG9oNERHVkt5ZHQ0UXVVOFE3elB1cEtubHVZVEcrK0VBUm1udjRTelh5VVg4?=
 =?utf-8?B?dXJEYmdVZTRweWdFR1gzcHFMeWtna1JnSmtNTDdHVmUydENJMU41LzROeEQ3?=
 =?utf-8?B?aytiTVAwa1JkTHdqd1VMcERmaGJsNXpzdFhnTG1vOWZQRXJnc1BrdE9VaUZY?=
 =?utf-8?B?amlCMlhDMjhTbzJHUHVhMDdLN2dLZmd4YnJxK0ZKMDJIaHRmdGtpbzl3aWsy?=
 =?utf-8?B?VnJJM0c5bjFTNEdKR0l5czFqNUVmYUdZbXF1bFdybW5uYzFmaU1XRFhXZVJQ?=
 =?utf-8?Q?Z6xv8YtSbPK/Mf5KMl2Q9iTPFuq7rXBTusDFZ8Q?=
Content-ID: <AF8621DA33F1E24396ADF91082CA680E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3dac648-cce1-4702-69c9-08d984d75565
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2021 12:31:03.4324 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7FRFrMyFeSeBz622UC2Rs9OHkUXBYedret+9/JcxrL/bvtXXLQmdEs4QvqebUZS0j/v4M0zmDbaL01wuyNVPwNxDgEjVLS3mBujQGHhjYZM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4828
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211001_053106_415467_760F4CAB 
X-CRM114-Status: GOOD (  27.78  )
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, Nicolas.Ferre@microchip.com, michael@walle.cc,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 8/16/21 10:31 PM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 27/07/21 07:52AM, Tudor Ambarus wrote:
>> spi_nor_post_sfdp_fixups() was called even when there were no SFDP
>> tables defined and the function name was misleading.
>>
>> We introduced the late_init() hook which is used to tweak various
>> parameters that could not be extracted by other means, i.e. when
>> parameters are not defined in the JESD216 SFDP standard, or when
>> the flash_info flags are incomplete.
>>
>> Use spi_nor_post_sfdp_fixups() just to fix SFDP data. post_sfdp()
>> hook is as of now used just by s28hs512t, mt35xu512aba, and both
>> support SFDP, there's no functional change with this patch.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>> ---
>>  drivers/mtd/spi-nor/core.c | 66 +++++++++++++++++---------------------
>>  1 file changed, 29 insertions(+), 37 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index 15ccc9994215..1f38fa8ab2fa 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -2509,6 +2509,25 @@ static void spi_nor_manufacturer_init_params(struct spi_nor *nor)
>>               nor->info->fixups->default_init(nor);
>>  }
>>
>> +/**
>> + * spi_nor_post_sfdp_fixups() - Updates the flash's parameters and settings
>> + * after SFDP has been parsed.
>> + * @nor:     pointer to a 'struct spi_nor'
>> + *
>> + * Typically used to tweak various parameters that could not be extracted by
>> + * other means (i.e. when information provided by the SFDP tables are
>> + * incomplete or wrong).
> 
> Do we want to keep the "incomplete" here? Wouldn't incomplete
> information (like missing parameter tables) be more suited for
> late_init()?
> 

will update, thanks

>> + */
>> +static void spi_nor_post_sfdp_fixups(struct spi_nor *nor)
>> +{
>> +     if (nor->manufacturer && nor->manufacturer->fixups &&
>> +         nor->manufacturer->fixups->post_sfdp)
>> +             nor->manufacturer->fixups->post_sfdp(nor);
>> +
>> +     if (nor->info->fixups && nor->info->fixups->post_sfdp)
>> +             nor->info->fixups->post_sfdp(nor);
>> +}
>> +
>>  /**
>>   * spi_nor_sfdp_init_params() - Initialize the flash's parameters and settings
>>   * based on JESD216 SFDP standard.
>> @@ -2523,11 +2542,12 @@ static void spi_nor_sfdp_init_params(struct spi_nor *nor)
>>
>>       memcpy(&sfdp_params, nor->params, sizeof(sfdp_params));
>>
>> -     if (spi_nor_parse_sfdp(nor)) {
>> -             memcpy(nor->params, &sfdp_params, sizeof(*nor->params));
>> -             nor->addr_width = 0;
>> -             nor->flags &= ~SNOR_F_4B_OPCODES;
>> -     }
>> +     if (!spi_nor_parse_sfdp(nor))
>> +             return spi_nor_post_sfdp_fixups(nor);
> 
> Huh. I didn't know you could do return foo() in a void function if foo()
> is also void. Dunno how I feel about this though. It definitely confused
> me for a bit.
> 
>> +
>> +     memcpy(nor->params, &sfdp_params, sizeof(*nor->params));
>> +     nor->addr_width = 0;
>> +     nor->flags &= ~SNOR_F_4B_OPCODES;
> 
> I feel like the new flow makes these 3 lines more confusing. Earlier,
> these were called under if (spi_nor_parse_sfdp()) so it was a bit easier
> to make the connection that these are undoing the changes performed by
> that function. Now it is a little harder to spot. I think a comment is
> in order.
> 

I'll revisit this when reaching patch 27/35.

cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
