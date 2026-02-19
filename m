Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74346E9A04C
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Feb 2026 08:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hHrHtLNFf6EofzvOmtvajIz0XznTkkbORcaTSI3iDyo=; b=VeGJiic0S5HCgX
	jrvwS2oE+RbiDZ22OnPfz3x0Mq3goY7X4lwFZPkeJwqGFGq++58L0GiumnzviBtX/HWWbJyHvupaJ
	ieeHe0tRppNO+MEq+vFmn2zviB5yZAJLLKwuwoL6734+yfQ37qopbiO6n1j8vqVJoXopCff5/npYu
	AmEZMDGD42nweJaEMQ5Jwq0SyhJAd31zcTyHHyH6nC7q0j9+0PJzc+4q7wptyXdi5xswV8Adu8HSX
	FZsUR/FN4A3mPVL5okp7BNgxpf7LmihFUOCclNIFohcWwlOZemyupPdNcjJvnfggLIEbAlcC1ZwJd
	8COgajvtwFw0ZhXKQDWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vszsW-0000000B957-3WOp;
	Thu, 19 Feb 2026 08:59:20 +0000
Received: from pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.246.77.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vszsU-0000000B94f-0Rjs
	for linux-mtd@lists.infradead.org;
	Thu, 19 Feb 2026 08:59:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1771491558; x=1803027558;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=2oedwSUUDaA/bqXznA8ra9eBBBZdlC12zqr+4gh0Atc=;
  b=mSmITfhowXLHKU0HcehXPpxlrgkM87HapvJ/shOL+K8wxRaQa7Qj+KvO
   Cqh1904lKNBJrOqaMAtsR3N12BElzm0fpl5XdJ7KKBxhR5YLklQ4j/c2F
   Creo7Le6VniYk1EDuBnA3z3HxdQy7sfI7ZYy4ouPVHx4WmaacbZ7f1BU8
   5zyRr72Ykdu0Dv5P0A7cWQ5Kd/yC0K/f3ZmrYFdLrRSNVT5M/+3NzKojw
   9b48yxRdVbEEGXfYnxAg+f4uc8IOLTEcb4WQftu1ww1jl7kQfryTxN1p9
   ZhHfl2Cf4ZdJmVGeiLf9dUdvAj4PzY48Bf2CvIkUFmJZSBArnOphzGlyw
   w==;
X-CSE-ConnectionGUID: /Hq6YxpRQ+GugK0bFXxEPA==
X-CSE-MsgGUID: ru8/fHYORjaEq9t8M4C0CA==
X-IronPort-AV: E=Sophos;i="6.21,299,1763424000"; 
   d="scan'208";a="13343137"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 08:59:12 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:20880]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.39.194:2525] with esmtp (Farcaster)
 id b4456562-e305-4bcc-804f-97b34995db4e; Thu, 19 Feb 2026 08:59:11 +0000 (UTC)
X-Farcaster-Flow-ID: b4456562-e305-4bcc-804f-97b34995db4e
Received: from EX19EXOUWB001.ant.amazon.com (10.250.64.229) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 19 Feb 2026 08:59:09 +0000
Received: from EX19EXOUWA002.ant.amazon.com (10.250.64.216) by
 EX19EXOUWB001.ant.amazon.com (10.250.64.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 19 Feb 2026 08:59:09 +0000
Received: from PH0PR07CU006.outbound.protection.outlook.com (10.250.64.168) by
 EX19EXOUWA002.ant.amazon.com (10.250.64.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35
 via Frontend Transport; Thu, 19 Feb 2026 08:59:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bebn4uOrd/6doNAE+Oi27JtSt60ifJDpV6LFyh+IxL91o1TvEQZo23GqgmVdHfOgHSwu8Wx6G5Cg+KHgZNAieFG556NVNMEKpV9HGsYU6n3TTnUtMAiLFtsj7EkyIxBEYfOWIwtaT7+Ql4U6o9V+H8OE9xD176djrmQVZzxhY2/qBywotNg1ukvRus7L/bTTTnytslRm8V379Uvz0MaQtvey4oYNkv+AAVaj3ID5XqbNYSjpiM6JN5/tqRXZYD8PTqTR+U7vK2OUCZo7vYTThiAv44RVmxWvkR1Kpt44CHycNMt4eRLux6vHncJVLsnSMt+weRdhuZjgZz92cJBN7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2oedwSUUDaA/bqXznA8ra9eBBBZdlC12zqr+4gh0Atc=;
 b=opevBCxq7DKgQ9Wqqz2gLp8S2T+BIIPNKKThKEJfWnGxTKlqmEQk6Dflo8G+KgwXWQjdlTf4WFWwe6KO4SVmjuhgbi9GF/W/Pw4BSbwwlqoAq8XwBANG4h8juqgCshOY8nCkCrprbmfgpzYV9IKJAyasKy70dR5cHs+DNE/+3eqIpVJw0H13Rszf78KjwWjLSL7ei48//J1ERgtgODUwnTG8iXOKKZUi7kV9HQ43V4uMQxtLNz4D5KxcmCVQoQHXUx1t/nV1WO9jak7jzRdqpvJJZY8dBlILeWC7IZfuDoNVrrVeGs8p5bvXxHQJ6LTZDLrdZ82/mGsVa3TS+wnvHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amazon.com; dmarc=pass action=none header.from=amazon.com;
 dkim=pass header.d=amazon.com; arc=none
Received: from CH0PR18MB5433.namprd18.prod.outlook.com (2603:10b6:610:181::16)
 by PH7PR18MB5203.namprd18.prod.outlook.com (2603:10b6:510:15e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 08:59:04 +0000
Received: from CH0PR18MB5433.namprd18.prod.outlook.com
 ([fe80::db:2f3d:fbda:8905]) by CH0PR18MB5433.namprd18.prod.outlook.com
 ([fe80::db:2f3d:fbda:8905%6]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 08:59:04 +0000
From: "Farber, Eliav" <farbere@amazon.com>
To: Michael Walle <mwalle@kernel.org>, "tudor.ambarus@linaro.org"
	<tudor.ambarus@linaro.org>, "pratyush@kernel.org" <pratyush@kernel.org>,
	"miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "richard@nod.at"
	<richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 0/3] mtd: spi-nor: winbond: Fix protection handling
Thread-Topic: [PATCH v2 0/3] mtd: spi-nor: winbond: Fix protection handling
Thread-Index: AQHcoX3/TD6iBx7RC0uMoPKHqjplAQ==
Date: Thu, 19 Feb 2026 08:59:04 +0000
Message-ID: <CH0PR18MB543393010019CA8FB36025DAC66BA@CH0PR18MB5433.namprd18.prod.outlook.com>
References: <20260218143523.17467-1-farbere@amazon.com>
 <DGIRWWVSU5XE.2DMCL0H8D53MI@kernel.org>
In-Reply-To: <DGIRWWVSU5XE.2DMCL0H8D53MI@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amazon.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR18MB5433:EE_|PH7PR18MB5203:EE_
x-ms-office365-filtering-correlation-id: 4d40a19a-cebf-4042-a16d-08de6f9521cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?OC9VMWUyWkZUb3pLSDBDWVhxNmlqb25zcjhwbkJkcTBabWQwd08xOFVkNlhI?=
 =?utf-8?B?WnBVbzZrcDJOTHFRKzJ3V29GM0diV2tFRDEwSmt4SG9NcFJzS2ZSSjh3eUpF?=
 =?utf-8?B?NGFCS2hjcnRSazY1KzlNSkp0SUlnVDUxYUU1M3U3STMwbHkzZFVNWHRHbnBY?=
 =?utf-8?B?b2JlYTlmQ0dzY3oybFIxRVdVdlVJdDh1a0ZHajVwWS9SV2t2cnc2T3VMbXFM?=
 =?utf-8?B?TkQ4ejVwUVBZL3ZmRHVvTGdpWExGeUpaV0J2K3dIUGx1ZStRYUZabThNeWlJ?=
 =?utf-8?B?SU5yaTU0bG9IVkZyK1VKWXM1cGt2cFZFMTNLQktDc1poYzZtZ2hJd2NJVUpV?=
 =?utf-8?B?TDIyR0ZVV1JtNkE4Y3c4TDhGR1BURXAwRGVoLyttNXNmM2FaRkc0ODZIb1BT?=
 =?utf-8?B?M1ZENTdpM09ONTA0STBReXlMbXk0aDVYc3N5NlFteTBGdDUwVFRKUnV2bjVB?=
 =?utf-8?B?eCtBSVgrTzBreFRTN3VaVFFKMXhlNGtBbXU3S25idTRHREN1S2NjNFpWZzd6?=
 =?utf-8?B?MTRncXU1em81d2xBbVUvYUVtR3FmcHNYbjhwRFRqRGVnTUJaYXlTbnVkQmN4?=
 =?utf-8?B?ejBHd1orRE14ZTJTNytmMDN5TUNJbDE2MlFzRUVZMDc0cEZpVEhlcnBRbk84?=
 =?utf-8?B?d2E2cFErczhLR1JELzdKN1hvQ2xjQmF6TGwwM25mZ292SU5STW5mTWJvZG9k?=
 =?utf-8?B?anZCVHJLTkRpRTA0N3pFR2NIYTVoK1FVRTBoOXR0T1lpWG1NUkwvSjVjcEJj?=
 =?utf-8?B?ZmFjcU5IT3dnaGpWUk5HYUl5MXAwbExCVEVjT2JlRjE0SEJBR2MybDNFK0NM?=
 =?utf-8?B?WEQ4aGc4RFJ4Z09zVzVZQ3A5UlVmZU1wcTh4MXRiTGFpV3lyU3F6Z2RwTmV6?=
 =?utf-8?B?aDRRM2V6QVg4N3F5NHpadU9SNlNTYmg3SVdnZ21YYXlhYldFUFBhdjUxZkE4?=
 =?utf-8?B?RHk1MFpGZzF5bHpHRjBXWU1MaE9XclJhTTE2MG5EU1JBZDRVQ1ZXZU5tWUlP?=
 =?utf-8?B?QWN4OFYzOEg1N1hqL0pVdnM2WWpZektuTVBRV1h4R1BIdVREdmMydTgxUnlH?=
 =?utf-8?B?WHZ3MmNKOUdsL1NjTnFBOXFTUE96MVRDN1NyVjVNZXJIOEtaNGs2YXFvWFIz?=
 =?utf-8?B?SGxQcVoyQzJwY2c3SHdTbFNkYzRmRmR1L3QwNng2azF4cHNNRjJrbGhPaVpa?=
 =?utf-8?B?MDEySlVtVGY5ekg2R2JoUm1MZHVSNmdzY1ZoZFVYd0pTK0J1akwvZU1IcTJ2?=
 =?utf-8?B?S1lQcmhqVW5JZCtwRmFVQ0UrUS9rWDRjNVFhK1AyQXVMR1BiUEZsMUNSYnZz?=
 =?utf-8?B?a0t5Q1BadGdHcWVoL1d3eFFrWkhLM2EzbDJrK1NYYlpwSFVhTFJrQk9Bei80?=
 =?utf-8?B?ZkJidFAxbTZwNHZ0YWh0bTErdXE3dGhDZ1c5d2IyRWpVbjVwMnUvRnRRTzRa?=
 =?utf-8?B?dzFKZEZNdXRxSXR3NzNpVFQzZEZHcTRzbExxVjZGUzAxSzRlbStMMloyZ2x6?=
 =?utf-8?B?dk0wbnhDalNyVFpXYzlsZ3NzTVU1UWMwdHlUS3JadksrbFFITVlNZG1NMXVj?=
 =?utf-8?B?bU82OVNDS1g3TGlMSENWNjhVa1VidUg4TytzelNoazFKTEZhNjRwbHNzeFRz?=
 =?utf-8?B?cXhFNUpYYzhCNCtFSHl2YzA1QXhaQWhXdk9NUE13akpHbER3aVdPQnNYUkdS?=
 =?utf-8?B?anZsb2c0U3hGVjhzWFB6TVlTd2lISXMvZXNQOCtwR1VzTUxKcFZwVDl1MUxu?=
 =?utf-8?B?M0UxYUlaMmdjWnQ5ZVJ4bFFFSVNuQXpnd0U2QVVXbDMwd2dnWE5hWG5zOURj?=
 =?utf-8?B?NGxkYTV0a3RYQVRMZ2RlRjJ3bHVKVXFYNnZPckFEbTR3cWhyZmN2eEFydG1K?=
 =?utf-8?B?NGJyWVE5ZGVFZkVhZWY4VHEwZHR3L1hLSnpZYmNMNW1YZVpLZE4yb3piZ24v?=
 =?utf-8?B?NnFZODdlR2tNVERPL2ZRY2lyV0lKMHk2WU5YdFI3OEl5SmFveG9yMmVBSzRk?=
 =?utf-8?B?b1ZBVTBIS0krVmYvUVRmNmRLUXVobGNXVFFWK3lqUFBCaVNQRi9VMkYvT0Qr?=
 =?utf-8?B?Y01ubkdIQ2gxTGgyb1pnM2RoUXFCa09IK2pETkJ3bm0wOVJCL3hwRGhMS0FB?=
 =?utf-8?B?c1BrSUdVeXJ2RmpaL2xCUlNyRXRPcXA0aEJKNW9nNi9hYVZXQW5CQzZub1Ro?=
 =?utf-8?Q?qfn4sCK+qiidVNNH7J/LYFU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR18MB5433.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OUhmbW0zMndLcnMxemp3UU9xOGNVSXFKeG1jTENzRkx4MkQxYjJWRnd6M1hI?=
 =?utf-8?B?MGVzbEhLOEczbFhYNTViS015dUg0VU92U2NxS3dZRFA2LzcyUHZwOEY4Ti9E?=
 =?utf-8?B?b28xMmNIVndsWGFFU1BSUlhxWnlSSVBoSXVqSmdnNUYwRGFmM2lYRitoQ0hD?=
 =?utf-8?B?c3JNYkMvWDFtR2VOMlVoTjByakVVVUtqVUF4R3EwM0xSUUNHMG05T3JRc2JP?=
 =?utf-8?B?b1ZSYit4ejZJckZibmpIanpoK1RoRm5kZXhQNlY5SGova3hVYk14bi9jOGg0?=
 =?utf-8?B?b0c0bWE5WHVWNThua1NGM1lCRHFTNFlwSVYvdzVRdUtEWEhLS1hCaElMU1J5?=
 =?utf-8?B?T2NzV0t5ZnUvUnp0RVBjbHJiK2RpdHMrK0F0K3lnOGVPMFEycXl5MXorV24w?=
 =?utf-8?B?NG5uSXd0enFvVUUvNlgvbG5icGtjNGtHNjNxb2UyS1c5TGdKYXVWKzg0QnhZ?=
 =?utf-8?B?QlY5OExzSHF3NVM3MnoweGdGTFA4WTlFajIxcUdhQTBsa0VhbjNxTHJmYTRQ?=
 =?utf-8?B?V3d2Rmp3L1p1bjU0WFNUMGc2RWVSWk1nM1ZCbjdJUU45STB5VnFPaUl0T0p5?=
 =?utf-8?B?UitmNUpzNVJpYWpYLzhHNDhpaEgraW5ZVVBYUmppY0tabllLQkJMNlFVMER6?=
 =?utf-8?B?THcyY2tlcmFGVkxHYW92Q3hCOWtFZVNDVGx4eWozMi9qamg4aCt6dGVFQWhE?=
 =?utf-8?B?Tm85TkF1WGNBV2xZWTRoU2RVK3BGQmJoYVRPTzNsK2prRjBiK05VN2tOdm4y?=
 =?utf-8?B?TUl6Q1FVdDE1TzM4di8vdnBVbC85QWlwNENYSjF2M1B3UXFSNUk2Tzh2d2V6?=
 =?utf-8?B?MWZ4TGxIMjYySk1oVkdrNXNOUytQbGRzQTVvL0JJTDlSZEtOYy9adHNrNnJC?=
 =?utf-8?B?VGtBOGtqc3hqNGQ4QW9vQ1JoTVlwYjlNQmUzVjNMRXNFcGJkME9ESTF4Y1Vi?=
 =?utf-8?B?YWZxQWdRamdTY2Zwc0NtZHlzMXFNT2Zka2lsY05SZWtKMWlPVUhuTXBxb0NG?=
 =?utf-8?B?TDdtbVBJMUk3L2dhdm92aFJGRHhHWjNWWEloT1VtU2FUWkJhUUJUYkxZVU91?=
 =?utf-8?B?T09xZ1hPWmp6emg0bGo4NS9RT0xQQ3N0Vzc0RXpIZlRUMkJNUk9NNXM3RUZy?=
 =?utf-8?B?akxpMlpKL3d4MkZBY0FvMy9sUTFOYmw5eDlHVDV3SytoekhPb2hteXFrd2lt?=
 =?utf-8?B?Y1c5MWhid2loZHRYNXZoYjBtU0J5Q211dDhLcU13UE5vY3oreWZ2UGdaZ0pk?=
 =?utf-8?B?WkpZN0RhcGcvWnJwVE5qd0Q5QVZHcVIyeXpWbkkvRHltcW93alZ0SnVibnVq?=
 =?utf-8?B?Z0ZMYnhWaUl3dXRjN21UaUk4ODdQZVBPaCtzWFlyL2MzZU9NYi9NNEtIcmdz?=
 =?utf-8?B?aFdSa0VpVTBQaDdRRmVBTU1KTU1sR0MwMEdtczJHU2JmdnVEWndWWTd3OWF6?=
 =?utf-8?B?Ky9BdUVJSng5YVVhWHhYNEU0cTBidk9nOVBnNjluNXhTZWhXNjZJYkJ1MkRz?=
 =?utf-8?B?WWU3eUdwRWJlK3FiMDVjNkRUZmZLQ05HWmIweDVWN2hJMlZscUZJc3ZQcEpP?=
 =?utf-8?B?MmNGTWFpZkx3QlV4Y0ZoZVdTSXRsMDJXaXBySy93aC9ia2VnM25LYW5UUUF0?=
 =?utf-8?B?RXIyY2JmVUZkaUV6K1FhelJuSWtyWEZmOUVYRVM4WnIxdm81OERTS0YyeEc2?=
 =?utf-8?B?RWptc2hSZ3Vzd1ZlSllTbkpYUEQvcHQvVTZuQ3Y1NXlDTFVvem1SR1FRd1I2?=
 =?utf-8?B?cmxOZUQ0S0lxa1pLR1NEUDU3b3NUTkF2VXFnblBFUWpWSWwrV2o4Mlhha3c1?=
 =?utf-8?B?aDNyVUJFblFSaTdFRWlSd0V2NXRFZ1Uvem5zZFZjbHh0RlJjTHdWM3JrZG9F?=
 =?utf-8?B?TlBncVBOUnVVVmRwWFY1ckMvMG8xNTZYNm4zbUl1dHBUMC9LUHdNS1puVEly?=
 =?utf-8?B?ZDhpcndESGFQb2NLbmNVT2dZYWNMMkxEak5jYnZIdFcvKys3ZkpjNU1WUGxL?=
 =?utf-8?B?dC9LMTFTcjZkL0pBZ015UHhtbU9DamIvampPNnV3TzVhREFqcFR0QUJDVmRN?=
 =?utf-8?B?c3E4MXMwUk1ka1dvRHBaVmZhMjJOeU9rWHFjVUk4U21SRzRmditIcnNDT0RV?=
 =?utf-8?B?TEFQMVZZaS9pOXRZdTJXQ0dYR1RibnRGa1g3VHFaOGZFY3dGSjBoSUY3QU9K?=
 =?utf-8?B?MTNPR3BSVmMrcStPWW44NDhIRXJLRjRvSk54a3ZqaGNmNW9QVmpaUCtxa0ZQ?=
 =?utf-8?B?NG1jWUxHZlNwZGZiTHRaZ0laajZmTWlQQUdFdG5weG1ZNjJ5NWxMb3FGYllH?=
 =?utf-8?Q?+0wgacHwOXouJ3bIuk?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR18MB5433.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d40a19a-cebf-4042-a16d-08de6f9521cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2026 08:59:04.0699
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5280104a-472d-4538-9ccf-1e1d0efe8b1b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e6kHa0vNT5ZkbE8OzEjN3fVsIP5E/GeNASSjcJvpUcPH9NzoMwEm7wFHssfcWjAb2uqoYaBZKWrXeo24Vggl1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR18MB5203
X-OriginatorOrg: amazon.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_005918_386995_A0C85F39 
X-CRM114-Status: GOOD (  10.27  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

PiA+IENoYW5nZXMgaW4gdjI6DQo+ID4gLSBSZW1vdmUgbGFzdCBwYXRjaCBpbiBzZXJpZXMgdGhh
dCBhZGRlZCBkdWFsL3F1YWQgcmVhZCBmb3IgdzI1cTY0anZtDQo+DQo+IFdoeT8gVW5mb3J0dW5h
dGVseSwgeW91IGRpZG4ndCBhbnN3ZXIgbXkgcXVlc3Rpb25zLg0KDQpUaGUgU0ZEUCBkdW1wIEkg
YWRkZWQgaW5kaWNhdGVzIHRoYXQgYm90aCBkdWFsLXJlYWQgYW5kIHF1YWQtcmVhZCBtb2Rlcw0K
YXJlIHN1cHBvcnRlZC4NCg0KPiA+IC0gQWRkZWQgTWluaW11bSB0ZXN0aW5nIHJlcXVpcmVtZW50
cyBmb3IgdzI1cTI1Nmp3bSBhbmQgdzI1cTY0anZtDQo+DQo+IFRoYW5rcywgYnV0IHdoeSB3YXMg
dGhlIHcyNXEyNTZqdyBsZWZ0IG91dD8NCg0KSSBzdGlsbCBoYXZlbuKAmXQgYmVlbiBhYmxlIHRv
IGdldCBhIGNhcmQgd2l0aCB3MjVxMjU2ancuDQpJcyBpdCBuZWVkZWQgaW4gb3JkZXIgdG8gYWRk
IHRoZSBsb2NrIGZsYWdzPw0KDQotLS0NClJlZ2FyZHMsIEVsaWF2DQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
