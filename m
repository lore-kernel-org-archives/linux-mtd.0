Return-Path: <SRS0=5B27=W2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C6D7C3A5A3
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Aug 2019 07:20:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD28E2341B
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Aug 2019 07:20:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IsPUvSL/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="D70hMhPG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD28E2341B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CfLs5P6aZOIXjKM4uN7f1DS4MkN664CXrPfZJ6WMjhM=; b=IsPUvSL/H/M1Yh
	x/RDKzEfERq9oen1Y+/a62TRY3W3N6let/LVZ1cXK5bXd7vxZxPTrDbg+DkOe/36ysZbukDdllbaq
	mGQ/M91AqZUEDHagNn0w+SM0t4HbcXNrExoCeTvIbRj3r3UHbw2p6hYL78ACaiB58OaorF7Pgifg6
	pcXsyRNE+VLLXw1wpgonvUOzZGUDmHPWxxNLl+PdQ2EQFYVofg2yC9VRhgMU40XphK8t6sGbv1d3I
	sPNqKBCtbT3UREaB9h/YyNdIbSi3ojqqBSpOGi/3db81h6jFjRGU/v+VYr6Q10b2550BK+bP8UKX9
	bZz5nyZ3iEK8bKGolRFw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3bCY-0001a5-QA; Fri, 30 Aug 2019 07:20:06 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3b9d-0007Ah-V9
 for linux-mtd@lists.infradead.org; Fri, 30 Aug 2019 07:17:10 +0000
Received-SPF: Pass (esa6.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
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
IronPort-SDR: uES41UNVBYn0NkA/p72tRdDxQxovhjetXZN0goIPct6fB56db0jWhjbm+4y9YFk7Zc5GAHZpTE
 GoGKtjc5/a4VoDwp3zIYLrhjyO5iCv59/tsdblcinp+ErL1I5zN/StwMsxvVV8ApJMREugwmrT
 Av+1yIQ9arPW6UyH897Qio+6XANjl0zZgEc0p7nK6LGojyI38j9mZ47ikRw8AvUNGS92Z2V4Xa
 ft0wTmtmPZalI0BQKoepjsfXPShLC8cuMzSXkakMr5mn6OkfCwuwvuU6ip9wRViMSqc0pxLGmm
 2kc=
X-IronPort-AV: E=Sophos;i="5.64,446,1559545200"; d="scan'208";a="44277616"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 30 Aug 2019 00:16:56 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 30 Aug 2019 00:16:56 -0700
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 30 Aug 2019 00:16:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F0r7LhBd7XCqBwYlC7C7pCP2+IJCfOSVwekiYA1QsYkDyE8Qd8KvX93qhNyvSEFAzq1nh0A9Dx1iQtZ0zK52QH8h6s1OosSWs/2suzT+l9RLPx30PjTY2rxt+3ZEtHzmWYXOC8CjTXWgwlzy8xOn0q7fZ6QmbQOI1xz97xlDUHRfBS7rUIyCWiCk4w+ahPHvs2QirKslrVpxvqCKb4SbRl1pgI5SbA6TranLktnW1PXEEBzTvQp1l0xN6ST5HvEWNaCcj8nXTjtrzopXAk6cb0zzP/RTRZzTgMU3vLZleUpzdxCT9nYh3PO5BYsFqPO14ODRBRv780akDRlxY1wqCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4pL+n2whFQElgLivMJ+y5T74W2065B93bo9TXigQh1E=;
 b=bPWYuo/hElF/iKfdZ/35ouM18+AOPSHpFQ5Dw+tthNX7v8C8M692S1gS9luWqMsxT0k+GjQMR2mEnZSjFYB0uirraGXC2z2q/Rnrm1vwcLXMr9JY0GIvMEzqg8MqYyoFVZWevCBmzMjL3oMGOTScmkguW/AT20MD0HAJGnuLdiNccqIXuzIXIgPZtBqC9dTBwCHPVjTTsd8Ft3dMvJPyDZZA7MXm6xZmcpczPs9MmWYoVW6MJaqOdqdZjIHB8q/qGFtA+uAD2mQoVUyA7n+PA/19dL0LiQ5OKfuAYXKc6xa9BMzF3kDDHzvWo+wfA00JQw7YThw++GAsOCOqeuOW+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4pL+n2whFQElgLivMJ+y5T74W2065B93bo9TXigQh1E=;
 b=D70hMhPGxRDr5QujZ6JTiOE2MohcFNGSgVDK7T8WcJfQilThoUlY80n+ipBYCcCx0kzzrxoygDpgX/Z/p7y7D3QjjIg3DaVVI22jiicdDo8HyV75lqDZ9cFNHBk1bOFVANmFjpsHtuW2Pb7dKKFy6DFrss8nOW5Qvu14iRyIY8M=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3583.namprd11.prod.outlook.com (20.178.250.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Fri, 30 Aug 2019 07:16:54 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2199.021; Fri, 30 Aug 2019
 07:16:54 +0000
From: <Tudor.Ambarus@microchip.com>
To: <Ashish.Kumar@nxp.com>, <marek.vasut@gmail.com>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>, 
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v4] mtd: spi-nor: Add flash property for mt35xu02g
Thread-Topic: [PATCH v4] mtd: spi-nor: Add flash property for mt35xu02g
Thread-Index: AQHVXmJpZKL/9l+9A0Se9yorPWMbi6cTSP2A
Date: Fri, 30 Aug 2019 07:16:54 +0000
Message-ID: <cda62665-3ed4-b309-9f40-452b12539354@microchip.com>
References: <1567080445-32695-1-git-send-email-Ashish.Kumar@nxp.com>
In-Reply-To: <1567080445-32695-1-git-send-email-Ashish.Kumar@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0502CA0011.eurprd05.prod.outlook.com
 (2603:10a6:803:1::24) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8e2613aa-aa69-43e4-cce8-08d72d1a091d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR11MB3583; 
x-ms-traffictypediagnostic: MN2PR11MB3583:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR11MB3583748E20CEF3AACA016FAFF0BD0@MN2PR11MB3583.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:207;
x-forefront-prvs: 0145758B1D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(366004)(396003)(376002)(346002)(39860400002)(199004)(189003)(31696002)(99286004)(6486002)(316002)(53546011)(6506007)(36756003)(54906003)(52116002)(31686004)(76176011)(6436002)(53936002)(102836004)(110136005)(2501003)(386003)(64756008)(4326008)(66556008)(66446008)(25786009)(66476007)(66946007)(256004)(14444005)(6512007)(26005)(186003)(229853002)(476003)(6306002)(486006)(8936002)(81166006)(2616005)(11346002)(2201001)(3846002)(6246003)(6116002)(71200400001)(71190400001)(305945005)(4744005)(7416002)(966005)(7736002)(5660300002)(2906002)(86362001)(14454004)(446003)(66066001)(8676002)(478600001)(81156014)(138113003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3583;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: P7LFpMKWrTz1fdpPMqs2Bdt3DakXDe4iQrXnAgpZaamyJ+oTifXMcbwDmP76H7vd4Cmwvx8hI/0MMmwpsHJLsXmcSDksTP466ECpqGkdbT9LsmExn1WF87IwOgWBlKHB8oaCfe3MwSgbd0+R3VV0l0g8L2NdawnImNE3EkyHSlwfKOURWJGd/Z6rclK7IUkorKYhxwoy9XBEpymknhwOCB/wel03DnxQrUUjhSJDZHhZcwGoq3sDhUUCt+KN6gffcJZoLnlIgVtivyIZcwsJ4aH4Dt1M6IATRyXsL/Yji5JpbahC5mAQ5Cxkk0Wmr3fdnpp+tvQhN57YROGfYZ3NPuZa5x/IytW4336PGYWFG6cgzBpozAq7YI4ryGe0M4eAJID5yGV69NJTVGC86sWWpXKhppT6xHnpRFvd+9tHjpM=
x-ms-exchange-transport-forked: True
Content-ID: <0D31C825D0120C4689030AFD56C205D2@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e2613aa-aa69-43e4-cce8-08d72d1a091d
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2019 07:16:54.2831 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: leSmhKREUnVhKu1IrAu9OEpzYkcbwzK9K7JhGvhNA6oLwakb1AJGD5F+McCawk6gbTIBovycUWsqwgRSC6p2TK21H67zqoaJ21tpvnRKHZ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3583
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190830_001707_423911_3704DAA3 
X-CRM114-Status: UNSURE (   9.89  )
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
Cc: kuldeep.singh@nxp.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 08/29/2019 03:07 PM, Ashish Kumar wrote:
> External E-Mail
> 
> 
> mt35xu02g is Octal flash supporting Single I/O and QCTAL I/O
> and it has been tested on LS1028ARDB
> 
> Signed-off-by: Kuldeep Singh <kuldeep.singh@nxp.com>
> Signed-off-by: Ashish Kumar <ashish.kumar@nxp.com>
> Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>
> ---
> v4:
> split into seperate patch
> v3:
> v2:
> did not exist
> 
>  drivers/mtd/spi-nor/spi-nor.c | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reworded commit message and
Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git,
spi-nor/next branch.

Thanks,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
