Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E35C47258
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Jan 2024 15:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hYlp7/I8HCOOHOse5AIJh3lIqAn0rsaL4g12niHcesc=; b=Lf7bh+SElOjPrb
	ayF+r/eu8UjSNLkB8UN26A1PwuB38CClr8HsLd/9UDfOhsprVF+cm5DeGFQOjwByDTwfc4fMEgqPn
	JUZSFFMEffxt2wSOXH0aKJe2WEAchOzsjyQdPEvaZUcCF/I1Bil7+Okjr3/hdcwCbX4Secdfpn+7R
	sn9q+ZssOMyF6L7lTq0ei8aUfcB70fAvXstswVjwZ9hdZqOTwRuIJn7UKm5hc5nHPPqlFXP2ezx0C
	jvpfbgQUhI7rYhzCZkjiFJagVOJ9LlDgJRK7RbaFl3BfhqQLTpWAK/DiIy2rFlGkyGUgH43SCycv7
	UaXXMt572K3b3fJJa26w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSIkD-00H2kE-0t;
	Tue, 23 Jan 2024 15:31:21 +0000
Received: from mx0b-00007101.pphosted.com ([148.163.139.28])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSIk9-00H2iW-14
	for linux-mtd@lists.infradead.org;
	Tue, 23 Jan 2024 15:31:19 +0000
Received: from pps.filterd (m0166259.ppops.net [127.0.0.1])
	by mx0b-00007101.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40NAkq8M028487;
	Tue, 23 Jan 2024 15:31:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=illinois.edu; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=campusrelays;
 bh=k2rsUzLRVpZNbq8vrsqILCgYyzsLirFCtRPGK3Q6eGs=;
 b=Y2WuDG4z8nwGmNZRIP496b/O9vFTWi/GNecSOcYwSq4gpOy3+R1678q3opDcPP649IHR
 Vnsk1raCzX05/Lf9VflSr7jCbZc+Y/zsSGUAHGNFzoURolBu04QOICZpyp+f0sDmXyxH
 r+xyAI6w8Igk8HT1vQwoI7FxNWvHC7qlHe2htI9At92f+NkU5ptLCWHvZ3Z61+SgLD30
 0syNNDbnwodCxBVlBmzyp1nLLNgF/QVaOd8Gm2g+o2Dk6gA+rI+S8WlazoTM+wgDkysn
 sDAHPaRL8NwzuHJvu/bPRyzvv+6MMJX8iu+m0BY8H6PHhxZs17f5S1xb5vyKRyfFJ1s9 Vw== 
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2040.outbound.protection.outlook.com [104.47.74.40])
	by mx0b-00007101.pphosted.com (PPS) with ESMTPS id 3vt4643fve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Jan 2024 15:31:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XmnDyyspDSORr1aYahVYdxHYUckIpny5YBnlkXBoOsuTmgeqnIZBJKNLdtMnRxOqz/dmivtQi3wb49NYh4XuczZQE9Qn+9V4iGkZmUeu8nn79QvSyEAtgLXkWVYefZO72UXczsHh+rBsJphQpqpGjCh3+N/CAsoh2nXwHy33hxE/+U505Nz3i/hOa9OHDBf7rsu1DliWqpqOLEnnwhASdxRog0YV/xv8l3VUMjVKMiq6iFLWAWp/9fA3XKjczmOG3KCZRU1KkP1THre79ia/88ctIFI5/XBSHlPlP8V2UX8qtyZNYFV9u6zGAzzJBULl+KMTFTtfWuldxdehWFbB9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k2rsUzLRVpZNbq8vrsqILCgYyzsLirFCtRPGK3Q6eGs=;
 b=GOo7T8+7bzlJ6d1zyUGWjlLt8efx9JF/NpDHfRBpgHF0AZUeivw1jzXyIojSoH0JTtx1/BBiRfWEqBMiBSWWhUlKiSi49K3GWVquOCel63e332dfZkGpNCp/EoTiq1QZx4hjJJgMIK+RLRD3++e3BtlcxW4+DbOwAgAveByeIi0O8uFyp8axC3vsA3zyj5oAMBessirD0m4ZkH5fza7uGiSU2QiJfxaq/i5aiq5wY3lmhy67IIarQL/JSMCpdKvINU3b7KICeUHZzVsEHUCy7bPb15XAIG8/16sJyOJk9+2usY+wGMR3aTeVdNb+lTOiE1zVSOhGcBu+fXt3EZogNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=illinois.edu; dmarc=pass action=none header.from=illinois.edu;
 dkim=pass header.d=illinois.edu; arc=none
Received: from PH7PR11MB5768.namprd11.prod.outlook.com (2603:10b6:510:131::21)
 by IA0PR11MB7953.namprd11.prod.outlook.com (2603:10b6:208:40d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32; Tue, 23 Jan
 2024 15:31:00 +0000
Received: from PH7PR11MB5768.namprd11.prod.outlook.com
 ([fe80::3fae:5e3f:9709:dc2c]) by PH7PR11MB5768.namprd11.prod.outlook.com
 ([fe80::3fae:5e3f:9709:dc2c%7]) with mapi id 15.20.7228.022; Tue, 23 Jan 2024
 15:30:59 +0000
From: "Yang, Chenyuan" <cy54@illinois.edu>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
        "richard@nod.at" <richard@nod.at>,
        "miquel.raynal@bootlin.com"
	<miquel.raynal@bootlin.com>,
        "vigneshr@ti.com" <vigneshr@ti.com>
CC: "syzkaller@googlegroups.com" <syzkaller@googlegroups.com>,
        "Zhao, Zijie"
	<zijie4@illinois.edu>,
        "Zhang, Lingming" <lingming@illinois.edu>
Subject: Re: [Linux Kernel Bug] WARNING: zero-size vmalloc in
 ubi_read_volume_table
Thread-Topic: [Linux Kernel Bug] WARNING: zero-size vmalloc in
 ubi_read_volume_table
Thread-Index: AQHaQj+4RGN0tgPjZkuYXFZU3Q3pbrDnOT+A
Date: Tue, 23 Jan 2024 15:30:59 +0000
Message-ID: <1433EB7A-FC89-47D6-8F47-23BE41B263B3@illinois.edu>
References: <PH7PR11MB57682489034B17034C021B04A06B2@PH7PR11MB5768.namprd11.prod.outlook.com>
In-Reply-To: <PH7PR11MB57682489034B17034C021B04A06B2@PH7PR11MB5768.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB5768:EE_|IA0PR11MB7953:EE_
x-ms-office365-filtering-correlation-id: 7806f7a3-a858-4698-4ec6-08dc1c284d04
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wepnh/QJqAM5fAJVgAj6vLu5tLXYRYNl6VSCrfGaFeXjUrdoX95Qa/MHsW8fQnvdMX7BhQiUrpjCMexwJjgSqZmVlXJSjIiUFuAr6P22UjaTGl9s0M6ZAfJe/x2TYylQzWzoPzBKN+t1aMxaqJjbNMxnDjVG0SDCwszDGJWiggn1IiF7yheGxk25XVtDUlgmlObveXTU2hx1RX2axSPhoj1PT9u6lZG1w48xvXw4Cj/yPiMlLYDqDYlWDj4W4Ppzq5AegNq86SxhvBxBJGnn6TiAFGJfrhnzbwDPiOTBk5NsEJd0kxXk6fXwBWP1y1ldTNW6VxxNRbj2Ui8P0g3Sd42Fq0D/3bT+VrqdWOioyBcr5GF9VCIH9e4v8VSmjJPefWbQMh/knieEs9MFvLwAlz3D02jGHFJE5MWTu1vbcuZs2Fho8mZXFfYGFmBu6MPN5pHgFxshNoh3FH47kf6vD1XAecrmyfBZhHTt6sjyrPi7O72ia43Ezw9sZgM1VgXijgw3PnlbGxnhRcOypNcBcsR3LkHHuihCNjYk+gtRrY7G+rZJ9NFFPgmccnL/SMp2X2Tq2zWnoZ+j1w75P1GcknZ8E1OBiLeZixtwnZ4mr85xahdk5BDmwl988ljwEs72BfFGGEaMiKKOKzn3Rbz+KLdQ27Hz4fwKvbrgdliUXwb5bF95R611iXC8HTO3dK52VYXuNGd7k07H0uG5RlH22Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB5768.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(136003)(346002)(366004)(376002)(230173577357003)(230273577357003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(83380400001)(2616005)(75432002)(26005)(36756003)(41300700001)(38070700009)(66556008)(91956017)(86362001)(478600001)(33656002)(38100700002)(6486002)(54906003)(64756008)(66476007)(66946007)(316002)(786003)(66446008)(76116006)(6506007)(5660300002)(71200400001)(4326008)(53546011)(8676002)(110136005)(8936002)(122000001)(2906002)(107886003)(6512007)(88722005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SUtTVVAvdCtPNlpubVR3Z3ZBbU5hRU90SlRQZnNEQ09wcU1ObVVsZCs5NHJR?=
 =?utf-8?B?RmtUaGdMWVVXYmdtaktrdUdvdXFQMWtFenVPTWt2Lzg3ZjY3M1RzTzF2V3hu?=
 =?utf-8?B?bVYrVStzVU16NllsYjdLZnMvSHJIaUZxYTVWaXRkSnlUWTRiQkl4UGlNWWlu?=
 =?utf-8?B?RDdlbEVvRFdtelhBVU0rdDBaeEdZWlVDU29ZQVNVbTlPOWJzOXZlNTJLekdX?=
 =?utf-8?B?NG5DVHZTVVFjc3RGeEJ3SjVrL1dqM2FibGcxYlJraC9EcUlHejJxRFBvMjVJ?=
 =?utf-8?B?bW9iODJHeFBOOUJHdVF4eTNPWmFpRmRZNk5hUkR0SVRwTTlIR2RLYzVOMWd6?=
 =?utf-8?B?dm53dVl6WFN4SWNxTFdlN2h1bWl3ZTJQNGovOFlhN1FDYmJjdk8wcWpOWVJF?=
 =?utf-8?B?cVdsazBMbmNkMGFlY0tyZGxGcCtQeXpxOEFLL2J3SzJKdnU5SWpnVnBaZmI2?=
 =?utf-8?B?c0gxWFJBK2dtdVUzbE8ybXg2Q3VsNlJsY1orSEUxQmI5Y3N0VzFVdFR1cXhH?=
 =?utf-8?B?Tk5ha0ROTW82UmVQanRRNmdudXkrUmlDb3hhM1BEenh5QWF2U1k5ZmxDSDd2?=
 =?utf-8?B?UUJ6SUpCc3BDRmM4d0NtRmEzbEpINFRHbmRrbnExWTYzZllzT0FJbjJON0xS?=
 =?utf-8?B?NlVDbHJOR0RON3BqcWZFeVZqSys2bXZKOUdyWmx1UjlUV3hOVmdvMWZiOUlo?=
 =?utf-8?B?dUNGc0U5bW5JcnkrZ3paTW9Jem04QU1iKzhpZXV4ek80VzlPTE9tUVc2dXJh?=
 =?utf-8?B?ZVhabzMzS1NGOXlyNys1eUFtLzJiTysvLzJKL1EzbGVETGU3cXZJYXozODlt?=
 =?utf-8?B?c3lVWndVbTE2R0ZUMFpMNENEYnFUSVdSYkUwNllveTJWWmpPMXhZbWNha0U5?=
 =?utf-8?B?MlZDc21jdW8zbnVwUjM1dDBrL3R4RlZ5WGZKR0ljTkFyVHJyc1hNMWVLL2VZ?=
 =?utf-8?B?bzZsbVhHeWVCTEJ4UjZHRE5yRDNDdEdmaHB6NFBHWDJycHlyT0Y2TVB1amtp?=
 =?utf-8?B?a1ZJNlJuUjEwRTRROGI3ZWJXdVdIaHdFM0MzY2QvUE5PNzJvVUFySjVSOFE4?=
 =?utf-8?B?eXNFK2JNRWhhSnk1cWIxeWdVYnZra1d4OXpRWE9laTVkTDFOd2lVK0l1R0FH?=
 =?utf-8?B?cFB1Q0VwUGRHakpteHpNeXpBR0tvYVVlOURSS0VrVEJPazhsZkdKcmxyeU43?=
 =?utf-8?B?YUR5dE9rai8vY1JTVGVIRmVVNHY4UVJoUU1ibmthSjEzUlY0OEY3YVJTdmtX?=
 =?utf-8?B?WmRJeElxZFlWMDdXM1dWM3B2VTB5Y05YQU1rZkVIc3lCQnB6Yk1Ib1A0a001?=
 =?utf-8?B?YWVtQ1k4K2ZsR29mL3lWQXdzeTVKRmtUVlJwTEorZk1RYmhqbit4RjFHTXFo?=
 =?utf-8?B?RE8ySzRKd3A2L3dhWW5CSkVDdVBua0pneVNNcXR1c0dxMUNQckJRQVZPamEv?=
 =?utf-8?B?N0VCMkpESnZZYk1RN2FpQ1JTbzlJSk1EV1RNcjJlaVJSakgvUi9raEpuckpW?=
 =?utf-8?B?NnE2Z3ZNcGNBNkJ5ekIzTTA5RjhKMkRUb1ZnRGtFbUxPa0E5dmFaR2pkSXox?=
 =?utf-8?B?dHhqd1QraU80d2ZmcDZBRzZQZlFvcGsycEFYdmR4a3E2dElHbXVTK0haTW5l?=
 =?utf-8?B?VVR1YTRBWW9SbjRkZEJCWHUzM2FUc0l0N1BwcXBtOCtoR0pYT0VaR2hUbFdP?=
 =?utf-8?B?R1pIbktGNkhLbVR5Skg3cWZSblYyQytsOGo2U2tIcmVmd3NUZ05jakdld3BX?=
 =?utf-8?B?VmhQd0JRek9iUnc2Q2RFbk5JLzlablBaTjg0WG56bTZaNmZMdW5WejMyMENy?=
 =?utf-8?B?SDdXWTY1Rkp4Ry94dUE3clVyRi9LTmpmNTNXYTd4L0x3L1VUZ2FBb1dndWR3?=
 =?utf-8?B?T2V5TVYwZUhzdTBJc0RLZDBncnZUMmdISlluem5RRXdGV0d0dXRkMXVsK09R?=
 =?utf-8?B?Y3pKcUt0MzhmVk1hclVoK1BGc3VBZmNNa04wV3c5TXFNZUUvV3BDb2JHTG8v?=
 =?utf-8?B?UXYrM3BlTkMrdjJieHFaZzRKbzU1aWo4ZExENVBSNlRQWXUrakR5NTk5Z0ZG?=
 =?utf-8?B?RTJXd2djeUwycEZZNk5EaWU2NGdmb1hPNkl0eHovd0FHL2dLclhjcjg4dVdl?=
 =?utf-8?Q?+wezo46gJXmO43wN0s3zE3EUa?=
Content-ID: <44D8033D9BD3644BB5C857AA323AB7D1@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: illinois.edu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5768.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7806f7a3-a858-4698-4ec6-08dc1c284d04
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2024 15:30:59.5804
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 44467e6f-462c-4ea2-823f-7800de5434e3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CFZQZhGkpwNqN5FyJaMxE/0UYQ2gp7np5BWtLRYFcbzVoOzN1W/80KV351XL+JeWsXz8Xs5ImWBWXPGFFU86Dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7953
X-Proofpoint-ORIG-GUID: EpLm00Ygp0XNABjsngF6Jvz6EuXy8ns6
X-Proofpoint-GUID: EpLm00Ygp0XNABjsngF6Jvz6EuXy8ns6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_073117_621719_C2A13A91 
X-CRM114-Status: GOOD (  18.83  )
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

RGVhciBMaW51eCBLZXJuZWwgRGV2ZWxvcGVycyBmb3IgVUJJLA0KDQpJIGFtIHdyaXRpbmcgdG8g
aW5xdWlyZSBpZiB0aGVyZSBoYXZlIGJlZW4gYW55IHVwZGF0ZXMgcmVnYXJkaW5nIHRoZSBjcmFz
aCBpc3N1ZSBwcmV2aW91c2x5IGRpc2N1c3NlZC4gSSB3b3VsZCBsaWtlIHRvIHN1Z2dlc3QgYSBw
b3RlbnRpYWwgc29sdXRpb246IGFkZGluZyBhIGNoZWNrIGZvciB0aGUgbWFsbG9jIHNpemUgY291
bGQgcG9zc2libHkgcHJldmVudCBjcmFzaGVzIGNhdXNlZCBieSB6ZXJvLXNpemUgdm1hbGxvYy4N
Cg0KWW91ciBpbnNpZ2h0cyBvbiB0aGlzIG1hdHRlciB3b3VsZCBiZSBncmVhdGx5IGFwcHJlY2lh
dGVkLiBUaGFuayB5b3UgZm9yIHlvdXIgdGltZSBhbmQgZGVkaWNhdGlvbg0KDQpCZXN0LA0KQ2hl
bnl1YW4NCg0KLS0tDQpGcm9tOiAiWWFuZywgQ2hlbnl1YW4iIDxjeTU0QGlsbGlub2lzLmVkdT4N
CkRhdGU6IE1vbmRheSwgSmFudWFyeSA4LCAyMDI0IGF0IDk6MjbigK9BTQ0KVG86ICJsaW51eC1r
ZXJuZWxAdmdlci5rZXJuZWwub3JnIiA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz4sICJs
aW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZyIgPGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQu
b3JnPg0KQ2M6ICJyaWNoYXJkQG5vZC5hdCIgPHJpY2hhcmRAbm9kLmF0PiwgIm1pcXVlbC5yYXlu
YWxAYm9vdGxpbi5jb20iIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiwgInZpZ25lc2hyQHRp
LmNvbSIgPHZpZ25lc2hyQHRpLmNvbT4sICJzeXprYWxsZXJAZ29vZ2xlZ3JvdXBzLmNvbSIgPHN5
emthbGxlckBnb29nbGVncm91cHMuY29tPiwgIlpoYW8sIFppamllIiA8emlqaWU0QGlsbGlub2lz
LmVkdT4sIExpbmdtaW5nIFpoYW5nIDxsaW5nbWluZ0BpbGxpbm9pcy5lZHU+DQpTdWJqZWN0OiBb
TGludXggS2VybmVsIEJ1Z10gV0FSTklORzogemVyby1zaXplIHZtYWxsb2MgaW4gdWJpX3JlYWRf
dm9sdW1lX3RhYmxlDQoNCkhlbGxvLA0KDQpXZSBkZXRlY3RlZCBvbmUgY3Jhc2gsIOKAnFdBUk5J
Tkc6IHplcm8tc2l6ZSB2bWFsbG9jIGluIHViaV9yZWFkX3ZvbHVtZV90YWJsZeKAnSBmb3IgdGhl
IHZvbHVtZSBtYW5hZ2VtZW50IHN5c3RlbSBVQkkgKHVuZGVyIGxpbnV4L2RyaXZlcnMvbXRkL3Vi
aSkgYnkgdXNpbmcgb3VyIGdlbmVyYXRlZCBzeXNjYWxsIHNwZWNpZmljYXRpb24gZm9yIGl0Lg0K
DQpUaGlzIGNyYXNoIGlzIHRyaWdnZXJlZCBieSBjcmVhdGVfZW1wdHlfbHZvbCAoaHR0cHM6Ly9l
bGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuNy9zb3VyY2UvZHJpdmVycy9tdGQvdWJpL3Z0Ymwu
YyNMNDg0KSwgd2hpY2ggYWxsb2NhdGVzIGEgemVyby1zaXplIG1lbW9yeSBieSB1c2luZyBgdnph
bGxvY2AuIEFkZGl0aW9uYWxseSwgdGhpcyBpc3N1ZSBpcyBhc3NvY2lhdGVkIHdpdGggdGhlIC9k
ZXYvdWJpX2N0cmwgZHJpdmVyLCBwYXJ0aWN1bGFybHkgd2hlbiB1c2luZyBJT0NUTCB3aXRoIHRo
ZSBjb21tYW5kIHZhbHVlIFVCSV9JT0NBVFQuIFRoZSBzaXplIGFsbG9jYXRlZCBjYW4gYmUgbWFu
aXB1bGF0ZWQgdGhyb3VnaCB0aGUgdWJpX2F0dGFjaF9yZXEgYXJndW1lbnQgYnkgYWx0ZXJpbmcg
dGhlIHZpZF9oZHJfb2Zmc2V0IGFuZCBtYXhfYmViX3BlcjEwMjQgZmllbGRzLg0KDQpUbyBmaXgg
dGhpcyBpc3N1ZSwgaXQgd291bGQgYmUgYmV0dGVyIHRvIGltcGxlbWVudCBhIGNoZWNrIHN0ZXAg
aW4gdGhlIGNyZWF0ZV9lbXB0eV9sdm9sIGZ1bmN0aW9uLg0KDQpUaGUgY3Jhc2ggaXMgcmVwcm9k
dWNpYmxlIGJ5IGEgQyBwcm9ncmFtLCB3aGljaCBpcyBhdHRhY2hlZCBpbiB0aGUgZmlsZS4NCklm
IHlvdSBoYXZlIGFueSBxdWVzdGlvbnMgb3IgcmVxdWlyZSBtb3JlIGluZm9ybWF0aW9uLCBwbGVh
c2UgZmVlbCBmcmVlIHRvIGNvbnRhY3QgdXMuDQoNCkJlc3QsDQpDaGVueXVhbg0KDQoNCg0KDQoN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
