Return-Path: <SRS0=3Meg=3L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4242CC33CB6
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jan 2020 14:31:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1711D2467A
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jan 2020 14:31:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cnbuJKP6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="smVzGImo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1711D2467A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X9KZzxKO2SISNChGsYkNh2L/4MPv4WmSJg9PdBiZhhs=; b=cnbuJKP6ldZv2c
	8IThA7vYWiYzwAhPbXNmIAfAAJ6RKATZZe05saXWt6Vo41FpS/CT0aAb3xdTHIGIQAT7D9U0xLvWU
	Sqq+JRiVX6GSyGixrnfh7Uqe7LYnSGqybjHEkyVqmuf1vjR1u2AmgvOuDkG3Vo06V8jrPH9AnRUTw
	aGz85sEtoV+0GCAPqIgdj1jq0fDYriIPdbgYszVeZ4Jw9K+UvPiOIU10QMQPQJN5Vg630LHU0c44e
	CqZkWe9JQ3G918rBwhsjRrgQdeFL0qf+UJUCwIenxmZBgUJ8gWFlCrwc/gwI2RdQGy9cVFYiiQT96
	xBKgGEHYtXqYIalFVpFg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iuH2m-0007a2-G3; Wed, 22 Jan 2020 14:31:44 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iuH2h-0007Yv-3A
 for linux-mtd@lists.infradead.org; Wed, 22 Jan 2020 14:31:42 +0000
Received-SPF: Pass (esa6.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
 include:servers.mcsv.net include:mktomail.com
 include:spf.protection.outlook.com ~all"
Received-SPF: None (esa6.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa6.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: H1xMGzkF84oOBbC5ugldNcOm+1DkhwWutYa4rlnckdEu0xpoNlrTvcnSd88WOdVxKUDhbCQYN3
 E6dDeTh4fKTRRGRlP8ECeP9y6YXda5B23PfRGwRt/1GPoMCoV6IytAfSJKEgVYhnBWk5Hff+1k
 A1YVbrsmednN85K+TNn80DYP/wa7IMZFjOM29ZuS9eb2OaAX67kPJObm6PyA4rf7hgKO9VFiXW
 6LHJNxsRR7JFGbYKIchQBeVoArCMMRc+OJVRYUZKd7nX69lGRY692ddQwNMkuE/2tsmEXuMLKc
 O4s=
X-IronPort-AV: E=Sophos;i="5.70,350,1574146800"; d="scan'208";a="61669565"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 22 Jan 2020 07:31:36 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 22 Jan 2020 07:31:32 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Wed, 22 Jan 2020 07:31:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RANeAckLiTiRvHYZD7/Wu58h5FQc/qIcopNd8gLPqLNmYYhklxSi6k0CrDk7gpxcu4UzKF5gUa9TWbPP5e+Qk/RQ/ZdJ2hIr2BVDe+p1gTVLzdevrBbQej/+VcNYc4pPuBYFclcy98qpf5Yi89xSXGEVgosDfL9JJVBQhtyvfUqaaCj12ru2/Ds1I4dvn4FbyIx4DKAXlJQohgHkG3wpq4DWrG5PEgN9TIIKOOelxU/27lVdJ+q3ajcEOWqR87pAao2+0j7rL5H2GUchcvsvDbt0U04y4M/shKE90QzwhBCL/SoZXvmhkPfr1vj9kbArF2RMX0DCIRa9cJUIc65HQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qyqTtyvxd4QvHsxDORUo5QUlBNxqYKMYi5e28YKJqy0=;
 b=L4VdA+1k0/jGwpXytrvprr5oQ0CtSB96bCMf9h9++ln1u1ozd/JDMw2yH6CGvjbN9EE1M84iENdcEaO/vcvqv7tnNG6OkKkpbn3CRnrCvt/m47lHFs5+T6yQ45KuR9Y1noCJkMks2YzcPHIV7DLA3am1TIYjRcuv/SbvhB1nOE1UZUJhra4zOmOAbQZIJPMFBLV2bg7NoAukYazmJ7hfazmr6zhLcu71yj0Y5JKmGlXMMJ9vKYgkvZqa5d+Ye0h9CMHoBv+wLRlrk1gCS+E3lZUyPxWE2U4Z4JIx9hH2YHyH8mJ/u3wGX5XnBBhUKlNjMB/rmHv/Lj0Bc/exRfklRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qyqTtyvxd4QvHsxDORUo5QUlBNxqYKMYi5e28YKJqy0=;
 b=smVzGImo/Y95RtVck8d+3MUpVdZ86UQNqMErtuwEDbyYECVsiSrZFc3w/MwVDsHpd7PHFgUwjaPeLakQWy0u2iYmyqwYBd5GvFzaukyu2cmfYpGv2JtoMIQ+NV7MxsuvCCsG7cVz8c+Ur22vHhBVsn75TkAl+PHZaSM6lsmv9mQ=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4303.namprd11.prod.outlook.com (52.135.37.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.23; Wed, 22 Jan 2020 14:31:29 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::3c8f:7a55:cbd:adfb]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::3c8f:7a55:cbd:adfb%5]) with mapi id 15.20.2644.027; Wed, 22 Jan 2020
 14:31:29 +0000
From: <Tudor.Ambarus@microchip.com>
To: <js07.lee@samsung.com>, <michael@walle.cc>, <john.garry@huawei.com>
Subject: Re: [PATCH v3 2/3] mtd: spi-nor: add 4bit block protection support
Thread-Topic: [PATCH v3 2/3] mtd: spi-nor: add 4bit block protection support
Thread-Index: AQHV0TCfi2pGqMNGHESG9Z9T0h6ocA==
Date: Wed, 22 Jan 2020 14:31:28 +0000
Message-ID: <1780435.Q0f6Nmcn8h@localhost.localdomain>
References: <20200113055907.9029-1-js07.lee@samsung.com>
 <CAPP0e=NMzizy=fEZi4nWzo9GAJOpB2Qwv7ReK7HDvrGKUv+VEw@mail.gmail.com>
 <0a2c4e9132f7d4f61fd3ce87c5393c65515b937e.camel@samsung.com>
In-Reply-To: <0a2c4e9132f7d4f61fd3ce87c5393c65515b937e.camel@samsung.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ed0705aa-3f46-48b2-4c4d-08d79f47c4dc
x-ms-traffictypediagnostic: MN2PR11MB4303:
x-microsoft-antispam-prvs: <MN2PR11MB4303E78FC0EEAFFDC812E6BBF00C0@MN2PR11MB4303.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 029097202E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(376002)(346002)(39860400002)(366004)(396003)(199004)(189003)(8936002)(26005)(186003)(9686003)(91956017)(8676002)(66446008)(66556008)(54906003)(66946007)(5660300002)(6512007)(6486002)(64756008)(81156014)(66476007)(81166006)(76116006)(4326008)(110136005)(86362001)(71200400001)(2906002)(316002)(478600001)(53546011)(6506007)(39026012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4303;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rMMuZwd2FJqu20YmsRefQlzVaGg1cKaWkmBvvdhLHpKrHuBH1EQ4z6p7HwHcA4ASJCPQEyGiNyTtOvrE0LNkxONen8wOsQRMDhgoACPd+A8L9kdCHVAsdHrhM4tODy7+ezB5vE1Ec1+9sqCFnEua86re5v4CVt7+g1G9M6Yd2xNa7CUwr1eyQUlDnPQhYyAMs0XTzTXE7toxvxOiXU1ZyEjtayl5mOxNh6cLXWlnFG6Xa1MQpksTgjhLE2C1Y7H9kqKRVq+3mvVPrvc5gHqZ6C42auygWUIIqpwmVemEwyYiRDSmVVrGtVahLUfBj1Goa9uaA2jvJGYlw27rVB8ssoiR5msZuroKRlS4Mo5z13n3BGglp4nnZBbB3EbUBNQya+kPY+3+eNhhRpqDbNElu0uWR1BzXYKEUcEM3ItnRHG19l0tBwdme5Gufg+gVc0bBKYyPxoUd6GsenSDyPsLp0gDgiBpLEl18BtCSq0qEPuFNLvbdasYcPZyqnwn3emP
x-ms-exchange-transport-forked: True
Content-ID: <F454970F38B2A34DAAD4009FBBE60C48@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ed0705aa-3f46-48b2-4c4d-08d79f47c4dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2020 14:31:28.8392 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BAOFk74JmOAeUhWU5qsD7DwlRIQkngAHQ2ObfedHuGCG2/rx34294ATBi2qZu+liXybrO/v0v3yKviQf1xUo3g0RlGpGzLJ2pR/uf7bk81g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4303
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200122_063139_231413_5613F79E 
X-CRM114-Status: GOOD (  17.20  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, vigneshr@ti.com, js07.lee@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Jungseung,

On Wednesday, January 22, 2020 1:42:00 PM EET Jungseung Lee wrote:

cut

> > > > +#define SPI_NOR_BP3_SR_BIT6    BIT(18) /*
> > > > +                                        * BP3 is bit 6 of status
> > > > register.
> > > > +                                        * Must be used with
> > > 
> > > Are we safe to replace SPI_NOR_TB_SR_BIT6 and SPI_NOR_BP3_SR_BIT6
> > > with a
> > > SPI_NOR_SR_TB_BIT6_BP3_BIT5? Or maybe with a
> > > SPI_NOR_SR_BP3_BIT6_TB_BIT5, how
> > > is more convenient?
> > 
> > Let's think about some flash in which BP0-3 exists in the status
> > register but TB exists in another register.
> > for example, mx25u12835f.
> > I haven't tested yet, but according to the datasheet, I think this
> > patch can support 4bit block protection for the flash.
> > 
> > In order to embrace the case, how about letting them as It is.
> > Is there any suggestion?

Ok, this info should go in the commit message, together with details about 
which flashes were tested.

I didn't know that the TB bit can be defined in the Configuration register. 
This means that your suggestion with dedicated macros for BP3 and TB is fine.

I looked a bit over your patches, they are in a pretty good shape. I saw 
something that can be improved on patch 2/3, but I didn't manage to finish the 
review. Your patches are the first on my TODO list, but now I'm a bit busy. I 
hope that I'll come with a complete review by the end of the next week. I'm 
going to do tests on few flashes too, to make sure that BP0-2 was not 
affected.

In the meantime, maybe Michael or John can review/test your patches, they 
showed interest in BP0-3 support.

Cheers,
ta


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
