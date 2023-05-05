Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81635C77B7D
	for <linux-mtd@archiver.kernel.org>; Fri,  5 May 2023 09:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7GtU8LnqevtnD4QIRJ7HBM4jViBmoa26uwxxakAwUjA=; b=a+k7Bn4n/HTlfu
	LtWYkWyH9I7j5WFMrl8o5XHTp4jaoeBR6cw+rcdXXoCGEWtfQSAAilMcE9Hzu4lbgIQjXqGaUFLsq
	YTVLYMxLzI+M1//hOhsQaTu+ldoA+o8ZwyFaoEkMmQOYOldBeJ/L8VQp8LBKesHM0ahov0A3/ix14
	H6DeO04UoVPA/4o9dOO6VM5rCTnV/8iZ3/Uz+2IJUdsgIsZhwiLsflkT6OYvPXzjqgqVFIb77WFJJ
	BK4N6lgzG+TL8HQ+N/mpDWZytCaQCriEDYc7zKiaSQjZYQjStX1CqvGpyZ2nRTMXaDa73s7YJWXHO
	iVE1tk0OLEmcIOLo10ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1purwY-00ABSH-2X;
	Fri, 05 May 2023 09:41:38 +0000
Received: from mail-dm6nam11on2062d.outbound.protection.outlook.com ([2a01:111:f400:7eaa::62d] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1purwU-00ABQd-0d
	for linux-mtd@lists.infradead.org;
	Fri, 05 May 2023 09:41:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=muWu/vy/eq1GPA35X7hLUKdcj75lANvbP3kHEELVKq3hlXE90A24upLrTZypHGLQy0EgO/IDL13uU+UidEfxkPRk3LgdmDfgxxK6qibrKaZn0kOEPc9O+fjzbLP1nGo+JFKCmx2tVsTldpDfTe6p565I5c+0jdj38hzQvUQC8UST+PVQKztojYbBQL7ZCweoK+kEpS2wFC7Q9sPr2f3SQGZI3XsAnZM91WZ+VuSeXqQc9QddCEUhffSDXCiEuI7agvKCa47MpnBSXUI8L2gf+YDF9zjD4xGmoilz2qhHOi34cgk0ZdkCxUd55Bl7YKxU5VyyXFTPORhSsszeQse6KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jgesxsSMU6K9hJ5hekv7+LxnRq8zp6386TLifNMshnY=;
 b=eGqfCvuV9E/E33m4VH6bRI6TBRjMeHMs8107/09X89WqzuFOjp20vlNcdXPhqjt0ujNmhkPOFXBPoa4QFQu/sv1zrd9JwXYetCFopk9pyzbbHmaBoCpEVVtDQMUg7NfPa0YpSk/tpV3qMXttdYC43DgY/oVaGjSzIxukJW+RbYB24vxiUkF7s7X5e1/mQN+Fy5Qk6hpiARq3i04Kva8EnviHUAk+mUMbtnamwwAXkQfj4PW3b2zGCN3R6uZuF37dcqV2CY5HlGhB7B6430vFY+2jDXkHtxftNepIDWDHHdNf5Xsy1rcGv5RXeVY4wY3zYni8nCSvE1dAW+cUrgxsFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jgesxsSMU6K9hJ5hekv7+LxnRq8zp6386TLifNMshnY=;
 b=Mtb6oupSSpgWj8afUO8x9g3siifgjGHt5TthjvDW6CW6ekaYWtUsTn6yNE4YzgriJp2vE3QhWb+z0c0SWobJ3qVE1WqqTbz+1n7sr9lpKACLbmwMXZTGbAdubqnsxbPVYesqO9HPCNNCdKptb3W9LAHTzv3rVqCSlPm9NS+nMelJ6FqBesKNjWqfWxKWrs8Ya32pf5W9A3cjtVn1Ty/sAA/QQeoYMfdtIatEPfBWItDFwmHaClU4cSTiq9WhY78vN/YRtN7DeN+maj0/XCHnm7p8jU8wfHeke85hvDjuAyBniBrYwiWc8gmV5V2ukuZ+BkheszWotjBosVoTJxPsLQ==
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by CY8PR10MB6514.namprd10.prod.outlook.com (2603:10b6:930:5e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Fri, 5 May
 2023 09:41:30 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::8b9:5f6:1751:69f9]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::8b9:5f6:1751:69f9%7]) with mapi id 15.20.6363.027; Fri, 5 May 2023
 09:41:29 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: spi-nor and flash Erase Suspend ?
Thread-Topic: spi-nor and flash Erase Suspend ?
Thread-Index: AQHZfzXEKGjrUKSjfkK/1noG/yrmog==
Date: Fri, 5 May 2023 09:41:29 +0000
Message-ID: <421e4e30467c37ddf09c28f015a2e63ab68f2b9e.camel@infinera.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.0 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR10MB4615:EE_|CY8PR10MB6514:EE_
x-ms-office365-filtering-correlation-id: c5285498-5abc-489d-59ad-08db4d4ce732
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  59TD1Dgj+6xIeXOst2PLVn24kIsa8ThszG7+oPXbmMacs1F9s65oH5gtuCZZtI75gAXNrPGdcdLNwBVB0yEwYOfWrfoBEvTna2Go5ZYSw2JoEoSRsmtrwhKZS8dRHsCWOugKRQP9lM8h9gidQKeljGvRZfMTAwcfe/fFn0NnwrciRgLNMMNdit3T+Xv60ULVDVx72PLf+utb41WWua7sX6YXkfkITkgi8pnCKUd+0pH/IBwVlijgZZHd8l8TEQ82LsSPWIn/YvieVHkzRZ4GOZJTPgA2ptQZ5lLMiNfDA4gkwMTTCxc1W1R7S4DLZ/YmRuBu/15U3Jqso1RUQtXeP7PZhv6KqkCi5J5wnsjTibVe9rXBI8m6mx9W/ohD+5iDzjd3W5hkvG2lxvF1QomW9z1ERw4cITOVxOdEzTxUAI5kIUUgI+K2xfwnpkmy5iXq5Y3lg4ruUczRZYlr62R7i3iAL7nU2qu8VDefqlViZ0jOeI29bJLv1QqypfUoa0qBeCcACvY4GZKrOudjCZM++25YFJkkzuCkLlyOc4X7Tk7pGUIDrZFK+58U+iaA0KEPQZCrOPI1Qh7aW2xokhwDV7GJBl64K9wwzvzAULpSinHGrMjDz3wmzK6ABR+q2Zk7
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4615.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(396003)(39860400002)(346002)(376002)(451199021)(71200400001)(186003)(478600001)(86362001)(6486002)(15650500001)(41300700001)(122000001)(2906002)(4744005)(36756003)(316002)(38070700005)(8936002)(8676002)(38100700002)(83380400001)(5660300002)(2616005)(66946007)(6916009)(66556008)(6512007)(64756008)(66446008)(66476007)(91956017)(76116006)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?SFVXcjZTU1dESDJDZ0xKMWFzUHlZcG92VDM2L0ZvWDNXSzNRd0phLzh2ckxl?=
 =?utf-8?B?UkxXSTZCUTlKQXVjUEJSVmxPbHlaZmpQTHRqTk1qQktlNzl4M1NXOURsemJV?=
 =?utf-8?B?Vm1lQnlSZU9ablkzYkdtSWs5eXJTWXpLWXR6Tk5pK3JZdUVWemMvZnB0ekJk?=
 =?utf-8?B?STJ5REpxZHRwUkhvNEFRSUp1SGJkanlXamhuTmdKVXQvNEQxWjA2Z2wrcnZ2?=
 =?utf-8?B?clFtTklhNk1wV1M0VEU1VEYrbmNuZkJFbVlwWkJyajNqMktRbUNrUUtiRmor?=
 =?utf-8?B?WEJSNlQvS0VNZ1ZVZXVTcW85eGRKK0xhNHMwVFpKejVPL3FZRVE1RGowc0FR?=
 =?utf-8?B?SkJyN1RZNENFcmFpSFZhWS96TDc2NUU0WXlGMGhna3o4YWdpTkMyQ2srVyt3?=
 =?utf-8?B?MXlrWDBzMjZvc25HWFBEVFJEZ0puTE41TVFTdjdTcytZTExPaEIrL3hqQW1U?=
 =?utf-8?B?bG5GaytBVkRQMEVPdVNxckVGZmhtK1FQYkFEcmxHZUdDQWJyVmlMRnBjRTdE?=
 =?utf-8?B?eVhLbXBkMTcrRGpDSVZWQ2toV0RvTlpCVkxkcWpLQUxpRzlzS3FJUkhEbmlB?=
 =?utf-8?B?bnlKdmxUSGxOWjQySnZFVngvd2E4UkQxTUQwV2NoUVY0WGd6bjQ2OFQ3VGI0?=
 =?utf-8?B?ZE0vbU5pcThUTTFiTEpiWHZZL05kdC9DQ29VbklHTS9SUlgzVTNPNHpleU5S?=
 =?utf-8?B?ZVNCM28xSmd3cE5NSjU3dUxTWm42U3MzbWlwcHFyWVBYZ1dzak4vYWFsUHFW?=
 =?utf-8?B?c2dqTWhWdEdDNEx2bjd5UUEwYVNaV2RkakY3U0paMTF2N2NmaFYzOEJRV3NJ?=
 =?utf-8?B?L0FEdVlBRUo2bGFLL0s4Kyt5VDV3YjRwd1V0U2oxemdabW8zYjhJbFIvRVVD?=
 =?utf-8?B?dDlOUVF1Uy9mTU1xY3d4dXpTTXJZVHJBTUFzY21YSk9UaXVMME0ybXVLVjNK?=
 =?utf-8?B?cHhMSGwwd3g0L0lJaFNOVzVHMFpYeTJlbGpUMG92TGNIazhQS1FWalRseVBp?=
 =?utf-8?B?USt6TVdNbk5jc1FLN1h1KzNJcGpUYlV2cEdIZytnS3RKNlJ3UmNCdnFQbStS?=
 =?utf-8?B?cGpZYTg3VlZXaG9IWXk2TXlKNG42cVAvM0JoKzc5ZVVYbDBVZnFnL1hNeEdB?=
 =?utf-8?B?cGVHdjZkSEp2MDN4VVYvMzlpT05yY0FuVTcrajBsVzkzTzY2ZVhFNDlDcmRw?=
 =?utf-8?B?L2RUTWxSRDVrU1ZNb3FGclhnYWI1d01jNi9oRHkyQzdFblNCTjJZaEM4OWNQ?=
 =?utf-8?B?TllLUUNJalZVUXdqd0k5bDBvWmZxWit4TUxrZDVaRWlnRXdQcUNSMGRocGtD?=
 =?utf-8?B?OENRR1RGaUxuR1NPYTFZUEVHV1RId29RczhsT2cxZVNIQ2xBWjBTTlBqR0FV?=
 =?utf-8?B?dzk2NURNUHFBaXlseDFZVEFiNEk0ek45alZYUmpxc2MxaUZnUjZoamV1MVR4?=
 =?utf-8?B?eFVEQ2pOMG92Q0tXMXh4R0VSQjZNSGwwZWFXM3FHR1p0NTZMWFBFK0xHWU0y?=
 =?utf-8?B?VzBBeC9EOGVrcG5VbWl3VTJ4eFNuRDdiM0JOTVFud3JPS1VxWFpRWktuaVpY?=
 =?utf-8?B?UG9XQkZyU3VIMzVFU1l0THBPcXo5cUR0eE1rOXFaUHlpUy9CTUd2Q2t2bVov?=
 =?utf-8?B?MGxwbXE2OHU1M0FqaXY0dUhzb0w1c1pFaGVYRFh5SkFIYmJSY21PS0YvMXZM?=
 =?utf-8?B?SnEzZ0lVT0RhemNLRU9BODJ1UFRzN2hSQnZ3UUF3bXQvZ3VuanAySHJCckRH?=
 =?utf-8?B?NmQ5VDRyMytSM3RVaFJLOHRHYSt0TUtvbHVUTityYS9oRzJhY3ZHZlRBU0lS?=
 =?utf-8?B?akFQYjZCVWQ0QlJIaXAveE1hT1hYUi9zaUVHWi9uT0NxdUd6bEhGNGp4RGNz?=
 =?utf-8?B?TmpZTkFNMnlQVE5GdlUwZTJ6ZnF4RXZiUERLWStCaUNGN0Y3cEdPN3NFV00w?=
 =?utf-8?B?NnhXYVg0dXBHYUZtYnVraS9KSmlueit3cDNkUXhwSnJXZ3NwdnA4RStabWk1?=
 =?utf-8?B?dm1Udy8xanMzQWU4ZnRsQUJZOE83WHAyUjJIZmJlVWlrbWRHcGlDeU40cTJu?=
 =?utf-8?B?Vy9pQmVwTTBhMW5BZ2JpNU8xNmpwUzdlZEQzRS96NUlKZmhneXVhTnVGeEtH?=
 =?utf-8?B?a2FrWmxUcE5CQlVrUS9IMVZSZGhmUXNhbUtRNGJHdE1GYUJyWWRBcDNvVFJG?=
 =?utf-8?Q?vNknrH52dZfCcGxPFQidKMFRl1En4iTp0aZbthDHO5nG?=
Content-ID: <71DC6BE8A85DA14A9E769AD9AD70A6F8@namprd10.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5285498-5abc-489d-59ad-08db4d4ce732
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2023 09:41:29.4288
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PEDMjbqOY7wGCJmKMYMMtfN4cSlzXFn6q/LWLqXjJCxWAXNJgUMkPWTqEgQfLqde7piaugrrB5HVMyxCEbbomA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6514
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230505_024134_304126_E1315E12 
X-CRM114-Status: UNSURE (   8.35  )
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

I noticed our system freezing when JFFS2 starts to erase sectors and I recognice this
behaviour from the past that this is usally caused by Erase Suspend not working.

After a quick look at the sources I don't see Erase suspend impl. in spi-nor?

I am fairly new to spi-nor so if anyone can enlighten me what is missing or
any pointers I would really appreciate that.

 Jocke
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
