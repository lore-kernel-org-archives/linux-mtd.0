Return-Path: <SRS0=VhFc=JI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 771D4C433ED
	for <linux-mtd@archiver.kernel.org>; Sun, 11 Apr 2021 08:07:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E78BA611C9
	for <linux-mtd@archiver.kernel.org>; Sun, 11 Apr 2021 08:07:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E78BA611C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lF7wKvnyidJK50djlnNEUbWHVC4ZxzPOJQkJ/ygciRA=; b=mkmleumqQifdYGdQDpQtj1KcCt
	qUKmlGjblXRYaO/ED4P4/aJ7/f+kOcHWdRUvBfqh0hMrysy9lGJfG200VanA6/LpA3JYE+m2wKIzH
	gqiCJLQdRM9mm6GjhkpwoqJSE7KRyMme20GbUI7dtlSmGSAX9UYhFXJrlQz8gT1fetFxCX5J7AXGP
	VcKeXhZ1bq6FGhjfvoNZiVRhR2wbhOwHZ1Rhakwi3N7Su09w/AhxZ84zI8C23ENEAdAr9AFE1t8cF
	uKz87XZHkpQK5iKAZz+6fq9BIOuLawXXTnozssSMabiTo2tBrp3h5x7JjD6H3y4rGxf2SnwP+DVKO
	QxY/SedA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVV7C-004963-N1; Sun, 11 Apr 2021 08:06:42 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVV79-00495u-AY
 for linux-mtd@desiato.infradead.org; Sun, 11 Apr 2021 08:06:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=MIME-Version:
 Content-Transfer-Encoding:Content-ID:Content-Type:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-Description:In-Reply-To:References;
 bh=vey7Qw7lZQaJnLCW7BtCR41rqeA8SaumoeJafgeSavI=; b=Q32pPJveb8r+fQI7/c4UYVpnkk
 UDneYQW7a5oke3gWDRB17c7gaukRKiay1O6PMQiHvkCpdBWZqsYjhhf+H0noXq/at2pksMAF2r1fT
 309k57q8TMTrgl09Clh5Tsy895oUN0ptddVd6jRSJ27tkooAQgEpSvBkKmKegapcEObbXyl3vbYiZ
 GvSnhoOCih5VTmJqsFXHvfcLt9LlfZltwYdLnZV8kfmduERHghZYbq1cAUjLcdpcKZeyLipeck+DQ
 xFDilEjKZZYTnMaEUMF9cKxep3vtGA/o438F+ICKvSPQ4VVAfIXRfT8NpfTExCEW/xrX6vcTFG5J3
 zjREJeng==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVV76-005PDP-HL
 for linux-mtd@lists.infradead.org; Sun, 11 Apr 2021 08:06:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1618128396; x=1649664396;
 h=from:to:cc:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=vey7Qw7lZQaJnLCW7BtCR41rqeA8SaumoeJafgeSavI=;
 b=1Ts9/IXkg2fhMO0TKQC/QMjHRxPLjo6O9n3Mkdx85Zd/rWbsQ8iGd1/N
 qvWd3MCQB3DathsHy9TNYXDfRUlm0RLOPmYZRvNietVuWdFE3XdIuKACM
 /+KCV7XroQRwNqVl8COHGcuKC0FS2o31KgCXcdbMs5T9oB9onYFm9rjkD
 OKZm2I54EDCMlwEgYJYOYcW4pTObM4TLD8RJ1l8qnaeM6qK9FQHrRyDu8
 zbhsMbVADscRXfMQai4d7Qwp/6pfPxaU6Bs9ND7KZ9DFl31Gh1UD8yMCm
 Sy5QAJTugcd46lwYg6N4gqn5Dp1EKYGadbq/nNsoZ4EbMMha0gpCAbjSO A==;
IronPort-SDR: zu9znHBpXecN3bzjXeVtFIeuqwsP537F13rADwrsglk4cyBBQZ9N9BmWQ2EP6KOVKS1e7qkS01
 bqnVx5rrEWNI39x9BDuU5q3QbDDc2F8UE3Fd6zk72qXTIG36Rq0HfGY+xRldOG2c3Al5CuQsc8
 6DE12y7GjS+b4sPQsOh00ddB+Gi7xgu+E8JVE31pjle2dHQMh00JH2KUh+kyVNoeNc7j3nf7+Y
 GKVwzHF6fJ2ocTakpqK+pgb+oF5y+CIMDqYEZ3nV2xIBEq9bK4RdW5g4qtbk2UxbTuZ8ChJmQR
 nqo=
X-IronPort-AV: E=Sophos;i="5.82,213,1613458800"; d="scan'208";a="122580553"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Apr 2021 01:06:35 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sun, 11 Apr 2021 01:06:35 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2 via Frontend
 Transport; Sun, 11 Apr 2021 01:06:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ac2ukAJtk77Qw/Id1PiQxOl2oCL6VLVGOzIIU9zbQwM3VV62C49n/WrZZMmLXPSva+Z+qQ0bHsl91RZ8Yyx4xecDRfOGW8k59nbKYZoc2+nw/C400bhpfRA55zYEl4L4QpQRXrvxhXOkIZW7YuhcpNmDvg5b8TcZvYH9yyjAddcB9WZZDVDnrrO9mggyDb0R1RxhR4iPlKLEVpEF8pX4borLqSKAvPdDHpbSoqkUARoHWKl+tXC0hvEXdOLFxNXI/d2vZDRJWf0qa8XOx+Iqez3rOn4oiOI2KUrPl6zYDhwOdpRVWG3Ov8HtRJ0sDdLdg87iM/NaMlTdM8LuM0PKZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vey7Qw7lZQaJnLCW7BtCR41rqeA8SaumoeJafgeSavI=;
 b=YySt0Trdl2h1/utvcN6imqdSmKvdvQyWAxHvptGV/l8HMtmYwN5ukAaWxNlzkTVG3J/YH+927ESPHbSWyYxECM+wW8rzfS9VoYhk3LDRr4N0eDtWtdljvzjL4XOWu0HTmNaVnQgEOi4b3X+IrlZiZxMGC8yHR4IRkfVpbb27cq5p7V7AP44bNETMPp9EhkTir+/xX/4H8HeXGwRG4nB7DCUkZ7VprfAvuDp8Nm9qeyJDqZRp5vlg+kYmnIxF9y0/wIWKJVowonZMDKsyzwszeodyJbro9tXN2nBw91LXdSxxDQ39WvnsG7vJvOD4fcYqWNhnvDNTnjPiMGX1IYaj1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vey7Qw7lZQaJnLCW7BtCR41rqeA8SaumoeJafgeSavI=;
 b=J2OdHvCHyO+WI1557wt41GIaG8AIQMZDigLYJIe5sGDp0dWIcPFqiP9lJnjd63zH7FebIzeNhZvxkV4M3WndHxL/NtADchvTnUHsGehjZdF7tPNaxMp9FLwBCPEtRbO9PZdJSEQ06m1fJCwlCFkwmglFo5TgrMwb3fL2UsJN3Io=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB3023.namprd11.prod.outlook.com (2603:10b6:805:d3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Sun, 11 Apr
 2021 08:06:32 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49e5:8be7:95d:b6a9]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49e5:8be7:95d:b6a9%4]) with mapi id 15.20.4020.022; Sun, 11 Apr 2021
 08:06:32 +0000
From: <Tudor.Ambarus@microchip.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <michael@walle.cc>,
 <p.yadav@ti.com>
CC: <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>
Subject: [GIT PULL] mtd: spi-nor: Changes for v5.13
Thread-Topic: [GIT PULL] mtd: spi-nor: Changes for v5.13
Thread-Index: AQHXLqmVUAVlGMGTpUqZbVaRuM3mGQ==
Date: Sun, 11 Apr 2021 08:06:31 +0000
Message-ID: <796d9f27-5408-eca7-a6c8-b6131e824837@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: nod.at; dkim=none (message not signed)
 header.d=none;nod.at; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f6d5bd3c-31f0-49c5-4ffd-08d8fcc0b7cf
x-ms-traffictypediagnostic: SN6PR11MB3023:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB3023052BDFECED8233F82E3AF0719@SN6PR11MB3023.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KyhOgxAY8gtUBOmCQ/iXNNLh939U/1E59nNdgeiV62RxMyp3d1tl/mOw8eCSdeTD/gs76oi19FQmkhziGl8J+ZoJ3PN7kYd3TJXzvstxCYbENoCIoScuNLviNVTd00F7XMtq8b+Q65TpLjnQyl/31Cvjv4ZqTL8bA9+E0wFnkuO90JrqOHv+y7YHX6aEpHbr8/atFFf69+WdvKxCCiqXdgHDuCSws3vhzyBr2zbyr72MR6Qaq90xPTZrJSggArAAEyrDsJSA+74vGTZHmqUW0/rYFFztlR350AAbb6TAbMp8lvOqRDiobdPWIpVWoT/K4lyJPq1pMNiT5GqH1Y7LcytYvHyXfVYLMyIsZZ/Ib7aHP8tZN5c8OzYNLZeJGRGPUjh4h0fWitjvoxD6GhYbDaR3aCRRi4l7NQ/cJszCGV5k61eF9bNVhFMKkoVE9Xt3flqY1uPoQgG0GC2fY8Fj1kYPJtcWz34EhXV8pOE4XC+gUMgGWOpHOIKPRoIh6GPZlcGX7SiqNUn00FOWoQwmVcR2wNtgBmMIbe/XpVficyz0JtTfTMCIAD1WUjZcdZVwV3hslPiv0egUUVetOXgGINBS9/EWGSUMR56TyxuNZj8m6MOtNoXNd0fSxukQxNJFyi54jE8BcZ9bx5nW6JmAMjxmTe0m1diE5T28GffSgLB5APYQj3Fz2EHwJgwUAnuB
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39850400004)(376002)(396003)(366004)(346002)(136003)(31686004)(66556008)(66476007)(2616005)(31696002)(66446008)(478600001)(26005)(91956017)(38100700002)(186003)(2906002)(71200400001)(64756008)(6512007)(66946007)(8676002)(83380400001)(4326008)(6506007)(76116006)(36756003)(86362001)(316002)(110136005)(6486002)(8936002)(5660300002)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?eWZ5M1hkb1dDNzZROWdKVnRSV2J5bDFybXBjY3o1TlhGYS9vaFBweHk4elRy?=
 =?utf-8?B?Q3pQSmw4T0RRZW5DU3lsbVltNlV3V0JFS0pKWnhybm03cGhDME9ab1dmVXNX?=
 =?utf-8?B?QjlyWngxWUx6VEJUNTRmcDhSSlZoVE5uNDlYVkJVVmFUdk5GVldqNXBsWHNC?=
 =?utf-8?B?ZElFZzZRT29wekhlSjVvaDE1N2FQMno4ZkNtTFRwNkl2RjM0Ykc2MGQvc2gz?=
 =?utf-8?B?a3pDeVYzdlhmcUFUZ3B3NGdNbGNYWDVWR0hkV3JyL1N4bnB4VUhMMGMvYlA5?=
 =?utf-8?B?c2lrVkhIWS9QY0w2RU1oZ21NaFozYjIySVdpRVdmZ0NnN3JPTy9OWkNyakl1?=
 =?utf-8?B?RkFIMjVhSXRoZ044ZjlRVWtqTGZFQkNqTHpNQTlqa04wYnpBS29lTHlDMHQ1?=
 =?utf-8?B?c0hKWnNIVjVWczJadmZtbkhkTklKeno0VDUzcTdKUCtQNTQreE9VQU5Eam92?=
 =?utf-8?B?R1k2OFVvb09UVlpBV0g0TXZENExabmVPTU0rZ1FQbEVIZ2tQTU9TdXFrL1la?=
 =?utf-8?B?ejVoSHl5THBIR2lJcnpyc3ZYRUkza1QrMXpQU0tGSDR0YnROd1RqaGt2WjNa?=
 =?utf-8?B?c3hmVHBiWEcvMHVEY2hpbmpsTDJjVHRuVHpMcFJ6Y3FnUkVzbVR0YzNhYzR6?=
 =?utf-8?B?VTZ5NmpVQlR3bmpKSWlFcGxLdnNGN2gwNmV5MmF2eHFyT0tvcW0yY0ErRXRu?=
 =?utf-8?B?UWpPTE1jQllHVGozWU9QK083WkJjRktENmc0WGVmVDdyRm4vRVpITThTVEhV?=
 =?utf-8?B?Wi9va0JscmwxckZkWThhNEtkSUQ4eWJFZ0lKVDBKRVFHN0hJbVBnWFNscUVz?=
 =?utf-8?B?RlRMc2dDQ0h4M2EzM3l4QzViNHRaWjRtUlJQcjRCd1JSeGJpS2c0dVZmbVhY?=
 =?utf-8?B?TndIMlQrQXlwTmJQeFhJSDB0bFBrUmw0enpLWWNqRkZqR1cvN1orK3dZQ3pZ?=
 =?utf-8?B?V1haU1BXQzlEdjBKdFlzLzNOMitzTUpvdDE3MjA5cmJUSWxyVnQyb1lobEtB?=
 =?utf-8?B?T0w3cmdYY2d6ZWdBYnMxdnIwdStNVEc2bisyKzRtSldqQnd2clZyWnpkTXBD?=
 =?utf-8?B?R2FEWHhPc1U0RkdwSVR0QlhOTis0UXlkZ1d2VjA4RUFPdk01eVljRW1BNSsw?=
 =?utf-8?B?aS8rODdNdDRJSnhSQVllM0tFV2pvR2RrOEdRR1UxQ285RkoyTjdkMTZqQnN2?=
 =?utf-8?B?MFkwRWl4RkI4bFBXZ3ZRbW9vRStIQVp5OUJTMVIwdEFJd2RjYTV0MGNwRkhM?=
 =?utf-8?B?ZFljZ0pDNnhqQmwxOEk2cE9NbVU2UGFHQVl2R25LWDBXR2FKS3l0M3pSZVBQ?=
 =?utf-8?B?NzFnOTdKQTNyS0N2Ny84dyszR3pqbHpMdXU2TFlWUUtXUGFzRkw0QTNVZEJT?=
 =?utf-8?B?Yjd3QmgyNkJUeTU1TkpLL0pUUzlSY3MxcWJwMkFrdVlDNndrV1NYb0xCWVVP?=
 =?utf-8?B?UWk0R0c1WmZrYmloTE1QSWtPVGplVHpybXkvbHBxb2RPcTc1NHJqOFp6dDho?=
 =?utf-8?B?RHIrZ21aV1N1SzMraEp4WENBOW1YUW9jbU8yMUNPNUw3QUEwY0Y5Q3RzU29a?=
 =?utf-8?B?TXZtRkZmcStDdzBwRHJsYUxCSHpVV2tFSlVLOWZsaFZsbkQ0Z05FSFk4M2ZY?=
 =?utf-8?B?NUR6UlBpUnE1VUd6KzhQWUFkeHZUQU9ObkxwZiswOTYraVhGUVQ5c0hCUTln?=
 =?utf-8?B?bUkrdDJzSHhURjhKMUlJT2hYRWY0VWZyMHZVWER1dktObmFic2ZZTjgrcmMx?=
 =?utf-8?Q?bkYGNSOZBPDx9+5yFQ=3D?=
Content-ID: <ACD0A7A37E8BF645BCE9757744003C8D@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6d5bd3c-31f0-49c5-4ffd-08d8fcc0b7cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2021 08:06:31.8223 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n1oKiKramQx6nRPXOFQcuc6nkUUaXzZLFIXRKF8B/Lvz5GxhpM5ZS7NoDH9JumUhJ8WLBoBqdp+Gw0aZwnTYl9FD2DERG7rP0vHAKU+/xBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210411_010636_692180_401D3E09 
X-CRM114-Status: GOOD (  13.92  )
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

Hi,

This is the SPI NOR PR for v5.13.
I would like to thank Michael and Pratyush for accepting to take more
responsibilities in the SPI NOR subsystem. Your efforts are much
appreciated. Welcome and good luck!

Cheers,
ta

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/spi-nor/for-5.13

for you to fetch changes up to 46094049a49be777f12a9589798f7c70b90cd03f:

  Revert "mtd: spi-nor: macronix: Add support for mx25l51245g" (2021-04-11 10:36:35 +0300)

----------------------------------------------------------------
SPI NOR core changes:
- Add OTP support
- Fix module unload while an op in progress
- Add various cleanup patches

SPI NOR controller drivers changes:
- intel-spi: Move platform data header to x86 subfolder

----------------------------------------------------------------
Andy Shevchenko (1):
      mtd: spi-nor: intel-spi: Move platform data header to x86 subfolder

Michael Walle (4):
      mtd: spi-nor: use is_power_of_2()
      mtd: spi-nor: add OTP support
      mtd: spi-nor: implement OTP support for Winbond and similar flashes
      mtd: spi-nor: winbond: add OTP support to w25q32fw/jw

Shuhao Mai (1):
      mtd: spi-nor: winbond: Add support for w25q512jvq

Tudor Ambarus (8):
      MAINTAINERS: Add Michael and Pratyush as designated reviewers for SPI NOR
      mtd: spi-nor: core: Advance erase after the erase cmd has been completed
      mtd: spi-nor: core: Add vdbg msg for spi_nor_erase_multi_sectors()
      mtd: spi-nor: Get rid of duplicated argument in spi_nor_parse_sfdp()
      mtd: spi-nor: core: Update comment about the default flash parameters
      mtd: spi-nor: Move Software Write Protection logic out of the core
      mtd: spi-nor: swp: Improve code around spi_nor_check_lock_status_sr()
      Revert "mtd: spi-nor: macronix: Add support for mx25l51245g"

Xiang Chen (1):
      mtd: spi-nor: core: Fix an issue of releasing resources during read/write

 MAINTAINERS                                       |   2 +
 drivers/mtd/spi-nor/Makefile                      |   2 +-
 drivers/mtd/spi-nor/controllers/intel-spi.c       |   1 -
 drivers/mtd/spi-nor/controllers/intel-spi.h       |   2 +-
 drivers/mtd/spi-nor/core.c                        | 478 ++++++-------------------------------------
 drivers/mtd/spi-nor/core.h                        |  69 ++++++-
 drivers/mtd/spi-nor/issi.c                        |   3 +-
 drivers/mtd/spi-nor/macronix.c                    |   6 +-
 drivers/mtd/spi-nor/otp.c                         | 376 ++++++++++++++++++++++++++++++++++
 drivers/mtd/spi-nor/sfdp.c                        |  72 +++----
 drivers/mtd/spi-nor/sfdp.h                        |   3 +-
 drivers/mtd/spi-nor/spansion.c                    |  12 +-
 drivers/mtd/spi-nor/swp.c                         | 427 ++++++++++++++++++++++++++++++++++++++
 drivers/mtd/spi-nor/winbond.c                     |  22 +-
 include/linux/mfd/lpc_ich.h                       |   2 +-
 include/linux/mtd/spi-nor.h                       |   8 +
 include/linux/platform_data/{ => x86}/intel-spi.h |   0
 17 files changed, 991 insertions(+), 494 deletions(-)
 create mode 100644 drivers/mtd/spi-nor/otp.c
 create mode 100644 drivers/mtd/spi-nor/swp.c
 rename include/linux/platform_data/{ => x86}/intel-spi.h (100%)
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
