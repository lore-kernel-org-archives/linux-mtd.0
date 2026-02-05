Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A4BECD983
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Feb 2026 15:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7rNqhk+Z2RzKqnnDEqIM+XBPF63h0Vl+a0cfGh4Mefk=; b=DSPjoi7Y60HW2h
	RONnmt5Nq3LMYm9RP55AVM9jd0zxJ4Ob0p6DyLZ16ctbioRFWjg4bc/cz4OEQZF1pL0TySmU+eMAK
	SEyclzCWWHC4h/AhqsJcMDhuiNdUiZQ2hkZllTjsOHoNH8ppj97DT6B9DSsnTWjMeHNZAwqBkuGso
	m9o3BkUohyvbtUK0xwUHxfQBhDqy8XqxFjpvWfJsgK3+WHKhM3cMIqEXa6magAfhiDKUvjeVUtBwP
	ByPB17nN5OjOuzueBQi8WUZz/EEe3tqwLANQcwCGydgnZwUZH2EYO9Me7ma1uYiCaPGiz7a3Yq3Ga
	IchEua9IXV/0YBtk+T+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo1Zt-0000000AACm-2fsH;
	Thu, 05 Feb 2026 15:47:33 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo1Zq-0000000AAC6-2y5O
	for linux-mtd@lists.infradead.org;
	Thu, 05 Feb 2026 15:47:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BQvvIdUAEkgvkopEdWDlwBZOrRx0ir14mpSfKmfxUZfZdC2HvfXaeM7j2HshatSZ3pYQmQO0eBB7YxSGAZlyYsGEZIEQcUza27csv6fMaZ7lacLUq8IedyqmNySsIZgcMczolVsQUB26pzHomAKYMMVTpu2bGVhHpHjuNcp98xxeLY62StVbE3E2/maRkz9i4K6tTH1V+fqk2sVXONwypzvTFGmTfS/j3y5ioJ8j5AUP6Xj2x8gyP3jBx1gdxpKF9i86R1xpuYHW/9WIiLKBjj6t8U57+/sUEuPmNjShAvWMVR0vhulrYSbIqgvZgWkCwp2hQgg9DMTXlsLeXIcSJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hRvYMcM6gzYn2Qm6g/r5YW6aIyFt1vCy73O3Mnh33H4=;
 b=HtdkKSLoNClwB36MJE765Sq3LXg+LY4vp+AYsadb/q9HV9+/dHmdnT+pC2F4jTJwWG5cHztLScSiQ8FpuVb/x72HuFqnBHpwY6VbUXSMEmK99ayiw/uhtNvwkdrfozRW0vFCE6FHNmjx1BqrdRABm1h/gZsy2adRZdf76rm+lhGIJMOHtxTfHfLuPimTX6WxX7OCViTx4L1HAqfCyXwrCQXMD++2YZ7q7c6l2DZc3vYODycSMLTIku/UpyidHUifJVgfbHL+3jjWASukLK+sWR5c024Di6/SCq/HSsCG0Gas+oROLIhmHqXYCJaTffyTCa/Qp8qVvc4dIp6fEP//og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hitachienergy.com; dmarc=pass action=none
 header.from=hitachienergy.com; dkim=pass header.d=hitachienergy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hitachienergy.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hRvYMcM6gzYn2Qm6g/r5YW6aIyFt1vCy73O3Mnh33H4=;
 b=Ir+3nxHDhCx0JzcFUd7ubaNTV/ZDrCy2ScEETrMKGCMjPyHgTTBicXVrWBZSxMnq6dGLMkdRI/DwMCso8ibvRYb/qqTjC8O+NzEbJ4FPgwblO8vPztS6wTk8g9TNw+Lx+MsUxP51GHq3wXPzxYQnUTMDQF/jZ/Z3DiMF4j95iVhwQsAWPkguT2LH3rwG9N4oTBbsIyZhZcfNSt8rzBPmF48mVkjkx5ONF5D1GIKKB+tpvlohpUx/dxgtqGLzA3gnXyr7zdto4NCEkq1jyJUTCgy5T8CU1ccXGfDq+KA1z+TrLvDm1uYDbZkyg0PwUZASmatRRwtYeH04YMj/5GOTwA==
Received: from DB9PR06MB7849.eurprd06.prod.outlook.com (2603:10a6:10:291::22)
 by PAXPR06MB8208.eurprd06.prod.outlook.com (2603:10a6:102:1a0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Thu, 5 Feb
 2026 15:47:24 +0000
Received: from DB9PR06MB7849.eurprd06.prod.outlook.com
 ([fe80::f0f5:da:c159:65ab]) by DB9PR06MB7849.eurprd06.prod.outlook.com
 ([fe80::f0f5:da:c159:65ab%5]) with mapi id 15.20.9564.016; Thu, 5 Feb 2026
 15:47:24 +0000
From: Tomas Alvarez Vanoli <tomas.alvarez-vanoli@hitachienergy.com>
To: Zhihao Cheng <chengzhihao1@huawei.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
Subject: Re: [BUG] UBIFS corruption on powerpc 32-bit targets
Thread-Topic: [BUG] UBIFS corruption on powerpc 32-bit targets
Thread-Index: AdyRCkfQa4Zi0XkcSIOaDwEHvEKqQgAfkK0AANfexzAAKpBxgAASt8aTABoBiQAAHEXIlA==
Date: Thu, 5 Feb 2026 15:47:24 +0000
Message-ID: <DB9PR06MB7849BCA2FA49A7AEE3D03104C299A@DB9PR06MB7849.eurprd06.prod.outlook.com>
References: <DB9PR06MB784979B96C388174F81F9103C29EA@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <356439c2-5289-57d2-52d4-8b436252a630@huawei.com>
 <DB9PR06MB78490A50AB800FB36AEF5E74C29BA@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <b93ff0e5-79ad-ff73-bdb3-e7e7d5c35256@huawei.com>
 <DB9PR06MB78498340513D9788FC7576FDC298A@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <d0eb0572-e383-466e-7b4f-97e4a853b7c5@huawei.com>
In-Reply-To: <d0eb0572-e383-466e-7b4f-97e4a853b7c5@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hitachienergy.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR06MB7849:EE_|PAXPR06MB8208:EE_
x-ms-office365-filtering-correlation-id: 134c25d1-6eda-4e50-ca4d-08de64cddb1c
x-he-o365-outbound: HEO365Out
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?Z8D8Fjnaoh7ugVUSNdG/WXFdji5mjK+cal7fGi935DUCDN1YZIRXgFSAHS?=
 =?iso-8859-1?Q?Y2Nl7Hek7gdjmVD9sS4ZxCv4KqS0OBLgUCP9yVlqmGTYHA2SR7ShqP8gsq?=
 =?iso-8859-1?Q?7veW6cfb2xW83cfyTOhMGbwfQNtHNRVAN+D2mL4/h4519KRZ6MOdwjUS/H?=
 =?iso-8859-1?Q?a1nBp3jlWDPhHBYOfIaYc4SGPwCv2tQ99HX/5zxaZTlWP5dYNsdcbOLSTS?=
 =?iso-8859-1?Q?knrmsbI8BENUptiKTEEGXvsrAhH/DAiLs1GkF8VYUDqa9zusmUwyAWb/UC?=
 =?iso-8859-1?Q?iTLKKD85Ag6GmXIWQOzroqjENITdGa0GCC32GQ65rAoBoDWK3L14Won75Q?=
 =?iso-8859-1?Q?SJBbbER7hlKl3hv9/m+oBeTpUo2zZ3oyj467F8YvtOpOU5m1DDusQ2Ojp5?=
 =?iso-8859-1?Q?Dzgn3ae+qpD8X3ttO/+QaGdwN0uLFawxKocOFrRLVyEuwpEsVSWYFyyGmG?=
 =?iso-8859-1?Q?Hk840ZWmAtTTYomLFUV7QDJyN823e+7uysf6Rvh37SSnbIomii2Ge48lDK?=
 =?iso-8859-1?Q?ApuaDpKKCo0rgJ0dKA1fqMLUjTLtCICdcjZ5RslIiTYFz5zBpiDBj3/Q8D?=
 =?iso-8859-1?Q?NGjq/W7x9KapagbjqZmaTA8osXEKW5wzvpiULyYMU1/S4uN2NSJjXxLz3L?=
 =?iso-8859-1?Q?GHHH2+Ejad1pIonTMpykBoS8HDaLXt5B9lrTyBgrrV3H3uprTg52509RlQ?=
 =?iso-8859-1?Q?PW3f0hY3lvaeu0huOHPGBG8LVi6eGwzyEBPoYqU0XAdBUATI4VH7u/Vk60?=
 =?iso-8859-1?Q?evOzFyK5uGRPJsJfLIe3hPkjON/1fdyXn+Tx7sSETPJ7/6LK15b33pIngf?=
 =?iso-8859-1?Q?lTtUEJ2Ji1Rvug4qlucpIQ9ipqJz9CZhYRbr5B7IzGzR7XIU7wh8hIigV7?=
 =?iso-8859-1?Q?NW6gRYytLxwtrODpjl+LILaYbk25cgsSXZz31Aph/LUC8s6P+Qkckq/+KO?=
 =?iso-8859-1?Q?OSKSLuJzPkXLbiG+3WAq2BieFiDWh9HTAYOWnff/a/efTw3KVELVONq99b?=
 =?iso-8859-1?Q?H9qJGGJZYliie6NL66Rd5E/VirroMe+pySfTJ8PNT89g/5ujiZ6NWuYUUQ?=
 =?iso-8859-1?Q?O91D7qzxjzASUnB/xZu5vE9dCTEonzfNGbLayK9OWYK7XemrsxDH7N/kLg?=
 =?iso-8859-1?Q?Tj0wPExBBdUWaLubevmV/DNk+pNN0tclxDjrmF3bB0tUHjsuuYGBFNSngf?=
 =?iso-8859-1?Q?yc1Y/v40kRZBdXdOhXulVSgEVPIpp4RJJNxlevTkcBvgdc3Hjl7I2bwWJ9?=
 =?iso-8859-1?Q?hySCzzvruWzFlVYnbv3m0HxvuO91QCPCtDzfM4c753DsWjP4aHtiaVMNjG?=
 =?iso-8859-1?Q?hM1aHdAZTdKFs2yTWB2qMYRf2mRNUPIfpGgy66nUJuzXxr2N+pMMyqJ7/X?=
 =?iso-8859-1?Q?6S9/x1cTidBN9MgVHCmtUEpM21IZUlU7Ug+7khD5tnwB9YeOvd6ucm6rrr?=
 =?iso-8859-1?Q?rZg+kx9ufirzg0yp1ggU/ePGSiKWPdTIBgF8VgcELHNB3P6ECR8BSYhVOq?=
 =?iso-8859-1?Q?qCcEkwnKPZbCXdONU8TlarvSl1CgGy2KgoEA7aFTj6wQpGszmr5ja4Slwp?=
 =?iso-8859-1?Q?1oQrsTVkm6dHI6JDgSXTfOP+lJ65M0vFMahf+pk5bjFltxOAZR2w6jRIgN?=
 =?iso-8859-1?Q?IdEZlXKkz2FIMkhRmH4LuwKDVNfcRqwAmPmLZ5RObydZrG9pmsTpuevbue?=
 =?iso-8859-1?Q?emYNG7qY2T3FCEwjbbA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR06MB7849.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?jf35DE+XhrWT7MgMpeW86805tEFpDG5WNe9N5qV0caW5aO3XhLP+OUQo5D?=
 =?iso-8859-1?Q?TFvpgo0nqdYAmKqY87H0YoHa/zr8BLinScz4MXqAVkH9ClsV8qx25WKPhg?=
 =?iso-8859-1?Q?uZYXMze+lcShVQVlGJksqABfbV7phKXncKqonRaFXf6LxpFs8rbSZOWlGe?=
 =?iso-8859-1?Q?+vT0ne4Mnq+sl0zGF/o+S5WrNdv77r2WoBOVXfP13yIYSe+MTWNzuykF8l?=
 =?iso-8859-1?Q?vlnCl4d0X26m60mLHh33GyQfx4uUP/CRbfmaVCZfBNHkg2+Rpk5JzcQP97?=
 =?iso-8859-1?Q?5CN4LmCAh5ZGcuPHM6lU7dwXoqm5yKLHTA7jlpfP7O5o71SUP7ij/M/UHF?=
 =?iso-8859-1?Q?442aENve1d/DJsCtn8LcPWVxWqiIMWE2gsr7yUyQskAQWeslaTera1kqwD?=
 =?iso-8859-1?Q?9R06gwI9oF2uK2vFQvVmqgH9K5c2eY3m03NuzJJ4o/pCrpu2wqnqyLMImc?=
 =?iso-8859-1?Q?Ioss0lHnH8p0mOUOCAVf7W3jSyz84Jt5RN2/06YE0qcr74Pym3logfMAte?=
 =?iso-8859-1?Q?uyukVciqRnKGXpDJPkhLH5U8A1EmEkrcYHE/o7z+9atx1/ISHUPu48TAWD?=
 =?iso-8859-1?Q?LkL8unh+FjeH9hTXTf6cCFNVTrxmf5581+D2KQVCRQMX5LfS9y0NpAM1Aj?=
 =?iso-8859-1?Q?FAUveP2222y6XTQEZKjaUrTsicYOTgJ7Mdf6wZfIErW0H/etPTe2vDy5jr?=
 =?iso-8859-1?Q?5x8hvTyaBu0rOwDFKkPyFa0meLP2Bpr6QaMr9fTV9PSiEqArqwH5Fi9IeP?=
 =?iso-8859-1?Q?yeK86clljRNgcB22r26uuATic1KHfSYu5Qs+5lFnl2c3rmWW3YiEWJqCuW?=
 =?iso-8859-1?Q?J5RZLbHAbALcVvlclSvmXtDvbzyfesTmxbb2ntc2d8lPu58XmKfh8wCyUz?=
 =?iso-8859-1?Q?7xjNZJlofKSfMiN1vhAZv0TRsGUGYmG7wMJAap/qdBDtb4NN+TUZSp+i9W?=
 =?iso-8859-1?Q?ZAwX41htto70NNn+qWc6wH+s0LedPZAbr//kkUVKsv0HIz3za8kr6HnF6J?=
 =?iso-8859-1?Q?e9gRJ83VbefFNjEdhxAHRVAkP1SZhUuRG3NPSt7DcNTSaRkWxkBlsEu7z5?=
 =?iso-8859-1?Q?OgocOgE/Y1HUzXAyh2LNfVYS22QgxMWcO03z17+Nm8hG55adRbsTiL8O/i?=
 =?iso-8859-1?Q?xTGoOj9GknaZEodlJV0vsPYPFGkSaw7lTRSHCtUgCk6q01qma3L3OL9eXN?=
 =?iso-8859-1?Q?qpZBC4m2o6OFexzIJyBU0AIzcs+IlFXB1g1iNNStKrpw2KvGkl+j4jOys+?=
 =?iso-8859-1?Q?uHoSW302LBZ1Onqre3X59Byx4Ad1MgOxeTPRiB1U3sNLE+e4KG5f0mk2R8?=
 =?iso-8859-1?Q?4tJd9SKuevrnVF796IXYQ11ySwVrcVNGIM0rb6Nrpra/bgpAoZ4xN53PED?=
 =?iso-8859-1?Q?bQl+xrEojBcugLp+6E73Dk98icj2QXxJ3MEUFJWxc+fRwqqSTsvq6+Kxf0?=
 =?iso-8859-1?Q?LSJlvtY1mTWSOpvAhQfWF+rWNeSJcfnyRFtI9v17TsX37wy2Ej/vXLuxUY?=
 =?iso-8859-1?Q?X5iG6OSYJtUmEJ74jS9FLYWRNEoPoQ9XeGcA6ZBOG4Ey04JU/ePCDtMP2q?=
 =?iso-8859-1?Q?SPbfJiQHWsbGYhx6GujW/Dy0skCS2Fi/nj1oje8BqPX/eB1i8sEusGZDKL?=
 =?iso-8859-1?Q?RMAROWVzqPh7AEHnr6d7J+68zwG6Dl2fcpn+0LnSEhfPtSzLCTg2Yf3xmF?=
 =?iso-8859-1?Q?XbilELW6aH4knL2YawjBEiNChuShPN5D6wBL/q7nKBleSt5EhSvCGpcZE6?=
 =?iso-8859-1?Q?WQenxL2/4ZLkycQgXNkOEOuXirYn3e84aoPbQiVhVkzmE2FytwDmEQdSHa?=
 =?iso-8859-1?Q?6hbj0sQ+RTMmxb6Ch2XWQ2sDG5JTeBHo7fkA5AvSh2InKPMZuo6Y?=
MIME-Version: 1.0
X-OriginatorOrg: hitachienergy.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR06MB7849.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 134c25d1-6eda-4e50-ca4d-08de64cddb1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2026 15:47:24.0342
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7831e6d9-dc6c-4cd1-9ec6-1dc2b4133195
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qYzBWXZB6WXpgxk5OdyRx5oTHUy/98zI3HK03uCgPYvWr+fFH4DNYgxb84Nz/fAZG2gFF4FWSLNFU2RbUXT1jYiyCx5im7syNuh58/KWUA8wHpFAAA/Pbbzy6k8+uEy3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB8208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_074730_908225_3EF67C4D 
X-CRM114-Status: UNSURE (   8.81  )
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

Hi,

>It would be appreciate that if you could modify according to the
>suggestions and resend them.

I'll take look at the patch and submit the changes soon.

>Looks like that there is only one problem, the inode cannot be found but
>the dentry(ne_config.xml.gz) still exists on flash. I guess the lost
>inode is 3917759 in previous log.
>Maybe the inode is
>
>UBIFS error (ubi1:0 pid 134): ubifs_iget: failed to read inode 3917759,
>error -2
>UBIFS error (ubi1:0 pid 134): ubifs_lookup: dead directory entry
>'ne_config.xml.gz', error -2
>UBIFS warning (ubi1:0 pid 134): ubifs_ro_mode: switched to read-only
>mode, error -2
>find: /cfg/board/cfg/mob/backup/ne/ne_config.xml.gz: No such fiCPU: 1
>UID: 0 PID: 134 Comm: find Not tainted 6.12.57-00435-gf9e139970f1f #0
>
>Apply following patch to kernel and mount bad ubifs image, let's try to
>find more information after a full volume scanning:

I flashed again the corrupted image, the same error happens with "find /cfg",
but also I get a couple ecc errors afterwards for some reason.

Here's some excerpts related to ino 3917759 from the full volume scan

```
---------- Start scan LEB 911 (main_first 11) ----------
data 3917705 found 0 0-3792
padding bytes 3792:4096
data 3917705 found 0 4096-4408
padding bytes 4408:6144
data 3917707 found 0 6144-6608
padding bytes 6608:8192
data 3917708 found 0 8192-8360
padding bytes 8360:10240
data 3917709 found 0 10240-10824
padding bytes 10824:12288
data 3917710 found 0 12288-12752
padding bytes 12752:14336
data 3917711 found 0 14336-14816
padding bytes 14816:16384
data 3917712 found 0 16384-17192
padding bytes 17192:18432
data 3917714 found 0 18432-19496
padding bytes 19496:20480
data 3917715 found 0 20480-20648
padding bytes 20648:22528
data 3917716 found 0 22528-23000
padding bytes 23000:24576
data 3917717 found 0 24576-25056
padding bytes 25056:26624
data 3917718 found 0 26624-27112
padding bytes 27112:28672
data 3917719 found 0 28672-30768
padding bytes 30768:32768
data 3917721 found 0 32768-32936
padding bytes 32936:34816
data 3917722 found 0 34816-35288
padding bytes 35288:36864
data 3917723 found 0 36864-37344
padding bytes 37344:38912
data 3917724 found 0 38912-39400
padding bytes 39400:40960
data 3917725 found 0 40960-42024
padding bytes 42024:43008
data 3917726 found 0 43008-45144
padding bytes 45144:47104
data 3917728 found 0 47104-48200
padding bytes 48200:49152
data 3917729 found 0 49152-49632
padding bytes 49632:51200
data 3917731 found 0 51200-51368
padding bytes 51368:53248
data 3917732 found 0 53248-54336
padding bytes 54336:55296
data 3917733 found 0 55296-55784
padding bytes 55784:57344
data 3917734 found 0 57344-57840
padding bytes 57840:59392
data 3917735 found 0 59392-59552
padding bytes 59552:61440
data 3917736 found 0 61440-61920
padding bytes 61920:63488
data 3917738 found 0 63488-63968
padding bytes 63968:65536
data 3917739 found 0 65536-66680
padding bytes 66680:67584
data 3917740 found 0 67584-67752
padding bytes 67752:69632
data 3917741 found 0 69632-70112
padding bytes 70112:71680
data 3917742 found 0 71680-72176
padding bytes 72176:73728
data 3917743 found 0 73728-74136
padding bytes 74136:75776
data 3917745 found 0 75776-75944
padding bytes 75944:77824
data 3917746 found 0 77824-78888
padding bytes 78888:79872
data 3917747 found 0 79872-80328
padding bytes 80328:81920
data 3917748 found 0 81920-82384
padding bytes 82384:83968
data 3917749 found 0 83968-84440
padding bytes 84440:86016
data 3917750 found 0 86016-86728
padding bytes 86728:88064
data 3917698 found 0 88064-88264
padding bytes 88264:90112
data 3917753 found 1 90112-90592
padding bytes 90592:92160
data 3917755 found 1 92160-92640
padding bytes 92640:94208
data 3917756 found 1 94208-94688
padding bytes 94688:96256
data 3917757 found 1 96256-96744
padding bytes 96744:98304
data 3917758 found 1 98304-98792
padding bytes 98792:100352
data 3917759 found 0 100352-101792
padding bytes 101792:102400
data 3917760 found 1 102400-103464
padding bytes 103464:104448
data 3917762 found 1 104448-104824
padding bytes 104824:106496
data 3917763 found 1 106496-106664
padding bytes 106664:108544
data 3917761 found 1 108544-112688
padding bytes 112688:114688
data 3917761 found 1 114688-117768
padding bytes 117768:118784
data 3917767 found 1 118784-120224
padding bytes 120224:120832
data 3917768 found 1 120832-121320
padding bytes 121320:122880
data 3917769 found 1 122880-123360
padding bytes 123360:124928
ino 69 found 0 124928-125088
padding bytes 125088:126976
---------- Start scan LEB 912 (main_first 11) ----------
```

[...]

```
---------- Start scan LEB 914 (main_first 11) ----------
ino 3917758 found 0 0-160
padding bytes 160:2048
dent 13819078852795695104(ne_config.xml.gz) found 1 2048-2128
ino 3917759 found 0 2128-2288
ino 3917754 found 0 2288-2448
padding bytes 2448:4096
ino 3917758 found 1 4096-4256
padding bytes 4256:6144
ino 3917759 found 0 6144-6304
padding bytes 6304:8192
```

There's also a second dent found in the tree for ne_config.xml.gz (there's
another file named the same elsewhere), probably irrelevant:

```
padding bytes 29056:30720
dent 14323482011061190656(ne) found 1 30720-30784
ino 3917766 found 0 30784-30944
ino 3917765 found 0 30944-31104
padding bytes 31104:32768
dent 14395539605099118592(ne_config.xml.gz) found 1 32768-32848
ino 3917767 found 0 32848-33008
ino 3917766 found 0 33008-33168
padding bytes 33168:34816
ino 3917767 found 0 34816-34976
padding bytes 34976:36864
```

The full logs are roughly 120 thousand lines, let me know if you need me to
search for something or would like them filtered differently.

Best Regards,
Tomas



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
