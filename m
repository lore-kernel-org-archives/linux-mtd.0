Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CED7606A320
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2026 10:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i9CTjMKI;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=selector1 header.b=pmtNwclY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bUi7TBExKB3yhzWXYYPrYozOX8nanNczVsPG7jVVTjQ=; b=i9CTjMKIpTny8G7fRnLUvpdt4f
	PbIjqWm7Le/PR7r29Dx96EDZn5NBam6Eq0U2t1QniYvHKiwKwKbUmFqZxuZMLzaInrgEVCr9BmiN2
	ycbbcI5/EKSoQWN4PzZFXiUwxqHVb5/4HbhHEWxqittzEn6t/cR6inHa9LchaGdTuAOiS9rE5VUr5
	19rvZlshLf64H25tdPHOPzbfTYVZivmQ/tL1FfqZffbTibTE2t31cqGkEEyA640p40a0aSrbaMQj4
	lgnUr00z/1G9Y5V96BI1neIKnM9xLzf5DtVYBIpv2Zx2Pgrppl68K7G2K9pLZcWf/KQ/f0ItJSyl3
	GEOvHbzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTd2z-00000008aHP-37KH;
	Wed, 18 Nov 2026 10:37:49 +0000
Received: from mail-northcentralusazon11012042.outbound.protection.outlook.com ([40.107.200.42] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTd2w-00000008aGQ-1wUk
	for linux-mtd@lists.infradead.org;
	Wed, 18 Nov 2026 10:37:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HEW/XnoDggFsrv5OLQmOvAZXTQ66MFbT/dzuwmOG1Dn6J73WHQMoOiwB6efpyJq+6umOXE9p3qivQBBukRF9sErpi3eKzRXshrrIUI+M+oOAq/78BzA+Ql/J2R7wkRffIMRwlKUT9hM4MrTG8DRBGqh4S6/1FyHlY8XrylJl0OWrq25fI2z3DvaN58P+sPLYxNPMdyVknI3ldqibIDB8p9ssQwoBge8HzfG6Gim1jsRRxp3yPdp5W61SmJh6WmMe7xM0KHqSFosFMa3cMCuyFVDuiMoqnEQamL8R7vZMU7d5rQAEHTnJ/SRTBL/DWPEiW2df2wszEWuUt4N8V/1q9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qVuosTlWGj4yo9UvB/1uhIWyYCMNhTaMS/MakMN9ePo=;
 b=xSRw5aBAd0EJbxS4qJPO0FjsYCoHJH/2VHO1OiRUJVjnO2RZra+xfoL5/Bp5t/sH28E3iXtt7EqUGiG7KtoSFWebgq6PW4PjaJl2dxy/NzbinHDPS8GjL8J5RouJWk3juX/D3bBkGjVohMETF/wj9lvcv4F/HfkVi+FyZQ3+TziYzmiMJKtIznBQkQJBCfpfeyFYEC41Z7iipGikvaSd2mCe5jdpe9hQvFK6qqB8eKAEtiM+EF1hzrHBoodiFDx3yotu59QY/FDq50YwnF/V4z/0Jk3wNzE4O7SOVhZZlo21QiiND9yWOOpKM7zsCKqDZnBlyHpqxJq1VRZjHlWQYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qVuosTlWGj4yo9UvB/1uhIWyYCMNhTaMS/MakMN9ePo=;
 b=pmtNwclYF+qfFCUc5s3ZxNa0r6e9fvgywCcdTTU5NNGpTqd9t2RcTN5Gej1B/DMLZZbYyh7Fop4AJluxoSmla7BnaLB8VnJYOk6LkDqtL2lmioMLaNUE67cCT2I7fwNywRUe/TSVRA3nXPh2YrP2dX1GIUgGpKVwTp9EcsONnZ9LuCyS5bfXdrFGzrn/6hcPV7l+gZ54ZPO+LWHd1T3n7o1xr1O8inaTtlXFKfoCW9XOz83+aUOKbIQcV96IFZ6SfHweeEPk7nXKhyw2uPEpI6IlGi4J8iV7OZVIiFNMFbioxF45ANJy3m7Fkfp1Tv3pyA89C3KY9fNSt6ir1hNDuw==
Received: from DS6PR11MB523643.namprd11.prod.outlook.com (2603:10b6:8:468::12)
 by DS0PR11MB7216.namprd11.prod.outlook.com (2603:10b6:8:11c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Wed, 18 Nov
 2026 10:37:40 +0000
Received: from DS6PR11MB523643.namprd11.prod.outlook.com
 ([fe80::1cc0:e019:a70b:f954]) by DS6PR11MB523643.namprd11.prod.outlook.com
 ([fe80::1cc0:e019:a70b:f954%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 10:37:40 +0000
From: <Manikandan.M@microchip.com>
To: <sashiko-reviews@lists.linux.dev>, <pratyush@kernel.org>,
	<mwalle@kernel.org>, <takahiro.kuwano@infineon.com>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<srini@kernel.org>, <Nicolas.Ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<linux@armlinux.org.uk>, <richardcochran@gmail.com>, <arnd@arndb.de>,
	<linusw@kernel.org>, <enelsonmoore@gmail.com>, <aaro.koskinen@iki.fi>,
	<pengpeng@iscas.ac.cn>, <mathieu.dubois-briand@bootlin.com>,
	<gregkh@linuxfoundation.org>, <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v10 4/8] mtd: spi-nor: sfdp: expose the SFDP as a
 read-only NVMEM device
Thread-Topic: [PATCH v10 4/8] mtd: spi-nor: sfdp: expose the SFDP as a
 read-only NVMEM device
Thread-Index: AQHdcdO2kPEFYCk2dEWhlBkcI51Wi7cqVk4AgAlXtYA=
Date: Wed, 18 Nov 2026 10:37:40 +0000
Message-ID: <35119b3f-518d-4cb2-acfc-ad08c6465bee@microchip.com>
References: <cover.1794391660.git.manikandan.m@microchip.com>
 <d0cc3945cf8ef204d920efbe776828477bfde469.1794391660.git.manikandan.m@microchip.com>
 <sashiko-outbox-211057@kernel.org>
In-Reply-To: <sashiko-outbox-211057@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS6PR11MB523643:EE_|DS0PR11MB7216:EE_
x-ms-office365-filtering-correlation-id: 8c7dda45-7632-43a0-ec68-08df455ff8b8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|23010399003|921020|261022105027099003|38070700021|261021121427099003|4143699003|260925021311599003|260925021911599003|56012099006|260925022911599003|10067099003|261026140227099003|261022075727099003|261028144727099003|11063799006|261102123227099003|261026121527099003|261009223027099003|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info: 6NeL02GA+og4cwdiiMmvPKkWEfLVkjV62ZvN64DbEc3HkUlD+f1XB06dadtPdeefu17n2FqyJf0XpDz21j9tbIUWKtwp97Be7EhSQ1gDfqzW7AGnAnSTYJVr5G7DsAz2Vmyl0gob2HYNNAL5926b0COxKTetesS2UeqVfkd10qy3gFlVioaxDxsH2uKMyfDaO4tJPfUKyIIS/Lg9JyRyAKdnKiMvrFksJvfbasU5S/W41unX67OgySaubrvcwfMjKbgx8EIFQYyyTOFMVvJeMhrNFwCNRwS95ZEq7ttwOeMHBEE/xAxoeEmx7GxKCBLgtZcJhyE+91owEZ+/lGt0On2mBVlPwZz+HvhdHggyxJTUmH0aX3gT9DrpAVUeQDvKiATDpDRZPKjIksFX/fBxGNn/ELuCt723+dpCeWqbtgiybhHSuPXMQWlVt6PfG4pq1CIxr8He8DIVcNLCHWqq/3C0jD2rY9d4+UIt50r687ofbHhEcLU6qJC4nf9YHBe/oK7ZYiD72SzN3CckO3uIxk5YxYR77SfRSWDNgIBuVk0KoGxoLzWhsHi6Jzn8bdQyO2GKEYIDuRdP8pnKxx+54/c0tZ0x0drEhshko8AueUjMbcv3hl4LXBCSEzz+Azk0HnsdmVFq0IYPw5Cfu9Y0vRVd7LdXxR9mBDiP8nhX7E3ynovI+fvB3kFvDhPjcpv7
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB523643.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(23010399003)(921020)(261022105027099003)(38070700021)(261021121427099003)(4143699003)(260925021311599003)(260925021911599003)(56012099006)(260925022911599003)(10067099003)(261026140227099003)(261022075727099003)(261028144727099003)(11063799006)(261102123227099003)(261026121527099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eUxpRDhVTk9XYWl4ZVdvNTRmQlNmVFVHekN3dkRvUTBTcEJFSThGSnNBNm91?=
 =?utf-8?B?SFpvRkpFUUJEWUdGK2k5SGJYQzVDbFBJTjZ4OTJWdUptcDhTZkNMeVpvWEpN?=
 =?utf-8?B?WWpxWEtJREUwcUJtdVVxa2JRL1VhUVVpelljempWSENkUWhMd3M1U0k3NzMz?=
 =?utf-8?B?TzRNd1hqQ1RJMUhXUGo2WkN0b1NCOHNQTFRCc1JFUjNxZlI0NEdOQ0tFVkg0?=
 =?utf-8?B?bWdzWFBmdll6WHQ4Tkc4OExvaURENEx3M1ZHWVlNbHNqWmtNZ3dTZjVGdXJl?=
 =?utf-8?B?MmlTU2xTQ0hZWVN4RDd2d3E3LzFONmJHV01LS1d0ZjRkMWZTazBXWDdjWC9m?=
 =?utf-8?B?RlN1WUhwU0NpTE4vMjN3b3QvcnBXOE5qTER4dVVyL29LTUU0TmhVM0t6cUFX?=
 =?utf-8?B?L3hwbjFnejVFK29MQU52eFN0aVlaUEQzczRsQjdKdm1yck1maFNOb1dWTVJK?=
 =?utf-8?B?Ums3Qmp1V1BBMVhTSGtwS2l6STBOZWxXZE5zRHowQU5ZRS94VWdJSjFQZmN0?=
 =?utf-8?B?RjEzWHJ4ek5YRzVvM0pZQ2ZiRVFrMHZLU0NaQkF3enQ1NHBSSTRUbWtVWVc3?=
 =?utf-8?B?TU10eEUvUEpzK0gxOUNReEFOaXh1WGQzWW9iWnRUL0J6SnIzOWFDRHZwZmlm?=
 =?utf-8?B?TmZ2Y1A3TXNPcG5JdVdwSzdXeHVwaWlqMGNBY3h4ejhXRDd2LzBsWHdXVE82?=
 =?utf-8?B?RkJ0NFZ6aWJ6NmxIbE85ei9vK0pJelZLQ0ROb3lOTk52amZuVDQ4Vm9QUzQx?=
 =?utf-8?B?eVV5ZWlpRko3V0R5ZjlrYXdkRXJPQ3MyWlc1NlhEMXoyMUU3OENyQXpLTWtB?=
 =?utf-8?B?T3FNTXhPdFpLMmZJa1d5N0cwTWtnSVBaOE1aTXAyZ1gvbVZMWVFFbWhmWU5q?=
 =?utf-8?B?SlhZbi9EUDNiYncvMTJ6NlJHbkhqdWl5Ymd6c2hIM3N2YldhdVFTZWhZcGtl?=
 =?utf-8?B?eHF0MUhIdi9rZjc1bG9LLzFXVTRFMXBIM1psQkJHaHNkZ3hNQld0djUxazBW?=
 =?utf-8?B?am5LMTZQM2pQUTNQUXFGTXF4RDN1c2ZvWG51K2lXYnd1eE51MTFZYmw4QUlZ?=
 =?utf-8?B?U0hoWGlKSnVmSmJHTG5Qc3JFeDRCWktaZjR1dGEzVFZRRmcyUi9aZWM5SHpU?=
 =?utf-8?B?Q3NzejRaZGRxeVBTS2kyaUVjTi9RdmZTb0h6WitCV3AvdHNWMWxwVjB6dUtt?=
 =?utf-8?B?SjMvMlVYY0V4NnJ0TW1MQjk2QVdxc2JPY0hVSnVtNjI4S3FJT3JyaXdCRkVp?=
 =?utf-8?B?ejRnU3JpdG9mMHd2MEJFc3p5dG40TW9XVTJ3aVA2eHh4RmJSMzlCelpLWHZm?=
 =?utf-8?B?Mytjb3lCQ1RDZVYxcS8xOHhzbVZBMThwak5jbW9BbStjOTE4eWRyTXhLZXRj?=
 =?utf-8?B?ZHcvaTlTNHdmMjFhSlM5QmVuRENsNVBTcVhHZllRenpCcUx2c0UyWGw2dzhl?=
 =?utf-8?B?VVlXZzRoYUI3MEpSdUlFVWh6RTcxcGdQTmY3blV2RlRXb0t3eURIbWRwUlZz?=
 =?utf-8?B?bXlKc2VwOGlIZmVObUZNR0hTcjY4amlJM0h4czdvU1lzS29LWld5Z1pEalVY?=
 =?utf-8?B?TnM4T1FuWDZTQktmYUNRd1RoTEJ4bXNZa3dFUFlJQzdQVHNBYlB0V0tuNGhT?=
 =?utf-8?B?NjhmV0dTV2RaY3dMV2xDUDRHVHBkeks2eStONG13MUk2WGlGdU1ZeVgyVHJ2?=
 =?utf-8?B?bEI1WlFTRnZBbmhuRTJuT1h1YXpDeVk4R3paRlhoNG5XdUk1MndDZlNZMm10?=
 =?utf-8?B?VWQxQWgvYUlaZHVRNUlqQU9SaTlDZ0NGMXhKSUFhNnp6b1htSWtONFRkMk8z?=
 =?utf-8?B?NnM1WnBrV3MrUkk4UmdBczBJRGp2UWwwdWNUMEd4QjlwRzV3bE5BSXlQRFpS?=
 =?utf-8?B?ZEI0TmoyS0NWNjlOemE0eVFsZjRCRFR5allhMnQvQmQwd2F4SU4rL0pkTno3?=
 =?utf-8?B?VzdTcWk1WDZTQUxYWW1hZStOSFFaek8rSkYyUkNnNnhOZUpPa2NPY2w1SStW?=
 =?utf-8?B?aDBPNHVSOFNza2g4SmxEd3hQMmZuNDVEcFNYY3hwZVgvWkdsN01nUE1ES1Np?=
 =?utf-8?B?d1M3dkwwbjB5OFphaVpPLzBGWk9qb1NSdVpBbjMzMjFGMGYrbFFCQmVnakFl?=
 =?utf-8?B?dHJCUkl4M3R5NHVzaC9WL2NTZURpZDdONFlNUGNIMTRrVit6TFdOODhaTTF5?=
 =?utf-8?B?UkpFMGp0QW9TTkVwUEJYcCtRSnRrUzRmMnpXVXFaVWFzanVGalZHeXgvZFZE?=
 =?utf-8?B?QWtTdndjMmtQdkUvVjJEY0d4T2NYSzhjOWRtLzhlcGNNeDR2SG9DTlJtQVNL?=
 =?utf-8?B?OTlYREs3bzJqN20wYU5ISzhqZU5laUJFRmNSWm1MWnpZTW1qRjV2Zz09?=
Content-ID: <E25F49426A646441BDF0D971C688E600@namprd11.prod.outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB523643.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c7dda45-7632-43a0-ec68-08df455ff8b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2026 10:37:40.6476
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fQ8mxZYyrFLGSPfif6ZnQvo3zmYjN+vFHYBUo6DMrmVcLfbXSagAZ0IL2y9MvCPm9ZE3KimIHmbzLDAsTCwlkdewXtgGSOPru4a5roAAHAI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_023746_732032_62AD4F14 
X-CRM114-Status: GOOD (  27.18  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGksDQoNCmNvbmZpZy5ub19vZl9ub2RlIHdhcyByZW1vdmVkIGJ5IGNvbW1pdCBmNGNmNGU1ZGIz
MzEgKCJSZXZlcnQgIm52bWVtOiANCmFkZCBuZXcgY29uZmlnIG9wdGlvbiIiKSwgc28gaXQgaXMg
bm8gbG9uZ2VyIGF2YWlsYWJsZS4gUmVnaXN0ZXJpbmcgDQp3aXRob3V0IGEgImplZGVjLHNmZHAi
IG5vZGUgaXMgaW50ZW5kZWQsIGFzIGRpc2N1c3NlZCBvbiB2OS4gVGhlIA0KZmFsbGJhY2sgdG8g
ZGV2LT5vZl9ub2RlIGlzIG52bWVtIGNvcmUgYmVoYXZpb3VyIGFuZCBpcyBvdXQgb2Ygc2NvcGUg
Zm9yIA0KdGhpcyBzZXJpZXMuDQoNClRoZSBvdGhlciB0d28gY29tbWVudHMgYXJlIHZhbGlkIGFu
ZCB3aWxsIGJlIGFkZHJlc3NlZCBpbiB2MTE6IHRoZQ0KImplZGVjLHNmZHAiIGxvb2t1cCB3aWxs
IHVzZSBzcGlfbm9yX2dldF9mbGFzaF9ub2RlKCksIGFuZCBpZ25vcmVfd3ANCndpbGwgYmUgc2V0
Lg0KDQpPbiAxMS8xMi8yNiA1OjI3IFBNLCBzYXNoaWtvLWJvdEBrZXJuZWwub3JnIHdyb3RlOg0K
PiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMg
dW5sZXNzIHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IFRoYW5rIHlvdSBmb3Ig
eW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3IGZvdW5kIDMgcG90ZW50aWFsDQo+
IGlzc3VlcyB0byBjb25zaWRlcjoNCj4gLSBbSGlnaF0gbXRkOiBzcGktbm9yOiBzZmRwOiBmYWxs
YmFjayB0byBmbGFzaCBvZl9ub2RlIHdoZW4gamVkZWMsc2ZkcA0KPiAgICBub2RlIGlzIGFic2Vu
dA0KPiAtIFtNZWRpdW1dIG10ZDogc3BpLW5vcjogc2ZkcDogd3JvbmcgRFQgbm9kZSBsb29rdXAg
aW4NCj4gICAgc3BpX25vcl9yZWdpc3Rlcl9zZmRwX252bWVtKCkNCj4gLSBbTWVkaXVtXSBtdGQ6
IHNwaS1ub3I6IHNmZHA6IG1pc3NpbmcgaWdub3JlX3dwIGluDQo+ICAgIHNwaV9ub3JfcmVnaXN0
ZXJfc2ZkcF9udm1lbSgpDQo+IC0tDQo+IA0KPiBjb21taXQgZDZiMWY1ZDY4OTY4ODE5Y2QwMmYy
NWRkMTg1MjY3MjU2NjFmNzU0Mg0KPiBBdXRob3I6IE1hbmlrYW5kYW4gTXVyYWxpZGhhcmFuIDxt
YW5pa2FuZGFuLm1AbWljcm9jaGlwLmNvbT4NCj4gDQo+IG10ZDogc3BpLW5vcjogc2ZkcDogZXhw
b3NlIHRoZSBTRkRQIGFzIGEgcmVhZC1vbmx5IE5WTUVNIGRldmljZQ0KPiANCj4gVGhpcyBjb21t
aXQgZXhwb3NlcyB0aGUgY2FjaGVkIFNGRFAgdGFibGUgb2YgYSBTUEkgTk9SIGZsYXNoIGFzIGEg
cmVhZC1vbmx5DQo+IE5WTUVNIGRldmljZSByb290ZWQgYXQgdGhlIGZsYXNoJ3MgImplZGVjLHNm
ZHAiIGNoaWxkIG5vZGUuDQo+IA0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3Iv
Y29yZS5jIGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMNCj4+IGluZGV4IDkwNTI0YzU4NjAy
ZTEuLmEwMzRkY2U3YzgzOWUgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL2Nv
cmUuYw0KPj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMNCj4gDQo+IFsgLi4uIF0N
Cj4gDQo+PiArc3RhdGljIGludCBzcGlfbm9yX3JlZ2lzdGVyX3NmZHBfbnZtZW0oc3RydWN0IHNw
aV9ub3IgKm5vcikNCj4+ICt7DQo+PiArICAgICBzdHJ1Y3QgZGV2aWNlICpkZXYgPSBub3ItPmRl
djsNCj4+ICsgICAgIHN0cnVjdCBudm1lbV9jb25maWcgY29uZmlnID0geyB9Ow0KPj4gKyAgICAg
c3RydWN0IG52bWVtX2RldmljZSAqbnZtZW07DQo+PiArICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUg
Km5wOw0KPj4gKw0KPj4gKyAgICAgaWYgKCFub3ItPnNmZHApDQo+PiArICAgICAgICAgICAgIHJl
dHVybiAwOw0KPj4gKw0KPj4gKyAgICAgbnAgPSBvZl9nZXRfY29tcGF0aWJsZV9jaGlsZChkZXZf
b2Zfbm9kZShkZXYpLCAiamVkZWMsc2ZkcCIpOw0KPiANCj4gW1NldmVyaXR5OiBNZWRpdW1dDQo+
IFNob3VsZCB0aGlzIGxvb2sgdXAgdGhlIGNoaWxkIG5vZGUgdW5kZXIgc3BpX25vcl9nZXRfZmxh
c2hfbm9kZShub3IpIGluc3RlYWQNCj4gb2YgZGV2X29mX25vZGUoZGV2KT8NCj4gDQo+IEluIFNQ
SSBOT1IgY29udHJvbGxlciBkcml2ZXJzIHN1Y2ggYXMgaGlzaS1zZmMgYW5kIG54cC1zcGlmaSwg
bm9yLT5kZXYgaXMgdGhlDQo+IGNvbnRyb2xsZXIgZGV2aWNlIHdoaWxlIHRoZSBmbGFzaCBub2Rl
IGlzIGEgY2hpbGQgRFQgbm9kZSBzdG9yZWQgdmlhDQo+IHNwaV9ub3Jfc2V0X2ZsYXNoX25vZGUo
KS4gIFVzaW5nIGRldl9vZl9ub2RlKGRldikgc2VhcmNoZXMgdGhlIGNvbnRyb2xsZXIncw0KPiBE
VCBub2RlIGFuZCBtaXNzZXMgdGhlIGZsYXNoJ3MgImplZGVjLHNmZHAiIGNoaWxkIG5vZGUuDQo+
IA0KPj4gKw0KPj4gKyAgICAgY29uZmlnLmRldiA9IGRldjsNCj4+ICsgICAgIGNvbmZpZy5vZl9u
b2RlID0gbnA7DQo+IA0KPiBbU2V2ZXJpdHk6IEhpZ2hdDQo+IFdoZW4gdGhlIGZsYXNoIERUIG5v
ZGUgaGFzIG5vICJqZWRlYyxzZmRwIiBjaGlsZCBub2RlLCBucCBpcyBOVUxMLCBidXQNCj4gc3Bp
X25vcl9yZWdpc3Rlcl9zZmRwX252bWVtKCkgc3RpbGwgcmVnaXN0ZXJzIHRoZSBOVk1FTSBkZXZp
Y2Ugd2l0aA0KPiBjb25maWcub2Zfbm9kZSA9IE5VTEwgYW5kIGNvbmZpZy5kZXYgPSBkZXYuICBJ
biBudm1lbV9yZWdpc3RlcigpLCBhIE5VTEwNCj4gY29uZmlnLT5vZl9ub2RlIGZhbGxzIGJhY2sg
dG8gY29uZmlnLT5kZXYtPm9mX25vZGU6DQo+IA0KPiBkcml2ZXJzL252bWVtL2NvcmUuYzpudm1l
bV9yZWdpc3RlcigpIHsNCj4gICAgICAuLi4NCj4gICAgICAgICAgaWYgKGNvbmZpZy0+b2Zfbm9k
ZSkNCj4gICAgICAgICAgICAgICAgICBudm1lbS0+ZGV2Lm9mX25vZGUgPSBvZl9ub2RlX2dldChj
b25maWctPm9mX25vZGUpOw0KPiAgICAgICAgICBlbHNlDQo+ICAgICAgICAgICAgICAgICAgbnZt
ZW0tPmRldi5vZl9ub2RlID0gb2Zfbm9kZV9nZXQoY29uZmlnLT5kZXYtPm9mX25vZGUpOw0KPiAg
ICAgIC4uLg0KPiB9DQo+IA0KPiBCZWNhdXNlIHNwaV9ub3JfcmVnaXN0ZXJfc2ZkcF9udm1lbSgp
IHJ1bnMgZHVyaW5nIHNwaV9ub3Jfc2NhbigpIGJlZm9yZQ0KPiBtdGRfZGV2aWNlX3BhcnNlX3Jl
Z2lzdGVyKCkgcmVnaXN0ZXJzIHRoZSBtYWluIE1URCBhbmQgT1RQIE5WTUVNIGRldmljZXMsIGRv
ZXMNCj4gdGhpcyBiaW5kIHRoZSBTRkRQIE5WTUVNIGRldmljZSB0byB0aGUgcGFyZW50IGZsYXNo
IERUIG5vZGUgZmlyc3Q/DQo+IA0KPiBPbiBhbnkgU1BJIE5PUiBmbGFzaCB3aXRoIFNGRFAgd2hv
c2UgRFQgbm9kZSBoYXMgbm8gImplZGVjLHNmZHAiIHN1Ym5vZGUsIHRoZQ0KPiBTRkRQIE5WTUVN
IGRldmljZSBjbGFpbXMgYW55IG52bWVtLWxheW91dCBvbiB0aGUgZmxhc2ggbm9kZSAoc2V0dGlu
Zw0KPiBPRl9QT1BVTEFURURfQlVTIHNvIG10ZF9udm1lbV9hZGQoKSBza2lwcyBpdCkgYW5kIHNo
YWRvd3MgdGhlIGZsYXNoIE1URCBhbmQNCj4gT1RQIE5WTUVNIHByb3ZpZGVycyBpbiBvZl9udm1l
bV9jZWxsX2dldCgpIGFuZCBvZl9udm1lbV9kZXZpY2VfZ2V0KCksIGNhdXNpbmcNCj4gY2VsbCBs
b29rdXBzIG9uIHRoZSBmbGFzaCBub2RlIHRvIGZhaWwgb3IgcmV0dXJuIFNGRFAgYnl0ZXMgaW5z
dGVhZCBvZiBmbGFzaA0KPiBkYXRhLg0KPiANCj4gSWYgcmVnaXN0ZXJpbmcgd2l0aG91dCBhICJq
ZWRlYyxzZmRwIiBzdWJub2RlIGlzIGludGVuZGVkLCBzZXR0aW5nDQo+IGNvbmZpZy5ub19vZl9u
b2RlID0gIW5wIHByZXZlbnRzIG52bWVtX3JlZ2lzdGVyKCkgZnJvbSBmYWxsaW5nIGJhY2sgdG8N
Cj4gZGV2LT5vZl9ub2RlLg0KPiANCj4+ICsgICAgIGNvbmZpZy5uYW1lID0gInNmZHAiOw0KPj4g
KyAgICAgY29uZmlnLmlkID0gTlZNRU1fREVWSURfQVVUTzsNCj4+ICsgICAgIGNvbmZpZy5vd25l
ciA9IFRISVNfTU9EVUxFOw0KPj4gKyAgICAgY29uZmlnLnJlYWRfb25seSA9IHRydWU7DQo+PiAr
ICAgICBjb25maWcud29yZF9zaXplID0gMTsNCj4+ICsgICAgIGNvbmZpZy5zdHJpZGUgPSAxOw0K
Pj4gKyAgICAgY29uZmlnLnNpemUgPSAoaW50KShub3ItPnNmZHAtPm51bV9kd29yZHMgKiBzaXpl
b2YoKm5vci0+c2ZkcC0+ZHdvcmRzKSk7DQo+PiArICAgICBjb25maWcucmVnX3JlYWQgPSBzcGlf
bm9yX3NmZHBfcmVnX3JlYWQ7DQo+PiArICAgICBjb25maWcucHJpdiA9IG5vcjsNCj4gDQo+IFtT
ZXZlcml0eTogTWVkaXVtXQ0KPiBEb2VzIGNvbmZpZyBhbHNvIG5lZWQgaWdub3JlX3dwID0gdHJ1
ZSwgbGlrZSBtdGRfbnZtZW1fYWRkKCkgYW5kDQo+IG10ZF9vdHBfbnZtZW1fcmVnaXN0ZXIoKT8N
Cj4gDQo+IFdoZW4gY29uZmlnLmlnbm9yZV93cCBpcyBmYWxzZSwgbnZtZW1fcmVnaXN0ZXIoKSBj
YWxscw0KPiBncGlvZF9nZXRfb3B0aW9uYWwoY29uZmlnLT5kZXYsICJ3cCIsIEdQSU9EX09VVF9I
SUdIKSBldmVuIGZvciByZWFkLW9ubHkNCj4gcHJvdmlkZXJzLiAgU2luY2UgdGhlIFNGRFAgcHJv
dmlkZXIgb25seSByZWFkcyBmcm9tIHRoZSBjYWNoZWQNCj4gbm9yLT5zZmRwLT5kd29yZHMgYnVm
ZmVyLCBsZWF2aW5nIGlnbm9yZV93cCB1bnNldCBjbGFpbXMgYW55IHdwLWdwaW9zDQo+IHByb3Bl
cnR5IG9uIG5vci0+ZGV2IGFuZCBkcml2ZXMgdGhlIHdyaXRlLXByb3RlY3QgbGluZSBoaWdoLCBv
ciBmYWlscyBwcm9iZQ0KPiB3aXRoIC1FQlVTWSBpZiB0aGUgR1BJTyBpcyBhbHJlYWR5IGNsYWlt
ZWQuDQo+IA0KPiAtLQ0KPiBTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2
LyMvcGF0Y2hzZXQvY292ZXIuMTc5NDM5MTY2MC5naXQubWFuaWthbmRhbi5tQG1pY3JvY2hpcC5j
b20/cGFydD00DQoNCg0KLS0gDQpUaGFua3MgYW5kIFJlZ2FyZHMsDQpNYW5pa2FuZGFuIE0uDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
