Return-Path: <SRS0=oU9n=QV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAD_ENC_HEADER,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E51FEC43381
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Feb 2019 03:09:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABC7920818
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Feb 2019 03:09:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NAobWa5z";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=telspandata.onmicrosoft.com header.i=@telspandata.onmicrosoft.com header.b="PAt/zXhx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABC7920818
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=telspandata.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tkII3i0UiKkmE6HoMGENJ1b6LCIJHRXTEM7fdLBvyo4=; b=NAobWa5zl+0Kmv
	jy/ZTijon34ReY9eJ8q4rI1S9gsUA50rrbSN/q8d3dzVGk9PvUzkh4LU9el35OlZw1BgLqpBTNYhp
	ER5LzcIaef7BUFmLHGWJok3n8eJX6J4DJlGSM4HxWu98t24Qvd1dc3jx4+vD+p41KVA6nBoYo52zH
	X7Cz5g/CJWxOcAWIZgLZ5w6k6h1BUw/MxDwHh8f6Y52eYINhTuMaNwDNyPEc07GGwUwlGQ7Wkc6vE
	B9I8xdbvFRJ4iZk2ag0aOvQKfSiP10jijh6cmOp2kzqmCNGYiOs4gaOGzU5b6APCEcLAhbOl2QkzY
	3bE4lQ1xRvGAnv7COm8Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gu7P4-0005YS-Rj; Thu, 14 Feb 2019 03:09:34 +0000
Received: from mail-eopbgr710069.outbound.protection.outlook.com
 ([40.107.71.69] helo=NAM05-BY2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gu7P2-0005Xx-Bt
 for linux-mtd@lists.infradead.org; Thu, 14 Feb 2019 03:09:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=telspandata.onmicrosoft.com; s=selector1-telspandata-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=27CbhrGZdzZpZLCQRIIbCFJdrEvsbYSwYudoWfH+ey4=;
 b=PAt/zXhxB1xb21aQwPLRMJiVkbZXJvfB5iyjzbqSL5bHZIWB4peCvuyeAi6rL2aRB95CDKBl+WBOnfR7u5EYLmom7f9xXiB0ZSWdsWUpwn+RkV4GzNG6mf1pVhLzRKz04wD1HHPhuRE/JtCfTFWBQTbqdlzqgYouSzc6/iy/wfY=
Received: from DM6PR16MB2665.namprd16.prod.outlook.com (20.177.220.10) by
 DM6PR16MB2652.namprd16.prod.outlook.com (20.177.219.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1601.21; Thu, 14 Feb 2019 03:09:28 +0000
Received: from DM6PR16MB2665.namprd16.prod.outlook.com
 ([fe80::2458:9950:7549:af0]) by DM6PR16MB2665.namprd16.prod.outlook.com
 ([fe80::2458:9950:7549:af0%5]) with mapi id 15.20.1601.023; Thu, 14 Feb 2019
 03:09:28 +0000
From: Matt Schepers <mschepers@telspandata.com>
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: mtd utilities work but ubi utilities do not?
Thread-Topic: mtd utilities work but ubi utilities do not?
Thread-Index: AQHUw/Wa2AwIel9T9kixDMSG2KbPfKXelZuAgAAGK6E=
Date: Thu, 14 Feb 2019 03:09:28 +0000
Message-ID: <DM6PR16MB2665DA2D6DCD8FE7B829D572B0670@DM6PR16MB2665.namprd16.prod.outlook.com>
References: <DM6PR16MB266514008732CC2ECF6C5257B0660@DM6PR16MB2665.namprd16.prod.outlook.com>,
 <d24d0b1d-135c-1779-5e4c-db9d20504f3b@sigma-star.at>
In-Reply-To: <d24d0b1d-135c-1779-5e4c-db9d20504f3b@sigma-star.at>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=mschepers@telspandata.com; 
x-originating-ip: [73.243.244.243]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e7e65696-83b7-4ef6-b1c9-08d69229d4f0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
 SRVR:DM6PR16MB2652; 
x-ms-traffictypediagnostic: DM6PR16MB2652:
x-microsoft-antispam-prvs: <DM6PR16MB2652EF21DC77CE769299621BB0670@DM6PR16MB2652.namprd16.prod.outlook.com>
x-forefront-prvs: 09480768F8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(376002)(396003)(39830400003)(366004)(346002)(199004)(189003)(33656002)(2501003)(102836004)(6506007)(76176011)(71200400001)(14454004)(7736002)(53546011)(14444005)(26005)(186003)(256004)(7696005)(6116002)(305945005)(71190400001)(8676002)(508600001)(81156014)(81166006)(8936002)(55016002)(486006)(66066001)(3846002)(25786009)(446003)(53936002)(97736004)(476003)(110136005)(2906002)(316002)(105586002)(106356001)(6246003)(99286004)(74316002)(9686003)(86362001)(229853002)(68736007)(6436002)(11346002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR16MB2652;
 H:DM6PR16MB2665.namprd16.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: telspandata.com does not designate
 permitted sender hosts)
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; DM6PR16MB2652;
 23:5+CU+9qS3bfTj3bij0SwVQc9jJUcHLRde81JUzp?=
 =?iso-8859-1?Q?pImbNbpUA7RKVSc1ZCS1lFRKx6Oqo0JWbhki6YU0ctOfVyhf3kG5HaXEFB?=
 =?iso-8859-1?Q?nlhqm5GH1stxc44s1LJUIvo5it8kYxxGsYqeX9Lwk9B0zcx/h1gZ5F0WvW?=
 =?iso-8859-1?Q?FYcHPvc9mr+7F1w3FfImLL1ZNOwVMd8WeXK+i/XVOIk4DvVytuXZQhJS7v?=
 =?iso-8859-1?Q?77rAxdcqUBJADhV538dsxmdlyMvHJ2v850GDRg6nli4z3OA+xEqcOCx5Tn?=
 =?iso-8859-1?Q?prUYQUVNWogBSdrJnKxXhZuCTDOCfrrwtWghX5bW2bdt/5aXzeBW5Zf/+l?=
 =?iso-8859-1?Q?KpjBj97KjUPS9wUDriUaDMy7ZTYW/HTwTLWRoz2767B4DDoLsTMtf706/n?=
 =?iso-8859-1?Q?ZhKJnGjW3o2IVuOuNmPRu8RDXmU1GYdCnRWcu5XpPkpD9TkOXoInW/FTqb?=
 =?iso-8859-1?Q?0j6LfcUNoNF+2Bp3KeiH+cgkf9XiPfYUeyKnrEOz4Ab9FAHY3tCxFeTOb/?=
 =?iso-8859-1?Q?GDPV57dVUw5crpUWSBrcprB3encpTohkU4R7QiPdZfn3vltjRnmPGIE1u0?=
 =?iso-8859-1?Q?Fud7UJS5562M8DWC/qfZ7k06TpqzghzqFkC8qnFEkN41dTeqzJJ3KmgIIW?=
 =?iso-8859-1?Q?Cgh449kNWKDmHB8e49P0yneqgBf0dv9SfsTZXzfZUI59QcH5ITZi9Z+yaT?=
 =?iso-8859-1?Q?5cU/5jM/cAt14sCwgTutvuqXtPAZ0/kk+wSVOpRFlq8Nw0WQxrSkc4A3vS?=
 =?iso-8859-1?Q?dcYmuiLfVI/bdR7YrLoHQBd4qMpGf09SQnNkqe5w0ruAte53/ND9ZnDH8Q?=
 =?iso-8859-1?Q?fWRUVEU7x+cIhuFwTWGtoESjXq9+qWO2GrxsdZIZ1nosPABXx2HYeqUnl6?=
 =?iso-8859-1?Q?dU7/y2CrDIiyQrYnRkq0KDsqq77lxD4cF0pddELAsjbL3WB7q3OIQ+Lak+?=
 =?iso-8859-1?Q?WL0KbsbnIHLbUMx1dXx2zq7R7a98k8rA2uMzUvNE4AQhu2pzaEevyeVsvx?=
 =?iso-8859-1?Q?MnR0No/DbV1Dc/8P8IgMNwSaN5BWcd3Y4zs1ERaZQno972C4pmGgxDtcpi?=
 =?iso-8859-1?Q?xbWetS4rszeB9teIQ7HtFwOTjfoiEHkgKn1chbpmRiY1PQv3QudloWrmRJ?=
 =?iso-8859-1?Q?dWIhr/Ief/fq0jih+Kdt2D7mXmC94pQvTtowWooFUbTlYHNyNy3cuebGlR?=
 =?iso-8859-1?Q?8eMAnu6Nv2MpeLN53cSAdgoTcMY1IOw+Mx2T69UlxbQP+jw8N5a/X4=3D?=
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vz/5K6VDB43iTTwp/B4y4QHJfvdrc9PILD7zFJU07LLd8m/tuw8ClIioLI46/k8jz5dvFDf3Rl+CwloUy67jqGfmBedKw5OzrgwKN8bE4X0suLMZrGweV8SWCtn+TiQRr4Uz94gZiQmVFeAM2ZryOcFbU7kNFN37iEMr/Z1U1UrJOxXQcuUIyCTU8JJP51QVzRM62h+k3nMb/03WXDRu4GYdp0n/T8F8nTeuFtuhEGdfQN2Xf6BsIaIAU0KCdl8A6bBrj+PZy2F4NOs3a6nMUZv6AEk6Bt/fEB4OsdkigBiaXeMQwpI6D+R95hKZTqd7lZZzkksGVpz6td0sbdiU5lR+RArQ38UUXQOU+pxDXgDXP8GNUgbawR5Auuev8SV9WQKzAQKtnHxEd3AHeT+eLLjzJ5H9F348EWvqwr9yPwY=
MIME-Version: 1.0
X-OriginatorOrg: telspandata.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7e65696-83b7-4ef6-b1c9-08d69229d4f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2019 03:09:28.2091 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 980119cc-b60c-4c4d-84e8-5d25446e5dc3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR16MB2652
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190213_190932_449779_3EC77C53 
X-CRM114-Status: UNSURE (   4.73  )
X-CRM114-Notice: Please train this message.
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

David, thank you for that information. However the following sequence of commands produces an uncorrectable ECC error where I think it shouldn't:

command sequence:
flash_erase /dev/mtd7 0 2048
ubiattach -p /dev/mtd7
ubidetach -p /dev/mtd7
ubiattach -p /dev/mtd7

dmesg:
[  362.807750] ubi0 warning: ubi_io_read: error -77 (ECC error) while reading 64 bytes from PEB 2044:0, read only 64 bytes, retry
[  362.808328] __nand_correct_data: uncorrectable ECC error
...

This error is present for every PEB in the ubi device.

Can you confirm that this should work?

________________________________________
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Sent: Wednesday, February 13, 2019 7:41 PM
To: Matt Schepers; linux-mtd@lists.infradead.org
Subject: Re: mtd utilities work but ubi utilities do not?

Hello,


there are unfortunately some historical obscurities hidden in the tooling and some things might
not be too obvious at first.

You don't need to use ubiformat, unless you want to flash an existing UBI image (generated
by ubinize). The ubiformat also tool won't generate a warning or an error if you don't specify
an image file and simply march on.


The work flow for what you want to do would look something like this:

# flash_erase /dev/mtd7 0 0
# ubiattach -p /dev/mtd7
# ubimkvol /dev/ubi0 -s 100MiB -N rootfs_data
# ubimkvol /dev/ubi0 -s 40MiB -N config_data
# ....


Sincerely,

David


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
