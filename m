Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F293BCCA47F
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Jul 2022 14:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zUs/ojoNpiJfZgVFhIkzty0AtpDJ5rtGf3PaZBpop9E=; b=3HYXpyl84iUIHN
	pi1UPH0u2lTKaRw8FwlY5S57I5a1cldJEUoNeC97ZXQ07UMouEzGRk3e4/Oy6zURxNSrUlDVkp4vk
	7v6UninS9xs9NZTDKvOxtlkM/xU46bLdU8LZUIvSvIw2PD/zJIji3S2jajJWgfWpMoVHCYFPnD7X5
	fTxfxospWpYnH1UqKgQoMLUdzHBu8U1jaMbCJGdJUlAx6n+gkLWw0umNtHZtwgSMAbP+APuL2lnSx
	J7DdN18O8quHjRG+exgq88CJhSCz/6JFb2to0acBRgv9L/W0/m3L+aFECiyikL9MkxOhktmpyq10H
	F/hDLIFpj38HRL6Jsl1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9SvQ-00GeWS-Bw; Thu, 07 Jul 2022 14:56:16 +0000
Received: from mail-dm6nam12on2075.outbound.protection.outlook.com ([40.107.243.75] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9SvM-00GeUT-Qs
	for linux-mtd@lists.infradead.org; Thu, 07 Jul 2022 14:56:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UZthMR6lVux4P/eOd8frRrJgIO6u8TLWIulXEeVUxFhyRXq8pmHGkuCnc1Q66GppbZye/kTj+i9Wb3/Tl/x0Sa1O2m+43ONs6oteEs5VFifw41ArCii/EQLifkNoq7bf3P+N9EbAbrf3nrUWx2Lyv6Gk8pNjADXDekuh6KWZaK2+T+RFR+mUt32Iid+gTLAvvDdVhGfwSkySQXC1KJGkxzJ98+A2yp7Zx/8XrC0oe4FKsOGKMjCMUSbS79q3qLtiIcWxQUuJoVuksWDliH//bY0uxBxNyehTIk71GdU9flmACaSy9GyvQY1MCFKOlyQU/7lvCPNGyraA0vtRntBP3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LUmf2jD8PqqBIAFzbA1rfqiyWM4kMPniFJHzMKosyS8=;
 b=DcTBhtDolcSHnsZ/KF/zADP0pnCuRr7aK/tJJVGnxAgj9jradaVsuZfOG/IESmfqh5mczaP9eoiQZvDEngytzW+s/t45/BehblD7DF17fwVvxB6QCFLcspsjhAwt5mnF6CwBtlYSHfpE7/T10cveYaXK/BBfkEruifzIsaIrh2DCBL2/U575AwaxcCdYnxIaZbZjBt0rZsIyodMdyNaclWcCLZIaZbygla9vRujB+XrvKOxnmXSUiODWjdw9RZbOSSmhUGxZa8ecmcEJgGpFTDa6WtPW9hXgeCy1rzvd4k1a2zvRYGG/usCFb/HtWx+hlE+0KjfQk3JHJ1WECeTHjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LUmf2jD8PqqBIAFzbA1rfqiyWM4kMPniFJHzMKosyS8=;
 b=Jmn9+cItepwBWt6tCVrDcxV6kUu1RLKH1kvyyhpocAk5KLikJlD+hOID2mgK5qW+PsT5Bv5j6U3KDTXqO7ik6HlAgfpkP3VrTzk+/AroDnuEUKLCnOTwiEbvo58/oOPgfwfbo6SS3VjWvTDQhx9XQwlYL9J65U3y/TBRNwQItGc=
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by CY5PR10MB6264.namprd10.prod.outlook.com (2603:10b6:930:40::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Thu, 7 Jul
 2022 14:56:09 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::88b4:c67c:e2e2:7dbe]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::88b4:c67c:e2e2:7dbe%8]) with mapi id 15.20.5417.016; Thu, 7 Jul 2022
 14:56:09 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: mtd:<myname> mount syntax unique to jffs2 ?
Thread-Topic: mtd:<myname> mount syntax unique to jffs2 ?
Thread-Index: AQHYkhGwK/2xwm/gQEK75xrq4FBaBw==
Date: Thu, 7 Jul 2022 14:56:08 +0000
Message-ID: <e4e609da8c962c5c1b5d53137e9d112affb582cd.camel@infinera.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.3 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f51e8759-a5aa-436a-fe11-08da6028d376
x-ms-traffictypediagnostic: CY5PR10MB6264:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  H1RpXWJChh5v6JqCt0lYQyLFiL6+T1yRhxDE7r/s+I8fRGPlvIjuVKZHEVMiYrAiwPmzpbdgMa87LNg0RIRnSXuZHpFlfmSbLEHVknKMbLKP5h9eYebIxQcKooEyYcH/rb9TcKFcTXPVnBtew5ZX95EslQFA+eqUr7wDNBEhljtmzT6ToF5nQEs5URIbYFr8QR9V8f0q7jKAoqcsdoXn8uqZxNi6PNh6hz/LR9ElndHtPx+FT/67CRJC8tY8I3wH9G18L9ZAdOyVeqRRXLqg4az/GKm5e8ct6hUuQbf6AJYEvQ7z5eGjObSF1o1hbNdiYSqI6qazveCRogVV+LeXezfiswbrE/MvsVnD1z7zB927C4OXyM6FfKuZRyryriE2ATt7ebOmdUJgOVoPUPopMHuu7RUVnhTcYhkF19thCDKgcCW8sNFYGEleLQ3bMf6AiXX/UDyvh0MK5QAPw2eQJ0PAU04WEce+bjIZ/RUaxGcYq7enhTK1nQEENSYY/ODB8lTWKJzZTga8/hbQNht6ENHQdqG+qKiTKOngaC6oeVYKwZiyy9QtCdZwdN/XMaD8frIVyWgljmc2e/ZrqFaELTO28MM3/utqQWo0X5CZTiWM1z0kF2V55eLnEMx1MdigurLgvjSlERhkwkRDrKEiZ9BBU512aXjvmakp/55NqXsDfRJkvfz35HXbzQSvpI+spUcpK46GM2DB5zC+NukLJrlIiZfeaoYx40/Sz/rZP8oPUoUJwRMxBIblt566DPM+SmJ5X4X+TZ5AdBABcY6+G1/tSPOur63YmiAnZix/NYmihXeIGh9ncVvvhiZfIeUl
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4615.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(366004)(376002)(39860400002)(136003)(41300700001)(5660300002)(478600001)(71200400001)(6486002)(8936002)(316002)(86362001)(38100700002)(558084003)(2906002)(66946007)(66446008)(91956017)(6916009)(186003)(66556008)(64756008)(8676002)(76116006)(66476007)(2616005)(36756003)(26005)(38070700005)(6506007)(6512007)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?TTdiZGUxRWZWVEJoVTdyN1ZLQmxzMC9ZQ2tkeE5vRCtBcE91MVVkTE9CMGMv?=
 =?utf-8?B?R3NrQWo4Yk11QmZ3c3RCTFZUTkExNHh4S1N6RlJJMko3RkFhUE5xb21qWVB3?=
 =?utf-8?B?MTkwQi9CaG1vL3RQMU1jODBLTWNZMXAzamxpcTRKb3VlZTdyUjBzVm1mTUdn?=
 =?utf-8?B?WVljbkVKTTdqS1BCaGFZaWRSemRWdlNuR0FhK2FjUFY3Y2VLVjV5UWRwakw3?=
 =?utf-8?B?Vmt2ZDNHNlZpdEpBWktOOTFUYm10RE5lTGVibC9vZ01oUzdhbDMxeGFCWCtP?=
 =?utf-8?B?ZU9KUzk1TzhiSjV0cmozVEZqOEx3ZzYxSzllZEFIcWxSZmpIRnJzVUhwK1pT?=
 =?utf-8?B?QlJOcTk0SHBaWk1jdTlFZWQ3dkF4bWorOFFOOWRxNWNOb3NxTld5UWhKMzdO?=
 =?utf-8?B?VEFzZlFxTElxd2szNXE0OWxiOUtCMmhtbkFqNzhSbjdtMEFEd3c2MmdwVWxq?=
 =?utf-8?B?NjBtem9qTHhnYVVSU25uUmRqdTN1aDlEa0tRS3A4d2ZaTm15dmpTeSs1VzNW?=
 =?utf-8?B?Mk1WeDZXQ0hRZ2gySExRWXYyNWpmcm5aR0ZUbDYrZ1IzZjVUdnZUOURGcFhp?=
 =?utf-8?B?ZmJmRTRSVmxhQWZ5Sml5b25FTDYzNTd0VGhldUdkMzNTWGdnSVpON0V4VCsr?=
 =?utf-8?B?ei9qK25vV2dZcXFtVXd6VVN3a3VTT015KzBhK2hrdGNrSmxEVzFTczQ0bkt2?=
 =?utf-8?B?am5vWFdyTy9mbnR6bXdIblNVTnlMK0RobkkrNkF4eUd2WmY5VVBPY1AzSjky?=
 =?utf-8?B?blpWR0JuNVd2VUFxWjhHQWZmZ3h1aGgvZ01tMGJYUWE1SDBIYXkwNHZPMUND?=
 =?utf-8?B?QXhZOEkwVkhQaGFDZEE5RTJYZUZMY3p4S1lCSHpqdXRLY011U1I1Q0dCOGZC?=
 =?utf-8?B?YzJIUzNpZElGajNrczJINU9ObnAyVFhRd0R6Y0tpN0dyMThOTDFSamx4dGd0?=
 =?utf-8?B?bjFtYzVhQUd5Q3RzMy95Tkx6Tm1KSmtzQUFnNjluc3dTUkJiSWlSdGt2Q0Ew?=
 =?utf-8?B?Y2MzTXByVGE0UnVpb3BHVFNRN0hwekd0VDk3RmRzSjJzdEZ6QVRocXBZY0tq?=
 =?utf-8?B?Z2N1WlRuNDZmd0kram0xdEFLMFFLTEJSSkYyUGdZOEx3eWorTWRrNGdJeTIw?=
 =?utf-8?B?a0NDU1JWZUZML0pvNVRkRHN5MHAxWUhMVDRlZThweWVLQWh1Y2FiYlJoRFlT?=
 =?utf-8?B?bVo2a1VoWUQ0eGtxNElGWEhDak9STUt1NmVBdmRtSmlKSmtHcHk2bWxrWlo3?=
 =?utf-8?B?RTR1U2N0U1pDZ244dVkwNElUeEpHRnJzYTlTVVZ1YVo0WmZmckwyYkEzRC9H?=
 =?utf-8?B?T1JycEFWdytKSUYvTHRTQytPdDVxSnJZSDdyMVZGdDZXVUplcnRhL2ZybWRQ?=
 =?utf-8?B?Ry84NFYwcUJ6NzhQUkc2MTZVY3BQZ2tuaFpXbmtaWWRCZVlDaW9tN3RaU3J4?=
 =?utf-8?B?YUJTc2V5Y0JucGdzR25WQ0NOWHlFcm1ja1dFWVpWdFlmTVlTMC9QaTlLbDZh?=
 =?utf-8?B?TkthUjU0ck9QNTgybUpOdTQ2Yk1UWkk5QWZuTlBWQzFzRDJuOThvVXpZeXZs?=
 =?utf-8?B?U3NoTEhZV09SY1JRdWxBQ1EwZTVOWjFmS0dncDZkN0M2NTBQdHdhVEJlM3ht?=
 =?utf-8?B?TkgreGhyOHNNZ3hmWHV0NFlJOFhLdFRvSTdGd1Jlam8vWjhmMDZNRnF0d3pZ?=
 =?utf-8?B?NTRpeEM5akJmNnEwTEV5a3loZi9RZGo2UFBLOWtpVTRNT0xvYTJnZWZ4bW9q?=
 =?utf-8?B?cEFoZ21yWW4wRm1GeXJKcGtqTUZMcVJRYWEycnV5ektEQVJKWnNpTzRzVUxO?=
 =?utf-8?B?L3FYZjJXL01IbUtwaGZDTEJDYnJIWFdheGpsdVdOWUNKZEdEUFNhMkU0YnN5?=
 =?utf-8?B?eExpQjJnNVQweWdXcXMrUHRSNmRRaTFQenBxUzB5NlZFeDdYOC8yOVMxeVl4?=
 =?utf-8?B?dmlNTnpZelp1MG1IdlZRQ25rUnRySnc1OUtqcWlhMDZ6QWZxdjEzVzlPc2Ew?=
 =?utf-8?B?Q2taTWRoMWpxODlQa1k5Q2pzVkJQVVdUT2dNNmFmaWljT3B0SU5aWDVaTmxw?=
 =?utf-8?B?ZUQ1WWUya2NYbTdoMlRvMkswSm9YUjByZlRucmpjREU5WGlHS0RReFpGcjVl?=
 =?utf-8?Q?VTlAZc9cqLSCzxz4LGe6IrazY?=
Content-ID: <E37A535E9EAB0241AE8C5EAF0248039B@namprd10.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f51e8759-a5aa-436a-fe11-08da6028d376
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2022 14:56:08.8939
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N5+lEVGqmtEbxs3JPhRWPTSBaEBbqH1Tne6nWuHNI8ficI0qmUkALcvf2BGH38r7WU9aqY8oJzItNVjY8ZawjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6264
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_075613_154901_80A377FC 
X-CRM114-Status: UNSURE (   7.36  )
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

Why does "mtd:myrootfs" work to mount jffs2 rootfs but not squashfs?
What does squashfs need to support the same ?

 Jocke
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
