Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E6DEE20B5
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Feb 2026 16:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LlGgzJcM/M+InG5ytDBS8tzQWBzu3syShNwmupEVZ58=; b=qJN3WsQd30dDhm
	5DYyqB5k3vbYR9rgh1nmGEFvXIhoPiG+lUfLyXEgMAJcxi9xbf9b/q0hLXsPjp+3QoAPdNd/jtMPC
	hxtyjSvGTEI3Us6O3fgKlaZnrAPdBkS5Hz1xeWWLc6+pMlrV3P671KYLJfqX1dJWLjFbMEWioruJ3
	1E1m0875thO6jQLgAZZv6hEG7RmX00u/0MgwpMECRdc7wyg35KzcSBktNmufCeKd9bzVHFD/qkMy9
	40O/lM6ZFD0rvavKrmTGmDCrAn192HoLhyuuAKmEw4elyj8s4HkOpfpppWx4k0ZFex+XvP9yWxfnL
	jLllPXoNP2zXt7H7/zdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voOTT-0000000BXpH-3fdu;
	Fri, 06 Feb 2026 16:14:27 +0000
Received: from mail-swedencentralazon11013070.outbound.protection.outlook.com ([52.101.83.70] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voOTR-0000000BXof-1Xcw
	for linux-mtd@lists.infradead.org;
	Fri, 06 Feb 2026 16:14:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cqjnqlWjwPriyO6uAbCwbDWZMdbpaCdS05dk8w2wXWpPG/uv5tMUxEVaKD9t8QTT0BG/30dTzqEVfemCpxFW35B9w+zdFL6ppkds8xCLPcGjPQqx52rQOjr0tMv6sudBPoSdIgf00vfF/xPKC9NONvf77rqdDJmFR+/KiMCDBRzE2m9a2Fv6L5a3AOqFGL4R+FeXj6jpjcsD40eh6f/TvDpRqk11dsHbqMcqMCn4UaeVB8B59VLngCv0xID0uDuxT0FgLWScYAho6jETG4AmhK1fQIL3NOo81FwI9sFiAOY+X2PF+9Ziz+xOVIk3sdHLWYkvZfCSFsk9Vg/mGxmn0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3tCOREV5114z8Chmq/XccVZiDiKYZ1sEOFAEOBt78GM=;
 b=clJP0ZPQXuq9kTk6gWGq/zX3RCthUKx7E2ILQu96ETxl5Z00pqVkN8GerQnJUL9v1PS7mcXcYroxG5I70Gpqk7F/TxsQwc7mW1kay/yxz8gEhfaPKtnfHLdbW5dMB9YLUmiqpcCVsgCueAKjGTk0rA5hsMFtENFu1X9qvqE/U7vjAFVpcOs7J6Pz5GEqEa1nlrCv25DAg9Wt2NbtUwP1fdyMJMmWvQXsbnbQL2C74Fzp5Mo89YFKkahqCuK2c0HgmLwygIxa07EMU6XxSvX1Fd5wwuOg3WgDCEyI3vHJK7x3V80cXqyrGkksZz+x1vD/Qybua+NqsuP5MNd8Ug/lYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hitachienergy.com; dmarc=pass action=none
 header.from=hitachienergy.com; dkim=pass header.d=hitachienergy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hitachienergy.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3tCOREV5114z8Chmq/XccVZiDiKYZ1sEOFAEOBt78GM=;
 b=vFA9n/YW71nZjNhg1Bzcr+K8f8k1ueZUlb3fw5/erb7ImN8+0xXcLCy+bHmIj7znyBBZXQ1/sRhCcVGw8tMnRwufBNwn1/crHLNnISNRZXNTnTez09JdOWvL9uSjKtq9bz04Hc26x2VqPiUsItsEqfXtOrafwnbIb5u8le1is8pSEu4N0MRk2/W4P0I+uSi6w6KDofaraYMTTfVjB4wkg1AmHzaUVQMKZk/ji3WpQxeCCW5CyB04FLWw0nvDq+9N88EQrsRwIXHPkc4HG4pSxsdphwgU278JaEQOQPQKLeMmpU0SYBOVWRqk2UpeQRfU801eTHI17/7DP24PmUkXqw==
Received: from DB9PR06MB7849.eurprd06.prod.outlook.com (2603:10a6:10:291::22)
 by PAWPR06MB8785.eurprd06.prod.outlook.com (2603:10a6:102:380::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 16:14:18 +0000
Received: from DB9PR06MB7849.eurprd06.prod.outlook.com
 ([fe80::f0f5:da:c159:65ab]) by DB9PR06MB7849.eurprd06.prod.outlook.com
 ([fe80::f0f5:da:c159:65ab%5]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 16:14:18 +0000
From: Tomas Alvarez Vanoli <tomas.alvarez-vanoli@hitachienergy.com>
To: Zhihao Cheng <chengzhihao1@huawei.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
Subject: Re: [BUG] UBIFS corruption on powerpc 32-bit targets
Thread-Topic: [BUG] UBIFS corruption on powerpc 32-bit targets
Thread-Index: AdyRCkfQa4Zi0XkcSIOaDwEHvEKqQgAfkK0AANfexzAAKpBxgAASt8aTABoBiQAAHEXIlAAWQcWAAB0NmY8=
Date: Fri, 6 Feb 2026 16:14:18 +0000
Message-ID: <DB9PR06MB7849E51C72D54F8109C55714C266A@DB9PR06MB7849.eurprd06.prod.outlook.com>
References: <DB9PR06MB784979B96C388174F81F9103C29EA@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <356439c2-5289-57d2-52d4-8b436252a630@huawei.com>
 <DB9PR06MB78490A50AB800FB36AEF5E74C29BA@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <b93ff0e5-79ad-ff73-bdb3-e7e7d5c35256@huawei.com>
 <DB9PR06MB78498340513D9788FC7576FDC298A@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <d0eb0572-e383-466e-7b4f-97e4a853b7c5@huawei.com>
 <DB9PR06MB7849BCA2FA49A7AEE3D03104C299A@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <2e8dee20-842e-e946-87a0-9ff0190600ab@huawei.com>
In-Reply-To: <2e8dee20-842e-e946-87a0-9ff0190600ab@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hitachienergy.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR06MB7849:EE_|PAWPR06MB8785:EE_
x-ms-office365-filtering-correlation-id: 9e2ed2c9-ebea-4661-84df-08de659ac7bf
x-he-o365-outbound: HEO365Out
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?QDv+3xaYbX8gB/GsB8rrmaLPau0YdnJOM4A1ev6K13HZ68E8SKBscPCLBm?=
 =?iso-8859-1?Q?TtcPFS64TpfTZNI+C4Elt6bgE54wBILwFfnc5FqwvLbMexuo829toQLYk7?=
 =?iso-8859-1?Q?2YhGurbNDMHdOhPQlv4hKm/DkET0/BpyBNq8+dAt7W6avu0LzeWAM4biTb?=
 =?iso-8859-1?Q?naAuRQvmuv3oS3TkcT4A7RngTlTsOtHptl69F/JaB2iClPXw5/fBzGTVvS?=
 =?iso-8859-1?Q?bqnq6A4pExdAn+99MdL0NjJlQ2MfmR59HDGEdoqsQiXyZUjktV8/FUwDHa?=
 =?iso-8859-1?Q?tOkGAXfeLeSDNkcfQfiTwnmIHmdSl8dWMZo3Lp2m8wq6ubjOSMed3FL+36?=
 =?iso-8859-1?Q?K+Bx8WTTBUHiipA0L29fTiZunPCAfGs58VJX285x4CBAeoMJCqG4HMEh9A?=
 =?iso-8859-1?Q?kYgS55qK/HQ0Dfzxss681HakjsOR2uhktAFBL7z+IyQRZcKoaC0cozTKM4?=
 =?iso-8859-1?Q?KNAuSIL7zNn0gtFVvoj7RwlDlYy7m6hymd+SEbqXRTyAhepY11zb4u7CyD?=
 =?iso-8859-1?Q?GBhwjVeO7Kj6HRV4eJ/PkACvEN1Sc8N/65gwYSoLLQ98m6Eiq6gsPiDiDg?=
 =?iso-8859-1?Q?u1K0puFjB4n8rJTXAhihC+SIM5icSTITpjs/C0FyAPnMdzO2p976To6Hgf?=
 =?iso-8859-1?Q?pdnhjMoH2CIHWiS1uiNBaik8iwzJpwp9hhEVdeerUI+NaVpVbpKCJ++NUt?=
 =?iso-8859-1?Q?HtNJ93DsqbK9iuhtQWq43jsR/zDMYTMWX7uBaZbdlL8Bavp2Mv4Mo2yekV?=
 =?iso-8859-1?Q?ziDdbtuNEaP8cbAJFzSDoDLtXyWbBE8h0MuvX9tlp/Lyjv4cq0B1AOcdQZ?=
 =?iso-8859-1?Q?NhxQEw3lwOyy+o7pDXDxBbO5KdCFzLc/Y2IGaqWVzIg3kRGkoslSU7s+Td?=
 =?iso-8859-1?Q?lTina4ZVX/WN02LztbNpTWA7X00qmMgZhXxczyci2i5FHaQqaNSITpVddf?=
 =?iso-8859-1?Q?7InWFixDRTDshzDcESCFiG2ZnvXQ9gX4qmYaivS+E7nejIS3FhvveoTiJ2?=
 =?iso-8859-1?Q?T8MhUGOhIvRvkvq2NmqKYLLQd3Lqx+ZzvQ5zhP5s6BNi+NLfGOkEcbYkUD?=
 =?iso-8859-1?Q?ycd7eW83S3yBELWfizP8YJaAMUzpA5zVRnbkmWbQqqPP56YNIvVH5nMJrh?=
 =?iso-8859-1?Q?o0Ub96gQMGPK6nzZraQnGmyu7llyONojHQ2foScCOl1M5vm2ApWlCirLZ+?=
 =?iso-8859-1?Q?+i+gNDLRMR6YkrrmrOdBBxHlvwcbPT1EwdfqFtRDObE6DbwpZxKjarVtkt?=
 =?iso-8859-1?Q?iCtnzd+Kii+sH7Y8TKLKbzcNMZFA40QKt/D8KQcWT9gDngMU+w5O4kvt8A?=
 =?iso-8859-1?Q?plnD3+BO79cD8ZxI/b1sLvr9XHqADBII8p6Ui2ED2nuW276y2Htpm6xn6L?=
 =?iso-8859-1?Q?jyehD9zjiLnBrEGdUTeFhBwN7g5Q4Qc6qvVzC93O8nMB17mH4zSkviv9e7?=
 =?iso-8859-1?Q?hQnY10/WhlrtTxGUA7pHr8QuDTASe8Y0/es9+RJXH4Pynh316a1wuDagmB?=
 =?iso-8859-1?Q?VtACHVloZKelBuF3dl6BoAUbxm3pE/lC90GpThHobcT/G/GwDnOIlxRefp?=
 =?iso-8859-1?Q?0WUBbZUaiRNyQjwA9n2SpPOGmUs6Ut4Jh/moMIIkhjhYLnW+LJ2OyPaiAg?=
 =?iso-8859-1?Q?z/Hp2mapisvgPfzQHjlkub9R9nY08tlDHvBFI1bMVaIEXli2B8BtyV6VyH?=
 =?iso-8859-1?Q?GH5kf48sRBJu1q/KFXM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR06MB7849.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?MnWtLNaCXxba3761g+5xxWIAbY1rIEjcHmEi0GWs5A1O/fKwa3W+CcUm4V?=
 =?iso-8859-1?Q?PlI9mP/Grobh6Add7pUbjs2lgevVNpUUWsxGjjeMuJCwCYoPB1CyermuiI?=
 =?iso-8859-1?Q?5IbNr7tWct2kNOKqUWpFGhw/kQ1qPvKArqYvQHIUiURiMcyHTIK6fu1Gwn?=
 =?iso-8859-1?Q?ljl2f8MZ8x998/dQWv2NFu+iXXztUYI6D7noNVTIVjXwYC9Bak/Jrju9T1?=
 =?iso-8859-1?Q?9RUwfUVoS0w0zLUEOe5mKpWaB8OZ/9bv6o01Agtn2xY7Gjt5/oA0Bdgqlw?=
 =?iso-8859-1?Q?pVsMOevS/Jlmw2HSfMfnMqrqN68hqsZBMTxun6ix63rKUw4kMunhEDTkKH?=
 =?iso-8859-1?Q?kO3UsImXXE9FzXnoGAOc5MLFxfyfCbZMDQUTo5IVhcjJsO50doeSc858lZ?=
 =?iso-8859-1?Q?Vim0f56vkAnpj3T23d/Jy4sPFtSveIu4fh6lDnH6oZTn4RNGTBn2gX4slX?=
 =?iso-8859-1?Q?Nr3TSa4Nqw2OoKaRzHw+2OcQ6CmbX/c4eyDU/iaRqiYvZev9VLj6dkqa3E?=
 =?iso-8859-1?Q?hleIDyJDUrjfKt1DRf60ZqffzFx/InhwTi4wGp7xetvJsl2AxRSYcMFjWz?=
 =?iso-8859-1?Q?2Rr03GlHkJEHpo+wlcG3dYfrn5MMa7AGdYTnQtwp/u9ztEcR22sRA4rtjZ?=
 =?iso-8859-1?Q?T4uDossAKy6mlcEacBlbbEJWJs6wcPfXucxYAzqZrhQtS9cy4yfwxGilyb?=
 =?iso-8859-1?Q?EGCMke30wO6gsDcapJJHv55+qxLy8Zms8QLjI0NgHQz0SgmrQon3AAlBlF?=
 =?iso-8859-1?Q?5M5jAAC/BP50n3VZ5wP3wX42fpnc0VXI9hmbjen6tP0uz5z+Hv6YlL2W/s?=
 =?iso-8859-1?Q?zBx4BwvNnccQjs0WxGjdciiDIA/wvJk/X3LDtB2A1ptq6ihFtK2xdzejmK?=
 =?iso-8859-1?Q?RB3m6dPLi7DoVBV3/sYIh4BB01qr8lEKLYQdafasyX4zwQwpW7I10NC43Q?=
 =?iso-8859-1?Q?5d4ZmvNmDunCxU0j+5E9cnnmFzGLfkdf5ezd2smzcMf4jCGg8s1m2ude4L?=
 =?iso-8859-1?Q?/HOeAd5mx4ECBO+GO439rhreYlKFQMlSaH6cxSbtB0rPEeKbkx6db8lATm?=
 =?iso-8859-1?Q?dwEAKh0Z6+m9bOXlmYDhejh0fb7PqAHoB593qzAWP5wWgnZiLQ3ozxqFxY?=
 =?iso-8859-1?Q?CCJ060jT/u80/iRh7WHQk4RRb0K08KnZ/jW6AagV/bJcbLFhilnD7M12t2?=
 =?iso-8859-1?Q?RlLU01FlmgZlhT4j4WSZrFU0r3kxyFnoaIHSfEKqV/eN04VE93BniwHhrP?=
 =?iso-8859-1?Q?H7bJyCTtmD+8jZBZxR8nRA1LFzyQ45mg6UiX9yqTQvlHzkV2Mueir1UEDU?=
 =?iso-8859-1?Q?YiapeT0UGpA4vY8MclNVsvp7AEPtxnbWuVwh6qPBoJjJaO7zkuFH/bmTQR?=
 =?iso-8859-1?Q?hHRUMBJLGqUO8qTf9oIeye+a/BzHB3xuTzBdHRcSCg/JhARI61pK7nrwZM?=
 =?iso-8859-1?Q?HjdmXGu/NMZMWFhzqwBkBkDGmuYM5uE7/Vi2mpcx8TLohF+oQdi6iC29dv?=
 =?iso-8859-1?Q?9eApYeAvLLk1WTHcges0wvRCNTqq2eEvgYx7kd4ZmxStaKoAUHpzuokcsV?=
 =?iso-8859-1?Q?pTMQEynz0S2Wvk4oqIqjzlCwqpUYylbn9WEGGJp+FYAuLW+xXIKwpJ0wTQ?=
 =?iso-8859-1?Q?D+vQupVsqwB0GyjR86MiydAjEnkysdC4OdKWPl8Myzv3UgT0n922zkQCbZ?=
 =?iso-8859-1?Q?k3AKcqvqXYAMq4HnReNn3DW+6u2buhfZY3OwTQJObc/5Qc8BufUF+YAQGa?=
 =?iso-8859-1?Q?kOMOmJfM9/t0sozxxUF6xgZivU0EBbkeaoBP0eXsU5zIgnwejT5QPzJmvF?=
 =?iso-8859-1?Q?voS/5DHOukLUVBDPF/hx2T+EydfWURhOLyJpBb8+t7jMwkSXOtuD?=
MIME-Version: 1.0
X-OriginatorOrg: hitachienergy.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR06MB7849.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e2ed2c9-ebea-4661-84df-08de659ac7bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2026 16:14:18.3400
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7831e6d9-dc6c-4cd1-9ec6-1dc2b4133195
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zFO+9V0fr6i3TAH7xM/8IR9MYdr539oH6mP62bAyX/cDfuHKUPEiPyv18NNmjNtvScCmn4p6WISEUnbWRV2zeDAe6So7EZi0kFKgkXIWs0glFr4Ze0Bu9S6vY8ko5xNX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR06MB8785
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_081425_443415_95751D5D 
X-CRM114-Status: GOOD (  13.27  )
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

> Are there any error/warning messages(from ubi/ubifs/flash driver) during
> scanning?

Now in the mounting logs we get some ECC errors, but I am sure this comes from
the way the image was dumped and flashed again, because I did not see this
before. No truncation appears for the affected inode.

I have another board where the corruption happened, so I can analyze that one
with the patches suggested too.
On this other board, the error is the same but with a different file:

UBIFS (ubi1:0): UBIFS: mounted UBI device 1, volume 0, name "cfg"
UBIFS (ubi1:0): LEB size: 126976 bytes (124 KiB), min./max. I/O unit sizes: 2048
bytes/2048 bytes
UBIFS (ubi1:0): FS size: 132943872 bytes (126 MiB, 1047 LEBs), max 1058 LEBs,
journal size 6602752 bytes (6 MiB, 52 LEBs)
UBIFS (ubi1:0): reserved for root: 4952683 bytes (4836 KiB)
UBIFS (ubi1:0): media format: w5/r0 (latest is w5/r0), UUID
DC7EC969-1F4D-4669-9D31-16C57EAB96DA, small LPT model
UBIFS error (ubi1:0 pid 134): ubifs_iget: failed to read inode 123367, error -2
UBIFS error (ubi1:0 pid 134): ubifs_lookup: dead directory entry 
'common_userdata_compat.xml.gz', error -2
UBIFS warning (ubi1:0 pid 134): ubifs_ro_mode: switched to read-only mode, error
-2

There are no error messages in the mount log for this board, the node situation
is the same, and there are no truncation operations for this node.

[me@mypc debug]$ grep -B8 -A5 123367 logs_from_mounting_second_board 
data 123362 seq 1375451 found 1 2048-2520
padding bytes 2520:4096
data 123364 seq 1375458 found 1 4096-4576
padding bytes 4576:6144
data 123365 seq 1375459 found 1 6144-6624
padding bytes 6624:8192
data 123366 seq 1375489 found 1 8192-8680
padding bytes 8680:10240
data 123367 seq 1375493 found 0 10240-10728
padding bytes 10728:12288
data 123368 seq 1375507 found 1 12288-13592
padding bytes 13592:14336
data 123369 seq 1375508 found 1 14336-15384
padding bytes 15384:16384
--
ino 123363 seq 1375463 nlink 2 found 0 125168-125328
padding bytes 125328:126976
---------- Start scan LEB 182 (main_first 11) ----------
---------- Start scan LEB 183 (main_first 11) ----------
ino 123365 seq 1375465 nlink 1 found 1 0-160
padding bytes 160:2048
ino 123366 seq 1375466 nlink 1 found 0 2048-2208
padding bytes 2208:4096
dent 123367(common_userdata_compat.xml.gz) seq 1375486 found 1 4096-4184
ino 123367 seq 1375487 nlink 1 found 0 4184-4344
ino 123361 seq 1375488 nlink 2 found 0 4344-4504
padding bytes 4504:6144
ino 123367 seq 1375490 nlink 1 found 0 6144-6304
padding bytes 6304:8192
ino 123366 seq 1375492 nlink 1 found 1 8192-8352
padding bytes 8352:10240
dent 123368(ne_config.xml.gz) seq 1375496 found 1 10240-10320
ino 123368 seq 1375497 nlink 1 found 0 10320-10480
ino 123363 seq 1375498 nlink 2 found 0 10480-10640
padding bytes 10640:12288
ino 123367 seq 1375500 nlink 1 found 0 12288-12448
padding bytes 12448:14336
dent 123369(unit-11_config.xml.gz) seq 1375502 found 1 14336-14416
ino 123369 seq 1375503 nlink 1 found 0 14416-14576
ino 123361 seq 1375504 nlink 2 found 0 14576-14736
padding bytes 14736:16384


Just as a summary of the whole thing:

- Happens only when we introduce 6.12.57 kernel into our testing system.

- The boards go from running 6.12.57, to 4.14.20, to 6.1.75 for testing old
release. When the 6.1.75 tries to access files in the cfg volume, there we see
the error.

- We don't see any warning or error messages from the kernel.

- It only happens in the two different powerpc cpu boards we have, not in the
armv8 one. All the boards use fsl,ifc-nand and the same nand chip.

- ubi tests from mtd-utils succeed for the older and the newer kernel too.


Best Regards,
Tomas
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
