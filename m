Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80EAACEACEF
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Nov 2025 06:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zAwDbGFznaamSUpOX/UYcCKoR722C6IF8gyC5nW0iQY=; b=QKsI494q6uJ5ZP
	HZ+Tyultltiv0BTLC7sH5cv7wNrd2LJJ3TJ09Xu/qVndNOHoRsLgQLtOFZdX+xbu1BmpFT+BUscUA
	qDA5qfFdhvOTz1zczQLfzW8fepmrvJqOLw6iQxHol0JOi6xNBZ1kJI5fKCwrC289Q3izJp9oGGWUS
	cOxy/3VrnG+iMNF/MYMu7TuZGaoGPxrsAAbZ2HnvQ0/yyFiJi5AIg4720iBiVn+f26G9hxCVJAf0Z
	mM0UnK5Tgd6YnpDCuPyORvfwKuwHIyFNOthJ9aWo6RBFt+FqBPGDMpea0FtudQph7B0stpuOEoIyG
	A51BZzuQcQnRGVP6q2XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKsnS-0000000FVbj-3zmS;
	Mon, 17 Nov 2025 06:33:06 +0000
Received: from mail-northcentralusazon11013019.outbound.protection.outlook.com ([40.107.201.19] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKsnQ-0000000FVam-0nvj
	for linux-mtd@lists.infradead.org;
	Mon, 17 Nov 2025 06:33:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ex82mX/omOPj/AI2QdgjdZPPg8a4a0EzjuzL6xlZgVN3Jj7ANLx+b3IHtO7sYWkTJwHLCLmBXaAzO2sEtDT7rV4u2YXr1lCCxdqLZS97B4xEDGqtkk51o0rkbxUu1VLMWLXxH+N1xT7/dnHH2lLxlRI61F/4WOLJpBk4ldA5/khPw5ujWLGTE6otly0g/zK6JE3DZcdfWgnudenqsL8dpLVKILU6mhlTX1JcSzwd42WsD7n6vpyBUOvOvdztkQMLMnXgzPZ4vf7ku4h80lDG5JCI2d26OUjLnM8N/9DSSEPmX7VOxWKKzIkZTVGn5MWth0+tvrQN5iJKcdEKEH3scw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HO2yp/rTmFtgdocDZocmkQBfL2/0tuqJF1M3z6jkoKM=;
 b=uo+WBUw5lm06UH1Gy3HKs2i5wUkNnDhi/hW9xBYm4xqHms5Oiz6TdSB8903HygpWOo0bx41FZsvTbo7HCPQJqBCIkzB1GdVKFY18f1kGtyIsPIpGwLBo7h5sbpjbyuhHS92DR8idMvtEURVS2hQL+pb0nyjCwu0m+JTonTFlsinmVyVHlruKtDcnKRrjiu1c3z5q+lyg3ZdztT+zPct4PYtS4QCMjskaPc7vDMkbSZUreM5F34jUDE15Nv2wpBOwSm8Ot0I7AP4PFlwF/DOX79zgfU8ni+fi7gdKo+GXT9U+G7oaH6HbReo6fFG5C89qsnS2bllBN7XehFXw+d+guA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HO2yp/rTmFtgdocDZocmkQBfL2/0tuqJF1M3z6jkoKM=;
 b=SghUTgu9u+SKTjzo/WTBLDsxMj2b9JGgh3ESRcj8QcnO1qa2G9ySpLM2WnWa2Wt7FX7Pi75YyBMoyD0dDkPF4o+nQDHvAWwyyn5sGHGqa3VimSYsGT11QxOZXZ2WrgIJr25E51XRIzvi6D21uR+MVqaL4X2pE4QLKiyAc8LQB9knhkitkHrbyqbBO1VHkp1+2Lk/1oGEMbz+k6zFbIBNkgOEfn8GSApRNVE226WzNjhau/gkDz3l34lJy4zNlatyjsOL/lHlma8Y2i0Ijxz9PLbxEhJaf6q6f27cDZCyTpMMLTLXYFbI1eTSFC/aDjkOhA7d8X0bb7Hpqq+FMndaXA==
Received: from LV3PR12MB9404.namprd12.prod.outlook.com (2603:10b6:408:219::9)
 by BN7PPF915F74166.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6d9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 06:32:55 +0000
Received: from LV3PR12MB9404.namprd12.prod.outlook.com
 ([fe80::57ac:82e6:1ec5:f40b]) by LV3PR12MB9404.namprd12.prod.outlook.com
 ([fe80::57ac:82e6:1ec5:f40b%5]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 06:32:55 +0000
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
Subject: Re: [PATCH 01/14] fs: refactor file timestamp update logic
Thread-Topic: [PATCH 01/14] fs: refactor file timestamp update logic
Thread-Index: AQHcVS/c80xUghid9Eqw3BgJcZs197T2baIA
Date: Mon, 17 Nov 2025 06:32:54 +0000
Message-ID: <c21a993e-7c3d-477a-a697-9ec7d51fa507@nvidia.com>
References: <20251114062642.1524837-1-hch@lst.de>
 <20251114062642.1524837-2-hch@lst.de>
In-Reply-To: <20251114062642.1524837-2-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR12MB9404:EE_|BN7PPF915F74166:EE_
x-ms-office365-filtering-correlation-id: 7f9fc457-44a6-4359-bae9-08de25a32426
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|10070799003|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?Z0JUcm12N3plM1VMbzB4VVBNSURwbjdLczRRVDFTdlYvV3VMczMwbEkraU9D?=
 =?utf-8?B?RklRZzZqZTluYzcwV09GdTJNWXRqUklqMVQvQXRwQVcxd3ZXWXhyclJRZzlE?=
 =?utf-8?B?TlFyenNtV1F4YVVzRTdUSmp4RUFDZThQVFVLbzBYTTk2R2g3eEEvaGNSemVM?=
 =?utf-8?B?NXcvYk1aN2w3RDhZQ3UraUFXbS9CZHp4eFppeXVqUmUxbHhRdDRPampLM1c4?=
 =?utf-8?B?TTQyeG50L2ljYlV1NTQ1QktXN1U3RmxrK2VUMmY3SmZzSmhFdlZ5TEo0OUsw?=
 =?utf-8?B?QnNnbHZ0S0xZdzU5YjU2Y0EyUTJkcVBma2dKSXhNSW5pYjA0cHppY25KTWlL?=
 =?utf-8?B?em45UnRJNlM3U1hyS3VScVZhRHNxT1VsY2FmbWZ3eFNySUZUVFExR3NWZGdW?=
 =?utf-8?B?b2lQMS96bUxGcGwvOGtRU3RBK2NrSjlMRUNROGdXVmswNGo0bmpqZGVVZE5Z?=
 =?utf-8?B?OExTcjdadDdPdUh3LzM4OStycTdTNW9QdmRLMlFhMG11bWdPcUFJbXBOTWp3?=
 =?utf-8?B?YVJwZjVYTmF4YmpQK29Dazl4U01QS2V4QnljeUtxV0J0dmpsT3V2N1lSbDFz?=
 =?utf-8?B?cHB3UDl1dDROODFlQVRSL1dnQXRRNjlqZkNuTGhTaEl2K20za00yZ1hPeHo3?=
 =?utf-8?B?ZUUzUCt4c3dYMmdwcVl6dFR0RTdTSTBJMzdNZ0Z5eUE2VldEaFQzNG1KNERo?=
 =?utf-8?B?REJ5czMxc01TUU9Kc0lyTFM0QXNUbTJmV1JzRkM2ZGsxT1BIZXhwU3FQdGFs?=
 =?utf-8?B?TngwNmROY3djTjQwTFhQRDZSSUluTEI4VDNBUGVra1M3WWRQLzlESHdDUUVX?=
 =?utf-8?B?T2NQcy9CSGplM1dRME9SeURKQXFjNjgxM1RGaWpESE5jc2xtejMycjB1YlJl?=
 =?utf-8?B?emNYbVJJUUtqUDg3dCs2NEFGRlNHQzJRM3NBSFFHQVFHcWRkdHNjZVZqQjRO?=
 =?utf-8?B?cW54aVZzaGpqZ0JpNDNoWWludDJXR3pHNEh1T0pkdFN2ejNUTDEzMFd4Qjd6?=
 =?utf-8?B?YmU1S1FESEV5bGpGaGNXZTRUWXJWQXFvb3c2Rk9Pbmdva2NpZ1pVU0ZJMENN?=
 =?utf-8?B?T0JqQ3pHQnp4RFZ2UFUyWmxPNzJkM2wrWTZpODRveS9KdndtRWlRQU5wQUYr?=
 =?utf-8?B?TkFZYThMMU4xSXpzL2s0aVAvcDNnWkhlTHZ4Q00rWWl0L09OMEhuN2p0M1pN?=
 =?utf-8?B?eVN1ZnRtbjFrZjhFYUZRMXRzbjdkZWROMWN6SnFPUXJSVG5JTUhYRVdRRDEw?=
 =?utf-8?B?bmxEYVQxbmR0VHJjRTlaMU1tKy9jK1haSkd2d1VGTzNXeFB3b2szb0Nkdlpi?=
 =?utf-8?B?anhDdlRwaGNmdWZqUWtOeUdsVkc3b3JQcEJCbVRGREkxei90N09ibTlDbkpU?=
 =?utf-8?B?c3IrUEp2WlMvWElwOTFFNGJHQkg3c3Q3TXE0ejNTbE9uM2JyTWVFUEZGVnBY?=
 =?utf-8?B?QmRzQlpHU21Dd2RyajhGY05PakVFNEdhenh2aCtwcE9YeDFxcllnTzZOSlpk?=
 =?utf-8?B?cjA0L1dWZXRDSU1zOG1NQzVDT3crT2U2RTI5UHl0R1BBUHBYeHZlN1Z2MFdL?=
 =?utf-8?B?YjBVTW9uN2hZeWFyQXdmWGlpZjFxZVVRTThDK1MvU2xJanVlQWErVmRWVUd1?=
 =?utf-8?B?VTUvVzl6Qmd1RDllcWRaamhmbjZzRjF2bnAyUTg4VmRYWmN1dzBHWitUVVFK?=
 =?utf-8?B?OFRBbTJKNnpVckZwNjN0ZHJiaW1FTFQwRUVFczI4OHZQK3VVRHdDMHdvcnRa?=
 =?utf-8?B?KzhXempSUTFhd0Irc0F0MnZyVElhNVRJMHpRcG9Lbk03NUp3UWRRUDRYS3pZ?=
 =?utf-8?B?MDdFZFdDNlkweUFiNlVTc3ZqdzdjNnV0REVoOGdlL0hKZlJMaGFuQ3hHM1Y4?=
 =?utf-8?B?UXFuS3dFUlJsbjhMeXJqZkZDalE0ampuUGhhcVA0L3Vvck1mWjFFZjRxbTBS?=
 =?utf-8?B?NDYvTVQxM3QyazUyT3R0cTlERERGVEx4MmluU1dBQ1NySmFqOFRiN25YQ2FF?=
 =?utf-8?B?NWNITDB2dVlpWnZRTEJ6Q0tuNGZwMFpvYms2THI0WVFUcVdtdXM4UVpad2Rk?=
 =?utf-8?Q?54xJFe?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9404.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZFJlVEdpQzU2V2lnWnlGRXJSUmtKeGExQktTQVVTU1NkR0FraSsvMTZOMjc4?=
 =?utf-8?B?YzZRVnArY3g5T3Jwd0phclFiTzZQY1QxbzBFSG12T01vRXZEc1Qwc0YxVk5r?=
 =?utf-8?B?MzJoSHV6cjFZbHNqZWszWVl0ZUhaOGIyTHJLUDNmWHNWbEJxMHcvbk1FbVJE?=
 =?utf-8?B?dXBud0xHTjFyTmkvWUF5UXJJUHlENm1YbVJBaWx1TDJkQnRMS1FLcG02TjZq?=
 =?utf-8?B?Q1lkT1MycVpyNkFqUENMTUVqRnR2d2ppeGlKcWZQSUp1cys5VkZPS09KSXlr?=
 =?utf-8?B?T3dldC93amZyV0FSamY0Z0ZWNnE5SlFFWHJFc2hTZ0RGVVdMVktENXRWTDE4?=
 =?utf-8?B?U0JMRUk5SzRWMlc4ZUlXLzcvMVltWmorV25SUG9mYlRYcmV1UmMrU3gvV2dD?=
 =?utf-8?B?S1ZaQnlRbzQ1UVAxL3M1enlNYk9taWZmQ3RQaG5JWXBTV25VRVpGdnJNT2Jx?=
 =?utf-8?B?bHpjdzdaRUVFZ1FHQ3BuZDlSa0Nub3dJRXVETG43RGZLSUZZYnhTWGRZMWI4?=
 =?utf-8?B?eDlrM0djZjFGNGxLTFhONWE4MGJ3TDJycUpBZ2Z1amllY1JDQm5uSHJTVVBY?=
 =?utf-8?B?ZjZmOUp5dWlBelhDYXhNaXZnUmZjUXNzRlh5VVh4SWFCS3RycUpCaWNSWXJa?=
 =?utf-8?B?OTV5RGVWblpjLzBoaHFualN2L05jTDl0Q1hTRStEeEZ2S3VueEVVMTN0dldE?=
 =?utf-8?B?SEx2ODlOZExNSldBUmVTZFBnb1hhc09EcHF2REdxNW9wU2l6MXZRaXNKSnVX?=
 =?utf-8?B?bjh5ZTcvZStFYzVmVVRzN0htOHFUY3lqTFFJNER2NFRGU3dOVFM1ZGVCNmQ4?=
 =?utf-8?B?UDhqQjNGMFphY2k0K2xNK1p2Njk0WjFDeTFoNVozK0l4eFIrVGYxeVl1amhB?=
 =?utf-8?B?NnFrV1dIeU12NWdLaDRsVG5jNUcxU0RrZlhpcngzUzZPVmR4aGh6TzhwOUUr?=
 =?utf-8?B?bGRKNUNvcFdpRE9IQlpmN3RDSFVQckxnR3g3Qk1ZUFF5VjZKM25GQjN6RCt6?=
 =?utf-8?B?OE96aEoyeGZwQzBVa2hlZFFrQnpzSWlSbDQrNVNsVmhucnpSZCtBRFpKekJK?=
 =?utf-8?B?S1dRTXU0RU1rMXc5cHEwK2gzSnNsdkNNcjBmSk9WTzZmOWlLQjYwVEJ2aExN?=
 =?utf-8?B?L2dYU0czRGxOLy9zeFJQekNJUkR2WmtQaUFXTTlMSE9PMVIrOUlUejJJL3p1?=
 =?utf-8?B?S1ZodEpoZVpzNTArK1RLMVQ0MEpBMHY4OEZLOTdpaXRwY1krUFczQzRHVHZ1?=
 =?utf-8?B?NFcwYUVTWVFNcXFQTUhPR1gvNGlZcmtxN2FoVlIvclNsWG1MN3RLWWRibVNR?=
 =?utf-8?B?MWVSeHZKMjl1WEZFR1dYSk94OTdXdXgyZGtsQWkxZStZYzIzcHdmWm0zY0lL?=
 =?utf-8?B?M0F5T3E0dzQ4a0ovKzdmdkRqQkdVd1RNOTZWanZ2eFFBTmVzMk9tTTlna1lj?=
 =?utf-8?B?QmpCQ0lueUN5REJzZ1JXQm80cUFhNU92TlUraHU1UGxRdUU0TkZ2b2h2MzFt?=
 =?utf-8?B?U0g3NDNrSSs3eG9wY2J5RFNzL2MrNE9MMENJdDJ0MEtJTURObmFUdUxqbTFx?=
 =?utf-8?B?OHQyWmhLRmVpbEFocFAzMU0rbWN0eEY5aXNuZlUrMjNJZHlhMkloWmlER3FT?=
 =?utf-8?B?RXRCMG13bU5ucGVyVUl5Smt3am1FRHBrS0hoSnRsTnN1MUg1enQrRWEzdmYy?=
 =?utf-8?B?N2hsNGVqRURVMDQxUUN0Q1VVZnZ3dGxOWjdna1BNR0hrNjMxS2RvUHBPczlR?=
 =?utf-8?B?eU4rSXo1bmZzRnVEQVVCMHNkMTM0Mk1iZ0FLelh6bndGaE9wTG96WGlXa2N5?=
 =?utf-8?B?eVFoc3NFc3NUblRIMTk2MjdGdmx0M3JOT205cnBqOXlBZ1NCekpRUGE2T054?=
 =?utf-8?B?T2hNSU84NThaNHNLVjNxYjErakZlNVFIamN6UWRmMWlQc0lZdXFMd3BXMDFH?=
 =?utf-8?B?TUFwbS9qZ3hISUdsblpMcTdjM0Q4ZVNSQ3pvYWRBU0tCcG9XcW40MDdoazJT?=
 =?utf-8?B?R0V1Q1k4Uk5Ib2grb0NuZnFUanp2a2EvMmgwdDU3cUFsWVFMOVgyT2tZaGRa?=
 =?utf-8?B?SUppZzZvS0dGWWtYeDE0Q2VzZVcrL2VhTGxTMDdzTUV6RFFjUUtYdXd1VFM2?=
 =?utf-8?B?OWtzenFuQmtSb3F0ekg2cUFRaFdCRThiOW8wUm9wM0VORTd3V0xxcHB2dGVB?=
 =?utf-8?Q?rRKTFTPUa10pZgw/lSyoOIclAENVp0ygPJdCRxqnqfJ9?=
Content-ID: <2D84E1433BAF8C46AB228949B3745BE0@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9404.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f9fc457-44a6-4359-bae9-08de25a32426
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2025 06:32:54.9301
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yMP7S5HsgzVteRENE4G6Ygr+OkwoxmbUTTlDGckpdzCePOhyeTQKHDJnJRW4BSoovD2VVD7XEotqnlVmxx8M6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF915F74166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_223304_437660_36D3F6D7 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 11/13/25 22:26, Christoph Hellwig wrote:
> Currently the two high-level APIs use two helper functions to implement
> almost all of the logic.  Refactor the two helpers and the common logic
> into a new file_update_time_flags routine that gets the iocb flags or
> 0 in case of file_update_time passed so that the entire logic is
> contained in a single function and can be easily understood and modified.
>
> Signed-off-by: Christoph Hellwig<hch@lst.de>

Looks good.

Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>

-ck


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
