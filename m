Return-Path: <SRS0=1vkS=WR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A250C3A59E
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Aug 2019 08:23:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A24F22DA7
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Aug 2019 08:23:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gCf8DgFc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="Ggu1XxpK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A24F22DA7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ApVIWfS8dZSEX7sdAdpk03Yll3i0HuVc8AnZjhzjzbU=; b=gCf8DgFc9qeo0X
	UxvFrL47vcLnECVo0vxOGm2yOzNFFkWC3knTVuGFTeJj4uYah5JLIGAMg6yx2WwnlxppRuCb4uLYC
	QO+XapCNRDD4VfqyGmoNNqd1r3HvWoYGENFRt6CsNVrH2fDu2wCgs4vfSwxf2aubdsPaGQWn/QeOb
	QQyLtjx85BdHLBs8uD4RHkqZr8Z8vGl6xsrD1EOJowPb1dygRyN+5zZbu7QlVYywjgtFQNT5bfW/2
	dQyWiOtb3+cJhKQFhJSup8r8OcaRW944eYVR35bCMVmCfUJgptzjjK4oipS4bl0Ff3YnEX1CnoC0t
	ArVwNUIT02uLhMm8bUVA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0Ltw-0003U6-Bi; Wed, 21 Aug 2019 08:23:28 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0Ltj-0003DJ-32
 for linux-mtd@lists.infradead.org; Wed, 21 Aug 2019 08:23:16 +0000
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
IronPort-SDR: dsh5QPBYQVrf0OwAHESPQmPZydB3hUG49C3GumX1zA+/ZIjym3yy6XjtsII6dY//HZSeJsf2Kz
 6HJlVji1y75kCFx7Yck0yScGP6mWCSqT+8KLRvLarN4ph3MWWkGoLBRBbE8jHYw6y2XsG4fjOE
 /8QDMuVnrjaXx7O03N6Nx22kkVQskwCajXrIj2hajufcu3QRa0IhaxCXB+AGzh2lP+k+6ephSv
 kkDhdS+LAy1w1noC/vcRyMKbUHVupQLDhJjwuY2mx3q+3L7oJ4xW1Ejy6nKT9ArZZ6RNmEMfui
 adg=
X-IronPort-AV: E=Sophos;i="5.64,412,1559545200"; d="scan'208";a="45065054"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 21 Aug 2019 01:23:12 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 21 Aug 2019 01:23:11 -0700
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Wed, 21 Aug 2019 01:23:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZouI1wrlnc1WNgU1irslGI1lGMkdmyFZ/k8B8r+8ewfUuz++Kv88v4rqIYtkoftgWUxWFJesXjr8nlPpLuEdrZTLvJrZIZXBbKcs6N5Tm6Poy6doUHqZjXVn8VyAvpyTzQeYY0s6ZYZbxEX5txIuAvhZFAqb95iy35RLP3laRSVbfuhBtQvopz6CQavjuzV1PyYmwfK0M57Jf+eE3FXjAi6i4nACKnPAJ/aawtlzCGWcvAcxpsriHNvzH5DWsYi37yA+2/Vo2C4Fpf8NvJFASKUHHkxlbzuOGkWXrvN665lHX30TwYl+Fd/rSJlUt6kDYaUo63tdmEYZxn4QBMAblg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R2ZIilzwuhVvvCMlTv00QyCAJm7o/8pb3I5Pr7iV37k=;
 b=mVAT2VCFpYrMTypqLNSo3XvISh7Abfdc9RAd/lSSgWLBtHE++T77fipZod4jSXoZazRD0F+8i7xUGNQ/BKfYpEhkXLJbCSNsQvF5Pq4x+/2ON2G13OnxSRTIVwTKRi56MjidF7Uwp1NolteyTQ0TBa87ymEcty4StaVGaNDns4m2Db5VdCX3IFWWjcuwjwHyNQhbpHmW+yLc9FZbgjMb7Y0r4TqKvNOJfT44gKUmgwt6hFPvj7AYftdVf8xQBZpmOh+23bdzBWws7dlqxcKcB3g2cJeMnlsbGk7saU+G1IhtbSEnsMkZ7tXNBI9dn/oXEtxpSCsSxVMOcm96F7zZTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R2ZIilzwuhVvvCMlTv00QyCAJm7o/8pb3I5Pr7iV37k=;
 b=Ggu1XxpKlI5LQK5INm9HRLVq85YNagqFHSUzNuvVOb423ZIjG0jbdZL+hy4vccjeiqnMNiyLwYuq5fIJchvJyHweHX4eRBdChVNvJb+5bKMfQ5hEejlF1X2IUwJWr/iHyQOmlU9sNl7XXrOlCdod6VQYF/5pMSTxtZxR/XA1Odk=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3918.namprd11.prod.outlook.com (10.255.180.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Wed, 21 Aug 2019 08:23:09 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2178.020; Wed, 21 Aug 2019
 08:23:09 +0000
From: <Tudor.Ambarus@microchip.com>
To: <wenwen@cs.uga.edu>
Subject: Re: [PATCH v2] mtd: spi-nor: fix a memory leak bug
Thread-Topic: [PATCH v2] mtd: spi-nor: fix a memory leak bug
Thread-Index: AQHVVrHa0wRKD5wwWEKewRQkNp25zacFReEA
Date: Wed, 21 Aug 2019 08:23:09 +0000
Message-ID: <806348cd-2b4e-7ec8-3c32-889904c37200@microchip.com>
References: <1566234960-3226-1-git-send-email-wenwen@cs.uga.edu>
In-Reply-To: <1566234960-3226-1-git-send-email-wenwen@cs.uga.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0401CA0010.eurprd04.prod.outlook.com
 (2603:10a6:800:4a::20) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9c206c96-df7a-4b4c-a3a1-08d72610ccc0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR11MB3918; 
x-ms-traffictypediagnostic: MN2PR11MB3918:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR11MB391874EBA2E9F699393CEDA9F0AA0@MN2PR11MB3918.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0136C1DDA4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(366004)(39860400002)(396003)(346002)(376002)(199004)(189003)(66446008)(66476007)(64756008)(102836004)(486006)(52116002)(8936002)(36756003)(446003)(2616005)(81156014)(316002)(81166006)(8676002)(6116002)(3846002)(31686004)(2906002)(26005)(966005)(11346002)(54906003)(76176011)(186003)(478600001)(71200400001)(71190400001)(14454004)(25786009)(66946007)(6306002)(53936002)(2171002)(6246003)(229853002)(99286004)(4326008)(476003)(5660300002)(6506007)(6486002)(386003)(6916009)(53546011)(256004)(66066001)(86362001)(6436002)(305945005)(7736002)(14444005)(4744005)(6512007)(66556008)(31696002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3918;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3GiAglKV2vvpJrVK17CvzuEUBzxr6/xg07k0C+4Vqq6LMqhc1U++AaYkXl1Y33HBIRKzFpgfhbQUtguFBn7CMQEuVskpTyyBpmuSjo9HYhhYY3tiQTV1CN7/9mQ4/6qFYwhNl2YU4U2kQJbP6uwLhF+6gjZCd6O+3SPscjysYyTSqefO273+beofny4ILF7+I+ou0o23nXCfu6/hCMX/EhkBcUa0udjPGae7GWFcedi/SNZdSWH9gL2f+MzBUNWEddj1k5r92vYYbpZ2YMJEmGH8unHR6z4CJEwohgpRa5LNx7DKpEq0Q1+IR4DayKVMWg23hKAzgwdwbaxXW2hNZGYyYrosyrAVMitSxIaTpmTDIYGm6vYdmPk/sQc3R/UrxvYTtTvWklGq1IuCGtgKOXWOlvpH3pD2GFQ8lNz4Y44=
x-ms-exchange-transport-forked: True
Content-ID: <7A0357C8BA65A44A82D948A517426BCD@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c206c96-df7a-4b4c-a3a1-08d72610ccc0
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2019 08:23:09.4932 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4IIDUZBUdpVRunvz8kAdbfPfsBcA2vlbrBPOaM0iHyLKK4HP/CBYtnC7vejskGsj7pnuc0S/fMJK7/P6cBHtrtxHrZL+JC0Z52zuvQMhtsg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3918
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190821_012315_248173_EDC076BD 
X-CRM114-Status: GOOD (  10.55  )
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
> Signed-off-by: Wenwen Wang <wenwen@cs.uga.edu>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 


Since the bug was not introduced in the previous release and we are quite late
for mtd/fixes,

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git,
spi-nor/next branch.

Thanks,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
