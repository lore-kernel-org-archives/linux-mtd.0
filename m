Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E8A9C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Mar 2022 07:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ocncVPa27GhrXsFdiCpAdazkbXxyHV2FJFlsMHJJTOw=; b=iHIlXXOUgOr0k4
	LKTNofh+lx5XBJum6ToZ9aWcbFh78RFS6bk4VzVoyFRT7C5uOK1NhSJQzQoOZQnfXdMHfE++vqLPj
	VJCLFWi1v4rxmZI9NsXgTUd8Ig0KnseIWje6xrMUuPvznul75bF69yga9tnl+ucz9cesxk0pin+CE
	XIHqIsQeKRIylCPRAuCJurSwwtBgkJCIMeySCAtpQEaj3CJlGAsG5gqweOf065XP/EHlDNDN1Gz0/
	OkEH+iMeCiphAxShHy9HDILUHl5JCNkK/ZsjZxY1YRXEg0Ox/d+rZlSOiVv4eB+9DsOSsfKzLWkRb
	v+RNRiY+T66DYAvnoAUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUOWv-00C2qj-4A; Wed, 16 Mar 2022 07:57:13 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUOWq-00C2pP-LV
 for linux-mtd@lists.infradead.org; Wed, 16 Mar 2022 07:57:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1647417428; x=1678953428;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=+2gLRpiWCq0obQTi79yd71Ew2xuXMEqGKPwj0FOYWAY=;
 b=PcYzwHCvmP8A2j+RNWIuM5S7EgnY9qLI8onjJh8obdrYhr3erLRrsn8y
 a1GbJO4AcrJGF1OZe4Kq53kh+AO4ILqLl/graMIWgMZgp6cqeNbcSDkL9
 pNgbbg9KIi5fCJXjcLBQShimr/A/FDxpWQR3fxvSR6bEPCy/Hg6img13H
 u7pX8+43ivm09OgC1WBcitXrXvCpzUMV/zdj2kK0x6aM9ilVHR93x30QC
 ljbOwYF0PqLkfNVWwLOFq1Tdz8uploYQmuedqROjODrZu//dwCP6rVjIq
 WleZbH6RZ1/mfUPWTtXZt8Zgj4Q/I/sZ66NbXpMqWasSueC5GWrQT7lmz Q==;
X-IronPort-AV: E=Sophos;i="5.90,186,1643698800"; d="scan'208";a="156609150"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 16 Mar 2022 00:57:07 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 16 Mar 2022 00:57:07 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Wed, 16 Mar 2022 00:57:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nq752Qw1zMh0QMjeyiM7sRMmjGJjK0MJBTQQ+Vcch7vVxNJ9IPgOniyM/rq7lvCop5ckVNzN8CQpTSDXK5uUBggxIfWzsxLS8GIh1HyeyoSjb7DY8MkudubaQ4tSK1SP4WzjdImTC1N5YiSp7jG8k0aOwDkqiKOjnmyQaZKdF6JnG0YNTUtFJ4+o76vB/AE1Qwx3n84QY+fLWfGizjf3wv2/cJWbiVGMPNGeC4JIxtIImMFG+eGzVgXhDpqvLS5dZZMZ7D4khCTg7Ps0q3EfrcMJ27V9tbSBaesPFV0FKXYAsg9FDdjhsR8pw+eYWYUKQhbLbkTPWYrQ6AroCUj6Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+2gLRpiWCq0obQTi79yd71Ew2xuXMEqGKPwj0FOYWAY=;
 b=R9JfFdRRDR3OCf47/U0D6La3B1l0ZgX0c3Jk+9SenWCqUO7/qST3RsFuyBqzc0sxdo4rOQy6xHyYGh3vIdykPpXq91quZscyFBbpg1Eakzf2yMET40uRnHjF2szPr4+oGlAK+RLIqKt+DcSIkUOZ+ccADKgCuSQT1yWD8Obq5bEgwXbgn0zQgadxzDSy5LL9qMgVei9Kjs8vypsHQwwkO2iZJv81tpzEsk9wgmurNympW+y7KTxv0iWP1DohabxW4ztIgwcWc1e3tYT/6hUBGGKy+eqhnZolg6rznwV7yQ7aQYa9FHJvyemzzU8lOSRUtOuZonKNHVoBMAKTrYQyGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+2gLRpiWCq0obQTi79yd71Ew2xuXMEqGKPwj0FOYWAY=;
 b=FXFI5HAOythlekBeEeXMhH5E+NHQKGqZmGjiRWvgv58VMRTla0VDAuMctNj5eILgy5ddoy3HavhWiTjfRe5dsRLBNTxd1YhXaP1ky26WCkUVmlhBPrkf93lR6WSHdTo8oaRQDGThon54kdFu1P8SQhlG0xeWfj8QSSlPXQQnvMA=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by MN2PR11MB3743.namprd11.prod.outlook.com (2603:10b6:208:f4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.25; Wed, 16 Mar
 2022 07:57:02 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9%5]) with mapi id 15.20.5061.028; Wed, 16 Mar 2022
 07:57:01 +0000
From: <Tudor.Ambarus@microchip.com>
To: <vigneshr@ti.com>, <michael@walle.cc>
CC: <p.yadav@ti.com>, <broonie@kernel.org>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>,
 <Nicolas.Ferre@microchip.com>
Subject: Re: [PATCH v2 0/6] spi-mem: Allow specifying the byte order in DTR
 mode
Thread-Topic: [PATCH v2 0/6] spi-mem: Allow specifying the byte order in DTR
 mode
Thread-Index: AQHYOQtqoecUsXbOo0Oqo0422amT1Q==
Date: Wed, 16 Mar 2022 07:57:01 +0000
Message-ID: <555e9fe4-54c7-3fa1-159b-2f71f1ac9fd8@microchip.com>
References: <20220311080147.453483-1-tudor.ambarus@microchip.com>
 <76eb13b6-9263-975f-3196-312259634301@ti.com>
 <b60064231d33581c20279172cf8f765e@walle.cc>
 <0f271365-354b-82e2-02a2-9d69a6ac85b1@ti.com>
In-Reply-To: <0f271365-354b-82e2-02a2-9d69a6ac85b1@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1a8267a1-6e2e-42a7-851a-08da07228e0e
x-ms-traffictypediagnostic: MN2PR11MB3743:EE_
x-microsoft-antispam-prvs: <MN2PR11MB37432C3DC6236A51D3AF7437F0119@MN2PR11MB3743.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qj8zi7EYVtyxrXPBKA55jZIOBvdsnh7E5JpXOVIT4IobcB4WoOKxnHrqzLIbpPD8f0cBvPyGJpaP88DA2kaGJmKiVUYNkia2P4R45Wq95IJNjfIWwP54lXhyFI859dEQNmllqfAVig3ff49nMOXVK4iy1Ms+Qhy+KXWnfMj5pSR4UV0UyNQQzShGDnhPQwgpLx8KQvBWRKodR8c7Y6/SlOq+qeGuzg2141o9JXxuBvJ/uAiT7fw0u6ViMe+Wv2UCevwS9sVncKoVm26WnyueyreMmCbOVhxBI+0P0M392kMQKH4YnF1RoMHve0zx9C9oh7TSlgziF8LvH3HWiVWgVBSIrDzHipr3zthOlLYcOwqaMJM7oFKd8oIcLQP3Ye9aQteZUESV7SinP3l4OL5AlZUKgyzrUUZlvjq2MW01lWw1pYpmcMlcav/yWSNqF6ECohgr0el4Qn9vu2u/iH9uTMOPSNqrZ8O7PR7Qa4Wt4IJqG9cf9DUcOFzfwtptcgUgVPEfrIggMKaMHxhi+1Xsjma5SuYJ3hS2CBcdWoYwNohpkASBYVW32rvIIW9sml/ztCtjpbVu11z21BwVXHy3mWlhRtOxJb/7ATYZl32DFVIBifdWK1wG0H8VDUCSxF9quiIvjP5lvZ5RrX+l5MxzL3/ymlzA/QL4ijJR+T3zGKb5dltKI4tuCX7JtgSrozI5t1qGDoGY6EWLmwa1eQ2n2fhUuQBMgnCGBrhhDTwhS4ZB48fa6apmgHrKAmGwS9gjD+BTL1Ppe3vZYeuv0Q+l9Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(186003)(26005)(5660300002)(6506007)(38070700005)(31696002)(71200400001)(86362001)(8936002)(83380400001)(54906003)(110136005)(31686004)(36756003)(6486002)(66476007)(316002)(2906002)(508600001)(38100700002)(2616005)(107886003)(53546011)(122000001)(76116006)(66946007)(66556008)(91956017)(6512007)(66446008)(8676002)(4326008)(64756008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eU1rY0FiVW1TKy9yOGNZVXVUUzR1bzlRUnd0SkxLaXNNU2pRQWdFWm11OXQz?=
 =?utf-8?B?a2VGYUxOVUVqU010STE0M1EvYVQwNENqT05aSWZKclhCZUl3SmlPWTc2NjNS?=
 =?utf-8?B?THFVVy9OTTJDKzlnM1dFQmZtNmJJejFOZzFwbjNnM0xydEN2ZTNpQ1JHZGoy?=
 =?utf-8?B?c1BCc0hjejM3R2NZWkNGMXlnYk1lQkxlc2ZUVCtqWm9pQ0pockljSkhqb3gv?=
 =?utf-8?B?bk1HSWxWWkR5aGE2Umg5c2Z5Qm5wN0pjbGRiODBzZGtVbEpXbjNhYnU1ZFFZ?=
 =?utf-8?B?U1BwbDg4anVtQ0JrcnN6bW9SVlBOWmQ3RnNDS1BkT1d4MFc1cmdvRnlJejVh?=
 =?utf-8?B?d3N5QWhKU1VXV01mLzV5TGcwc2oxcUZiQVREVCs4ZHROSVR5c3JjV0xTdzJF?=
 =?utf-8?B?dnlFOEJxM3dtYm9iblV2MENwa2lDQ1NRTWFWaXlyTGVPaDJWVDE0SkRsQ3dC?=
 =?utf-8?B?ZjI0S2FOR1ROelhBNlF4eCswQUdUUUtMcHFJeEZJSmdkdDRBWTZ2Qmw5Nlhv?=
 =?utf-8?B?M0FVWElQVGMyaVhRUUhveVhQWGZ3bzJwOU9WQXc0bHNJZTZIeU5MTVJZUkc2?=
 =?utf-8?B?aHAzV3pnZ1QyTmQvV0xucFI4UDNZbXZiNFh5dnRCbjV1b1JDb2lYMUJHUmJy?=
 =?utf-8?B?QWdldk54c21zRHB1Sy8vankzSFArWFh5VDRtL251SGNIeGZMMW9RWnM2OGNZ?=
 =?utf-8?B?NnVlR1l5NFpUaThoMW5TTitPMnhNVXNrY2ZjWmZBb0ZMblVUUytqbXFLRmZO?=
 =?utf-8?B?SEZ3RDdNY2x6ZWF2RmM2K2pxYlBWNDVldFpGalVST3NvcmxVY1RXME1tMjBY?=
 =?utf-8?B?ZGdHU280S203a0wwT3phdHBpcVR2MWV5U3hwdXJsR1lkeTgrOWE3Y0dOZmlI?=
 =?utf-8?B?Zi85aGJUaDhrZVZUclNYL2xjQ0gzTWtLUE1RNitpR1BUVnd5ODRHdDlWR0dV?=
 =?utf-8?B?ZEZwWHl3WEF6UnYwSDRDZnZmSUw1NmdGeGpjN05UaHJhV1V2TjVMdzVGeFIx?=
 =?utf-8?B?TzMzSFJhTDZaTGRlK2NYbGhydlZJQmdMbVE5amloY1UzS1BhcXZTUWk5dlUx?=
 =?utf-8?B?TzBieFcwZnY0MTZIOXBkeEc2QjEvek8zUUFNdWp3emMvbWxaa1pUbUJrZ1pX?=
 =?utf-8?B?Y25hUWxLblNYOGo2eENvand1QXlaR1dPNDcwRWMzWU5IK0VMd0JlR2JEUm55?=
 =?utf-8?B?RVdBb0dHdkdtdCt1blFYb3c0ZDFsY3BTSE1yNnp6aVNqWi9udDJ0SlpOWHp1?=
 =?utf-8?B?bWpmNHRZd294Tm5vTXIyMno5ZWlsRDNOZGRSejhoYzdtWUYvZzVNMmNnTlFa?=
 =?utf-8?B?Y2pBSUVNRnpLQ1Ewbi9RZDRWMENlL0x4eVd0SkJ1UEIzbHJ3S3ZKSGxqVzZR?=
 =?utf-8?B?U2ozZjdKcktzOG4wWFJPc0FIbmZQZTUvOVM5TmFvVnRTWjBTSFRDbWk0a3Jp?=
 =?utf-8?B?N0lyYmprZ2tTWFRDcC84TU9IZ1FaZk9pcFBUSDNXWHUzWm05UGM4alYzY3Vt?=
 =?utf-8?B?MTFxejdHU2wvbWtva2JGcmVYTUJkYTFZRWpvU3hKL01aMDh5Sm9WdlJBUUdB?=
 =?utf-8?B?VTlBMk50bjJ6MVM5V09WektFZUIvZzQ4OHp0ekVDNlNRbk1hYkJReG1mS0li?=
 =?utf-8?B?bzU5eHhBUXd4QkhJaVNsa3I3K0N0c1ZJbk5nQldsV3dScWJHcW1GUGFJeDcw?=
 =?utf-8?B?ckFqR3J2L1lYdkY1TWpaMXl2ZDZkdENaZW9Dc1UybXBlUEhDU1dYbW9rU2Vk?=
 =?utf-8?B?UEw1K0c2MGpObDI3dGt5eEo3WFdDQ3VWbDlSL3JBUjlzOHl1TlE2T0htU1Zy?=
 =?utf-8?B?V3ZIYWUyMnlCSUpMYjFEQ2hhRVpuNnI2eFFSRG0zODAyZmlOVmdOTXpyQU02?=
 =?utf-8?B?YmpueGhDN0tsOXVaTktWcFVSK2tTRXNKVUNJSEo4NkF5cCt1ZUhaUEFNSWV1?=
 =?utf-8?B?Y3BRVWttY3l6eHJrci9jQ3I3Y0JzNVI3Sy96Nk9yLzNiRjdXanU4TG9PNS8r?=
 =?utf-8?B?T3JKbWFGeEF3PT0=?=
Content-ID: <633D6A9B166C2C4D933671AA0EAECFC7@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a8267a1-6e2e-42a7-851a-08da07228e0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2022 07:57:01.9164 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8XJuoELmqAC+NpCC7vo6KTDF3h5BFAsFKDjX/ElId6WfsSk9RXs9GJ2X0AIXiN4oKurE4Qve5zVnnEe0lkNzYnJ4QC7tSna1jh9Rgotv3Ic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3743
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_005708_753622_C16DD2E8 
X-CRM114-Status: GOOD (  27.91  )
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

On 3/16/22 09:05, Vignesh Raghavendra wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi Michael,
> 
> On 15/03/22 12:49 pm, Michael Walle wrote:
>> Hi,
>>
>> Am 2022-03-15 07:08, schrieb Vignesh Raghavendra:
>>> On 11/03/22 1:31 pm, Tudor Ambarus wrote:
>>>> There are NOR flashes (Macronix) that swap the bytes on a 16-bit
>>>> boundary
>>>> when configured in Octal DTR mode. The byte order of 16-bit words is
>>>> swapped when read or written in Octal Double Transfer Rate (DTR) mode
>>>> compared to Single Transfer Rate (STR) modes. If one writes D0 D1 D2 D3
>>>> bytes using 1-1-1 mode, and uses 8D-8D-8D SPI mode for reading, it will
>>>> read back D1 D0 D3 D2. Swapping the bytes is a bad design decision
>>>> because
>>>> it may introduce some endianness problems. It can affect the boot
>>>> sequence
>>>> if the entire boot sequence is not handled in either 8D-8D-8D mode or
>>>> 1-1-1
>>>> mode. So we must swap the bytes back to have the same byte order as
>>>> in STR
>>>> modes. Fortunately there are controllers that can swap the bytes back at
>>>> runtime, addressing the flash's endiannesses requirements.
>>>> If the controllers are not capable of swapping the bytes, the
>>>> protocol is
>>>> downgraded via spi_nor_spimem_adjust_hwcaps(). When available, the
>>>> swapping
>>>> of the bytes is always done regardless if it's a data or register
>>>> access,
>>>> so that we comply with the JESD216 requirements: "Byte order of 16-bit
>>>> words is swapped when read in 8D-8D-8D mode compared to 1-1-1".
>>>>
>>>
>>> Sorry, bit late to the thread. But, dropping 8D-8D-8D mode support is
>>> quite restrictive IMO.
>>>
>>> AFAIK, SFDP standard does not dictate how data should be stored in flash
>>> or how SW should interpret after reading data from flash. It merely
>>> indicates endian-ness compared to 1-1-1 mode.
>>
>> Mh, but below you are saying that Micronix is violating the standard
>> and is swapping the bytes. So, the standard is actually specifying the
>> byte order.
>>
> 
> As I understand, SFDP spec(JESD216) is way of describing flash details,
> it does not enforce any rules on how flash should "behave". It just
> provides info for drivers to discover flash parameters at runtime.
> OTOH, xSPI spec (JESD251) lays down guidelines for SW interface,
> electrical, and mechanical interfaces. Macronix flash deviates from xSPI
> spec but no SFDP per say (unless it claims xSPI compliance elsewhere in
> SFDP tables).
> 
>>> So, its up to various system SWs like bootloader/Linux to work according
>>> to pre-aligned layout as there is no rule that data needs to be stored
>>> in byte order.
>>>
>>> We have two types of controllers:
>>>
>>> 1. SPI controllers supporting swapping endian-ness on the fly:
>>> -> For such flashes, better choice is to have SWAP option always
>>> enabled. So that data written in 8D-8D-8D mode can be read correctly in
>>> 1-1-1 mode and vice-versa.
>>> ( I am assuming SWAP option of controller is only effective in 8D-8D-8D
>>> mode and is NOP in 1-1-1 or other modes)
>>
>> Why should it be always enabled? You can also say it should always
>> be disabled. It doesn't matter if the byte order isn't important.
>>
>> But I say the byte order *is* important. We need one reference.
>>
>>> But, its possible that "ROM" or other non-upgradable SWs may choose not
>>> make to use of this SWAP option of HW to keep things simple in which
>>> case, they cannot boot from 8D-8D-8D mode with above setting. Such SW
>>> don't always have knowledge of flash and cannot be forced to have a
>>> constraint to enable byte swap on read.
>>>
>>> So, IMO, its best left to system integrators to specify whether or not
>>> SWAP option needs to be enabled (perhaps via DT as its per flash
>>> specific property?)
>>
>> Agreed, but I don't think we have to do it now. If someone cares,
> 
> I am fine with that, but I want to make sure we are not saying
> controllers w/o ability to swap byte order can never support Macronix
> like flash in 8D-8D-8D mode.
> 
>> he can make a patch. Also we have to consider non-DT platforms.
>>
> 
> non DT platforms also have a way to pass HW related data
> 
>>> 2.  SPI controllers don't support endian-ness SWAP on the fly:
>>> It is still possible to reliably read and write data as long as its
>>> written and read back in same mode.
>>>
>>> De-rating speeds because of absence of this support would mean reduction
>>> of speed by **16 times** (maybe even higher as 8D mode tends to support
>>> higher bus freqs).
>>
>> You can also fall back to a quad mode. Again, can be implemented if
>> someone cares.
> 
> Actually I have not come across OSPI flash that also supports quad mode.
> So, fallback is 1-1-1 for majority of these flashes

8-8-8 is typically supported where 8d-8d-8d is supported. But downgrading to
8-8-8 still comes with a performance penalty.

> 
>>
>>> Swapping bytes in Linux before writing or after
>>> reading is not an option either as it negatively impacts performance.
>>>
>>> Asking ROM/bootloaders to swap bytes based on SFDP indication is
>>> restrictive too as it involves boot time penalty and most systems with
>>> OSPI flashes are using them to achieve super fast boot times.
>>
>> No we are talking about what? ms? to read the sfdp? If that is really
>> a use case, the the bootloader can hardcode it there.
>>
> 
> Reading SFDP is not the issue but swapping entire image is the problem.
> Takes several tens of ms depending on boot image size which is not
> acceptable to systems looking at < 100 - 200msms start up times for
> quick bootup usecases involving early Display / CAN output etc
> 
>>> One more case to consider is flashes that dont have SFDP table to
>>> indicate byte order but follow Macronix's convention. In such cases, its
>>> better for SPI NOR layer to be as dumb as possible and not really do any
>>> byte swapping, leaving it up to user space to handle/interpret data
>>> appropriately.
>>>
>>> Also, Macronix is probably in violation of xSPI spec (JESD251A 6.9.5.2
>>> 8D-8D-8D Profile 1.0) where diagrams clearly show data output should be
>>> D0 D1 D2 D3... So ROMs following xSPI spec (which is the only spec
>>> providing flash agnostic way of switching to 8D mode and reading data in
>>> 8D mode) would not care about SFDP bit indicating byteorder and its up
>>> to flasher programs to take care of the same
>>>
>>> IMO, kernel device drivers should just provide access to underlying HW
>>> and not have too much intelligence to interpret data/take decisions
>>
>> I strongly disagree here. The kernel should provide a consistent
>> view of the flash content, regardless if its read in 1-1-1 or 8d-8d-8d.
>> Imagine you are forced to switch away from 8d-8d-8d mode (for whatever
>> reason) after some time. How would you know how to read the contents?
>>
> 
> Agree with need for consistent view, although if we need to fall back to
> 1-1-1 mode for a while and switch back to 8D-8D-8D mode then there is
> something fundamentally broken.
> 
>> JESD216 is a standard, too. There is a reason this bit ended up in
>> there. If I had to guess, someone messed up the byte order in 8d-8d-8d
>> but it was too late. And now the standard is giving you a hint that
>> you are using a flash with that messed up byte ordering.
>>
> 
> Yes, but note JESD216 is all about giving hint to softwares  on how
> flash behaves, it does not dictate what softwares need to do with it.
> So another OS is free to leave these Macronix flashes using native byte
> ordering and not swapping on read / write
> 
>> I want to avoid having flash contents where the byte are swapped.
>> The sooner we care about that, the better. You cannot undo that
>> later on.
>>
>>> So, simpler constraint to put is:
>>> Flasher programs should program data in the same mode in which
>>> ROM/bootloder/Linux is expected to read the data on that system.
>>
>> So what if your flasher only has 1 pin? With this you are just
>> shifting the problem elsewhere.
>>
> 
> flasher program would have to use byte swapped image if read is expected
> to be in 8D-8D mode

:) 

> 
>>> For Macronix like flashes, if one has a ROM/bootloader that only
>>> supports 1-1-1 mode and flashing data in 8D-8D-8D mode with Linux, then
>>> please generate a byte-swapped image offline and flash it. Don't impose
>>> penalty on systems that do best to handle this messy situation.
>>> I see this as the only option with least performance penalty.
>>
>> I certainly have nothing against an option to turn this all off
>> to improve speed. But the swapping (if asked to do so) and the
>> degradation should be an *opt-out*. Not an opt-in. Nobody will
>> do the opt-in and we end up with 'corrupted' flash contents.
>>
> 
> Sounds good to me. We should note this in commit message disabling
> 8D-8D-8D mode for these flashes.
> 

I like Michael's *opt-out* idea too. But I'm not convinced with a dt property
used to configure when to swap the bytes and when not. DT should be used to
describe the hardware, not to configure it. So we can add a "dtr-swab16"
property but IMO it should specify just that the bytes are swapped in 8D-8D-8D
mode, just as SFDP does, and not to configure the logic to swab16 or not. And
if it just describes the hardware and not configuring it, then the entire dt
idea diminishes because it is equivalent with setting a SNOR_F flag either
by a flash-info flag or at the SFDP parsing time.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
