Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A94CEACEF
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Nov 2025 07:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Or8LtqbH3zz6G6rwJShDdURMkTvfN/0FaNT23f3lsw=; b=Hl8ulK+Ac049Mq
	fPOJpT58wf0KluXqq4sEwEk+TE5ahrMwoqqdyonHJE1vPTupV86XY2gM07fprkav6f3WQjdhtl3F7
	wHblHOYAUOvYIkmtsCkIaaCQOwRwXkxjsHu8dhALlYNvhRwTM40IfXOY3lDa5/1TdLxgpcICw/LXh
	0VL81RQ5HI+pH8aGj/9FB0Bn2D95qdOWzFQ68GOOm5UfW29s4HirDCKfH8T5zoauUuEKxYnWS5osv
	pBeRbDO9XTRJGXJrt8jgIrugTFQ0FdEMXVr9FJ1fp+qEJjQ6/54nYNTWjLBsWFCJDpK+tXWAI62et
	dqohLgBM3y2y5abNB5/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKu0c-0000000Fe2I-2Nol;
	Mon, 17 Nov 2025 07:50:46 +0000
Received: from mail-westus3azon11011022.outbound.protection.outlook.com ([40.107.208.22] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKu0Z-0000000Fe1o-48PB
	for linux-mtd@lists.infradead.org;
	Mon, 17 Nov 2025 07:50:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LeZSa0Cxe4yZBJdMYM2n/gkb7KB2/sVsyORjji7JSG5tq6iJL6tWvwe+RtGLOEyzgY18JS/EIimc9lUBIhs8r6U3OlUu82/nkOemlWJFMIHJeMZ4kWUdON+DLXYWlL0Hz5joic63mevVYBDzTbLOtgyGdpc1KxF3aks0KbnsfZNxcRMdFt0DXjcDyfPyyj/OyJsBRzEtW55lWNXDlOekkglWlW67WHhpUpAB9wNGFLtuSSfEVfLElc9AUBbic2Uz3hNgY35ngXyay/a5yoBrIHcWVVMjKZUpAG6PUeEbcnMIZL558WGwxU3mmLIQAdkR7LfculxwOkOuaHbRotzttQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H/QZNWwgyFrCjdBD6cnuu0jW2iPQRa87idIB3yC/hn4=;
 b=mqRft+xdzOfy2/i/0WD2KU2eV7eQyBShROLv5t5wyjgNOgmqUHcXJujHbuDmq+h4G1p7Sa+DBj5m7rxrTZhQNjkdtUQmz/xrlbulzIaJG7YmiYjnU0StUrtweEdeurTIu2SxFDKNIc+kZTAgGeXQRcEnBTW5BEEgC7xJewScxkVeQ5h+3hfJkQtBwoWcKrggno3JLoBpbf9BUXO7cjhibUrrJNLW15Adc4yp2iIo7aYkJRek9dAoD6XZyHuLSgTrycrJwlMFiEZ5X9gDfBzeuoIv/4Sv2kEJdvLQ0772wr7/WfgqN+Su8igMpOaJMeMJI+hyqGh7NILdxzMAErMyYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H/QZNWwgyFrCjdBD6cnuu0jW2iPQRa87idIB3yC/hn4=;
 b=hvK8+zoyQBPdWARsfnIYylQ/lV6a43mJroj886+kzA44MKhjA4GMi9OQ/mwCVhs8tKMSC8DgOREeOAl7/aZ4CDexnDqkOdkYkxII+1OM/MFO1HZl56Q9J2KNryTwbW6yoiC9e6IClewbR06jg07fMo7mVaGzzwNwfNmIdcAkgzX+Q47hm3/Hd4kWTSK6zaL0MyUzm/EnVnsmZEA5qdllJd1d/S+oFCo+YGlAGn3S/Z1zJmAuE3D9IAR69pGlbFB9DbkrglBFDtzqN8Bn5iPq/4usdCEv11Uhnv5YwFk/epxi6CvgtHialf++GItlrVJcEDfhO8WGjgJVnUk3i0lgwQ==
Received: from LV3PR12MB9404.namprd12.prod.outlook.com (2603:10b6:408:219::9)
 by SA1PR12MB7152.namprd12.prod.outlook.com (2603:10b6:806:2b2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Mon, 17 Nov
 2025 07:50:39 +0000
Received: from LV3PR12MB9404.namprd12.prod.outlook.com
 ([fe80::57ac:82e6:1ec5:f40b]) by LV3PR12MB9404.namprd12.prod.outlook.com
 ([fe80::57ac:82e6:1ec5:f40b%5]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 07:50:38 +0000
From: Chaitanya Kulkarni <chaitanyak@nvidia.com>
To: Christoph Hellwig <hch@lst.de>, Christian Brauner <brauner@kernel.org>
CC: Al Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>, Jan
 Kara <jack@suse.cz>, Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg
	<martin@omnibond.com>, Carlos Maiolino <cem@kernel.org>, Stefan Roesch
	<shr@fb.com>, Jeff Layton <jlayton@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>,
	"gfs2@lists.linux.dev" <gfs2@lists.linux.dev>, "io-uring@vger.kernel.org"
	<io-uring@vger.kernel.org>, "devel@lists.orangefs.org"
	<devel@lists.orangefs.org>, "linux-unionfs@vger.kernel.org"
	<linux-unionfs@vger.kernel.org>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, "linux-xfs@vger.kernel.org"
	<linux-xfs@vger.kernel.org>, "linux-nfs@vger.kernel.org"
	<linux-nfs@vger.kernel.org>
Subject: Re: [PATCH 11/14] fs: add a ->sync_lazytime method
Thread-Topic: [PATCH 11/14] fs: add a ->sync_lazytime method
Thread-Index: AQHcVTDviPep/5c710KCD/va/1nG0bT2g1gA
Date: Mon, 17 Nov 2025 07:50:38 +0000
Message-ID: <47527262-c79b-43da-ad72-f52474c2cf30@nvidia.com>
References: <20251114062642.1524837-1-hch@lst.de>
 <20251114062642.1524837-12-hch@lst.de>
In-Reply-To: <20251114062642.1524837-12-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR12MB9404:EE_|SA1PR12MB7152:EE_
x-ms-office365-filtering-correlation-id: 796a1a89-e520-4f86-d70e-08de25ae000d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|7416014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?OEVmQm5GVzZYYUlTNnBFZXBxVHYwU2l6enQ2dmRscGNOeklpcWtTdHF6QUlu?=
 =?utf-8?B?aW91OFFUWVNjNW5ZUG1jeVE0Z3NxOXhCWEpncGowbmZCNWVTeHlMR202d2hB?=
 =?utf-8?B?Si95TWJBVnRrWjU4RVpBS3RadTRxa29QRmxNd0ppZGt5aGNlTFNUTW82MVlQ?=
 =?utf-8?B?M1lEZ2cwWGk4bFc2a2drbjJMVFo5SDRUU2UxcmkvZWM2ajFyQThLT3R4dWQ4?=
 =?utf-8?B?NkdTZXJmK3huREVVaU1wejBEK0t6VXExMnA5dGtZYURpNzhZNW1ZeGdhdUQw?=
 =?utf-8?B?NnUzYzQrRTFRUGtaQjFrbzY1VEZmdlQwV2R5RGczL2RBTDNwVnRCNkVSZVlr?=
 =?utf-8?B?UnN6TG8wYlQvbG1YYjJxWTlPeFFQelFkUGZUZjhJcTA5V2JKb24xMmd2dTVE?=
 =?utf-8?B?bjk0TExUbGV0NmNJN0FPUHdId1ZvNUQ1VFF1ZkxpaFJVKzFZcG5xMzdJQUxr?=
 =?utf-8?B?K3pBK3R4empDcmsxVk1QZk9DZngvK1ZacjdlTUxoZWtPU0YxL1dxYzc4dUZP?=
 =?utf-8?B?TXNJSVlLaFlGQldKN0pvbnR4VlZNT2EvQWhMZitxeFRsMXlpd0RubWsrQTNR?=
 =?utf-8?B?L0FKWTNjZ1pnRVNjZkFielRodzBEcFErK3VZNlBYU1NYaHgvVUYzNE9hSC9i?=
 =?utf-8?B?MHFsNE5xWFFidmxEOTVGZG1xcVlONHZmUUM5a2RvckpjaFAxVG9sQndPVUZ5?=
 =?utf-8?B?SUFDQllpL1Yrd243cGVxVlZvbFM5TUs3VnJYY2xWek4raVN5YnNIUFdOV0tU?=
 =?utf-8?B?L1Bpc0NiVTRTZUI0cVRJcVkzWEFIT2N5dTVlUkVtVlpyTGk2ZFVYVVV6Tlh2?=
 =?utf-8?B?cjlRT25yZ3Ewb2ZIckZpaTNzRFgwbE9ZUzR0Wk9GT0Q1ODh0cXhSam05dDZD?=
 =?utf-8?B?dmh4NGZndTBQMGdFbTZQNklTUjlLcFBNc2cvSGd2VXZlcVFjRWVMdG00aE5Q?=
 =?utf-8?B?cEJXdjlDVlhHbG5ubUtIeTJmS013T2JGUS8zc0RaUUJldDZ1VllrcW1CWXhq?=
 =?utf-8?B?WjVrWkpkaFB3MXB2STM5T003bkhyeU9Fa1VSVVFjNTNTSTJmU1JpZ05pZ1F5?=
 =?utf-8?B?YjlUbFdveWo2aDRuQXFYT2pKNEJtVytzNHMrMWFGcXhrQWJ5eU50clR4WWZW?=
 =?utf-8?B?ckFCSC9IeXlVeGxZcjZPeHNNYXV2VUFSeDlpVE9mTkFVVnJhUUhIRGJGalRM?=
 =?utf-8?B?bjBGNkhVRXluN2hLamxnL0pHUyt0M0UremFZNWVpeXkyZ1pTSVBqM01JYURD?=
 =?utf-8?B?dkhZNXhJZVpXcVVHV2pXdVpUWGJtZXZINEk4V0tQV0J3d2wrZ3l5d1JEam4w?=
 =?utf-8?B?U2Z3NnBLOXRVemEzTVNPdTlybVh3MTVMWk5hT1dycitubkFla3ZhZk9NSW9h?=
 =?utf-8?B?SDZQTnMyVmcyMTFURGZSZktYb1FhbmRqY3JWdTVhT200ekdUN2lHUVhpaFRZ?=
 =?utf-8?B?YU9aYVlCbGdrSEVRTTFOWEdEanNXYWJTTXZ5aTR4cFlHNHNSOVFwNmRpOUxK?=
 =?utf-8?B?cVdINGY5WTRuV0M5K1lqWHZQMW1DL1JpaUhEeCtkd0hjNzRhMTEzNjZ4VENO?=
 =?utf-8?B?UVZIdGlPZmNpWllHa2pKODBrVUdWS0NZN0lORmh4dGFKQTFhMTlBc1dDekho?=
 =?utf-8?B?MktJV0VTS01Bbzd5czk2S09TMDYvSGZnR0ZjLytvNzZLZ252YjEvQUEyUXVC?=
 =?utf-8?B?S3grdG5WZkM3YjZCcFMyazlHTkduVnB2TXd2NXgvMzNGTFlmQ3ZxOUZmMFln?=
 =?utf-8?B?azV5M255QUppUWJZQURTYmVwVDB4Y1hvdFBVRFNLbVp4QjRZUU5rcmxsckRX?=
 =?utf-8?B?dmdRU1RrOEd4dkI1NFN1NWtHSTlFcmtEeEk2dyszbVhqN0xkcTZTb3krLzVo?=
 =?utf-8?B?M21iaTYwbWpDT0k2d3JRbnJlSEo2MEluWUVkRi9oVEZKZ1NiT2pmWjNxYjFL?=
 =?utf-8?B?SktGd1AxcitPKzB4MkduZWswcGQyelBqYmJUMTVKN1NON24xYStjWlBSMnZP?=
 =?utf-8?B?aUhJb09zTFI0cGdidU9rdjBIR0lCanZnSEV6SExoVlIzYTV5cWlESE9jL3lN?=
 =?utf-8?Q?9megtH?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9404.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q3VUTGlLdzZtb3FBc1gvZUZaMUpOTDRYUXFvUkpwUDlmT29hYU01ajJObkdL?=
 =?utf-8?B?a0ZqQjFCWWxWV1lkck5lL2hzcmU3bGVLWEwrbGlBOGl2bE9sYWVoUjFVUFBu?=
 =?utf-8?B?NGJCOE50OW5SWnExQ3A2RlN4Qk1yUkJPWTFZQmFMTGZaNUZwdUgraGJEKy9s?=
 =?utf-8?B?eWdnd0JobFFRYTIvTnkvNXp6cWtCbFhRQjc4V292bzFuQ0c2dE1ldVQyN2E5?=
 =?utf-8?B?QlRmemtERnBFdUx4YTNaaXY3RW93WmpXVDRrc0xzU3ZsNm9PaFRtZnY2R1hC?=
 =?utf-8?B?ZkRKa01xRFhUVndocXRud0dVaWZSaUY2N2pkWkF5MXJHMkxTV2h6aGlyUVdo?=
 =?utf-8?B?SWtvM2lUa2ZxS3VQWWdXaTUyUFV6KzdYRlBMaTRkc3RtMFNRS2NVK2d1K0Rw?=
 =?utf-8?B?UHNoOURDWDAxVFRkeFBlQkxZa3o1TUc3NjA4ai9aaFV2KzFLTGM1UVdTUlZS?=
 =?utf-8?B?ZlJQR0lXRHVkK2F3WFlHNXhDL1U5M0YwUTFVbWI3eENYd0Y2ajBtaUNCV3Iz?=
 =?utf-8?B?ZUdtTVY2UUJnSmdRMGZ6Ymp5UnJvaXArb1Q3V2M1dHA2OXFEaE92N01ZZytr?=
 =?utf-8?B?bWtES1Q1dkR3MTB1K1FYQVB4MHFhc1BHZUFqM1RORnZlbTUreHl3Ri8za21M?=
 =?utf-8?B?c1hwMEZmYU80S1MvM2JSQ0RCWGhqbUtpcnFkK0p1T2Z4QUMrd0lJVnFDdFlJ?=
 =?utf-8?B?QkkvbnN4dGFXYW12NERNMDFFZERWb0ZSeDZWTVJoUS8zaDRTR281T2VCTm1R?=
 =?utf-8?B?Mm5JZlBxb1gySHlOUjlGWVBVMk50MGFoUUtSVUVJdndhcyt2eU1IRHBoTHVI?=
 =?utf-8?B?aUZrVm5VK2ZndytGd2lUdXk2WUVBVjhMWXNQNU1qZk1MUU5waXVWZXhqcTAw?=
 =?utf-8?B?MWxBRUp5T2VTNXZEbjEwUlBHdktMZ1ptYlArTW9VNkk2eTlvNWxwcm1mbjVy?=
 =?utf-8?B?V2tNZzIxYTZ0dWt3ZFlMNnZYdUhQY29nTlZiNGFpYzBVNUxyMXZVZXdWaXZM?=
 =?utf-8?B?QlJwbFVNM3BrR2YzVXJIcStJV2tuUlREUTBFTTNuOU05WktsdEFXajV1eHkv?=
 =?utf-8?B?bmtScWdYcnpERXdJTlBhNk9VVk95UHcrN29EMVY3dEVHNEJ3UUp2dnhFdUsr?=
 =?utf-8?B?OU01bzR6R3dYeVNrM2l2K2NqT1hzWlFyWkN1YytVSFVwZnk2QVpRVGlMa0dV?=
 =?utf-8?B?RS85Ti9GaUgrSXljT2pGMG01U3c1KzJMdzVPOGFtdnNGTm82NndWQmJUWWpi?=
 =?utf-8?B?RUNMR0ZEUzFSK21GYjBLTnJYQlo5YTQyZUYvWkVuOE1HbGNmNXNFTWZWVm96?=
 =?utf-8?B?NTBIaUt6MTdsZ2kxSUdjVXBTa3hmeUUxQVV6Nk90WVVjbmg0Q29DUWoyWWtZ?=
 =?utf-8?B?U2hZOGFwdWh6ODluSS9RaFc5dVBoOWZsNHpOYTVpcUJBdnJKWUozTEtDN2xB?=
 =?utf-8?B?RXJiSldlY1VTRk1hV1FXWkQ2Q0NCWXJyN0hsNklRbkpXUjRpT3VSYUQvVG1t?=
 =?utf-8?B?YytIUUpOYnlWczQydU1BaW92YzFudzhOcWJLa1NkQ1hyT2VETmh0Y3hUNnh4?=
 =?utf-8?B?NEZUZ2lQbDR2VnROS1o5NUVRdnB5dnFHUElsOXRPOTM2TTZrQ01sT1lpS0V2?=
 =?utf-8?B?emZoeVZUT3R1c3NURlErcG1OSGxMdjVFbVhoUis4SlhBY1ZFSDNRcHpzV3Zl?=
 =?utf-8?B?U2pkMU1UT1duNzY3UUtLSEMyaXZWNjBUKytid2dSTnY3YzViazRWaWM1eEdk?=
 =?utf-8?B?QnpMQm1xQ2dkQmFkcTRGaEs2Q3VnVnViUUVDU0tIazFCWURSbVB2ZUtaUEpL?=
 =?utf-8?B?dVVWRlQwR2pPV3V1cjJpdnlFYWZsYlFCYjhYS2tPdjBVVlpqNjJjSUpTdWkw?=
 =?utf-8?B?OXpzbzFmNDRmZzBySmVFcGlHT29ZRUF3VjVSNDU5NHR5YnNGamhrYmxsU2Vn?=
 =?utf-8?B?dTNXUzcrSmFwSlpMSVk3bS9KRzFHUGxkNG9OSjhrV1U0ai9mWDJwdllNRFFY?=
 =?utf-8?B?dEpMeW1uZzlvd0xrK1JMTlRTTkZMdDh6alZ2a0NHRWtkek1XL2RTYXRhaDFr?=
 =?utf-8?B?ODF3OG9yZG5tcThrbmFwRElGNFlzeUlmK3htN0F6OHdjOThJUEVFM0tsRE5B?=
 =?utf-8?B?ZjVuR0ZoTkZLOTZEUnBjY0pYV2g1THdwcTNzbzNHZTF5OFRnUUpJdWY2bnYw?=
 =?utf-8?Q?zGW6F19UDWYT6/yJG8jzChyXnvQW5PzrKqgGDjIB8Crf?=
Content-ID: <2C395380C56B2A45A8F7FBB2C8988710@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9404.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 796a1a89-e520-4f86-d70e-08de25ae000d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2025 07:50:38.8311
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t5Gy7O4RxrKpZb2fyfZ+1oNjtWN5LD/+hPndVU8sTDfCrdR8iYUc3aGyJp5l1buwk9+Bpsa4vdew9Y3Qb9KOVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_235044_087197_BA3C91A7 
X-CRM114-Status: GOOD (  22.87  )
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

On 11/13/25 22:26, Christoph Hellwig wrote:
> Allow the file system to explicitly implement lazytime syncing instead
> of pigging back on generic inode dirtying.  This allows to simplify
> the XFS implementation and prepares for non-blocking lazytime timestamp
> updates.
>
> Signed-off-by: Christoph Hellwig<hch@lst.de>
> ---
>   Documentation/filesystems/locking.rst |  2 ++
>   Documentation/filesystems/vfs.rst     |  6 ++++++
>   fs/fs-writeback.c                     | 13 +++++++++++--
>   include/linux/fs.h                    |  1 +
>   4 files changed, 20 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/filesystems/locking.rst b/Documentation/filesystems/locking.rst
> index 77704fde9845..9b2f14ada8cd 100644
> --- a/Documentation/filesystems/locking.rst
> +++ b/Documentation/filesystems/locking.rst
> @@ -81,6 +81,7 @@ prototypes::
>   	ssize_t (*listxattr) (struct dentry *, char *, size_t);
>   	int (*fiemap)(struct inode *, struct fiemap_extent_info *, u64 start, u64 len);
>   	void (*update_time)(struct inode *, struct timespec *, int);
> +	void (*sync_lazytime)(struct inode *inode);
>   	int (*atomic_open)(struct inode *, struct dentry *,
>   				struct file *, unsigned open_flag,
>   				umode_t create_mode);
> @@ -117,6 +118,7 @@ getattr:	no
>   listxattr:	no
>   fiemap:		no
>   update_time:	no
> +sync_lazytime:	no
>   atomic_open:	shared (exclusive if O_CREAT is set in open flags)
>   tmpfile:	no
>   fileattr_get:	no or exclusive
> diff --git a/Documentation/filesystems/vfs.rst b/Documentation/filesystems/vfs.rst
> index 4f13b01e42eb..ff59760daae2 100644
> --- a/Documentation/filesystems/vfs.rst
> +++ b/Documentation/filesystems/vfs.rst
> @@ -486,6 +486,7 @@ As of kernel 2.6.22, the following members are defined:
>   		int (*getattr) (struct mnt_idmap *, const struct path *, struct kstat *, u32, unsigned int);
>   		ssize_t (*listxattr) (struct dentry *, char *, size_t);
>   		void (*update_time)(struct inode *, struct timespec *, int);
> +		void (*sync_lazytime)(struct inode *inode);
>   		int (*atomic_open)(struct inode *, struct dentry *, struct file *,
>   				   unsigned open_flag, umode_t create_mode);
>   		int (*tmpfile) (struct mnt_idmap *, struct inode *, struct file *, umode_t);
> @@ -642,6 +643,11 @@ otherwise noted.
>   	an inode.  If this is not defined the VFS will update the inode
>   	itself and call mark_inode_dirty_sync.
>   
> +``sync_lazytime``:
> +	called by the writeback code to update the lazy time stamps to
> +	regular time stamp updates that get syncing into the on-disk
> +	inode.
> +
>   ``atomic_open``
>   	called on the last component of an open.  Using this optional
>   	method the filesystem can look up, possibly create and open the
> diff --git a/fs/fs-writeback.c b/fs/fs-writeback.c
> index ae6d1f1ccc71..7245f547416f 100644
> --- a/fs/fs-writeback.c
> +++ b/fs/fs-writeback.c
> @@ -1699,7 +1699,10 @@ bool sync_lazytime(struct inode *inode)
>   		return false;
>   
>   	trace_writeback_lazytime(inode);
> -	mark_inode_dirty_sync(inode);
> +	if (inode->i_op->sync_lazytime)
> +		inode->i_op->sync_lazytime(inode);
> +	else
> +		mark_inode_dirty_sync(inode);
>   	return false;
>   }
>   
> @@ -2547,6 +2550,8 @@ void __mark_inode_dirty(struct inode *inode, int flags)
>   	trace_writeback_mark_inode_dirty(inode, flags);
>   
>   	if (flags & I_DIRTY_INODE) {
> +		bool was_dirty_time = true;
> +
>   		/*
>   		 * Inode timestamp update will piggback on this dirtying.
>   		 * We tell ->dirty_inode callback that timestamps need to
> @@ -2557,6 +2562,7 @@ void __mark_inode_dirty(struct inode *inode, int flags)
>   			if (inode->i_state & I_DIRTY_TIME) {
>   				inode->i_state &= ~I_DIRTY_TIME;
>   				flags |= I_DIRTY_TIME;
> +				was_dirty_time = true;
>   			}
>   			spin_unlock(&inode->i_lock);
>   		}

was_dirty_time is initialized it to true and above true again,
perhaps it should be initialized it to false, so it will be only set to
true when inode->i_state &= I_DIRTY_TIME; ?

if was_dirty_time always set to true at the time of initialization then
below check will always call as long as callback is set
inode->i_op->sync_lazytime(), irrespective of
inode->i_state &= I_DIRTY_TIME; assignment.


-ck


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
