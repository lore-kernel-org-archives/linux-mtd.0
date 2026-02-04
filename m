Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53782E83F1F
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Feb 2026 14:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mI9krmCmfl1eO8TqE4lYyA8C0xmYTheqVKB7voR8lzA=; b=fwGkFaiF8t5k7E
	eCaORFUUFNut+MPi9kdQ2T878IsH8KeaXIdx32rAjVk5zjPcvlQtndtFFzUQluVAtshoG3dWdw6RS
	tFgtZzxu6SQqzcmlXJaH8pKYAg5wZObw576ZCPZ960+DPQp1K2yA3pq9sQfvoHdrWTY0f0lu9CePd
	MZUDTMBR6bN4IljjVCtEtpQXtFmnqH55gIgDDgZwFy9ade4oI9ZdAYnRrifQ2tidbgIEZxZfkYtvh
	mmIG9+QWqraJaiM/zmwBRc8iLMP+aZqKbRrHuXeCJMmdP5xk5b/aOjtQ5hr0aO/8ASqSD4qkop34B
	EgXKDafVH2oc2HLOHGXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vndUa-00000008Z5Y-2VTc;
	Wed, 04 Feb 2026 14:04:28 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vndUX-00000008Z58-14zy
	for linux-mtd@lists.infradead.org;
	Wed, 04 Feb 2026 14:04:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wt4wdoPg8OF8Oq2O/j0VPOV/JUMhc+FDDQtMGtzXLLySVClJfpcPzreVVStZr/GDeL7lLyZ2JPh8odk82KiIoMCp8So5txN0ndOdNcbp4lBXF6iIQgf7eYiwJnNvnsmur39Q0ZgLNEGsEzKegNPSa7jjbqkhkba+7+KS7QJHaO5zp/LF6oonG9sdliBwGjcbWiaro8C+Cjz/XrxHhDvm3nxF/vXwMF/OeB6SpKfzWEaA5zEv4GEF3HIEkpeDZy5KwVZHjHqc3OMIsK17fSS5IirfRsSvoPQkLe+V/Dfyvn3cinMFL7x5RJKFXw2BryZ3MVPM7bG6Ao5BiOgQLMtl6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tGyZ8rFC0XOtePoEys4xYI/MwEF5AbHGfRE8IRb5ohI=;
 b=Zfdy1BHd9eGa9DijqXSOQQLjLhvcCzD2AZLTXNfumeXxtT5mG6iChAcleGjsv1o9jhEoPDdMe8rpN6Pgumxe6MLbxnGpnZDVBNiFE8a61Wkow3f/g/NW2QX6XrL4yVAw3/MTR6C6AyGCdEAtB1KitgcJSmIRvxsgfjPUWO86wnKFaWR2Q0rJiSNqCZpeWeSyTsCqv6plCJZqv8Dr7wY6vcrkvu1/6dqm3ohm+UmzLct513d4vcRQAkygGwsvonsF1X6xS3qkhCXWwGaYwXewuQB9TEZ2AY8dTajsLbMTbfXAUqXzFtOqBPryPbP9/ioHL7GSOe+Hf78PEki0VGmDZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hitachienergy.com; dmarc=pass action=none
 header.from=hitachienergy.com; dkim=pass header.d=hitachienergy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hitachienergy.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tGyZ8rFC0XOtePoEys4xYI/MwEF5AbHGfRE8IRb5ohI=;
 b=ocrBiiRwJxqejhJEFQ/fOEgxfpIX9i/czlpPJWzsVGzV0yiOJZ60kUT6nVe03DoG5l8bl5tQw3uYg6B15fHX+FWpSPPiWuU0b7hG8oFVLiBIkDPYmWcXlnFHt82Dggeb4gjYn7LSQqTMWTG+6sL5s3jv6eXIFuc4poVCuGMvC2ZStyxk9XYS8AGh0NaFwYatrrCJvXI7SY4NrydFvsOsc0tc587zISworh4rOOCZ5J5/APyN1euKhLy3G54YNMH12fsKjYTLiA/jttWn8KzkimLHwOt8ghgbd4atK3FCNSOgaVZvRYlKUa06WUNVkd5zBv+qsdL5Z8gEmrJMymloZQ==
Received: from DB9PR06MB7849.eurprd06.prod.outlook.com (2603:10a6:10:291::22)
 by GVUPR06MB10718.eurprd06.prod.outlook.com (2603:10a6:150:31c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Wed, 4 Feb
 2026 14:04:19 +0000
Received: from DB9PR06MB7849.eurprd06.prod.outlook.com
 ([fe80::f0f5:da:c159:65ab]) by DB9PR06MB7849.eurprd06.prod.outlook.com
 ([fe80::f0f5:da:c159:65ab%5]) with mapi id 15.20.9564.016; Wed, 4 Feb 2026
 14:04:19 +0000
From: Tomas Alvarez Vanoli <tomas.alvarez-vanoli@hitachienergy.com>
To: Zhihao Cheng <chengzhihao1@huawei.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
Subject: Re: [BUG] UBIFS corruption on powerpc 32-bit targets
Thread-Topic: [BUG] UBIFS corruption on powerpc 32-bit targets
Thread-Index: AdyRCkfQa4Zi0XkcSIOaDwEHvEKqQgAfkK0AANfexzAAKpBxgAASt8aT
Date: Wed, 4 Feb 2026 14:04:18 +0000
Message-ID: <DB9PR06MB78498340513D9788FC7576FDC298A@DB9PR06MB7849.eurprd06.prod.outlook.com>
References: <DB9PR06MB784979B96C388174F81F9103C29EA@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <356439c2-5289-57d2-52d4-8b436252a630@huawei.com>
 <DB9PR06MB78490A50AB800FB36AEF5E74C29BA@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <b93ff0e5-79ad-ff73-bdb3-e7e7d5c35256@huawei.com>
In-Reply-To: <b93ff0e5-79ad-ff73-bdb3-e7e7d5c35256@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hitachienergy.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR06MB7849:EE_|GVUPR06MB10718:EE_
x-ms-office365-filtering-correlation-id: d6214fe7-8608-4504-d993-08de63f64a26
x-he-o365-outbound: HEO365Out
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?jzHPZqZgDz2fe2Bex5AQoHDkoxmyo5IWZ29HnKjN3lqT3EvjQSmAXGuoD/?=
 =?iso-8859-1?Q?oP4RuIAsp4ADQ8MwZYYlz10SSiOXJ8fbNDZ/H0JiHWFKIdAMH6jcx5lnqS?=
 =?iso-8859-1?Q?fJv+8/2+1B5R4mh2WS4xSxmBrW79w3Y2trttPk3uz4rQvOacMou6pZF87Z?=
 =?iso-8859-1?Q?+4ZN6jfNskbrRr3uc9VKcckIawe0KsbQwwpmkaVXFY5epx8DySBQWLYC3x?=
 =?iso-8859-1?Q?o8jJZQKKBpvitRUI4XT90VxNriC7/nueslt6E8551IuIOldsSmrbslQLN9?=
 =?iso-8859-1?Q?+bGihALH534/Eve5S3bni98a5fIu22Zfmv8BnIcSlbZWkiqgee1B9C4JYx?=
 =?iso-8859-1?Q?ZFQIALXlox0Gj0GCCgTU+qmhtYhYjbaYSE6kYcFnb8I9gBEYfKWGdwXZeV?=
 =?iso-8859-1?Q?R+2yDxDsutPtQUWWqI7D++kPjpebSS7m38Afqno/fP/n3c3TYHhCu77o7g?=
 =?iso-8859-1?Q?4ui1C/tl80hTbGYQXCP6BHxQ9+pqMFjSZsLel0/Uo7LFqXQI857BHU5Ysm?=
 =?iso-8859-1?Q?Ix/Ga2clDOQ4oF0wrKa9ix94fu2Bldi/ZzaeqP2Bm90GxEjQGajQGiNem4?=
 =?iso-8859-1?Q?AeqlMK/4axqpm5SDAu2fgpeLlXTsHP0BtavjhhPXaJgO6DHI5ddbpWUPqR?=
 =?iso-8859-1?Q?oJdq/4zphFa947CVkyrHu0v89LnWBAB8kNf9JDVmHf70kvw+qCXaN/wSBU?=
 =?iso-8859-1?Q?Kob9/J7cn/GEgVifPTH4IQuJVlcBQZst9IMRNjzT6ZHcM/L+nREeEnD65h?=
 =?iso-8859-1?Q?FyCpvqY8leLI6e2DRcOOOTMSJKuP69W0exWQi+JscZ5DuQPozvarHmTPL0?=
 =?iso-8859-1?Q?ygNjTEAcBKZUg1OgNu7o5IqolFXNNPguQztB7ThivQ8tr3OI47vEi5C/KL?=
 =?iso-8859-1?Q?DJ79wOnwww59dd+sVNS0j8VkpIOEnsuZ6q/u7FT3f/NQ2r/FUtIXGuXWLN?=
 =?iso-8859-1?Q?F4jJSORg1V6WBK9nEJi3aYu9ngAAdSgOOMMf/1Aqj1tT2OkBZsVNheH90w?=
 =?iso-8859-1?Q?2nFxe0Rjdfd6Bu2Hcp1a7xL3B4oSST21JDKbq9NYWiM29aykSvHR3MiJy5?=
 =?iso-8859-1?Q?7rindA/y3jU4BfZyjtvIGT3s16BzVrM/C+lyCx1/monCliDZOYxlwH2/iX?=
 =?iso-8859-1?Q?nOuI4XxjMygk6xPekSkGsM0HqzAJzyXk7EdzJWoPaYgJRIrh8tUPMnl4Jo?=
 =?iso-8859-1?Q?MULw7J8aDkYtwWrAKA+pAfFEBrlIAlKiIzyjPcpF53jS5cMBlSEyIt8uCL?=
 =?iso-8859-1?Q?nvzHnuy005n4jFQgEC/qVQNomI2C5W2hN/PQm8UWpsEn6V89nNTdFxUNUi?=
 =?iso-8859-1?Q?xbvueOnYlbGJw8LtCnPne2XaHiMdIDDZ9/pg+bcGl7+cm1yLM31Xqu42zY?=
 =?iso-8859-1?Q?32ak89x1G5zYE6iQtWZRJBulj6+vWHBOzaUO52hsQGnrlo9DGoAEXWTOcf?=
 =?iso-8859-1?Q?oUgQtRnftaCqMM4pYwacg5H5GpHAaXAmJtxSQEfuMPcZfLV+MdosqTRznm?=
 =?iso-8859-1?Q?Z6GBiW+15SPb18tr+GVTxGhjKWBTdCQLOr3dtTiNTBIlKsR7ndqVHYheIx?=
 =?iso-8859-1?Q?k1kRPAZlm62BCsET7zpIIXGHajZMQTFXRQDFx9G++SSu3B/bEO+0y7OhnH?=
 =?iso-8859-1?Q?9DGESuM3mEyQvKqqJ8wRzslLWyzpi4iNgZeHvrtyAlN+URAQjXyKc6iuVC?=
 =?iso-8859-1?Q?4L8q+FGGBDTsDz26Heg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR06MB7849.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Dn0b6FJIdns2V2p75zSaR58cFAiCvNerLlSpSAByq8LGTvsSHWGbylCs4r?=
 =?iso-8859-1?Q?ETmPSsW1tXv0JgOcq+Yf2dFk3tRaAeoYqMU0+xQ7TiuBzIp9NyctaNKT5m?=
 =?iso-8859-1?Q?9hUILt806g9eljveAGLdqoji/hpJmh0YCEQWMjocEYh7NB7uZNouc/kcNL?=
 =?iso-8859-1?Q?OnxR1ajTPKDg6lXfpAOQJ8uWlPKkC1/0+GOAmh0E9TErIIzyEm/aFE6knm?=
 =?iso-8859-1?Q?hly8anXINieTQAH+RhXHPfcsuXN8eZvmyhf7SauAyp+vDBUP2nliqsaP4h?=
 =?iso-8859-1?Q?JySv8VJqgALpjmDZNRJFb/5Up8nV1KBCJAa+qKLYXil1GfLI3AvInfzH8n?=
 =?iso-8859-1?Q?n49SuUOt+s5qiuVan0sz1NoL/ihzumKXEaOrzStK/Lhlx4GG2wre3bD8AM?=
 =?iso-8859-1?Q?2xuXHbWEn4bjNRYYd09P3QW3GASXkgdln2sqt6JMDbsGGqCSLKRPC3HdSo?=
 =?iso-8859-1?Q?cK9P3vWmu5Ml/qQdHgUtZVEv4lIRu22sJE8/Y5CFUHtyTsyKZ95JapZj+c?=
 =?iso-8859-1?Q?Py5rWURrBw9ToIgB2skp+IoOl82+5NEfIC1jRv+RHBoz6Qw08h0AVyOxuQ?=
 =?iso-8859-1?Q?CdR2PN7g510eDhClzCuGqa35PL+bZa9cdKdLxQsr+1Tv6Tln/l/pIkP8dy?=
 =?iso-8859-1?Q?2ibb9ekvD862O0oCTqJTQfB32bzBPSSy5I7JATBJS3M5ZqckWw4F+Fxeqf?=
 =?iso-8859-1?Q?mMo86YOXsfRjurDDx+MckdrOD1v3vOsxHqS2OIKFSG+pg/81aYXfzyzCF6?=
 =?iso-8859-1?Q?zsjyBPZaaUeANcQ6V6fcRBAM7ruWz1bUZuOJB/2TzPWR6fbyPoAFP1aXLR?=
 =?iso-8859-1?Q?Pjy7tMp+BbaKpraFkrtQg1hFhw8/k/PQvWhQzwQ4hFuDt3zlu4oLreILrq?=
 =?iso-8859-1?Q?8g8M/sMUySkZ+fOYkt7ndsmsjB7gI68Vm7IHR1xqHySRgfv0gtJuYQkJM6?=
 =?iso-8859-1?Q?8Au/3m6p+4gr0YC6uf0B0X82W7H3HYQn7uIaMaIpT2fMVnECF6cCRrGMHs?=
 =?iso-8859-1?Q?qhKMjfiz14FiRbUoItQJZIYjKTMri2fZrAPbrZwCshUGF/i2BvkAXS3KIF?=
 =?iso-8859-1?Q?qda69aWEzs/+9l0bsGMbgTtF3qqQLNLBHoJnwF0W0XFkiH9rUlF0my+5rW?=
 =?iso-8859-1?Q?ezIBvmze6LoJGM7sczkepkey2aQ73bM5/fE/lyfbB7D41O5B4Iz/aOqDWx?=
 =?iso-8859-1?Q?f2bLiZyrrt8yeBDs8PMkifaTR9pc5NCoF46urrnti0jGgLVw5amU5awIR4?=
 =?iso-8859-1?Q?frjjfBZHJL5TNLcZyScpo1RHaFbA8iE7L4mAvTPr3DXL0gkW2uEgQXrNwW?=
 =?iso-8859-1?Q?PxHbd2fXhPphLENDMzUe3V9C51xVLIe6FoigH81jZHLoC/apNgwH4BNfjz?=
 =?iso-8859-1?Q?dMGCHGafERijOROdkmu/IKhh5tmC6yFWXDKUlJ+9Uqam1z0mwgyk3x2Dqx?=
 =?iso-8859-1?Q?3zRi/oqTe2To8Ps+DjOae1GCQSPvTUqhqNT6aMa3Pf+tvZnQpOL18WPqT1?=
 =?iso-8859-1?Q?wywzR5UI+gjIHJ0QlEYBOdRJIun8i+DsIdZWwjve//Sm8FmUujw5Egm4uC?=
 =?iso-8859-1?Q?Txg6fwsIG4mAujVGqmIdruL5HooDZrYaBNgEUv1PgvK5IahStnz0kZ3O6P?=
 =?iso-8859-1?Q?Vd6pf0SB5tESqJYFoM6Pp00VbR2vSm4/8EhOmiWwnmgUbJiCx+lqg2Xtjp?=
 =?iso-8859-1?Q?YlD4kdDGyNd5rrCnm42H5P3dmJJLtbEqwpl/fNBowQM1d21zLMuMoaiMhJ?=
 =?iso-8859-1?Q?zBkmfQJSGbq0xr6isQe4kJqy7En+qNLzeqf7ZPaIf3slgmGHRvWR1Euivu?=
 =?iso-8859-1?Q?d/pp8c2wKiPXs8gptCijWm6hPD6mJJTsTXxxLBrnDcH3NOUbj1JH?=
MIME-Version: 1.0
X-OriginatorOrg: hitachienergy.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR06MB7849.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6214fe7-8608-4504-d993-08de63f64a26
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2026 14:04:18.9853
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7831e6d9-dc6c-4cd1-9ec6-1dc2b4133195
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GLCyoqQwsBRUIr709RTSohggShgqce0uY0lOYFeqOPUH5ZBF6XmRgaRmBGHyVAJQOufkyRTbPVW8wxCi3ccvXP3kCKOQCxlFvJTOya2UbCu1EcBqYqQFbOMFoZbtv1Il
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVUPR06MB10718
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_060425_329847_9938519F 
X-CRM114-Status: UNSURE (   8.58  )
X-CRM114-Notice: Please train this message.
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

>Try 'fsck.ubifs -g3 -y /dev/ubi0_1'.

I downloaded and cross-compiled mtd-utils for ppc, not sure if I had given
some wrong param for configure but I was getting a segfault at 
ubifs-utils/fsck.ubifs/problem.c:236 (log_out in FILE_IS_INCONSISTENT).

This is the backtrace of the crash in case you are interested (otherwise skip
ahead to the run that worked):

```
(gdb) bt
#0 __GI_strlen () at ../sysdeps/powerpc/powerpc32/strlen.S:98
#1 0x0f7ec038 in __printf_buffer (buf=buf@entry=0xbffff748,
format=format@entry=0x1005bd38 "%s[%d] (%s%s): problem: %s, ino %lu type %s,
nlink %u xcnt %u xsz %u xnms %u size %llu, should be nlink %u xcnt %u xsz %u
xnms %u size %llu\n", ap=ap@entry=0xbffff838,
mode_flags=mode_flags@entry=0) at vfprintf-process-arg.c:435
#2 0x0f7ec608 in __vfprintf_internal (s=<optimized out>,
format=0x1005bd38 "%s[%d] (%s%s): problem: %s, ino %lu type %s, nlink %u xcnt %u
xsz %u xnms %u size %llu, should be nlink %u xcnt %u xsz %u xnms %u size %llu\n"
 ap=ap@entry=0xbffff838,
mode_flags=mode_flags@entry=0) at vfprintf-internal.c:1544
#3 0x0f7e211c in __printf (format=<optimized out>) at printf.c:33
#4 0x1003da80 in print_problem (priv=0xbffff970, problem_type=<optimized out>,
problem=0x10060494 <problem_table+184>, c=0x1006d2e8 <info_>) at
ubifs-utils/fsck.ubifs/problem.c:236
#5 fix_problem (c=c@entry=0x1006d2e8 <info_>, 
problem_type=problem_type@entry=23,
priv=priv@entry=0xbffff9f0) at ubifs-utils/fsck.ubifs/problem.c:354
#6 0x1003f9dc in handle_invalid_file (priv=0x0, file=0x1011c890,
problem_type=23, c=0x1006d2e8 <info_>)
at ubifs-utils/fsck.ubifs/extract_files.c:844
#7 correct_file_info (file=0x1011c890, c=0x1006d2e8 <info_>)
at ubifs-utils/fsck.ubifs/extract_files.c:1496
#8 correct_file_info (c=0x1006d2e8 <info_>, file=0x1011c890)
at ubifs-utils/fsck.ubifs/extract_files.c:1473
#9 0x100439dc in check_and_correct_files (c=c@entry=0x1006d2e8 <info_>)
at ubifs-utils/fsck.ubifs/extract_files.c:1552
#10 0x10005f94 in do_fsck () at ubifs-utils/fsck.ubifs/fsck.ubifs.c:490
#11 main (argc=<optimized out>, argv=<optimized out>) at
ubifs-utils/fsck.ubifs/fsck.ubifs.c:622
(gdb)
```

There's a warning about the formatter used for ino_t, used formatter is %lu but
ino_t is long long unsigned int. 

Anyway, I split the logs into one call per value and ran it, got the following
(patched up the log into a single line again):

```
root@kmcent2:~# ./fsck.ubifs -y -g3 /dev/ubi1_0 
fsck.ubifs[182] (/dev/ubi1_0,danger mode): Read superblock
fsck.ubifs[182] (/dev/ubi1_0,danger mode): Read master & init lpt
<INFO> fsck.ubifs[182] (/dev/ubi1_0): ubifs_load_filesystem: recovery needed
fsck.ubifs[182] (/dev/ubi1_0,danger mode): Replay journal
fsck.ubifs[182] (/dev/ubi1_0,danger mode): Handle orphan nodes
fsck.ubifs[182] (/dev/ubi1_0,danger mode): Recover isize
fsck.ubifs[182] (/dev/ubi1_0,danger mode): Traverse TNC and construct files
fsck.ubifs[182] (/dev/ubi1_0,danger mode): Check and handle invalid files
fsck.ubifs[182] (/dev/ubi1_0,danger mode): problem: File has no inode, ino 0
fsck.ubifs[182] (/dev/ubi1_0,danger mode): Delete it? y

fsck.ubifs[182] (/dev/ubi1_0,danger mode): Check and handle unreachable files
fsck.ubifs[182] (/dev/ubi1_0,danger mode): Check and correct files
fsck.ubifs[182] (/dev/ubi1_0,danger mode): problem: File is inconsistent ino
184322 type dir nlink 2 xcnt 0 xsz 0 xnms 0 size 472, should be nlink 2 xcnt 0
xsz 0 xnms 0 size 392
fsck.ubifs[182] (/dev/ubi1_0,danger mode): Fix it? y

fsck.ubifs[182] (/dev/ubi1_0,danger mode): Check whether the TNC is empty
fsck.ubifs[182] (/dev/ubi1_0,danger mode): Check and correct the space
statistics
fsck.ubifs[182] (/dev/ubi1_0,danger mode): Commit problem fixing modifications
fsck.ubifs[182] (/dev/ubi1_0,danger mode): Check and correct the index size
fsck.ubifs[182] (/dev/ubi1_0,danger mode): Check and create root dir
fsck.ubifs[182] (/dev/ubi1_0,danger mode): Final committing
fsck.ubifs[182] (-): ********** Filesystem was modified **********
fsck.ubifs[182] (-): FSCK success!
root@kmcent2:~# 
```

Seems potentially the size of the node was wrong?
After the run, the fs is, as expected, not broken anymore.


PS: my email client might be omitting the in-reply-to headers, sorry about that

Best regards,
Tomas


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
