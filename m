Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B92C433FE
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Dec 2021 17:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QqVDuA/McnQJr5eKyCk5eLFmeiqXbfRe5qdAKSQT4x0=; b=aOxzx4Xs12OXcV
	+yhRuZkrdh7PHUi9xkqKqTvGy8KS2QV+y0Agyv9prlqOTAl0DZJu6z+9zGcoXYY0aRmdmRpmJYibk
	VcZvjGxKLue4d9vxZG/O6sHXFQ7iyDYNGAepQdL2Gd5ZwwG9e2npBjjutcuJl/1Wmg1VhAuWYx5nu
	fg63JDyuSaRC9XqE0c9Gm46Vfnk/1L1GBhl1nXw5K/TyECPWj4AIQV325LCF/FTEIK3KJPBppR8XF
	9T5vu6fPc3bfW6YGDbFfEV0ufhLUNSUI8Cdev4t51cw1kkZEHmbv+vjpvht2VfMivzwu5//cLSw4q
	BuZFCsg0ubupjW7p8GDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwp23-00Ap6C-Jg; Mon, 13 Dec 2021 17:22:35 +0000
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwp20-00Ap5Q-6d
 for linux-mtd@lists.infradead.org; Mon, 13 Dec 2021 17:22:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1639416152; x=1640020952;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=K01p1AmThlZBsA76elncZubIv48IrOtOkYgW+l0YMxA=;
 b=YAcxdxhghM1RpyWC1uKZ1YZalDGHLMFP2V5G2W6Ii4O67LZSUpEW5M4N
 VcEc8uLYS2SuLd6uIYJ5/wYthkfw4P70GedfI9vMLfITV5eRrtADeE6QT
 aBy8pyaV6n11eDDjhkM1hZRVpDL+vzTK1sESmlvO8iu6Ij9Vz824o3lAM 8=;
Received: from mail-bn1nam07lp2048.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.48])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 17:22:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q5Cj168b0AcjXQlvXF92F5LOMrThyrEgrUUs+Qet8NS909lulCYJI1vDQ5Zue9L8QhNRf2W6ZnlKUAgSVvTcuPphdEDpEygO649XyYH7alpVC/bZmYFw0f656EGeBDagOdT9OZjS0wMoAPJ0UZYLnxJ8w0oRn86XasDP9qQkt+A471fsOJ8+Gp0v3Z88K+jgHyv7QQSg7grDmTyE+V6DT3KnTG03KH1ZUUFdiSGE2mDhorN4pxBPl9PGDtFP+yLWsaStcfwC/BcOQGGnoQ1G0AHMFFXGuQ9W3qqmDQ7dlqSn3SAJo0Izfi/uTpvHuqukBFKrs16Q0HRu0ttTXJiitQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K01p1AmThlZBsA76elncZubIv48IrOtOkYgW+l0YMxA=;
 b=Y0iLfQtPDdWandDZ9kwbmgsmnMfeUbEFoqU4UqITu2O0bgricClLS46mczA4ZXYEEyZ7qbkc1DG1lwWkd4Ki1Pshwuh1gOFNWk8GUF5lhFvkHb/BTqL/qjpH6Vo9CVW1iKyt4+Tcm6MLH/zUd3kUpa2q/KUinO+BVmgb1FA2s8v+1I+c41rGrTLUKf/5Lj5Y0HGnFw/ilXxBEUyN5pf2TLIM+Xc66mb4SV7SQjSWQSj0sSTs7dWAp8Yx49G8vPbebTpWIGXGq4420dvDpNHNo3dKRMmFDs0zJX3eqN+EFcDwCl6Rb5y8WvUAaqUVxXqHEqKLxku06trfIwNhH4j+LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SJ0PR02MB8449.namprd02.prod.outlook.com (2603:10b6:a03:3f5::8)
 by SJ0PR02MB7773.namprd02.prod.outlook.com (2603:10b6:a03:318::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.11; Mon, 13 Dec
 2021 17:22:27 +0000
Received: from SJ0PR02MB8449.namprd02.prod.outlook.com
 ([fe80::6837:9c03:af16:e6a9]) by SJ0PR02MB8449.namprd02.prod.outlook.com
 ([fe80::6837:9c03:af16:e6a9%3]) with mapi id 15.20.4778.018; Mon, 13 Dec 2021
 17:22:26 +0000
From: "Sajida Bhanu (Temp) (QUIC)" <quic_c_sbhanu@quicinc.com>
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
Thread-Index: AQHX50c/AxvFsMywYUa9+bTRjnnN0awwpEgAgAAZIbA=
Date: Mon, 13 Dec 2021 17:22:26 +0000
Message-ID: <SJ0PR02MB8449CB45F47541CC84C7136BCD749@SJ0PR02MB8449.namprd02.prod.outlook.com>
References: <1638427092-9139-1-git-send-email-quic_c_sbhanu@quicinc.com>
 <CAD=FV=VB6hsEHEb8yZmB=xA__47p4vC6dBc528RV37dvAKTgOQ@mail.gmail.com>
In-Reply-To: <CAD=FV=VB6hsEHEb8yZmB=xA__47p4vC6dBc528RV37dvAKTgOQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3e3e98fc-fc69-47cb-c6fa-08d9be5d2270
x-ms-traffictypediagnostic: SJ0PR02MB7773:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <SJ0PR02MB77736A29F3C0405C54654218B1749@SJ0PR02MB7773.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jfWFned8Yl34z+0eWeJYprNHuD/P9hx/lGFR1FUrhq9rj7dPHRuTTp9797byFbonqaYb7lhLSIaW1GMWgkQtC5oXzoA3UwEneTKFsB8yR4svMkRXYGAXNq1JStPhSReisoB9LON9IZnQ5APWq/GYOEZzGum20q+rPwDee5EsmRKQiPan2vKM0iHYRPPHtnmFbEmEKv5L+hMms81a3uJp+wbFkbP2p7lZ9kaiPsayhpD9HlyJzY45YFcWKZqD513gc5Q3cEIdJNRhl+iSHf/laI7ZaGqEERc8CewwcO3PUzMcDqhE/gZCHMBbOEtd/bgf26q5ANXCn3x2IJ2IO5KsfJQ/2UaPdGy9f07Xwxen1ERKh8WfRfI27w5r5N8NW1F8yXD4Bp3+rvA+tmQKP8xIgPyJqd3z4ywlJPVVOHY4Dckw+DvRc5wiDr+qlpwGrlrJDH9PV73pQQh3FUNYFzZfQDqB+xT4HMrosEJEXLVId8VvGcIspWE6PMC2qJSPDqSJEhmdWOLRxIged4gTF57n0GQNxURi1AS2eW8kCh+l57jZPimNMZ35IW+IoA3aCJchAQo6ZSkfDOkOsN0uw+MAi3MkfH67A+ECMN2rBpM2WY24ssxetzaM0JYojtpoFE7RP2hklOc79PTiCVdv82u0jm0PNSSC5lFhMsuY1li7I/HhFxN/FRaYvPkKSzU7fhg51PloV/1DzQfEC3kuozP4RexPxV8keZBXdV9nkbXjJPbfdngk0qkZ2fEgLuXoeocQKUZCt1M163IGfx+q/Ctz0LtmlMwpwQIY17O33nIjOfw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB8449.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(76116006)(316002)(66446008)(64756008)(38100700002)(54906003)(66946007)(66476007)(66556008)(110136005)(122000001)(5660300002)(86362001)(7416002)(55016003)(8676002)(9686003)(26005)(83380400001)(8936002)(33656002)(2906002)(71200400001)(4326008)(38070700005)(508600001)(52536014)(6506007)(186003)(7696005)(966005)(53546011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Nm1PMDlBN09JQUtuelk2bWxoUHNLOFA0Y2ZTaHV6aUlVSmI3Yll6Yk9vcnZ3?=
 =?utf-8?B?Z1dZb3VnR3NBY0o4VnExakdTNEZHZFBnRjNBTXNoZVRqM2FSbE1tQzZOOVF2?=
 =?utf-8?B?R21XNWxOMlZxSjZ3MFBXNmhjaXNMeE1sakdBTW9RTWNpSmYxSG9PL0hQREFu?=
 =?utf-8?B?bm4xdGd1R0tQRk5ZalpVbkFqcEo2M0N1WTRtU01qelMwTnVWY3Z5cVRXTVpl?=
 =?utf-8?B?M0llS3Q2QUhQVGRRd1NycHNGODEzYkdoTjZDR1ZVUmpwU0E0K0Z1Q3RsK2xW?=
 =?utf-8?B?UEdSc3hsdVBVSVN1cE5RMzByS0Mvc1kweUVBL1k4TlRSdWUzT0FaaXFSbHR3?=
 =?utf-8?B?LzdHaGRuYm1sbTRKNWRHa3F2WXdockQ3ZTlRYnQwZWJreDNyMjVWRUdFYlpI?=
 =?utf-8?B?T2FicVJob05BQ0JVU1BRSHdNcmg2U2c5bWszUmlQNmVEMW85dXFMR3E5QjNT?=
 =?utf-8?B?bDdIbDhBeWRoVnN1cGc3bXNCN0R3TnVzZEFQMkVQRmdXODRwV3gzTUVwMVZH?=
 =?utf-8?B?bldPVE42T3ZIdmFiRjZMZkMySnhYbDkyWFFuZzlmRXRtQWdWL2tXQS9kRTVz?=
 =?utf-8?B?dFN0L212TzBYcnhpY3p3VnF1VEJoSHJZQzZGYXJIeXJaSlVxTm5KblYrbnZU?=
 =?utf-8?B?ZFNrMmxBU0hRSDBzeEEvczhRUTNlL2tLMTNMb2E4dXVkWDlldWFrS1lMZzBk?=
 =?utf-8?B?ZkFJYUlyb1lGNko0OFJwMmNYQlJWVzROQ0RSbGw0VGJYMWNzdXFyNHVpclhx?=
 =?utf-8?B?a1FSYnI2eFRPK25NZVBFUUM1ZURlc0U5angwNmRBejZjK2h6N3RVYVo3by8x?=
 =?utf-8?B?MllDRUJBSzJVSXRjb2RuSGl2elBiUmFDdnlqV0JXY1JkTHJNZFROYmVMUXRD?=
 =?utf-8?B?cTRNUmhtR0lxOFFWT0k3NFVYQzN6aTFNbHZteUlKaEd2SnFJbDFqc1RvVlJV?=
 =?utf-8?B?UXUwLzhRZDB3MDNCeWt3OWlud3JVR1hVeWM5Y2xSSWhsR1BxNE9kdFRsV0Vw?=
 =?utf-8?B?aUs2NGRPT1N0eWczL2NmcE5PTnRFbTdqU3NTQnNXVkhhZDZPZ0NiSDZ5YnJj?=
 =?utf-8?B?L1RjNE1rSGt4aEpITStqWDJKZUY3enpXVlFZSW4wWWJCUWF3RTcvTEJpTU8z?=
 =?utf-8?B?NktrMThBSzFxMHc0cnZHdEVpVHVhc0NjTXdBM1J1NWwvRUhycWRzdVJRaWYr?=
 =?utf-8?B?YnZDR2NucmQ1TVBlVitkb0ZSa0N1Vjk1V3V3MStJTlNIcjcvQnlVWnRQYkdE?=
 =?utf-8?B?Q1h5QzAyOWRoT0lMNGlCbllHTnVvTzJZNzFRTXRtZXNwb3BjNE5TQVFYUWVV?=
 =?utf-8?B?OGV4bDVCRGRHTmc1SkJBcjNOcmR3enRmQlZJTEhiZzk3VFJLMFVJWk5nV3BG?=
 =?utf-8?B?dGcyZDBlSVl3TWhLR3ZBSjB1S0djUXB5eGVNbFVkOFU0VnN3dWlnYnB1ZHFh?=
 =?utf-8?B?K3QvbWZuQWlYS0lNaDErVEQrdU9MNTZ4ZDZyclBoZFVUc3l0V2l4R3pLdkRL?=
 =?utf-8?B?MDlWUEVZUmFURHJrVmp0SVpaLzVDb0hVVWNBMzhYbEc5N1dmeDFNR29rTXhE?=
 =?utf-8?B?OTY1NHRZaXNSVklkU05Ba0p3U043NjRLTklnSWxHWmNMbkw1WjNKT2U4cm81?=
 =?utf-8?B?amFZMDBTMUlOdk9MeC9ORzZCSXJJYjZKWEJHMlZmQS81Zm9oZ2pJYWgrOHZs?=
 =?utf-8?B?SmVDNGVuMVpiSkZqRGpVZUF4UUwyRWJZbWxwU0ZMNkZuUC9oWVlDSmdDWlRZ?=
 =?utf-8?B?S0FIaXZYOFdPS016dlVaRlZudWJtMUJabW9CNDM1ck13bWYrM1FaN1QxVmll?=
 =?utf-8?B?UTRja3pJZzhVcUV2ditPZHJrWXhqZTB1YWpMNXJ6QWtkSlFCU1NaZHBsUFhw?=
 =?utf-8?B?amVhQzJLVzBUUHQ0MEIyS1p2V3VQSmhzK3lQQitVVDF2SEx2Z3lpMFZkUTlU?=
 =?utf-8?B?eU5kMVVEaWZnU2tyWTBHNk9hQVBROGhwOEtjdWdlcE1BUWpleHdVVmVVYXRR?=
 =?utf-8?B?c2JQaUFsV3BCb0dtT2d0SGpXdyt6TGVLc0RQa3E1MjdUMkJRd0FldWxnTnFU?=
 =?utf-8?B?SVdMZjhZalpYU3lVOUlGbTJiNEV2OWhDb1BpYXA3R3JYVmEvUnIrc2ZOQmdz?=
 =?utf-8?B?TURSY1VvaFBxYlhPVHNKTTl1STFWZE1YVjJxTG9EVDdkR0NvSG5JVThDZndB?=
 =?utf-8?B?VDY0ZFRQYUl4VjUvalRGM241MnNST3pTVDE2aEoxVTladS9PYi9RRkJUa1Nv?=
 =?utf-8?B?aHBwcVlvNWZZbXNDSGNLVUNqSXV3PT0=?=
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB8449.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e3e98fc-fc69-47cb-c6fa-08d9be5d2270
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2021 17:22:26.6657 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uOVzRBmmBRhB7rtCZ5p8MA/DPqbX1cxVNRnd0nFQx/8hNKJ6r7WojRjhxy7CGNCgOdDPZhaS23irQAtDbp+5FQOU/AqQAvf99dYfYFs/Cp4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7773
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_092232_287281_0EA141DD 
X-CRM114-Status: GOOD (  19.53  )
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
