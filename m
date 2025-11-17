Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A95B8CEACEF
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Nov 2025 06:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H7Rav5b1ySOB9OUX5hl/N1xBCBKDXmRZTx8t0I+sivs=; b=gQ983QlG2AzBjk
	WHr5GdYJv1fJdJJHeM1g5H6qyHxgVltYGusl0D+B+bBuquKjonpGddOPyzGK2GdCK6zVrdmj64kpm
	dx21H/cePSQG5Iiv1AAiiXIkYfBXvqZS3TFe9En+qwEagro1SBVnuXUgpALauBNgThKVhMPd4zDNO
	sunBDm7PsU7q7UMHCB6BfiaJOf72Y9SWITrCAnPEq4ygZvS7rV2Uqjah0BqUT3sK86PRlkskY1Idr
	7dR2OzAcTnXwbFG+G8XLI/XHHjKkIRriV3m8azMzXKOEcECvmUvJ532S2oL72CWZ3ITPLHcCLhOj2
	kp2+6RqhZ2RS0rQdqI9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKssl-0000000FWFM-3pHH;
	Mon, 17 Nov 2025 06:38:35 +0000
Received: from mail-northcentralusazon11013052.outbound.protection.outlook.com ([40.107.201.52] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKssj-0000000FWEH-2XsP
	for linux-mtd@lists.infradead.org;
	Mon, 17 Nov 2025 06:38:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=smnFHlakdyz52x3k3YQ0ASyT+5LsQbjVvdKRvM+VX++lO4ya0WTxS0k76ngEwUuNfsQrAnwoOZyrmoCYAeDmu9XKDkpCfrW8l84t0wtINp19Z5zUbE3uvxZRDkQb+NcKF6CRHI1S3JcUdH3J9K8/b8KVs/giJz+jDepi6aPbvhBwyUkvguYikGS8QukssjRDCgJdop49LLItrSJL6bQYu4mF8B8zMOAwXcIYrCJqgEuL45tLjuzBWb+809IDh84qsDj9T6thR8s6EtyDIzIdyI4WSiWqSprvc6HhRxFxOCu2bySw71JQThlvM2xd4NZo/XhvSVjgLYBfnRll/YSqgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9pUhhWOOMzxizy+rYtssP+JXcDAE9Kn1nceD8NqIR7c=;
 b=sh8befUUerxHeM7pqmCU1fp4DX9IR7GX+7J3ZtIUKj3Ft3icHqKXhLNOcJjXjcAzRB5pE+6KXfE+tzPBLlN4uyAtnPxjrk6DdaXA+2du23D0NV4jNrkQc7ViilN3FfkQBASynR0XRl3lHT50Fdq1qkSzxlPR/hzTAA774LELPwuE4d6lw+aAQK7Vr+Mm3OljeJSJhQxg6CVdkq8tMFiYfSrtqRozO1zJ6k1ygHHLP5LGIKC8NG45x2VGjpg4BMnD5He6et8Qq+9EpzQZSuBAZgQW6kOi2lBPPCMkPox8kyLjrB5JhS9RL5s5lzIHfjIIMaFyE25d9U/e2+pO7kmzkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9pUhhWOOMzxizy+rYtssP+JXcDAE9Kn1nceD8NqIR7c=;
 b=Bk5zNEZYf89ezNWXy6OwBm/+JN12ut/5b8a6F/URiGVOapPi0gINIzZAU6M89Eur+S25yfCSnifbalsfz++RDFUN4ztcpa/lXWn3WvwCGEKZgH0gA9b52plEiQHrvevKvaiiGVbsnWYTyYSVVj0oiz7y6a3aqi3ka0YIxutLjLOMNxfl9bHBaLaPpUUoTMc5DtsC6H6uiL+0ulxnC8QWumzGvouhC3yViokUK6aYiBiFKxL8lr7a8/+AFh+PzwXrzT34u1mIyIflzg8X4GcOBq4NQrVc1dy0RT8F535A+ckBn2BJ+f2bPzQlucpmAW2qTcNjLoNyaIyaBe6aqifktQ==
Received: from LV3PR12MB9404.namprd12.prod.outlook.com (2603:10b6:408:219::9)
 by DS0PR12MB7632.namprd12.prod.outlook.com (2603:10b6:8:11f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 06:38:29 +0000
Received: from LV3PR12MB9404.namprd12.prod.outlook.com
 ([fe80::57ac:82e6:1ec5:f40b]) by LV3PR12MB9404.namprd12.prod.outlook.com
 ([fe80::57ac:82e6:1ec5:f40b%5]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 06:38:29 +0000
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
Subject: Re: [PATCH 03/14] fs: export vfs_utimes
Thread-Topic: [PATCH 03/14] fs: export vfs_utimes
Thread-Index: AQHcVTA0m7P/xfDFKE2uVLVjAh2CCbT2bzGA
Date: Mon, 17 Nov 2025 06:38:29 +0000
Message-ID: <a50bbfff-30c0-40f1-928f-709574ad63f6@nvidia.com>
References: <20251114062642.1524837-1-hch@lst.de>
 <20251114062642.1524837-4-hch@lst.de>
In-Reply-To: <20251114062642.1524837-4-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR12MB9404:EE_|DS0PR12MB7632:EE_
x-ms-office365-filtering-correlation-id: 2af78d79-9eae-4ba9-039d-08de25a3eb9a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|10070799003|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?eDh0UUpVWk4rNVcwVGlYVDJlMVpod3BxUkRKbFBiOXliNmtUL1Z2UkdsVkZh?=
 =?utf-8?B?VTI4bncyY2RrbC9iczRYSDhreXR0ODhzQjhDQXdReGlnSTEzQjNGSFUzb3A1?=
 =?utf-8?B?ellub2N5ZkE5ZzViYldab2xBZEptTGxXeExPODR0Q3dTdmtSdUhXRUgza1Rl?=
 =?utf-8?B?ZjU4d2x4SkJzTjVKSzAwV1E3M0xLc0xYWXlaSXRjSE5DZHVPL3dvS1UwV1ZS?=
 =?utf-8?B?eDEwTVhsTHZ1cjRsMUljQ0xXOEFoTjBndnVKQXhJblFDUlRUWVh4YzN2WU1t?=
 =?utf-8?B?VjYxdk1SYXNFeWxYUWZmVzIrVXNEQjdkWS9KV2dqRmZkZjA5cThKUE5INGJO?=
 =?utf-8?B?a1FnOXBROUI2MGhUczVxd1BNVldjUytLNVc5K1FCSzV3cHk2OWo2SndMaUs2?=
 =?utf-8?B?WVUxRlZCRlFxQWVSSk9SckV6OFEwWGZYMUgxMXpDQ0lsZW1OMHQ5Y2hVdGhG?=
 =?utf-8?B?eSswTlJRd1VsQldqbWVTTjdxUkZ3Vk9Ha2dyRWxIWG96NXRVa1g0dnBGTEQ3?=
 =?utf-8?B?d0lscWJtV3BiNlRadW1sNVRTRFpSZG1SNzAxYmRYRU9iRTlYaGk0OVp3WFM2?=
 =?utf-8?B?YlpTUnlROXkzTW1RaGpabFlLOGNRRHFCcGRUTXpaVW42VWFGWVRwaHI5aTlC?=
 =?utf-8?B?TDVQWjgyMzhhWU1YRTg1Sm5QYWFNV1RGOHdDdWVZYll0bXp5bWVLdTltTlQ0?=
 =?utf-8?B?UUE2Y0U2RmpUZjBVSzFtcW4zT0swdStYN1M0djZVMzNacTc1MFh5cWdqV2VW?=
 =?utf-8?B?MUlwKzlTOFI1bnczQ1dWMG5DNlNKNGhzZjVia2JFSHQzeTQ0czdKa2dobHpB?=
 =?utf-8?B?K3FkRmR6RVAwbUtEQTVYNHEvY0ZBNDJ4anBpWkRzeHBxRVNsOVJTeWR5Sk1G?=
 =?utf-8?B?ZnZ5Mm9yK1ZUeXJZWmFJSldKQ2g2MGlONzE3YVVrUHV6dnM4bkllSlQ4YmNx?=
 =?utf-8?B?SkszaEVHT1lwWTdTU2JpeEhrWms1M2hlSzVUdDgyNkVISUsvRTVIMnltUGpr?=
 =?utf-8?B?ZmlnaFg5b01ieGVnQ05JMU9qOWhPNU5BRXFkcDFPN3o3QUxCK0hHb1NsSmIv?=
 =?utf-8?B?MkVTK2RQTXpONVNhdjFsUkxlYzNNTW00Q1BxNDBYalJVTFRVdnllaStmenhL?=
 =?utf-8?B?Y2pxQWlLcXptZjZIa01XdVdXRlFiRnlGWCtvUGxMZDY1RG1wenhKN2R4Tm5Q?=
 =?utf-8?B?YTdQbnhvakFUUFNGZklrNlQ3c3lJRmF4TDNBQit3UWpXSVRWNjRSV0JOYU9Z?=
 =?utf-8?B?TTRCWk82RXhsNVYzQ09RNmVvRk02Zlk2em41NmJFZGtQallHVm1iQkI0RnpK?=
 =?utf-8?B?d2dHdkczQ2h2WEZNZ1VLTThkZVFUaE1Wa0pvNExiLzRTa0tjUUtwWnF0NWMy?=
 =?utf-8?B?UmpDZFFDN1ErUWg4cmh3bHlqSmxidEZxeDMycFRsbmZZM1Y5K3V2Y01ZdFlW?=
 =?utf-8?B?b0N1WTBoU0xHR0xYM3l6L2s0b0ZCb3pFcDlIWTVCTytpZTQyYkFRcmdyUXJO?=
 =?utf-8?B?Sys2dmVHaVo5T3Z1QmtOK1NJRGYxNjhqOHd5MVBoRlJGcUltR09PWm40MEJk?=
 =?utf-8?B?WnRjcWhjUFdqellrb1BDQ1lyNEVHTG5MZ3VwZk8zcUN1TE9McnFLWDdWRzQ0?=
 =?utf-8?B?NGNiS2J2b0dQZkZZUjkva3IwN3lmRHQxUU9FclJ6NmpOSEZGWUx5ZnBQR0E2?=
 =?utf-8?B?NldGWnhQK2t0b0NjQ0tENmE4d0tjUXo2dnpISXNoekUwYldBdHczaHNGSWxZ?=
 =?utf-8?B?VlRlZ0REdEFlMTFXMWM0akN1M0JCaXFSQlYzeks1eU9BVDRMeUQ4aE9sektn?=
 =?utf-8?B?cmNKbVhLTTB5OFVGNGdrLzdQOWNMUnNmU0o5emQwdE5CMDVYeG4xTlBlSXB4?=
 =?utf-8?B?d21hUThXL1hkSVYwenRQcnJRaGtZZHhJMC9majZ3c291N0dUOE5URmEyakMx?=
 =?utf-8?B?Vm1tQzRLU2dDdDllNEtIZXdvcnlMRzlNeDMvdnhDRDlDWURtek9ZZGxsZzFy?=
 =?utf-8?B?UjBsL1V1SDYrRC91bERCMG9RYTM4UUkyODg3TEtzdG9VUWREb0p6dXpLMnRI?=
 =?utf-8?Q?eZmJft?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9404.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(10070799003)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N3VBak10bEdkcHVLQUM4ZGxsbyswai95UmdIV29nWjFCUnBBWFhtajNZRVF6?=
 =?utf-8?B?WE1pOGY5bkxTMnRIMEJMWlk0S2lKa29SMmZVNzBHaFlwNC9UNUVtaDlsMlY1?=
 =?utf-8?B?STY2c29uTThZYkZSVDN0UTVGdkhxd002TUJyOHBrbThBS09QY2V4aWd2NkhP?=
 =?utf-8?B?d1RKd3F2aGNYUjdSYU01Z1VIMnFlQ3JIbE1xaHJIeHcrZzFOcU9hdFlLK0sy?=
 =?utf-8?B?KzdwRDJ0KzdveXBoYWhWQ2hrdE52anpUYUJYUjduaUtHMW1wK1VHYnU0SU9z?=
 =?utf-8?B?WGtnaXIyU3ZBZDR5dmlZemxWdHBqSnRmS2ZkSzZKOHNVMXByYWFkVlhtcnYz?=
 =?utf-8?B?OXN6cUhOaXUyb3FOZkdPa1JsaTVzOGFNQUJMcFBNeTdiQ1BSU2hZeVpyUG1y?=
 =?utf-8?B?UlhrTlZQbU1yQ0xnM0ViaUxGVjczRi9nb1BMRnBqUjAwb3VMTWVhRjBES0Yw?=
 =?utf-8?B?bUVkeXNLeGc5dGV3NHVOcnhkdmhLeGlwMEFHaTBUMEVjcFdPREZ3NEUzL0Jz?=
 =?utf-8?B?QTRlRllzNWJia041UGR5RXhqK1g0Z3FsQ3Z0WmNrcjBIa0xteDFRSDBHYndR?=
 =?utf-8?B?Unp4MTVHdE9MVmlHcUxtQVRNQTdzQ1pOOHBYaU83MkpJdDN3RFlOaWxTTklT?=
 =?utf-8?B?bTdteDVmMDg2YmxCUzZuSVl5TktIUzBqYXBXL0hZMThselUvU2lnWlh0S0Zt?=
 =?utf-8?B?aG0yUjd2aXNZekRSMmNaMVZsZWVlcURkYVBkZU40WmF5WlU2SitLUFlqbHgw?=
 =?utf-8?B?Ykk4ZW1yS1ZRQ1JRRDZhZ3hIUnBrQXBHMUdQRGZSWXFlYUFIb2dIRUNCOTJF?=
 =?utf-8?B?U0NkNE1uckUySUN1SlQ5TTdVcDNkb2huMllWWGp1ODJDNEVpZmZkd0FuVGFn?=
 =?utf-8?B?Si9sbDRhR3V6YXV6RGFqYnhaNHBEYktyZ2MxaXNIdG5uWGtqcVNYQkxMa3Nn?=
 =?utf-8?B?U2dLUlZNMzVneFF1am9SMWdWWTBaeVpLUDFRWGFsNlAxems0OGl4SGQrRVh3?=
 =?utf-8?B?VmJRclRrUlg4YnJkSVRwRWFqRXVkM2dyUVBsYmhLUVJNNWplMEFSRnFoSmZj?=
 =?utf-8?B?WEpBbHFnWE5uTUVvemg0bEhwUXVZbGFCVllBTC9heXNzOXlmdmpQSjV2ZkxQ?=
 =?utf-8?B?OGh4THlRSW4wcWh1SG5SOXR3Wi9rNVFiRXE2dnh3RS9kSFE5QWRmNDRJSURz?=
 =?utf-8?B?aDBNTmFidFgxdzlNY1hEZDlFeDlndXZ1VkU2ZGdObVd1MmNtZThnV3dCRlNJ?=
 =?utf-8?B?OGxrM3pKaysxcWhQa3E3NWlyZDVWV2lIdXhPa1dRWWJhQWs2OGo2VjlIQ0Nr?=
 =?utf-8?B?LzFJNzNZVGc4ZmsxajQ0UXd4NE1BblhUQStsNmEvQy8vNlB0cE9IODd5Y0pJ?=
 =?utf-8?B?UHExSWVrQmFlMW04ZXJwekM0Y3hidTBDV0VxUDRmV1RVRkpJRFZvQ1lodnlR?=
 =?utf-8?B?ZnNsYWtTbmJqZ2lBOGZlNXZaK0o0VlZ4WHp3dGxNNUNjZW9PMUJ0NXE3UE9x?=
 =?utf-8?B?MHpkQTAzTlZPeTRWN252cWE5M3JtYStTV3NqeTZCdVQyN0JGcXJpQ3RiL1NO?=
 =?utf-8?B?UWYremlpNHF4WkNxamJQakt5Vzd2QkkyZ1kwaUNhNDlEQnl5T3R6aHdxb2ZL?=
 =?utf-8?B?dVlZR0FpcGY3c2xCeWZwR1BBNkdBSTNvRkZpY2NoY3M3VTNNMkR2b1NJdTUy?=
 =?utf-8?B?S2RWaUg4ajUzeW9BS0NySTJod1hqenZvL2JvWFdnbWd1SGxLb1VRWWZESTZC?=
 =?utf-8?B?czRON0RHRkJ0bmlOVTVLTERweTR2UWJpeHBRS3BvNTZ6TDIrYmRRYjZmYTdQ?=
 =?utf-8?B?bE04N3R1L084M0FKbjVyRHQycVJaRmQ3N0JNVTh6S2pjQ3JqazNJTjF3ODV2?=
 =?utf-8?B?TGxSMlA1ZUk4dGZ0NDJ2eW5GV1ZQQ2psUkFjV0tBb0pWb2xlR242TFR2NHlT?=
 =?utf-8?B?OTFlSzBXdXRuSU5mTEp3NHlzbXkzWEIzdE9ldEZlc1VtOVZqNkhMdTFrYklj?=
 =?utf-8?B?L2s5emQ3UVk4RUs1bW5FQlczN0czQ1Jkc1Jtc1JIbEdNaHpSbldOSTdicXRl?=
 =?utf-8?B?dWorSmRJazFqdU9HdytndW5BYS8vSXl0TWI2NnpXRTVEMElOVWEwUW9WeW41?=
 =?utf-8?B?TXpHdTkrODhKMTNzaXhpZE9OdVhFcmpLVGFPblhPL2QzTElmMXpPa21KOE05?=
 =?utf-8?Q?8PlLNp8+R3icUMt8dj70Jyyjs8LDyoWU1HjV6Rt6BQgZ?=
Content-ID: <CFDD10D2A792924EA68C35FD9A01CBDA@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9404.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2af78d79-9eae-4ba9-039d-08de25a3eb9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2025 06:38:29.5232
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cLO1tntoUqyIVZTaccC/k6ef3k1xMaSiMJEQM4C26gsRKYcO2evrU+McKwoH3BcCCVsOS5nFp9UdiY14loxhpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7632
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_223833_648866_805C421B 
X-CRM114-Status: UNSURE (   7.82  )
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

On 11/13/25 22:26, Christoph Hellwig wrote:
> This will be used to replace an incorrect direct call into
> generic_update_time in btrfs.
>
> Signed-off-by: Christoph Hellwig<hch@lst.de>


Looks good.

Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>

-ck


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
