Return-Path: <SRS0=g52K=I3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ABCAC433DB
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Mar 2021 23:34:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19788619A0
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Mar 2021 23:34:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19788619A0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=windriver.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SQsBkvnuYchUM2WLWDw+jhOL5xZ8oif8r1RHuKoyLT0=; b=oYU+DiQLR9drq356/kGgT6Lpv
	YFjc9Xo6x5/8HfV/4+0vr0SZ490P5P2Jm9PsCdNkTS3+6v1oITiUVXFILjLjGPZzZMmMm/9ZQpjaH
	TSBblKWwsiQXBFjIMeqfc626iLgYrZqQMY7ysu7/WBjSqMUoRwf0EEE5sef5iuvgfM5b3W1gsIMTo
	NuUL15o71pcgdZO3m3tL8T6BODSrCDdX4H+d5ZOqUviLVpAm56o7KJ7d868OVGCFQIH72aC7M/EHS
	dxd8CbIVLW/RkSltbuYs7tzMSQKMEdjidAclC08BeuZ5eCagmu7SJ18pou5Fa6XM3G+XjPbx3Oxt2
	qzyODIUrQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR1O0-001xbA-FS; Mon, 29 Mar 2021 23:33:32 +0000
Received: from mail-eopbgr770081.outbound.protection.outlook.com
 ([40.107.77.81] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQv9S-000npU-1I
 for linux-mtd@lists.infradead.org; Mon, 29 Mar 2021 16:54:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HCQHD88Jv5zwm1l6SNCJSNfqsnmZCrGsTgb1U6GERyqAewYsug5msP/MLlFPfYwCygW3HFXorGtvc35mdj0jxhkzLjewL9GtYnDaXySS1c56toP6Aluw9jtdnZSZI/JjzIzCM9lZvm+zvjKvXw2yfLTU66g6pUOhkkmwKz76HDn76+T+HndmPnK/9B3sAls7gBo6YdNmlqiGOviw01rS0opcSUiGu9gOO+LDg+vrgL+5F+qDVkJA/mO+IbTbmp1iqVKfC7MtNRCDuIb8bGK15/hTQMmiuHCFmg/XezvoveUYACnClRH3//aPZiG5hMMbGNAJZo7bZEId8RVeIyc0kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sOfl4+5V8m13uHtljoRcgyDstRq5yOXY0fz/JWH12q8=;
 b=OjK2/0Y9o1hp4FuVjYip8+tUNkIYTt5uXYanDl2slnDsPOOQcGz2zHxSiDfM4I7Eg4uySZTV0d3k/9dQOUjjMWhBbHYRaE69HqNEIBuRSy7Ytpf4fySFhpKkLKbxaBPV95TDdj8Vm1oI2CKyeorBNGnPaP+HCpjFLGRGgD0HDHSPwwhXwO/IpEK1OImxMfDvoK+QGAPeRrXfMPDVds385PdLq0XvT0TqmQmSOWI3Lr4ZD0XJ69FTmLH3XS+IxJxYkJgX508+ZPKuekAPQ1Gvgn3MECF/+Bve2k/Y9rde7Cn3OObFEn799r0TJ0r7MNYxA6VMG9UT+59jevmfteWfpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sOfl4+5V8m13uHtljoRcgyDstRq5yOXY0fz/JWH12q8=;
 b=jm4fF6FVb1gtJBnW0msM+kIKX1uvZeWOnWn2XT9hcGdFep0ij55AiBa8aFSQZ17knVMDiJrNGJfJFVpRkJziR9T6BBrQGk1CeXmvcYgEnGHHNcmYq+v1FWqVN5tSd3gyb4d5QtPZNRzM9VBwVgCfaFhTs6wH8ebphKie/ZnroOo=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4766.namprd11.prod.outlook.com (2603:10b6:806:92::20)
 by SA0PR11MB4750.namprd11.prod.outlook.com (2603:10b6:806:9d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Mon, 29 Mar
 2021 16:54:00 +0000
Received: from SA0PR11MB4766.namprd11.prod.outlook.com
 ([fe80::618e:7a26:8bb6:4c1d]) by SA0PR11MB4766.namprd11.prod.outlook.com
 ([fe80::618e:7a26:8bb6:4c1d%2]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 16:54:00 +0000
Subject: Re: [PATCH] mtd: spi-nor: Use CLSR command for FL-L chips
To: Tudor.Ambarus@microchip.com, vigneshr@ti.com, miquel.raynal@bootlin.com,
 richard@nod.at
Cc: linux-mtd@lists.infradead.org
References: <20201116153956.588098-1-yaliang.wang@windriver.com>
 <f2fe7e4e-a651-491c-f894-8cc264c64744@microchip.com>
 <d2a66253-e755-280f-8f79-d141b3169c56@ti.com>
 <2c578dcb-b9da-a56a-593c-b654cef6e67a@windriver.com>
 <6f868908-ee07-690b-98ea-47d81acf009d@microchip.com>
 <d80d6cd2-87c3-c336-7add-b91ff4e0b177@windriver.com>
 <549f0999-ec8e-a2b0-2c2a-2c09a4951ad9@microchip.com>
 <17a9226e-7d95-f3e6-7d94-ce6415ccd991@windriver.com>
 <2966c209-190c-750b-9313-605157e20604@microchip.com>
 <7c8daaf6-a802-5de5-63d9-81febd7dd7b7@microchip.com>
From: "Wang, Yaliang" <yaliang.wang@windriver.com>
Message-ID: <4ea8651b-7baa-2465-356c-d8c365eb4d07@windriver.com>
Date: Tue, 30 Mar 2021 00:53:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
In-Reply-To: <7c8daaf6-a802-5de5-63d9-81febd7dd7b7@microchip.com>
Content-Language: en-US
X-Originating-IP: [114.243.223.155]
X-ClientProxiedBy: HK2PR02CA0174.apcprd02.prod.outlook.com
 (2603:1096:201:1f::34) To SA0PR11MB4766.namprd11.prod.outlook.com
 (2603:10b6:806:92::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.3] (114.243.223.155) by
 HK2PR02CA0174.apcprd02.prod.outlook.com (2603:1096:201:1f::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.26 via Frontend Transport; Mon, 29 Mar 2021 16:53:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e1152fc-9b74-4a1b-0161-08d8f2d33fff
X-MS-TrafficTypeDiagnostic: SA0PR11MB4750:
X-Microsoft-Antispam-PRVS: <SA0PR11MB47501C4030E02376629A35029F7E9@SA0PR11MB4750.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iGlMnNsakcgNGLVuYkQw4PNcA9snVg97+sPo8lWfXuVYwqOL6sSgn4VrSD1p66iBGtJVQvxd/vuZQrZyunCHkZwtl8XfFxfu9ljyHwLAy4piJzEnvkyyxgHB9ZHdrMMls3rYJCneVlkpE4wpIFBeyyu51eVeGoHgrw+JZAhudZHh2VoDVTxNjXETpoaKEvehtxkvgHqKGA9RcyyRsy5dEQG1jZKuVaYQwRp5CG8IVWoDVel1cGmppjXa/Ld4dXrRxEIzIgBn+u7ww1vu0zbovtqnt1wi7tCOY5ttzJJae90ZiRb10QE8/Vt7dwL+iff2mL3xeQQ2PYbJ5P554r71BP8DYZtsECWByMCf2U/94COELCsmMK+4QMxzfc+3ZM752z+1XvRGfi2KFS5U+R2xnLoypUq0t0FaPw4ZJUO58n08/R/tVogDb/gab5BBjyJfts0q3eR3LiBt43dkMLT8ORYxwxE0H3xU/fbfN+A0cdD0JgkOQdZrsn3PzXvBLSFA9Gvrk/u6G+XEprxPgc1lQuySkrFgnGmiVcHUuLTCY5jeftIjh9yLx0YnUvIXWhjoykBLsQLD6ca1h1hHJ6SYyMxX1AmNiW/TyRZXbnK4RZny09myg6gPSLbkIv+paQcUYmUG15EFI+oIYiSDqtHyPjJ403MJklN40aOboRxfzg3auWL3ovNnCHYQ9u9xQFpVp5ER+GOwsYkMML9f7KdOrA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR11MB4766.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39850400004)(366004)(376002)(396003)(136003)(16576012)(2616005)(2906002)(86362001)(36756003)(52116002)(5660300002)(186003)(478600001)(4326008)(26005)(956004)(8936002)(31696002)(66556008)(53546011)(31686004)(38100700001)(316002)(8676002)(83380400001)(6666004)(16526019)(4744005)(6486002)(66476007)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?S2Z0R3RPUWNkaWp4VHk2Y0NxNlRzRFNhYkZqM3UzbGd5L1dKT0hzYTY3K2Yx?=
 =?utf-8?B?cUZqdnVJVWg4QjBiWUFIaG5SUnR5S1BXRTdRb0lEQmduSVdjdDAwNnZtTEVF?=
 =?utf-8?B?ejJBSUlPTHgvdnA0UU92Q0haUkVkL1RyKzdWLzRxd1crN21YUTgwQ3dsS1A2?=
 =?utf-8?B?TVRlTjNkako0SEEwZGtJQmtPc1cxbWdFTmg5OWg5YiswM3hjYmlmak1sQnlj?=
 =?utf-8?B?YTZZYnMwaFJBZkkwQTZpRFZCNUdKeHVocC9uTkcva0VockRiRE9ReUNmdk5O?=
 =?utf-8?B?RE5kZGhuZkhjU0dlSHFIMUFnUE9PMWcwbmlkTlNjVkVuSFFRbFpWRDh6ejRH?=
 =?utf-8?B?N2I1TkJUZkpHRUpDcUo3TXd5djRIKzNSQTRWN3Vud203T04wRnhqcDFZWmds?=
 =?utf-8?B?azgwN2hHUFVvS2gxa2FhcUtpVzVzOU1reHp5aGpWWjZiNzR3NXM2VUd2ZjlS?=
 =?utf-8?B?NU5RRG1ERXpHUnZQcFY2Qlc4NWIzd1pTaTBlLzlNZU9VZGlGNVFhRVRpR0Nm?=
 =?utf-8?B?bnZETTdLWHJMOGpTdmJHYmlvU2tSWGtINlhLYkJ2TFhtWGZ5S1VPcUlMeXlw?=
 =?utf-8?B?MFFtSEpPUTBEK29EcmJiUklSa25TbnRNVHl5VU0vYStWclVkSFI4MnU4M1du?=
 =?utf-8?B?VzdrMVJOVDVvbFhRdTJraTJqTTFaaHJPTW9DMHBqTGNLVzZzSldTUnUrYmx6?=
 =?utf-8?B?VXExY2krTHlNVzVnMXFVQyt2clI0TUxUc3RXWWRzK0k1TS82S2ZMZC9oY0RL?=
 =?utf-8?B?N01LRUtwZllPVTFyV2gzc0p0TjAybEZNU3IyVmtpWWpPUmZtc3Q4L2wxdmJy?=
 =?utf-8?B?T1hjWUlpcktDTUY0YUhCZHhLekdTT1pCaDFyWmlyS2FROU9pblVEVmJEa05y?=
 =?utf-8?B?dGwvdnFCWGtBUlRnTWtISnp0MEF1VUtkeHlxZTl2ZS9DT0RBUGcrcFl3T2dm?=
 =?utf-8?B?eWx4bEJRYTNCbm96ZlRWVEVjU25wa3M5aFFQcjhyMXg1KzNTMVZHazQrZlB5?=
 =?utf-8?B?RUxNQW0yaTVmY1Y5MmhuUHBIQU80UXBCdndMbTFjMUFmUDZ4Qzg0SWdqTkJF?=
 =?utf-8?B?eW1QR1JLVE11QzE1YmRpL2daN1dYYXVWOVVCbDZ5SHhYYmRFSmx2eEdQdlN3?=
 =?utf-8?B?dkxKVnFKcEw2RFE3UjZTajZmeVdNUm15Vytqbnp6alFwNk40RVpNRGppQkN3?=
 =?utf-8?B?Sk1IN1BrVHFxVDNJRGJTVGsrdjVSUURLVm1NNG5MbjgyV0diWlhqbXFzcitE?=
 =?utf-8?B?Z05obGRYY3BPSDhUNnNFK2U3Tk9tUzA1cjhBSnNmdlliUDlPcDdaUlVmVWw5?=
 =?utf-8?B?K1ZmdzdYNWhzTWYvc3gxSjltNjNzVjBUcGlPZzJOQmUrSWpUOWdYSDhnYmh2?=
 =?utf-8?B?Wll6d2tON3NTKzZzTVdWYnBDNjJEa1hDVWtFZ1BrNlBEUnJtNGd4ODgxRjhv?=
 =?utf-8?B?M3NUbzhwWWl2RER2RDYzOWdBL2pqUVk2azhpQXAwd3BTTUZvamozNDIvTmRm?=
 =?utf-8?B?MHpEazJBcWxpN3ZqMnA5dGQ3SlR3czc4WHlJOUhxVEFVNFdzeWM4eVQ3U3lL?=
 =?utf-8?B?YllFYXpjZTlKK1FrYXRMT2M3L1dMT2dXSG52K2hHQTB3Q0s2Q2duU3V3ci9o?=
 =?utf-8?B?NHpZODFsSUdOT1krTGdLQXdnWEtmOXc5T05ESEprc05kdDViZ3JqK0dERkR0?=
 =?utf-8?B?UWJ0VWNwRmR1b3QzemVkblYySVR5cHJlWFRxM1pORGpCaUNpdjMrL241bDA2?=
 =?utf-8?Q?WIFBZZ+FAOAM6PeE/NItFD7HHyo5HfqieoFoul0?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e1152fc-9b74-4a1b-0161-08d8f2d33fff
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4766.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 16:54:00.0813 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ySgNhm7h2Pp/8wk3cf0aCyuX7+W3nn0/lqIOiEj87HceSAx42wQRP/M7dkb+MmRruT0N206rY9wJiUTmKgPG2a+tXQfft/jyls6pyGpHUVI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4750
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_175419_491863_503C6269 
X-CRM114-Status: GOOD (  13.16  )
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

Hi, Tudor

Sorry to have kept you waiting so long, I'm still working on it. The 
previous version is not so rigorous, so I tried to understand the up 
layer codes better and also do some tests.

I've learnt the strategy you mentioned in the comments, I'll prepare the 
second version ASAP and send it for reviewing, we'll see if it's more 
close to fixing the problem.

Best Regards,
Yaliang

On 2021/3/29 21:12, Tudor.Ambarus@microchip.com wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
> 
> Hi, Yaliang,
> 
> On 2/24/21 6:30 PM, Tudor Ambarus - M18064 wrote:
>> Yes, please. Let us know how it goes.
> 
> I think I hit the same problem that you're trying to fix, when testing a
> s25fl064l. What's the status of this, do you still work on it? Do you
> want me to sketch the core patches and you to come on top of it with the
> spansion fix?
> 
> Cheers,
> ta
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
