Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE0BCEACEF
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Nov 2025 07:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R7ERj9z9gLm79cIy9zIQf3qX4hb+ijFZy9V92CaWyZE=; b=wJxaHChekBb/6D
	hV44nzrbHy+de8U/crlWWQ7ZpxiyfFt/w8leSpmAvHftV6aYDQUvyduYdeTJ1YZ97CbsK4DJnjQE/
	ABVLrKN6f8eeifOQzY4/dnoB9sB0fInUn2tdSGhFQDWN+jIOpeb+fRVQ3dWFsKDqvTeRXmOdGapRK
	16uKMXj/wCNNzEYNahSrgFYj7GDBCzrV/osy7WLuajMJXoKL7AMJzJwekbwODxmGd5TIZBXBENYtZ
	rZyIynzOSTwxgq85A7kySm4EOzVAUg/mPNUwhNnjkLQ/MaIHpg2FL9s8Yo02xYMAeI5yFp/zFccIT
	joA/artIt8XPQvtbU73g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKtKR-0000000FZtJ-1lkV;
	Mon, 17 Nov 2025 07:07:11 +0000
Received: from mail-northcentralusazon11013019.outbound.protection.outlook.com ([40.107.201.19] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKtKP-0000000FZsY-1LsS
	for linux-mtd@lists.infradead.org;
	Mon, 17 Nov 2025 07:07:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cXyNBdOLZ751xQWFoCNIIYHn7vE9d5qUz5jqYQGB8ddyPZmAQIDOW3HeaKXET30iZUJywEAVTdzAgoh27KkqiDb88oHXiYnrvlVBxkWzkJdag/fhVsO3nh5QTMCWlTIMzuvIfE2DtSDmRgJEd0Nr6HtsIJXPDhCail/mfyyJlGWqBkaK2N/aHDV1uF1xnFkizCBz+TJg1F2lt8BaG0kLAjgciUUjYdpP5N9UZb+Z6WhHjrxhLM8wxYI+6iXtj7mXxVLWFjFL/mi+/+ecA1BIeQsXzAMx+aPr9qNy4Qkvf3bkaa1SdbuSgDB2jnxhwEYihY8zTjVEBYgEXFem0PvS+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7iUEUuYjRH49WBf7wft5xvmjeDPqLfIxCI7rIxAqMYo=;
 b=X4qH4atVhauimt1QDMPrBm9mRvgMDI9M2sks3CWBJL9qBAGN5UQiWjKrY+DoJo3DqWt19uCTtTJsQJ2SjWtIcuriE3B5C3gFykmSlb5bHTJJJYtJoC54GrRUbnxrRBL0yFfqwf9dS50dCI84D2cGMqZgEKqILKqvAjwDvQJjczfBXes1PPQE+MqlZetr+eu1b6HPCLuOjy9/wR+ufxosMgyPyxDo/w5B0K//At+T0zSuPZdM3+7V5/Gj7Nb0ZC9ftvZDtEtPop2SLsDacpDKis55UChPHjofhR93uW9+xW+caBO5HM7zORWF1TXA02JGNj0WcP92dDTGcGaVzE6udQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7iUEUuYjRH49WBf7wft5xvmjeDPqLfIxCI7rIxAqMYo=;
 b=dMBdSJSFARQoLPrbOIW0KvCK/ouJ57dRGbASiGeE63eEZnGIXzyesgjs5NH3Qw6kNih3xAaFoMFNknEHqWNw1JcRMholBEEXUpKKo/BFxGI5FEWI6WGq0ejJCxhbDD0Tx0Vo/UmjKiWwc8oUtZbSpQ3bNyU0IlCTb7zj4lXk+slYpSTtszky9Z9uUL8cUhzgnKtYv/jwYdDLvnZruzhVvBJ2yjj0C3bgWgMTcHh4cVa/hfRbiClvHx/dbxKrtQewA+hP5cxt5a2LV+Axxg1FLKVGRT0lUuCHtB5QyUiokSqL/yBQz4YUsJl6AjVuUvq7Wr88ShAhJG4uuxlT2B+MxQ==
Received: from LV3PR12MB9404.namprd12.prod.outlook.com (2603:10b6:408:219::9)
 by CH2PR12MB9495.namprd12.prod.outlook.com (2603:10b6:610:27d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Mon, 17 Nov
 2025 07:07:03 +0000
Received: from LV3PR12MB9404.namprd12.prod.outlook.com
 ([fe80::57ac:82e6:1ec5:f40b]) by LV3PR12MB9404.namprd12.prod.outlook.com
 ([fe80::57ac:82e6:1ec5:f40b%5]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 07:07:03 +0000
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
Subject: Re: [PATCH 07/14] fs: return a negative error from
 generic_update_time
Thread-Topic: [PATCH 07/14] fs: return a negative error from
 generic_update_time
Thread-Index: AQHcVTB5T4P7ugPoakCijjk0TbTVRbT2dyoA
Date: Mon, 17 Nov 2025 07:07:03 +0000
Message-ID: <6b6e9e65-9128-49e1-834f-8771e21c4231@nvidia.com>
References: <20251114062642.1524837-1-hch@lst.de>
 <20251114062642.1524837-8-hch@lst.de>
In-Reply-To: <20251114062642.1524837-8-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR12MB9404:EE_|CH2PR12MB9495:EE_
x-ms-office365-filtering-correlation-id: d40a8b12-c68e-427e-3a24-08de25a7e90e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|10070799003|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?YnNBdXpocklWRDNWQ3h0SzNKcGN0a3djaWl2RlRTbzVncFpTMTRIVWxoV3ZO?=
 =?utf-8?B?Z2ZVSWNvWEoyVm43UDZ4TWxiaXlZakNrTHF2ZjRFcGQyWS81d3VMem9aajNW?=
 =?utf-8?B?ajk3SklySWlNTkdVNFNxSHFqWElqZlFlY2psQWlnb3NScmtnSlIxb1RiZ045?=
 =?utf-8?B?RnJFbUNxVXViaU8xRWU5OU1MSlhxTEQxV1hqcGpoSlNWbDEzYTFBVTFWWk5u?=
 =?utf-8?B?azFqT0l6TjE3dFFEVCtsTTJIT3B5MXpEcVV3Y3A1YVBEdll5Z3FVbzFIR1lQ?=
 =?utf-8?B?NUJYT0J6YTd6dndNYWVGWm5IdXF4MEhuU2NKaG1tZDFRUTB2ZE9scWJDd3BR?=
 =?utf-8?B?U3Zia2hiRDJGdE96VWtWZlRSWlFheGFoNWkvN0tXWTl1bnRtVjNlU0kwUkZI?=
 =?utf-8?B?K0U3UzBZckh4S3RKMlFacWdUVHg2b0c2cVJzN2ZRdXNGSEFDalVvV1pBdmRK?=
 =?utf-8?B?QzBMNDZQc2RGd3l6ZUdJSkdRYmErUHZGY0lkNXE4b3R4KytGdEd0b1MreHdy?=
 =?utf-8?B?SWhXQ2FFNEs4ZHpDV0FIbEcrK3JQRGdwUVMrMkpEMjhrK2lYTjZwRVQ5NDFv?=
 =?utf-8?B?WEh3TXBvTXIvL01IRGJzeWNvb1psdXNlK2RjOFlsTkJrNXNxMDd2aWd6bnBs?=
 =?utf-8?B?SFdubmpSYVZ6MnV4Nmx0S0NuemRhT0lQZ0NoUVlBWU5Ma0wvWWNmL1gwRVdN?=
 =?utf-8?B?b2NVeVoxZk5BRHd3WjM2YTA1NW5idzNtcE1HcnlSMjZSWUJJOGxlTWMzaFIx?=
 =?utf-8?B?aEt3MFZYRGlTOFpZMXIrbW1JeXBzaXUvNVlMaS94dDYxSDBrOXpFdFlRWi8w?=
 =?utf-8?B?NXV5cUNDdjhIc2VQUmNYbE8vckQvM2NpTVJzTmdaZ1hldlA4bXp2U3JmTnRJ?=
 =?utf-8?B?cTV4Y25raTFBcUgydFVvKzlRc29hYXMzSDE2b1NzNmNJWW9RTzVWYTg1THVk?=
 =?utf-8?B?Y3RvVVZxU0JYLy94L0d3OTJlOW15U2tCUUl6ZWQ5bXVGejlMNUFKeTZvLzNl?=
 =?utf-8?B?WEpxdXFNOFpvUzBKUUE5citvc3A5aWZpNElzQ2lSNXMzTC9uSUUyYTFWSHcw?=
 =?utf-8?B?b3lYYXNTU3V1N1h5Q1NPNHJxbS9HWHE4YXZsOFR3RTA1dVRhZ3ZHRGZ2NTR3?=
 =?utf-8?B?enFiUVFzQXQ0K0N4TkVHKzBHQ29xdlJyaWFnVlFpMEQ2c3pEek1JdjBRc3pH?=
 =?utf-8?B?OXRHK0JjV0pVMGRTRzFxRGwxM21NeFpDQVJZNExkMkg3ODBOOWx6UklqTko2?=
 =?utf-8?B?M2tkanNQS2svd1MzMlFDMWt0eXQvNk94R1lveTkveUlxZ3BTa01ueDBxRy9I?=
 =?utf-8?B?elhxWTlqYlJ3aEpqUURrV2dGR05vdGZGS3FwZEVjVEIvcnJEeUQvQnErYlBi?=
 =?utf-8?B?VkNPZlJXNWY1L2ZsU3VmbHVtZWZVdjFpZGl6Wkt3Q0pMd0dqS0xxbDgwUjg4?=
 =?utf-8?B?emxqYS9lTlhCdjBoTFZ0MENoVzhYam9CQ05MWGVBVTNqOERRNEFKU2hPTDQ1?=
 =?utf-8?B?aWErOStmWUhSeWZRdVZhSmw4VUg5WFJaRUk5elprWjYvM3hGRzdWc2J3VnF2?=
 =?utf-8?B?SDVlTTUzNk1rajI2UFZ4VkZqcDJENjgxZ0I3RHUzbk83TUEyWGtvUHNWREZ6?=
 =?utf-8?B?ajA5TEdFam8ybGdvU25rUGl1L21lWGloVnJmcWdiUEtDZDMyR01EMGZpOWFJ?=
 =?utf-8?B?MEdLcjRyNndHUllzU0lvZGdLSHJpaVRaYmlxY3NTVkdpQXhKTDBHVWh1UGFB?=
 =?utf-8?B?QjJKb1ZWaHkyQWFHOUF3Wk9YT2RBdVlmck0zQkI5OGtJdiszQk55cmx2MHk5?=
 =?utf-8?B?UjlKdFFhWThNVmVVRkZCNzVuQUNvSElUOWUraDFFTk4vSktHUFV6a1FEZmZy?=
 =?utf-8?B?a09KaGFRcXVpRkE2NXZEdmxnUWlKWUJxQlN3VGVWVzYzYUwybmEydnZwREVt?=
 =?utf-8?B?ZVlUZVdIRmtjd1JFcUh6V0sybkxqRnVjZGhZNVY4Z3JCd1BSSFFNcFJqS2FB?=
 =?utf-8?B?NlpGUzlIeG5nUmk0Q0lDaWxLbE1teTVUT1BYZ0RQWHRkTnpVMmZsSkc5bVEv?=
 =?utf-8?Q?c+8oSk?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9404.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RlRnWVYzVTE3WnF4dGFPM2lSS05nRGFoOVlMVHBURFlzdFhjdm9RVERSWW5z?=
 =?utf-8?B?NzlaWTZjL0svQkVZYWxCTnl2ZzNocTB6dm1iL1liWjZTNHlYRTdQaS9hVjdz?=
 =?utf-8?B?R0FBV0FFdmFqTVN3UWV2aHZub2tSSmZWV2ZYT1lYV0RmNStObmZNOEcvYmIw?=
 =?utf-8?B?OU52eEVwMWg5a1YwUm5vcXpjWXhpMkl1U21xTGRjRFp3dVpDendxU2ZCVE5o?=
 =?utf-8?B?cDNsbDgyalZqamZUNVhseVlvZ0VNZUd0emhWM2Nld3ErdHhNNGxwQlI0YTFK?=
 =?utf-8?B?d3Q1QkNYUnpmOUdSMmZ5SWZwTEdabzB6S05LRDFmMTFkbDFKZnJtOFNKL3Rw?=
 =?utf-8?B?THlGWnNhOEdlKzRaeHJzM1o4NVNib1czT2R1VDdscmpHUXQ1SktiOVlsc280?=
 =?utf-8?B?RjlCYmZ2N29rWmJGUGlHNFp3TzRrUEsxbUREUVJzclBVRWZEdkM3bWVITzB1?=
 =?utf-8?B?SGt0LzhERmJZNjRRZTBBL1gzT0c2WVd5eW5mZ3l4RG9EeGFWTDJHeUFjMlRV?=
 =?utf-8?B?aHJXcm1RK2JtS0RHSk15MHhTeGNUVGtLZzBpOGd2Y1pCMnd2QWlBdHNkV3JQ?=
 =?utf-8?B?M3VvUVNnZTBBMzJwTFBBdzNReDJUQ3Y4ZlgrejJhbENlRHk3Z0VrbG1ra2M2?=
 =?utf-8?B?b2lJOEZDSjk0bHgybjQvTlYwcXRPc1FZRXo1ZGtiWndFQWs4SC92cGtkSzBw?=
 =?utf-8?B?VjlyQVhKdllPQTRkUUVDazNkZU10dFJ3ZmwxWG5QL2c2a1dpUjRYdjVRQUw1?=
 =?utf-8?B?ciswT2dOV3ZMZDRaNjVKNDkxOUhxK1dFeHRJcmhJSUFpWmdOZ25kU093ZXll?=
 =?utf-8?B?QllGbXJrK3BCYjVLYnhnN1cxUkpvT1k1TnZTWWRvU3ZUdkc3TW1heml3T0tv?=
 =?utf-8?B?bVhvTFd4TDByUE0wOHhZZnY2MS96MVlDZXpPcFFpdm03NHhzQ0hCcVpMZFl5?=
 =?utf-8?B?WVFydU84UUlZUWNlTFZhVkNrOStVSnF5RWFZQUxybk1ka0c1bHFuNW85U2cw?=
 =?utf-8?B?NWl1YlpBNk8yeHpjci9nditUWThqUzBQUkg1eXZRdmVTYmNNSUhBSFNtT0xv?=
 =?utf-8?B?dVg3TkxISEFpUXJQaE5qU2R1S2cwZElBNm5UMjNMK1pSa2lkOEhHMk9SbDdS?=
 =?utf-8?B?M01hSXo3ajlDR2lVVXltVk04WlN4SkxlV0IvaWhWK2x4M1E4cFpTVHg5Q05G?=
 =?utf-8?B?ejRxWUpoa1hQbFBJQmdyejZNMVY1NTRsQk50czZIeFV1WHpySDNoUXQvQ1N2?=
 =?utf-8?B?WWpaRE5mamJZNElMRVNVYm9wWG5XdjV2RDZtNFlRa083RFJQWC9NMFRjLzBE?=
 =?utf-8?B?dzlSdk5XOUVFdFNpVWZUekZMeUxmNGwzOWR6S3RUMnNtMFRwbUM3eXliZ3lt?=
 =?utf-8?B?ZEV4aExZTFdmQm5nbklsQmpNVnpqZjdhYUpaOSs5bjlJcXAvKy9Ob3Y1UW1h?=
 =?utf-8?B?clFpdmZoei9peTIyNGZnUXFFbEJMbFRKN0kxZWNHMFNoMm8yODVma0VZT0xm?=
 =?utf-8?B?Wmw0SVR0MG9yTEo1cEJXR2NBVXhmdTBtQ3RjdVhiRy9LVG5vRG13b1l0N2lj?=
 =?utf-8?B?WVBQM2pmNzVFWXR3dW5EWnU3QWJ1aWxMcm0wZUpSTTBBNHZkN1lvTFFIV1li?=
 =?utf-8?B?UktwcnFJcU96eUNxeXdiUmJYU3BlR1NxWDNMV2tNajN2a3dsY3NKTmxtcFR5?=
 =?utf-8?B?Sll1VUQreFppUXBqdVhWcnF4dEVSNkdBY3ZKeUFNU0RJV0dES0RwNnRaMkFE?=
 =?utf-8?B?S2M2WDhOZHcvU0YrTTV4dkhaek4xMjcwZituQndHb2hOZVU1SWdpWjBIWGdj?=
 =?utf-8?B?QXBHcVduUDQxRkI3ekwvR3Ezb05NcEtOSWZuNXBNckh4NVhkTGlNUEZRbS9Z?=
 =?utf-8?B?NWxka1ViL0RrUnI1bTRVQkhZajJ5QStnTjJ5VWRrNFpoSnNoTUJ2TDJoVUFQ?=
 =?utf-8?B?ZllsSzl5MGVNMSt1MjV5d2hsbGlIQ2FTSWN4dGtOUHRONS9DcjZLcU1TcXJC?=
 =?utf-8?B?MmVoM05INlBFQllsdHg3S2VaRFQ5SkhrbDZyS1R1ZXprMjh0dWVwVkpoRWM5?=
 =?utf-8?B?R3l5NjBHK1l6VzVYVSsyWnBPWUc4VFNGUW5BYzFqVUxWaEtBM3VCMWZXTFFw?=
 =?utf-8?B?YXdvb0hLZWYxRXJCbUgwdllySWxiU29NeHlSWFJZSkZDTXdhdzZRdkEydGs1?=
 =?utf-8?Q?8Sd6GlLAnw6VGRc/cgf7JgfxeE300JPA0At/QMJue1FG?=
Content-ID: <0C7EEE209E1A1D49B778D595F08970B2@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9404.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d40a8b12-c68e-427e-3a24-08de25a7e90e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2025 07:07:03.2285
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xhLKOY++fTT+UwAjkzOGyYuM+zw3qLyWFhzSpf+50UzhgKr5MZrVv/KPhZslFi9JZ4GD4vUvN1Px5f8OuCtfDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9495
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_230709_365517_5010BB80 
X-CRM114-Status: GOOD (  21.02  )
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
> Now that no caller looks at the updated flags, switch generic_update_time
> to the same calling convention as the ->update_time method and return 0
> or a negative errno.
>
> This prepares for adding non-blocking timestamp updates that could return
> -EAGAIN.
>
> Signed-off-by: Christoph Hellwig<hch@lst.de>
> ---
>   fs/gfs2/inode.c    | 3 +--
>   fs/inode.c         | 6 +++---
>   fs/ubifs/file.c    | 6 ++----
>   fs/xfs/xfs_iops.c  | 6 ++----
>   include/linux/fs.h | 2 +-
>   5 files changed, 9 insertions(+), 14 deletions(-)
>
> diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
> index 8a7ed80d9f2d..601c14a3ac77 100644
> --- a/fs/gfs2/inode.c
> +++ b/fs/gfs2/inode.c
> @@ -2242,8 +2242,7 @@ static int gfs2_update_time(struct inode *inode, int flags)
>   		if (error)
>   			return error;
>   	}
> -	generic_update_time(inode, flags);
> -	return 0;
> +	return generic_update_time(inode, flags);
>   }
>   
>   static const struct inode_operations gfs2_file_iops = {
> diff --git a/fs/inode.c b/fs/inode.c
> index d3edcc5baec9..74e672dd90aa 100644
> --- a/fs/inode.c
> +++ b/fs/inode.c
> @@ -2091,7 +2091,7 @@ EXPORT_SYMBOL(inode_update_timestamps);
>    * or S_VERSION need to be updated we attempt to update all three of them. S_ATIME
>    * updates can be handled done independently of the rest.
>    *
> - * Returns a S_* mask indicating which fields were updated.
> + * Returns a negative error value on error, else 0.
>    */
>   int generic_update_time(struct inode *inode, int flags)
>   {
> @@ -2103,7 +2103,7 @@ int generic_update_time(struct inode *inode, int flags)
>   	if (updated & S_VERSION)
>   		dirty_flags |= I_DIRTY_SYNC;
>   	__mark_inode_dirty(inode, dirty_flags);
> -	return updated;
> +	return 0;
>   }
>   EXPORT_SYMBOL(generic_update_time);
>   
> @@ -2335,7 +2335,7 @@ static int file_update_time_flags(struct file *file, unsigned int flags)
>   	if (inode->i_op->update_time)
>   		ret = inode->i_op->update_time(inode, sync_mode);
>   	else
> -		generic_update_time(inode, sync_mode);
> +		ret = generic_update_time(inode, sync_mode);
>   	mnt_put_write_access_file(file);
>   	return ret;
>   }

ret is assigned here ...

Looks good.

Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>

-ck


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
