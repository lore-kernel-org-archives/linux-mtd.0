Return-Path: <SRS0=BbO6=Y6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4C91C5DF62
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Nov 2019 07:24:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D9752173B
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Nov 2019 07:24:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NRA90v/E";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="d9V5EnP+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D9752173B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rBmwf6EO0L9NOwA6Fw+dl8Wqj08xtpL60bQdACDS8O0=; b=NRA90v/ESSAhPB
	k9Pr4N9d7QB6cPEJwpkeJKE0LNd6CXBH/Tkzpfq70NH++cN8AdK4UU8mUDHMNZpW9oWaEf0DBsXd8
	WtzdruEqFhgRtg9npXMM2gQ5PMCkjC7/v09IlxEbVZ+Qj5T63NKgls8VQCa/nQaH3N4SXwYOxIz/3
	wD0WwpYRFb1hLBS1XinAMvY0FkMA3mQyIbz0gJPUCX8HrenEu+0FHcfMYslquA/BrTcL8qHScy1Bl
	mXp4mLV+Xo6uY4Um6LpKKhEFQ6RTlil372sVcYXpT4AOPV1yDeiiOh/eSLEymiqH/+2+z88uO2bsm
	nBJZQjA2Qln0s+fFONuw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSFgI-0006HT-KZ; Wed, 06 Nov 2019 07:24:42 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSFgF-0006Dl-4l
 for linux-mtd@lists.infradead.org; Wed, 06 Nov 2019 07:24:40 +0000
Received-SPF: Pass (esa3.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa3.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa3.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: opbjD4007lICQUWc2yJRzIuncsLCIxz24/wxGRxLWP2Y5JnuSb7LV4W/6fxRGrVZFsxw7YYDZ2
 8ax6CLGaCIOvCUeYg+oUeYV7955jacVJJ7z3e2ki8DPvDNiHn4gTMU0O2xtkETyOLiiXRpfpBb
 A4p3LSHxV2WF+Hx3Yt4vTTsj6pQJYMkWD9hScEBzsi2iGpc0P7xGBWm+/c7HrHXWPmHtS76myw
 lP1MDXD1yyKNSoYO4g2hqyXaVb4pS0NJHfmSsEOHxKCsxGiw46cQiZy+ZzlN39f9C1m7GoXbAW
 FP4=
X-IronPort-AV: E=Sophos;i="5.68,274,1569308400"; d="scan'208";a="55871209"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 06 Nov 2019 00:24:35 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 6 Nov 2019 00:24:33 -0700
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Wed, 6 Nov 2019 00:24:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WDEnyIP/KDirqD/28ckVNXV5n9qTdzjCGeutb6XdzWsOkXdvsOJ8ZyxNqAVD2R3g+Sx7Fo6q9UkV/v0VGjXTn7GXBiyLDr0BS9oN8JTxYl80ki9dqrZn6L/C+eu6qDlQTnH+zJbejxC9YShiiMiwua1k/KW0WMDw80vNx+/J8zTZgUp6ngjC2DaYuGXR5aCLHkjtS7aKzlsWqHbISX+0e4g3WoeqS0KTHx5/J1HU/h3UQykNe58+E3HnHPOmtWUefwv6OoijxQFczqXsfyX21CX3c+Dsc2XqPYJXHq77l7wg39GDe/bosFhTs1mfHPsObss88sdAFtav82hRBGsMYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yasikDCYe2+tKN55LZw7C/zAbJYlF0buEWSCkzXdCe4=;
 b=YVBa/+qKz9Ek753DFHtpKPLpJe90YVSBLA7KhAsJDbh3sY9fkVvIkLmjjKgE9KkzhGFWLlkzpwXtBJW97bbuQkRYopxMKR+2BKWWEawHPzHKuK1nAmm3n+WKrFmKlsIinupyFn6CbDIjhLXaYHHvC0CqAGNoQ4OE8ZSgy/6LzwmZV98XMei+jP9rICCCVk9TzjHNvuEEaCBtC68R5hfTjV7mKgN5Km8cVhrC5o/1K9Pqr6vUtFNDHhWagMSgDMEnQoqNYTrPAIkHYBZeqRbfo7h5ckygLBi7jU0bRp/jjZZHyC3rPJpbwpOnDseVNDGxqdzD+nbgjIQVArOkhPsNRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yasikDCYe2+tKN55LZw7C/zAbJYlF0buEWSCkzXdCe4=;
 b=d9V5EnP+bLN1m8CJiAaN/4hIPpOl1N6od8F4apIP65kdT/TyZTZRJXkpdomnnFjqwC2L8VN57WIvl/vTtRQkAHw0Tj08w2ikYHR7kjFdOf0DGtLUJ2LiujmUtR7O0py+FJpycjri4v/DLzH1h+KPqaCNjg8gHRCAl0eMHJD1wBM=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3774.namprd11.prod.outlook.com (20.178.254.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.24; Wed, 6 Nov 2019 07:24:31 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457%5]) with mapi id 15.20.2408.024; Wed, 6 Nov 2019
 07:24:31 +0000
From: <Tudor.Ambarus@microchip.com>
To: <vigneshr@ti.com>, <boris.brezillon@collabora.com>
Subject: Re: [PATCH v4 12/20] mtd: spi-nor: Print debug message when the read
 back test fails
Thread-Topic: [PATCH v4 12/20] mtd: spi-nor: Print debug message when the read
 back test fails
Thread-Index: AQHVkW/82Z42whGzzUysItCyifQ7OKd8iNAAgAE6vQA=
Date: Wed, 6 Nov 2019 07:24:31 +0000
Message-ID: <5abf94c6-f2bb-b317-4796-3f9ea1fbf55e@microchip.com>
References: <20191102112316.20715-1-tudor.ambarus@microchip.com>
 <20191102112316.20715-13-tudor.ambarus@microchip.com>
 <9474c875-94a1-3d19-ddab-b90d352967a9@ti.com>
In-Reply-To: <9474c875-94a1-3d19-ddab-b90d352967a9@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR09CA0078.eurprd09.prod.outlook.com
 (2603:10a6:802:29::22) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [86.120.239.29]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8b24a3c9-e68c-4593-c179-08d7628a5d84
x-ms-traffictypediagnostic: MN2PR11MB3774:
x-microsoft-antispam-prvs: <MN2PR11MB377451751D5E98EAC937C853F0790@MN2PR11MB3774.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 02135EB356
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(39860400002)(366004)(376002)(346002)(136003)(396003)(189003)(199004)(66446008)(71200400001)(66066001)(31696002)(478600001)(36756003)(99286004)(7736002)(305945005)(4326008)(8676002)(25786009)(4744005)(476003)(66476007)(6246003)(81166006)(81156014)(110136005)(54906003)(31686004)(52116002)(71190400001)(6512007)(86362001)(186003)(14454004)(76176011)(486006)(5660300002)(316002)(2501003)(8936002)(6116002)(15650500001)(386003)(6506007)(446003)(64756008)(2906002)(53546011)(256004)(66556008)(2616005)(11346002)(102836004)(6436002)(3846002)(26005)(6486002)(66946007)(229853002)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3774;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: C3lJnFhNpV3Eh35jrR7tr3j5D+p6ZcvJkHVMYIcy6HRpGBsoHtRY2MeSjlVCnc8e13yeQ3RSeXRn36qUJW52WGXwvm+D49trpuwWX9EXoCJZaX5mYtaYVfOPB8cIUvwl2B0v6PAJVgWrvaKlenkXpIAV4wbTRwsW2Ut9jyAdE/Bf7C9GEZvRQAgEmZjEdicaiKGxodY3NvcfppT9AQ/sAxrpcvwF/MOE+1UOk8LlG1StF5F+veEiMLG7Gb+4TVT5APGrd+dEf4JsGHwbIdW5WZltzWN7a2fk1f6neoY2A+b1OMrZ4/it6CGxtiIXEHhzFme3jR/TmsGOtGmhar1Q4e2Z89RPzF3k6Kz0Rjzvqt8WvgGkEw/QUceu7rGUc8S0k3yA2CLx7PSqvJ8ruGxY+LXsdvFOU1REzFVMKboGPESJBDWOiX4luBn0MIIKWQMH
x-ms-exchange-transport-forked: True
Content-ID: <AFCCD6AEF84C554082F7C0AF70C9BA57@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b24a3c9-e68c-4593-c179-08d7628a5d84
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2019 07:24:31.1723 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l7Zom7LOJQWPcusdKw2R5yEx5TSxtfmp2pZqMkpGdjHskfkMhobfgSXRrzhtkXZVXvQpTkFqkSycy1+ZXMpY89b7bSiJg+FPYMh6Rz6r6mc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3774
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191105_232439_200346_43F82DDA 
X-CRM114-Status: UNSURE (   9.45  )
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
Cc: richard@nod.at, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 11/05/2019 02:37 PM, Vignesh Raghavendra wrote:
> On 02/11/19 4:53 PM, Tudor.Ambarus@microchip.com wrote:
>> From: Tudor Ambarus <tudor.ambarus@microchip.com>
>>
>> Demystify where the EIO error occurs.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>> ---
> I think this is a small enough change that can be squashed into previous
> patch itself
> 

I made separate patches because this is a separate logical change. The previous
patch extends the check on all bits of the Status Register, while this one
prints a debug message in case of EIO. Thus I tried to have a single logical
change contained in a single patch. I'm clearly no expert in this (Boris asked
me in v3 to split patches because I did too many things in one patch :) ), so I
would keep this as is, but if you still feel that it should be squashed, then
I'll do it. Please let me know.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
