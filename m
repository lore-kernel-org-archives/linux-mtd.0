Return-Path: <SRS0=UGcd=OV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2612C433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Oct 2021 09:27:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A27C60FE8
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Oct 2021 09:27:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6A27C60FE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=20WP4O7Go4mT5Ue89aicdHkRDpaSjzLAnH08WSF3NeM=; b=zNuhibuc+YezfP
	yfzdHvLiCbl6F7ALngZ6iWoKSSHto78CMArFLjQRNIllogC28u8MJ1d95wouLhzwJmig2MOsoQcLC
	bw+6phkTJJZxBzse8dUYhnLDwFIdkJtFg2OdkQxW1VTUFoZy0z15WIwUWuXmfHmgHi1aeWgfgytTM
	5efNOgplZf72IWfWCIR+fXpyh5qCjRueiPfG2YVQMa1XnYE4RibgVLBSj+cktwleUJpN+2/UF9m0+
	A7nmj5Qu2o+FQJX1JMSzcMJu+f1WuojCf/ZKne+Cuo1wMU5LSo0+mLYz1pE5GkkOa1BM28BUrKysH
	zh//bRVaCWcMd6Xn1vQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWEoD-00HE3j-D0; Fri, 01 Oct 2021 09:26:25 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWEo9-00HE2U-PZ; Fri, 01 Oct 2021 09:26:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1633080382; x=1664616382;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=YimfOojAldsnMDfgFRq67yG+l1xjTmJyCwsM1lveNnc=;
 b=jCngASVvUatAKcxlOFBy7cFT4eSh9DKMBdaUxojVthHIySzwm9nQE2WG
 oo2X2OFmPoNR/NTnwKv0cMck/li3rBQrwYktVqi5+7efr2a/iJo3N2OwG
 dv8FFf266ogd9xMAIQKQdXP607sA8x2AsuOHZ0RNL+Eq/oYTUPWbEHGV6
 Aa91SR/09WxshCjgCFiXuP5GvckBaPRjvBcUwTVCFwhHbbIj1plzAkMq5
 AhOQZC91UaSuWEm3tTKN4LOG1E4KYv7zQ73a1/Nz3mCZ95JYl+Oj4NVW9
 INDlt4jD1XpRRDk+nIrXh7M+GINOFeE0IlI9yxqE8hJKyvVjgGeAzS1iV w==;
IronPort-SDR: kCx0ns3di5OJi2RCHwKoJ+yvjgGwYw9hdLjMNB1uEVA7mfkjcoLva5T1xbJeQwFmg8lkfdL12P
 yK7xyj4rkuhRhT91Il7gydr6GumUVo0lsB9u2Wo7Q/L5Fek5ZUK2+hCDIcQwsJ0WDLYtNgGeE8
 smRez9RJdjl8p3zOv3n0saBFnue/H4i6TeQ3UdO9REojXcZCppuhZi9oqcEa58Cx1DSvmhqNng
 Ookl/Kma27jQnSg0DML6VEVl33vqKMOyD2rKtzdN1mcvurZ09GAs2WGObn/VqoXNk6E2xWxGcZ
 Nx2hC3ARyUiUSGcvNbtZScpE
X-IronPort-AV: E=Sophos;i="5.85,337,1624345200"; d="scan'208";a="138690518"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Oct 2021 02:26:21 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 1 Oct 2021 02:26:20 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14 via Frontend Transport; Fri, 1 Oct 2021 02:26:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GH31/zTfwehJuDwWXVLS6A/+LlXCe1+chGxvBOPWXoZu1+CflAzz2RxA7ND7pA7wPR5Nt1zcierxDFNvtG5ftmkyN13Shikv2DAiXON0P1O4VwdT/9oEGdmI5jTqTX00rH3040GVgT0FnZQZ29kD52v01QTzTxat+HuIVhgjLweZ8EFu8bOlgkS0QWZ7ScK5qEPuF9tI+kIn6kt7wmwbo2VDXg1GQHiTBI3dVNh4IQfY0k0xcHmHLXBxRC0eqvzoLBk5HxhJ2Cj9G/Vi6z5dXSJAfZGYFR/pTURreelIsA7nxNcU6AGOaO5zkkYjxdLGgFEpKO097G8JnlK7KSveAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YimfOojAldsnMDfgFRq67yG+l1xjTmJyCwsM1lveNnc=;
 b=i4T8T8jrBdlbWaifTZ+avJO5noaV/lpBa1JPY7FztxIFky5iqB5goBhVmSuttc7cSv4qXmxgKCVa8JiT9SlAfLXxDNDYvlVLPAr3L20Kv6mQQmFm8kqbwDVkMj9GY8Ut063tDPK8oxF4IBstUhsHzfLPPd65ICXY/3i+KIMGJvv1KEiur+3+TQrKlHbwx43aa1TGa467QzIquPKfog2fnN+kc3Qb7fnP2aL+Zxzg1FV6Gu3aZocuoMwO9H0Tsp2BrFlQ6afkPjo/4TlIuUWwP+Eh9ehIBAAp9xe4K9Ap9+RrXGa0L7M/Oi0EhJ+P7hMoirpNrq89Cl7EhMkeQf0dig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YimfOojAldsnMDfgFRq67yG+l1xjTmJyCwsM1lveNnc=;
 b=mXrzegRh8o8UwF0sjzTX9a9t/VWr51bQmIniQBBHf4R5UTWL79/6r4EuXybmLqPhFe7aoZ4fYK2t3VhVTJRjpigsgogwezuDPtfrjUgLfezNwQw5Uta6GtqV7S53gqU6NNEGTa1YNIlxb9xc5Yw6WusmqrzxSNGT+U8NqWYYSfU=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA2PR11MB5164.namprd11.prod.outlook.com (2603:10b6:806:f9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.19; Fri, 1 Oct
 2021 09:26:18 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::a496:d4af:df74:5213]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::a496:d4af:df74:5213%9]) with mapi id 15.20.4566.019; Fri, 1 Oct 2021
 09:26:18 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>
Subject: Re: [PATCH v2 06/35] mtd: spi-nor: manuf-id-collisions: Add support
 for xt25f128b
Thread-Topic: [PATCH v2 06/35] mtd: spi-nor: manuf-id-collisions: Add support
 for xt25f128b
Thread-Index: AQHXtqZiWY57Y1oUHEWzVUKyDbl+AQ==
Date: Fri, 1 Oct 2021 09:26:18 +0000
Message-ID: <ce7410d4-1f2d-58ba-4c6a-a35aeb92bcf6@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-7-tudor.ambarus@microchip.com>
 <20210816184348.sabnihh7b2sf34s4@ti.com>
In-Reply-To: <20210816184348.sabnihh7b2sf34s4@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 17f48ff0-204b-4f56-6644-08d984bd8616
x-ms-traffictypediagnostic: SA2PR11MB5164:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA2PR11MB516486CA6E6CC745C615B129F0AB9@SA2PR11MB5164.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hxo6BQuOPbFXZ03iETM+ImNhW7ivMKGfsYYoNxgCrhYCBJEFqs1H0rHDcgc3XRx9OyYWP/4FEHzceMYTSBssE8VH4oJrLWWGcpYN9NGyt7RDl8qo7kkItaYmkMGNUX2v2aPBh7PEUn/srmCN15T1RNGhbvHkPbVxA8CGelNAATz9e2Yv+ScVp+9wuUythd8Rd4iCUwvCJZZ+biMPWnm+Pj9wHSWYp4BJqqiabDef/i63NBsjEoWGjroxBR6tpRJS0ixHixZiFVLckBFgsloda1gyGZnBzmLg0f04WWXSKDuKtlcYpQ392Wbi/tMs1YvS/KNrAAEEu0LLhDRumwrrURHv1HcHs9lqRf3H+s8lsxtJk9iljBtWSa5pnACMWeJHX6+oXweuRl3G1wsfjn0jtFGdj0Ru3GYaYQmzzfmJGDQ0kAEiea0HF9XplcZnP4sfRreu5PzKDk168FKfqvNWDyIAWyJPdLEeffnVi2IikTH3DKG2gAXo/ciPVimBHuGAPQIH7m4O9JRuszbDJL1macD2GlCeCNYwBzqi8fKABGBfQ7T+eMmJK8eqE6ENC8k5Htou9RmY3AaUHjVtpNKdcomN6PTH0P5OWNPHNhKA20qzteTF4sknmlYAhGcFCbIeyd971ENIW3MJxffKeThBbEGqBGQD8HuR6ZP8GLlYCcDtximjzgl1dbKrisC5AXzKDgEX52IiVLK0TG0DhcKgrhtu6rA7ge6p2M3uojMriiGIXT0bbPLl1DsHJjAbymfiQ++roQCQQXY2quWP1vUf+z/H5nwUrChNbfJRuxpDuJXWwlVuRHDFMN2qdoc7wBF9
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(4326008)(83380400001)(508600001)(31686004)(76116006)(64756008)(66476007)(66946007)(186003)(6486002)(2906002)(66556008)(91956017)(86362001)(5660300002)(7416002)(66446008)(71200400001)(38100700002)(122000001)(26005)(316002)(38070700005)(6512007)(107886003)(31696002)(6506007)(6916009)(8936002)(2616005)(8676002)(53546011)(36756003)(54906003)(138113003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NE4yQjNSVUd0bCtnWjBWSnplTG9OSVJnWTM0d1RZOVNRWkxoYWFpWjhYUzFv?=
 =?utf-8?B?SzFuRFhacVJ4SzRRUmlyYnlRZ3NEY2ttWGxYY3pCMXJOaThacElEZW1yR3pD?=
 =?utf-8?B?L1V3bTYwaDVodERxbk1FVndZMGFOMFZ5Wlpkd1VpL0ZENzBmeUh4NnNMVmFm?=
 =?utf-8?B?SCs5ZjNDUTdmc3I3UFdWbFZVYkZ2N05hNmFxa2JKUkI3SkxjM1JhK3ZReG5j?=
 =?utf-8?B?NUMxVXdReHphUnc2WndjY3hYS0RGeW1JNmVOTjgwYmV2czVMODJueStNcENB?=
 =?utf-8?B?S29mUmowVVBkR1VxNEtUU3Nydm9XVEtNYW9MN0ZORk4vdjQvWXk2U3FNYlVL?=
 =?utf-8?B?enljeFY5bEttc3oraE4raXVqNG9nL1hMQ29BSUZPcEVuVWFTQjhxMndQcE1q?=
 =?utf-8?B?azdHdC9MTkhpU3R3REQwWHBNNkRteE1ERVVCRWVrUnZtYlljTXNwNk1raFBt?=
 =?utf-8?B?clNJVXZET3hwYjh5akdkdFpoVU1pRURnME9rZ1lnM1dZQ0tDOVl5VWxiQk9a?=
 =?utf-8?B?V1VwZmtTcU9ZSlh4eGsrSWhKME14UU9rZVhZQW5UYkpxVGQvWEY2MEdPanJk?=
 =?utf-8?B?ZTVFQk5tTUZlU1NBWVlLV01DM2Vjd0JVcExtQU1NRTJ3VHdjb1REaUgvcDFE?=
 =?utf-8?B?N1JENjQyOFRKMVBiVlRreEV2N0IrYmkwNDRKcHU4Nmt3YWxUcjVjNWZZaklJ?=
 =?utf-8?B?bjA3T0REeHNaUFYwaW9XRUE5TU8vdElONmNGTWVvNWlGYmhsZFgyNGJxZnpn?=
 =?utf-8?B?RjRVaU9EWmhLalpwS2xMcXZBeFpoSnRyN1J1UlFhMVJEOEk2NGQycnZMeDN1?=
 =?utf-8?B?UjRtZmZJZDQ2WVJjdUZkNEErUHl4d3FmdlBEUnY0RFVlTU5iTmpwblhZaE9z?=
 =?utf-8?B?OTg2RHVGM2lkUE5XVWNpVitGTmpnYkNCQ0ZJV2pXSVptUzU2a2QveW1WK2FI?=
 =?utf-8?B?SlMzN2h5TG5KZk51T0ZtOEFDUlpYWkU1NzRlWW1XY1J3L1FNNTV2RzJrSDRQ?=
 =?utf-8?B?MDhKdno4U29JblhCb0F2MTBIVTBwUUtUSEU1a29DQXB3VDZLQlFlVlJyaVo5?=
 =?utf-8?B?VmVtVE5FZnljMmlDWDRhcEVuRlhUb3h4cEJLcWt4ci9NMlpTYWNUemNjZ0hv?=
 =?utf-8?B?QWU3b0pNbEdDaWVydW5ZR0Z1b3MvMytnTE5qWG53dFdJTzBvelFRTzJEM3Bw?=
 =?utf-8?B?S3ZVQ2o1M2w3Mng5Z3pSMTMvd1BZaVlDLzZFUjhmdXVCSG5CanAwSnZDR1JP?=
 =?utf-8?B?d01RY2J1SnVnS2xsSjduL3RzYmt3ckI0OEhBczczZENQVHRTK0ZuOHBmMHdX?=
 =?utf-8?B?all5VXlscUxmeWlxNGw2R0xqSXV2OVZXVE1zTytiUUI2TlU2MW56Q01lK0lP?=
 =?utf-8?B?aVovVFlGZVhuTU9NMEE2RnppaXo4ZG9GZnJQTVJmYTBPYUIvQkxqcWErQk1Z?=
 =?utf-8?B?amRXTTF6b21aYTFCTWE0TllqclhsMEc2aG5DZHFkNGIxakVib0hJdTBoeDlF?=
 =?utf-8?B?MzQ1bHkxVlVTVVdSeGZiSnMwSG9oKy9KbzZuUFNvNjFtZ0ptbGptVndES2pR?=
 =?utf-8?B?UnNITWRMaUlOVVMwTW9XT2pod0hILythUUFRZkJEdmpzcGdFUkR5UEFmaUhT?=
 =?utf-8?B?cmt6S2pIMS9RUEI5NWFtVGk4RXJpcGk5T3kwdWpIQXBMdmIwbllZNVFGTjVJ?=
 =?utf-8?B?YStnSTZZNE5NcEdkNWNkMzgvRXhHc1BmRmExdWU0RDMwU3ZQVVdIYjFmZE5B?=
 =?utf-8?Q?zkTMF/CUHuVs1fU7EU=3D?=
Content-ID: <7EAF126C533A574988D687E4976990B7@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17f48ff0-204b-4f56-6644-08d984bd8616
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2021 09:26:18.1691 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EcpQYY5wCAt86IC2DpY2rsvtsWLPznfCCbGC2+pJ5ho863O66G2/39WURZYMPNCanu3R3btI1DxP5YELwhPUO7ejM2NOEptp4ohe8fjNArQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211001_022621_879918_BFB3C58A 
X-CRM114-Status: GOOD (  21.03  )
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

On 8/16/21 9:43 PM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 27/07/21 07:51AM, Tudor Ambarus wrote:
>> Flash does not support continuation codes and may collide with a flash
>> of other manufacturer, Intersil being an example .
> Nitpick:                                          ^ drop the extra space

thanks

> 
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>> ---
>> 0000000 4653 5044 0100 ff01 0000 0901 0030 ff00
>> 0000010 000b 0301 0060 ff00 ffff ffff ffff ffff
>> 0000020 ffff ffff ffff ffff ffff ffff ffff ffff
>> 0000030 20e5 fff1 ffff 07ff eb44 6b08 3b08 bb42
>> 0000040 ffee ffff ffff ff00 ffff ff00 200c 520f
>> 0000050 d810 ff00 ffff ffff ffff ffff ffff ffff
>> 0000060 3600 2700 f99f 6477 e8d9 ffff
> 
> I think you should list all the other sysfs parameters as well. See
> Michael's comments on patch 35.

ok

> 
>>
>>  drivers/mtd/spi-nor/manuf-id-collisions.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/manuf-id-collisions.c b/drivers/mtd/spi-nor/manuf-id-collisions.c
>> index bf7dba34f018..db31470ebf6a 100644
>> --- a/drivers/mtd/spi-nor/manuf-id-collisions.c
>> +++ b/drivers/mtd/spi-nor/manuf-id-collisions.c
>> @@ -13,6 +13,10 @@ static const struct flash_info id_collision_parts[] = {
>>       { "by25q128as", INFO(0x684018, 0, 64 * 1024, 256, SPI_NOR_SKIP_SFDP |
>>                            SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>>                            SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
>> +
>> +     /* XTX (XTX Technology Limited) */
>> +     { "xt25f128b", INFO(0x0b4018, 0, 64 * 1024, 256, SPI_NOR_PARSE_SFDP |
>> +                         SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
> 
> I have not went and checked, but I assume these two flags can't be
> discovered via SFDP?

Locking is not covered by SFDP yet. The non SFDP discoverable flags will be parsed in a
spi_nor_nonsfdp_flags_init() method. I saw you've spotted a bug there, will handle it.

Cheers,
ta
> 
>>  };
>>
>>  const struct spi_nor_manufacturer spi_nor_manuf_id_collisions = {
>> --
>> 2.25.1
>>
> 
> --
> Regards,
> Pratyush Yadav
> Texas Instruments Inc.
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
