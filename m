Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6FCDC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Feb 2022 10:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p9sU93Z3E3FlwYkr2bAyOXipi9wioLX3lzDTEXtLuvM=; b=mJoMUjTBSV3cIX
	3yWkcSxP9BEGLXjIr6C4PRCxEMPXxAOq/KGZk2eu5hQISWlWPBpPHmQ8v37F2VT3XetUzjXrFaItO
	HP1rRLKKN727HfWYDYthXH3UzsVr3+Skxd2pN0bzserK8Sf9V0qBvQf+g6a8LT0Nl/GFC/qBVrYN2
	0+s7A9bDOFGmkpLRs4B4aUY5veaqg3y8BY8ij7SRdYU+hSo9fQ7y3UnA3YqH9x9HQBbc1dNaKUXDX
	7W1848cVeJZQXGeNccn6rxMzZLYtbItJS0MZhOj7AYYzpvKyRjUdYuzqlA+TWNuk1NI0EKYXfHOFx
	bob37eEu3abkxqT9YGTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nITX7-006hkN-0N; Fri, 11 Feb 2022 10:52:09 +0000
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nITQE-006ekn-KQ
 for linux-mtd@lists.infradead.org; Fri, 11 Feb 2022 10:45:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1644576302; x=1645181102;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FFdmpbfmKZi+IzweJgggjVO1iCNUaaath6qvaQP2SzE=;
 b=RpRuUCtFuwIXUuseGDZdHvpoZmBuegtPAtbqFreAHNh03ybRNK3emW9G
 HZolmYwHGi5RGVQfPTMxpyUUNoSBG9kBohCZKbcLYszxWNaK4rxcjqM0G
 47iFxM5ko5K5RLM5tSF3ufqLWHvwU1q/BoSDHHGUZeLqmsc7AGh872Z9k s=;
Received: from mail-dm6nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.101])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 10:44:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O9KPDlXNVnZskMO8U/KnrZcKQtrO71+RtGU4vuJaB1Eca56oVafb6OGtVByDCjU+5vOOfTeafOmagS0/8WtAdNRNpDgneDYNND34oqjh56j6XJXFnUc5dq9S2asY8v1zP5c43Nb7d+MNGNW16BnoXzmKKgxgDcMPdnYzc0UMRKHx1j+UbbwumVXXmhWVjsVI24bdA/2/2FM2NBRS96GHFx145l42oQaMG7ajknsrfvzlAU+Q1ErfTQ2KE64CnRrM8PFOBDIZIvkngg9GGC+GSlHN76tCFZ/CI954dkLADFOcUbEddCCEKynkEZp49t0ugoR8FxiCdseC5FblMYRwow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FFdmpbfmKZi+IzweJgggjVO1iCNUaaath6qvaQP2SzE=;
 b=EtaZaiZ1CR98VC2rsLPRil6EHQIsru44dRAkcDmp5V8skiXHX4XN4R8fdImO4asf9dPr/WgcUiD+x1RboqO+X+cFTR8xRQ0AtGpLHU9u7P34RXuHm6V17+4RppH2S9Fh7p8XvxSWHBJ4XQviPKOEk77XnWFJjn/xDs06P0/tWjcRTMGr+3MOmCsdgSLxeWY3ao8vvcCG3utGFICS4VWc7poB2100FWnGitmMXwbQ/lNQXNJAnyhRY37ZrFuG6ff4btJYTN2/BzvVZtGhs4if4XndcuX54gM87pmN33dIBBiyX5+qq1H6A1hzm+04TcQmTRtgb3N8xiLZo8DB04wIHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SJ0PR02MB8449.namprd02.prod.outlook.com (2603:10b6:a03:3f5::8)
 by BL3PR02MB7874.namprd02.prod.outlook.com (2603:10b6:208:33d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Fri, 11 Feb
 2022 10:44:53 +0000
Received: from SJ0PR02MB8449.namprd02.prod.outlook.com
 ([fe80::481d:88c5:eab3:21c7]) by SJ0PR02MB8449.namprd02.prod.outlook.com
 ([fe80::481d:88c5:eab3:21c7%7]) with mapi id 15.20.4975.015; Fri, 11 Feb 2022
 10:44:53 +0000
From: "Sajida Bhanu (Temp) (QUIC)" <quic_c_sbhanu@quicinc.com>
To: Michael Walle <michael@walle.cc>, "Sajida Bhanu (Temp) (QUIC)"
 <quic_c_sbhanu@quicinc.com>
CC: "dianders@chromium.org" <dianders@chromium.org>,
 "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>, "p.yadav@ti.com"
 <p.yadav@ti.com>, "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "richard@nod.at" <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Sahitya
 Tummala (QUIC)" <quic_stummala@quicinc.com>, "Veerabhadrarao Badiganti
 (QUIC)" <quic_vbadigan@quicinc.com>, "Ram Prakash Gupta (QUIC)"
 <quic_rampraka@quicinc.com>, "Pradeep Pragallapati (QUIC)"
 <quic_pragalla@quicinc.com>, "Sarthak Garg (QUIC)"
 <quic_sartgarg@quicinc.com>
Subject: RE: [PATCH V6] mtd: spi-nor: winbond: Add support for winbond chip
Thread-Topic: [PATCH V6] mtd: spi-nor: winbond: Add support for winbond chip
Thread-Index: AQHYHyj4jVBt45+Ii0axrXyqiUXVxqyOF/qAgAASerA=
Date: Fri, 11 Feb 2022 10:44:52 +0000
Message-ID: <SJ0PR02MB844917CF0D89F4127C465DD0CD309@SJ0PR02MB8449.namprd02.prod.outlook.com>
References: <1644571349-29649-1-git-send-email-quic_c_sbhanu@quicinc.com>
 <98cb875e6f0de468a92692513f0eb47e@walle.cc>
In-Reply-To: <98cb875e6f0de468a92692513f0eb47e@walle.cc>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 86abbfd2-3b9a-4ea7-3371-08d9ed4b8938
x-ms-traffictypediagnostic: BL3PR02MB7874:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <BL3PR02MB787437691645BB4DEA44C88DB1309@BL3PR02MB7874.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KAojtJSHZ9Kazx6KGHprFvTidNKKL8NBhiZtWPp0da4bQT9o5FOlmzJwYpC70cu2dopjWie/3J1Z/pkq3+Bqo5zbJnxDX8Xw2N1EptuSZoP0DWswZLCuWrJBWeBdTquYD3PU9lRY5mPEzD0c6YQF8Qths+v5O7818AEivASPGdciT36Ora//6bY5scWf9SFsqyB7cXJfwPTihPC6VTj/ArEO4qE4BEHj3rcH8D1NTWLlb3P190zXtW9QpT1ceR7X8ogCyibC0J+Rct0eeW593jSSqYzkE/PJwRWo9ZscwmA15kT6PLSPe+AsAhgU8VRRySvBcBoEkBk+dj3aoaR3ZWzu89Tnw/68yDj3xCVINM3iJ22ibkhT0cdgzCwb2GH8pjJYPRAINRbZaBGzf/e1Syqp/VUctUwT8k72yjZhCv+PIFqL9zBL2QVP0Tjzo9c8OH2PG9o2ZxlQ06H8Msa65im+0l7D1/BzLZ//DyvNf9kBzdZFpfS3G3GkJGPjbXJ0bidBhG6o3sg5yq/f7mMalJSLYIo41DvHo/cKt3JcWF565kkiWmvkqQf1F/pQhy6pkI4O3EK6DPPD3Bmu6TRdV5g3O4+fr5qEem9bBl0a89j/qIGmQwETK3O0TY6LNSSIuHgINZlKI6qBmNcRB3jHNBQG0brkkb8LlndECgAkogUAlzKUBpZ1WB1SOA6sPtGjXmGePuhrM0ne/H5abmRDoQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB8449.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(53546011)(6506007)(7696005)(83380400001)(38070700005)(2906002)(316002)(64756008)(76116006)(66946007)(66476007)(71200400001)(8676002)(66446008)(66556008)(508600001)(4326008)(86362001)(38100700002)(9686003)(55016003)(122000001)(26005)(186003)(107886003)(54906003)(52536014)(5660300002)(8936002)(33656002)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HQsjKGxbUEGsCdJ11WbkI7v0fsaR6cq+wzne5C5nRn/vUUHyCk7he+ECLt4g?=
 =?us-ascii?Q?uYf8/Ysye5iab375sfK6c9oN0Kzbj1SXjQUe+Y/v7gwNUzs2pHmyoePrOm28?=
 =?us-ascii?Q?s2cmz6SwNa49y2OfQ5HygMmbHzBJ20rcbCR6TW/KZKTmtazbZ8GWZJF/u5Os?=
 =?us-ascii?Q?09ynkIuo/Wp09xmJqTFs6cdO6zCCHTUABJApimhNFTByBD/v/0AnCgiu7QGT?=
 =?us-ascii?Q?IASNRzr3ftHRHZwFBJ6/IEXDla/hdH/MNrAf/ixrf5pQoXDG23fAWKNilQP+?=
 =?us-ascii?Q?aOq2JEQFtA67iaTeXP4jk+7GacZ8eGGPvDBM4MumDe8i0cb1rXPFnPpME5lW?=
 =?us-ascii?Q?mQh3hE+iwcvkdU20X2CzsMjdDWvt6rAA8iMxYKjBX3iGkywIvB3FSYnqVGLo?=
 =?us-ascii?Q?e168iZ5Fr7tcsqvBkAz3Kdmffilx9bbvYa4+E41U+RtyR9ezc5VjRwn0sFL2?=
 =?us-ascii?Q?Vpyj/QLstnhYUt3BAoTcz1QUr2xXPT+OpXM3SEKIRqb+b9qIdUnNDLPyoaye?=
 =?us-ascii?Q?7lzQvB2qo8OKMs5Mr3hBXOSRsvg6Sjf5kMBmT+gadgqWWkNjsmv6ErSl05sz?=
 =?us-ascii?Q?BzOW9fRSHX3DLlKjPku3hOlKDf9yxZvWI48+MbFW+/D6cR6B7R9w+67KKVDp?=
 =?us-ascii?Q?On+ctCnnAjq14E1HILKSQ50/btZp7I/dNjsxSk9CmO+LYcwILGJBU+v6rSTS?=
 =?us-ascii?Q?WTFqEPm6JWdhP8W5ITdaleO7IdwvjqyaSv/H2PrBjaXI5mx4w5DT9BVFIEA2?=
 =?us-ascii?Q?XDqGf6avmelhkrecyHjn2e+AAwHBtR7o2QSOwG9gzW5jwtUCzDuw2Q9QD/AD?=
 =?us-ascii?Q?mFpBK6q4YvT/mjNCjiHadsweqau8R9t6jFSjLAcby2aojVofdp8AKTeD+3gp?=
 =?us-ascii?Q?zt6k3SzY74opg6UwHWwS8Ej7YBf9eX8sx4VHV7VQSKOhNVr+JXZrbV486PIm?=
 =?us-ascii?Q?L3x4B6FCcU9XvA0XIcAnY2VufdLBRoWVxrvWEaGUeCo7BMc9O/d58QQ4A1WM?=
 =?us-ascii?Q?Vp+QFs/sHARs18piS6CmaRdsX25HCjS3pzwNH4f/RMXKn4hHcv6uZ4bMd85u?=
 =?us-ascii?Q?3g1C//BEi8ybYqtjwex8TBJjb/QyMH1Qs5bIc3wrIVyAMdRG7aTtf89dsxyI?=
 =?us-ascii?Q?biHSwfDN0HAEKxvrT62f3GO+hFxYKGvjWZdnCUmXjeWlzxM+NfmFt84rPLst?=
 =?us-ascii?Q?VuWC0xSfVEv/pztZdAiSaQx9/HP71sp5boft8KvVNhgQL2aOAuooFG03IfWs?=
 =?us-ascii?Q?+NiLHR8wVhxju4NJwN++QPMYEcjv+aDv3XJcuApRCdIrGd6osnF31++ZUUR3?=
 =?us-ascii?Q?pznXOzb/dRnEkXJUtvjppqwpCKYIEb+5590HweGCYlvNZxbB/xx5HUYGAWeT?=
 =?us-ascii?Q?Mp7s6weZREgC4Ni2S+r0iO5mtEBLZt4unzogET89GrFMa6TLlPhCGbO7f8tR?=
 =?us-ascii?Q?POyQd5YCf+F7jGAikWXZS/NxsPlJoa7sQILHBuo2j3R9LATyXLb1a2HUnIkm?=
 =?us-ascii?Q?M27Uw7X0BxxZkedgplacd7UHlPxkqGIwDIOjruv247rlHU+fNxkz1zJfFJYh?=
 =?us-ascii?Q?9W8xkX/utAb+VLPb+6eiwOl9edqQPtT64N2GirLwgiYMawP0oirqO9dhcUJ3?=
 =?us-ascii?Q?vmk0ei1zUuTLmnUhOBQyb429dokwI1fX4+idJMs7mTG0oL0CR3wVNGqXi7wG?=
 =?us-ascii?Q?l29K/A=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB8449.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86abbfd2-3b9a-4ea7-3371-08d9ed4b8938
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2022 10:44:52.8565 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: srPOnDzlF28H5bdqs36+tL61bCD/QY0VeI7O4ZicAYPQdE/R4pXJFR/tO6TdJgiVPypzxyDKSjXijikdPe1bKPON5GjB3a3a0tSPtQYaoXk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR02MB7874
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220211_024502_787617_0E4A7CB5 
X-CRM114-Status: GOOD (  19.48  )
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

Thanks for quick review

Sure will update the subject and flags order.

Thanks,
Sajida
-----Original Message-----
From: Michael Walle <michael@walle.cc> 
Sent: Friday, February 11, 2022 3:09 PM
To: Sajida Bhanu (Temp) (QUIC) <quic_c_sbhanu@quicinc.com>
Cc: dianders@chromium.org; tudor.ambarus@microchip.com; p.yadav@ti.com; miquel.raynal@bootlin.com; richard@nod.at; vigneshr@ti.com; linux-mtd@lists.infradead.org; linux-kernel@vger.kernel.org; Sahitya Tummala (QUIC) <quic_stummala@quicinc.com>; Veerabhadrarao Badiganti (QUIC) <quic_vbadigan@quicinc.com>; Ram Prakash Gupta (QUIC) <quic_rampraka@quicinc.com>; Pradeep Pragallapati (QUIC) <quic_pragalla@quicinc.com>; Sarthak Garg (QUIC) <quic_sartgarg@quicinc.com>
Subject: Re: [PATCH V6] mtd: spi-nor: winbond: Add support for winbond chip

Hi,

Am 2022-02-11 10:22, schrieb Shaik Sajida Bhanu:
> Add support for winbond W25Q512NW-IM chip.
> 
> Signed-off-by: Shaik Sajida Bhanu <quic_c_sbhanu@quicinc.com>
> Reviewed-by: Doug Anderson <dianders@chromium.org>
> ---
> localhost / # cat
> /sys/bus/platform/devices/soc\@0/88dc000.spi/spi_master/spi16/
> spi16.0/spi-nor/jedec_id
> ef8020
> 
> localhost / # cat
> /sys/bus/platform/devices/soc\@0/88dc000.spi/spi_master/spi16/
> spi16.0/spi-nor/manufacturer
> winbond
> 
> localhost / # cat
> /sys/bus/platform/devices/soc\@0/88dc000.spi/spi_master/spi16/
> spi16.0/spi-nor/partname
> w25q512nwm
> 
> localhost / # hexdump
> /sys/bus/platform/devices/soc\@0/88dc000.spi/spi_master/sp
> i16/spi16.0/spi-nor/sfdp
> 0000000 4653 5044 0106 ff01 0600 1001 0080 ff00
> 0000010 0084 0201 00d0 ff00 ffff ffff ffff ffff
> 0000020 6800 6c65 6f6c 7720 726f 646c ffff ffff
> 0000030 ffff ffff ffff ffff ffff ffff ffff ffff
> *
> 0000080 20e5 fffb ffff 1fff eb44 6b08 3b08 bb42
> 0000090 fffe ffff ffff 0000 ffff eb40 200c 520f
> 00000a0 d810 0000 0233 00a6 e781 d914 63e9 3376
> 00000b0 757a 757a bdf7 5cd5 f719 ff5d 70e9 a5f9
> 00000c0 ffff ffff ffff ffff ffff ffff ffff ffff
> 00000d0 0aff fff0 ff21 ffdc
> 00000d8

Thanks, please provide a md5sum/sha256sum, too. It is to make sure we got the same binary when we pull the data out of the mail.

> Changes since V1:
> 	- Added space before name of the flash part as suggested by Doug.
> 
> Changes since V2:
> 	- Updated chip name as w25q512nwm as suggested by Doug.
> 
> Changes since V3:
> 	- Updated flash_info flags passing according to below patch.
> 
> Changes since V4:
> 	- Added OTP support for SPI card as suggested by Michael Walle.
> 	- Updated SFDP flags passing as suggested by Pratyush Yadav.
> 
> Changes since V5:
> 	- Reordered flags passing info for spi nor as suggested by
> 	  Michael Walle.

Did something go wrong here? The flags are still ordered the way it was in v5 ;) Also, the subject of the patch is still the old one.

> 	- Added SFDP dump info in commit as suggested by Michael Walle.
> ---
>  drivers/mtd/spi-nor/winbond.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/winbond.c 
> b/drivers/mtd/spi-nor/winbond.c index 675f32c..315b9f6 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -124,6 +124,10 @@ static const struct flash_info winbond_parts[] = {
>  	{ "w25m512jv", INFO(0xef7119, 0, 64 * 1024, 1024)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ |
>  			      SPI_NOR_DUAL_READ) },
> +	{ "w25q512nwm", INFO(0xef8020, 0, 64 * 1024, 1024)
> +		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
> +		PARSE_SFDP
> +		OTP_INFO(256, 3, 0x1000, 0x1000) },
>  	{ "w25q512jvq", INFO(0xef4020, 0, 64 * 1024, 1024)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
>  			      SPI_NOR_QUAD_READ) },

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
