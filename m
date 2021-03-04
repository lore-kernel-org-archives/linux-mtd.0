Return-Path: <SRS0=6kki=IC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E9B2C433DB
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Mar 2021 19:47:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEEDA64F73
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Mar 2021 19:46:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DEEDA64F73
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=aes-corp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xygwRrbM+2CkG+9cdVgyBBUzeW1Elr1ypFy2BlP2MnE=; b=YIWXjpUoQobsLZ
	4j60zKN2yZ9kFcHzF2z9G/fUodb3Lud3fbjti9YJrErglfkeVr1BIUzNFDrxa7ZtmrXGJY6cz9Yp0
	4Silv39VgpNue55bimeyJtbbcXhNZSG5ABZp4+pWejrT2cbxXDP0tFvym1WpVzlfbzTL7/ZMublkO
	+UcVclPhPh7B64YHoyBSG47DLNJcolgmQccBEdZvcP6LXqzCG0aGOwNo/HVkHS3XYALN1AwG0/cev
	PwZM4LMfQHPLbPKi50HfK6zQGUmGzFwbKz55InJzdl29dxxYCkysTJJOjU5zrp0GHVv4MsAAEb1LF
	0UdMJhtW9TaSGsXbKH7Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHtvL-009owc-Qh; Thu, 04 Mar 2021 19:46:16 +0000
Received: from mail-dm6nam10on2117.outbound.protection.outlook.com
 ([40.107.93.117] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHtvB-009ouv-2N
 for linux-mtd@lists.infradead.org; Thu, 04 Mar 2021 19:46:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eL6hqbZ8N5VOMAbz5h20lYgG9h4Y0N620wzoVRPWaXIVQqiLgTAPXBtdGvWfy7VV6RmRx9BuGSe+B58k65jOSYbcTzwyLZrreqfEKcknJbI3pAidn8GHK5FdrmFJOJm9uLJYCIpg5CV7jaIOz2BtoxObcIF1i2oO3fJQuU0isVxs6lKy1BmxRHhmLo8B71OTjqcK5sVfslJy2q9wEKkqTf8+Kybadxzkic2gCd1G1STuTMqt5ztsFj9G1g+i5s9P1wyBkSLY8MQR9CxHlj6tjpmHQ4XlT+3YJ+UmHavHHrG4wixqXrVrB+4a5Dm+0PS/yXxrZPtQFSUbKdgdCZmuNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKYGCbKwQW/uFloL+QQvL232V878f5LdUECaTqsOrvQ=;
 b=JMyiEDh9DqwRDq4UubzVx1jrOFxF9LkrhT2JSdmN5u+EPPgfkGGqwMq6CAqhBcnhkB2bJxxDThUI617VUpGpSduSBWz6oSwQmTyxrQFHs78sieU/0FiMWqryAgi0hVFQqPI2L0nlqaT8wrssx/ff1IUFzhPWTA1hHfO3+LHDnvCtRSZfs/flvLz7+RhfIM9gRi1hUJnHCvsJEc8wy3g8QB7XuFShJ3gKe/tBls/7OsSjhm6T2LEklbnNk64zDobPPiSUclzO1/0H+7FRdhsRSU8i1ton4tBVRVwFjAzrCsrGZNclokvrE/RPY24IB7o7ftbKp9NNIIrBBdL1gwockg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aes-corp.com; dmarc=pass action=none header.from=aes-corp.com;
 dkim=pass header.d=aes-corp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aes-corp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKYGCbKwQW/uFloL+QQvL232V878f5LdUECaTqsOrvQ=;
 b=DkXDKhx55E5672AuweZmFjkTlP2cj8KPZuQMuWBw9HsXcDuR+JRFv/cFEQkZ3h4qnjSO9/l8RB4PsghRsBnvU3SJZ2Szt9IW8O95atsVqz2hN2Tb3ixiR5Md1UksRQOPShmrCML81ZpdkP6nIJahEQwQalWVpZcRkChmOZ24/TJErQNa9aEGhWf+AluMqKpt/tFFEL3dZArvlPsJz8v6ls8IDxR/LxRANTIfHZ2lJq18rKlIPJmQlW26MU3s0r3YM5ClDVXJD9NyxnVgK5VHQa64t89vaboXaEgiQ0kVZXgTcldrsz6Nx6T0y7GxCWoIY4V9MYRNHzDmoUOy5iE2dg==
Received: from MN2PR04MB5615.namprd04.prod.outlook.com (2603:10b6:208:fe::12)
 by MN2PR04MB6206.namprd04.prod.outlook.com (2603:10b6:208:e0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Thu, 4 Mar
 2021 19:46:01 +0000
Received: from MN2PR04MB5615.namprd04.prod.outlook.com
 ([fe80::fd2d:fa9f:efd5:a147]) by MN2PR04MB5615.namprd04.prod.outlook.com
 ([fe80::fd2d:fa9f:efd5:a147%3]) with mapi id 15.20.3912.021; Thu, 4 Mar 2021
 19:46:01 +0000
From: Justin Mitchell <jmitchell@aes-corp.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: NAND Flash Issue Need Help!
Thread-Topic: NAND Flash Issue Need Help!
Thread-Index: AdcRLtMeXTwJKos/T+u3bIn3Xls05w==
Date: Thu, 4 Mar 2021 19:46:01 +0000
Message-ID: <MN2PR04MB5615AF59C4607D49A31704C195979@MN2PR04MB5615.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=aes-corp.com;
x-originating-ip: [173.9.27.109]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 77d1310c-0804-4f19-633c-08d8df4623c8
x-ms-traffictypediagnostic: MN2PR04MB6206:
x-microsoft-antispam-prvs: <MN2PR04MB62063D65837B1D806DEFA5E995979@MN2PR04MB6206.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ECw6Rzf4jRgSU/5niCSUv6J7ZObyxTAO+nFa7STWadFWELThwJHbtKYJ4qcA2FHmbk7PwF5oqidBaK/6kniSQu/yb52tljDrMnUhVa/VrXwAz/3bfzepXuEfa0vYcUARNCNGDAmHtgVTYeriOqD8myORVcHOMCAoDVhVEqQzYCeHgAVtsBwDcQ/DKdB/iYIxqdJQNWBwPivzyfy3ONHpxTYVcFGfJNjr2WYREs9Y+J3A0zLrP8h6f22KULLqSpemD9vynf9UKpDWz/+Jvk3CTR1I+nY5frO6SVlww61D9LHCcJFJ2zUTBQ2E2M85QSTBOmz0F9taTSA+D28C3EB9rZhuKwQkrNkqOuz4XmQvm3e2W24qwrNK7u3nzs62POJMaIBDC68gMrlegtxewNnihIvvL9A0Ccfos0tDHO5GbeCjRYCv68iRHGq5HJGNvh8XTxIX9inPgj7cbKUh3tYVpjRKK/AIrDV/BvsLDqwrDQbWNgULCNGJKIBkM9PnsaCcmlJcimk16AjBe4nK0yXW0A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR04MB5615.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(396003)(39840400004)(346002)(136003)(33656002)(66556008)(66476007)(478600001)(66446008)(66946007)(6506007)(64756008)(316002)(8676002)(5660300002)(76116006)(55016002)(71200400001)(186003)(6916009)(8936002)(52536014)(83380400001)(86362001)(26005)(7696005)(9686003)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?b0plZjE5SHVRYVNPdXNqWWU2Z3U1TWFiT1pVZWNlamtONXJoVTBVcTlOdG1w?=
 =?utf-8?B?dnIvVmdOR0JaVGZreTRsKzRMcWl3RDZXOUhFMVU1V3BSMFNza3ZaYWFROGxp?=
 =?utf-8?B?amtjTjFiLzRGTmluQlF1VERWMEtnSmR5UkU3Si9POThwUWd0dHhSbUNCL2dq?=
 =?utf-8?B?L1RkYkV6b0hacWdZcm1laFkwbEg0SStUSmVPc1RITDVjdXdtUTVhaDRXOVV5?=
 =?utf-8?B?M0F5dk5OdVFlTnlndVdtOEJqclcvR0Urc21qdmNNc0FDMzV5aTFqaHJiVnJK?=
 =?utf-8?B?QlJ1b3RNOTNyUy9EcVNYZjRDVnVnVXd6V25idWFxVXdOZEN5MzN0T2dXWXUy?=
 =?utf-8?B?b0FkQ3d0SGJTQkliL3FnNHJEZHZHK3R5N0ZmMGJzSzlYVGtPTzRvc2VCVkc1?=
 =?utf-8?B?WkhodjBrVHVvcS8zSlFNS01GelJFOXRxVFVKcXZGd3ZHZFdvbVVXbWVzZld2?=
 =?utf-8?B?NjErTkFEcmtTU1NNZzJndTRDczVyZFYzMDF4YTB0TjNjeXZIVkpaR2VqdjVq?=
 =?utf-8?B?YVFIOS9TS1o0TmpDcU0wV3RiUkhTZEJqdjl3RCtqaDJxSzNtNk5ZS3prR2pl?=
 =?utf-8?B?WFpBcUxRYnViZEVTVk1YUnJ6SnUxTFNiRzhyZW9oejBQd3Y0akg3ZmxTQlkz?=
 =?utf-8?B?bUhjQk81Z2d0NlF5N3NkTVJPdmVtOVkzUFdVWWhXVUl6azJxL3ZSMDFqdUFT?=
 =?utf-8?B?cWw1T3NYQmlDbTJuN1MxV084cC9CTmhWQWdrQTh1VkFGVHJHMGdnYzQ2UWl2?=
 =?utf-8?B?cEZ0eXA1UzJNNEd2QktrMmtUS1pkakRhOERKTENUV1RGdFdKZ2huYXlwRW5h?=
 =?utf-8?B?Si94enpVUUM1a3o2MFlQdndjRnBBWm1aNGd6Z1pMVHhyN2tpOEJuNFBTUzUw?=
 =?utf-8?B?S1RSbFk5U09KaE4yc0xBV3J0cnpCYWJjN0lXeEdZN3Q2ZTJNeTIvUUswNC9l?=
 =?utf-8?B?MCtIRWNHYmRUNXV2Z2FBQkgxeDN4Y1loV1p4WmtoeG1udnVhSlNzYVNxckNH?=
 =?utf-8?B?N2F4RHJXcW5ISnpNeWgrNm1sRHNHcTZ6UWRFSStMcmVDMC95ZkJCQTd2eGVj?=
 =?utf-8?B?NmhEWm4vTlBIN3VXb2NLTWNGKzZkdUNNZzYwZzFoYVMrOFNTQU5PVHE0ZUpa?=
 =?utf-8?B?Qk5oUmppN2RxS2lsWUVpY1plYVBSRVFrNU43bTZyYW82eEF0L3d4TTVXSmJE?=
 =?utf-8?B?VjY3V2gyUjRKVmdkNWxqaDFvenkyMXhzQStZYnlHRzRISDByUXJncjRTZTRI?=
 =?utf-8?B?V3hRdnRzQWlNVzNzbG9Ba1JGUTluVTlrQXh5Vit5UEVTWkhhdEhSaW1HQ3Bn?=
 =?utf-8?B?MGhKYVpEdGJwRjlKdFF3eFZuM2pVcHJyc1FMalFWZHY1YVBKR3ltb0JpRWlX?=
 =?utf-8?B?UWhFL3R1MVc1Z3BMeklBTm1jdUNnR0FFMmJya04rRmFHS2J3Q1ZIZ1Q5U2xD?=
 =?utf-8?B?bis2SkVlb2JpOTlDYms2WWI2MHBzVlZRRGd0TTNYNVZ6RUJiWGw1YkhJbDV5?=
 =?utf-8?B?YkwwOFdFY1V1dzU1a3lBTElNeFRubFQyTi91MU9uUU1Oem52TGppcjkvS3lv?=
 =?utf-8?B?bDdmMGM2RU1mMERXRUxmQ1FGNGtNTkptcldHU2FrNmcxbkRDbnFGMlNDNEdy?=
 =?utf-8?B?Um9jSVF2bVhGaUlBOFBXdTdoaU9Zd1VSNFhNaDlxckdoSTc1T2RnTkZJeW1S?=
 =?utf-8?B?YWIrMkpabTk0bUZaV1Z2V2pWak1QKy8xb3k4Mi9tZXhlUk44V3F1RGlCWGgw?=
 =?utf-8?Q?R/VtGAHfSI2IzIB4y91roZq8cYU4J+KfUPerAuH?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: aes-corp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR04MB5615.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77d1310c-0804-4f19-633c-08d8df4623c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2021 19:46:01.1966 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6bfb6a44-b954-4556-9736-4fa3cd98e45f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 78+een5+QiAqVaVyQmnJt03rs/CsBo+PX/QTcthKB7im7O/O+VvofbVL/rHdOmfRaKD+CrylSiA5MgSvx3IexA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6206
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

DQpJc3N1ZToNCkludGVybWl0dGVudCBvY2N1cnJlbmNlIG9mIGZhaWx1cmUgdG8gcHJvZ3JhbSBu
ZXcgYm9hcmRzIGZyb20gQ00uIE9jY3VycyBpbiBhcHByb3hpbWF0ZWx5IDEgb3V0IG9mIDEwIGJv
YXJkcyBmcm9tIG91ciBDTSBnb2luZyB0aHJvdWdoIGNvbnZlcnNpb24uIFRoZSBpc3N1ZSBzZWVt
cyB0byBvY2N1ciB3aGVuIHRoZSBTWU5DIHBvcnRpb24gb2YgdGhlIFVTQiB1cGRhdGUgdGhhdCBp
cyBzZXR0aW5nIHVwIHRoZSBiYWNrdXAgcGFydGl0aW9uIGVuY291bnRlcnMgc29tZSBudW1iZXIg
b2YgYmFkIG5vZGVzIG9uIHRoZSBmbGFzaC4gQWZ0ZXIgZ29pbmcgdGhyb3VnaCBwcm9ncmFtbWlu
ZywgdGhlIHVuaXQgd2lsbCBib290LCBidXQgb24gdGhlIE5FWFQgcG93ZXIgY3ljbGUsIGl0IGZp
bmRzIGFub3RoZXIgYmFkIG5vZGUsIGVycm9yIHJlYWRpbmcga2VybmVsL3VJbWFnZSwgYW5kIGdl
dHMgc3R1Y2sgYXQgdS1ib290LiBUaGUgYXR0YWNoZWQgbG9ncyBzaG93IHRoZSBVQklGUyBmYWls
dXJlcy4gKEN1cnJlbnQgaGFyZHdhcmUgaXMgY29yZXdpbmQgd2l0aCBtaWNyb24gTmFuZCBGbGFz
aCkNCg0KUHJpbWFyeSBwYXJ0aXRpb24gbW91bnRlZCBPSw0KTG9hZGluZyBmaWxlICdkdGIvYXQ5
MXNhbTlnMjVlay5kdGInIHRvIGFkZHIgMHgyMTAwMDAwMCB3aXRoIHNpemUgMjU4MzYgKDB4MDAw
MDY0ZWMpLi4uDQpEb25lDQpEVEIgZmlsZSBsb2FkZWQgT0sNCkxvYWRpbmcgZmlsZSAna2VybmVs
L3VJbWFnZScgdG8gYWRkciAweDIyMDAwMDAwIHdpdGggc2l6ZSAyOTY4NTM2ICgweDAwMmQ0YmQ4
KS4uLg0KVUJJRlMgZXJyb3IgKHBpZCAwKTogdWJpZnNfcmVhZF9ub2RlOiBiYWQgbm9kZSB0eXBl
ICgyNTUgYnV0IGV4cGVjdGVkIDEpDQpVQklGUyBlcnJvciAocGlkIDApOiB1Ymlmc19yZWFkX25v
ZGU6IGJhZCBub2RlIGF0IExFQiAyMTU6MA0KVUJJRlMgZXJyb3IgKHBpZCAwKTogZG9fcmVhZHBh
Z2U6IGNhbm5vdCByZWFkIHBhZ2UgMTc4IG9mIGlub2RlIDEyNDQsIGVycm9yIC0yMg0KRXJyb3Ig
cmVhZGluZyBmaWxlICdrZXJuZWwvdUltYWdlJw0Ka2VybmVsL3VJbWFnZSBub3QgZm91bmQhDQoN
Cg0KQnV0IGlmIGl0IHdpbGwgZG8gdWJpZnNscyBmb3IgU3lzdHJlbUEgb3IgU3lzdGVtQiBhbGwg
ZmlsZXMgYW5kIGZvbGRlcnMgYXJlIHRoZXJlOg0KDQpVLUJvb3Q+IHViaWZzbHMNCjxESVI+ICAg
ICAgICA1Njg4ICBUdWUgQXVnIDExIDEzOjQ4OjQ2IDIwMjAgIGJpbg0KPERJUj4gICAgICAgICAz
NTIgIFNhdCBKdWwgMDIgMDM6NDg6NTYgMjAxNiAgZGV2DQo8RElSPiAgICAgICAgIDMyMCAgTW9u
IEphbiAwNCAxNTo1OToyNyAyMDIxICBkdGINCjxESVI+ICAgICAgICAzODQ4ICBXZWQgSmFuIDI3
IDE4OjEzOjA4IDIwMjEgIGV0Yw0KPERJUj4gICAgICAgIDMxODQgIE1vbiBKYW4gMDQgMTU6NTk6
MjcgMjAyMSAgbGliDQo8RElSPiAgICAgICAgIDIzMiAgV2VkIEphbiAyNyAxODoxMToyMiAyMDIx
ICBtbnQNCjxESVI+ICAgICAgICAgMTYwICBTYXQgSnVsIDAyIDAzOjQ4OjU2IDIwMTYgIG9wdA0K
PERJUj4gICAgICAgICAyODggIFdlZCBKYW4gMjcgMTg6MTE6MjAgMjAyMSAgcnVuDQo8RElSPiAg
ICAgICAgIDIyNCAgTW9uIE5vdiAxMSAyMDo1NDo0MyAyMDE5ICB0bXANCjxESVI+ICAgICAgICAg
MTYwICBTYXQgSnVsIDAyIDAzOjQ4OjU2IDIwMTYgIHN5cw0KPERJUj4gICAgICAgICA4NjQgIE1v
biBKYW4gMDQgMTU6NTk6MjcgMjAyMSAgdmFyDQo8RElSPiAgICAgICAgIDY3MiAgTW9uIEphbiAw
NCAxNTo1OToyNyAyMDIxICB1c3INCjxESVI+ICAgICAgICAgMTYwICBTYXQgSnVsIDAyIDAzOjQ4
OjU2IDIwMTYgIHByb2MNCjxESVI+ICAgICAgICA0MzEyICBUdWUgQXVnIDExIDEzOjQ4OjQ2IDIw
MjAgIHNiaW4NCjxESVI+ICAgICAgICAgMjk2ICBNb24gSmFuIDA0IDE1OjU5OjI4IDIwMjEgIHJv
b3QNCjxMTks+ICAgICAgICAgIDExICBNb24gTm92IDExIDIwOjMzOjQ2IDIwMTkgIGxpbnV4cmMN
CjxESVI+ICAgICAgICAgMjI0ICBNb24gSmFuIDA0IDE1OjU5OjI3IDIwMjEgIGtlcm5lbA0KPExO
Sz4gICAgICAgICAgIDMgIE1vbiBOb3YgMTEgMjA6Mjc6NDQgMjAxOSAgbGliMzINCjxESVI+ICAg
ICAgICAgMTYwICBTYXQgSnVsIDAyIDAzOjQ4OjU2IDIwMTYgIG1lZGlhDQoNCg0KSSBjYW4gZXZl
biBzZWUgdUltYWdlIHRoZXJlOg0KDQpVLUJvb3Q+IHViaWZzbHMga2VybmVsDQogICAgICAgICAg
Mjk2ODUzNiAgTW9uIEphbiAwNCAxNTo1OToyNyAyMDIxICB1SW1hZ2UNCg0KDQpJZiBJIHdpbGwg
ZG8gdWJpZnNjYXQga2VybmVsL3VJbWFnZSBpdCBzdGFydHMgdG8gcmVhZCB0aGUgZmlsZSBhbmQg
dGhlbiBJIHNlZSB0aGlzIGVycm9yOg0KDQpQ4paSQCDilpLilpLilpJQ4paSQCDilpLilpLilpJQ
4paSQCDilpLilpJR4paS4paSIOKWkg0KYUIgUeKWkicNCjDilpLilpIwYEJT4paSJuKWkigNCuKW
kiDilpIg4paSUeKWklEx4paSMSLilpIx4paS4paS4paSOlHilpJRMeKWkjEg4paSMeKWkuKWkuKW
kjrilpLilpJT4paSMEMgIeKWklPilpIwQyDilpIhIVPilpIhMUMgIiHilpJT4paSMUMg4paSIVPi
lpIiIuKWkiHilpLilpLilpLilpJc4paSYELilpLilpI84paSYELilpLilpIzzKDilpLilpJR4paS
IeKWkiEg4paSIyDilpIzUeKWkiHilpIhICJR4paSIeKWkiEgIlHilpIg4paSIFzilpIz4paS4paS
YELilpLilpJR4paSPg0KYULilpLilpJgQiBR4paSUOKWkiYg4paS4paSUeKWklEx4paSMSAy4paS
4paS4paSOlHilpJRMeKWkjEgMuKWkuKWkuKWkjogUuKWklDilpJAIOKWklDilpJAICFQ4paSIUAg
4paSUOKWkkAgUOKWkiHilpLilpIgUuKWkuKWkuKWkuKWkuKWkuKWkjANCg0KcuKWkg0KUOKWkkAg
4paS4paS4paSUOKWkkAg4paS4paS4paSUOKWkkAgXOKWkmBC4paS4paSUC3ilpLilpLilpLilpJQ
4paS4paS4paSQeKWkuKWkuKWklAt4paSfOKWkuKWkuKWklDilpLilpLilpJB4paS4paS4paS4paS
LeKWkuKWkuKWkuKWkuKWkuKWkuKWkiAwUuKWkiDilpJi4paSQeKWklEwQeKWkuKWkuKWkuKWkmA4
IOKWkiM04paS4paS4paSPOKWkuKWkmAj4paS4paS4paS4paS4paSbDgs4paSYCDilpIh4paS4paS
IzTilpLilpLilpI84paS4paS4paS4paS4paSYCHilpJsI+KWkuKWkuKWkuKWkuKWkg0KIyszO0NT
Y3PilpLilpLilpJAQCExQWHilpIgMEBgYFBzcDDilpINCmAg4paSQOKWklg7eDjilpJoKOKWkkji
lpJU4paSK3Q04paSZCTilpJE4paSXFN8POKWkmws4paSTOKWklLilpIjcjLilpJiIuKWkkLilpJa
Q3o64paSairilpINCkrilpJWQDN2NuKWkmYm4paSRuKWkl5jfj7ilpJuLuKWkk7ilpJgUXEx4paS
DQphIeKWkkHilpJZO3k54paSaSnilpJJ4paSVSt1NeKWkmUl4paSReKWkl1TfT3ilpJtLeKWkk3i
lpJT4paSI3Mz4paSYyPilpJD4paSW0N7O+KWkmsr4paSS+KWkldAM3c34paSZyfilpJH4paSX2M/
4paSby/ilpJP4paSYFBzcDDilpINCmAg4paSQOKWklg7eDjilpJoKOKWkkjilpJU4paSK3Q04paS
ZCTilpJE4paSXFN8POKWkmws4paSTOKWklLilpIjcjLilpJiIuKWkkLilpJaQ3o64paSairilpIN
CkrilpJWQDN2NuKWkmYm4paSRuKWkl5jfj7ilpJuLuKWkk7ilpJgUXEx4paSDQphIeKWkkHilpJZ
O3k54paSaSnilpJJ4paSVSt1NeKWkmUl4paSReKWkl1TfT3ilpJtLeKWkk3ilpJT4paSI3Mz4paS
YyPilpJD4paSW0N7O+KWkmsr4paSS+KWkldAM3c34paSZyfilpJH4paSX2M/4paSby/ilpJP4paS
QUAhIEBhYDEw4paSQA0KDQoNCg0KDQotLSBTeXN0ZW0gaGFsdGVkQXR0ZW1wdGluZyBkaXZpc2lv
biBieSAwIXN0YWNrLXByb3RlY3RvcjogS2VybmVsIHN0YWNrIGlzIGNvcnJ1cHRlZA0KVW5jb21w
cmVzc2luZyBMaW51eC4uLmRlY29tcHJlc3NvciByZXR1cm5lZCBhbiBlcnJvciBkb25lLCBib290
aW5nIHRoZSBrZXJuZWwuDQppbnZhbGlkIGRpc3RhbmNlIHRvbyBmYXIgYmFja2ludmFsaWQgZGlz
dGFuY2UgY29kZWludmFsaWQgbGl0ZXJhbC9sZW5ndGggY29kZWluY29ycmVjdCBoZWFkZXIgY2hl
Y2t1bmtub3duIGNvbXByZXNzaW9uIG1ldGhvZGludmFsaWQgd2luZG93IHNpemVpbnZhbGlkIGJs
b2NrIHR5cGVpbnZhbGlkIHN0b3JlZCBibG9jayBsZW5ndGhzdG9vIG1hbnkgbGVuZ3RoIG9yIGRp
c3RhbmNlIHN5bWJvbHNpbnZhbGlkIGNvZGUgbGVuZ3RocyBzZXRpbnZhbGlkIGJpdCBsZW5ndGgg
cmVwZWF0aW52YWxpZCBsaXRlcmFsL2xlbmd0aHMgc2V0aW52YWxpZCBkaXN0YW5jZXMgc2V0aW5j
b3JyZWN0IGRhdGEgY2hlY2tPdXQgb2YgbWVtb3J5IHdoaWxlIGFsbG9jYXRpbmcgb3V0cHV0IGJ1
ZmZlck91dCBvZiBtZW1vcnkgd2hpbGUgYWxsb2NhdGluZyBpbnB1dCBidWZmZXJPdXQgb2YgbWVt
b3J5IHdoaWxlIGFsbG9jYXRpbmcgel9zdHJlYW1PdXQgb2YgbWVtb3J5IHdoaWxlIGFsbG9jYXRp
bmcgd29ya3NwYWNlTm90IGEgZ3ppDQo8Q1RSTC1DPg0KDQpKdXN0IHdhbnRlZCB0byBzaG93IGlm
IHRoaXMgbWF5IGhlbHAuIEFsc28gaWYgdSB3aWxsIGRvIHViaWZzbW91bnQgU3lzdGVtQg0KDQpV
LUJvb3Q+IHViaWZzbW91bnQgU3lzdGVtQg0KVUJJRlMgZXJyb3IgKHBpZCAwKTogdWJpZnNfZ2V0
X3NiOiBjYW5ub3Qgb3BlbiAidWJpOlN5c3RlbUIiLCBlcnJvciAtMTkNClVCSUZTIGVycm9yIChw
aWQgMCk6IHViaWZzX21vdW50OiBFcnJvciByZWFkaW5nIHN1cGVyYmxvY2sgb24gdm9sdW1lICd1
Ymk6U3lzdGVtQicgZXJybm89LTE5IQ0KDQp1Ymlmc21vdW50IC0gbW91bnQgVUJJRlMgdm9sdW1l
DQoNClVzYWdlOg0KdWJpZnNtb3VudCA8dm9sdW1lLW5hbWU+DQogICAgLSBtb3VudCAndm9sdW1l
LW5hbWUnIHZvbHVtZQ0KDQpBbmQgaWYgSSB3aWxsIGRvIHRoZSBzYW1lIHNlY29uZCB0aW1lIHRo
ZW4gaXQgc3RhcnRzIGJ1dCBnZXR0aW5nIG5vIHVJbWFnZSBlcnJvcjoNCg0KRFRCIGZpbGUgbG9h
ZGVkIE9LDQpMb2FkaW5nIGZpbGUgJ2tlcm5lbC91SW1hZ2UnIHRvIGFkZHIgMHgyMjAwMDAwMCB3
aXRoIHNpemUgMjk2ODUzNiAoMHgwMDJkNGJkOCkuLi4NClVCSUZTIGVycm9yIChwaWQgMCk6IHVi
aWZzX3JlYWRfbm9kZTogYmFkIG5vZGUgdHlwZSAoMjU1IGJ1dCBleHBlY3RlZCAxKQ0KVUJJRlMg
ZXJyb3IgKHBpZCAwKTogdWJpZnNfcmVhZF9ub2RlOiBiYWQgbm9kZSBhdCBMRUIgMjE1OjANClVC
SUZTIGVycm9yIChwaWQgMCk6IGRvX3JlYWRwYWdlOiBjYW5ub3QgcmVhZCBwYWdlIDE3OCBvZiBp
bm9kZSAxMjQ0LCBlcnJvciAtMjINCkVycm9yIHJlYWRpbmcgZmlsZSAna2VybmVsL3VJbWFnZScN
Cmtlcm5lbC91SW1hZ2Ugbm90IGZvdW5kIQ0KDQpTdHJhbmdlIHRoYXQgSSBuZWVkIHRvIHJ1biBz
YW1lIGNvbW1hbmQgdHdpY2UgYW5kIHRoYXQgdUltYWdlIGFsc28gY2FuIG5vdCBiZSBsb2FkZWQg
ZnJvbSBTeXN0ZW1CDQoNCkxvZyBmaWxlIGZvciBhbGwgSSBkaWQgaXMgYXR0YWNoZWQuDQoNCg0K
SnVzdGluIE1pdGNoZWxsDQpUaGFuayB5b3UgISEhISEhDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
