Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3831FC47DDB
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Jan 2024 22:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I/o8jE69YbwijxCQa27c16RmDixUZctoGJTkWpjlOZo=; b=b7eKLAyTozwbUk
	D0Z/YGCNfK1KWz0bgi6B9dNzjqMZzJAHvRSyVd7oWm/lH1MVg2e4fAda02jiXOG4higqU5hBIa7Oj
	lb39QtojkfPjyHyCvMYJAwlVscqE/Es0ICwB7hQiP4wt/MWA6MFQjQmNOOo+42N5EFN8/bkNWcmjo
	z5zun2bIlCbJgQYYfeIswZ4/lTGBTgpJYOKsTjBQYKnKVa7HfnABQi2eiWeDlUX01nqwa8Jyq+VGD
	Q3YE5bWsBMeGwvJUdOMgaJxIQu12/HiVbPfSbkPJFjPkVrkueHw2rbVQKeq9wwfPe1jfmtjTNXNpm
	i22wrCS92GdbK774EmSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSPV7-000jxo-0d;
	Tue, 23 Jan 2024 22:44:13 +0000
Received: from mx0b-00007101.pphosted.com ([148.163.139.28])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSPV4-000jvv-1b
	for linux-mtd@lists.infradead.org;
	Tue, 23 Jan 2024 22:44:12 +0000
Received: from pps.filterd (m0166258.ppops.net [127.0.0.1])
	by mx0b-00007101.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40NM7pca020560;
	Tue, 23 Jan 2024 22:44:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=illinois.edu; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=campusrelays;
 bh=0ipa3NIBNATUGTdZHX0st3ZkdUJYwJqa9u6KRYd1W6I=;
 b=BPrBu6tylD8Gd5X5vBeY+is+Fp4iEcihbTp55I2t114kYV0lNj76V8rmHS5AHNCg2olX
 CVfiYsCUMbI0mtpmOr4DOwy+akmO4CiQ7G+ikRPh1GN/nReobqP1AUF3CnfBaapVVQ4x
 EpFDz6UQLlKq1c6qyLnp2CeEWWmy5WF54b6ou8F3i9EIZBvDL8YKXwsTNtmvcSXD7RE6
 IAh7EUZNlFIZV6wrooCmaV+tKy1AfOjiaCrpcxkUaNtjraCQ9074tboDlfeZcNlYugYV
 mRKXck5TmEOy3wESGA9k0c1XZDzX77iDNz77UW99zImn+dWXo3WV2SWYgvixMOL8zQR4 tg== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by mx0b-00007101.pphosted.com (PPS) with ESMTPS id 3vtnht0fxw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Jan 2024 22:44:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=asldR6nhcy0T5Ci/vTHqXt6L4ffZNWq5Y6eMRwkUhD7hx7hiWZKhBxquRbF6fGFvnxMzBzc2YctPNvLF8AgKCbe04PyfS2KjhUnmrtsNCnF6yIy/tRAHznBhhuk8VI4jAwFYjUlZAX5UzHSFu4Z4o02BJpaPmtmJBENd0CvB5V5pKwCpLeG4GMAEaIQR9ifrtIo+qNnBpr5Gqm8eL+AqWLE+ANLWoAHWiFwRHKrgSRER5/zkOT7mx9xSuNVtC55qM4/ze1AWlgadbhT7OCi3haSZ7macD17EjzlM9OWbr1JKwMMNceUTatMiwQSi2hUgFPsbuOc7sOkxVWQYUIF2PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ipa3NIBNATUGTdZHX0st3ZkdUJYwJqa9u6KRYd1W6I=;
 b=dE5jx3O/VXCr6NgZSsPdevAhOKg/web/Zo9/PbMayYo3m/PwdvEYJyWVELxzoIovitAzCNypgUy2Kt3jr0/V0Uourk6UtwDvzgSBSuJtNOB+H9dbL4y5hENbimQlfAlSnsxC1qazijXrG/6nZfEySRXqJgnsVl5SfWHoyL+D6cQ3eCgz9N3xAhXk+zF25VI/NBMSmBcpk9QB4Hd43iE9jCT0CaaA24UhN1sYCpVSHCcSoCgM7MjNtirtg67/hjqQLze3wO0hZ53SCGdRVATi2ICrDc/CbwmtN+1bILCTRS5htzOnYx6tuJJ4FLeurk+uGo8CiZIafP2yQb6sjOrVWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=illinois.edu; dmarc=pass action=none header.from=illinois.edu;
 dkim=pass header.d=illinois.edu; arc=none
Received: from PH7PR11MB5768.namprd11.prod.outlook.com (2603:10b6:510:131::21)
 by CH0PR11MB5506.namprd11.prod.outlook.com (2603:10b6:610:d5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.37; Tue, 23 Jan
 2024 22:44:01 +0000
Received: from PH7PR11MB5768.namprd11.prod.outlook.com
 ([fe80::3fae:5e3f:9709:dc2c]) by PH7PR11MB5768.namprd11.prod.outlook.com
 ([fe80::3fae:5e3f:9709:dc2c%7]) with mapi id 15.20.7228.022; Tue, 23 Jan 2024
 22:44:01 +0000
From: "Yang, Chenyuan" <cy54@illinois.edu>
To: Richard Weinberger <richard@nod.at>
CC: linux-mtd <linux-mtd@lists.infradead.org>,
        Miquel Raynal
	<miquel.raynal@bootlin.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        syzkaller
	<syzkaller@googlegroups.com>,
        "Zhao, Zijie" <zijie4@illinois.edu>,
        "Zhang,
 Lingming" <lingming@illinois.edu>
Subject: Re: [Linux Kernel Bug] WARNING: zero-size vmalloc in
 ubi_read_volume_table
Thread-Topic: [Linux Kernel Bug] WARNING: zero-size vmalloc in
 ubi_read_volume_table
Thread-Index: AQHaQj+4RGN0tgPjZkuYXFZU3Q3pbrDnOT+A/mfrKH2BmCf8gKrQHNMb1TBJBQA=
Date: Tue, 23 Jan 2024 22:44:01 +0000
Message-ID: <A65BC97A-20AA-4B9E-B7A1-6151B9E7CDC2@illinois.edu>
References: <PH7PR11MB57682489034B17034C021B04A06B2@PH7PR11MB5768.namprd11.prod.outlook.com>
 <1433EB7A-FC89-47D6-8F47-23BE41B263B3@illinois.edu>
 <1461336945.270251.1706026541359.JavaMail.zimbra@nod.at>
 <FECA0ED0-EBF6-48CC-974C-B936007091E9@illinois.edu>
 <1365676233.271004.1706041442841.JavaMail.zimbra@nod.at>
In-Reply-To: <1365676233.271004.1706041442841.JavaMail.zimbra@nod.at>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB5768:EE_|CH0PR11MB5506:EE_
x-ms-office365-filtering-correlation-id: 0c35c2be-7b05-4c26-ba5f-08dc1c64cb51
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eTw9wxuIYyVTo2Yv8kG1JZP4Jbh0DwB0F21bxl5RIbJ6IhOw/pjbpKqAbYm3RlJQvp7kWhrzoP6hVcOJHp+ynTqNMmNidNXpDmvBqwVmZFVYwOqK8jJ1EH+a6C0KZtwLY/YVKHFd6Ph27O3pUgzzJNBftchfH+QuPqB6M9xvQRPIRkiD2AHFgLfMeOoEcfLuPMH5RB/AhswvTMpMV02duLLdzOzJGauNJfxaJp0OjZsM3J2QBTgvlXZtw56h3WEHcsexBLCVcQJIFSuSklDlaDXzV2NkTw/6vMbXJNz57mDnYOZC+NBUF0jCj5Oari835ARuRDZWcWOMsEeG3YhTKqFIhy6G/CbJQRmIxiXd04hs7hYGI63/bGS4JVsf0D7DapWv0PzGxdiC7kDL622GmHBES1GnvQZJN1lT9rnjk+hNnNPP90UKt9ZDUcpNG56t+a7lck0NeWLcT3soeYDtUucZxCYdFn22tro8qUk6jxZDHLfDgd67a81Kxx/buwGzEqKnMW4HQGuH1rNb9miUoZVvl6OEMKyNCLcxusj1dSoz2uE2K0yKRyJt/8UXxuPnNpm33BIUhOjP4zxv11L1NwHKBKrhe2dtbtMfzjK52M94rl7sk6i8UoxH6tMexSy3vnptU6gy4De7GAenWJIBWk0ZKTtofTViIz2VfeLoqhQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB5768.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(39860400002)(366004)(136003)(346002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(478600001)(6486002)(71200400001)(75432002)(8676002)(83380400001)(38100700002)(5660300002)(6506007)(4326008)(8936002)(122000001)(2906002)(26005)(4744005)(66556008)(86362001)(64756008)(41300700001)(6512007)(36756003)(33656002)(107886003)(786003)(6916009)(54906003)(66476007)(38070700009)(66946007)(316002)(2616005)(66446008)(76116006)(88722005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V08xMkh5NzhKbndsK3ZiNVp4YTdPVlRPWVd5ZTk4d1VYWnJuQ0RjbHp5eWVz?=
 =?utf-8?B?aGtaS21GTXNaa2F5dW5MT0RCNDZUMktsTldrN3g3RlVBZzdNSFczcUJNZzF4?=
 =?utf-8?B?ODJZU21CdGJ3WkxrWkNmSUE2RU1YbGxmMEV4UWNDYjVVZzdCV3pwQ1NvSlJo?=
 =?utf-8?B?UE05MmYvUGZZMmQwYzN2K2R3b01mWTFCaVNTeVRJNXRWRnpISitZcjNYVVFS?=
 =?utf-8?B?UCt2c3h5VVkrRUpySTZDWFRmSDIrSVVacFBiRW11QlR4Z0JGSFRjM3JrT1F1?=
 =?utf-8?B?U1NZRWxJSEdaMUQ0RUFQWnBXZS9BSjRRWkh6UWJXUkwzZDU2Wk02SHdBVEpJ?=
 =?utf-8?B?VG1uMy9pMnU2YVhBWGhRcXFVK3UzVzNrditBMnhJUnFZTG55VzU3N2VUOUcw?=
 =?utf-8?B?eTdtYnlFOU9KaHY0QWxzVFpoWTZDM0pRRVFiRnV3emMxWTVOQkpzdHM0QXdt?=
 =?utf-8?B?RDFrb3lzODNHVCtwaWt0bTA0eExsaU04MWxyV0ZmUFhxbGkwdEVJL1k3aHgv?=
 =?utf-8?B?b1Z3bk5KZzM3WnpqS0Y1RjVaeFpyMHVvUUI5eTJhV2U4ZFlSUkhUNHhxMGZF?=
 =?utf-8?B?NmZORVRjeVZkNFJvSGhpSzlRalhFenhqeTg3U1hiWkRudWRoSk82N3hwNEZr?=
 =?utf-8?B?MFZ6QjRURE81cHJKSm5YbjVXWUZGRE9CNVpWRkcyc0lleS9lL3VSRXE4U2dp?=
 =?utf-8?B?Ukg0ZXhyNi9qNEpMVDJ5N3NOaFZhUlZrd1RyeU5xRG1adEMxUEpyUWFPTHJ4?=
 =?utf-8?B?Q25JMUI1K2lmUU4zYlV0dTZtL2ZPUnVSalZyRGNRZlpML0sxcTROQTJGeHNx?=
 =?utf-8?B?cUdvZjE4NHRnUVpaaktUYWQ2N2x1bVl0YnFXMnMyT2NMMlRQTEE1cHhFdkxp?=
 =?utf-8?B?dmt6MlY0QmpzL0JicXA4bmxOVi8veDFkdm5rMkpqRzNkZmdXeVI0eUFSMFYx?=
 =?utf-8?B?SGlMWjVYd21uSlVrcUpvTW1ScU9La2o4OGhEL2F1USt4TVFHczdPRWRGajZW?=
 =?utf-8?B?UE9Wbm9vQ3Z1NDNsb3RuaUNiY29ZMXR2dmZINDUrazVCaXErYks3aWsvQ2ZT?=
 =?utf-8?B?bjNxY2ZUMXJuMWxsZWc3Vm5WUlJyZElsOE5UMWVIM0tTdG9IRUFBUURKbWZJ?=
 =?utf-8?B?VXVLam4zdFV1KzhMOE5yYmpTNXJJRWZ5dTQxakgxMW5OeFhRSFVWdzFHRWVx?=
 =?utf-8?B?ZnBmTWp4Z0hoOE9Za2FadWV2dTNoN3psZ0RvemJJK05tUWxLU1psVXczdDFI?=
 =?utf-8?B?TkRROFhHY2dqbkRkdkNYVjdJQWVJZDZrUFRUYm4zeEg4TnBXNkJ5WU8wUmJ5?=
 =?utf-8?B?MVpxM3Z3aUFFVkRsbGJRMGRQQkY5RDBsSTJpSC9IUUtGQ3dYYjBnbklkQlZv?=
 =?utf-8?B?RTRZS2dZNzZvclY0dkhMd3Y4YnlEeWVQSlhtNG1oUC8vNzEvT2w0eGdqRElV?=
 =?utf-8?B?V3crYnBUbTRJdG0rbzlXbkJSL2g1YjQ5QlpxZmJsOHhtcVRmeUNjRHl2MDRi?=
 =?utf-8?B?Tk1DMDJ3dCs1WVZOV1kyQWpRTFo3dTF1MFRnTGVqVTJEc0dBTE85WE0wRmQz?=
 =?utf-8?B?NUhINlUzRllGbTJYampFeTJJd0NiMlJjK29UeVZwYjNMMGhaQzZkM0FNY0Q1?=
 =?utf-8?B?VHZ1WXJkbkIrNFQ4L0FKZnVIb1VXMGlxeklTQ3ptNlNzNHRtTDVqWG40UU9a?=
 =?utf-8?B?cXp4UXFUT2FOaXpmS214K2paUFhKVjRBOTVGcitOWDAzazl2SWhrenBjMUhP?=
 =?utf-8?B?YytJeE5xMDVLMnJ0SnBrc0JjSXFGVHZ4SkhQU2l1bmJtOGtNYWNVRVBjQ1NL?=
 =?utf-8?B?YTZ3ZEhSS01iY3FwUTBGRzM4S0NteUZGK2dKbnZDeEowTzM2UHBKK3R0YlVS?=
 =?utf-8?B?RFVqc3MzZXRPWDUrQ29sTWMrUkJKYmo5OVhrbEdzQUFTZUNiaVVIc0JJYlY4?=
 =?utf-8?B?WEFVRVQzRGw0ZzVkR21TQ0dzYzE2cEFxRnVrWEFNWEZscGtjeHpHYmVSTnZB?=
 =?utf-8?B?Q2dCcDh3eXJKNHRWdnBoMU5kNnNiMlNhck9ucHhHdEprNXA4SnR2bTJKa0tx?=
 =?utf-8?B?OFpnRFhwUWdPTVAzdGplUkE1bVlaMlN5eVFMSHBaTDl5Y05wWmljbTRibEFR?=
 =?utf-8?Q?++MZBfPubIGvHUq7U+fTuGHaQ?=
Content-ID: <2213F233DEAE2F409A95AF3D29334E93@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: illinois.edu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5768.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c35c2be-7b05-4c26-ba5f-08dc1c64cb51
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2024 22:44:01.2873
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 44467e6f-462c-4ea2-823f-7800de5434e3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qIKUO+qBCZ4fBDaj1vVaCNQesQronS9VdQLrSbGW8X4DMusDpJRQ/XRH0IaJpWl58Qhmm8FkhhK4Y4NYTN4pRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5506
X-Proofpoint-ORIG-GUID: 6LVuOqsDbIukjYWnMkgE71m4Y5t81oE9
X-Proofpoint-GUID: 6LVuOqsDbIukjYWnMkgE71m4Y5t81oE9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_144410_778098_1258D365 
X-CRM114-Status: GOOD (  14.47  )
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

SGkgUmljaGFyZCwNCg0KSGVyZSBpcyB0aGUgY29udGVudCBvZiAvcHJvYy9tdGQNCg0KYGBgDQpj
YXQgL3Byb2MvbXRkDQpkZXY6ICAgIHNpemUgICBlcmFzZXNpemUgIG5hbWUNCm10ZDA6IDAwMDIw
MDAwIDAwMDAxMDAwICJtdGRyYW0gdGVzdCBkZXZpY2UiDQpgYGANCg0KQnkgZGVmYXVsdCwgdGhl
IC9kZXYvbXRkMCBpcyBlbXB0eSBhbmQgdGhlcmUgaXMgbm8gbXRkLXV0aWxzIGluc3RhbGxlZC4g
DQpBZnRlciBpbnN0YWxsaW5nIG10ZC11dGlscyBhbmQgcnVubmluZyBtdGRpbmZvIC1hLA0KDQpg
YGANCm10ZGluZm8gLWENCkNvdW50IG9mIE1URCBkZXZpY2VzOiAgICAgICAgICAgMQ0KUHJlc2Vu
dCBNVEQgZGV2aWNlczogICAgICAgICAgICBtdGQwDQpTeXNmcyBpbnRlcmZhY2Ugc3VwcG9ydGVk
OiAgICAgIHllcw0KDQptdGQwDQpOYW1lOiAgICAgICAgICAgICAgICAgICAgICAgICAgIG10ZHJh
bSB0ZXN0IGRldmljZQ0KVHlwZTogICAgICAgICAgICAgICAgICAgICAgICAgICByYW0NCkVyYXNl
YmxvY2sgc2l6ZTogICAgICAgICAgICAgICAgNDA5NiBieXRlcywgNC4wIEtpQg0KQW1vdW50IG9m
IGVyYXNlYmxvY2tzOiAgICAgICAgICAzMiAoMTMxMDcyIGJ5dGVzLCAxMjguMCBLaUIpDQpNaW5p
bXVtIGlucHV0L291dHB1dCB1bml0IHNpemU6IDEgYnl0ZQ0KU3ViLXBhZ2Ugc2l6ZTogICAgICAg
ICAgICAgICAgICAxIGJ5dGUNCkNoYXJhY3RlciBkZXZpY2UgbWFqb3IvbWlub3I6ICAgOTA6MA0K
QmFkIGJsb2NrcyBhcmUgYWxsb3dlZDogICAgICAgICBmYWxzZQ0KRGV2aWNlIGlzIHdyaXRhYmxl
OiAgICAgICAgICAgICB0cnVlDQpgYGANCg0KQmVzdCwNCkNoZW55dWFuDQoNCu+7v09uIDEvMjMv
MjQsIDI6MjTigK9QTSwgIlJpY2hhcmQgV2VpbmJlcmdlciIgPHJpY2hhcmRAbm9kLmF0PiB3cm90
ZToNCg0KICAgIC0tLS0tIFVyc3Byw7xuZ2xpY2hlIE1haWwgLS0tLS0NCiAgICA+IFZvbjogIkNo
ZW55dWFuIFlhbmciIDxjeTU0QGlsbGlub2lzLmVkdT4NCiAgICA+IElmIHlvdSBuZWVkIG1vcmUg
aW5mb3JtYXRpb24sIGZlZWwgZnJlZSB0byBjb250YWN0IG1lLg0KDQogICAgV2hhdCBpcyBtdGQw
IGluIHlvdXIgY2FzZT8NCg0KICAgIFBsZWFzZSBzaG93IG1lIHRoZSBjb250ZW50cyBvZiAvcHJv
Yy9tdGQgYW5kLCBpZiBwb3NzaWJsZSwgbXRkaW5mbyAtYS4NCg0KICAgIFRoYW5rcywNCiAgICAv
L3JpY2hhcmQNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
