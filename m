Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 137F3C64EC4
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Mar 2023 08:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ilq0fKxaeJQbJLjcI07ECfBYmpNztPq/v2zez+px36A=; b=MI/QAeml5kFnFXk7+PZfwTG0Hz
	aIkx+TiZS6HX1IgYHCuSj+Lh1JakwRRUMcPpb+T7+/SHrkkhroy/ETMcx+XInVOpEhXG628Gh74YW
	+XEIRkUM2HoNLQ4mF3No8o6hx+DDyjGBD1USd/wThUeZGzCgIeEK9GhC+F8/jM4wDwRAaTsLZGh8e
	AKo0oezz+1VnDixQkzmfkSriWBsN1+vaMsWgymyx5l+uqxikwAQj4oJmXZo2kiF5oodZLSKYKXaCy
	TDSwdAjVoivvemw7g4aZR1umvCg3p3NdCUobKbLwtTszLU7xkOG1uUxCfQ+3RWb5hLskuhdZAxqiJ
	ABpP5IYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paXiV-00DVb3-Uv; Fri, 10 Mar 2023 08:03:08 +0000
Received: from outbound-ip23b.ess.barracuda.com ([209.222.82.220])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paXiS-00DVZC-3R
	for linux-mtd@lists.infradead.org; Fri, 10 Mar 2023 08:03:06 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2040.outbound.protection.outlook.com [104.47.74.40]) by mx-outbound20-58.us-east-2b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Fri, 10 Mar 2023 08:02:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W4zx2I/bFsm4EHuEoZ7L23yO9xHaThI30fVyFNlyCUrkpSjCSniABfrov6N4MAC2pX09l9zaoHDju7/AhsiH8kdzwnLzjFo+Ws6cFEeTBXk+kdJ5V2djkWWBf4OzP2SjuM/pSuajpMcoG4hrNUBbiCbEPkJwk7yRLPJhjQJncr0HWahzsuN10iPlH719JFq6lctYEuL66827Hbpqz9MbgCp5yh2yywe5U5ODidxtZhtIWQbysdT5R8Z4R43Au3nG5W05+3QHS8x3LhMkQxClldbi8CRpxW5/3En8EERZB4S10OtA5RZUzbFeG4FtrHnmztq3+lF0sQnl3TDcM1f+8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ighTVzP9kqoio1OD7bLM3gdwg9mDzcLD9hC3X75qNZI=;
 b=h61ayUM0zUZMvLxpIMP7jJ+BJ3pHr1EHYULoNIbVgIjmQdLDxePdh1ZhZdKgpJ4THCcUFKH3vzIhuxw4lDpwN4r/2Xu41XQL5p5P6f9zylDdpeYyyvgoQGQGUB5WhfGOj5bXWyAqZmhJ/7KVFwFbpFYYrXWHSr02yDEtTo/bXNjn+m04WR8Q5SFZkVZyvM7rDoRmXCMX4wX5v0KpWRWQta0UwFbU7YUC6Yg+5SVQtiFQqsb9bgsn5M1jBmLRne7qLFWm/VANUjfhA6gkVSumGxzAZIFS2Ww+Pzu35u+LC3RTUSXilZAZN6j/Fr2ZHyZ6O6/3RzfuBOqMoebAzdypAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ighTVzP9kqoio1OD7bLM3gdwg9mDzcLD9hC3X75qNZI=;
 b=Cct/LimWJxh3LZnEN6w6p4JnvYRlEOvNUQZaCHZB3mFH+URGf2jCs4zdOfOqoUovoDhFQGXCuKx3XhyMcYgrC9jjWb42szLOZXxjTt0CptqdIAqwMt3o8Shga+/m28TRAXKVzmKROBSVv+AFjAui7D61A6RE03u5GDY8Ke+KemB/eyt8uPglenNSCXoi2BT3a+fChXgaMC2cjGPsqMM/AP6cA2//K1pRlvqyjBVBE3LiK90vYaYpbTsQXNYZJLrnzNE3SCsJDI3SabWR7xdk5Bh9p907h+PKBaG53XHhLL/UwDTaD5TMVUxIo0I0M/p1/w5hKi3i32TTh8UaPj0pyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=digi.com;
Received: from BY5PR10MB4370.namprd10.prod.outlook.com (2603:10b6:a03:20b::19)
 by DS0PR10MB6245.namprd10.prod.outlook.com (2603:10b6:8:d3::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.17; Fri, 10 Mar 2023 08:02:37 +0000
Received: from BY5PR10MB4370.namprd10.prod.outlook.com
 ([fe80::88cb:a839:2d87:1124]) by BY5PR10MB4370.namprd10.prod.outlook.com
 ([fe80::88cb:a839:2d87:1124%2]) with mapi id 15.20.6178.020; Fri, 10 Mar 2023
 08:02:37 +0000
Message-ID: <6578cb78-7d05-f105-ecb1-92d404f773ec@digi.com>
Date: Fri, 10 Mar 2023 09:02:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4] mtd: rawnand: hynix: fix up bit 0 of sdr_timing_mode
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: herve.codina@bootlin.com, linux-mtd@lists.infradead.org, sashal@kernel.org
References: <20230308142926.334787-1-hector.palacios@digi.com>
 <20230308163830.55bb3378@xps-13>
From: Hector Palacios <hector.palacios@digi.com>
Organization: Digi
In-Reply-To: <20230308163830.55bb3378@xps-13>
X-ClientProxiedBy: VI1PR06CA0195.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::16) To BY5PR10MB4370.namprd10.prod.outlook.com
 (2603:10b6:a03:20b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB4370:EE_|DS0PR10MB6245:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bfa316d-fc62-418c-da57-08db213dcf99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	5w6CR2f7Owy5vrlzh+9YDkU38OHcDyDIf2MMQELfCfcEm0YWSXrRSalpq+IxRB0AKzt5IjW9qrg9Am2GHqHxA8V423+9CwlRKXeJ8cYmDsDyjAbGZ0KUvriIgDsPrkY37cVA3SCv2mq8zqY+QIRubaUcFuifJWjrUQewBEK8eJ2ggDHxiKrLbx+qrUFNz0FTOdy6olq9R/MaRenmeR8q4nMmpNd6qQ+7Z115TBsROo4iX+5Hp7p1+LoTk6v1xe0Qu95QAI6JZOtD2rlRpDkx/KBOI+yoKb6DOsho6RwWD3AzDYmzw5F2Sp0jVJA3W+VJECqsP02iNc5L6UAS76K9h/sUkPWqwf5keeA6MjdqiKSENqwadTxdbMuIIpgl1iTENuktqzqCXMXSIJsa08qOlRAH3tySobeXckYYZ6bhp7Zp+P8rvMBXAwxlf6Qnc3l5XPQN3Mj0aoFJxIVvY2pf69xc73ceVASkXiMO7Kklsa0+qZe3mAYwpUPmJO8OulzKFC9rA2RsOZ2Hrzf5mqbnhyhXnX7hxT1uMvNtafDRpNd0vvTPwBPXRfHSkTqN0vQumylxQlSE6J8b5op0f7eDtMvSqs0tXLjCVLUFR/K3xA/iEm6F4VHz5T6yNq+FJI+JTVwN6tR4PWVRGJ2IJo4EuaEp8i6rx6DYEme7XuKo253dRFW4oftSGk3i5u/fHzBU0FvCpvyed+bBkLWfyUPA9A==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB4370.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(39850400004)(396003)(136003)(346002)(366004)(451199018)(5660300002)(6666004)(31696002)(41300700001)(86362001)(8936002)(316002)(66574015)(6486002)(966005)(31686004)(38100700002)(478600001)(44832011)(83380400001)(36756003)(53546011)(6512007)(26005)(2616005)(66946007)(186003)(2906002)(66476007)(36916002)(66556008)(6506007)(4326008)(8676002)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?dU0rVUo4QXIwWW1YUkJnVzRJaklnM2p1WE5mSEswTGlkaFY4MUtwSHR0Y3Zp?=
 =?utf-8?B?VEhvNS82bWpUYzNHTU9ZMi8rZ0xuWXg3OWFTb1NTSTk2QUlUbGJHZU9WazNV?=
 =?utf-8?B?OEIwWWlQZ3Q5Y1lkcWFXZWg0MUh0MnZLRmE4b3owN2hFWm1VdkliQnI3TVpW?=
 =?utf-8?B?ZXJFTGtvRVpkTnpibXR3dlhxVGk3cmlPZlVHQ1pmVTdXK2ZhU09xSk5Yd3k1?=
 =?utf-8?B?MjVIdXRnNHY2SmFnYVcxbFRXZ1J1ZnM1OEpGSE9jdlZOWEE1WUJGYTcxVk9t?=
 =?utf-8?B?dzErZHR2S3VDMzVPZmpKdDFCWWhteVJjcnZYZFNwOVRFTnBwT2gvNWl6NDhu?=
 =?utf-8?B?YnByR2V3VHRodGRPY2Qzd1NqdERpRlA5d1BESXBoclZObU1nd3NTUEh3Yncv?=
 =?utf-8?B?bmw3aVhRVzRLZHorNVpOcy9ZWjBOL3Flb3Q0WFFJaWxsY2Y5T3RrbDV4dGJN?=
 =?utf-8?B?N1NXbEtmZU1RRzhjaEhBQ0ZDUWpqelBjVmlXZkRJRUZDem1qMzgrbFVHNzhy?=
 =?utf-8?B?MktCcGJIbS84bncyQnFtRWgrSzFsYkRobFExeDhoaEdvOXByekIrU01yVGZD?=
 =?utf-8?B?ODZRYkQxLy9SR04zOVgyQ0d2Y3owOVJPZEVRaUU4ekxvd0l0dlZQOFlRelBI?=
 =?utf-8?B?UGVoN3B2VDlMeXJ1T3g4U2lGWXcvS1VPTjNmRWh3UjlPYml6VFgybWx2amtH?=
 =?utf-8?B?eEQ5WDlqa2h5VGV5L0x5SEZpb1FnQzB5YW9PYlg0QmdEWlRteHFKV0Y1K28x?=
 =?utf-8?B?VEFldVhQUklCU0orZE5tbXFLVmZiWGhlVllKb0JONVRGSDlVa1BTMTF4UmNO?=
 =?utf-8?B?azFtcGsydEN3eExTd2gybDB5NWdtUktsZUNzRkZGdEovMEJoVlNyaE53dmJu?=
 =?utf-8?B?VGFnVWZkeFJMMGpSQloydVdEWURpK0RHQXljei8ybGRUbXMrR0p2MDd6Nzhv?=
 =?utf-8?B?VFZnZTVWaVNtbnE1NUZPdXliTWpVRlNuQzJIdlhlOEswMTdRQmZPd1VKRzFp?=
 =?utf-8?B?cmxqdkNSVGYxa1F5bVl4SmFXWXgvbDhYenlObCs4TmYrVVBTVDRGS0F4cWEy?=
 =?utf-8?B?bXptclR4Y3lqTHNHTzh0OERxL1F2cDVLN0hkT0lhS0psejJxWUxHajQ5TDVT?=
 =?utf-8?B?SFZjNXJYZk50d3pZbmIzT0twb3Q1L3BRYVBuUXNuWnBzWmtsaHJiellQTTc0?=
 =?utf-8?B?OXJsZURJMGt4VVZVbW51QzRGOS84U25IN0ZnMERIcWxHSWNLV0pJY2k0VS91?=
 =?utf-8?B?RmRUWG10VW1GZVBMVDI2NUpPbGdHaGJzbHZha0wzNlRtSE5oRVdOM2YyQ2ha?=
 =?utf-8?B?azFLYS9iWkZ4ZzZDWHZEaS8vWEhJaUxtOUt3bm84czRXZFdmbk1QandrZlZo?=
 =?utf-8?B?enZvdEpEb2JGUDJzVmgxYWZsZXpSdThUYkN1WU16WCs2RzE4bVFVV0wveUwr?=
 =?utf-8?B?NXdTd3dyc05iMnVYQzhMb29XMWlGd1lwZk1tVHlhVDgwT0FxYytXU3U3ZFhM?=
 =?utf-8?B?MmpQTzhzcnU5a3VKTjdCU2xRQ3BNb0VDRmpkL3h2cmRxa3FOakQ5YUFZeWcy?=
 =?utf-8?B?WG9VbUNQZVdTS0ZDRUJQSUM4R3Ryd1MybFlMOTExS2oxWVVPdS9EbnhwU2tq?=
 =?utf-8?B?NjFyMlVhSjRXZHZTalRvWEdqejl2MisyVEJyOTI1TDFqTWtlKzRFMmgxem5J?=
 =?utf-8?B?czVzaU91dHlLNnl1U251MHM1QStkaS9SNEd5Tmc0WWZ1aGhlUnREc3pPMTZE?=
 =?utf-8?B?Z3pxNEwwSExQRVYzdm95d3FSQ0FDdFczdmxHRVozbitEaXVEQmlJZWNLdllU?=
 =?utf-8?B?ZC90L0ZQRFhTa2dNSHZUYUltU29SWUM1bjg0QnRIOHBSVkd4NmdYSzg0eHNx?=
 =?utf-8?B?endkK25za1ZZamNYeWpwclRWam1iTWRaOFdyaE00Mk9NV0U5RXQ0cTJhNlhl?=
 =?utf-8?B?MnAvWVo0R3IvdDJyUGticndZeGhtUmpDVTBHQWdyTG13clh2Wk95enpmYm5D?=
 =?utf-8?B?RzV3RzZHdWZ3bnVkOGRFcnZsc1pFVWtTZnhFK2tuc3ZWVEJpVDlPdlg5dElJ?=
 =?utf-8?B?ZkFidXF4QmFkd3hzdG0rVmxucGwweEppT3VZWEVkcmV2NGVNdi9IRDRLelgw?=
 =?utf-8?Q?WCnrMGmqUzNuirdY657xa76ZJ?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bfa316d-fc62-418c-da57-08db213dcf99
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB4370.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 08:02:36.5869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GnJA9Hjj8JdH7zIFTFQLoSo+tHNFI58JSSEh59yaQFdf5vvZXziXzYdQXTxv/AVY++fCXwG9zGhXKosVGgVz4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6245
X-BESS-ID: 1678435358-105178-25266-111942-1
X-BESS-VER: 2019.1_20230309.2002
X-BESS-Apparent-Source-IP: 104.47.74.40
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUioBkjpK+cVKVsYG5uZAVgZQ0DI1Kdkk2Swtxd
	wwydwkzcTSyNzA0jjZwMwo1Tgt1ThVqTYWAMjXg/xBAAAA
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.246690 [from 
	cloudscan18-19.us-east-2b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_000304_478770_A9BAA11D 
X-CRM114-Status: GOOD (  22.82  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWlxdcOobCwKCk9uIDMvOC8yMyAxNjozOCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBbRVhU
RVJOQUwgRS1NQUlMXSBXYXJuaW5nISBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgb3V0c2lkZSBvZiB0
aGUgb3JnYW5pemF0aW9uISBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1
bmxlc3MgeW91IHJlY29nbml6ZSB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNh
ZmUuCj4gCj4gCj4gCj4gSGkgSGVjdG9yLAo+IAo+IGhlY3Rvci5wYWxhY2lvc0BkaWdpLmNvbSB3
cm90ZSBvbiBXZWQsICA4IE1hciAyMDIzIDE1OjI5OjI2ICswMTAwOgo+IAo+PiBBY2NvcmRpbmcg
dG8gdGhlIE9ORkkgc3BlY2lmaWNhdGlvbiwgYml0IDAgb2YgJ1NEUiB0aW1pbmcgbW9kZSBzdXBw
b3J0Jwo+PiAoYnl0ZXMgMTI5LTEzMCkgInNoYWxsIGJlIDEiLiBUaGF0IG1lYW5zIHRoZSBOQU5E
IHN1cHBvcnRzIGF0IGxlYXN0Cj4+IHRpbWluZyBtb2RlIDAuCj4+Cj4+IE5BTkQgY2hpcCBIeW5p
eCBIMjdVNEc4RjJHREEtQkkgKGF0IGxlYXN0KSBpcyByZWFkaW5nIGEgMCBvbiB0aGlzIGZpZWxk
Cj4+IHdoaWNoIG1ha2VzIG5hbmRfY2hvb3NlX2Jlc3Rfc2RyX3RpbWluZ3MoKSByZXR1cm4gd2l0
aCBlcnJvciBhbmQgdGhlCj4+IHByb2JlIGZ1bmN0aW9uIHRvIGV2ZW50dWFsbHkgZmFpbC4KPj4K
Pj4gR2l2ZW4gdGhhdCBzZHJfdGltaW5nX21vZGVzIGJpdCAwIG11c3QgYmUgMSBieSBzcGVjaWZp
Y2F0aW9uLCBmb3JjZQo+PiBpdCBpbiBjYXNlIHRoZSBOQU5EIHJlcG9ydHMgaXQgaXMgbm90IHNl
dC4gVGhpcyBpcyBhIHNhZmUgYXNzdW1wdGlvbgo+PiBiZWNhdXNlIHRoZSBtb2RlIDAgaXMgdGhl
IG1pbmltdW0gKHNhZmVyKSBzZXQgb2YgdGltaW5ncyB0aGF0IHRoZQo+PiBOQU5EIGNhbiB3b3Jr
IHdpdGguCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEhlY3RvciBQYWxhY2lvcyA8aGVjdG9yLnBhbGFj
aW9zQGRpZ2kuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5
bmFsQGJvb3RsaW4uY29tPgo+PiBMaW5rOiBodHRwczovL2xpbmtwcm90ZWN0LmN1ZGFzdmMuY29t
L3VybD9hPWh0dHBzJTNhJTJmJTJmbG9yZS5rZXJuZWwub3JnJTJmbGludXgtbXRkJTJmMjAyMzAy
MjMxNjUxMDQuNTI1ODUyLTEtaGVjdG9yLnBhbGFjaW9zJTQwZGlnaS5jb20mYz1FLDEsUkxwZ0JU
ZnJLb3NWb2cxZ19maFFBZlgwODdJOWdVRXVfZlhUdzZXc1VObS1HNlZvN1J5VU5YSkhLNGZMTkNM
OFlSMG5pZ2RFdG8tbjhTR0Q1dW9FZmZ3dGViT1haeWM2SVpUS29pV1hWcDM4czU2R2g4ZVpyamhm
N2dfTCZ0eXBvPTEKPj4gLS0tCj4+IHY0Ogo+PiAgICBGaXggYml0d2lzZSBvcGVyYXRpb24gb24g
X19sZTE2IHR5cGUsIHBlciBzcGFyc2Ugd2FybmluZy4KPiAKPiBTb3JyeSBJIGhhZCBubyB0aW1l
IHRvIGFuc3dlciB5b3VyIHF1ZXN0aW9uLCBzZWUgYmVsb3cuCj4gCj4+IHYzOgo+PiAgICBGb3Jj
aWJseSBzZXQgYml0IDAuCj4+IHYyOgo+PiAgICBNb3ZlIHBhdGNoIHRvIEh5bml4IHNwZWNpZmlj
IGZpeHVwIGhvb2suCj4+ICAgIFVzZSBCSVQoMCkgbWFjcm8uCj4+IHYxOgo+PiAgICBJbXBsZW1l
bnQgZ2VuZXJpYyBwYXRjaCBpbiBuYW5kX2Jhc2UuYy4KPj4KPj4KPj4gICBkcml2ZXJzL210ZC9u
YW5kL3Jhdy9uYW5kX2h5bml4LmMgfCAxMyArKysrKysrKysrKysrCj4+ICAgMSBmaWxlIGNoYW5n
ZWQsIDEzIGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQv
cmF3L25hbmRfaHluaXguYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfaHluaXguYwo+PiBp
bmRleCAwZDRkNGJiZmRlY2UuLmMxN2NjYTMxNjE0OCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9t
dGQvbmFuZC9yYXcvbmFuZF9oeW5peC5jCj4+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L25h
bmRfaHluaXguYwo+PiBAQCAtNzI4LDggKzcyOCwyMSBAQCBzdGF0aWMgaW50IGh5bml4X25hbmRf
aW5pdChzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwKQo+PiAgICAgICAgcmV0dXJuIHJldDsKPj4gICB9
Cj4+Cj4+ICtzdGF0aWMgdm9pZCBoeW5peF9maXh1cF9vbmZpX3BhcmFtX3BhZ2Uoc3RydWN0IG5h
bmRfY2hpcCAqY2hpcCwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBz
dHJ1Y3QgbmFuZF9vbmZpX3BhcmFtcyAqcCkKPj4gK3sKPj4gKyAgICAgLyoKPj4gKyAgICAgICog
Q2VydGFpbiBjaGlwcyBtaWdodCByZXBvcnQgYSAwIG9uIHNkcl90aW1pbmdfbW9kZSBmaWVsZAo+
PiArICAgICAgKiAoYnl0ZXMgMTI5LTEzMCkuIFRoaXMgaGFzIGJlZW4gc2VlbiBvbiBIMjdVNEc4
RjJHREEtQkkuCj4+ICsgICAgICAqIEFjY29yZGluZyB0byBPTkZJIHNwZWNpZmljYXRpb24sIGJp
dCAwIG9mIHRoaXMgZmllbGQgInNoYWxsIGJlIDEiLgo+PiArICAgICAgKiBGb3JjaWJseSBzZXQg
dGhpcyBiaXQuCj4+ICsgICAgICAqLwo+PiArICAgICBwLT5zZHJfdGltaW5nX21vZGVzID0gY3B1
X3RvX2xlMTYobGUxNl90b19jcHUocC0+c2RyX3RpbWluZ19tb2RlcykgfCBCSVQoMCkpOwo+IAo+
IFdoeSBub3QganVzdDoKPiAKPiAgICAgICAgICBwLT5zZHJfdGltaW5nX21vZGVzIHw9IGNwdV90
b19sZTE2KEJJVCgwKSk7CgpTaWdoLiBJJ2Qgc3dlYXIgSSB0cmllZCB0aGlzIGFuZCBzcGFyc2Ug
c3RpbGwgY29tcGxhaW5lZCwgYnV0IHlvdSdyZSAKcmlnaHQuIFRoaXMgaXMgZmluZS4gSSdsbCBy
ZXN1Ym1pdC4gVGhhbmtzLgoKPiAKPiA/Cj4gCj4+ICt9Cj4+ICsKPj4gICBjb25zdCBzdHJ1Y3Qg
bmFuZF9tYW51ZmFjdHVyZXJfb3BzIGh5bml4X25hbmRfbWFudWZfb3BzID0gewo+PiAgICAgICAg
LmRldGVjdCA9IGh5bml4X25hbmRfZGVjb2RlX2lkLAo+PiAgICAgICAgLmluaXQgPSBoeW5peF9u
YW5kX2luaXQsCj4+ICAgICAgICAuY2xlYW51cCA9IGh5bml4X25hbmRfY2xlYW51cCwKPj4gKyAg
ICAgLmZpeHVwX29uZmlfcGFyYW1fcGFnZSA9IGh5bml4X2ZpeHVwX29uZmlfcGFyYW1fcGFnZSwK
Pj4gICB9Owo+IAo+IAo+IFRoYW5rcywKPiBNaXF1w6hsCi0tIApIw6ljdG9yIFBhbGFjaW9zCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
