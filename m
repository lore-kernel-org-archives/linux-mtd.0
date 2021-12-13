Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E8C7C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Dec 2021 16:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IAoPZdgE5pLzjIJ8YjApd+1PqsEZUIQifrKEYTPrIXo=; b=QEu+/83gM9krXV
	Jy7+7QlL/oBFMiDFyq/n4aYJSG6peU8P3QGeF6ea35eyk5Rs2bLCEdTFaZiXDIM3rO3q0lLpzpfdG
	xbMvDjjyM3SRJdAaRUTiNsv00zw+TNAQB3ilVbxPvzVRz1RjD7l9ix0/O9z2+lnnmOZyWzMoE+NYe
	lzQHCcAUTx+k3k1yuAqhsp87cdfeTJ6y48tqtiaezj7c7q6+rnzAG/cpshXDVNgF1/j+2Nm3lSbLz
	q1oX2tXjPhO4X8uYB5D6bp5VBzjz2BSt3taW//BBfE9qe1OeqkwjcOTgnbWEE+FfK4IjBx8o8feRS
	UV+jjCvtptXofd713HTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwoem-00AkUY-4o; Mon, 13 Dec 2021 16:58:32 +0000
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwoei-00AkTP-Pw
 for linux-mtd@lists.infradead.org; Mon, 13 Dec 2021 16:58:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qti.qualcomm.com; i=@qti.qualcomm.com; q=dns/txt;
 s=qccesdkim1; t=1639414708; x=1640019508;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dPumVHyksiJFN6D0nU85Y2prrZD4WLWBUtMJ5Ti48IE=;
 b=1WYz/Z2eRjMaxMNxhIcpCVnIhZLyybSZ0OY7gGdX8iaa+650QnwvFi9K
 CiUiXvgttTZuEIfJJZ/tVFqpufnNoAFKTrzlTioesDFVyQ+Vu9gXsqg16
 aTq1vRCJvV8Q3ZLP9JG2cU59MZHdHx+1Zksgt39h2BfoFXhDSw5BdHkmk 4=;
Received: from mail-dm6nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.169])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 16:58:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iFPzuvb9TA/vvHRuoRqQUJbH7BgRY7Jm43aLRYbRj+/aidgRr5Mg9+TFCVhxVPhJfNcCa8hw5JvO1W9GzH62FCtSxm48kkwWQO4XHBMlIwSRKcjnCDu1oKfb387rriryS2XGl8tF8QypluBNGK3p+ZFwNdh+XryNxx8L7SeCLy7IHEmpMokDD0W0UIjD0cd2fSyNoWw91zYTau+eMcsw39i4A236bW1i/Fj0pSVN/E302ebPw369D8Fo0kcDwn5B4n31089/0nfHSgYyqZZiBwu+yIkT3ipw+88GvXePkdbvDTmA2m82tWwAn2vYSZaRCJ6EmJ6U36Q470lJnQijrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dPumVHyksiJFN6D0nU85Y2prrZD4WLWBUtMJ5Ti48IE=;
 b=WekbWTytnKZbLGQY2TLnu2KKJwMt/tZNLknanvbsOcU2WDn7GDkLPyXuOd2Bw+7etATKWrRR1F2mn8Ya3B4d66qcnLVyavRKfXdEVM6Cl5xjwvOvX4JasrChzIRRhN5Q2Ew4XcBgZS5cxjGDrLObUxobie4wgKGcPAAGmEohrFRm/TUWsmuwjDLGKnAHWLq2xp9JDbdSso14ctD6kNEoupIcsntxlrdHCigAU5XrRaNBU1+Ocws0gIN28Lt26zqGKVe9YuNXaW9DGo8NyH+kQo+ayWDu/yFTba7p8diqGOEa9dxHLqUWhIA/gI6OFC77hHhvEdDbD4hj6NDEUBXEyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from SJ0PR02MB8449.namprd02.prod.outlook.com (2603:10b6:a03:3f5::8)
 by BYAPR02MB5560.namprd02.prod.outlook.com (2603:10b6:a03:9f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Mon, 13 Dec
 2021 16:58:21 +0000
Received: from SJ0PR02MB8449.namprd02.prod.outlook.com
 ([fe80::6837:9c03:af16:e6a9]) by SJ0PR02MB8449.namprd02.prod.outlook.com
 ([fe80::6837:9c03:af16:e6a9%3]) with mapi id 15.20.4778.018; Mon, 13 Dec 2021
 16:58:21 +0000
From: "Sajida Bhanu (Temp)" <c_sbhanu@qti.qualcomm.com>
To: Doug Anderson <dianders@chromium.org>, "Sajida Bhanu (Temp) (QUIC)"
 <quic_c_sbhanu@quicinc.com>
CC: Doug Anderson <dianders@chromium.org>, "tudor.ambarus@microchip.com"
 <tudor.ambarus@microchip.com>, "michael@walle.cc" <michael@walle.cc>,
 "p.yadav@ti.com" <p.yadav@ti.com>, "miquel.raynal@bootlin.com"
 <miquel.raynal@bootlin.com>, "richard@nod.at" <richard@nod.at>,
 "vigneshr@ti.com" <vigneshr@ti.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "stummala@codeaurora.org"
 <stummala@codeaurora.org>, "vbadigan@codeaurora.org"
 <vbadigan@codeaurora.org>, "Ram Prakash Gupta (QUIC)"
 <quic_rampraka@quicinc.com>, "Pradeep Pragallapati (QUIC)"
 <quic_pragalla@quicinc.com>, "sartgarg@codeaurora.org"
 <sartgarg@codeaurora.org>
Subject: RE: [PATCH V2] mtd: spi-nor: winbond: Add support for winbond chip
Thread-Topic: [PATCH V2] mtd: spi-nor: winbond: Add support for winbond chip
Thread-Index: AQHX50c/AxvFsMywYUa9+bTRjnnN0awwpEgAgAARngA=
Date: Mon, 13 Dec 2021 16:58:21 +0000
Message-ID: <SJ0PR02MB8449D55AF90D8CA80321AD0ECD749@SJ0PR02MB8449.namprd02.prod.outlook.com>
References: <1638427092-9139-1-git-send-email-quic_c_sbhanu@quicinc.com>
 <CAD=FV=VB6hsEHEb8yZmB=xA__47p4vC6dBc528RV37dvAKTgOQ@mail.gmail.com>
In-Reply-To: <CAD=FV=VB6hsEHEb8yZmB=xA__47p4vC6dBc528RV37dvAKTgOQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=qti.qualcomm.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6208d2a9-9810-4b5a-786e-08d9be59c50a
x-ms-traffictypediagnostic: BYAPR02MB5560:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <BYAPR02MB55601030D8F4BD6587C44D0BCD749@BYAPR02MB5560.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: o9EZzQ7RG6nIjlhnE9FfG7j2K7U4+RPNN2OpZWFsjUpbSvdDnGanrXjeLiTwNJlLTclzdaq/dsIRK3lcC3v8k46NpxhJEgWKNed946TYF7mHgWoWVMXPEneZ7AyOYm8LNdtqE5AmWk/ATi5/zsgdP3BrUN2h7FSUb8LihFfJCm4XCJq+qR1kGlmgyYPgn5neVDd1yj6yj/XvQucuovI/YKUJzJK/WFzvQuabsig4bDduCTu0gSwVhES4MOXI5KLoQlcw+E8VE2t1ueU+R9xQ/4mQXI5GqH6nOe03Gt0NGeAl5ewYtP6YkRUH98UKFXs2zjaCnX6jAQZbHzRA7F7H9Rt+7ojz+LCrWFM9nq5m8gJknkgjFiiLsufoe/Secf+YtqFA57CTcDO6J872yzdFMrYDvnyxtO2z1IdFSLzukmqpjJaATUM0KcqcCoLcg88NqLYBdge17XpcSNWbgYtm53P/Ez1HMAIy1UZxLhp2qpIO3jtW4y0vR2dSLyoij7pSua4j3Oe8gLKQS/45YXpu9obVY/RzEl8Zb2fQe9heLFseQq/UE5gVWpJEuFOo1XDCeIA4NOA7gCiYiTQQu1/8kpo3wiD2sUsXYFEvxch6jAhl31P/WUlzRrjFXAJ0w27YHsE4I7dacHoo0FRA5IV8NRQ9ua33kbSBStem/2/kHNbu+W98n96nrP3CnPMGcyf1iqOzf2tSfGUcPR1elrmSMR5dz9rQ7keFV5FR9j4cLYzh9JFFZ5pKf2OrsEfH94M1bZE5XDpxWxoPd0Ex8KlxCqlPBuAwgu5LyZAFvVFI7SyMBwyvDB1lup9XT71tnM6wpOIcZV87YLzE62Uirp/zbA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB8449.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(54906003)(110136005)(66946007)(55016003)(7696005)(316002)(6506007)(53546011)(4326008)(186003)(64756008)(5660300002)(508600001)(66476007)(33656002)(966005)(71200400001)(66446008)(76116006)(26005)(66556008)(83380400001)(8936002)(8676002)(122000001)(7416002)(38100700002)(52536014)(86362001)(2906002)(9686003)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U1JESkp6OU82R0N5d1VMRnFLbU0wVDBGVXlFODNWdjFkMkZRVDY0TnZlVHBM?=
 =?utf-8?B?RVc4dWs2a1hDbjd6b3A5TjB6MUpLZHZoaXlub2RseUZwSzh6YjNXczRyQ3hZ?=
 =?utf-8?B?RFA1RGJnOXdwTlFPSEdLaEZUbDdzMm95UDF6T0JBWC9ObmUzaER3RDNZL1pt?=
 =?utf-8?B?cDFOVFZGTlc0RnJEVElVSGJ3d1NCSHdaaElLejhWSFVxc1ZNUmhHdlE0TVZR?=
 =?utf-8?B?ODlkUkZBY1RSSGdyU2VpQ0x4V1NpcGpaeU1BZW9XZlovNUxvL1BoQklzcDM5?=
 =?utf-8?B?VStBNmFoWW9FVlAweU5zVGgybVNwbldDTTIrMXFTQkM3OE4zZmx6SncrS2JX?=
 =?utf-8?B?cnhoTVBvd1VxYWZVMVh2bjF4MDl6VmduMm1UVUtpNlB2aXdsdnBsbmo4eHA3?=
 =?utf-8?B?RnJTdlU1bWNQMFR6VHB1ZGVCRyticjRHeW1MVGNEV3haTk1ncVJQQW5vRWxy?=
 =?utf-8?B?N3I5SnFySThuUGdwV0J5aUFIdWUwemQ2dmRrUVlqeG9NY210NEVGeDByRzFt?=
 =?utf-8?B?VFlKZUZyTmsvSkxKSjAvUEtpbzVNLzZRVVFVcHhMSnJKOHBFa1JBWE1KSFl6?=
 =?utf-8?B?YlhFcWd4SysxUjRzbXpFN1g4ckJNVHY1Q1FsWmpLRmY2cXMyNFVySUM5UFE5?=
 =?utf-8?B?YUp1eEhiWE5DdnczSDZFckwvTHRiY3ZlUEthcGk4U0J6QnN0M1V6MWxWeXQ4?=
 =?utf-8?B?ZzJQVTZuUFFwdjgvZmlJb0paRkR4ZWRBK2h5T0FiZGpPUGtuOXZoSVVLWVdP?=
 =?utf-8?B?SzB0RWZWcklxdUsxRXdwQzhoNDhGVnBZNFEzeDNNa0FEOUYrakx5TkpiUlRB?=
 =?utf-8?B?aytyVEpYdTMxMndPL0Q5N3FhQzlBTGhSTjg2cnpxVUpGRDQvRTI5VHkwMmJo?=
 =?utf-8?B?SnB5a0lHTzVKcFdSbHY3ZkJLTlpCQWtmd2FqL05jVGVNa3RLa1NOLzNjSWJ0?=
 =?utf-8?B?Zk1Hc2V3Q0lVWHMrWXVwQUNFUVVRZDZPODJpdE1PcFJRNkcxclU1cXQ3VFB3?=
 =?utf-8?B?WEJJbmV3aS9jbUZRQ2xEZTJJcXpPVXBFbnpNSG5QS2hManhySHFFeWpjSDVv?=
 =?utf-8?B?ODh5NXoxckRGOVhUVThYL2YzMEhUWWovbTRGbjYvTmhyaU42NlovSDNKczBB?=
 =?utf-8?B?RDVaK25VUmRjejhSWlRpZmhhTklBdGo3V3RJZkVuZ29wMlBjMlpQenlaNmlX?=
 =?utf-8?B?REpkVWJ5TXliVVA5ZDhlT0dNMUF3bzZiemI0N1RZeFo2TGFKdVEvWDdLTXVM?=
 =?utf-8?B?OFhQTDJFV0I2SENjYnhPQ1l5OGwwV2E4STJUU1AycU1ISFNPbmRBV0hxc2Fq?=
 =?utf-8?B?MW1OUDd1TGRZTUl2NUFZL3JLZmN1VjcwdCtXSUM2aGh5TE54YnRhS2pnbFow?=
 =?utf-8?B?Q0hIcDFCSExBNU5UM1hBMFdaY0JFSjJmbDE2YUxET0wxM0x5dFZ5a3UxQ2tM?=
 =?utf-8?B?aWFndUlUeW5jeDI2di83QVFIOVFSd0dsYVdBaXBxV1YxNUtzWjQ5TUE5M2kz?=
 =?utf-8?B?YXNYcnhVUkhaVGVpOWZuRFVJVHp6a0RqcTRZSlBnQWp0SnpMb3BwRXZ2RTA1?=
 =?utf-8?B?eFR1ZFN3S1RLM3pqTDFNVFRyNGh0WmhkRmVmVXRVZ1AzSE9SbitsOUJNVHR4?=
 =?utf-8?B?Tk5FUHhFR2NFekpxMVQxN3g0akQrWXpTbitrVVVlQXE1SWEvUDY4U1JrZlRk?=
 =?utf-8?B?MzYzWkgwT3dtaU9iOGNtdXdpRUdyRVhUNm56R2tyYkxjU3NPTVl3RmQ4dm1X?=
 =?utf-8?B?SUxLbEkxVnBVQ0RXOVl1eVZjaWVKcllPODRjWURVQmxReVBpUklDVVUwUWl1?=
 =?utf-8?B?RXovOXRGdkxKc3ZlL2VFUUl1R2VnRXo2Tm0yTHpGYlRqZG5DL0VnT2lzYlZR?=
 =?utf-8?B?YVMwMC8rRm00b2NaNDIwVDhoTGU1S3dnVmlZMnF3VGsySm9pRGNBclBnbnF6?=
 =?utf-8?B?QmlqVUdvcXVzbkVUQURidWx1eTJnbWlxT01uRW5hbjhDcDkySTBoaElXUDlL?=
 =?utf-8?B?eFE1Ukoxa1B3UkVrRWI4am1YbS85cWh3ak9ibVg1cGxlYmd4KzlYQlhiZXBN?=
 =?utf-8?B?MkE5bTFiUDUwQU1SS0RobERyK2g5dFJjR2plam9ObVQzSmk3MkFoK0dPSUt2?=
 =?utf-8?B?U3oySzV1UlVIaS9CT1pFaFV2UTVBNzlFNGxQSzMyMXdaQW5Hb0xud0NkbEVR?=
 =?utf-8?B?L1lEbFdXck9QSmJYUGtsaXhtcXhkM2pPRlFaQjI2cEdYdy9ISGlCZVliRVh0?=
 =?utf-8?B?V1ZmVlA4Sk5FTVk4OXpCbjFKc2lBPT0=?=
MIME-Version: 1.0
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB8449.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6208d2a9-9810-4b5a-786e-08d9be59c50a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2021 16:58:21.5862 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s2vBefwdpxe/ZQWBkU49AXMbtBc/dntCKPpEYemBJTL9YEDAIHgqL8HXLEScV2g7WOIAP2fHuB0WncF8RVvYFVDJ0zK7eybcGgrpbniV3K0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5560
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_085828_898573_C0F5757C 
X-CRM114-Status: GOOD (  20.60  )
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

Hi ,

Thanks for the review.

Sure, Will make the change.

Thanks,
Sajida

-----Original Message-----
From: Doug Anderson <dianders@chromium.org> 
Sent: Monday, December 13, 2021 9:22 PM
To: Sajida Bhanu (Temp) (QUIC) <quic_c_sbhanu@quicinc.com>
Cc: tudor.ambarus@microchip.com; michael@walle.cc; p.yadav@ti.com; miquel.raynal@bootlin.com; richard@nod.at; vigneshr@ti.com; linux-mtd@lists.infradead.org; linux-kernel@vger.kernel.org; stummala@codeaurora.org; vbadigan@codeaurora.org; Ram Prakash Gupta (QUIC) <quic_rampraka@quicinc.com>; Pradeep Pragallapati (QUIC) <quic_pragalla@quicinc.com>; sartgarg@codeaurora.org
Subject: Re: [PATCH V2] mtd: spi-nor: winbond: Add support for winbond chip

WARNING: This email originated from outside of Qualcomm. Please be wary of any links or attachments, and do not enable macros.

Hi,

On Wed, Dec 1, 2021 at 10:38 PM Shaik Sajida Bhanu <quic_c_sbhanu@quicinc.com> wrote:
>
> Add support for winbond W25Q512NW-IM chip.
>
> Signed-off-by: Shaik Sajida Bhanu <quic_c_sbhanu@quicinc.com>
> ---
> Changes since V1:
>         Added space before name of the flash part as suggested by Doug.

When someone comments on V1, it's nice to CC them on V2. ;-)

> ---
>  drivers/mtd/spi-nor/winbond.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/winbond.c 
> b/drivers/mtd/spi-nor/winbond.c index 96573f6..44f19f2 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -100,6 +100,9 @@ static const struct flash_info winbond_parts[] = {
>                              SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>         { "w25m512jv", INFO(0xef7119, 0, 64 * 1024, 1024,
>                             SECT_4K | SPI_NOR_QUAD_READ | 
> SPI_NOR_DUAL_READ) },
> +       { "w25q512nw", INFO(0xef8020, 0, 64 * 1024, 1024,
> +                          SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> +                          SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },

I had a quick look. Though I'm no expert on this driver, I believe that the name should be "w25q512nwm", not "w25q512nw" (you need an "m"
at the end). Evidence:

The Winbond doc [1] shows:

W25Q512NW-IM is 0xef8020
W25Q512NW-IQ/IN is 0xef6020

Comparing to a different datasheet [2], I see that:

W25Q256JW-IM is 0xef8019
W25Q256JW is 0xef6019

Since "W25Q256JW-IM" is in code as "w25q256jwm" it implies to me that for the "-IM" suffix you just add a "m" to the end of the name.

[1] https://www.winbond.com/resource-files/W25Q512NW%20RevB%2007192021.pdf
[2] https://www.winbond.com/resource-files/W25Q256JW%20SPI%20RevJ%2003102021%20Plus.pdf

After changing the name, feel free to add my Reviewed-by (and please CC me on v3).

-Doug
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
