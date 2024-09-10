Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E35C2EDE996
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Sep 2024 03:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qv8h9v4ukQXQPRN6TDVK3B/Bl9Y7Y58ALJkPdMpGdPY=; b=KutenuwQ00ZDVJ
	JlH+173zag4XBhhxdXX8/2dkgE3yo89fFeQ8+fasl3V6xJwxdUX6HmiMiOKFV7z4Kcn1UKmXOIGFU
	7DD46MT4wkBN4ZjJohHPpRaxwKajUXgvpAFpMiLGg/W6YNGKgZcm8mdhrCd9Zbi5timYKR8BNex1U
	jEZYtpgBqI63re2mnpQjpkN/Id116YB2z6idQiCclUKo3L3ASx8G6iiaaOfPJw2DHSYPccUZ4jwoF
	7aqs8Sek9+fAypA7cx/mytsgd3sMov6L7U2NpukV+zGmdAyJOuotX9OaUP6ERs2TRr5NFUGVGBssS
	I4GuumCSH5acYtBmTbKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snrHS-000000042PP-2SXf;
	Tue, 10 Sep 2024 03:11:02 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snrHP-000000042Oy-1vte
	for linux-mtd@lists.infradead.org;
	Tue, 10 Sep 2024 03:11:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rTq8kvwKabIAtCvENoKem0x5BYD6LHAbjHXZurly3nvHVOy89fJ02goxEY50gN6K/yzH5oHA113kuzShlvdFrJELdSiOhQiTw/lMc2zb0UgkkrTzwRTqRq6gTMWRwJWRBLFkm9Q13XSmpRamspdNqopkQ1rJJb9RRwFvHVSFs96Ba7pPxpymuZkVxhOU9q6+Wxpd3BjhBELOOYbYR5AjRLbhtKKfK9MO+tF1Y2LqsouIEdoGx0w2pRwjSVPR6+XS5VwqxHSO5nqY5GbgliR32ZKiu2IjS+uoiDN+GPZ7mEFdyRJEGhrkRcYL0NmPKCWOxPwfVINpoPCSmjeHktwegg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f2Rt4S6nm8q4MIYMgQYl1fiPvEoIL0gvO9tPMekCbkQ=;
 b=XSGsEUDzIySW59Fzme0tw0X07Y0JagYlPtRNVJKMlIm34kMIHwcKECxj2FdQr08Pxp2N8qhwgbzqwzMrgydC6czz9jrjBHKnZOD4o9lLOD/1JVXWJ4QLfDcGtGxfljSPbc0tPZamxSQdpI/nb+hZyRjkIDe8RJeUvvg77b/B4RbwXsaLlR5d+QlBCnGQwsMQ8rET0vtmTx4xKDCDFNvM9JOMqq4kvVZ3HtJs+rf2e4Phth+9TfL+/qt507rej3kQhHX05u0nVfOVxYqWXJbqKkEWJQHkQNA9EQ8ogcTtB/4azN1HcUCNjJLoKJLPY6Tr7P1Ioz1pYimQ+4rgcZzdUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f2Rt4S6nm8q4MIYMgQYl1fiPvEoIL0gvO9tPMekCbkQ=;
 b=LJN0s12ROCcQMXmqSTXt0OiMNfY4ya9O+vxD+eJ9ls6wLPXJMHjxW6dfvre029n6xGRUONntog0+9pSFPrCXbS6SXEllsNz3lOFhprovEUIzscCWfVw9s4AiBwb5BpssogBVUb/qtsqorKQHKjGPGehKRoVAA27xhcBiyJl0oVh+9pFR7udB1kVwgOiN74u7V4jEKQYtZuaQmrRItxzZzXgEDAcBwMyF67Fy7Tkcz3iZm6HIdhuYtpyaHIKN5nVlvvHTcC4HPR2W6H+oiCJXnJjBqMkkl93jY3XkpkrTEmzMP1LuQ8Rd/k0rLSk88FMjmUcPSQbXSYOUihIK8v4+nQ==
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23; Tue, 10 Sep
 2024 03:10:50 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334%6]) with mapi id 15.20.7939.017; Tue, 10 Sep 2024
 03:10:50 +0000
From: Bough Chen <haibo.chen@nxp.com>
To: "zhengxunli.mxic@gmail.com" <zhengxunli.mxic@gmail.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"tudor.ambarus@linaro.org" <tudor.ambarus@linaro.org>
Subject: 
Thread-Index: AdsDLwhScsJ3AoMdRP+yQViqhMt15A==
Date: Tue, 10 Sep 2024 03:10:50 +0000
Message-ID: <DU0PR04MB9496312FD2E8D2A601097FB8909A2@DU0PR04MB9496.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9496:EE_|AS8PR04MB8247:EE_
x-ms-office365-filtering-correlation-id: 4483871c-f736-465c-72a3-08dcd1462c58
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?G77Kzp+2TEt5XH5r4Fx/hpK8jRpWjgUG8EmOxrI+EdMvqOsAWZiDg0nuu659?=
 =?us-ascii?Q?t0awzY2ojvAiKhHidiPI3aSRpTRL0j9bouw8MP5jIgtIEluAFCxdWP0St/Au?=
 =?us-ascii?Q?/ARo+seE5gSeNalcy6dkXAiMtPY2iLD3ezlWvOuKpXT8Ch0PunN6RlnpbilD?=
 =?us-ascii?Q?PW39oGLhJ7OWNJhRdabpFnejFsBmCJywdmRdZ9Y/yj7MSpYt0EJGVTSYQXrE?=
 =?us-ascii?Q?YRJMPJJ+I2R897WuZ8dtD8ZfzfBwahRl2TY8dL5A/T/kmGN15bQfOdtBAwRL?=
 =?us-ascii?Q?/vOm9Onw14j9Tp9p1MMw/jwl7DgC33NO2X2yG8Lhi7Xh/1Yjoo9kMldmgRFV?=
 =?us-ascii?Q?F0nz5QsMHkrcplzf9Oetxlawkthiu5M/HYiE0VcrtDsdlPTGJmbb2gZdv5cN?=
 =?us-ascii?Q?uQFBCZ6sDfAcySLNDnHqZH361N3zRXxf4ool66vBxzVOvnqt7y0yiMOPBtTm?=
 =?us-ascii?Q?q6Cui5N499N6RCOKV7Ncpo5Q9yd81Ds5/3mW9RAMGHAxZeAll96uJ8UzTC6N?=
 =?us-ascii?Q?1bLk+zCauxW7Yj7xnnMChaRJoaGe7DWkIEiilBwl+0cbGdNkK4AELo8TOMvJ?=
 =?us-ascii?Q?MlPD6EK7WJHzUyMJoAvevZo7lKavgkBZ5I4XU8q/taWEG8PnJZUNhFaoxju6?=
 =?us-ascii?Q?c1Fl20LIf983/gf5pymGA/X07/z9Bw3JmG2A92++mT5EmKgzRO4agpqgzl7Z?=
 =?us-ascii?Q?4vjUbgZQh1zhgtGQnCD5qSX/fhMJEbK7E0asMYBPHSGOtVjU++eJgLl8XPXS?=
 =?us-ascii?Q?kN/g78TaKFsCLVkmNvdo2Voxm5W5z9G/+T+DsirTuTRwQ5GVCZeAaMhPj++o?=
 =?us-ascii?Q?O/yX2DdCV8c5NIGKnZLmGFrO+CQqvqu9CzIlnbs488P/ruZa2GV5GwGMZxsq?=
 =?us-ascii?Q?sNq1zskd4bQoFg6T0H3eNqv+iqinrXTjQVFjSANJAjza7c/NbcTlBEsMAt/D?=
 =?us-ascii?Q?qcnXTOE4PbW+MPCYrkC6tCYbRG9jOOUsAuVpcXDA7KpJLMEnwKzIFJYnxPW/?=
 =?us-ascii?Q?i4+jowANGLGREBaMcg5qyL5BncONLElkced/V9RMR/t5b7t9UJ0jFAs4ha7b?=
 =?us-ascii?Q?HhunR7IvKKB8JTkTcHedybyCLyZ33+CC+oQ1dBsjg9CoS5I79I/nT0hl+QDH?=
 =?us-ascii?Q?wMJhO1yEthyhwmj3QilbCM/Mm7gKdDb6nD5cK9cmXXRUPlgxO0WcfEuccdo6?=
 =?us-ascii?Q?6L+FnAtFko0mIwPcVIYCNWC0m2kBbEUyS+zQ1MKzVKIPQn1A8V3Y6oN+WI9R?=
 =?us-ascii?Q?uhfRs7MhNnx6/K9pZ8oFi4ZKjxNmbelvwnAX+wwW9/ZnVMDfit/nCfLVm7oq?=
 =?us-ascii?Q?6LVaDGT+cHhrjaw6S1WGnKxMoyjTfouWs3/14606u2V68E6LZb4Sq8QYjhAd?=
 =?us-ascii?Q?kAn+dpTKdlT9yXpupz2BHr3U3KdH/k2OeS3xA7ut6ovHnoWsyA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pl9zTtNinApAzKYESgAu1XIRVXe9QMdnjHlxcDesmUOVAR+5tROYQTzmtNmF?=
 =?us-ascii?Q?XEdePDJYXI1NthlDl4fuBXTBV+TrvQad1rWfMpOVblpZTem8ppeEJb4FJF+p?=
 =?us-ascii?Q?rriChtvE7jYtl/LJ77kHLmUtVAEB4slQUwG81CYJsjr9Ivm/kxKs2px0L+OT?=
 =?us-ascii?Q?slAmjTMSLmeVOJEnm/gxyTD5eIJ4VGhFDGSTOB9KRidJidwY2FgT219EeQIS?=
 =?us-ascii?Q?fdDSST4xFE3kiLt3yOuG90zLEdNRZ1ls2j0/fxL7L5iiLBYFTmCJ9rgNpg+h?=
 =?us-ascii?Q?krP9ZC8FpseRDgnSDUqdObnXRJEUNU0Eg4oQHgr371TOI4RIrNnWlO52Mwox?=
 =?us-ascii?Q?PFBtsuyyR+x0CXaAHq5ZQg8ksqL7UTETyqH3lwJQfHBeFrOaJ503EecTQWUR?=
 =?us-ascii?Q?CjUfx4JIcXa7dCvjLFnSWk+ey+C1ejAjHBdphSMuW+8mvpfQszVRTgquCOFr?=
 =?us-ascii?Q?6NsL77n859FnHXV4Ptnlt/FGT6aMvUMGgZw9lOIYaxMQZC2pX1HyfLESRcqd?=
 =?us-ascii?Q?L+odMR9Eaw74PZ5u9gJxSwN6HVGIqBu7m0TQ8IY3pFF9wUYOCyLBTPQyMtex?=
 =?us-ascii?Q?y+2qMKIriH5NypGCer2eKBKv8it8UCW11Nr15MbZKwflYMlkBh+y6Es8QkHh?=
 =?us-ascii?Q?0daAVZkrQR/UQMgO7IkxZmVovpUfcn3cdVyFe9rFlbszE397utCWg/HU7dWp?=
 =?us-ascii?Q?nUr0AGLA9hAbNlvZPAHcpBrATdI0ThwCMsl/02XjC7TGEZI4j79fm8sktFHO?=
 =?us-ascii?Q?KqYe0EGP8MM3y5aWvmAGYwgheDiP4RpxLYi54vZsYRUUzuBek8zK8frowa3i?=
 =?us-ascii?Q?KNhA+QgcI8BUjPDwFatyd/jFRcNWRpcZJsWbbeV4UHLUYoWMmAGLdYPoYd9q?=
 =?us-ascii?Q?haJuIUhU+ti1swR2BA1pDIIXhf5FPLsRShgU3n/Vg0ixIiw1n1to3volFIXv?=
 =?us-ascii?Q?OHyA/8xHM0EurBveXaF4yFgEqzVMgbGhMTE65aNiue3Hb18NNcIfPlA0xebG?=
 =?us-ascii?Q?5EbzgK8/513jT0aXAzEue0pNwv2Yxo11p6dz7c+aUkja5Wb4VydaREdtTBP+?=
 =?us-ascii?Q?/vtZh0mN/sMl7yyYaSv/+9TPzOw7GctiXkvuPhheoSkpoau1E/1Flll9WhMp?=
 =?us-ascii?Q?QJA49oGkPWAWauxRV5fTcUcD28ZkJsi+qe64/BM+33wbKkzhD+LWMUE2LJ/j?=
 =?us-ascii?Q?NYS68Q7RVknPCGDHLcrgHdagHHEeZO6vwUqdAnfObVUWoFtBb30fxP7SAfKt?=
 =?us-ascii?Q?+k7AUNGqYaK09i+6v4zUYdAu+OLg8jcGoxaJeDSNjnMDrCnPJPDnMUxFSxNu?=
 =?us-ascii?Q?v4acXUfspymp+vJ7+i0bJcWGzeIIANA0hL+4v8Zy1OGOD6VORApYvQybEOR+?=
 =?us-ascii?Q?ucE8/CH1ZCatSN4YyzpD0jk5mdYru/KXE34EJBOeeUle5vqjPhZNJth5/5xU?=
 =?us-ascii?Q?d/qGt6J8Zghb/iMsjzHbfmVLwIiOXI7amJCDq0Sk67AxTVxF2qCHTl36iG+6?=
 =?us-ascii?Q?MwL9RF8NMw38qa1wulryhUQOQlsq/W2uWMhsawfryUUsD2wD+7YQbkSbe84q?=
 =?us-ascii?Q?zqCmkCQtqM7EKsOYFi0=3D?=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4483871c-f736-465c-72a3-08dcd1462c58
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2024 03:10:50.1337
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d6M1Oqnp913o+wTnD4D81fEtH2ctJSozd6gThkn9dXGCRX2ZxnCWKcBcHClfRDHhkNwBlw2ryENjOvXk3em4Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8247
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_201059_525819_EE7D355D 
X-CRM114-Status: UNSURE (   8.71  )
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

Hi Zhengxun,

I find you send a patch set to support octal flash for Macronix, but seems this patch set has no reply or following for two years.
Is there anything missing or do you have time to continue this work? If you do not have time, I can pick this up.


https://lore.kernel.org/all/20210812150135.4005-3-zhengxunli.mxic@gmail.com/T/#rf6e301cf020ac3ad2e8257aa03a1ca3a428bcaeb

Best Regards
Haibo Chen


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
