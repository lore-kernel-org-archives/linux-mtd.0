Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5738D72365
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Jan 2026 09:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qRZ5qK1w2b5inn+ufmoTs8ZMs4jqeu5j3Bj+xoo92kE=; b=yVALckZRvFh6Cvev5xF3imz/cb
	RavACmB+WlSpvukrkf+v+C10EPPU92Uq8OCDonZYuLFuGtjXkgH/XhQgodInjsxEk6rgl2Qn/yqLM
	6mLv/ICWVFlAG/nkAhk0Zky9VlrPnC2AjoUDFKWvCpxnHKZgBS4IL9MoO6LDliBa8JZVlSg+CW3Y0
	xtiwddXkzO4pp5gdIraPdwAePnhyO1pqM1vRW5j82V7cUS01gKR6kTJPhgjj4h0FV9+SrO1QCkOxf
	vhFA0CqyKVwh+ffP7vsSG6b9GpQ4JogKXGQevE5099bV25pUAPpb0owA8lzR9IH3IDLbLdS21OhGg
	lCgd21vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjDkX-00000008c4H-0jZ4;
	Fri, 23 Jan 2026 09:46:41 +0000
Received: from mail-northcentralusazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c105::5] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjDkU-00000008c3h-33Ju
	for linux-mtd@lists.infradead.org;
	Fri, 23 Jan 2026 09:46:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SMUNXPfd+2CZrplsI1Jy1p0WoDqgXa/roUbM3RUkzkO32/roSbKgQek5/Hb/dITkCguUGi/J4fmnH+GKYcNWcRDD89I7zxWrPijK9jgUE84N6cPl7iXkJxpthiZ/6QOElRSrNd0OQAGwDpDlnVgQWQ/lfEXD3Kot1eL7lmpmZ8ttMRylN8TaD4fLN69q2UK6DVPFaujJTj4uJHOKYiCG1pAu8yiqI289el5XTnJo7tt8bxKWib/U3iIUV/wVzxyzqhpLuKl7nGwDru30g5sgZI0sIOa48Af85hTbYHiRG8iwC8T1VmKLl7jLrMde3zR0XvU6vrXCmUjhm0xCmj+Hww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qm8ifAF+os6iuK4+W/YwaiqJu9VxVOBxHApSUDw4VdU=;
 b=zPzpMxr3rwY0Jn+PkurWAqyjuMCdX7+K9zeVvXpCtcfmQTijQyMvvGYEasuBKm795gr5RMqB+xLY6N7Mrln9iHHW7Ze5bpJI95xPpfPMnH2v6v4HscPV2M4sn45g2rlspsZZTEvAZTdS5JqrznQoepTh16WMwdsHWX4gaTy0HJj7nZNvIXk3yP1GqTb/Tn0L52gRgAL8n3de0TMekZmTXjVbakwHIvussYTJ9t5kj3xRX3N5bWX9F6h1gGb27wv/NkYJWRHhkWwVFZ/+WWDMsZ+O5USt47NzCTJ2IDqChjcAevacQORLxibnvBM+mIUOucoxuxzLmyOdWEApR0bHkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qm8ifAF+os6iuK4+W/YwaiqJu9VxVOBxHApSUDw4VdU=;
 b=1/hrjQ7gq2iazfX6zlqB9zsCCDiadLmdS6EjAr4UVVOB5oXHMFN4IV5YfPa5wIpd7QX9sjQu2vlptu9XUVhL7pRPS1eaTz9CKxkmdTGR4zJatr9X9KVQCdHhiqU/yML2qL3ZZ8doMaEI9WwEYUbtcU/yCqctCFabArPLnpijpeA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by MN2PR12MB4176.namprd12.prod.outlook.com (2603:10b6:208:1d5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Fri, 23 Jan
 2026 09:46:34 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%4]) with mapi id 15.20.9542.009; Fri, 23 Jan 2026
 09:46:34 +0000
Message-ID: <00857f9d-0610-4c0e-9619-baa9c3606167@amd.com>
Date: Fri, 23 Jan 2026 10:46:23 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mtd: rawnand: pl353: Add message about ECC mode
To: andrea.scian@dave.eu, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260121-pl353-soft-ecc-support-v1-0-00ad8e160d83@dave.eu>
 <20260121-pl353-soft-ecc-support-v1-2-00ad8e160d83@dave.eu>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 xsFNBFFuvDEBEAC9Amu3nk79+J+4xBOuM5XmDmljuukOc6mKB5bBYOa4SrWJZTjeGRf52VMc
 howHe8Y9nSbG92obZMqsdt+d/hmRu3fgwRYiiU97YJjUkCN5paHXyBb+3IdrLNGt8I7C9RMy
 svSoH4WcApYNqvB3rcMtJIna+HUhx8xOk+XCfyKJDnrSuKgx0Svj446qgM5fe7RyFOlGX/wF
 Ae63Hs0RkFo3I/+hLLJP6kwPnOEo3lkvzm3FMMy0D9VxT9e6Y3afe1UTQuhkg8PbABxhowzj
 SEnl0ICoqpBqqROV/w1fOlPrm4WSNlZJunYV4gTEustZf8j9FWncn3QzRhnQOSuzTPFbsbH5
 WVxwDvgHLRTmBuMw1sqvCc7CofjsD1XM9bP3HOBwCxKaTyOxbPJh3D4AdD1u+cF/lj9Fj255
 Es9aATHPvoDQmOzyyRNTQzupN8UtZ+/tB4mhgxWzorpbdItaSXWgdDPDtssJIC+d5+hskys8
 B3jbv86lyM+4jh2URpnL1gqOPwnaf1zm/7sqoN3r64cml94q68jfY4lNTwjA/SnaS1DE9XXa
 XQlkhHgjSLyRjjsMsz+2A4otRLrBbumEUtSMlPfhTi8xUsj9ZfPIUz3fji8vmxZG/Da6jx/c
 a0UQdFFCL4Ay/EMSoGbQouzhC69OQLWNH3rMQbBvrRbiMJbEZwARAQABzSlNaWNoYWwgU2lt
 ZWsgKEFNRCkgPG1pY2hhbC5zaW1la0BhbWQuY29tPsLBlAQTAQgAPgIbAwULCQgHAgYVCgkI
 CwIEFgIDAQIeAQIXgBYhBGc1DJv1zO6bU2Q1ajd8fyH+PR+RBQJn8lwDBQkaRgbLAAoJEDd8
 fyH+PR+RCNAP/iHkKbpP0XXfgfWqf8yyrFHjGPJSknERzxw0glxPztfC3UqeusQ0CPnbI85n
 uQdm5/zRgWr7wi8H2UMqFlfMW8/NH5Da7GOPc26NMTPA2ZG5S2SG2SGZj1Smq8mL4iueePiN
 x1qfWhVm7TfkDHUEmMAYq70sjFcvygyqHUCumpw36CMQSMyrxyEkbYm1NKORlnySAFHy2pOx
 nmXKSaL1yfof3JJLwNwtaBj76GKQILnlYx9QNnt6adCtrZLIhB3HGh4IRJyuiiM0aZi1G8ei
 2ILx2n2LxUw7X6aAD0sYHtNKUCQMCBGQHzJLDYjEyy0kfYoLXV2P6K+7WYnRP+uV8g77Gl9a
 IuGvxgEUITjMakX3e8RjyZ5jmc5ZAsegfJ669oZJOzQouw/W9Qneb820rhA2CKK8BnmlkHP+
 WB5yDks3gSHE/GlOWqRkVZ05sUjVmq/tZ1JEdOapWQovRQsueDjxXcMjgNo5e8ttCyMo44u1
 pKXRJpR5l7/hBYWeMlcKvLwByep+FOGtKsv0xadMKr1M6wPZXkV83jMKxxRE9HlqWJLLUE1Q
 0pDvn1EvlpDj9eED73iMBsrHu9cIk8aweTEbQ4bcKRGfGkXrCwle6xRiKSjXCdzWpOglNhjq
 1g8Ak+G+ZR6r7QarL01BkdE2/WUOLHdGHB1hJxARbP2E3l46zsFNBFFuvDEBEACXqiX5h4IA
 03fJOwh+82aQWeHVAEDpjDzK5hSSJZDE55KP8br1FZrgrjvQ9Ma7thSu1mbr+ydeIqoO1/iM
 fZA+DDPpvo6kscjep11bNhVa0JpHhwnMfHNTSHDMq9OXL9ZZpku/+OXtapISzIH336p4ZUUB
 5asad8Ux70g4gmI92eLWBzFFdlyR4g1Vis511Nn481lsDO9LZhKyWelbif7FKKv4p3FRPSbB
 vEgh71V3NDCPlJJoiHiYaS8IN3uasV/S1+cxVbwz2WcUEZCpeHcY2qsQAEqp4GM7PF2G6gtz
 IOBUMk7fjku1mzlx4zP7uj87LGJTOAxQUJ1HHlx3Li+xu2oF9Vv101/fsCmptAAUMo7KiJgP
 Lu8TsP1migoOoSbGUMR0jQpUcKF2L2jaNVS6updvNjbRmFojK2y6A/Bc6WAKhtdv8/e0/Zby
 iVA7/EN5phZ1GugMJxOLHJ1eqw7DQ5CHcSQ5bOx0Yjmhg4PT6pbW3mB1w+ClAnxhAbyMsfBn
 XxvvcjWIPnBVlB2Z0YH/gizMDdM0Sa/HIz+q7JR7XkGL4MYeAM15m6O7hkCJcoFV7LMzkNKk
 OiCZ3E0JYDsMXvmh3S4EVWAG+buA+9beElCmXDcXPI4PinMPqpwmLNcEhPVMQfvAYRqQp2fg
 1vTEyK58Ms+0a9L1k5MvvbFg9QARAQABwsF8BBgBCAAmAhsMFiEEZzUMm/XM7ptTZDVqN3x/
 If49H5EFAmfyXCkFCRpGBvgACgkQN3x/If49H5GY5xAAoKWHRO/OlI7eMA8VaUgFInmphBAj
 fAgQbW6Zxl9ULaCcNSoJc2D0zYWXftDOJeXyVk5Gb8cMbLA1tIMSM/BgSAnT7As2KfcZDTXQ
 DJSZYWgYKc/YywLgUlpv4slFv5tjmoUvHK9w2DuFLW254pnUuhrdyTEaknEM+qOmPscWOs0R
 dR6mMTN0vBjnLUeYdy0xbaoefjT+tWBybXkVwLDd3d/+mOa9ZiAB7ynuVWu2ow/uGJx0hnRI
 LGfLsiPu47YQrQXu79r7RtVeAYwRh3ul7wx5LABWI6n31oEHxDH+1czVjKsiozRstEaUxuDZ
 jWRHq+AEIq79BTTopj2dnW+sZAsnVpQmc+nod6xR907pzt/HZL0WoWwRVkbg7hqtzKOBoju3
 hftqVr0nx77oBZD6mSJsxM/QuJoaXaTX/a/QiB4Nwrja2jlM0lMUA/bGeM1tQwS7rJLaT3cT
 RBGSlJgyWtR8IQvX3rqHd6QrFi1poQ1/wpLummWO0adWes2U6I3GtD9vxO/cazWrWBDoQ8Da
 otYa9+7v0j0WOBTJaj16LFxdSRq/jZ1y/EIHs3Ysd85mUWXOB8xZ6h+WEMzqAvOt02oWJVbr
 ZLqxG/3ScDXZEUJ6EDJVoLAK50zMk87ece2+4GWGOKfFsiDfh7fnEMXQcykxuowBYUD0tMd2
 mpwx1d8=
In-Reply-To: <20260121-pl353-soft-ecc-support-v1-2-00ad8e160d83@dave.eu>
X-ClientProxiedBy: VI1PR04CA0120.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::18) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|MN2PR12MB4176:EE_
X-MS-Office365-Filtering-Correlation-Id: 938854b1-8eb6-4c63-c0cd-08de5a644b8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YjBMekFhKzNDVXhtSlAzUnFaWFJ3M2FTZGNnNTVIMDlmL05LV0h0cTExeWdi?=
 =?utf-8?B?OUY3KzN4M1d6QjNaZFU3eWIwdWxNYW43Q0JEWEdrdERnMFQrTDVyQk5tN0JY?=
 =?utf-8?B?ZXI1aXpCbDh2V3FxdUdCallnVElmNnQ5cGpKQ3prZUs4d2R5M00yNlI4UUhD?=
 =?utf-8?B?d1VLcXNTcnJHak5SakNrcEZOVENxZVo5LzI1K2Z4TVVWU0pyUWdCSjBjSDVo?=
 =?utf-8?B?ZUU3MW5GQVQxck5RckpXOXpUM25PSjFxc1RRT1dhaCthRjBPOVNibXFabG9h?=
 =?utf-8?B?NWZXOVBpY3Rrei93RnlzRGtGbjQ3eUc3ZmFNMHNsajk0WHRmV1RGQmpsejlH?=
 =?utf-8?B?TTdnQVBXSWIxWHlPMUhuenNmc0wvS01wdGRmcU0wNzdnSkF5a0NTbi9jL3Zq?=
 =?utf-8?B?Nm5nZmlBUGIwYjdPMVBXR050UDlSdms1emNwSlZUOU1mNjVFSkpMbUhWWFF2?=
 =?utf-8?B?UHVrRFkycnZVVjQ1MTJ5THJnQXh0M1BSeEg4Y3ltVERSRnV6Q2Q4WmRySGVI?=
 =?utf-8?B?MDdta3RrckNkT1dPTzFuVzRZRHo3T0NHcWlGUHdqbGoreGFqR1JqUDhNYU5O?=
 =?utf-8?B?M3JRd1NTdytlNjZRL2orK3FVRzRJT3NDWjdtdXR4QWNXSVo2RjF0blErc25z?=
 =?utf-8?B?UkxRb2pDTUJvbFpnODBNM2VmR3VyRGFlcG9ta0g1NEh3VTFDSFNGMHhwcVRJ?=
 =?utf-8?B?UHJoSVJkMkMyc2VKNjgrMkJXbm5ZcTZYVldqY1ZRdElVTk5JbnY5ZUJLSjJr?=
 =?utf-8?B?WWVkcVJFdUVON2xLd01iK3E3ajQ3MUQrbUtmTDdxcHBmMTU0TDNRMWEzYXFF?=
 =?utf-8?B?cXk1VUVCd25VbEhvYUxOVTgzSVV2NWhuYnhxNEZhaVYxdTB0QnRZRDJ1b080?=
 =?utf-8?B?WWlkcDhja0QreHhyN2ZMaHg1OWhSbkxYR20rTTJCWC8ydlpSek93OGxGcm9X?=
 =?utf-8?B?K05ZRWJkR3pkMmZWaitXaWFNVFVpblVDeVBiYTNhUzljZkxqYThJQisyOUhq?=
 =?utf-8?B?aTBqdm1GN1czcHFjV3hHWlFGbTBGNU1QYy9sM3p1L1RuazkzQXBEQU1tY3Ns?=
 =?utf-8?B?aGtPbW1tZGNsMytLa3BjZUN6MjNxQVFCQ3RNSFl4Z3pXQUNnank2NFFlQlNj?=
 =?utf-8?B?ODZhYTlrYnRqdWtmNm82NGYwS1ZNVjBVNk9QRjVxLzZYYTV2WEh3anBOTGVo?=
 =?utf-8?B?eG1SMW1PRmRBQ2dPTGhCZWRkaWcxQmRIV0dMSGZPWnd0VG0vaFJFb2pJR0Iy?=
 =?utf-8?B?Y3ViRnhKMnY0M3ViSldjY1k0UGxpek0vazUrV2RrbENkSHZBbk40VDAzWnZ4?=
 =?utf-8?B?dEdsZSt2RjJ1eHQvRXk3OHQ5V29RdHVQcUwvdFhZY084OCtnVE14cHAwSi8z?=
 =?utf-8?B?NWlzZWVaV0NQYWszNEJmSk1hc0xCMkVBQ3NneFZGZmUwY215d1IyS1JjUG9a?=
 =?utf-8?B?NmtxS09BUnVaSzBjc3gzVEJyRURvSW42MmYxdVdHQ1hoM2hWTWhMOWFzRVNx?=
 =?utf-8?B?alR2UFRxOTN2QkdOVVZERlNZZ3pQazBJWFpNaytzaGRUYnVQa2Vsaml3Z01i?=
 =?utf-8?B?RWtiTjREcWUzZVZ5U211dGp4Qmw2UnV4c0YzY2RnRkZVSlJQcjBBcXoreVhu?=
 =?utf-8?B?N0ttY1RKdDJoRmd3c0VoTytVUHZMclJCbWhUY3o1M09TSG11YkZONTBXRitK?=
 =?utf-8?B?bjRqMkxiSlA4L2IvRkhKS2NpNUw5ZlFwZktjeXFTbm8zNHp0cGJNZ1pQWktH?=
 =?utf-8?B?TEFLQjRTS0d5Nktwd08xQkIrUTB4a2xreE9BRndtTm1KU1RhRWoyS0ZISy9B?=
 =?utf-8?B?dXpSeDJOYXlIVVJxTENuaytRa0pEMXUzSEtrTDR4NVgvbHU5STlEQndjU3pm?=
 =?utf-8?B?T3NUeVgxSkxISVU2TlV3MWt6Vkl3Q2pjclQ3L1U5NkJ3enRYdFlydFFnNVlH?=
 =?utf-8?B?SC8xRG5rR28wZjJMeUtnK3lKWlhITmNnd2pWZFluVHNVd3ppWWl0U2lPelF5?=
 =?utf-8?B?VEZDTlMzVGFRaEM4UVpPTFhpeUt4ckxwZndIekhKU1RJK09RVkdkOXNPVS8y?=
 =?utf-8?B?Wkkza1E2TC9WY2J0M2N3bXM1YkhCY1dVdXJ6VGlaU0E5WldPMHFSUkQzS2hL?=
 =?utf-8?Q?CI2o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHhCMm5rK0VtR25OUllKUEtXL1FpNnlDc1VzcVFPR2JpdDEvSWJQdG9BdXNQ?=
 =?utf-8?B?WXNTZGg2aUIyZnl1Ykl0UGNOanNnRmNDKzZLemdTeHl3YzVLS2ZpOVJNY05i?=
 =?utf-8?B?eCt1Vzc1OG1tdCtXLzk2Zm5FSDVlMXoxSXZKZUlDSm1vRzZ2TVg5c3dtMEl6?=
 =?utf-8?B?eXVteFU2aTR0SGFySS9LcWRNRFFzZytTWkJFekNTM2MyUnVXN1FMZkllOWxu?=
 =?utf-8?B?UGlEOHNaVXQrRjNZRUtzQ0RMcFlpemUxS2s1S1hnQzBkV3lWbSt5STVBbTN2?=
 =?utf-8?B?TXI4ckw3ZVRXcXhwMnpESjdtMUFob21XSU1EUkVmR1NnWTRlOWM4b1IwbTdz?=
 =?utf-8?B?LzB2dTU3dDhhVTBRTWJ1MUZ5OG9wWFc2RDBsaTV1VEZhUEh4LzV6SDlHSkFV?=
 =?utf-8?B?amZJZExJWFRtWGxHTUpUS3lJL2ZqT3pUSUR0RTBwV2Qxc3hrRndlbzRoTFVm?=
 =?utf-8?B?Z05TZ3hWa0NlNHk5OTd6OGgyUmhjZVo3NU5ESTl3OEQ0SUlLSnRycnF3ejJT?=
 =?utf-8?B?d0tRZkwvbjlqdFdiN2RsOUdkRnFncEJDNkJGU0tHdmx1cHFOTEdJeEk2RG1E?=
 =?utf-8?B?L1FhbXVDZFZIOGRVMTdtbGtka0dTVkxNMFBCaHpDQ3p3Yzl3L2hMUDlQYTUr?=
 =?utf-8?B?UFZzT3BadCtTaEcyM0FnYXpTMlN3eXFRcHZrWTVmMFRxTHI0MlAySmFzeXFy?=
 =?utf-8?B?KzIrZGpCUWkraWQ3c2t1UzA3UVFVSFpQd0haOXl6VXEwWHhMZUZNSHRlWVo2?=
 =?utf-8?B?MjdqK2FoWnpTc3NOSmM1QkFXSjViOEtqaEp2eVNleXcvM1NDUDVFR1VzVVpo?=
 =?utf-8?B?eHB0OGhxS1VBM0JHSmJ5UCsrWEpzblNRUmJrU1A2Z0VlaUlscE14OG5xcUV0?=
 =?utf-8?B?WE9xOUwzWndEbUtDMGVDMlgyKzJjTWpSZGJReVc5VFF4d056T1FtTGRINEly?=
 =?utf-8?B?OHpjMm55WnhvV1hSZG1UcHBxbGRROGJaRlZMQVZvb2I4UTB4Zlp1NndubzB3?=
 =?utf-8?B?OEZwTDViUmczRXVoTzVpUTFsMktCU2wzWCtyQVFsUW8vMzZWM0pQME1UWE5K?=
 =?utf-8?B?R01wc0Jzczh6UlhIdWxEcFVmdTNzditkclZuT2dKYWpLS1d6OHh0R0VMQnp6?=
 =?utf-8?B?R0xFa2xqLzV2ZzRDOEw4Yitqb2poaFZxT2RrRkxQYXlJKzI2S2twTHlSMzBm?=
 =?utf-8?B?UkZ1MUswVFVZVXZNdFF1WERQWW50VWxiNkd2UnNPbjZQVm5LTGtJSWFsejhI?=
 =?utf-8?B?L2M5S0cvMWxNNFJFSWUzSkl4bWxxbWJZT3FtVjUybEcrU1huTTQ0eEprSWFr?=
 =?utf-8?B?ZlB3V3NGT1pVYzluaXAyQ0lua2I1cTVPRDh5RmhUYzZmZEFxdUQ0R1ZtS1k3?=
 =?utf-8?B?THJZRnluQUZkRmtHZ1h1ZEFZWTdBYi9xWGVyUXY5ZFFrWTVVTDAvdTMxN3pL?=
 =?utf-8?B?QVJOdXptbHc5VXdVQ0xuQUc3WkRrb1NyUFJLZk1tcFY5OGVPSm13aWp3Mkdt?=
 =?utf-8?B?RFBQSVNsR3Q2elR3c01Lc0RMQUE4Q3N5cFVsbkh0MTBDTXBtTVc3U2FOTlgy?=
 =?utf-8?B?eFNKRVFzSE16MFUrQ1Fmbk1FelNqWE90YjREcWV6dlFRYXRJdDZSVlB6ZGQ5?=
 =?utf-8?B?ZEFDcUNtNXlaajlIQmVIRXF4R1phMHN1eVJrVmg1YVVpcVdCdFpmZ3QzNHBI?=
 =?utf-8?B?RUVTSTVEdHdkUGpyK2Q2N1pZbndoV3VHcWVYOExGa094TWRjaUNmb2lRQ0ta?=
 =?utf-8?B?SjNqU3IvK2lMQVNORkgzV01MN05EM0pUZnIxbjJuUk5pbFlqbklaTTVYZ1E3?=
 =?utf-8?B?TGhia3RiNmF0OHFPY1g1eHE4MkFMdnB1KzFCblFqTXQ4UTJYTTFmS29PcDhl?=
 =?utf-8?B?MmJMT0lnd3pXZTFPdUVBNnBtd0hlZGVMSzM0S3hsNXhneHcyNXJQdlp1TmZx?=
 =?utf-8?B?T3hjOExLaC9mSE52TVpNR3RBRXZEdUFFU0tVektRY2owb2U4Z3VuUzR4NXlh?=
 =?utf-8?B?b05ialh5WlVjNmRvR2UzQ1ZBaHc4NFNmUW8yU2xBYWRhUkFybklOZThJN0Jm?=
 =?utf-8?B?cUI4NnJUWjVpS00rejZYUHF3VHc0U0hGRjl1TTh0bGx1OW8xRmx3RkpqTjBu?=
 =?utf-8?B?VnlIVVV0VjNsVTBQbWI4R2hlWC9KQlgzRVlhV0ZqenFSRkx4ZTF1emx6K25q?=
 =?utf-8?B?WE9acUVKUzkwdFIzbUlIZysxOGZjNmE4TmFzTmpCMWVOZkwza2lzUVh4UTdh?=
 =?utf-8?B?ekVrbUM5R3loTkhtcmQ2Q2hyc1VWeVFxa0xDUzJKeTBadGVpaENjZjZEL0Mz?=
 =?utf-8?B?SUJEamQ4ZjFrOEc4TnhYcjJkL0tyZWtBZW84YW9neEE4R1doMlhKdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 938854b1-8eb6-4c63-c0cd-08de5a644b8d
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 09:46:34.5035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DL9zI6ilHWtRJsdUo6ANdoRNVKc8UThmvwwDVOkK7ffU5SJGvoBMNRpSydszPLFP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4176
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_014638_855976_5D71CCAD 
X-CRM114-Status: GOOD (  14.17  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 1/21/26 16:51, Andrea Scian via B4 Relay wrote:
> From: Andrea Scian <andrea.scian@dave.eu>
> 
> This just add some information on kernel log about the selected ECC
> 
> Signed-off-by: Andrea Scian <andrea.scian@dave.eu>
> ---
>   drivers/mtd/nand/raw/pl35x-nand-controller.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mtd/nand/raw/pl35x-nand-controller.c b/drivers/mtd/nand/raw/pl35x-nand-controller.c
> index fcb62b9ec947b..4ce4c6f59b827 100644
> --- a/drivers/mtd/nand/raw/pl35x-nand-controller.c
> +++ b/drivers/mtd/nand/raw/pl35x-nand-controller.c
> @@ -970,16 +970,19 @@ static int pl35x_nand_attach_chip(struct nand_chip *chip)
>   
>   	switch (chip->ecc.engine_type) {
>   	case NAND_ECC_ENGINE_TYPE_ON_DIE:
> +		dev_info(nfc->dev, "Using on-die ECC\n");
>   		/* Keep these legacy BBT descriptors for ON_DIE situations */
>   		chip->bbt_td = &bbt_main_descr;
>   		chip->bbt_md = &bbt_mirror_descr;
>   		fallthrough;
>   	case NAND_ECC_ENGINE_TYPE_NONE:
>   	case NAND_ECC_ENGINE_TYPE_SOFT:
> +		dev_info(nfc->dev, "Using software ECC (Hamming 1-bit/512B)\n");
>   		chip->ecc.algo = NAND_ECC_ALGO_HAMMING;
>   		chip->ecc.write_page_raw = nand_monolithic_write_page_raw;
>   		break;
>   	case NAND_ECC_ENGINE_TYPE_ON_HOST:
> +		dev_info(nfc->dev, "Using hardware ECC\n");
>   		ret = pl35x_nand_init_hw_ecc_controller(nfc, chip);
>   		if (ret)
>   			return ret;
> 

We are going in a way that we want to have less messages not more.
That's why please move it to dev_dbg() instead.

Thanks,
Michal

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
