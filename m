Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99554C55182
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Aug 2026 18:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	From:To:Cc:Subject:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Uti9g/JKH1s8JJUk0T689QfUny5q12WucHT+5bDxP4=; b=jCkRHhzoyNQT6j
	zc8d9gCF9mnroCApZpF5Se2eTKlwCZ1gTlgin5yOZYo6N3YoOZP59QR3/qKdbYskTI120P2uhzU5N
	SmjtAsM1A6Sies8S+LPHx0r6NlgSP3S+2Dn/V31zxECN02lbFlWXbIVWb64kMOpZanfbk6+N7+xP6
	VtRvgwzLL1yw4W/EjuQ9sDVOB3gQycJdmhgA0CELF21d2Ncq8c5XTR3NKQ7H813qIYgnrH4EsFpLG
	kSI+JV07RuDGvjs0kDH4iSZju8mz5gYXNWICB/oDlvh81LodyNAMmpQcHaxOaZa7dlMgx+hI7NoEO
	y1RTiFTlJTn7vbicCFkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqxAO-00000000LoA-27W4;
	Mon, 03 Aug 2026 18:13:36 +0000
Received: from mail-westus3azlp170100009.outbound.protection.outlook.com ([2a01:111:f403:c107::9] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqxAM-00000000LmL-0n49;
	Mon, 03 Aug 2026 18:13:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WD6ZOUp+WnBpKUL/Z/T7kHJS3gdbMiHPaDWLnG+FW2Ughc5kivpbHAl9m7v4kZtUlwne3dtTcxUKM7WrJyBjIzNunVwJE8YCw5xf460FYDTOx6lI06pdu9THT47XqNLtDLCdzux8qTLf/nbRDsOOv/8gNbNU4E2T2QAuULs2fA5qQHbM4xHgZv2o0OOWsIgB9IrcShazm0DicLCB2r0EQKH4D6YFHM6X6V09ySI5OEc6n7D3GLeeZQVOXqxWW+VbyMV7HL3rN70ZTujV0k0q4aAXFKUkqMGPn1t6bGDJN5lRp550zxCce4yQxpsqpaiJjD8UiJnfV95Vbq8C+ISS6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eRjbsBRIUTAFpugKKLOjSbZ6YnFTaZPMTTSy9l9apTE=;
 b=axI4QwD0gDNm37sbZwPepJqFwCIiAQLsRb16JqMJC18kzIbTrEGCymZhb+s+VT3do6EhX/NunZoNzoqNMzdrVPiKGAHzZxXxgE3R9xuo+1Gti7a03F9fRjGK5P50Lt8AxaBXztxd5r9zFCY/UqUcakRm4oUcNJdIAnG/3xc01xoOvlR1WiMD7tpFinSy/n/j8hqvWefCeMnzCgHYzYcPJ8uU/jJoPnMGHd/+YZPkn0JJ2U3O95hflOwGfyepG+2jZsgsMfbSa132CavPOtTL6zLMDpd6I+fzR/hlKcTK94MwK5Xl/bUCYD9mr9kjrEYXGsa4Ph7cigPFSjEaaRhp/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eRjbsBRIUTAFpugKKLOjSbZ6YnFTaZPMTTSy9l9apTE=;
 b=gxRy5BNSr6u+YqAfadGamez0ES69ulGmVjdQ7wL80choytSsnxQAlwikJcKnY7d7Uw564V87JyMSSqEMqm6I3eyQ8hHwQgGFREoi4hLHlGzS9JCT9FEDSrgt5yoHWS9vKZEID6DWzvgO/uM68mWZ19n7kvMB+gzmij0pdwS5RPmRbSJIRi0JMJdUya8s9PYMz1a0gliFwwRvb7ymFruUVGm7IrQhIxbKxZt2k3pI13FRQ2A68aYiDbfeVVWpfh3Mmt76rm/50mIM4i03A/9AFOI/h98bANBM9Ic5xWGJvoXq7pwmi/JlRG0WcTtM7QctGHIP3ZNoYVG8sNcqXB0SMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by PH7PR12MB6935.namprd12.prod.outlook.com (2603:10b6:510:1b9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 18:13:18 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0270.017; Mon, 3 Aug 2026
 18:13:18 +0000
Date: Mon, 03 Aug 2026 14:13:13 -0400
Message-Id: <DKFIGJBRSDB1.O204NIB7HZMR@nvidia.com>
Subject: Re: [PATCH RFC 00/14] Remove PG_private by using
 page/folio->private checks instead
Cc: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, "Minchan Kim"
 <minchan@kernel.org>, "Sergey Senozhatsky" <senozhatsky@chromium.org>,
 "Peter Zijlstra" <peterz@infradead.org>, "Ingo Molnar" <mingo@redhat.com>,
 "Arnaldo Carvalho de Melo" <acme@kernel.org>, "Namhyung Kim"
 <namhyung@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>, "Borislav
 Petkov" <bp@alien8.de>, "Dave Hansen" <dave.hansen@linux.intel.com>,
 <x86@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>, "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>, "Jiri Olsa"
 <jolsa@kernel.org>, "Ian Rogers" <irogers@google.com>, "Adrian Hunter"
 <adrian.hunter@intel.com>, "James Clark" <james.clark@linaro.org>, "H.
 Peter Anvin" <hpa@zytor.com>, <linux-perf-users@vger.kernel.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, "Oleksandr Tyshchenko"
 <oleksandr_tyshchenko@epam.com>, <xen-devel@lists.xenproject.org>, "Eric
 Biggers" <ebiggers@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>,
 "Jaegeuk Kim" <jaegeuk@kernel.org>, <linux-fscrypt@vger.kernel.org>, "Oscar
 Salvador" <osalvador@suse.de>, "Chao Yu" <chao@kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, "Gao Xiang" <xiang@kernel.org>,
 "Jan Kara" <jack@suse.cz>, "Yue Hu" <zbestahu@gmail.com>, "Jeffle Xu"
 <jefflexu@linux.alibaba.com>, "Sandeep Dhavale" <dhavale@google.com>,
 "Hongbo Li" <hongbohbli@tencent.com>, "Chunhai Guo" <guochunhai@vivo.com>,
 <linux-erofs@lists.ozlabs.org>, <linux-fsdevel@vger.kernel.org>, "Steven
 Rostedt" <rostedt@goodmis.org>, "Masami Hiramatsu" <mhiramat@kernel.org>,
 "Mathieu Desnoyers" <mathieu.desnoyers@efficios.com>, "Matthew Brost"
 <matthew.brost@intel.com>, "Joshua Hahn" <joshua.hahnjy@gmail.com>, "Rakie
 Kim" <rakie.kim@sk.com>, "Byungchul Park" <byungchul@sk.com>, "Axel
 Rasmussen" <axelrasmussen@google.com>, "Yuanchu Xie" <yuanchu@google.com>,
 "Wei Xu" <weixugc@google.com>, <linux-trace-kernel@vger.kernel.org>, "Trond
 Myklebust" <trondmy@kernel.org>, "Anna Schumaker" <anna@kernel.org>,
 <linux-nfs@vger.kernel.org>, "Song Liu" <song@kernel.org>, "Yu Kuai"
 <yukuai@fygo.io>, "Ilya Dryomov" <idryomov@gmail.com>, "Alex Markuze"
 <amarkuze@redhat.com>, "Viacheslav Dubeyko" <slava@dubeyko.com>, "Li Nan"
 <magiclinan@didiglobal.com>, "Xiao Ni" <xiao@kernel.org>,
 <linux-raid@vger.kernel.org>, <ceph-devel@vger.kernel.org>, "Richard
 Weinberger" <richard@nod.at>, "Zhihao Cheng" <chengzhihao1@huawei.com>,
 <linux-mtd@lists.infradead.org>, "Baoquan He" <baoquan.he@linux.dev>,
 "Pasha Tatashin" <pasha.tatashin@soleen.com>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>, "Dave Young"
 <ruirui.yang@linux.dev>, "Shuah Khan" <skhan@linuxfoundation.org>,
 <kexec@lists.infradead.org>, <linux-doc@vger.kernel.org>
To: =?utf-8?q?J=C3=BCrgen_Gro=C3=9F?= <jgross@suse.com>, "David Hildenbrand"
 <david@kernel.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 "Andrew Morton" <akpm@linux-foundation.org>, "Muchun Song"
 <muchun.song@linux.dev>, "Lorenzo Stoakes" <ljs@kernel.org>, "Liam R.
 Howlett" <liam@infradead.org>, "Vlastimil Babka" <vbabka@kernel.org>, "Mike
 Rapoport" <rppt@kernel.org>, "Suren Baghdasaryan" <surenb@google.com>,
 "Michal Hocko" <mhocko@suse.com>, "Baolin Wang"
 <baolin.wang@linux.alibaba.com>, "Nico Pache" <nico.pache@linux.dev>, "Ryan
 Roberts" <ryan.roberts@arm.com>, "Dev Jain" <dev.jain@arm.com>, "Barry
 Song" <baohua@kernel.org>, "Lance Yang" <lance.yang@linux.dev>, "Usama
 Arif" <usama.arif@linux.dev>, "Gregory Price" <gourry@gourry.net>, "Ying
 Huang" <ying.huang@linux.alibaba.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Johannes Weiner" <hannes@cmpxchg.org>, "Qi Zheng"
 <qi.zheng@linux.dev>, "Shakeel Butt" <shakeel.butt@linux.dev>, "Kairui
 Song" <kasong@tencent.com>
From: "Zi Yan" <ziy@nvidia.com>
X-Mailer: aerc 0.21.0
References: <20260731-remove-pg_private-v1-0-142c97ba3562@nvidia.com>
 <5ca4d0e4-1747-45a7-a916-a7516bb1692b@suse.com>
In-Reply-To: <5ca4d0e4-1747-45a7-a916-a7516bb1692b@suse.com>
X-ClientProxiedBy: BN1PR13CA0008.namprd13.prod.outlook.com
 (2603:10b6:408:e2::13) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|PH7PR12MB6935:EE_
X-MS-Office365-Filtering-Correlation-Id: 22480e3c-b594-45b3-2d38-08def18ae4af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|7416014|376014|56012099006|10067099003|11063799006|4143699003|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info: FGtzsi0Ff3pxghP3lc/P1ddrXZKj3w8+yJGJxor6kKDLvhXg+qE0BqULU2Yo4OHklIfrWOBiiWaCcUZnd8ysXvfpjMQVyqBTVvH/b0Q17IDGUvQ8gt4J4mT1pT8nL+gY1FWLJGaajKiB9bLXL2OjTnlzpUnhjYKRFUTTC7RGTKyqFnabJILfF0z8AU4m783vOuMWi1tH6BS67AbjJ4dVCwGPtnKldp5SDaCm2TxXxeP2ZK6wfMDiS18Gr47k19fmlmm0ZUGj0jp67G22umHBdhIuM/sszkroYKwIza/1o1owYO9aVUG8Kv5LLxa3I2WUu8Ak6QcEoCd3A2d3jHYGJW/+RNZgWm8LAjH1uSwDiuMBOFm3gYnB13ZB1YWOVqPwQNKUBqw2XePEUHqKE4fOH9Olf52EBU/o/jip+pXcqLAnmKr38c1u8C6/5d3be9P/UcA7qVZ6LQVHh1HhK+V2a0F4TWz2ERZK7VcaT0nO+9jiux83RgoLv9ibtvBSCrNZX0SkURZ0XZaQ0oYH8g5uGiBx9GzWnhS4/uZIqjBS3kSthtIogVRo5UtaDQmHcm2QBw0H8x81CRrgqFRLK1h46fKWbpTQB7QQyeITnN19I+9mhcOVt1PKHVji0hhO+J6TgRKcsFzS5/DlUr/Fqyiazhpd1b+TgYpo1iieuX06GMveH1pyl1ECk5P3tuqWv1WNYZcGmnoPQLT79hKI5uGaSg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(7416014)(376014)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXNoMVUva1pWRkd1aHNpSk54cGxMMXZJTnFmUUFPbkhLbnlRdVFGRC9Ueks3?=
 =?utf-8?B?aUZnZGZMSDNWdS96ZWJFRUNiQzRtejhxdjRJKzRyaGxHUVcwMy82UDRMWUhm?=
 =?utf-8?B?Q1VCeGJNT1YrbjFDa3pMRFp3WE9VekNKMG5TbXBaejhIK05pbXZwcEVjZjdr?=
 =?utf-8?B?TlRyV2JuRFZ6QVlaSm9iRWlPUjBTN1ZsTkwrcVcvdURjSXFlcXVHdm5rYVBy?=
 =?utf-8?B?cTYxazVUcVFFR3NvZU5jQUdjUEhHWVoyQzFvUTRUZDZJdjhRL0hPQ0llVnoy?=
 =?utf-8?B?ZXRCMzBQbWNteVRPemNMQ3hyTDNzN3UxU3ZkM3h3Rk9BQ1N3TTl1Zzl3NzE5?=
 =?utf-8?B?SHNIcDZ2S0RVRzNjVENoUVdWZzVXUDJpNzRockZoZjhzT1ROWXhxQjJtc0Nj?=
 =?utf-8?B?QTRHTTh4a1E5eGJuMWpwLzY3cko0bSs2WUlTQklTekE1Tm9qRVA3dFRmbmRS?=
 =?utf-8?B?d1Z1eUtZNmJ6aWlJbDBGNVVOb0JNMXdqbEg5eVZlYmJyakxzenB6cEt1OVA5?=
 =?utf-8?B?SFVBYTllZkhOQXlwU3JZend2NjNLVGxVWmt6b3FlandDdHJrZ3R1Y3N4RVNt?=
 =?utf-8?B?MHdCTmpsNTc3b3lLYnkySXlhZDVaQVZZQmZFTElscUdhakFGd2xibS9NajVV?=
 =?utf-8?B?TmxCYzk2bmIwLzZXWnF6NFhsMUFHTUZMMGN0R25vaFllczhkVXFaSVdtZyt3?=
 =?utf-8?B?MlJ4NXA4VFVaWUw5c1FvMXg0UWdLUkxKUk8vMWlBeUJ1M2k2NjlFcGc2RDc3?=
 =?utf-8?B?aGk1em1DbnFlSUN4b3Z0S2p0UlQ2dEdhRXJaZ0FhLzVkN2MxQS9tekRKS1ZR?=
 =?utf-8?B?Vy9tRkpMWmdaZ3hUcGtDL2lPTHN5YUFpa1JJY0N1Q2RCWVUvSXlCRFJpOEEy?=
 =?utf-8?B?YVFkb1RHaVVCcm9oNU1wTmp0ZHZDazQ3QkRoTDRwR2gvT1gwUW1VUzd1MTR3?=
 =?utf-8?B?dHBzZXdWOTkrck81QXRjUDVHOFo2ZUUvazRpc0xYSDd3MUg3V1FGZjV6dVA2?=
 =?utf-8?B?VlhRUHRaOGJ5SnlTT1d6WUV2TG5VdHA2R296TW5KZ2pnWGtxbFpqSTZDeC9p?=
 =?utf-8?B?TDE4TFRzMkwrMmhrR2h6dTZwb3hXYkxTMkl0Z0dtRmE1RFNtZDZ3eHpGdDVG?=
 =?utf-8?B?N1Q1SWRvQlZEQzhlUHhzSFMvc3JkaVliZG5OZlZySGkrYXl2UVlJZENtR2NX?=
 =?utf-8?B?dUc1cWNRYjhidlNzN0VOTFBwYUpwMytFRmJQejc4MXUxNnNWaTA0MytrYm1W?=
 =?utf-8?B?U0NCM0gxSlNZd0tiTnJoeTIzZGlxYmdVajdqeTFOYVdKcEYxQXhqdU9aVVVK?=
 =?utf-8?B?NDM0U0xSaTdBT3NrTWpxdTFldTdJblVLbGFvanBSTW92cVhBYmhINnFlNDY2?=
 =?utf-8?B?WWRPSGIrVUh6Mm5sY1RBS2huYkwxZlJnMkNmQ3pFUitwYUg5K2drOGhMZEJH?=
 =?utf-8?B?VFpldlFLdzN3NXJYNDVWa0hSaGxiaHpQWjJlTFcwNTVxbG1uWXdlcm1HS3dj?=
 =?utf-8?B?RXhNdkRSTGNxdUVhSENVeHB4eGZZeWFRbnZFczdZbFNNMkl6b3pjT2tiK01u?=
 =?utf-8?B?TGtwQXlxN3lIWitmTUpiL3Vyckw5cHdHQTZwT3NrR0t5ZEYxRERQZVZqd0hX?=
 =?utf-8?B?MlFiUTFCNkJ1UTJPTTl5MEkrS1d3U2hTQnN0TExUdUxodVVvelJ2VFFDb1ZH?=
 =?utf-8?B?cEJ2YnhIZGtRSVVSZjRoWFU3V1o3NytYOW5COXJ2dVR2aUNQMmVoaHg4ZEFy?=
 =?utf-8?B?TDhGTXpYUEZTVUM3dHA4SzhKYjR0ZVVVbEROa3BrR3VHYmRVRlVHYS9yU0xl?=
 =?utf-8?B?dzc5bUlPWjM2R0Yvdm4rc0xLRnZZd3hYbnFDVG9BeEN6b2dqa3dQVDlHV3g1?=
 =?utf-8?B?dTBhWGpyVStjODlOYmJlUkJjVVM3WS8yaUtpaGhDN2M5UjhlR01qZGdVdmRZ?=
 =?utf-8?B?RHVuZHB2K2FFQ0tPSXFLdW10cVZsQ3ljSGNIbm9GaGlzb0lETi9WcmZ0ZHZC?=
 =?utf-8?B?cGJpQnpFUmpLc3UrRDNMVi9kaHloUUVhdjhTb2I5dUNWVFc3MlZkbmk0Z012?=
 =?utf-8?B?MmtxVUJOSnRBTElMVGNQeUJaOXhDbGNrSElrdFQ5VnAycDRrS1c5QVZ3VXF2?=
 =?utf-8?B?NGd2TXhnK25kNFhtdUwzU3RoWE1BaHpnNzYwVW9nek93dXJNaHhNMEo1QlFz?=
 =?utf-8?B?Q3haWDFpZkhkL0FXRlpsQzFLUzZiSHRYYTlvUWRXbmRVY0tpRDFORG9CaDBj?=
 =?utf-8?B?OE9CVlZrcFRhWDhTQlZ6c0Fnc3BRdmRZeHZQcWhDbFJaZlFrcUxFZTRtVVJl?=
 =?utf-8?Q?vOMDLuS+uZ6B+uZb7U?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22480e3c-b594-45b3-2d38-08def18ae4af
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 18:13:17.9727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P4jLnqIwTNmEW1LtTpM+2MhjKsFG8QpvIYdQ6DM5UZU3RRUlEMTS746tqky9GXuA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6935
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_111334_227405_CEEA6D45 
X-CRM114-Status: GOOD (  10.58  )
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

T24gTW9uIEF1ZyAzLCAyMDI2IGF0IDU6MDcgQU0gRURULCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+
IE9uIDAxLjA4LjI2IDA0OjEzLCBaaSBZYW4gd3JvdGU6Cj4+IEhpIGFsbCwKPj4gCj4+IFRoaXMg
cGF0Y2hzZXQgcmVtb3ZlcyBQR19wcml2YXRlIHRvIG1ha2Ugc3BhY2UgZm9yIHVwY29taW5nIFBH
X2ZvbGlvCj4+IChyZXNlcnZlZCBhcyBfX1BHX2ZvbGlvKSBmb3IgaWRlbnRpZnlpbmcgcGFnZXMg
ZnJvbSBhIGZvbGlvIChtb3JlIGRldGFpbHMKPj4gaW4gTm90ZSBiZWxvdykuIEluc3RlYWQgb2Yg
Y2hlY2tpbmcgUEdfcHJpdmF0ZSwgYWxsIGNvZGUgaXMgY2hhbmdlZCB0bwo+PiBjaGVjayBwYWdl
L2ZvbGlvLT5wcml2YXRlICE9IE5VTEwgaW5zdGVhZC4KPgo+IEknbSBhIGxpdHRsZSBiaXQgd29y
cmllZCB0aGF0IHBhZ2UvZm9saW8tPnByaXZhdGUgaXMgaW4gYSB1bmlvbiwgc28gdG9kYXkKPiBp
dCBjb3VsZCAoaW4gdGhlb3J5KSBiZSAhPSBOVUxMIHdoaWxlIFBHX3ByaXZhdGUgaXNuJ3Qgc2V0
Lgo+Cj4gSXMgaXQgcmVhbGx5IG5vdCBwb3NzaWJsZSB0byBlbnRlciBhIHBhdGggd2hlcmUgUEdf
cHJpdmF0ZSBpcyB0ZXN0ZWQgd2hpbGUKPiBwYWdlL2ZvbGlvLT5wcml2YXRlICE9IE5VTEwgZHVl
IHRvIHRoZSB1bmlvbiBiZWluZyB1c2VkIG90aGVyd2lzZSAoUEdfcHJpdmF0ZQo+IG5vdCBzZXQp
PwoKWWVzLCBpdCBpcyBwb3NzaWJsZS4gU2VlOiAjNSBpbiB0aGUgZXhjZXB0aW9uYWwgdXNlcnM6
IGVyb2ZzIHVzZXMKLT5wcml2YXRlIGZvciByZXZlcnNlIGxpbmtlZCBsaXN0IGFuZCBpbi1mbGln
aHQgY291bnRlcnMgd2l0aG91dCBzZXR0aW5nClBHX3ByaXZhdGUuIEkgZ2V0IHJpZCBvZiB0aGUg
Zmlyc3Qgb25lIGFuZCBjb252ZXJ0ZWQgdGhlIHNlY29uZCBvbmUgdG8KdXNlIGZvbGlvX2F0dGFj
aC9kZXRhY2gvZ2V0X3ByaXZhdGUoKSB0byBmb2xsb3cgdGhlIGdlbmVyYWwgLT5wcml2YXRlCnVz
ZSBwYXR0ZXJuLi4KCkZvciBub24gZmlsZSBzeXN0ZW0gZm9saW9zLCBhbm9uIHN3YXBjYWNoZSBw
dXRzIHN3YXBfZW50cnlfdCBpbgotPnByaXZhdGUgYW5kIGh1Z2V0bGIgcHV0cyBpdHMgZmxhZ3Mg
aW4gLT5wcml2YXRlLiBJIGFkZGVkCmZvbGlvX3Rlc3RfZnNfcHJpdmF0ZSgpIHRvIGV4Y2x1ZGUg
dGhlbSwgYnV0IHRoaXMgaGVscGVyIGlzIHBsYW5uZWQgdG8KYmUgdXNlZCBieSBjb3JlIE1NLCBz
aW5jZSBmaWxlc3lzdGVtIGNvZGUgc2hvdWxkIG5vdCBlbmNvdW50ZXIgdGhlc2UKdHdvLgoKCi0t
IApCZXN0IFJlZ2FyZHMsCllhbiwgWmkKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
