Return-Path: <SRS0=TRF+=P5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A972C282F6
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jan 2019 08:28:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C90852084A
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jan 2019 08:28:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UsFldOag";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="D+0g2G9D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C90852084A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vOEaCEYaEgrXD5WJ8z+FDrn5qogdRYvuX0IkcraUcOk=; b=UsFldOagHgAE81
	Gx2wleHB8atDpYVw8lIeKEzB7KMT5TaOerDYrQzIfMS2f4cAyKohH0mdinT7QuGSeDL4/oiUP+G4C
	ZK4fC+ETEsL2iAlYq4AkUJjG4t10dmF0DUkmmvS8y4Sn2hkvFBsRic0cvNaeBsoKml4lu4RC8vSyg
	9ULdtbO4WNzcBGSYx24/K34ol2mc1ZgdCxlp5gkLZpeZGgSvrJZ0od+OPCn7ScOmBFIREN9x/6Pvz
	AeyyVt31cVWbOe+1ymamTxKtkB67nXfodspmwD7i2xUNNsmLS4SR6gPSlNLzpmqb6iQV3KlJsv1zG
	qPDu/QE2vV/uAfb0StaA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glUwP-0003RF-Q9; Mon, 21 Jan 2019 08:28:21 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glUwM-0003QM-4S
 for linux-mtd@lists.infradead.org; Mon, 21 Jan 2019 08:28:19 +0000
X-IronPort-AV: E=Sophos;i="5.56,502,1539673200"; d="scan'208";a="25291667"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 21 Jan 2019 01:28:16 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.105) with Microsoft SMTP Server (TLS)
 id 14.3.352.0; Mon, 21 Jan 2019 01:28:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m9KrySpkBWDS21Whw+00osGXX05lTgDet/fV+AcJllw=;
 b=D+0g2G9DiGFmcBlKBoHvmYJ6r96+n8g4Yarc6xanuM3ax73OLF3lof1t8XkemaeWshd5PvMU4aBzd4qrerLY3qZxAcxnCXkfPYHFB4/WMlhakqeDZ4jlIWleUBm1IYb89vM45Rt9EUNFsUVu14WJ/rUdJVnXQ0BczkdBRM+sSu0=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.99.146) by
 BN6PR11MB1604.namprd11.prod.outlook.com (10.172.23.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1537.29; Mon, 21 Jan 2019 08:28:12 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::79d8:b977:b90a:76fa]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::79d8:b977:b90a:76fa%4]) with mapi id 15.20.1537.031; Mon, 21 Jan 2019
 08:28:12 +0000
From: <Tudor.Ambarus@microchip.com>
To: <sergei.shtylyov@cogentembedded.com>, <marek.vasut@gmail.com>,
 <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <bbrezillon@kernel.org>, <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <Cyrille.Pitchen@microchip.com>
Subject: Re: [PATCH 0/2] Untangle Spansion S25F{L|S}512S chip IDs
Thread-Topic: [PATCH 0/2] Untangle Spansion S25F{L|S}512S chip IDs
Thread-Index: AQHUrcQPbPLpQHs27UGYGwZBxMMprqW5avCA
Date: Mon, 21 Jan 2019 08:28:12 +0000
Message-ID: <0f8ec847-9e36-32c4-ecaa-8e8fcc1e3337@microchip.com>
References: <610761cf-5a19-c182-07d8-8d118ca20035@cogentembedded.com>
In-Reply-To: <610761cf-5a19-c182-07d8-8d118ca20035@cogentembedded.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR07CA0135.eurprd07.prod.outlook.com
 (2603:10a6:802:16::22) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:103::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BN6PR11MB1604;
 6:FZF/HIElWlx8rJChTeckkyQQtPkVE1pj1TsyXez/b0jaf7mPRJOm3Zgl8JZADZY4kIWWNWEvWA8w3cA0qBjW+2WYIi4bvOPJrFime3rnYFfLfOwprvQH+Qp/W0vV/6/pPSXy8jgWM/Smw9HI00tSqxThoCl1PcdDcROc5m+TodlTT1L7MbTEnUrTzB9E8gaYbOp2nflQNGuT/FljSqJtz9KMiu63UzIk+VtIDoTpCPeSaUyc0VkxcUhDuQ9gVTnPy9z9NxwKHeaUcGCmxMJGLAQeheKsamMPjHxLGmLcuY/EchPowEzb/h3ye69fDJq4Ox3c2PcghX5m5xCAbubgindVbkOw4jDF3QiMdTn5xRnyqGlfCyIQPjQgRQD6xgSgrRj7x2uJ/sHBX17kiGSzx/DeKlPtZjVZJ5SLtL65srcZE6loQFN1/N+JgpHL6WcT6eckOlzKUYsues70bghPSA==;
 5:ZVLr3zqBQN7kAxgN39GbJcCy9hHmOOt4iu0peq2wa+FvrylRPMW2GZfuCxrlro2Rxp4XMZn4Ac7RXK7QDFuKC23shm72j+ZjeZlQewAMTnS8XcmEdZyv0SNhkw2Isns8C77xjd6aSHjtDhWfwrI9cP6/5+wY06iHtouDR816zI8HzjwRDEDkD8+zi9GwT1YN/RV4K58ElICVdnqmoqD8YA==;
 7:b9pP68HNcJhLjhn+PLL8pcWiBOz7cUk5EKhq05QKdZKEuZDIKWUidofCQPjvWVfmuaMrA7AbmlX+YNpgtXExGA3qQJ3WJHNAJfEdLPPOBJUVtvYBsKEvzL2/1rZo1eWv79/HqGy3q3zE7iFW39l1Qw==
x-ms-office365-filtering-correlation-id: 1ff67101-632f-4a05-13b8-08d67f7a61e4
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(2017052603328)(7153060)(7193020);
 SRVR:BN6PR11MB1604; 
x-ms-traffictypediagnostic: BN6PR11MB1604:
x-microsoft-antispam-prvs: <BN6PR11MB1604566436C3CE97B758BD50F09F0@BN6PR11MB1604.namprd11.prod.outlook.com>
x-forefront-prvs: 0924C6A0D5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(366004)(346002)(136003)(376002)(189003)(199004)(53546011)(6506007)(14454004)(102836004)(52116002)(256004)(14444005)(76176011)(386003)(2616005)(11346002)(478600001)(71200400001)(71190400001)(25786009)(72206003)(476003)(446003)(486006)(31696002)(3846002)(8676002)(81156014)(97736004)(86362001)(186003)(6636002)(81166006)(66066001)(6116002)(966005)(8936002)(39060400002)(26005)(36756003)(6246003)(7736002)(6486002)(99286004)(229853002)(110136005)(6306002)(2501003)(31686004)(6512007)(561944003)(105586002)(106356001)(305945005)(53936002)(316002)(68736007)(6436002)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1604;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: EukBXXV8VEoKJSxIM/MB4C2AMHmoSZO8gyDctwwXCn9HMGmsrWXGOs2ZpIIl0GfN++iAu0CQzpU34IjY++TB7pCbd7+yZsEX4FElxctEBCK6dMfg6FLNd5YG0rET+dfzckOM0Pfj2dQDrPZI11hFIK+d1JMy1WFY/XvlbFCxTGHPu8ebYgfx/zf4Ee8TLHsnon4ko5wlAgp7GzHc/szO+oUyuRAX4hY+oOhN+nn6OzOQQTuIFwbbvWw/22Cz0Nh/I7XDFJt489lXFGe3jQzz70DY/cH1Gxs0KDBKJONhhNK6SHAvkeU2lHF+WVk+yf3P5oFB/KeZQRvnTrQrrU6cqCW62bLLeYu2AF2GM0u7Lx/FHqmGUvYqmK9Vs0JwSWoI85wg6MxZoGV82OgFJ0SYsB+GevenC/zFvJlqkOXcY9A=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-ID: <5B08A786EBC3B94BA73403F65D28770F@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ff67101-632f-4a05-13b8-08d67f7a61e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2019 08:28:11.1277 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1604
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190121_002818_260324_73F0AA19 
X-CRM114-Status: GOOD (  12.89  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
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

Hi, Sergei,

On 01/16/2019 07:49 PM, Sergei Shtylyov wrote:
> Hello!
> 
> Here's the set of 2 patches against the 'spi-nor/next' branch of 'linux-mtd.git'
> repo. We're untangling the S25FS512S being taken for S25FL512S by the SPI NOR code
> due to omitting the family ID byte in the latter chip's ID. I'm proposing to use
> the full 6-byte JEDEC ID for both these chips.

The patch set is looking good. If these patches are based on Cyrille's
suggestion from [1], we can give him credit by adding:
Suggested-by: Cyrille Pitchen <cyrille.pitchen@microchip.com>
We'll need his approval if that's the case.

If you're going to resubmit, it's a good time to get rid of the 80 char limit
checkpatch warning. I would recommend this way of formatting entries, because it
has fewer lines:

        { "mx25u12835f", INFO(0xc22538, 0, 64 * 1024, 256,
                         SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },

Of course, if this is not the case, and you came with this proposal without
knowing about Cyrille's suggestion, I'm not going to ask you to resubmit just
for this little cosmetic change, just say.

Thanks,
ta

[1] https://patchwork.kernel.org/patch/10595835/
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
