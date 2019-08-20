Return-Path: <SRS0=j2Kw=WQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4F05C3A59E
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Aug 2019 14:56:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5FBD22DBF
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Aug 2019 14:56:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UKgm0GXT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="WWqaBdE9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5FBD22DBF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f/+Vr90KYTuQO61llKxJNZDFOQoAYgx6aZR9w+GYzmM=; b=UKgm0GXTLVcosL
	7JOghBA4WECodRafxxU7VZHQ7P1uQ+pu4EeF+/Ojheva9esJhjj8fUWN3qMddhTnCuYX7RhQBp2jQ
	W3pJoA3pZSAb169jHnv8G69uXJdl2BufEFIxX+GnS5nnMqp7bgymk7F2+tpL7RhVkZdL/NET/uqNw
	n63JcbpbHsjKQ26K1qL0zWaszuOwDWb7KxSW31Ve/AQFE8HRp702XAZonheJnxCQTxtunBbU5Dogs
	OfT7O4OUeg8tP1C3B5EyivpwOhk0OznTb+VxU9heZQwWn60nHupOPNfRj2NBK3MDymzOLP/teLgog
	bnOY+0Dk0M6Dplg0yVDg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i05Y6-0003zW-1t; Tue, 20 Aug 2019 14:55:50 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i05Ww-0001mE-Ey
 for linux-mtd@lists.infradead.org; Tue, 20 Aug 2019 14:54:40 +0000
Received-SPF: Pass (esa4.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa4.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa4.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: Eet0xybUhXNh5Gn0mcUuMkj74ktNUhIRlgiQDLiQm08jZ4IVgZd8NysmcwvzTZRq3GP+fqA/33
 2Lp4YD901zhpVlAkPM8NmzI0ra/98OhGqF5dvprVIDScGWvlpTLRo5ws0Rvczn0Jsvjxgktlvc
 amcLL459UjtJWrBpr9yiuah23CHbox5iTSMXjzoTyxC5G0Z56NXi1EU/WpUjccFF6sJ6WOimTM
 WZlPvZW0tZDeVuJ5qxa5VMvCniIgTTAf8rDfRTLvQ7YywKq+68oDyO8tTjKb36pPNQdm5RaVJQ
 +UQ=
X-IronPort-AV: E=Sophos;i="5.64,408,1559545200"; d="scan'208";a="44944829"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Aug 2019 07:54:37 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 20 Aug 2019 07:54:36 -0700
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Tue, 20 Aug 2019 07:54:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dJO7RefyGCXuDdND90UmzXBzVi/Accfgue0QXmk6ZWAYwwcac9nfGbuEuNbfur6TZXbCV7Ney0N9frSoYf56+baZmIQix9sDK6eEKxXv9EfVEptVMnJEtS+Gt6bXbFFwqRoq4XYIjIxhaXKbCsboPLttlZ6HZiT3NHa30E9oJDw7UQVYheKey+CqtPhA0zAoz9fRSm7O5w1oJNDnIfzlxEp7NZ9pQXqsPsGcm4ib3DwO7VugFI2T8xHiH4HesYZLcfTv5ijf9cRPXkAWjerhKBW7s2iKCr5Q18OI6cn9S6sVRuhVuE629LIhRRfA6D0T9WyOvqwA6xg0ozM6sXCX7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2kVKS2nT0qa4S2HUsTm0bhm6EJoZpqdOg0wz/j5p/4o=;
 b=R9HJGAGoLHtEWbTA0/s2rYmA3CoszIzjT1cuvhEft658mTHeaEUrwoTRjFb9zTRPNjE2mtTR4H2PIZhp/T7iiQDXoz+7WYRYbC3abzSDWNR1XmtjVRiYRb60nsdgLuuEFFCjPuMrWU03YKGI9dM5JoR4EquN+HmCDQpkgMZm2cJg5Grdgv7s3LOsksTovzl8TUoA/wNkzwucz/JH/XVpzjq/pJHlJoxPvU0C4KTa0cJriBMZsRNjVBvNfme9i7ksFnoJ7moWUrZP7jv9A7KXc0phCqxrkGW59FKSb/zGZRuEcq5cetPJIWyA9eT07pUlXDMSGcDCX15OMNv7rowP6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2kVKS2nT0qa4S2HUsTm0bhm6EJoZpqdOg0wz/j5p/4o=;
 b=WWqaBdE9uAx9LR7RN6YiYHkV7fnMUBf7pGq6xTqnc8WZ/880kIZFzmZot61Sp0ZJwoiQpqnaUUTsNIsEJU/XxFaxpP2i1cnwzIF+kgHIIfNiQm7MmXX0vK1IFC3xrwze5KbhctXzepXZflXKLhvcyWIYG883i7HNFE5obT/86MM=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4350.namprd11.prod.outlook.com (52.135.39.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Tue, 20 Aug 2019 14:54:34 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2178.018; Tue, 20 Aug 2019
 14:54:34 +0000
From: <Tudor.Ambarus@microchip.com>
To: <wenwen@cs.uga.edu>
Subject: Re: [PATCH v2] mtd: spi-nor: fix a memory leak bug
Thread-Topic: [PATCH v2] mtd: spi-nor: fix a memory leak bug
Thread-Index: AQHVVrHa0wRKD5wwWEKewRQkNp25zacEIO+A
Date: Tue, 20 Aug 2019 14:54:34 +0000
Message-ID: <a2eced51-aa2a-0609-530a-16e03e78ae19@microchip.com>
References: <1566234960-3226-1-git-send-email-wenwen@cs.uga.edu>
In-Reply-To: <1566234960-3226-1-git-send-email-wenwen@cs.uga.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P195CA0066.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:59::19) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4298d09c-b6ac-436c-161c-08d7257e507c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR11MB4350; 
x-ms-traffictypediagnostic: MN2PR11MB4350:
x-microsoft-antispam-prvs: <MN2PR11MB4350061E04DAE0524ADA3221F0AB0@MN2PR11MB4350.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 013568035E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(366004)(39860400002)(346002)(396003)(376002)(189003)(199004)(14454004)(229853002)(7736002)(305945005)(6116002)(6486002)(6916009)(36756003)(86362001)(2171002)(31696002)(6246003)(6512007)(2616005)(11346002)(486006)(5660300002)(102836004)(53546011)(6506007)(386003)(71200400001)(71190400001)(4744005)(6436002)(256004)(14444005)(476003)(26005)(81166006)(81156014)(8936002)(186003)(446003)(4326008)(478600001)(31686004)(54906003)(99286004)(52116002)(76176011)(2906002)(66066001)(8676002)(66946007)(66446008)(64756008)(66556008)(66476007)(316002)(25786009)(53936002)(3846002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4350;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: edA20vOPIUDllgr4U7LKCsgFcqP4rWlGckIgq+aqW/DewqS3APAHwqN89Pgx1LHKpeAnfIyu92jLlhHRPkTmzjGVUPzav/MttOdFYNAXYn/d4zI1ZtEGPjnpLfDCMVWnhIlWUl+bWJGyo4JKRyrGhR/UqxznDKckUBesJZYGkdcXlpJm90Ri1mqAe3bZyALJ+bn3tR9ylaXd06g7tcrdS7U4FvJ134nuKm8TireYn+x9n2kOxV12ZAwOT9ds4zZ3uXwvdiBT7oYs3PtvrOztvfyji/TV6pCsFZhW3meVtL9JB6JltrlsxghUKMMH1s+wTHw2SjyWvTpE79OQ78aZylGYqjafG+dzMC1ONHy7xOKr74Y+J+43ygBxVOJDcvVCGB0qEcXWlNdem/ChB1ydsr/zYtRYBAl/Q2EXkXhXi/c=
x-ms-exchange-transport-forked: True
Content-ID: <F8C01FABEEFAB4498F14639787292A0B@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4298d09c-b6ac-436c-161c-08d7257e507c
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2019 14:54:34.4439 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PDSxOotgeXeGFklk+2CyfBpEDbdLCtpeA44djNbIfbJUDvNx4AlS/H0UD5k8xECQg5OvPD4il4/Gotts76TwbDIe3lEmArewRYw5ceRxWho=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4350
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_075438_555306_655A3B7A 
X-CRM114-Status: UNSURE (   7.91  )
X-CRM114-Notice: Please train this message.
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
Cc: vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 08/19/2019 08:16 PM, Wenwen Wang wrote:
> External E-Mail
> 
> 
> In spi_nor_parse_4bait(), 'dwords' is allocated through kmalloc(). However,
> it is not deallocated in the following execution if spi_nor_read_sfdp()
> fails, leading to a memory leak. To fix this issue, free 'dwords' before
> returning the error.
> 
> Fixes: 816873eaeec6 ("mtd: spi-nor: parse SFDP 4-byte Address Instruction
> Table")
> 

^ Miquel, maybe you can drop this new line when applying.

> Signed-off-by: Wenwen Wang <wenwen@cs.uga.edu>

This is a good candidate for mtd/fixes, so:

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
