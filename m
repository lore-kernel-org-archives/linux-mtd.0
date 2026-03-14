Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B6510706DC
	for <linux-mtd@archiver.kernel.org>; Sat, 14 Mar 2026 13:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=G7zE2WX+YB8KfAQURC0ow9o41oS1o1+uNXIkxBW6t6U=; b=tU0WdrSS6V7w33
	klzFy8CRoZNc1/aYcaHGFvUmMBoi3DMk/+dTc2vy9hYvvFoEy+uibQhbMUeug+T2mA02jmAYl/nk0
	q3FWQ9akmXu7YTvWgOt781fMp4mWgTjy7UxMFhnRx4W8Xx9GCHBEpYBOdCgSfCN/xr8A2Ew0ImjIK
	bkETHJu6joARskJMf8qpcIzzyw6hwV3T9SwhI2MmlfX69MG33pi9nNDRCJ2KhnrBjjKAVYyXMya9C
	wOv0ZFhPV6ly2OntgPEdoC4uF2JnFDYfZk8k950xkPghwsjD6n6+VmkwclsdHTGpwqXwJ9l+Lj3e8
	n/Zn4j0K3kY3b1QDqqqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1P27-00000001tFU-3djW;
	Sat, 14 Mar 2026 13:27:59 +0000
Received: from mail-westus3azolkn190120000.outbound.protection.outlook.com ([2a01:111:f403:d116::] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1P23-00000001tFB-19KO
	for linux-mtd@lists.infradead.org;
	Sat, 14 Mar 2026 13:27:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g8wOtJrDsUbMJKh1smn3bMdCjcztU2wXzthoVTgK5BUkoYEL2FB8u5SXMA4SVMrncM4yD/KAiPmFKBrGgrcbZWqc3m31EWOdW36qavNvWcn952QQvduhs1IN/F7fkY7j3gGZ6Fa7K0SXFSY0qDlOLVNXifNPiAOeXn+6Md4r1U9Ii6h2RLOSy+s7d9rr8LGLLXz6cDF2RB5a+A+ajz6PIRSdivw7YHbRX8Rhkz5ne5uBiZnbEn3T08Kbicxi/VbDglEUKlTRi5365T0TcXwc72kKxPjsaEqdYN/wvHLIWneate1KdVBYvexfzJOktuckFnUy8C65/4wOa0BxBuGzIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oA3lHn++cYngofnnfv8Gi2a3huED0dnilKYEqfZGytY=;
 b=WEDAdk113GiWwAxiddva83Y9l/cEGQGoQMRhE7vHXawOQRnJv9PRaIxETphk2cSvVBU6MWtj/zX0oMEihBWlRahMb8RQfI+AewHL44VaIZkKQBdVSjvaXdC7LW+rS5tMfoGYzsoinuBemTspREOdrt0Pxlc9o92jDEeqnQQLcjagtbx3Hnqs4Gi+pVs2Y1kvPdFjhdZd4I8Wnd1NmODfLOuzR2tPjyMi6/wmfmeuTC/jj/NrbeAiJhHd43xRJCiJtRMP1vY6GN/FUCb5CfgY2aCRKhI41RaCATNJYXPSrwypu3ES6wqOmSIDhCu5bMrUmNj9vgwa1X/8tUp+kkPQlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oA3lHn++cYngofnnfv8Gi2a3huED0dnilKYEqfZGytY=;
 b=OKOT3dS8XcqXy5zlP0s2UhRpPQ/1ORPw+JoyWsTjg/2QBXBSrNBkMp7btAuOBTV9Bv7YygypDbGXXky9uwduGDU/JdIX1jwkHmyV0rmOPqITxKlkm210lsKE2lYA8bJMaWppfCOeOwHcZZbXrvcOROf3pNTpwxMMztUhcMqI6uOh0XTGtHY/huldi7tahPVOJpI1aGqLOEW3F+CmuDoyJoQx7lf5LmesKVMbS5jsCdJSAyxAfdaX8tJ/KZ1sG6S/ieZ/JXmVixTE4nbmUauwbOwqqWo8OjonPRzUbvZuB+vV6fWH8G7ab7SoBYhN2YHS2VXW3wTKJO9iCGZXGf6XRg==
Received: from CH2PR05MB6871.namprd05.prod.outlook.com (2603:10b6:610:3c::30)
 by DS0PR05MB9677.namprd05.prod.outlook.com (2603:10b6:8:14b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Sat, 14 Mar
 2026 13:27:51 +0000
Received: from CH2PR05MB6871.namprd05.prod.outlook.com
 ([fe80::4119:a2a3:d10e:125a]) by CH2PR05MB6871.namprd05.prod.outlook.com
 ([fe80::4119:a2a3:d10e:125a%6]) with mapi id 15.20.9700.018; Sat, 14 Mar 2026
 13:27:49 +0000
From: Jessica Garcia <jessica.campaigndataleads@outlook.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Generate quality business opportunities from NAB 2026 attendees
Thread-Topic: Generate quality business opportunities from NAB 2026 attendees
Thread-Index: AdyztlTiReBCdsuvRSaTKBhPvZorhg==
Date: Sat, 14 Mar 2026 13:27:49 +0000
Message-ID: <CH2PR05MB6871D5EDD51970E889973E7AE742A@CH2PR05MB6871.namprd05.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR05MB6871:EE_|DS0PR05MB9677:EE_
x-ms-office365-filtering-correlation-id: 8ba66116-8c1f-4644-cebe-08de81cd7c91
x-microsoft-antispam: BCL:0;ARA:14566002|461199028|20031999003|24071999003|39105399006|13091999003|22091999003|37011999003|15080799012|19110799012|13031999003|24121999003|41001999006|8062599012|31061999003|8060799015|40105399003|440099028|3412199025|102099032;
x-microsoft-antispam-message-info: =?us-ascii?Q?u5/B7uWlJcMindhBDl5NN0kGDJi4oBxyX3H85nMbxH/KOIhpK1s0ov36SW30?=
 =?us-ascii?Q?F7nTyDnZmctHBzHt+cavT7YZCSFfjqX2LQbW4ba+ZANG8eLVsmu5ck3BoPXU?=
 =?us-ascii?Q?KC6ycPb0OMvIC52EORt+PeGaZ8nGyoJeDxb9uRhUcPu8/PXgt0O/k9Qv0thk?=
 =?us-ascii?Q?3KnePqXWMz67k7Oav/hJiv+FxTDxnQPCc+tDifJ7Lw2hb7CosABJbrPFToul?=
 =?us-ascii?Q?D+zDG11PvYsvJksO3sQiBOdU43yWdMm5VvJIWwUux+B1Y7mIbWWFgzOwBnMM?=
 =?us-ascii?Q?OftiWMYsasNmmb7YKsn2eHd6Ei2kpaMdDFNg/7V66XeUhGRcdsh7OnZE1Kmn?=
 =?us-ascii?Q?nMG28RISrSjZOkFQQX5PAdmqCOqyoEn9pY2n+vCzHsXroChpu6g/RPNnPwAp?=
 =?us-ascii?Q?qtnr5Y4pexpgWpY/Usd9/AOk5TQPplyL2OBzVYoQ1rydan//7Bq/a9ngItcr?=
 =?us-ascii?Q?WxzekW7yJBJP4Qp08SPgHFCylSSWlxdbEs3PqpMNolTl4O1l0+21kdiJ2qRM?=
 =?us-ascii?Q?WqTOrMCGjwXsN117qMqADU/gBApcNIkqTml9fc9wrb2I/ZnJHWkAjL48iCFz?=
 =?us-ascii?Q?Ra7gZW0x5GSvUI+DK0g25zhNz718ye5P6fjZP3qtuLABINYacQ0GToMHdw2E?=
 =?us-ascii?Q?QmHzZnTyXb2dZrK6TeT/FwIagkanSxUvsohwNf6HfqR3rweogjieZYHmclN6?=
 =?us-ascii?Q?toKjQqePsNm/6VpoLVKgDXJywrlSOoJGe4lTQVp25qv9CMGJ+WGShcKTbPbt?=
 =?us-ascii?Q?/KofB2wfnfAgqc/kEfQE7x4QitxM3E8TTmVDcqbZuG34eNqRWcWMKZ5sZtQ4?=
 =?us-ascii?Q?891u6f7lbLEF6D34XMd/O46UGMItoHoDizFc3gACg+yyO70L7tMi9wjAa+FN?=
 =?us-ascii?Q?hHvn0X4jISP2KxwrdwSsmMXRti13Ew/rXde/jG5aVbNAqY9gIkYgo4GPn7Mi?=
 =?us-ascii?Q?cPmWXz7bhP5WrnmPQ1FhVWnwVPrcl3AdTswiRWNar6cxXuj59vPrIP4f4nCS?=
 =?us-ascii?Q?1/MJacgXHY7J8CKR06vjJh5d++A2TiQ2xhqtNbFzleihB8NZYEWitxsQ1laD?=
 =?us-ascii?Q?w4Z0pTlDFZj8G0QrH1safq7XoU8GLXcGqHXC28xyWnMh4c0QpFK1Ny0VpZVL?=
 =?us-ascii?Q?bJkaSJourU5rWEpTUwQ/boONQxYRNKbuDg=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+pySUb2DQN/wstY1LBadvD6mKgUKzqyQTTu215lYmA3Dmr0ZnXoII7ccD0IX?=
 =?us-ascii?Q?qsC0SK+OvkfoXX1WX6YKqsLFDlsKRYq2Jc0MaqL+E5SwWTESy+1erBdB+O1s?=
 =?us-ascii?Q?fYovuj0QF//30zfKtDa4uoDyRK1oEVBmRLUfj+99y/NaKLQGmr2JukvKKk5Z?=
 =?us-ascii?Q?PUgJsBJvPlndAsPa0RfGIesVgahXEEkCIO5SSndchfjBylb9MSqiSYhOub+6?=
 =?us-ascii?Q?WBFDjPl048Ugy8qfiI1SyBsW3fzNaMPbpKzFJqqj/HFD35Y/y5DsM21KSL5c?=
 =?us-ascii?Q?mpqFzKkYHE8wVeIqrurrZX3ZSyoFwL6MUCVnaZNwcNNkLqg0P/VclVFO0foZ?=
 =?us-ascii?Q?RuYCtugUKm9FKsHGw++r0nMLIl+MCPY5ytlSnP1NYIx4ssRQv1ImCRcJjpy6?=
 =?us-ascii?Q?0WMg27DnTdLfW4fMtKf8rQtI3lRYgk+q6AsC2Uqm8XnH1wDOVz6z5gqTmdc2?=
 =?us-ascii?Q?Vhd05JxhEyQhzWzw00GfDRrm1HTgk2AHSZTi18mK8NPq3eZJuJAG06lXCfkU?=
 =?us-ascii?Q?ixIflf2Pvo3HY3t9WudIKjrbkucl69lzCMt4NdRx9yJGhYfd7Exkz5JTQi9E?=
 =?us-ascii?Q?qfM8LiJeXqTCluCxiQ287gJ245gwPuFOSa3D2J1L3d0v0zai0VBCQwkicoUl?=
 =?us-ascii?Q?T72yHb2f8z7d+APhD3pJILOCN8h0x05pHW8J0mC4GBt3hiSJqQvngo8PajaT?=
 =?us-ascii?Q?PjiZIo/ppwCjzFOanRQUyLqsrBia2edbj+HVJXtE3JMkT3Np/jZasjF+K0bm?=
 =?us-ascii?Q?vwsfUuA22cWEpnZHeuqJd29mEpZ5BRkURVlVCW7taeNafop8U40hBY6jwglA?=
 =?us-ascii?Q?JeidU5dBb4feLrNkT535DCbOI6sK18b1+7qAc83vhGaE195gsolazelzGrT+?=
 =?us-ascii?Q?cfKVSpj0HHhYLXdRiLYCFYWMBpmFSsHcPtZSd3nLr3Kb9PGxwsg30Xt3qi9g?=
 =?us-ascii?Q?ft0DWTV3dWV0Gt7pKLI9pT6RjNNROxxoQMXNDdv9J9gyelznv4Ua6bIPtTqR?=
 =?us-ascii?Q?2XW3/UYBYCSfxTI1rr4eR8NSGNYQoI1AoPqOcaDzF9t6CtsVMiOkTmAYxP07?=
 =?us-ascii?Q?EPpHrJvQ+OUwno/VC/joCimuo2CKi1zgBA6HET54UZ4rlrlurLQ0mzmyVcKf?=
 =?us-ascii?Q?eQ/Rxe8SZ9UPnxldBZZG4jQLSzvxW9PRnk0V+FlgPCu7r/aaluAhHu7dnuDT?=
 =?us-ascii?Q?wjLZVib0SJzPNvRsKdRXW7fWP/1XEVaXxF8idyF6yh8hEAMlo5XtPyiN0+gj?=
 =?us-ascii?Q?Vru8AIFl9InkJNzxC+BSWWRKuLa035Wxgl9Q57Vz6n18Fia55r0oKdkRtJiF?=
 =?us-ascii?Q?DNMtGrRpBa5+6XHg7UsZ4JWSwFrUQu8qJCWGQj4Et7zJv8SBNcW3q+/Y2YwN?=
 =?us-ascii?Q?TTismtmQ+SLHR1R1G56wO+TNloKrBa5K3kcxwj3cO4LEBF23mAr8BAs4AFVh?=
 =?us-ascii?Q?vZxJkgVlT94obK8OH9Dfefz0AvSuqadEekUMTrY/C2QmHKFOM8sCKw=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR05MB6871.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ba66116-8c1f-4644-cebe-08de81cd7c91
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2026 13:27:49.0836
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR05MB9677
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_062755_350379_637F872A 
X-CRM114-Status: UNSURE (   1.41  )
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

Hi ,

Hoping everything is in a positive state.

Would you be interested in purchasing the NAB Show 2026 attendees information to optimize your marketing approaches?

Expo Name: National Association of Broadcasters Show 2026
Total Number of records: 41,500 records
List includes: Company Name, Contact Name, Job Title, Mailing Address, Phone, Emails, etc.

Augment marketing outcomes using our top-notch B2B data solutions.

Thinking about buying these leads? I'll gladly share pricing with you.

Awaiting your speedy reply with anticipation.

Regards,
Jessica
Marketing Manager
Campaign Data Leads.,

Please respond with an Remove if you don't wish to receive further emails.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
