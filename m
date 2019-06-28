Return-Path: <SRS0=/mLJ=U3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AC95C4321A
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jun 2019 08:21:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2AC2208C4
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jun 2019 08:21:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MioiG+rC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="qZVZNieA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2AC2208C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jkwLdCUQ8Txjh/TYfhEaujB33t/NILdrrahOtxE6R7s=; b=MioiG+rCinAcUm
	Lv+XMaU68NAk0zMK09zww+FIRD8jnG208Vo96885ZMxMgO0hO+mrqjVTLPsqm15IAPxoEf4bZMn+7
	eR8CgJJQdjYGnVgs8xwNWh58Hv86/Y19d+IubRpZRP8TVp5sIXa7zrKrYxA3er+kZhe+j3xRIyCec
	pvcPAz0vk8dsm+kaUddWQkLwdI7G5wvWNsikgvB49Hw7wwl8varGFUOcvGoZc0dDqrvgtds3Uyqjn
	7I9DbWxnXRDO1fwp3HzdYMzIzXUbwU6WqsWaDLxB/BKcW+8hUliCltlxsaMddP77kbVFN4mkUK0tr
	GiTY5FEo4EzvXQdNHpdw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hgm83-0004Np-Ox; Fri, 28 Jun 2019 08:21:07 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgm7z-0004Mx-Ej
 for linux-mtd@lists.infradead.org; Fri, 28 Jun 2019 08:21:06 +0000
Received-SPF: Pass (esa1.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa1.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa1.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
X-IronPort-AV: E=Sophos;i="5.63,427,1557212400"; d="scan'208";a="40779477"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Jun 2019 01:21:00 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex01.mchp-main.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 28 Jun 2019 01:20:56 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 28 Jun 2019 01:20:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=PZiQvDsj7OxNL8jj7R4fKuuFnW0kW++t/LdUHhKiXvOEG2nRMh9/6Y1XwiscpdtEa1oFo25cYJIgHzvoS0H++m/0VKvcNU15Rs5GbNIPi8FOZ21B95wlpOzCl1fb1vD7nnAklgWZaB4ErXW1Igw0VQxGfL1vWDh9uwEoyaaEC64=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KXj7lt7FywYayGHzhv9MEAbAQKqweESvOQ35lgEw2Z8=;
 b=IaEIqwcCVZauYLkJShH4VCSSJdKK4IPuCtbCX/0I+GfrY0fd+r0vxSUZjKvvSgfpIc6w80hWw5ypP9QxkSDueEEKDC/ZvzfwoPH5hSI5L3vnMDIAEuSBIEpneLuijVKX19lh4oq+Z+rJbTCkHqjvnI81OeMtCIZqyNtUEIsNHaU=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KXj7lt7FywYayGHzhv9MEAbAQKqweESvOQ35lgEw2Z8=;
 b=qZVZNieArpgbaNVTP7kTnvwoGBenAA6O+qtJ4UHDT4aoPCXpwtfwx2k9gbGDhZQpBt9pTKqB3TiXNrUtG2mTOG8H7yJfRpg00wnqTvfXy2InJKcKSAqzOnFYpOGvslRiHQ5makOxqTdq1hyqFpIgV7ghY8+lUFWyWfIUNRN1lX4=
Received: from DM5PR11MB1850.namprd11.prod.outlook.com (10.175.91.11) by
 DM5PR11MB2010.namprd11.prod.outlook.com (10.168.107.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Fri, 28 Jun 2019 08:20:54 +0000
Received: from DM5PR11MB1850.namprd11.prod.outlook.com
 ([fe80::5025:6c13:b07d:501e]) by DM5PR11MB1850.namprd11.prod.outlook.com
 ([fe80::5025:6c13:b07d:501e%6]) with mapi id 15.20.2008.017; Fri, 28 Jun 2019
 08:20:54 +0000
From: <Tudor.Ambarus@microchip.com>
To: <vigneshr@ti.com>, <liu.xiang6@zte.com.cn>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v4] mtd: spi-nor: fix nor->addr_width when its value
 configured from SFDP does not match the actual width
Thread-Topic: [PATCH v4] mtd: spi-nor: fix nor->addr_width when its value
 configured from SFDP does not match the actual width
Thread-Index: AQHVKqYRRlZLW5Viykq22MnKUCXhb6avgZaAgAE94AA=
Date: Fri, 28 Jun 2019 08:20:54 +0000
Message-ID: <32340066-402a-0067-8694-91e34e7a7480@microchip.com>
References: <1561392046-10487-1-git-send-email-liu.xiang6@zte.com.cn>
 <792b5942-9aca-b0f2-dd92-cb8f96cd8027@ti.com>
In-Reply-To: <792b5942-9aca-b0f2-dd92-cb8f96cd8027@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR08CA0131.eurprd08.prod.outlook.com
 (2603:10a6:800:d4::33) To DM5PR11MB1850.namprd11.prod.outlook.com
 (2603:10b6:3:112::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9e139229-bde5-4a32-631e-08d6fba189f7
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM5PR11MB2010; 
x-ms-traffictypediagnostic: DM5PR11MB2010:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR11MB2010CF82006CE13B34212192F0FC0@DM5PR11MB2010.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 00826B6158
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(39860400002)(346002)(396003)(376002)(136003)(199004)(189003)(8676002)(36756003)(6506007)(102836004)(386003)(6116002)(66066001)(229853002)(478600001)(2501003)(3846002)(4744005)(7736002)(6436002)(76176011)(71200400001)(26005)(6486002)(8936002)(81166006)(5660300002)(68736007)(305945005)(81156014)(73956011)(66946007)(186003)(66446008)(2906002)(53936002)(66556008)(66476007)(64756008)(52116002)(110136005)(71190400001)(6306002)(486006)(6246003)(966005)(446003)(25786009)(2616005)(476003)(11346002)(31686004)(53546011)(4326008)(14444005)(31696002)(256004)(316002)(99286004)(72206003)(7416002)(14454004)(54906003)(6512007)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR11MB2010;
 H:DM5PR11MB1850.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1mVehLBSPYBB8CtESv9HhEgtDwIV8LQM68DJel9soYjxZdhvfhxV0tA0Q4VkxiknN2X8wII1d+wxHYyPNIpDEhJLWXBRwj0xjhtHZtBiqwwncyfVEhqT6zqQ1YQPyZZx81r10p64ilSliqp+sfU6Q+taiS1butyKK1eL51DLh7P1MHaPsFF63YRrgtp8GtTC6mbcQdP9SYNpdEFw0YFlefbbgqRpV7vke2Ybg1oht/Rg1t3fqKzHEmJ7q7vV0pz5qTIoRxOuBGVXF5wgudsHKiWwR+IBU76m/oykJcDDcVK9G0O9+IsLoDpi1aLhsRtuBdZNd7RxDjDQ5Q7gjH7/0Na6DncYyDuvn0S+hPjkQJ9MDHsFj4SXgVhzPGPCVB/9vSrDcLmBbqUw2/VB8URMxCPWRKUamQ6hmUCVV+ttwNI=
Content-ID: <EBAC5FDEFA254A488EE131B366395DFB@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e139229-bde5-4a32-631e-08d6fba189f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2019 08:20:54.6615 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tudor.ambarus@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB2010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190628_012103_612784_B86DD29B 
X-CRM114-Status: GOOD (  11.33  )
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
Cc: richard@nod.at, liuxiang_1999@126.com, linux-kernel@vger.kernel.org,
 marek.vasut@gmail.com, miquel.raynal@bootlin.com, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 06/27/2019 04:23 PM, Vignesh Raghavendra wrote:
> External E-Mail
> 
> 
> 
> On 24/06/19 9:30 PM, Liu Xiang wrote:
>> IS25LP256 gets BFPT_DWORD1_ADDRESS_BYTES_3_ONLY from BFPT table for
>> address width. But in actual fact the flash can support 4-byte address.
>> Use a post bfpt fixup hook to overwrite the address width advertised by
>> the BFPT.
>>
>> Suggested-by: Tudor Ambarus <tudor.ambarus@microchip.com>

dropped Suggested-by tag, you can't add this tag for each change request. You
should add it only when someone gives you the general idea on how to do the patch.

>> Signed-off-by: Liu Xiang <liu.xiang6@zte.com.cn>
>>
> 
> Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>
> 
> Regards
> Vignesh
> 
>> ---
>>
>> Changes in v4:
>>  update the comment suggested by Tudor.
>> ---
>>  drivers/mtd/spi-nor/spi-nor.c | 25 ++++++++++++++++++++++++-
>>  1 file changed, 24 insertions(+), 1 deletion(-)
>>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git,
spi-nor/next branch.

Thanks,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
