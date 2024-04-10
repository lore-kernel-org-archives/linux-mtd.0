Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62458CD11C2
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2024 18:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y3vneDXZ7OwBNgvgdjnBPnh0HpMcZzTt8c0HaaeJJSI=; b=4Ar8isffDqr9vg
	wIHap2WeVRZFQUWSeTp8qnLiRDRen4YN6m7fabY8aTHTdzLrgNj2Np6xhDeai2lXlS0zgRRkXB6fI
	vf1R2/Z3c4Kecc6ub57EaaID4O/2ONvfrk5fQhYWzyH0qzhFooKZBcU4kPN+XpxIVDx1l5zQhv47X
	l/FyHXQ9hYjCyEfJTMFTSamGCJ15SunbOh05oKPL0P1Jz1dFG78jee6FdDUq86vSw08rHF6mUvTtw
	yXcWcFPwN1ORvHZShWEARtUYQ3p6NIBWU6kkjSNYuh5DQefslEAzfrxwZGJ99IrVlDV+g4ogJ6vtn
	Wfx8HmbkwtVn38Ybd/Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rucxX-00000008XRk-1Xnv;
	Wed, 10 Apr 2024 18:46:11 +0000
Received: from mail-westcentralusazlp170100000.outbound.protection.outlook.com ([2a01:111:f403:c112::] helo=CY4PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rucxU-00000008XQK-2EVX
	for linux-mtd@lists.infradead.org;
	Wed, 10 Apr 2024 18:46:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ThiuLbg1mQ3t5zPd2jQLubpooScy9/9I7K4zA3pBtp/YCMloLj/kOyPnWhPjZ3Nju12IIQ4UghDtP0jEtcia+9LEeivVNv3B4HAhAcsCwrXWv9zLWPiSCpab9PEK24Lj1CtfKew20irjvslSoNRdy5TxPQYMi/E59vFHtz7VafIAHvXjN+Chkj8YTU7ra+JVxFMQNFRh1hoUFE+JQgXLj1TMo3lvZzf3X8dh2/VJcx4pJC+R6A/8Hq62ajTxmBLwWjRcP2eyqzUM6grAUjN+M4nFmrD3a0qSpyXW/n0L6CRfPHLnDiafIFiuKg5M7QEgmgyj00w4YB7XMUhkZsbVhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q80HZwb69tfIn7+HDIyMAlyyhK4BgWmXfzqRTOUJFcU=;
 b=L7TBf3KdpW+sOQImTbWYdV33bcUz1WI52ilXcxY9yNem6tGR0f0f56vlQ1yXIG9VeSdcylfWPYvgterN2NKqetMmQnJPj99W3kYdL5xe6mA3ixrNdkSV/AEZeGbmZPDiyJUjSrmpvzC11lp2kisLqO5ejXC7qfYrygV/Jw83BTuXdkTNFae68SudlhQvwnbrVbLsxqFkFCiu4+nF6VLsUNa1WTncJfSfcq/WiCjsGh2ZGiiAfk9v7n6A4Rt0fbId3IMEU9GvOUwRymbTDOyBmess8JIMHz45mt+Af+JCinwSVgNPhLGdpPLU6EzsatG9wD3rOjEuQHGSg36PXmvFlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=flightsystems.net; dmarc=pass action=none
 header.from=flightsystems.net; dkim=pass header.d=flightsystems.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5447408.onmicrosoft.com; s=selector1-NETORG5447408-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q80HZwb69tfIn7+HDIyMAlyyhK4BgWmXfzqRTOUJFcU=;
 b=QWHLlFj98+OAlpUxbMdmv7I/JYIpcxn/nOsZobGorNnXWYECnLrppjNJgq2MDb5U2dpgWP/q8879fP9WWipaxosrYm7TICs3XwuoEMmSZ6Pu8eqkGwrzXULeWV/8NHZxpjn1KdE4INYOqmbGChn6ay7+1+OlAYQcovQMDRgh4NM=
Received: from DM6PR05MB4506.namprd05.prod.outlook.com (2603:10b6:5:97::17) by
 IA0PR05MB9417.namprd05.prod.outlook.com (2603:10b6:208:443::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 10 Apr
 2024 18:45:58 +0000
Received: from DM6PR05MB4506.namprd05.prod.outlook.com
 ([fe80::3db7:1825:d936:33e0]) by DM6PR05MB4506.namprd05.prod.outlook.com
 ([fe80::3db7:1825:d936:33e0%6]) with mapi id 15.20.7409.042; Wed, 10 Apr 2024
 18:45:58 +0000
From: Steven Seeger <steven.seeger@flightsystems.net>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
CC: "ada@thorsis.com" <ada@thorsis.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, "richard@nod.at" <richard@nod.at>
Subject: Re: NAND parameter page read fails with bitflip and no column change
 support
Thread-Topic: NAND parameter page read fails with bitflip and no column change
 support
Thread-Index: AQHai3dTCWi7N9g27Eu1wXgIS2uigw==
Date: Wed, 10 Apr 2024 18:45:58 +0000
Message-ID: <DM6PR05MB4506C6DFD7ED777C5896B83BF7062@DM6PR05MB4506.namprd05.prod.outlook.com>
References: <mailman.25709.1712772710.1280.linux-mtd@lists.infradead.org>
In-Reply-To: <mailman.25709.1712772710.1280.linux-mtd@lists.infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR05MB4506:EE_|IA0PR05MB9417:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JfBIWKWztW7K9Kysps2wLDzqxcrb9axQVtRtdzBQJ7GFb57pd8jobLKaLq4S1K/9ZFfCjuWmGw8v9w59gccYmmXhbfrydG2OLSYkb5ewXub/lt8IRlK6YC0rB6/ksvk/kxIGqutvWRdGt63N4pCAQ4ozLVfJwVhbw/GQfeDjybaEIaLr7Dy7jiM5hArVgc43q8MPvbmBKaT0Ey0oCGFWnmoD/Zl+ZVN1P3NSFaY9s+MX4hA0X4ttMOOjWGvQrj7o299TCYzSPCf69K8Ni8YMvQ7IRC/oER4gMzwz8b/nA3ELsrpIktdUq0qC+o5q8eo0jehneRrgWOSKn7M6TXUTs8zDC3LOx6EaO+SjcvcjKUAXkIk7K0C360yihNboe2hyvh3a50AKTuUCy4t58kaa+TWSHpNe4A7mDWY9UdgnRfWi6u2xokHR47HdNzFbSxcB7fvq2SLzq4cxcaU2uI28rpq4Rbl/K6pDjiMGvMrrAJBlEuyRtRcDd4qBKFHnng1XLwxq0moSfaZvw9E+oeP9QkS47lknZXwauSfluG8YeYFmxdWRf8Y7NlPgs3u341lIwf0iBkDdI8V2r7ZI9mblvB1z9FQ6OUaQ50JWVQQs9JmymPBvG2z1InknDCbpmF9o3OoO1L2XRpU1TijZwtBPq78xmS1jOheKb52AMpwZeno=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR05MB4506.namprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?KFeYaQlYWTWPNEGJFv46R0hRmb3t6MvWLwJFcYCsUggmwR3ZowH1tQJe01?=
 =?iso-8859-1?Q?7qbZkapADjHHsUBmy9TW9ca9pBGnLVJA+ETbz+ydT2tmhHCxKdA+OApHfP?=
 =?iso-8859-1?Q?JHt/xO4XKZ8njq+GRBR0Nm8j504aC277s0npeNQUFqOe2f1W8B8knPKMPa?=
 =?iso-8859-1?Q?cu64KQNGFycGRI0dY3gdTJzXCuuqWEcWfj9Kf8z2iDM6l/sFdDh3m920uR?=
 =?iso-8859-1?Q?wS5+XpSglU/Tc3rw2IAngmarOuZH8E1OpsHvHNNczp7anrFYwXBu8se4F6?=
 =?iso-8859-1?Q?uxPZG5fiAXeWFlrD05KsGpdfHSegDnjSHJLQ8dHBFywN4CLfVPBrQC2yMt?=
 =?iso-8859-1?Q?YsRixshfUQE3OpNigejcqIkiDjR3jjcm9UNuSyGzK6NWNRu4ZzGC/MZ+R+?=
 =?iso-8859-1?Q?eDCMRZTpYo4sb+FNVIi/dRTiJgZvojvyZk2Qhm6DwR8M+8940gAC1GtZYi?=
 =?iso-8859-1?Q?fhIhBtmSHE2xgDzh7Fl6ul8ZJRCWnGaPmrARiA8gqNHcY3Y62V+dVcddh4?=
 =?iso-8859-1?Q?pS+X7AY3KYpwTWE4ATm777y2ogezJnLfaloEhCk7FW8lj5geNcjgMleEo0?=
 =?iso-8859-1?Q?p9xasl0lUiFl4rmZvW2gy3Yj44Aarj70oXwRSagaWtkMiy8gVGYm4aECg9?=
 =?iso-8859-1?Q?YjEg8GOpi9a479W6a5rUtKl3EMmd5ANmlb9JRrrjJyHWL4cXmR0WPPHvz6?=
 =?iso-8859-1?Q?+CUd69tm2IfzOZwTZ4v8yN02fiJHcAo5S2sTBPMQzK96tNNDTCATFNw5MV?=
 =?iso-8859-1?Q?tYDsJWblm6zlbu8ag2qiK6jLji4nqhsTHSdLKUAeg1AJUPeRhWkDaijFE+?=
 =?iso-8859-1?Q?d79+9Tx0ssQT/m+8e1TnThSleAMP8X2MmFQDZ6AyRhx1ll/g+WC5de5/x6?=
 =?iso-8859-1?Q?ZHBj3+oikA/HALH2IlzrXA1OZssF4pi70Izk4+NkXNi8kHXZnTPbw95hFC?=
 =?iso-8859-1?Q?yTlHJ3MSQDiBB9vquPOmju7XVO3CtHMNGjdCtNwVCfSwXRRpsojci4hBHr?=
 =?iso-8859-1?Q?xaAFxdUik/8lrIq4e2SZYY7xVj0R8V2PGENSIS8cOJ54rJca1ROaE9tS9R?=
 =?iso-8859-1?Q?bNtKyxICqkpeB2i89bQCA3ULfxF/hPU1b+ac56mYc+lg6zUGB/iNg/+Alk?=
 =?iso-8859-1?Q?CnBbP1VkCHe7RX679xnfsj4s4by/WUl/dgdClPBYJgFBIaj4iW5SwFj0rk?=
 =?iso-8859-1?Q?9GlMkRLSCvjolKGD7JZfpi2jxAJ1CVOjP67DKv1pIsWU/hm/ly/gjv8YQE?=
 =?iso-8859-1?Q?eQaRFbUWuIMkLt3kdvZF0j1gpsKtmXXmU9dTkFK9I2pMZZEzAiX7AtNZAr?=
 =?iso-8859-1?Q?y0h3t/Jzr1PcrcPpN9bE4MqPzP2DVOkFpjqoFkJX+ME3BhHpJigyjGOaDW?=
 =?iso-8859-1?Q?JQ8hHF3iysiMA2QvtOcmC5r3CEY2AzsCLDJyZ+GxFyTEtC8anZSPUvKkVo?=
 =?iso-8859-1?Q?fe0V7JZcio/mrz9OocWFChzqtj2ca+/GsVpIGBwh7GYUb94FcqtcuQ4u2D?=
 =?iso-8859-1?Q?Wh3CWXd21bHsiBCQCS2/tfUkdcDvvbVLbAcVrIVIzGQY/IZoit11wPRW2X?=
 =?iso-8859-1?Q?5JDJ6/wZKCR63SdP0q4cFeJ2O9b/4L0cf+1hqAef7HhjUAQFTJOchpIF5J?=
 =?iso-8859-1?Q?yYo1qzjfR0fB6sTGXpvVSmZQFspLW6s5MBA4r+64jsYftOWXimHI96LQ?=
 =?iso-8859-1?Q?=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: flightsystems.net
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR05MB4506.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d22c575-862d-459b-6be0-08dc598e765b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2024 18:45:58.5236
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: cc3d8032-d019-412f-a0a3-ce7bb88962c5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q+koQDgxnoP/8+pd0ZaaLrfEu4MvFCd/YCu/B2gcQFEUe2fnrZA2pPSuyp9x7lQSbXZg4mK4pL4cPdVy8mFLnJWlqW4Ht9lBfjqLGZgbDdQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR05MB9417
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_114608_601277_E48242BE 
X-CRM114-Status: UNSURE (   9.56  )
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

>I had reached out to Miquel privately with this issue, only due to the desire to
>help inform maintainers of the issue. I was too busy at the time to join the list
>and write up something more formal. Miquel provided a small patch for me
>that did not work at the time, and then I lost access to the board for a while.
>Now I have a little time and a board, so I am here to report the issue and make it public.

I tried the patch from Miquel back in February and it works correctly with 6.6.12
and my older driver without column change support.

Here is h is patch for reference:

--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -2123,7 +2123,7 @@ EXPORT_SYMBOL_GPL(nand_reset_op);
 int nand_read_data_op(struct nand_chip *chip, void *buf, unsigned int len,
                      bool force_8bit, bool check_only)
 {
-       if (!len || !buf)
+       if (!len || (!check_only && !buf))
                return -EINVAL;
 
        if (nand_has_exec_op(chip)) {

I also realize that company email using outlook 365 is terrible for lists and list
etiquette. Hopefully the list handles threading from digest emails correctly.

Thanks,
Steven
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
