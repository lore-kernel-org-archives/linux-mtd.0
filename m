Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B6BC433FE
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Nov 2022 15:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0wDreYbGALc97Z/PG2qUm9vJuVNStRyVY2DmRJJd2So=; b=mK5gWtrAwlwinQ
	smOXOoJfGX0YAYG8jyKSbiNTYoYmvy+CiqGpIIgfAZVQpBTBmD9HXRHPlJ0iBnKlI+0GWS1eJDKw5
	7aYVAKK6CnB+5qXy/O+tb5zUdenbpUvGZIC+UQ08ICUSAtRVObPEQ6z6CLRd6cTt4suJNWSQfJhSQ
	UYQlAsp3CGCRWMIS2l6+4wP2HuEDAE6YX2uDvGDjdh/vzBd4JIDDcjeBij3ZTq9zwMuj8pYY+Pc2g
	/hf/yzmNa9X/7DBy+yIOsNvQP5XofnX8lU66ID02qZhPPekdywyC7kw7D2A1iT0/Q40uxg4YZtcmO
	Ti2ZF6/GHgjeHlYqn5OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqFfd-00BlIX-CX; Wed, 02 Nov 2022 15:28:49 +0000
Received: from mail-dm6nam10on2120.outbound.protection.outlook.com ([40.107.93.120] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqFfY-00BlHM-4e
	for linux-mtd@lists.infradead.org; Wed, 02 Nov 2022 15:28:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=djqmXNuHBJ3LhQXZGEoXN/lr3y7n4eWzd4OH8ZnUGJE6GSgjj9xoO5Wc+FQnqtstPqEtrFpEyBB6hc96p/wJpjUScWzsb9zhvqU41V7WOm+CL8vd950A0PspZGM5QNka4n1PwrnBzozgMiJAJI8TP0prOSPNhMHAECjRwIqF+Sl0vA6VYwtHSmZItHnmt4X+ALeCK8RjZhcifBQrEBABZlPG/YGtj1XmwQyKAS1I5vHIz2mPzwXF7M6njfI8tzQRR4SmehT7+wurybVmLf9zJO8l3beE/22TGvqdF8Ib6rvYtpTr7PZLutarphOX5TvRYvM8X0rof+j9mDBUi/QD3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3tegK65dZbB3Y5mL2eHnljm4Wlj6aB4PBC/8FJKZeXQ=;
 b=FTvP9yylAAwGa8mAwqQmgzHNMtAizZX0B7s1VBQMunDhlP7+Q7CYNAnh1JZdT8jqxWtetrlUveUKOXslodMVM7Jl6/j6YBYZehpsPwIlhDrTthg5xw7CpKPEihFViX/wf9Qe0rzGGrnD3KgnOaC+yJjJpxh8Xgno8MaKn8K32FwgD/sMIWAf7XUgXeiHVrdMgYioIafPjAntqg8vCpjVFtjmF2sqLvgtYF3xcMGty/gkXHXZc6P6vAJDLFf4hAc8q7R0H0aAmPXON3TywHtTgnv14Yd0kULkqpJm1l0x3ocukbU4wgjAOot6kKnGF5/D7HGAc4POH+8sBaMpeQyL7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inadvantage.onmicrosoft.com; s=selector2-inadvantage-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3tegK65dZbB3Y5mL2eHnljm4Wlj6aB4PBC/8FJKZeXQ=;
 b=EYlvpF+d9zz2I9Mu3RvpHgk8GJzAam39WwUyG8+c08rzHimxJG4xBZSCBtDXvHwj3nEVSqIsb5NJo705kkZ4DYj6L8GdYIcXFFBthnWrd53FDkLX/OkH2qtYgin6Zaw5xthdR9yVWv0g6jHG4cLLX93e2uSsfvMrQTZ6ZjAOQZQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37) by CY8PR10MB6874.namprd10.prod.outlook.com
 (2603:10b6:930:85::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Wed, 2 Nov
 2022 15:28:38 +0000
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::a8ed:4de9:679e:9d36]) by MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::a8ed:4de9:679e:9d36%4]) with mapi id 15.20.5769.021; Wed, 2 Nov 2022
 15:28:38 +0000
Date: Wed, 2 Nov 2022 08:28:25 -0700
From: Colin Foster <colin.foster@in-advantage.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Roger Quadros <rogerq@kernel.org>, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, Pratyush Yadav <p.yadav@ti.com>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Richard Weinberger <richard@nod.at>
Subject: Re: Barebox / Kernel Omap ECC inconsistency?
Message-ID: <Y2KMmVUOxspp+1Xu@COLIN-DESKTOP1.localdomain>
References: <Y2FvB5D0K4MBii8N@COLIN-DESKTOP1.localdomain>
 <ec160658-e251-bfdc-05ac-631bd4c716dc@kernel.org>
 <20221102141400.31125365@xps-13>
Content-Disposition: inline
In-Reply-To: <20221102141400.31125365@xps-13>
X-ClientProxiedBy: SJ0PR05CA0204.namprd05.prod.outlook.com
 (2603:10b6:a03:330::29) To MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2351:EE_|CY8PR10MB6874:EE_
X-MS-Office365-Filtering-Correlation-Id: 31c8eea7-43d3-47c2-7822-08dabce6e95c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	EDbSPJ/PYIZvfT1uz9OFY3scMP33Ezd5UQSSEXSQsusDiQp6hFsYYCkc7gnYCE+8/0WnfuzP/jDdFSE65YNlvzwscYW3nz+FzxcvelMRADZ0fonmT/DPzACFDpzCo64R45RIyRtIHLOQVkCJGQsm8pkzwm5lxBTX/TMUTbOLpIneeqSfN4jZMBV/ezUeL102IxopvtPfGNhF3+CTy+p6TmyirJVYfdc9G2ob1bojYIPLejjjEMWcsafgmRIl24bCoIN2ZgW6vAMfwjoaEd21schTCRuQL7TSdUQMHHAqkmTzLew9dftSLnowZRV8dM6ZIFjUXfIb7DnWogvUIL/ioJTnazJynz0lkRjqfNDmMjw+N/x4u3zQl3yRi0SuuW6WhufitvyYg+lZ3HG4Z7A35DzQfs89c4KeLwcvUOyMu0gneLHVieB+hz1jHuKdCrNsHDTzeS5IxLVZ0xDE9q5CZ0qY0XVLpnw6MpqcqGGDuqJJNA8ykm4rOHOfz4DKDOhPFrxluUIxIkdQtxp8aCItqXmS3Kb0YN1EoUIA1UbHvNn2MKWO8xvx9gD9StU+x7I6ujIj84BCWf3MsrW/1iU0MeLyqE/jPbQVpa9v1TbkpdD/+70Sc5LE49p/VkRgYZ4zVBcCVbgSB5m3PqW6xn63gCtEzVZnnbfIUhlvk9XF6PpF9E7KLSRRY3uW/JjhcviJIsSQEMB3XLGZMhHCKXFaOofYUxVijqMTv9Mgbk4wrHHFaHBcFbv/Y8Pg68ieFcHyI/BBO20cC0D2Pqto7kngZjliki1rf6XRcZ5RjucWHhY=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2351.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(376002)(39830400003)(136003)(346002)(366004)(451199015)(966005)(6666004)(478600001)(66946007)(8676002)(53546011)(6916009)(316002)(66556008)(54906003)(86362001)(66476007)(6506007)(9686003)(66574015)(4326008)(41300700001)(26005)(8936002)(6512007)(83380400001)(186003)(2906002)(6486002)(5660300002)(44832011)(38100700002)(67856001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?MGMyNnJEdFJ1bTB0ZUExakdqd0g5cnpNSnFtR1lBV0g4WGtXdG01QTIyRFNq?=
 =?utf-8?B?L0VxNVp0NXgyTHZMejRNUWRna3pCeTI2QlIza2E3RExyY2hES29KS0dqdVNq?=
 =?utf-8?B?SXVWYmN4b2VLSFgrOVJuNnRMRGRYNDBtNkxMSlJhdkQzTWd4eDE2RVdJeG1O?=
 =?utf-8?B?anp1S1FYR3FjWWc5NGk0YjlCVzAvTHdsVTJ0UFFYUDRRWi9mVzZLUmtQWTl4?=
 =?utf-8?B?U3ZycytGbmdSM2ZUTjh5YkpYc25SL3hxWXNtaVRIK2N6OXl0d3pZZFZyVmdH?=
 =?utf-8?B?Z3hFSStNSmw1RERtVG92Q08zTjdYK00raW5QYkpHa0IySFJhK294N2ZzNXVx?=
 =?utf-8?B?cHN3T2VGVmU4blQ1TTNDanlKb0k5RTUxcGFBK2RqczQ0VnNYZFV1WUhVanlH?=
 =?utf-8?B?ZTBJbmNaRVY3aDhFT1lkVWgvL3VaMFpBcnZQbEwyOVhJS0hGLzFWVUtYelRB?=
 =?utf-8?B?eXBWQktFcWZLblBHU2dhYkRJUkMvZWhHT2FTWVp6djBxS0QvVTZaUUtEYUhH?=
 =?utf-8?B?bWJrVUNUeWJZTmFNZkt5OG5oTFVtTEFSQ0lDYjNkWXMrVHV5N3FJdTN3UUs3?=
 =?utf-8?B?MnM0bEJtcy93WHN6c1FwN0k2cjdQQTVvMDVpRFRIaFVUdHRuS3I0RnUvL0pz?=
 =?utf-8?B?MEdqSkpDMUtIcEtWUElMMDdZeXNnRUhkMFMwZXFTQXRCYzVEaVJ2K09zeGtz?=
 =?utf-8?B?a2RQeEVLamdMT3JldTdIU0lyVG1ab1dhdXZwazdyTUd1RWdNNXc3N0RkRXNa?=
 =?utf-8?B?eGxKbDFiQjJPU0VGYXk1S0w0cEtPS01STmY5QVoxWjhMc1NQY2N4VGVVU250?=
 =?utf-8?B?Z0ZUYTAxL1c0c28rQ2tRQTBVbkgyT2xvQVJSK3NjZGJ3SVlUS2dxY21aNWVE?=
 =?utf-8?B?bUYzWUdaem5BVW4ydHRhWUZnQnFVemtXeHBOTUpDT091UHIrWEQ3QnIrRlk0?=
 =?utf-8?B?TExybHdOMFZLd3d4dDgybVczU05jOVBtcFZsUW5zSlU2RmlaamVoNVBXSUlx?=
 =?utf-8?B?MFpqanhxRHBuSnNUcGlmR3VneEFOZUtQWWl4YmZxdFdGNGEydkZGR1dVR2cv?=
 =?utf-8?B?WkVrN1RqdHZ4OUIrMldhTWs2bzUwU01VRFg0d0ZjNW14aHFITDNLZzJ5bTIw?=
 =?utf-8?B?anpVa3lNYUpCWWx3dEgwaWlnVWhNUzdUbnlXdW9vUkNWV1RXYzVGMklZSnlS?=
 =?utf-8?B?MlZHM3BDUzNVRitiMWx3b2wvYlZzNFkxcWdId2JCNWlyRmx4dWZmNmt5ek1j?=
 =?utf-8?B?ODRCZ2cxU1FydUR0TWgveGJVN3FOMjF0QW5oUy9BVkdZejU1OWJ1TFg1Y1l5?=
 =?utf-8?B?RnduZjFxbmhKUFE1ZkU4dXJ5WWVHK0I5MUtodGJ4TnRWOGFGT0wyOXNrak1Y?=
 =?utf-8?B?bVRUNzNreE4waWE0K0dyYmk5a1BWR2crVUEvckFOWU4zMGRYZDE3M2tOUnVv?=
 =?utf-8?B?NWR5dGk0SDZhdjdiK1ZkTGh6aGtyWHBIRnM3OEtLaEdXMnRmKzFSUURHSWlp?=
 =?utf-8?B?aHVaaE9QUjNtejUweWVDVnRTdExwOUFlRFdqdi9uSzgyS2VrRDBMSTdZMk1p?=
 =?utf-8?B?UHlBM1JJYUl6YVFmWnBxc1Q5NnAzNTIrcFZ4OGtzVThvV2VpNlY2RXRFS01h?=
 =?utf-8?B?QjNtTUNNemwwYThmMGFhL25sZnByekVvcnArMEYvSzZFdktyYk5UOHZ0WWpK?=
 =?utf-8?B?SXRKREVCV2Jvd3c4QjU0eU16cXl0b2FRL0t6YjZuYzV1Q2hlMnF1eWhnNndQ?=
 =?utf-8?B?bDYyYnpxbnB3U280NWxuanNScjBjVDNsYzFSNFpCWEVjeG5wNElRdUVOOFM0?=
 =?utf-8?B?Y2VDOUY2T1dEUG9uUllKY1VLdjJxTTZsbXN2cGVjNGg0Tm9YR0I5blJPT09t?=
 =?utf-8?B?SzhZNW1LSmp2L1ZSVUFDcWRIU2RMcFp3eTgxcFMweGNQTHdvRG5vZ0NTZ04v?=
 =?utf-8?B?eTA2QldXdVllZ29aNzBhRmR0YWlkQWFseUtsZWNINDhHbFdjTXN0STdGUytu?=
 =?utf-8?B?YjBZRTVxa1RGeHBYdjlBalJseEdsVWc2dUp6N1pYR0tRMkUzNWNkbURscWxI?=
 =?utf-8?B?L09NSzN3Nll6d2g2cytXV2lsWHNPMlkvQUtzZ00vRFY1VU9HOW1paGNuNytz?=
 =?utf-8?B?UDkwU1dha0VXdXFlelNEUVlQcm5KZkNLNk1CTmFyUkxxVFQxZ2ZFNU5mdndG?=
 =?utf-8?B?Unc9PQ==?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31c8eea7-43d3-47c2-7822-08dabce6e95c
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2351.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2022 15:28:37.9528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /IQiRSD5JHXcGojF6/fjSvYAl/G4HDokdRvkV+PyfG8ea/HFYo10hxxxysYmZGS5WPnNVcKYsBkaClzIUayi4LVRnNEQWpH4m2HcfiaNUbc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6874
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_082844_433987_922515A0 
X-CRM114-Status: GOOD (  31.82  )
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

T24gV2VkLCBOb3YgMDIsIDIwMjIgYXQgMDI6MTQ6MDBQTSArMDEwMCwgTWlxdWVsIFJheW5hbCB3
cm90ZToKPiBIaSBDb2xpbiwKPiAKPiByb2dlcnFAa2VybmVsLm9yZyB3cm90ZSBvbiBXZWQsIDIg
Tm92IDIwMjIgMDk6MTI6MjcgKzAyMDA6Cj4gCj4gPiBIaSBDb2xpbiwKPiA+IAo+ID4gT24gMDEv
MTEvMjAyMiAyMTowOSwgQ29saW4gRm9zdGVyIHdyb3RlOgo+ID4gPiBIZWxsbywKPiA+ID4gCj4g
PiA+IEknbSB0cnlpbmcgdG8gcmV2aXZlIGEgcHJvZHVjdCB0aGF0IHJ1bnMgb24gYSBQaHl0ZWMg
T01BUCA0NDYwIFNPTS4gSQo+ID4gPiBzdWJtaXR0ZWQgYSAuZHRzIFJGQyBhIG1vbnRoIG9yIHNv
IGFnbywgYW5kIHBsYW4gdG8gcGVyZm9ybSB0aGUKPiA+ID4gc3VnZ2VzdGlvbnMgYW5kIHJlc3Vi
bWl0LCBidXQgSSdtIHVwIGFnYWluc3Qgb25lIG1haW4gaHVyZGxlIHRoYXQgc2VlbXMKPiA+ID4g
dG8gYmUgcmVsYXRlZCB0byBmbGFzaCBPT0IvRUNDLiAoZ2V0X21haW50YWluZXJzIG9uCj4gPiA+
IGRyaXZlcnMvbXRkL25hbmQvcmF3L29tYXAyLmMgaXMgaG93IEkgZ290IHRoaXMgZW1haWwgbGlz
dCkKPiA+ID4gCj4gPiA+IEJhcmVib3ggaGFzICJuYXRpdmUiIHN1cHBvcnQgZm9yIHRoZSBQaHl0
ZWMgU09NOgo+ID4gPiBodHRwczovL2dpdC5wZW5ndXRyb25peC5kZS9jZ2l0L2JhcmVib3gvdHJl
ZS9hcmNoL2FybS9ib2FyZHMvcGh5dGVjLXBoeWNvcmUtb21hcDQ0NjAKPiA+ID4gCj4gPiA+IEl0
IHNlZW1zIGxpa2UgQmFyZWJveCBpcyB3cml0aW5nIGFuZCBleHBlY3RpbmcgRUNDIGJpdHMgdG8g
c3RhcnQgYXQgYW4KPiA+ID4gb2Zmc2V0IG9mIDEyIGJ5dGVzLCB3aGlsZSB0aGUga2VybmVsIChh
bmQgQmFyZWJveCBjb21tZW50cyBzdWdnZXN0KSB0aGUKPiA+ID4gRUNDIGJ5dGVzIHNob3VsZCBz
dGFydCBhdCAyLiBJJ20gc2VlaW5nIHRoaXMgd2l0aAo+ID4gPiBgbmFuZGR1bXAgLW4gLW8gLWwg
MHg0MTAwMCAtZiBtdGR4bmFuZGR1bXAgL2Rldi9tdGR4YAo+ID4gPiAKPiA+ID4gQmFyZWJveCBj
cmVhdGVkIHBhcnRpdGlvbiB3aXRoIFVCSSAobXRkMykKPiA+ID4gLi4uCj4gPiA+IDAwMDAwODAw
ICBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiAgZmYgZmYgZmYgZmYgNTYgNDkgZmQgMTcKPiA+ID4g
MDAwMDA4MTAgIGIyIDI1IDYwIDFhIDQyIDFkIGViIDU2ICA1ZCBmZiBmZiBmZiBmZiBmZiBmZiBm
Zgo+ID4gPiAuLi4KPiA+ID4gCj4gPiA+IEtlcm5lbCBjcmVhdGVkIHBhcnRpdGlvbiB3aXRoIFVC
SSAobXRkNCkKPiA+ID4gLi4uCj4gPiA+IDAwMDAwODAwICBmZiBmZiAwNyA3MyAwNCBhYyA1NyA2
YiAgOWIgMWYgOTIgNDkgYWIgZTAgYjkgZmYKPiA+ID4gMDAwMDA4MTAgIGZmIGZmIGZmIGZmIGZm
IGZmIGZmIGZmICBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZgo+ID4gPiAuLi4KPiA+ID4gCj4gPiA+
IAo+ID4gPiBNeSBxdWVzdGlvbjogCj4gPiA+IAo+ID4gPiBBbSBJIHJpZ2h0IHRvIGFzc3VtZSB0
aGlzIGlzIGFuIGlzc3VlIGluIEJhcmVib3g/IFBlcmhhcHMgdGhpcyBpcyBqdXN0IGEgIAo+ID4g
Cj4gPiBJJ20gZ3Vlc3Npbmcgc28uIEJvdGggdS1ib290IGFuZCBMaW51eCBmb3IgT01BUCBwdXQg
dGhlIEVDQyBieXRlcyByaWdodAo+ID4gYWZ0ZXIgdGhlIEJhZCBibG9jayBtYXJrZXIgd2hpY2gg
aXMgMiBieXRlcy4KPiAKPiBZZXAuIEkgY2hlY2tlZCwgdGhpcyBoYXMgYmVlbiBsaWtlIHRoYXQg
c2luY2UgYXQgbGVhc3QgMjAxNCwgSSBkb24ndAo+IHRoaW5rIHdlIGNoYW5nZWQgdGhlIGxheW91
dCBpbiBVLUJvb3QvTGludXggInJlY2VudGx5Ii4uLiAoSSBoYXZlbid0Cj4gY2hlY2tlZCBlYXJs
aWVyLCBieSBsYXppbmVzcykuCj4gCj4gPiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51
eC9sYXRlc3Qvc291cmNlL2RyaXZlcnMvbXRkL25hbmQvcmF3L29tYXAyLmMjTDE3MjkKPiA+IGh0
dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvZHJpdmVycy9tdGQv
bmFuZC9yYXcvb21hcDIuYyNMMTM0Cj4gPiAKPiA+ID4gYnVnIHRoYXQgaGFzIGJlZW4gZmFpcmx5
IGRvcm1hbnQgZm9yIDE1IHllYXJzLiBJZiB0aGF0IGlzIHRoZSBjYXNlLCBJCj4gPiA+IGFzc3Vt
ZSB0aGVyZSdzIHByb2JhYmx5IG5vIGhvcGUgaW4gZ2V0dGluZyB0aGlzIG1haW5saW5lZCwgYW5k
ICJuYXRpdmUiCj4gPiA+IGJhcmVib3ggc3VwcG9ydCBpcyBqdXN0IGEgcnVzZS4KPiA+ID4gCj4g
PiA+IElmIHRoYXQgaXNuJ3QgdGhlIGNhc2UsIGlzIHRoZXJlIGEgaGlkZGVuICJzaGlmdCBPT0Ig
YnkgMTAiIGNvbmZpZwo+ID4gPiBvcHRpb24gdGhhdCBJJ20gbWlzc2luZz8gT3IgYW0gSSBpbnRl
cnByZXRpbmcgdGhpcyBkYXRhIGluY29ycmVjdGx5Pwo+ID4gPiAKPiA+ID4gCj4gPiA+IEFueSBz
dWdnZXN0aW9ucyB3b3VsZCBiZSBncmVhdGx5IGFwcHJlY2lhdGVkLiAgCj4gPiAKPiA+IFlvdSBz
aG91bGQgZml4IHRoZSBPTUFQIE5BTkQgZHJpdmVyL2NvbmZpZyBpbiBCYXJlYm94IHRvIG1hdGNo
IHRoYXQKPiA+IHdpdGggTGludXggT01BUCBOQU5EIGRyaXZlciBpZiB5b3Ugd2FudCB0aGVtIHRv
IHJ1biBvbiB0aGUgc2FtZSBzeXN0ZW0uCj4gCj4gQWdyZWVkLgoKR290IGl0LiBUaGFua3MgYSBs
b3QgZm9yIHRoZSBpbmZvIFJvZ2VyIGFuZCBNaXF1ZWwuIEkgdGhpbmsgdGhpcyBzaG91bGQKYmUg
cHJldHR5IGRvYWJsZSwgYW5kIEknbGwgdmVudHVyZSBkb3duIHRoYXQgcGF0aC4KCj4gCj4gVGhh
bmtzLAo+IE1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
