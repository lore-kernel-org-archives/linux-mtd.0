Return-Path: <SRS0=MIf+=JD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56BEAC433B4
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Apr 2021 14:53:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE17661284
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Apr 2021 14:53:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE17661284
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=windriver.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Date:Message-ID:References:
	Cc:To:Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kDCXtnSyiH7StzFc1G+O4YqofRuEEdy/SUdnD9V6aiY=; b=h7WoLcaUCrbO0h9WlUpWSBuOk
	5SCfw0dfJ63LpkRDjGZdz4nYGqyIoLuTS7XaJwDM2SFB5LloxESV/MfcTMem4yie9Z+0hJwn553iN
	XXFfAUHD9uOH2ZaG/jrnbkFJpn7PFX4ibKWypzPpDjfZ0OsWdeAbq5bQmJ1LvgdMHg1N0EFRmwhIs
	9bITFCZMQHvmXsMRHLOzzU+w/HWPHwzIlvszUuHOmr9gq4nk8FicdxzJLeuvSxNEwK14mwYuZPeck
	ZF6iXd1/og9qhY1tYNLYL4nVTncF/Z56k7GQXnpm/fTK8zwJxDG8EBQCY2xsZipcuLQFcmrnswrxl
	aAWQWAU6Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTn4S-002sFz-W3; Tue, 06 Apr 2021 14:52:49 +0000
Received: from mail-dm6nam10on2066.outbound.protection.outlook.com
 ([40.107.93.66] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTn4N-002sFc-Sk
 for linux-mtd@lists.infradead.org; Tue, 06 Apr 2021 14:52:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QM6qz3k9NfKYb8GlK3r3hPbjYNIvxT1korExCig02TIKsCdkrb3HcpDUExW2708CI3Hy+jsRvWs9qf/zJ7PzBYWBZOA3Ao1YmgdR3qUd/QgR3DDIXKd/cWGln0lbiKna0pVtnahLPmNodTnRnhCffGOZfNQYOdulpZ5x/abuVn67Z4iSzb430eSjdNiEafR+qE7ZkmKI2fJD992D6Zr1uKYDjkR6Id8FdBuRPCbWG+0L8UJKg5TdG08PoO2R3Y8PRtjkwSwXyygsCyh3r6GYVCBLOFfLmf669RH3xe1Y8oSR1dBX/06TLTl0SIuPQeDRbHbADTeB+NSUyQYx4xyMGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IB9oGDJcO0QdyN3O5MyQeBeql1tjVO6VJhA0akEAvrE=;
 b=VKcF3wy4nyCbINZJOfiruyQU8zDHVb0UE2LclJPf7DOgKhU5ZIpifQkDxoiVXN+rBUHe0kz8YiOe6Ej3Dphsg0ZThnIilX+ulEXTB/SQUAkV/kUfggzZ3rnNkDR9ZUz2UTqRIR5X9mPN3hHSmSFGOlgiRyjmUVzkXjD1x7JS2jN1unGsEPjCbdFwmQeI7jBJSPvW8hnq5muGiOakDEME0QXrjvbGUTZgxTzPAMqetBH8ry52Ry8p76mVlMR6mtmWuYaGK5tkuwNFxUH/fMRAY3XxJP+RhLooCXp4ss5SHjty3CTxbUUOkxnQZ+x9LXo7b2NSdC3QhxmUYiQkWrBlOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IB9oGDJcO0QdyN3O5MyQeBeql1tjVO6VJhA0akEAvrE=;
 b=L/2+nQUjhAGbcNmS47+YSArfKYK6q4z1RSm2vcvgYhxxL4tSkkNK07dMZU6kFk+vDGJe1V7DpJ3n3l2Vw/V7fqIj3O/4cgcZLD0Q50eyOyzFKO/wcaa04EkXDqHZynfvZqlV6csEfi4LV2bKZW1bE6F5wnW0CRuojzlWW1GZD6Y=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from SA0PR11MB4766.namprd11.prod.outlook.com (2603:10b6:806:92::20)
 by SA2PR11MB5164.namprd11.prod.outlook.com (2603:10b6:806:f9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Tue, 6 Apr
 2021 14:52:40 +0000
Received: from SA0PR11MB4766.namprd11.prod.outlook.com
 ([fe80::618e:7a26:8bb6:4c1d]) by SA0PR11MB4766.namprd11.prod.outlook.com
 ([fe80::618e:7a26:8bb6:4c1d%2]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 14:52:40 +0000
From: "Yaliang.Wang" <Yaliang.Wang@windriver.com>
Subject: Re: [PATCH 2/3] mtd: spi-nor: core: reuse spi_nor_clear_sr function
To: Pratyush Yadav <p.yadav@ti.com>
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org, tkuw584924@gmail.com
References: <20210401195012.4009166-1-yaliang.wang@windriver.com>
 <20210401195012.4009166-2-yaliang.wang@windriver.com>
 <20210406110718.y6dacaeqahc7fbpi@ti.com>
Message-ID: <177cb8e0-8ce1-395d-d181-997fd9e9f749@windriver.com>
Date: Tue, 6 Apr 2021 22:52:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210406110718.y6dacaeqahc7fbpi@ti.com>
Content-Language: en-US
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: BY3PR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:a03:254::23) To SA0PR11MB4766.namprd11.prod.outlook.com
 (2603:10b6:806:92::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.176.190] (60.247.85.82) by
 BY3PR05CA0018.namprd05.prod.outlook.com (2603:10b6:a03:254::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.11 via Frontend
 Transport; Tue, 6 Apr 2021 14:52:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 364cfcbf-975b-4738-eaea-08d8f90ba039
X-MS-TrafficTypeDiagnostic: SA2PR11MB5164:
X-Microsoft-Antispam-PRVS: <SA2PR11MB5164616F8B03073AF6B7C74F9F769@SA2PR11MB5164.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cmpPPm0EIst42XI+j0DlWdpFCI/2lDxwrb0LniBh0D6JD10bAvQ8YbvBllQUMmN5hPwHex0wZkFsQzzGVhBa8MmeMzO7NQCCDwVqMOqmMVAjA6w60zeF1cwfHA8GsV+Ggi7/WVtUTHQy6qs8yZwLACtjcgNOFQE9jyn3aL0ynPcc6uE6osdL0JSGcBsfsxoJXRyUNC9agiLmQSFyFJzr4kGEIYJQAz5qmH/HEP0CCJVqLpA+naBTghSsiOD1S0wU4TKca4lc4VAJCY4MAcggxJLXrFHa1dtEJw07eR7QKQDfNG1jFbaG9UOPzXdiOy/EJevy7fBaVkRj88JFaT/CbmoLGah1ucaAoCay4eDlUPjqxPbmwC9ORJDaeA/Em1BSnUJu/I1QqKF8JI/yEcv91pX6ryoSa776Zhpu6MaAmdhSF5SLyCRO57KOyC7rSbmaZCdWF7tdFEsQY1kEO53rl/4VBeA4vizEplsLUdd8e40I2z4LVhCok9X8E7Bd5+CrsgLXKYlUgBBOkEBW0bZTWldss4rs6oj/rpssp/UTVcptAjRb+GtGyvUdRm1GqEtNcZkHG//0vIELeYUP7qXW1o7pYLYnW7S3DCufK20acW/Cb+X3G9b9R8DspCfHRkJJa7qRAXCi5foJTg52IUT0Wu0DVQBgDsVB3+rzH+7fDfBGYJTUu7gcykjA3+lEV3RrERdXLFzssaYUChUyKQHQ6PGDHGA/KA2M6wQ2bafnGoWExVfaWCCVZOanxhnbQfc7vuXHi5vMwx3FUjgRu48yhRObYRsNPneWHD1IyWcjkv/Majj+EsBnR7ZiwKKdCpmH65H/igIl/aN0irkW46UqjAwAvVRyyxH4RGxWbEQPrvY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR11MB4766.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(366004)(39850400004)(136003)(376002)(66946007)(966005)(16576012)(86362001)(31696002)(38100700001)(6706004)(5660300002)(38350700001)(8936002)(316002)(36756003)(6916009)(31686004)(53546011)(8676002)(478600001)(6486002)(4326008)(6666004)(26005)(52116002)(2906002)(66476007)(2616005)(16526019)(83380400001)(956004)(186003)(66556008)(78286007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aWY5cDVvc09zdEJ4TXpnQS9rOCtDaW5lOFZtMEJ4UFh4eWRnVU1QQTJhem5D?=
 =?utf-8?B?MTlxTGlYb0tXaDBKdWpKSDVaYUxQclFIR0p1Nys2QTVpRU9jTXFYVzRPbFhE?=
 =?utf-8?B?UEZIcG9tQmtBZUxGUjRZdW0rWExqMDVOK29oWHhVNFNLTXNKMVZWV1ZaN0FN?=
 =?utf-8?B?bk5tVXBlaFQ0Ui9qdU1QTEhsTXFaem1rMXVFcXpYaFdxMEZLWVhVVlRya2E1?=
 =?utf-8?B?eWNtODVVZmJNeko0cFA4N25INVREVk1ndTk2NzlaY2VsdHVvWkFzU3ZGei9E?=
 =?utf-8?B?QzBFYlA5L09jUXJsK2RaVVhEUjc4WkxaQjFVMlFDdm5vc2JLa0QySXdrcEYx?=
 =?utf-8?B?VnVRQUJ3RTZTNTJYSkF3bEVSaGxYZGtxLzVhZXlwZ2NkNUU2ZzFRNjR1ZW1u?=
 =?utf-8?B?YnlOTjdsYzlsQkRiVWIxRm1BWFRDZi9LZHdORDB2Rko0TlBTV2piUklzOWVi?=
 =?utf-8?B?RElDYnptVWpvNkpudmZqMW9lUzFZRnFvVG5iZkxrZkJPNmp1SUtPeGwrM3Jp?=
 =?utf-8?B?ZXY3U3RNSU1EUU8vN1pYWVhoN01DWjhUNjBKYXdvMVlBSEl4TUVISURtVGVi?=
 =?utf-8?B?NEROa0pnZExySitFcElKYUI3dG51cnhCUGh3SGRXQm43MGw1ekEvNktmVXRz?=
 =?utf-8?B?NFQ4Rk9FVGJMSXJjM2dqblNqOWdKQlh6bXpvNkpSYnBHb2pIOW9VOWlyOFBW?=
 =?utf-8?B?L0ErTW52dzRvNjdaM2FJM2V5OTNQS2ZJOXh6WThvZExQdTM0NUV0bktTZ0RJ?=
 =?utf-8?B?VmRFdmFFdXB4Q2dQOUVuZW1UNjEwNkE0OEg2ODViQldCSGdKSUlsOGlISUlJ?=
 =?utf-8?B?bDFEelpGanhFSWJ3TXhwcXFMQy83SmJnelBDa0xXZlRWZE1WWFRBT1IzNFoy?=
 =?utf-8?B?RVpYbW1yaDNyNDRpSWRvTkJ4YlExODhYLzJ6dTA1QS95ZzZzK2dpUjljZG1z?=
 =?utf-8?B?WWM0V2pwQktJV3NLelBVNlJuMHZTbEZieXMzWFZQNDhLR01zVGRtRElWZ0Zl?=
 =?utf-8?B?MVhEdzBtTjlYN2VIbHMvQTJJVWpnazhVZFh2c1FXQWVqTDc5MkxCZ1NmUkZJ?=
 =?utf-8?B?S3ByQktPb1h5QmgwUjB6WjBVTnliOTBHdXl2Uy8rTUtoaUw0UC80aUczamkv?=
 =?utf-8?B?YmJiWWdvTjJRcjBuRno5OWFMRkZiR201RTlxQjJVdFFnYkg0UTJjR0VkeVFO?=
 =?utf-8?B?Q1I0UHN3Wk9BSE1ranprUENadjJYalBiekd0S2ZsSlBKV0t1c1pvZGswVlpv?=
 =?utf-8?B?cnRrOTFpMzZ4bm0xR0gvcHF1Qk9Eckk3WFkzY1hud3lvTFgxWDJzRy95Qy95?=
 =?utf-8?B?bHF5ZUNGcU9LSGoydzQ4NkhmZ2VEY042aWppRTdiSTd1NWJzelNraE1EbG9U?=
 =?utf-8?B?L3Vkbk1TQVpvU3RZNjM4OHNHV0xnN1NPZFJpclJtY0tvb2F4OURjSzhiWkVq?=
 =?utf-8?B?V2FJbDVNR2M2ZHFyZmJlSmI5Qy9VMHgrODdWSnc5dFNSbUh5UkRhNWpTbzVr?=
 =?utf-8?B?ZDEwbWJhdXpPOG1YbWxVZkF3MFIvMHNNQzdoWERhUllYREtRb3FFNk1wRTVM?=
 =?utf-8?B?eFZyZ3lHalVvem84YjFDRGFEMWMycjd6by9PNXI2RFZXd3JCYWFhM0pyMlN5?=
 =?utf-8?B?TTN2aXJha01GdktCVTRSeHFNZTlxVjZtVE55MFlldGI5Vm9rNGNaakJTV0N2?=
 =?utf-8?B?SnYvWmhPTUZKQ2tSU05CdUpia21MandZWFhBRGRaSzFwTDZiS2xDVjkrSFNn?=
 =?utf-8?Q?b6/jzqDkctuBs5f75C6bjQ5CBbldDdpt23uPrCG?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 364cfcbf-975b-4738-eaea-08d8f90ba039
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4766.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 14:52:40.2236 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uGIgGXv6nk5H11Cc/yf1sTt1Uj2uLc+ILabBkp5t43fhb552/OUB4X8bcSlefK6linYwvcDMEvUGnZl1SkccDgj3OtPGCEr2MiBm5KVpQ3Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_155244_044843_D0DCB21B 
X-CRM114-Status: GOOD (  21.91  )
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

Ck9uIDQvNi8yMSA3OjA3IFBNLCBQcmF0eXVzaCBZYWRhdiB3cm90ZToKPiBbUGxlYXNlIG5vdGU6
IFRoaXMgZS1tYWlsIGlzIGZyb20gYW4gRVhURVJOQUwgZS1tYWlsIGFkZHJlc3NdCj4KPiBPbiAw
Mi8wNC8yMSAwMzo1MEFNLHlhbGlhbmcud2FuZ0B3aW5kcml2ZXIuY29tICB3cm90ZToKPj4gRnJv
bTogWWFsaWFuZyBXYW5nPFlhbGlhbmcuV2FuZ0B3aW5kcml2ZXIuY29tPgo+Pgo+PiBzcGlfbm9y
X2NsZWFyX2ZzcigpIGFuZCBzcGlfbm9yX2NsZWFyX3NyKCkgYXJlIGFsbW9zdCB0aGUgc2FtZSwg
ZXhjZXB0Cj4+IHRoZSBvcGNvZGUgdGhleSB1c2VkLCB0aGUgY29kZXMgY2FuIGJlIGVhc2lseSBy
ZXVzZWQgd2l0aG91dCBtdWNoCj4+IGNoYW5naW5nLgo+IEhvbmVzdGx5LCBJIGFtIG5vdCBzdXJl
IGhvdyBJIGZlZWwgYWJvdXQgdGhpcy4gWWVzLCBpdCB3b3VsZCByZWR1Y2Ugc29tZQo+IGNvZGUg
ZHVwbGljYXRpb24gYnV0IGF0IHRoZSBzYW1lIHRpbWUgcmVkdWNlcyB0aGUgcmVhZGFiaWxpdHkg
c2xpZ2h0bHkuCj4gc3BpX25vcl9jbGVhcl9mc3Iobm9yKSBpcyBlYXNpZXIgdG8gcmVhZCB0aGFu
IHNwaV9ub3JfY2xlYXJfc3Iobm9yLCBPUF9DTEZTUikuCj4gSSB3b24ndCBibGFtZSBzb21lb25l
IGZvciBtaXNzaW5nIHRoYXQgJ0YnIGFuZCB0aGlua2luZyB0aGF0IGl0IGFjdHVhbGx5Cj4gc2lt
cGx5IGNsZWFycyB0aGUgU1IuIER1bm5vLi4uCj4KPiBBbnl3YXksIGlmIHdlIGRvIGRlY2lkZSB0
byBnbyB0aHJvdWdoIHdpdGggdGhpcyBjaGFuZ2UsIHRoZSBjb2RlIGNoYW5nZXMKPiBsb29rIGdv
b2QgdG8gbWUuClRoZSByZWFzb24gd2h5IGFtIEkgZG9pbmcgdGhpcyBpcyBxdWl0ZSBzaW1wbGUs
IHRoZSBjb250ZW50cyBvZiB0aGUgCmZ1bmN0aW9uwqAgYXJlIHJlbGF0aXZlbHnCoCBjb21tb24s
IG5vIG90aGVyIG1hbnVmYWN0dXJlciBzcGVjaWZpYyBjb2RlcyAKaW52b2x2ZWQsIGFuZCBpdCBj
YW4gYmUgZWFzaWx5IGV4cGFuZGVkIHRvIG90aGVyIG1hbnVmYWN0dXJlcnMuwqAgCkFjdHVhbGx5
IHRoZXJlIGlzIGFuIGluc3RhbnQgZXhhbXBsZSwgImlzMjV3cDI1NiIgY2hpcCBuZWVkcyB0byBj
bGVhciAKZXJyb3IgYml0cyB3aXRoIHVzaW5nIENMRUFSIEVYVEVOREVEIFJFQUQgUkVHSVNURVIg
T1BFUkFUSU9OIChDTEVSUCwgCjgyaCkgWzFdLgoKV2l0aCB0aGF0IHNhaWQsIHRoZSBuYW1lIG9m
IHRoZSBmdW5jdGlvbiBkbyBjYW4gYmUgcmV2aXNlZCwgbWF5YmUgdGhlIApuYW1lICJzcGlfbm9y
X2NsZWFyX3N0YXR1cygpIiBpcyBtb3JlIHByb3Blcj8KClsxXTogaHR0cHM6Ly93d3cuaXNzaS5j
b20vV1cvcGRmLzI1TFAtV1AyNTYucGRmIDsgUGFnZTIxLFBhZ2UyMiA7Cj4+IFNpZ25lZC1vZmYt
Ynk6IFlhbGlhbmcgV2FuZzxZYWxpYW5nLldhbmdAd2luZHJpdmVyLmNvbT4KPj4gLS0tCj4+ICAg
ZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMgfCA0MCArKysrKysrLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDMzIGRl
bGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMg
Yi9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYwo+PiBpbmRleCA2ZGM4YmQwYTZiZDQuLmRiZDZh
ZGI2YWEwYiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKPj4gKysr
IGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKPj4gQEAgLTY1MiwxNCArNjUyLDE1IEBAIHN0
YXRpYyBpbnQgc3BpX25vcl94c3JfcmVhZHkoc3RydWN0IHNwaV9ub3IgKm5vcikKPj4gICAvKioK
Pj4gICAgKiBzcGlfbm9yX2NsZWFyX3NyKCkgLSBDbGVhciB0aGUgU3RhdHVzIFJlZ2lzdGVyLgo+
PiAgICAqIEBub3I6ICAgICBwb2ludGVyIHRvICdzdHJ1Y3Qgc3BpX25vcicuCj4+ICsgKiBAb3Bj
b2RlOiAgdGhlIFNQSSBjb21tYW5kIG9wIGNvZGUgdG8gY2xlYXIgc3RhdHVzIHJlZ2lzdGVyLgo+
PiAgICAqLwo+PiAtc3RhdGljIHZvaWQgc3BpX25vcl9jbGVhcl9zcihzdHJ1Y3Qgc3BpX25vciAq
bm9yKQo+PiArc3RhdGljIHZvaWQgc3BpX25vcl9jbGVhcl9zcihzdHJ1Y3Qgc3BpX25vciAqbm9y
LCB1OCBvcGNvZGUpCj4+ICAgewo+PiAgICAgICAgaW50IHJldDsKPj4KPj4gICAgICAgIGlmIChu
b3ItPnNwaW1lbSkgewo+PiAgICAgICAgICAgICAgICBzdHJ1Y3Qgc3BpX21lbV9vcCBvcCA9Cj4+
IC0gICAgICAgICAgICAgICAgICAgICBTUElfTUVNX09QKFNQSV9NRU1fT1BfQ01EKFNQSU5PUl9P
UF9DTFNSLCAwKSwKPj4gKyAgICAgICAgICAgICAgICAgICAgIFNQSV9NRU1fT1AoU1BJX01FTV9P
UF9DTUQob3Bjb2RlLCAwKSwKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNQ
SV9NRU1fT1BfTk9fQUREUiwKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNQ
SV9NRU1fT1BfTk9fRFVNTVksCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBT
UElfTUVNX09QX05PX0RBVEEpOwo+PiBAQCAtNjY4LDEyICs2NjksMTIgQEAgc3RhdGljIHZvaWQg
c3BpX25vcl9jbGVhcl9zcihzdHJ1Y3Qgc3BpX25vciAqbm9yKQo+Pgo+PiAgICAgICAgICAgICAg
ICByZXQgPSBzcGlfbWVtX2V4ZWNfb3Aobm9yLT5zcGltZW0sICZvcCk7Cj4+ICAgICAgICB9IGVs
c2Ugewo+PiAtICAgICAgICAgICAgIHJldCA9IHNwaV9ub3JfY29udHJvbGxlcl9vcHNfd3JpdGVf
cmVnKG5vciwgU1BJTk9SX09QX0NMU1IsCj4+ICsgICAgICAgICAgICAgcmV0ID0gc3BpX25vcl9j
b250cm9sbGVyX29wc193cml0ZV9yZWcobm9yLCBvcGNvZGUsCj4+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE5VTEwsIDApOwo+PiAgICAgICAg
fQo+Pgo+PiAgICAgICAgaWYgKHJldCkKPj4gLSAgICAgICAgICAgICBkZXZfZGJnKG5vci0+ZGV2
LCAiZXJyb3IgJWQgY2xlYXJpbmcgU1JcbiIsIHJldCk7Cj4+ICsgICAgICAgICAgICAgZGV2X2Ri
Zyhub3ItPmRldiwgImVycm9yICVkIGNsZWFyaW5nIHN0YXR1c1xuIiwgcmV0KTsKPj4gICB9Cj4+
Cj4+ICAgLyoqCj4+IEBAIC02OTcsNyArNjk4LDcgQEAgc3RhdGljIGludCBzcGlfbm9yX3NyX3Jl
YWR5KHN0cnVjdCBzcGlfbm9yICpub3IpCj4+ICAgICAgICAgICAgICAgIGVsc2UKPj4gICAgICAg
ICAgICAgICAgICAgICAgICBkZXZfZXJyKG5vci0+ZGV2LCAiUHJvZ3JhbW1pbmcgRXJyb3Igb2Nj
dXJyZWRcbiIpOwo+Pgo+PiAtICAgICAgICAgICAgIHNwaV9ub3JfY2xlYXJfc3Iobm9yKTsKPj4g
KyAgICAgICAgICAgICBzcGlfbm9yX2NsZWFyX3NyKG5vciwgU1BJTk9SX09QX0NMU1IpOwo+Pgo+
PiAgICAgICAgICAgICAgICAvKgo+PiAgICAgICAgICAgICAgICAgKiBXRUwgYml0IHJlbWFpbnMg
c2V0IHRvIG9uZSB3aGVuIGFuIGVyYXNlIG9yIHBhZ2UgcHJvZ3JhbQo+PiBAQCAtNzE1LDMzICs3
MTYsNiBAQCBzdGF0aWMgaW50IHNwaV9ub3Jfc3JfcmVhZHkoc3RydWN0IHNwaV9ub3IgKm5vcikK
Pj4gICAgICAgIHJldHVybiAhKG5vci0+Ym91bmNlYnVmWzBdICYgU1JfV0lQKTsKPj4gICB9Cj4+
Cj4+IC0vKioKPj4gLSAqIHNwaV9ub3JfY2xlYXJfZnNyKCkgLSBDbGVhciB0aGUgRmxhZyBTdGF0
dXMgUmVnaXN0ZXIuCj4+IC0gKiBAbm9yOiAgICAgcG9pbnRlciB0byAnc3RydWN0IHNwaV9ub3In
Lgo+PiAtICovCj4+IC1zdGF0aWMgdm9pZCBzcGlfbm9yX2NsZWFyX2ZzcihzdHJ1Y3Qgc3BpX25v
ciAqbm9yKQo+PiAtewo+PiAtICAgICBpbnQgcmV0Owo+PiAtCj4+IC0gICAgIGlmIChub3ItPnNw
aW1lbSkgewo+PiAtICAgICAgICAgICAgIHN0cnVjdCBzcGlfbWVtX29wIG9wID0KPj4gLSAgICAg
ICAgICAgICAgICAgICAgIFNQSV9NRU1fT1AoU1BJX01FTV9PUF9DTUQoU1BJTk9SX09QX0NMRlNS
LCAwKSwKPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgU1BJX01FTV9PUF9OT19B
RERSLAo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBTUElfTUVNX09QX05PX0RV
TU1ZLAo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBTUElfTUVNX09QX05PX0RB
VEEpOwo+PiAtCj4+IC0gICAgICAgICAgICAgc3BpX25vcl9zcGltZW1fc2V0dXBfb3Aobm9yLCAm
b3AsIG5vci0+cmVnX3Byb3RvKTsKPj4gLQo+PiAtICAgICAgICAgICAgIHJldCA9IHNwaV9tZW1f
ZXhlY19vcChub3ItPnNwaW1lbSwgJm9wKTsKPj4gLSAgICAgfSBlbHNlIHsKPj4gLSAgICAgICAg
ICAgICByZXQgPSBzcGlfbm9yX2NvbnRyb2xsZXJfb3BzX3dyaXRlX3JlZyhub3IsIFNQSU5PUl9P
UF9DTEZTUiwKPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBOVUxMLCAwKTsKPj4gLSAgICAgfQo+PiAtCj4+IC0gICAgIGlmIChyZXQpCj4+IC0g
ICAgICAgICAgICAgZGV2X2RiZyhub3ItPmRldiwgImVycm9yICVkIGNsZWFyaW5nIEZTUlxuIiwg
cmV0KTsKPj4gLX0KPj4gLQo+PiAgIC8qKgo+PiAgICAqIHNwaV9ub3JfZnNyX3JlYWR5KCkgLSBR
dWVyeSB0aGUgRmxhZyBTdGF0dXMgUmVnaXN0ZXIgdG8gc2VlIGlmIHRoZSBmbGFzaCBpcwo+PiAg
ICAqIHJlYWR5IGZvciBuZXcgY29tbWFuZHMuCj4+IEBAIC03NjYsNyArNzQwLDcgQEAgc3RhdGlj
IGludCBzcGlfbm9yX2Zzcl9yZWFkeShzdHJ1Y3Qgc3BpX25vciAqbm9yKQo+PiAgICAgICAgICAg
ICAgICAgICAgICAgIGRldl9lcnIobm9yLT5kZXYsCj4+ICAgICAgICAgICAgICAgICAgICAgICAg
IkF0dGVtcHRlZCB0byBtb2RpZnkgYSBwcm90ZWN0ZWQgc2VjdG9yLlxuIik7Cj4+Cj4+IC0gICAg
ICAgICAgICAgc3BpX25vcl9jbGVhcl9mc3Iobm9yKTsKPj4gKyAgICAgICAgICAgICBzcGlfbm9y
X2NsZWFyX3NyKG5vciwgU1BJTk9SX09QX0NMRlNSKTsKPj4KPj4gICAgICAgICAgICAgICAgLyoK
Pj4gICAgICAgICAgICAgICAgICogV0VMIGJpdCByZW1haW5zIHNldCB0byBvbmUgd2hlbiBhbiBl
cmFzZSBvciBwYWdlIHByb2dyYW0KPiAtLQo+IFJlZ2FyZHMsCj4gUHJhdHl1c2ggWWFkYXYKPiBU
ZXhhcyBJbnN0cnVtZW50cyBJbmMuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
