Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2242AD5B166
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2024 08:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/xSwRKsKTY/9OntcNkU+P1TMbI85/keI1IoX3KG2oTs=; b=JkmY27AQtyjgTO
	sl7VEVJp+1Cheorr1oWuei8xnM0mTCtyz2bJykxYZg05hx9YyZLUsyDGNVoumRgPe0+ND+XkS/y7I
	jzUj56SrkArSMntRqNEvjMsnM8U+dk/+YRltaJjjv1xPNdTaniclPkaWpxGdgqNmsWKGg8xtHAAP8
	D0jc6Vortj7U01XG0Z+SZ5BjETrhopSDM+QhBH1oQ/6YfUZW4Q2QmYsH6Qz0Sc0XqlLa3b4xpx0B6
	QpB5hAoKYxtOvzLIFMCmlpWTfiOmxhFsXcU7+LaxIlB2AZMaLkDZmsCV+SP4ibULsb8H+vbxAVCiM
	Lq21C0IaniPZjjbnRqyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5hO5-0000000DduG-2Rq7;
	Tue, 29 Oct 2024 08:15:37 +0000
Received: from mail-sy4aus01olkn20802.outbound.protection.outlook.com ([2a01:111:f403:2819::802] helo=AUS01-SY4-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5hJe-0000000DdTr-0B6J
	for linux-mtd@lists.infradead.org;
	Tue, 29 Oct 2024 08:11:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LCtoi0yEQ3wV731CJTykk5tPpNjvVw8ue3tdKJizVijnDtnsvieEyCBwtjn86WW6Wl7CHeBtowlt4zJEIFZJBV1UdEoP7NJBhnLQGQrUdFVK3raGA4V6CPKKXfjKghKiyef1lG9wk0R49LOD3+M+LViP5PE+y2bOtlD1kfS8gOUd92jCn4IxIXeaUzI5Pa9msSKm0Xo5gC51gxxc3o2qMIcvhL//96omnx6WPfKdJmJIMA0i6Aoxdc1LMwd93LaZ+YWMQi7wCaprrHM/xcPEECHo3dCDVrzgjzYsdOfIWWfkco8LXJSRgDPpmI0pvBdZy9eIiekvhy4q0s8FT8UFKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zcDNrAG6NJkFIH3iwRZ5AUl73ORSSO+/L29ONananJI=;
 b=UF4dJWAOIN5NjnsIw5oFQYo5KHrlHGWQCjUD+QNzCiXonDLZPpCIhatK+XijAgSFLTJqbC8QZRNq492aH0BKhZ7m7P5M6HJmWxee7AMK3JNwyLLH66mHVIiAhaBW+YzhYRF8gI/b6NC8/R/E782Pu92yNl8oMamVPCRvX7MZ/iqDWvewcWyo0T0L4qojlW/DLfrK6HVMpC5xtKwQYfiWXm1EajdPtA//gs6bLDIcb/xTfmdxLl2qCnLkKisDcEBtKxO6eMoz577lawkWvYIHdvnanDnVPajJ7K1LSDsvAyNOIFBCk2CWLVH7zfDMIsZR4PTCeQkYvpj+M9Q2tWSDug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zcDNrAG6NJkFIH3iwRZ5AUl73ORSSO+/L29ONananJI=;
 b=TWnF0YCCLsbjbsAzTkDDDQ9WWMFNB7adtcxpi+TPU5DWxkfkX983PNr2++Ic6N2UtaJFP5mlEcwsvGtMB6QJlYfudmFlun2wHepBACCFzQsRf2Hu/7Pbb2tMycD5X/nnAtnWodGzMvxggXd/ZeltOcYsO1ZCG1DMm9t3jBIv11LkyPF59zHmmvZh4IUe/yI/cHK6x39mdnXLCME3Nw6mPo6gd9lK7joOEmAiNPuNcumpDwdF4SUnoiTZQsv9tF5k9XrQStq+XGzjDHnchSyAj3wc/pJSfvXA7O1e5vPU4H5Q90OHgm4uTmA+xhpcI9w82WG5TqWhTig9pi2ipNigeg==
Received: from MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:159::11)
 by SYYP282MB0911.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:73::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.17; Tue, 29 Oct
 2024 08:10:50 +0000
Received: from MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM
 ([fe80::f65e:52a:9bfb:525f]) by MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM
 ([fe80::f65e:52a:9bfb:525f%4]) with mapi id 15.20.8114.015; Tue, 29 Oct 2024
 08:10:50 +0000
From: Ryder Wang <rydercoding@hotmail.com>
To: Waqar Hameed <waqar.hameed@axis.com>, Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>, Sascha Hauer <s.hauer@pengutronix.de>
CC: "kernel@axis.com" <kernel@axis.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RFC] ubifs: Fix use-after-free in ubifs_tnc_end_commit
Thread-Topic: [PATCH RFC] ubifs: Fix use-after-free in ubifs_tnc_end_commit
Thread-Index: AQHbGydq3UGpSRV3ek+T5tpnLt8T+rKdeqgF
Date: Tue, 29 Oct 2024 08:10:50 +0000
Message-ID: <MEYP282MB316412B08A32373E5ED9B896BF4B2@MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM>
References: <1225b9b5bbf5278e5ae512177712915f1bc0aebf.1728570925.git.waqar.hameed@axis.com>
In-Reply-To: <1225b9b5bbf5278e5ae512177712915f1bc0aebf.1728570925.git.waqar.hameed@axis.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MEYP282MB3164:EE_|SYYP282MB0911:EE_
x-ms-office365-filtering-correlation-id: 2dbf20b1-4006-40c6-ad25-08dcf7f1337f
x-microsoft-antispam: BCL:0;ARA:14566002|19110799003|15080799006|7092599003|461199028|8062599003|15030799003|8060799006|102099032|3412199025|440099028;
x-microsoft-antispam-message-info: 92RpEKHdeEztnFw+QL4VQRRS8ecuplxGZzmxNcNo1WDIEEQfU+3lyTQ8ZldKg11J2SASy6C3vpPer8ipVpQWKUxnGid2pSF4hyHbvG/XQEJD+L3WSYGvMp3WUbXuFr1y/BVgjFOlw2E5gU++zdiOduhZGQ7vho9R48yzjMSwO7kzGZHNsd1YbbpZPh595cbWenQeOzRqhv0Xye9Iy+s8FkPc+LK+K3hO5TqqP0kaKo9i0W8itjt5MoZ3tWiECSHEReOB4y0faRaKs+RXKssoeR4oNqdmAdtoqal01JaE0wxH0fsdUHhbcEVkgaEGVDIZIorFyF/6g8zpMtePQk7AwukPVO83BuADzGTcpF3H7Nnl7r1O9GRZrMhG6Cbx34IlvK22uqe0pCU501v7Xv8JcMlGh8pUDiIp7slsD92F58wb0zmwEwFFIgrL5GR4RMRgZSZ2tk6NSlncl6arhjYtW2U76pxkx0p2RUGvhUJd2lbgiGc4xKJqgL7AwjAMEPFXmqbNjaat1bMfDXBP0iPQNrLFbvZoEkPvQnzzorA2yDq0u17bx8wJxcWeoHRBRJO7y54gufqN2zstvGYfhHUpfulRUKNyQyBUgoBxlVmsxWwcCVb7Z1RB0lXI6LNHPI1J4+I734nbmelReZQTTLJ5klilC2lhqd5+MoCW7/aDzXudx0SDB4upr8NlgaGWA/YDI3OIR5B/a5rrVAPxHaY4AhsR/xojzsvRAqLg8vEAKDbHY/rX0/pPxt4UKCWv2FpgOJLlY56e3BVuG3lZsdk5ww==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?lbqrKLr37kXwngekjm84f1smGG2Hx7AduxZ6ya35wx0kw5K/TTX1hFZO4t?=
 =?iso-8859-1?Q?JnpCssRHa9mNNo2LuKRZ+k0NNf3dc8Jij5Q8JlR40dXAnUrELnLEFQCcNf?=
 =?iso-8859-1?Q?0MORK6hxQ+CokWj8GqJXH31vAUjoa5WlgkEDsKFLDhoTx5UY6zgz0/yX9A?=
 =?iso-8859-1?Q?zACjoC5h6dw0U4+ZrA5mXCCR+ZlFkaBDYTi2UOuFwb3hHIJkvxKVwiCjs8?=
 =?iso-8859-1?Q?47/RxbNr+i4FDG4UewXtOJ9BGOOYq7i1CQIPMNKxlfrOPmi4nfnLuB0nK5?=
 =?iso-8859-1?Q?oxHnc9I/4SXux452FVUZJGowS4/EDHTDAqUDlFoB8mgQKzhZ1UaqdfIJus?=
 =?iso-8859-1?Q?l/8BDiy4+f4GPvproq3bb4SerEExMLv0UdHK0NGvYx9Zt2mKHhWQC2r/9J?=
 =?iso-8859-1?Q?KlEZnlUhHvS3VZlXfooL5OceIaDLtz1ItJk56aTKlBdyKYI6pNTCStNNkZ?=
 =?iso-8859-1?Q?gj4xjGiqx2ODqa7ecx2aBX1oR3qbWy/48YG070RwVOf2gOeq3CKXczWllj?=
 =?iso-8859-1?Q?SKERcM2gt18ycvawpZsVfamFKfqzszMteTKDUFegWevBdX8NlPoZJ2kpnN?=
 =?iso-8859-1?Q?EvIVLB2dhloWwVOSEvj1mcXLwG4Sd1qjsb9EJ4mcOFoSP4WwDnqXEJgHXI?=
 =?iso-8859-1?Q?jfpx2NdgsFR9YjXQDhDLPLzGbS8mdc6GZUGcKc7/lwHuaPN+8JJ9H5TTt5?=
 =?iso-8859-1?Q?w6KlPjhf0PEpQOFfWDfAv1WLhw/90OoxPVPE8fb4YeMC/lnah9X2zp2EVO?=
 =?iso-8859-1?Q?K+GSioMQ273xTqlcUfaqWZ2g4xJ5xneJ/eFgact2yx06UlBfe3xKFB/HtL?=
 =?iso-8859-1?Q?OcZoLzdvOVT9+ZmgQczQjwswASqWnCvQdij39K0WnuQ6HGfOvnqZF1CaBG?=
 =?iso-8859-1?Q?XwdPbz7HePpuVrFJV1eJP65CA8pO9GKV8F3eEo2B5UmlMzOotkQEAZHwh4?=
 =?iso-8859-1?Q?rCninyChkI46ahKDO2Dztd/JAKhuqJ6/7TeQWy2o2xV6hAZbwGLtBcY2+o?=
 =?iso-8859-1?Q?OPG95tfW2rcATcPOJJlJoxU/GoPdtvs5X/r7xkmFOS65FehcTdlP1SASH9?=
 =?iso-8859-1?Q?nwS8SUtWMYrHgS4Mg/nHon/imHGgT2ZZ20TY/6ixdKLvT8F71wlxCOrjP2?=
 =?iso-8859-1?Q?7sIaJ2oP/qC5GEflwy4t90P3+itNMOsnfo8k5ut0DeT5/9/6gD9tsmclhA?=
 =?iso-8859-1?Q?1dMfo7gH6hcLVC3/xsLUAXl05xlpukkSCdzLF5kpnYR9JK5WtFJiWsO3+C?=
 =?iso-8859-1?Q?2GTdnJk7g7DPF1IXFiPd2Zpd8S3nn9tqWptzDMju4=3D?=
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-722bc.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dbf20b1-4006-40c6-ad25-08dcf7f1337f
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2024 08:10:50.2646
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SYYP282MB0911
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_011102_117849_48C29BC1 
X-CRM114-Status: UNSURE (   7.02  )
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

I just have some interesting finding.

The code of the function write_index() has a race condition bug. c->enext is used in write_index(), but it is NOT protected by c->tnc_mutex. So there must be SOME race condition problem. I believe some znode may be corrupted or misread if 2 kernel tasks are operating the same znode concurrently.

The code comment of struct ubifs_info below indicates that c->enext must be protected by c->tnc_mutex.
--------------------------------------------------------------------------------------------------
 * @tnc_mutex: protects the Tree Node Cache (TNC), @zroot, @cnext, @enext, and
 *             @calc_idx_sz
--------------------------------------------------------------------------------------------------

That's why I don't think this patch can fully fix this issue because the race condition is still there.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
