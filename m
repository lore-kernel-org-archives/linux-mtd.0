Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3415C10DC1
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Dec 2023 08:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=47AIQ0Ac+go8UCvIgWmkwAhN+VqqBkY+38DfpuivCcM=; b=m+paL3+DNgIBHQ
	CURRmM3jLxXkyI7AvUAVpKt5kKTKAbM7zQTaLNNCBBlT4A9Lsm2XCmwnzWsksnZ/CnzAZIXe1sOQr
	AWfjAHDoOphtJUL9R1gpT4TJCEBd8gzMcClF+RN/f4hNx92yS9EHg1hKH80lQaRMY9QEcShHA0I+J
	FrRX19XsvM29x4J2PiZTgVY+jqIVC4Z2q0LuxOlmXlnhZrVFcpmPTlZvMAs56gANHAHJzdBZDLS1v
	TJbDtcM+k8ptS9wl/J5mRbMsxxRqarYyzgQDk3d+NxKDGBtdHjXkLDnKjP4EX3ANqeafgiO9NCRKa
	ZKmmut1+mAB5koin+oRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAnhJ-009Txi-2H;
	Wed, 06 Dec 2023 08:56:01 +0000
Received: from mail-me3aus01olkn20814.outbound.protection.outlook.com ([2a01:111:f403:7004::814] helo=AUS01-ME3-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAnhH-009Twi-0L
	for linux-mtd@lists.infradead.org;
	Wed, 06 Dec 2023 08:56:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SSMuaQzKiV4aoc08lCughwbrEnOCTfzDYHoeajPO2Rj9+wXzINMydi8JYn2vsWEi91UAWP6EBQ6+J/nvYD8x1qwy6kLNFR4TT9TOZxk6qTCO7rVieV1DVPxpzvgkDziFFWrQ1NFVaR1M+lizHVGmcGP216ooOeEiXL4ogCo89vfftVRJRe2RriawXtCC1QflZU6B9LStK0bMXZnSD8HOiekH9v+LUgIeRZL6bpr00Wr4ZGFbQ4AOO/FRO1C0RLsuAYPPXTN2+PrRhgDUvKFg13313kyKYi4OEmGNHY3m2eaLcfQqspQ5WntYhM+r2CkX2BEhFBPRMBSJDHku2ePMuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mtBuTITJd5JVmrxC3XzBDAhXVv+HppdPqGk1117seo8=;
 b=jlUOYccUursNlm9MAmEmCUNqixBzaa7v3XujqUdAh5BFkv2GIWVGtqrfqKtZiSFvQUjaVYfywZPz9zLAqyTDc4WAMxXl3jp0A2Zy1SU7X/uiwVCmFuj/nByHYfugeL4YNkAZMsZdJ2XvAqZ1FtQkoyQd7P8LgsAp2ozrPLr4YYgMevLOU2oiFnQPbSaeOFHdBnyIrKn5aMKMAWCBMItujbxu3dbnDGZ4kvqjPCD24/X5hDo7d4XYHpsmORPTsSV5sAw4Bkcqq3JGh9GkvjtmWudnj81KoYYA3E+kpFzxXahWJWGn4S8GSzYOS2Q9iEPDKhbChE62i9qX1HORxxwWzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mtBuTITJd5JVmrxC3XzBDAhXVv+HppdPqGk1117seo8=;
 b=MetZdCq1HynYGsaj+/1rJDV0RNhzyuYLs39+gPa0hNNC6jofcu6s62IZdIng+49ycgq7SEKobDWsQRhuwqF4zP7qokgX5dzLQFr9KyEgrdoE8pYYcq/XACtDys6lBrB24h29QM6JYbPeQLlmUyagzoqzmpvyrmwxmzery2lQxfT7kMpUcplupsxPGjGViO5nzIu05yyVeQ7qhL+Trd9maFeGeGp3FTtq2bGmUcQIQ5LgT2slXknWqfqw9uOgBZKlTai5ro0NJ4fG7Y7bGfWqrIvg//0tR4+X4vWMrjIc+FppnMaw/Pa42iDu3jh5r2SmkLiWXqKo7JC1EJs9Oatv1g==
Received: from MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:159::11)
 by ME4P282MB1077.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:96::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Wed, 6 Dec
 2023 08:40:49 +0000
Received: from MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM
 ([fe80::7233:1e6:ee78:66f]) by MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM
 ([fe80::7233:1e6:ee78:66f%4]) with mapi id 15.20.7046.034; Wed, 6 Dec 2023
 08:40:49 +0000
From: Ryder Wang <rydercoding@hotmail.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"yusuf.kaya@andasis.com" <yusuf.kaya@andasis.com>
Subject: Ubifs mounting error causes kernel panic
Thread-Topic: Ubifs mounting error causes kernel panic
Thread-Index: AQHaKB7cksKDZkXE3UO8BHbgs6b63w==
Date: Wed, 6 Dec 2023 08:40:49 +0000
Message-ID: <MEYP282MB316494F5098A895BD2941C0CBF84A@MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-tmn: [JpHPlChqrDnR8Ki3POpe3DTPpfyP5eXV]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MEYP282MB3164:EE_|ME4P282MB1077:EE_
x-ms-office365-filtering-correlation-id: 4231d552-250e-4f98-6573-08dbf6370c30
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qr3adpAqJjAjRlZuZFTy+gWS89IsVz6cX9dyt7f4dazl10WqYjgvhCCpwmk4eWxc3ORHSBhq/kXEEidYFUrq2vpOjKTjfcFTcki51u9zp+0s1+W/Bx7kRe8safPEsumAGv+hU28Xtsdzb30/jG3EXqEHtzIW+EZWp6JT3DgjiHwg6ABOlbKN6eByq6JaGf0HU8960x7zNBaSDkMW6LjCmFIO+Ntr98rOf+G7G/eYTsR9rvCrNGKiv65V7F02mFKQxwoPT1o202tFpEaNnbC186YSmy0rXcj5DifHu3COKgP9uiLJPNWQdG9SlEoVqF/7gtndJgBMIRWHXOh81P9Xcbj3+Uvw655J9JxA3upI0VcNK7Y/dQkpVyb1BmoZqAAQkMgOzjnzLWU3DtJxlPD1scbu2mfxdsoDir65bnAoDirkJX4LSkZWu3EocvzkHiJz4N0vO6RVP9cRX4gQ9OuA0rnm4r8LZz3vg4gFSu+4GePvsD0XaxpHFL8d/AwuTPEU0/bcyUZHDkK1BxcgL7zAcFCEfzxBohpKT4PfJktribZvwZMeZ19ND9BYDoJhUSsT
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?WRRCvvK9yY2Djz8W54NleMRFgKQJk6jwrLQ4n3XXsrZenPPnl04IMFbU/t?=
 =?iso-8859-1?Q?Z1MIKrPLnXQlDd76evJuq2OU0BO4K4YKzq5vrtVVl2DWPikn7vUhJMBMEE?=
 =?iso-8859-1?Q?V7gW/UQ7LqMDJ020Uoi4D+TWQEgdoUoNYnet7bCFxJUDrs5lSH8FOhYz5D?=
 =?iso-8859-1?Q?0354/ogGjlF5qhqaUIbTrOrPvhXB49br3F5GxcH/8R1yOSvWLvLqqgcygS?=
 =?iso-8859-1?Q?bQsDbTDaAYzVYwHO4IW0MMedzzZb5YZH3F+Z+MbNvX50Iq9caFZGqt08Sw?=
 =?iso-8859-1?Q?e4VnBMnDjbyu6uDPgUNtuB3caFvpMcZnChB3m3a7IyzO9u45n31GIMt8qn?=
 =?iso-8859-1?Q?sRLR0rLP8P+HwBrRg/+7PhphePduSA+UWbdrMnVKKrhp81siqL/9HnWRN0?=
 =?iso-8859-1?Q?jlCaSjxOo3vITk0drwQtXyd9VRouwAQVONUXfVXDr9MCDR0NQkMHGuO0rQ?=
 =?iso-8859-1?Q?IfMpRvs18iw32mk9MQI5wiaWC7o+JGNxghp1PLle7FwcXoKtAWKGVSAjGi?=
 =?iso-8859-1?Q?ygwVm8n6Y2mze+FJxOJI4fsi73+Ds6FzIucfSFJ4UsjnoB6PhYbTBqCs58?=
 =?iso-8859-1?Q?vtzSdCqtGvdrVkFFVj3uipVyjwPHkPu7TZ+GSpDHAOnBXVjUUO59gz5mh4?=
 =?iso-8859-1?Q?d+6JiEMXeIO2TiNhtbTZZ76rh84T8tgsMIvOsIYS2gfdn8ZkJvT1UlW4c4?=
 =?iso-8859-1?Q?A9CvpRBwJH5zxfu+6AYqP9uy0OxJyrYjmuXfMvWp8paQHFRNaiH9Ga+TYz?=
 =?iso-8859-1?Q?9Tayyz2hiijvbFY7MukQdODe539GR9FcsgwuxrV3WTCWT45YhAcnne9BH/?=
 =?iso-8859-1?Q?Uv5EDm00pLRKI06hFujf3W2dX5KFsp1Tz+fIBQUeFIdrP1Zi2UHDnvrSGF?=
 =?iso-8859-1?Q?CDkU+Yi43BHH46u0c6QNR3SF1ypajCv0logMNYUywAcEdLieLrTv2L8Qda?=
 =?iso-8859-1?Q?OB2/F28zIvORRFeGr22scpxZyiUoVFBOh+UaIkz2dMEMJ8NfidZfmbpaCI?=
 =?iso-8859-1?Q?czIpem0nrE+Kb9BGO3Os0jcFVJNkzOT2heo+izOSfvQbJUNN2D792+F6cl?=
 =?iso-8859-1?Q?ZeEQzIhnDHHfgieOxRD4Is3i0wFZ5Qy9bSgsYegEGHB7q59SvWdpsC+Vky?=
 =?iso-8859-1?Q?rfwV3N0PvfmY96cOCKDTfQpSeVM+ACQSNGn9JFc8AAX+slKYdLl8EwxktC?=
 =?iso-8859-1?Q?AqjSsAh0L8kZIZelUwzLB1e16Dz84lp1BGMuyOdCPgOIr1Zkw1gR5ECDnY?=
 =?iso-8859-1?Q?HETQEiC4BnQ66D51LGpQ=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-746f3.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 4231d552-250e-4f98-6573-08dbf6370c30
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2023 08:40:49.0867
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME4P282MB1077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_005559_195233_682F14CC 
X-CRM114-Status: UNSURE (   3.28  )
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

> ubi0: available PEBs: 0, total reserved PEBs: 360, PEBs reserved for bad PEB handling: 80

available PEBs can never be 0. You should firstly check this.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
