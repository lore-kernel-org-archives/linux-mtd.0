Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C7F4FF60FB
	for <linux-mtd@archiver.kernel.org>; Tue, 31 Mar 2026 09:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:Cc:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Lr++nVEB+9VmJaFnZpwYp/rymb7T7mGFqKUeJSsStbA=; b=ck4MJ/+Eva+QsIWpHSaTefPvaa
	hhZ+NudqHkRdzbPgfXvPBWc/SIN3B/U0bPaPfQHkEgk3OiyuOUeQ5IK3hrlLPG6NuDg9lccRPCX+Q
	Dcrh9SI9TPeYwrAgM7yjC0gG17k0Qbh+5auwrYrp/0ndp0xcOb9uLOI6GXBnk88d3dzlyO9qm/OFt
	5NSB+G+Q5K6Sir17K9jaM7iwY96s4rJAsJ2aCKN6U5P701IsbbvdL2zeVY+Djy32W8PsfYe49TuiF
	YZ4Ekkm167OmOEHWczB7ODDebQnMbKEuqBKubIQp1KgMji/Ilmg+yv3Sy2sEO2TqhWYiLLfv8weEv
	yUivWcDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Vre-0000000Cj3N-1MDR;
	Tue, 31 Mar 2026 09:58:26 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Vrb-0000000Cj2z-3MeH
	for linux-mtd@lists.infradead.org;
	Tue, 31 Mar 2026 09:58:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ohXDfpgRknkkAx7SO+eyADE8e6Y8hh6lEa2vjs2FXi0sS6aVX1AieFLyQSwxgCZLUfJHKzjoP8sqXi0IrnOA/6gH53oE6mds4U9ZzCToSRxn/c/FGAxx7gRlgFsSU4bgAuqYa/Cz75VCnzAE6/EwpkJZDnJdIlaCK8aXD13FSzRQWq/ks4St6byny1t1b+TQ4Lrlfu4KDKxxxb9b8vEc2y1rX35xIYaQuE0aJGHURyHYBPm1JtwdACLuOJao72/tZhQTYU8OAXm/rTDSa8FNpkPDEWTTOHb/iG9imlVD6XUVJWZ1j6I5JjjyzIR2TKEZEar3DGR0kxfpsTdrY/1nGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VtzYOMcnnVQ1cBjTjqLj9JmfW2kd8R/QjumMdV0CA/g=;
 b=EuxTkOlbcLh3z+paLuePTsOe0A11Ey5g2tbhj4zFaVk+YBSseEeFGWWSy0/lD68qLPLowf2ZSugfU7A1KvsL28P5rzFGjjm1xbn1I1ehqmHy9ajO//W6SEnip1EodLxeDo9eCx8ybi7BPp3ZXJF/fGfqfofFMOKjOseFTYhEVUq+o5W1UsjbLD7csf69tHmSSHYtlhLk1mQo9CkOnUuVbb/PMyjZjvOQvRV0QUxhNLGyWDCDuVpSSbrBr9zheoMJ4sBvOjpGjY5ONc57yuMX7ZLqfz7Li30/VSLI0hjmhPp9FkhJfjwi8h5dgRQaJWGR4fWUxCkHgQHIymHnsJfXrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kontron.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VtzYOMcnnVQ1cBjTjqLj9JmfW2kd8R/QjumMdV0CA/g=;
 b=V3Xn2Bvw4BXoEWjghTfBqfe4J+2VpwdohJFE8mcOn+J+CB/MHsDzi3J5Fjkf1P7RQJ4mBO110bX6AzV+Y28OBUqLx3TUFZYAMnLS45dea80009ZIlC8LtahuIxqTXk2eJgxWzKkT3zYTVgC4Mq3KTn4a+0hC97E4ATcvRB+LEPrESlRA0pxWpKYzjH8IR9+9PSx45hJ7NwutOxV0cL267KHJPIOFKWKWLdJBtOoQj2ReTmWMe/z1ZqdKdarjSfVWWJd23OK7WHjXEAS1UtJ1mVhQ8CEEJ7MwbjJe2owllU5tnujfeHjeLfiMGjYS0M2gwrD4npAI6WNbwottG5wlEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fb::23)
 by DU0PR10MB7610.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:34e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 09:58:13 +0000
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22]) by AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22%3]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 09:58:13 +0000
Message-ID: <633fee13-a397-410f-a595-db95e04b8110@kontron.de>
Date: Tue, 31 Mar 2026 11:58:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 6/7] spi: spi-mem: Call spi_set_rx_sampling_point()
 for each op
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Frieder Schrempf <frieder@fris.de>, Mark Brown <broonie@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Han Xu <han.xu@nxp.com>, Eberhard Stoll <eberhard.stoll@kontron.de>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, imx@lists.linux.dev,
 Santhosh Kumar K <s-k6@ti.com>
References: <20260303-fsl-qspi-rx-sampling-delay-v1-0-9326bbc492d6@kontron.de>
 <20260303-fsl-qspi-rx-sampling-delay-v1-6-9326bbc492d6@kontron.de>
 <87wlzlnioh.fsf@bootlin.com>
 <a1a711c4-d9df-4bba-8831-2ec787f84cc4@kontron.de>
 <87ecl09wtv.fsf@bootlin.com>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <87ecl09wtv.fsf@bootlin.com>
X-ClientProxiedBy: FR0P281CA0153.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::12) To AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:1fb::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR10MB4277:EE_|DU0PR10MB7610:EE_
X-MS-Office365-Filtering-Correlation-Id: 60bc29af-990d-4bfc-eadd-08de8f0c05b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: On86BcW7tCwcWpj7ZkMkcd98Ana6/QSUYvJ8rlnGBgfxB/NVdGdjTkKGcrcHEhEdJwxyoBZoJqINiDku1bYKqOKrt+rpK+pWDO2MvDElnwTDJ7vJpVhsAbCGWqBQC1ldaL8a0S/N3pf0edBEq5Ky7bbPXtkdzQeY/OxOrM8hHOBwhqyMXo8SruqSHkhrqCElyiC1f7nXXWdC3ayfzwF+uUkfAHr4pvvQXw4nrCfj29ZLHIMRLhq9ftSEal8+w09DM0hXZTeckKpO1c6gKjkMbZyHEnWTN6fG45m4vXzwg/wEnRDe3eBlUlCMQ/sWEG1N5hcFiXsvggEjyjUgGEJKZoJfOr0AtB+2y2B4TNGa/J8U/2X4DOgT/Rx5yt1asWQ19qv9H4nosFEhvaOZzyKrcqmtD7aG1DJEbySpjxxSGsfSjrJjjnUfRDa7I1qYb3U5mYkv25TWqNTwCS/7E2vxKK7yakeYGc41o0XSreau7Vgl1LdQfrPn95Up4kpEN24Z3/+Lweckj8Pkv0eEKLlsH3Bwxbx3ZAiNq13wNmzS4H8COfAdZWwUyYZc/n+2dd0jH5vhIww6Bi9AFwOshTigXQxShtx4uVzfjOEELFXLy8pFYmhMOFnbv6A8W1gc5rpOavJfBlptHBuSaqkGoNO8PTDuS/MU+KKVgHBNJXPzlGZBXkIU9bitpCBVo2J7Cgztjzof39NpSNzDbcPiNRjPcfp+QS2t+wcwkrX5AJFNlEA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVl6d1V0Q3VGSnNzQlZlM1habEhwNnl2TGgrUU4rTXR3Nk1LQ0piWkpSeDk5?=
 =?utf-8?B?TUwvUnRPQjJ3Tit2Yk9teGZXUGsvRTdzQjdyblR6WWQ3NmlnL3QveEtrRCta?=
 =?utf-8?B?K3lFSXFwQUpSSERFcndlNzU0L0o3K3p0akI2b1FZcnR2VStzbTltQ2Z5U0du?=
 =?utf-8?B?bVYxSURLc3dGdEM4WENGSUhjcDYwWDBSWVM4dXE1a1lFYmoreG5ocS9rcHNq?=
 =?utf-8?B?SUQyV2RoLys4aVpPUW01b09WZjV6T3ZRZ0dSWFJwbHJjbW44TWNhdUdJN293?=
 =?utf-8?B?RTQ3aEtXVmlqRmNodDg3UzBjd25BYWh5dTdEYlAvRmRhcW1wa3FNOXR1K2hn?=
 =?utf-8?B?UURNcERDL05sTlZheVZUUEhVT3JoUFdKNmkxeUR4YmdhVWs0cThlM0lsYk9F?=
 =?utf-8?B?T1UzSThoQkgxQTFhY01zNFQvT1JzaWhEeHdWb3dNSGppbDI0bEpXaUYxS2xk?=
 =?utf-8?B?MVBPWjNqOGM0ZEFoVDgvb0pVNDVhRTBrWG1YZkdsQmx3UUNrY3IyVFNWNEk0?=
 =?utf-8?B?dXdaTWNYSHpEOEhDYjdQVHF4bjlSZ3V4bHo3RGxXMjZZNk1QU21lS2lCaVVF?=
 =?utf-8?B?SlJ6c0NrYTFIZWdnYm9xR2VBK3k5Q3pGL2RBUW5CRzZtNlVZV3lpVkVSd3Rh?=
 =?utf-8?B?Y0M1bS8rM2J0N2tkdXdYV2kvNE9YU3RGQWZuVnBuUEE5Qkh5QU5HR3NtZUJB?=
 =?utf-8?B?Y2ZobDFmdjlDaC9NcjNhZFhVRnBqTmljVURvdEJ1M3FhR0M4Y0RpZWVTTDZu?=
 =?utf-8?B?TW9SeW0wNXZWUmR0T2dyTlpDYzc2YXU2Nm5NWmhOdTRZR0RaV2tGQVl1bHZK?=
 =?utf-8?B?NkMrOXNSOVFLSkZWWGU1Vk1rSXloQTVtTTBrTGg2M3gzbERlN1NEeTZSdzlw?=
 =?utf-8?B?Zmw1WlQ0YmRGM0ZNYUtVR2ZhQWxISVJSTDgwQXdTNlgxUGQ5MXN6MHh6ODJi?=
 =?utf-8?B?RWFUako4WE9qTWI4L2xENDlCSVRhSWd6VmNyZzQveWIzajNIOTdPenU4dnhH?=
 =?utf-8?B?NEdZY1JSWndGSHJLNGlrNFR6aWpMQ3pMOWIxVDVXQ29WdEZodFVpRU81dWJ6?=
 =?utf-8?B?Um9DeXVBRE5oNjRjQlZxekxtS0ViNFRJOWVPTi8vUHJXaFhBUVhkME53UzJh?=
 =?utf-8?B?YzdsNkc5SzV1dlNYcVJsMHhIOW5USGpseU5rV1djbWM5OHQ1RktRb1JnZDgz?=
 =?utf-8?B?d2hhbDU0NTNIaGpjdWVVRWRlbG1jcG1EaXdlK1lXOVV5TjdmNlpLdWtqVWZH?=
 =?utf-8?B?TVprSzVSRnhneDNYZndYVVhGOG14aXlpYm0xaWIzYnhpN1dBT1dlRDgwbmdu?=
 =?utf-8?B?NEQ1OTUyaFIxMkZ4OHpsTnhxeDkya3psRWZXNDFQQ2FobzRSWEJIRW5WbnJV?=
 =?utf-8?B?eXdhUERRSmM2L0N1TG8zbFI0QmtwdEtYL0x5dlo0MmJHYmN2cUNhQmNDcWNT?=
 =?utf-8?B?YTVzb3U4QnN0L2VBZWRjK2xWTmJORmQwNGlOTjRZVjdUdE5iRUZUUEQweHYy?=
 =?utf-8?B?akhDdE8vQ0xNTEIvQU1TdEtRWjQxWjdNd1p3blBOWjN1QldQZ2lOd0RXYktw?=
 =?utf-8?B?djd4U1RZeTg5bUl3T25zVDd6S3NKaWhNdHJ2bnNSL0VQejI2ZjJrRm0vcXBt?=
 =?utf-8?B?RS9naDROWlRyb0syZGJlSlgvRTZkZlltOXhhQmhld1VZUHY1OEZGNFJIbk83?=
 =?utf-8?B?akRyVmVOSXBkMUV6RHFRRmhnNjFsbTYwTnJqazU1ckZlb0lpUUt0dVlzd05x?=
 =?utf-8?B?ZnQ4Um9RV09HdGxVSGY1eFJoUzF0UDRnQm9tTGtTQ0R2UzJlSlRXUFhNSVlZ?=
 =?utf-8?B?c3lwMHBjenYzNFMyYkowZmpPNDlubHc0bENIOWRWQThjYkg4VzNmbldpSFpj?=
 =?utf-8?B?L1ZDUklEbXNqQjhTTms2K2h0RlJITWwrT0ZrMzhYcjQ0bHp1Y08ybGd4alRI?=
 =?utf-8?B?aDlnWDJQcVZDYzFIemNaa0F1b25ZNEEwcmdRTUV0dXc4Nk9QSTQ5ZjdFQ2xE?=
 =?utf-8?B?K0J5bFcyYjRaSmFGaTQzLytPb0dncFJoMzdDRnkvbkVHTG1XMmJzUGRrd2Ri?=
 =?utf-8?B?T0Z4RzBFZjM1d3I0SG1yc2VHMmFDY0VDcFhNWjZOQVhMRm5xc0h4M0hWanR3?=
 =?utf-8?B?SWlnemtNWklacE1FZVRSOS9jcVZ5a1Q1bDVhblo3SGg0SnJOa3JlZEhyS0p4?=
 =?utf-8?B?UDdhWWVFU2VEUkFyZVVXbEtqa2ZIZG1naHJZZ0xxeFFqVnhva0FZKzZQUlJO?=
 =?utf-8?B?anpCUzYxbkpvU2hpdzBUZ0h3V2tyVjhabkZnaG9GQjFwU1hBb3NXNFB4NVg5?=
 =?utf-8?B?RDFlV0x4bG14eVdTRDgrMkpqY0hNMThkK1hqbWpRRFFrVVVBaE5PZXlzSWxK?=
 =?utf-8?Q?mdxbx/3frZPaG234=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 60bc29af-990d-4bfc-eadd-08de8f0c05b5
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 09:58:13.2814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IWhL6qEhpyvWO62H1DJMzFVGJk+r2fkWJXwcE8o9wLcoUB5+UgH5El8uofKYWEA5S8zZ4PxbUlGAOAUR6vqOspZjcvwPi07iBdfTT9iO6tg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7610
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_025824_200204_2D193B35 
X-CRM114-Status: GOOD (  28.21  )
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

SGkgTWlxdcOobCwKCk9uIDMxLjAzLjI2IDExOjIzLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhp
IEZyaWVkZXIsCj4gCj4+IFRoZSBzYW1wbGluZyBwb2ludCBkZWxheSBpcyBjb3VwbGVkIHRvIHRo
ZSBjbG9jayBmcmVxdWVuY3kuIFNvIGlmIHRoZQo+PiBjbG9jayBjaGFuZ2VzIHBlci1vcCwgd2Ug
YWxzbyBuZWVkIHRvIGNoYW5nZSB0aGUgc2FtcGxpbmcgZGVsYXkgcGVyLW9wLgo+Pgo+PiBJbiBn
ZW5lcmFsLCBpZiB3ZSB3YW50IHRvIGF2b2lkIHN3aXRjaGluZyB0aGUgcGFyYW1ldGVycyBiYWNr
IGFuZCBmb3J0aAo+PiBpbiBjYXNlcyBvZiBhbHRlcm5hdGluZyBvcHMgd2l0aCBkaWZmZXJlbnQg
bWF4IGZyZXF1ZW5jaWVzLCB3ZSBzaG91bGQKPj4gbWF5YmUgZG8gc29tZSAibWluIG9mIHRoZSBt
YXgiIGNhbGN1bGF0aW9uIGFuZCB1c2UgdGhlIHJlc3VsdGluZwo+PiBmcmVxdWVuY3kgZm9yIGFs
bCBvcHMuCj4+Cj4+IElzIHRoYXQgd2hhdCB5b3UgbWVhbj8KPiAKPiBOb3QgZXhhY3RseSwgSSBh
bSBub3QgYWZyYWlkIGJ5IHRoZSB0aW1lIGl0IHdvdWxkIHRha2UgdG8gc3dpdGNoLCBJIGFtCj4g
YWZyYWlkIGJ5IHRoZSBsaWtlbGlob29kIHRoYXQgYm90aCB0aGUgUEhZIHR1bmluZyBzZXJpZXMg
YW5kIHlvdXIgc2VyaWVzCj4gbWlnaHQgd2FudCB0byBmb3JjZSBhIGRpZmZlcmVudCBtYXhpbXVt
IGZyZXF1ZW5jeS4gRm9yIGluc3RhbmNlIHdpdGggVEkKPiBkZXNpZ25zLCB3aGVuIGVudGVyaW5n
IFBIWSBtb2RlLCB0aGUgZnJlcXVlbmN5IGlzIDE2Nk1IeiwgcGVyaW9kLiBZb3UKPiBjYW5ub3Qg
bG93ZXIgaXQgYmVjYXVzZSBieSBkZXNpZ24sIHlvdSBieXBhc3MgdGhlIFNQSSBkaXZpc29ycy4K
CkFoLCBvay4gSSBkaWRuJ3Qga25vdyB0aGUgUEhZIG1vZGUgYnlwYXNzZXMgdGhlIHVzdWFsIGNs
b2NrIHNldHVwLgoKPiAKPj4gV2UgY291bGQgZXZlbiBzZXQgYSB0aHJlc2hvbGQgdG8gZGVjaWRl
IGJldHdlZW4gdXNpbmcgYSBjb21tb24gIm1pbiBvZgo+PiB0aGUgbWF4IiBmcmVxdWVuY3kgb3Ig
ZG8gdGhlIHN3aXRjaGluZyBwZXItb3AuCj4+Cj4+IE9uZSBvdGhlciBwb3NzaWJpbGl0eSB3b3Vs
ZCBiZSB0byBzb21laG93IGNhY2hlIHRoZSBwZXItb3AgZnJlcXVlbmNpZXMKPj4gYW5kIGNhbGN1
bGF0ZWQgc2FtcGxpbmcgZGVsYXkgdmFsdWVzIHNvIHRoZXkgY2FuIGJlIHJldXNlZCB3aGVuCj4+
IHN3aXRjaGluZyB3aXRob3V0IG11Y2ggb3ZlcmhlYWQuCj4+Cj4+IFRoZXJlIGlzIG9uZSBtb3Jl
IGlzc3VlIHRoYXQgaXMgbm90IHlldCBjb3ZlcmVkIGJ5IHRoaXMgc2VyaWVzOiBCZWZvcmUKPj4g
c3BpbmFuZF9pZF9kZXRlY3QoKSB3ZSBkb24ndCBrbm93IHlldCB3aGF0IFJYIHNhbXBsaW5nIGRl
bGF5IHZhbHVlIHRoZQo+PiBjaGlwIHJlcXVpcmVzLCBidXQgd2UgYWxyZWFkeSB1c2UgcmVhZC1z
dGF0dXMgYW5kIHJlYWQtaWQgb3BlcmF0aW9ucyBhdAo+PiBtYXhpbXVtIGNoaXAgY2xvY2suCj4g
Cj4gTm90IGV4YWN0bHkgIm1heGltdW0gY2hpcCBjbG9jayIgYXMgaW4gU2FudGhvc2gncyB3b3Jr
LCBidXQgaW5kZWVkIHdlCj4gcnVuIHRoZXNlIGF0IHRoZSBmcmVxdWVuY3kgZ2l2ZW4gaW4gdGhl
IERUIGFzIGJlaW4gdGhlIG1heGltdW0KPiBmcmVxdWVuY3kuIElmIHRoYXQncyBub3QgY29ycmVj
dCwgeW91IG11c3QgbG93ZXIgaXQgaW4gdGhlIERULiBUaGF0IGlzCj4gd2h5IEkgYW0gaW4gZmF2
b3VyIG9mIGhhdmluZyB0d28gbWF4aW11bSBmcmVxdWVuY2llczogdGhlIHN0YW5kYXJkIG9uZSwK
PiB0aGF0IGp1c3Qgd29ya3MsIHdoaWNoIGlzIHRoZSBvbmUgZm9yIG5vbiBvcHRpbWl6ZWQgc2V0
dGluZ3MgKHRoZSBvbmUgd2UKPiBhY3R1YWxseSB1c2UgdG9kYXkpIGFuZCBhbm90aGVyIG9uZSwg
d2hlbiB0dW5pbmcgdGhlIGJ1cyB0aW1pbmdzLgo+IAo+PiBGb3IgZXhhbXBsZSBvbiBXaW5ib25k
IFcyNU4wNEtWIHRoaXMgbGVhZHMgdG8gZGV0ZWN0aW9uIGZhaWx1cmVzLiBTbyB3ZQo+PiBzaG91
bGQgbWF5YmUgaW50cm9kdWNlIHNvbWUga2luZCBvZiByZWR1Y2VkIGNsb2NrIHNldHBvaW50IGZv
ciB0aGUKPj4gaW5pdGlhbCBkZXRlY3Rpb24sIHRoYXQgaXMgc2FmZSB0byBiZSB1c2VkIHdpdGhv
dXQgUlggc2FtcGxpbmcgZGVsYXkKPj4gY29tcGVuc2F0aW9uLgo+IAo+IFRoYXQgc2hvdWxkIGJl
IHRoZSBEVCBtYXggZnJlcXVlbmN5LCBubz8KCkhtLCBJJ3ZlIHNlZW4gaXQgdGhlIG90aGVyIHdh
eSByb3VuZC4gSW4gbXkgcGVyc3BlY3RpdmUgdGhlIERUIG1heApmcmVxdWVuY3kgZGVzY3JpYmVz
IHRoZSBtYXhpbXVtIGNsb2NrIGZyZXF1ZW5jeSBzdXBwb3J0ZWQgYnkgdGhlIGNoaXAgYXMKZ2l2
ZW4gaW4gdGhlIGRhdGFzaGVldCAoYXNzdW1pbmcgdGhlcmUgYXJlIG5vIG90aGVyIGxpbWl0YXRp
b25zCmludHJvZHVjZWQgYnkgYm9hcmQgZGVzaWduLCBldGMuKS4KClRoZSBSWCBzYW1wbGluZyBk
ZWxheSBpcyBhIHRpbWluZyBwYXJhbWV0ZXIgc3BlY2lmaWVkIGluIHRoZSBkYXRhc2hlZXQKYW5k
IGl0IGlzIHJlbGV2YW50IGluIG9yZGVyIHRvIGludGVyZmFjZSB0aGUgY2hpcCBhdCBtYXhpbXVt
IGZyZXF1ZW5jeQp3aXRoaW4gc3BlYy4KCllvdXIgYXBwcm9hY2ggd291bGQgbWVhbiwgdGhhdCB3
ZSBuZWVkIHRvIG1hbnVhbGx5IGNhbGN1bGF0ZSB0aGUgbWF4aW11bQpzdXBwb3J0ZWQgY2xvY2sg
ZnJlcXVlbmN5IHdpdGhvdXQgUlggc2FtcGxpbmcgZGVsYXkgY29tcGVuc2F0aW9uIGFuZCB1c2UK
dGhpcyB2YWx1ZSBpbiB0aGUgRFQuIFRoZW4gbGV0IHRoZSBkcml2ZXIgaW5jcmVhc2UgdGhlIGNs
b2NrIGlmIFJYCnNhbXBsaW5nIGRlbGF5IGNvbXBlbnNhdGlvbiBpcyBhdmFpbGFibGUuCgpUaGlz
IHdvdWxkIGhhdmUgdGhlIGFkdmFudGFnZSwgdGhhdCBldmVuIGJlZm9yZSBpbml0aWFsIGRldGVj
dGlvbiB3ZQp3b3VsZCB1c2UgdGhlIGNvcnJlY3QgY2xvY2sgYnkgZGVmYXVsdC4gQnV0IGl0IGhh
cyB0aGUgZG93bnNpZGUgdGhhdCB0aGUKY2xvY2sgdmFsdWUgaW4gRFQgd29uJ3QgbWF0Y2ggdGhl
IGRhdGFzaGVldCB2YWx1ZS4KCkluIG15IGFwcHJvYWNoIHdlIGFzc3VtZSB0aGUgZHJpdmVyIGlz
IGFibGUgdG8gdXNlIHRoZSBtYXhpbXVtIGNsb2NrCmZyb20gdGhlIERUIChzYW1lIGFzIGluIGRh
dGFzaGVldCkgYnkgdXNpbmcgUlggc2FtcGxpbmcgZGVsYXkKY29tcGVuc2F0aW9uIGFuZCBvbmx5
IGlmIGl0IHR1cm5zIG91dCB0aGUgY29tcGVuc2F0aW9uIGlzIG5vdCBwb3NzaWJsZQp3ZSB3aWxs
IGxvd2VyIHRoZSBjbG9jayBkeW5hbWljYWxseS4KCldoYXQgaWYgd2UgZG8gdGhlIGZvbGxvd2lu
Zz8KCjEuIEFkZCBhIHBhcmFtZXRlciBpbiB0aGUgU1BJIE5BTkQgY2hpcCBkcml2ZXIgdGhhdCBj
b250YWlucyB0aGUgbWF4aW11bQpzdXBwb3J0ZWQgY2xvY2sgZnJlcXVlbmN5IGFzIGdpdmVuIGlu
IHRoZSBkYXRhc2hlZXQgYXMgdGhpcyBpcyBjbGVhcmx5CnRoZSBiZXN0IHBsYWNlIHRvIGtlZXAg
dGhpcyBkZXZpY2Utc3BlY2lmaWMgcGFyYW1ldGVyLgoKMi4gQWxsb3cgdG8gbGVhdmUgc3BpLW1h
eC1mcmVxdWVuY3kgaW4gRFQgdW5zZXQgZm9yIFNQSSBOQU5EcyBpbiBjYXNlCnRoZXJlIGFyZSBu
byBib2FyZC1zcGVjaWZpYyBsaW1pdGF0aW9ucyBhbmQgdGhlcmVmb3JlIHRoZSBtYXhpbXVtCmZy
ZXF1ZW5jeSBzdXBwb3J0ZWQgYnkgdGhlIGNvbWJpbmF0aW9uIG9mIGNoaXAgYW5kIGNvbnRyb2xs
ZXIgY2FuIGJlIHVzZWQuCgozLiBCeSBkZWZhdWx0IGxpbWl0IHRoZSBjbG9jayBmcmVxdWVuY3kg
Zm9yIHRoZSBSRUFEX0lEIG9wIHRvIGEgc2FmZQp2YWx1ZSB0aGF0IHdvcmtzIGZvciBhbGwgY2hp
cHMgYW5kIGNvbnRyb2xsZXJzLCBldmVuIGlmIFJYIHNhbXBsaW5nCmRlbGF5IGNvbXBlbnNhdGlv
bnMgaXMgbm90IGF2YWlsYWJsZS4KCjQuIEluIFBIWSBtb2RlLCBjaGVjayBhZ2FpbnN0IHRoZSBE
VCBtYXggZnJlcXVlbmN5IChib2FyZCBsaW1pdGF0aW9ucykKYW5kIGNoaXAgbWF4IGZyZXF1ZW5j
eSBiZWZvcmUgc3dpdGNoaW5nIHRvIHRoaXMgbW9kZS4KCkkgaG9wZSB0aGlzIG1ha2VzIGF0IGxl
YXN0IGEgYml0IG9mIHNlbnNlLiBJJ20gcmVhbGx5IG5vdCB5ZXQgZmFtaWxpYXIKd2l0aCBhbGwg
dGhlIGRpZmZlcmVudCB1c2UtY2FzZXMgYW5kIGxpbWl0YXRpb25zLgoKQmVzdCByZWdhcmRzCkZy
aWVkZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
