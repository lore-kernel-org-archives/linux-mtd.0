Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E83CEC433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Mar 2022 16:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZrPENXAt2C6AjktHfZZ+6xNcK0HvaGb3fUk5CI5lT7E=; b=KqJK3TQotkyFDf
	GdJnDODb9CZJP4gqDn0GP0alrst6JSC8MBl7P9cypefxxyC0+WPC2hmcgqOWDjHsCKXSdSQmLJFp4
	5Ns2v56QWsG0aHgIz6M3j2jAa3oJx39QDH9+AjJaBj9ZFhMnqpijk8iUS7tUt9/QSu4HO64c8oQLk
	p6X+jgqmF4RAHxRS135U1Hg7jvFf+9zTlFdNeBv7eSr65fxvg0FWzncDVNhHINkOKrdcFO1vGnkyx
	z65hgQd8BMEVPATnKd4nIdw6cHN0SQ/XEHJqq2vB/qzAlN6fHob/v8N8q/z2+lKQlP8T2gcBWNRsK
	G7HtnYqdgeXTlmnzoICg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPoBW-0077Lx-UG; Thu, 03 Mar 2022 16:20:11 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPo4U-0074U7-8Y; Thu, 03 Mar 2022 16:12:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646323973; x=1677859973;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=iR+VyUd5j3ZXIqWNsFJQbA/muPdYqP8a1XDDpJqS9Lk=;
 b=uyqGJDPs0IGv4b4o5mo0lMjwUZ1DbfpOzXFKe+UBXcZtiRBFSQFJbANw
 7FvCe4Bmc5C/8LU+B7gwMp3MCSn6nfX1ALUzn5RQ9i5Sm6cGRPus7sZI/
 QnnKkK6n0Rv0E+jlzJmAd1csYikSjjQ8N/pYx9f2BSlLzWRqSmxYxxVEw
 KnZCFi80r7su2iPwwbGxKW6PbJvOkUzXVjwuPs3lI7fMVP9cKTz186jGx
 hFgbKqS4ZgnPDf73FMDrkJDUJ2NHKgO/KPgJNDfoxhxK9eNqGWAQhsQOQ
 w8UpSPfFD35v/uGtAwFQaJDQhhF3LVIXAUmeFwsqteGrIz018OJtTzfdH w==;
X-IronPort-AV: E=Sophos;i="5.90,151,1643698800"; d="scan'208";a="164407271"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 Mar 2022 09:12:53 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 3 Mar 2022 09:12:53 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Thu, 3 Mar 2022 09:12:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F1B8heLCA+XN5/l/CFd5+IXWBGOMmrXWJfRWX+vMCDMzp1JDQZGcDikcq8Kufd4fddEnSlSIhzZc6w2NtxOk37Z0pWXF0gumN7zWTsuK89x1vrcmsANXHLi41OqQG2T6rRlIb/PMgewmkjbAwMHY5MNm0JbbcwaUO24qmWAdRmlKIpHUQGjwHtdW5wKiBt28ds+6MbZKzYr0ze9rzATuG1SVjsBPIDwoDrpHpDGk0dcIfX/qNaD9JJkLWDa7adtUQII4eShUXTJlstVwc9zRVhN0jRGwtuhy80AxX0xSKkKEdUFaFL8AEHIUb2OX/QPpy0jr3zmBo95GzWu9jTh5/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iR+VyUd5j3ZXIqWNsFJQbA/muPdYqP8a1XDDpJqS9Lk=;
 b=bswMkKbRtbFXvoKmHg9Zp3KoEQm3EKeWH+Nbgv24RnOPkqFF68KDvVuaS1IGeOfr72kMfm7VnS26GRN2VRxpQcSH2grRbmee6YFhG0cSwBDs4iif1ExRZfkY8+J40bvtq390Bj/IuSuBvVl8Zcr/2Cs3rJquYHULTKfjYK2YUsEaQQUeZHPQ8RofbQ+J4xjUqhXpJwNL4UieaOuTG1yk0YdVivZEpt74kUTi7LZxEjqTHG8fW1HpwVxK9KjXIxiLs04/3wxIndF8IHeTbVNFtlFDQdF/mvrXku20+vrpiON1Bzi4sgeWPYPmnOVoXnSUMlQN8xHDn8FQJeQ7sNcQMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iR+VyUd5j3ZXIqWNsFJQbA/muPdYqP8a1XDDpJqS9Lk=;
 b=kiShJmwuiiawFzo8uOrlgV+0Ygu7jYcbr0V2cMxGRgJrjs0CvmpL84HMFh+X62vx+L07ivERf3T+4/0bkzWef/cezSNV648b8hmlZRj4Nm4rT5Yv+0B3l7pwDaun/hg/RM8FdOkTcoWwzI1LQxzWk7YeIt/lXrk//RtdjyYN+hw=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by CY4PR1101MB2232.namprd11.prod.outlook.com (2603:10b6:910:21::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Thu, 3 Mar
 2022 16:12:48 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9%6]) with mapi id 15.20.5038.015; Thu, 3 Mar 2022
 16:12:48 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>
Subject: Re: [PATCH v4 5/6] mtd: spi-nor: Introduce Manufacturer ID collisions
 driver
Thread-Topic: [PATCH v4 5/6] mtd: spi-nor: Introduce Manufacturer ID
 collisions driver
Thread-Index: AQHYLxmFC38uZpmRskyb6mPIBOt4WA==
Date: Thu, 3 Mar 2022 16:12:48 +0000
Message-ID: <f1e8d9d1-04a3-fb8e-5f16-7121b4d368a1@microchip.com>
References: <20220228134505.203270-1-tudor.ambarus@microchip.com>
 <20220228134505.203270-6-tudor.ambarus@microchip.com>
 <0edfa6e267995a127181173496b471ea@walle.cc>
In-Reply-To: <0edfa6e267995a127181173496b471ea@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c4936b93-a44d-4e20-edc9-08d9fd30a8d3
x-ms-traffictypediagnostic: CY4PR1101MB2232:EE_
x-microsoft-antispam-prvs: <CY4PR1101MB2232939A39D380C3CCBAED72F0049@CY4PR1101MB2232.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0TUde5Gph7pDlxQzqTPMahYMsmB3gppX2r74vORoDBKAwAPmkwMrhRz0Re5e5ScefsygbSaDTVxcjzBAyNisptAkzYjvEs4oXIU+BsXz7THEtgfNoiJGS51H/GU35dH5wYY2TeSJCC/XvgPRaVzh5NslAQkk2v0fuOu/rByubUXOsaodOinMd3N0bW4IIS2Ce7qtpByYiTBzabzBtfHk0P/lH5VpqTajWP+7D1hRIXc2zpi9w5zmwGLNZSCMFmJ7bw7IfkqbjWrmpgXPM6REzs1efkHbZcdEVSN/m1e2nS+jUgIVDmPkVqmNkWJIMUArQHciPUqOcckITO6S5ktCB7QOekYvtu1Osk34Qs361o4XSFA2Ldb60tjrzLkAPgkz4VdThcMcPVlrWIOOPjgnJZZGnESPZEpLA3zz/qqLxNfx35G/e7ZItOYt+zrSg+A9mQWhj10RRO8Y4+lUsLh3fH8svakTupXQRyf0wZz3gXNeyfCQZl62veeqBYpH2LusEMWlpoT4e3vYteezvVWGs4xF7pY2W3UM4rNt+rbjPnMtAv8gCvssoFbBaaBcfbnT8+/X80y7x2lxRDe3a+Okq89NvW+KNGF/64uHha2eeyJwgHq/rmA6zjVM1292k5OPr5gW6TlrANmyPPYFS2ueACAOzYE4Iwxpkc2QleK3XBkum1ZEvQAh227s1gpGICelhIeUAWvVUwjs28Mk9yfwirJtvAHrlZGv/GQStE+bUZ80FfvMDxO9k8/PZxqirP5eObaqWpG+rwrKyrFz/ikziA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6486002)(508600001)(8676002)(36756003)(71200400001)(53546011)(6506007)(316002)(6916009)(54906003)(122000001)(91956017)(64756008)(66446008)(66476007)(83380400001)(4326008)(66556008)(66946007)(76116006)(38100700002)(8936002)(107886003)(6512007)(38070700005)(31686004)(186003)(26005)(86362001)(31696002)(2616005)(2906002)(7416002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z3ZQck9maEgrQ3pzYUVwQnFjamlxYjdCaG9LUEp4YjJCZDFhNTRaMDJaSW9z?=
 =?utf-8?B?eVdWN043a05INVFuMkxOWjVlLzdaenhoVUdGeDRibHlkTW50a1laWEY2OEo2?=
 =?utf-8?B?ZFlnbERlWWRtWnc5UW9VYmdNcGNqcVl1SmJtQU4rclpDaFk2cW9PdXA3Uk9z?=
 =?utf-8?B?bDlxMDRlay9CeTArcGVpeTI1d2ZqbEVrdjJsdEUzVE5EN2ZkTkwvcHZHOTNL?=
 =?utf-8?B?R294WEs4ajkyN0hDZ1FzQk9NdStacUxsbW14WEhHNEg5NWNDQ25BVmVpN0VZ?=
 =?utf-8?B?MVRKT1lVcFUyTThBcUpUMkVaNkpFVHpyMXcwYnVtamd5VzVORWJibTAwV3ky?=
 =?utf-8?B?Vm9kNUliMUNoVityZDlpZitxTFB3V01QY1EySGJ0V3ltVVkwK0MyU0NEVmZM?=
 =?utf-8?B?K0FFTDlvbEVVRlg5RHFFTUJaTThjYUZTd2VaNWIyVCtKTlhnRjRnVnZFL0pa?=
 =?utf-8?B?dTJvTEhlbGQwQjdaVzZiL0h6QXN5Ym5uSERDTk5PT1JnRzBYWVhLd0QzQ0xa?=
 =?utf-8?B?aVNES0pzamw1djRkM2J5bXN5YTh6SGVwZDhYdjhIMisrUWduVzYyclZNY2gy?=
 =?utf-8?B?Z1d0WUIyN0QxOXNvYkwveWpzTWxyMzk5UVI5SytyanNGNGExaUdnK2tkTHIx?=
 =?utf-8?B?MEk4VWU3bXlGdU9Bc3dRalVwSGtpVVphUytiOHN4cVpxcVhyTFNiSE1tYXg3?=
 =?utf-8?B?TTc0ZGtTMU5GMEtWaEg0d0RYeUdYMyt3S0hqdnZJeUpWbWRBWGh0SVlEK0lL?=
 =?utf-8?B?RVZuWXRhRWhybTRnYnpVRHRhTVg5OEVHSHVUK1JjNTBsajRCQkpMV0JTZXpa?=
 =?utf-8?B?aEZEWFNTZDYrWEd5NHN1dUFuMm1CTVpsamVzNzRTczRuSFM1dTE4czVHYjZE?=
 =?utf-8?B?ODd6UFFaVk5WOXdmT2srWlZ5cDMxei9EWjQ4YmVCdUZYMXRRSjk1cVdubHBr?=
 =?utf-8?B?alhDcU1lR1dkSjUyL1pScUI5QTcyWGFaM2pTcGJNSHAzMm1FMDJGeGJ1UTE4?=
 =?utf-8?B?bGFBOVdBNTNDWTJUNTIxUjBVOXc5TUorVnNjWXFuTXFUNkk3V0xuY1k2bWhL?=
 =?utf-8?B?RUp3bnBnRWNRVWVPM0FIS1FkNlpzQ0lqZG1sQ0ZWcWxXUEIyaitybjhheXlX?=
 =?utf-8?B?UW85M0gvRVBTQ2N6ZmM1N1NNQzFWTGxIcFhBWXNBS2NtdWZ1TEFES21vbVpC?=
 =?utf-8?B?Ti9Fd0s5YUNTMzFDRGF1Q2s5UDRia2dRK0U5amRlWHpXaGk4Wko0bkI4dTAv?=
 =?utf-8?B?MkZPWC9HS3VKaExzdSt5UmdXYmxnbGhuVXEwaW0zcitseks1VWhsWkt0ZE5q?=
 =?utf-8?B?WGNSdnppOHVmUFBvSVVwZngrMVBFb2FWVEwwRnpOTk9IakNneWVndjd0djhm?=
 =?utf-8?B?N3k5Q2x5eXIyTC9xazc5RFdpelZVRnVkTmM1NGMzOThPaVliMUUxN3NzL242?=
 =?utf-8?B?WitINDdLZVhzUVdoMFhiNUlOSGU0VEIwQ25JeENnMEIvb1VzU2pzeStCeXg3?=
 =?utf-8?B?QmduR1R2Q214MW41TE16WCsvYk1aN3BaWmJ2MHNRM2owRUZMeFFNQzl0VXhi?=
 =?utf-8?B?TWdBRzJpSXlCTVBFcXZlWVpjL3RhRTdhcjdTR1ZhK3RIN1YwSk9keUhlU096?=
 =?utf-8?B?UWhBTjh2Z0I1S2pJNUZ5VVlmOStMaWxGdDRDK0R4SHpXbEEvdGJFMXJ5bkJ3?=
 =?utf-8?B?Z3dxS0kwM1plWCtySENIUW1yVHRHWG05TzdXR0ZUMmxWWTNPZHNpVCtYTGgv?=
 =?utf-8?B?ZzlmTFdVUE9xN1VVcXFFWG4zR1dORzNxSzVOK2NFLzNUc0VhYVNXTDlHdmp0?=
 =?utf-8?B?M0ZOdjJVczhsa094d1FpQUZlVXJvL0V2dG1KcUp3S05UVlNicVBvL3J3TGpo?=
 =?utf-8?B?KzZFVzlrSmEwREVXMnlDNW9CeVB1MHJZd0Q2MUc0cHhneThzbHJ5dVZaeEQv?=
 =?utf-8?B?alYrNC9TRkNmMHVlTnNrYm1mWGRFN055N1hod1VCQUE2eGdvMUVja2VMcmFQ?=
 =?utf-8?B?UTUwMWx1Sm8vNzRJYnpLQSs3Q0s3YnFoTzVJVVlIUGpSS2R0VFNWbC8zZGhU?=
 =?utf-8?B?aVNzVFV4Z2l3ZWlFSy9rL2t3M3MyZWFLYUN1M3lmV3dZOUh2RzQrRVZ5TWNZ?=
 =?utf-8?B?Vk5jVHVXWDhXeU1LWFFHdkMxMzRneHpqVjN6YjNoS2RjRnV3bU9FTWFMTmp5?=
 =?utf-8?B?TlNMSWhTZEN0MzlydlRTd2ZtWXFiODJtOTUxOURUT01lbkFpMy9paHZkelFj?=
 =?utf-8?B?U1BsMFMveEFvTlRSRjhnU2J5RlZ3PT0=?=
Content-ID: <0F5E41BE47630C4D8D70FA66FE69CBE1@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4936b93-a44d-4e20-edc9-08d9fd30a8d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2022 16:12:48.1104 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vr3yNIADx7BZjnyoybRBWTutTAjGNIr0XZlCdirTW+DGff4WRfZFIZZuBSYFXGM2nYmEVATgrkJ85VoPOrfVUjtBlBWVQiV2XUh8zgEspEM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2232
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_081254_391318_F5A7A7AC 
X-CRM114-Status: GOOD (  22.18  )
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
Cc: sr@denx.de, vigneshr@ti.com, jaimeliao@mxic.com.tw, richard@nod.at,
 esben@geanix.com, linux@rasmusvillemoes.dk, knaerzche@gmail.com,
 Nicolas.Ferre@microchip.com, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, macromorgan@hotmail.com,
 miquel.raynal@bootlin.com, heiko.thiery@gmail.com, zhengxunli@mxic.com.tw,
 p.yadav@ti.com, mail@david-bauer.net, code@reto-schneider.ch
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMy8yLzIyIDAwOjE5LCBNaWNoYWVsIFdhbGxlIHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJTDog
RG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRo
ZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IEFtIDIwMjItMDItMjggMTQ6NDUsIHNjaHJpZWIgVHVk
b3IgQW1iYXJ1czoNCj4+IFNvbWUgbWFudWZhY3R1cmVycyBjb21wbGV0ZWx5IGlnbm9yZSB0aGUg
bWFudWZhY3R1cmVyJ3MgaWRlbnRpZmljYXRpb24NCj4+IGNvZGUNCj4+IHN0YW5kYXJkIChKRVAx
MDYpIGFuZCBkbyBub3QgZGVmaW5lIHRoZSBtYW51ZmFjdHVyZXIgSUQgY29udGludWF0aW9uDQo+
PiBzY2hlbWUuIFRoaXMgd2lsbCByZXN1bHQgaW4gbWFudWZhY3R1cmVyIElEIGNvbGxpc2lvbnMu
DQo+Pg0KPj4gQW4gYW4gZXhhbXBsZSwgSkVQMTA2QkEgcmVxdWlyZXMgQm95YSB0aGF0IGl0J3Mg
bWFudWZhY3R1cmVyIElEIHRvIGJlDQo+PiBwcmVjZWRlZCBieSA4IGNvbnRpbnVhdGlvbiBjb2Rl
cy4gQm95YSdzIGlkZW50aWZpY2F0aW9uIGNvZGUgbXVzdCBiZToNCj4+IDB4N2YsIDB4N2YsIDB4
N2YsIDB4N2YsIDB4N2YsIDB4N2YsIDB4N2YsIDB4N2YsIDB4NjguIEJ1dCBCb3lhIGlnbm9yZXMN
Cj4+IHRoZQ0KPj4gY29udGludWF0aW9uIHNjaGVtZSBhbmQgaXRzIElEIGNvbGxpZGVzIHdpdGgg
dGhlIG1hbnVmYWN0dXJlciBkZWZpbmVkDQo+PiBpbg0KPj4gYmFuayBvbmU6IENvbnZleCBDb21w
dXRlci4NCj4+DQo+PiBJbnRyb2R1Y2UgdGhlIG1hbnVmLWlkLWNvbGxpc2lvbnMgZHJpdmVyIGlu
IG9yZGVyIHRvIGFkZHJlc3MgSUQNCj4+IGNvbGxpc2lvbnMNCj4+IGJldHdlZW4gbWFudWZhY3R1
cmVycy4gZmxhc2hfaW5mbyBlbnRyaWVzIHdpbGwgYmUgYWRkZWQgaW4gYSBmaXJzdA0KPj4gY29t
ZSwNCj4+IGZpcnN0IHNlcnZlZCBtYW5uZXIuIERpZmZlcmVudGlhdGlvbiBiZXR3ZWVuIGZsYXNo
ZXMgd2lsbCBiZSBkb25lIGF0DQo+PiBydW50aW1lIGlmIHBvc3NpYmxlLiBXaGVyZSBydW50aW1l
IGRpZmZlcmVudGlhdGlvbiBpcyBub3QgcG9zc2libGUsIG5ldw0KPj4gY29tcGF0aWJsZXMgd2ls
bCBiZSBpbnRyb2R1Y2VkLCBidXQgdGhpcyB3aWxsIGJlIGRvbmUgYXMgYSBsYXN0IHJlc29ydC4N
Cj4+IEV2ZXJ5IG5ldyBmbGFzaCBhZGRpdGlvbiB0aGF0IGRlZmluZSB0aGUgU0ZEUCB0YWJsZXMs
IHNob3VsZCBkdW1wIGl0cw0KPj4gU0ZEUA0KPj4gdGFibGVzIGluIHRoZSBwYXRjaCdzIGNvbW1l
bnQgc2VjdGlvbiBiZWxvdyB0aGUgLS0tIGxpbmUsIHNvIHRoYXQgd2UNCj4+IGNhbg0KPj4gcmVm
ZXJlbmNlIGl0IGluIGNhc2Ugb2YgY29sbGlzaW9ucy4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBU
dWRvciBBbWJhcnVzIDx0dWRvci5hbWJhcnVzQG1pY3JvY2hpcC5jb20+DQo+PiAtLS0NCj4+IMKg
ZHJpdmVycy9tdGQvc3BpLW5vci9NYWtlZmlsZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzC
oCAxICsNCj4+IMKgZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmPCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfMKgIDMgKysrDQo+PiDCoGRyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5owqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxICsNCj4+IMKgZHJpdmVycy9tdGQvc3Bp
LW5vci9tYW51Zi1pZC1jb2xsaXNpb25zLmMgfCAzMiArKysrKysrKysrKysrKysrKysrKysrKw0K
Pj4gwqBkcml2ZXJzL210ZC9zcGktbm9yL3N5c2ZzLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHzCoCAyICstDQo+PiDCoGluY2x1ZGUvbGludXgvbXRkL3NwaS1ub3IuaMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfMKgIDYgKysrKy0NCj4+IMKgNiBmaWxlcyBjaGFuZ2VkLCA0MyBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgZHJp
dmVycy9tdGQvc3BpLW5vci9tYW51Zi1pZC1jb2xsaXNpb25zLmMNCj4+DQo+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9tdGQvc3BpLW5vci9NYWtlZmlsZQ0KPj4gYi9kcml2ZXJzL210ZC9zcGktbm9y
L01ha2VmaWxlDQo+PiBpbmRleCA2YjkwNGU0MzkzNzIuLjQ4NzYzZDEwZGFhZCAxMDA2NDQNCj4+
IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvTWFrZWZpbGUNCj4+ICsrKyBiL2RyaXZlcnMvbXRk
L3NwaS1ub3IvTWFrZWZpbGUNCj4+IEBAIC0xLDYgKzEsNyBAQA0KPj4gwqAjIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiBHUEwtMi4wDQo+Pg0KPj4gwqBzcGktbm9yLW9ianPCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCA6PSBjb3JlLm8gc2ZkcC5vIHN3cC5vIG90cC5vIHN5c2ZzLm8N
Cj4+ICtzcGktbm9yLW9ianPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCArPSBtYW51
Zi1pZC1jb2xsaXNpb25zLm8NCj4+IMKgc3BpLW5vci1vYmpzwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgKz0gYXRtZWwubw0KPj4gwqBzcGktbm9yLW9ianPCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCArPSBjYXRhbHlzdC5vDQo+PiDCoHNwaS1ub3Itb2Jqc8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICs9IGVvbi5vDQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9tdGQvc3BpLW5vci9jb3JlLmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYw0KPj4gaW5k
ZXggYWVmMDAxNTFjMTE2Li44MGQ2Y2U0MTEyMmEgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL210
ZC9zcGktbm9yL2NvcmUuYw0KPj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMNCj4+
IEBAIC0xNjEwLDYgKzE2MTAsNyBAQCBpbnQgc3BpX25vcl9zcjJfYml0N19xdWFkX2VuYWJsZShz
dHJ1Y3Qgc3BpX25vcg0KPj4gKm5vcikNCj4+IMKgfQ0KPj4NCj4+IMKgc3RhdGljIGNvbnN0IHN0
cnVjdCBzcGlfbm9yX21hbnVmYWN0dXJlciAqbWFudWZhY3R1cmVyc1tdID0gew0KPj4gK8KgwqDC
oMKgICZzcGlfbm9yX21hbnVmX2lkX2NvbGxpc2lvbnMsDQo+IA0KPiBJJ20gc3RpbGwgbm90IGNv
bnZpbmNlZCBpdCBzaG91bGQgYmUgdGhlIGZpcnN0IGVudHJ5IGhlcmUuIFdlIHdpbGwNCj4gcHV0
IG90aGVyIHZlbmRvcnMgYXQgYSBkaXNhZHZhbnRhZ2Ugd2hvIHBsYXkgZmFpci4gSSBkb3VidCB3
ZSB3aWxsDQo+IGFsd2F5cyBjaGVja2luZyBhbnkgbmV3IElEcyBmb3IgZHVwbGljYXRpb25zIC0g
b3Igc29tZSBtaWdodCBzbGlwDQo+IHRocm91Z2guIFB1dHRpbmcgaXQgYXMgdGhlIGxhc3QgZW50
cnkgd2lsbCBtYWtlIHN1cmUsIGxlZ2l0aW1hdGUNCj4gdXNlcnMgd2lsbCBhbHdheXMgY29tZSBm
aXJzdC4NCj4gDQo+IEVzcC4gYmVjYXVzZSB4bWMgcmV1c2VzIHZlbmRvciBpZCB3aG9zZSBmbGFz
aGVzIHdlIGFsc28gc3VwcG9ydA0KPiBtYWtpbmcgYSBjb2xsaXNpb24gdmVyeSBsaWtlbHkuIFVu
bGlrZSBib3lhIHdobyByZXVzZXMgImNvbnZleA0KPiBjb21wdXRlcnMiIHdoZXJlIHdlIHdpbGwg
cHJvYmFibHkgbmV2ZXIgc2VlIGFuIFNQSSBmbGFzaCBmcm9tLg0KDQpZZXMsIGJlaW5nIHRoZSBm
aXJzdCB3YXMgaW50ZW50aW9uYWwuIFRoZSByYXRpb25hbGUgaXMgdGhhdCBpZiBzb21lb25lDQph
ZGRzIGEgbWljcm9uIGFuZCBzZWVzIGFuIFhNQyBuYW1lIGl0J3MgY2xlYXIgdGhhdCBpdCdzIGEg
Y29sbGlzaW9uLA0Kc28gd2UgZ2V0IHRoZSBjaGFuY2UgdG8gZml4IGl0IGZyb20gdGhlIGZpcnN0
IGRheS4gQmV0dGVyIHRlc3QgY292ZXJhZ2UsDQplYXNpZXIgdG8gaWRlbnRpZnkgdGhlIGNvbGxp
c2lvbnMsIHRodXMgZWFzaWVyIHdvcmsgZm9yIG1haW50YWluZXJzLg0KQnV0IGF0IHRoZSBzYW1l
IHRpbWUgSUQgY29sbGlzaW9ucyBmb3IgbmV3IGZsYXNoIGFkZGl0aW9ucyBjYW4gYmUNCmlkZW50
aWZpZWQgYnkgYSBzaW1wbGUgZ3JlcCwgc28gSSB3aWxsIG5vdCBpbnNpc3QgaGVyZSBnaXZlbiB0
aGF0IGl0IGlzDQp0aGUgc2Vjb25kIHRpbWUgeW91IG1lbnRpb24gcHV0dGluZyB0aGUgY29sbGlz
aW9ucyBkcml2ZXIgdGhlIGxhc3QgaW4gdGhlDQphcnJheS4NCg0KPiANCj4gVGhhdCBiZWluZyBz
YWlkLiBJJ2QgYWxzbyBzdWdnZXN0IHRvIG9ubHkgYWxsb3cgZmxhc2hlcyB3aXRoDQo+IFNGRFAg
aGVyZSwgc28gd2UgaGF2ZSBhdCBsZWFzdCBzb21lIGNsdWUgdG8gZGlmZmVyZW50aWF0ZQ0KPiBi
ZXR3ZWVuIGZsYXNoZXMuIElmIHRoZXJlIHdpbGwgZXZlciBiZSBhIGZsYXNoIHdpdGhvdXQgU0ZE
UA0KPiBhbmQgd2hpY2ggaXMgdXNpbmcgYSBub24tbGVnaXRpbWF0ZSB2ZW5kb3IgaWQsIHRoZW4g
d2UnbGwNCj4gbmVlZCB0byBlaXRoZXIgZGVueSBzdXBwb3J0IGZvciBpdCBvciBzcGVjaWZ5IGl0
IGJ5IGEgbmFtZQ0KDQp3ZSBjYW4ndCBkZW55IHN1cHBvcnQgZm9yIHRoaXMgcmVhc29uLCB3ZSds
bCBiZSBmb3JjZWQgdG8gdXNlIGR0IHRvIGdldA0KdGhlIGZsYXNoIG5hbWUuDQoNCj4gKGkuZS4g
ZGV2aWNlIHRyZWUgY29tcGF0aWJsZSBvciBzaW1pbGFyKS4gQnV0IHRoZXNlIHNob3VsZA0KPiBn
byBpbnRvIGEgc2VwZXJhdGUgbGlzdCB0aGVuLg0KPiANCkhvdyB5b3Ugd2lsbCBkaWZmZXJlbnRp
YXRlIGJldHdlZW4gdHdvIGZsYXNoZXMgb2YgZGlmZmVyZW50IG1hbnVmYWN0dXJlcnMgdGhhdA0K
Y29sbGlkZSwgb25lIHRoYXQgc3VwcG9ydHMgU0ZEUCBhbmQgb25lIHRoYXQgZG9lc24ndD8gWW91
J2xsIGhhdmUgdG8gaGF2ZSBhDQpzaW5nbGUgZmxhc2ggZW50cnkgaW4gb25lIG9mIHRoZSBkcml2
ZXJzLCB3aGVyZSB3aWxsIHlvdSBwdXQgaXQ/DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
