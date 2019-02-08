Return-Path: <SRS0=BWs3=QP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B86FCC169C4
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 12:44:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 814C120857
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 12:44:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tPv7vOn7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="QOLO9UrT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="B8b1n5mY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 814C120857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hSWU+m6G5wTddqFcVNWapznRI+MJRBwU12AR2FFQPfk=; b=tPv7vOn7DgHeEl
	VYkWJgN/mLAw0Hbas1/9IkyFcPn9sZAM7ANuds3V381u55qCLVRsPG4HCIaIrbSQ6kXoWaDL3ThJB
	lHnbef0E2N4R86mGHsdBqECYZUWsYCAkco9+eDPxgApatesnM9Ek9WrVheTkuTDLx86mZKun3Ilh2
	CiZVgmfto20vKZV0FTeiFAsxc3GnLOjc8k1jFd7UiYzAP6FeRUJb2YbJsLubppvzQN+qw0zVmoCoZ
	7YpdV6Gjr7J6uuLWUz5penbysHpa3qE6JMbvfvkI+02Ira+wY00/GNQi91kqaLt+X6KBik1sFUxTx
	eF8CMzfBjONBvR0GFMVQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gs5Vt-0003Dt-6b; Fri, 08 Feb 2019 12:44:13 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gs5VE-0002F4-8H
 for linux-mtd@bombadil.infradead.org; Fri, 08 Feb 2019 12:43:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Transfer-Encoding:
 Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:
 From:Sender:Reply-To:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q7HG3irp66dkoBvP4Nt45fvvA3IkoezTvatPhw3ovCY=; b=QOLO9UrTanWasT8JuIKd5hcxla
 El2mkMVcyWF7C4K/VNy/qR7/8KMqoV/5TccY2Ikp8I5cRidzuQQJWFRZI5G0h/sqEtNMG0UH33ucb
 2zb/+XHhNIvufcgau/LmN/JiRgSfOjb2zNFX2zuU7b+GJsabBkp3G2YVwk5l4mrgkR/NfQwW8Qbi9
 TwfWiha5xqFLdmI2sH1bFO5jtp5iOR68RUQd/e6bvsgzswqiabq4R+lvDPw0vkt5tie4iK7vKU9BA
 M8l2kmjH7REWTqrNp1YJRPin/J2mlPK4uR2/RjjqbXVuJMhwydFvnsdPDuQbbU9yDC3N7f7Xhxp79
 ME9HJYzg==;
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gs5G8-0001wb-99
 for linux-mtd@lists.infradead.org; Fri, 08 Feb 2019 12:27:59 +0000
X-IronPort-AV: E=Sophos;i="5.58,347,1544511600"; d="scan'208";a="23581343"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 08 Feb 2019 05:27:53 -0700
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.108) with Microsoft SMTP Server (TLS)
 id 14.3.352.0; Fri, 8 Feb 2019 05:27:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q7HG3irp66dkoBvP4Nt45fvvA3IkoezTvatPhw3ovCY=;
 b=B8b1n5mYvAWAk19q8i5mc4pH/8NrKJf6otmWYa5FZgtdqlVPu153VjdPiA9mFZlqC+C9cBTfPZJlN4Y4u3pYRUAABi/EFGrJNQRTyhwA5RhG35iMC63WSGHYhVAys67Pi61a+bV6WqtleoVutgCY0hWmnHGaGpnkJHYeNZr4NSI=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1795.namprd11.prod.outlook.com (10.175.98.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1601.19; Fri, 8 Feb 2019 12:27:51 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::847:4296:13b9:fc9f]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::847:4296:13b9:fc9f%8]) with mapi id 15.20.1580.019; Fri, 8 Feb 2019
 12:27:51 +0000
From: <Tudor.Ambarus@microchip.com>
To: <beanhuo@micron.com>, <marek.vasut@gmail.com>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <bbrezillon@kernel.org>, <richard@nod.at>
Subject: Re: [EXT] Re: [PATCH] include: mtd: spi-nor: change HWCPAS to HWCAPS
Thread-Topic: [EXT] Re: [PATCH] include: mtd: spi-nor: change HWCPAS to HWCAPS
Thread-Index: AdS+60iqy/bLyT9iSLSC+lMdoEdfvQArYGaAAAIzopAAAgYLAA==
Date: Fri, 8 Feb 2019 12:27:51 +0000
Message-ID: <102fb723-c66f-d6f3-bd1e-7b0585458f2d@microchip.com>
References: <BYAPR08MB45338B3B9FE13B8FB3070789DB680@BYAPR08MB4533.namprd08.prod.outlook.com>
 <f167ad30-2a15-e430-1a6e-d1e1ba455b67@microchip.com>
 <BYAPR08MB4533E2C1B5CBD0789F1A1F0EDB690@BYAPR08MB4533.namprd08.prod.outlook.com>
In-Reply-To: <BYAPR08MB4533E2C1B5CBD0789F1A1F0EDB690@BYAPR08MB4533.namprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0302CA0019.eurprd03.prod.outlook.com
 (2603:10a6:800:e9::29) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BN6PR11MB1795;
 6:RziCltlCtYrIJ9iwwbbTjLpJEta4CpSRXxnE+qNKQvNtxPLFwV7BDviFEEQ1Y5mcWgDZYDlAOA0Usw7eiF0Q0lwdUMBd5NYO0wOgPMW3lulUMMCsvq5GmBZkKqPFleqAA19tIOgJb40agi5LoeiRpXCq3Utk5eBcnQNYG86I3XMFyW+aFu5f+En9nBvSxb9QqoUsNQTe4hw+Qpsh3vmplHjan8kxWqI0MXMpoTOx1z+nMZR+ToB3uK5QrYLPXcyg51xszM02iKOTzcewJv4iRLHk8MozbzEmO/kGNU85KXTf4zWoUDV0nG0kHmxgGGCnbeP4+1iZuEtAvApSKXxGuDOUghg5XBtdckHup9tnVzrAqx/5LCqDPbHDn2qxaDaP6K4CHFjplozR1v2dZzh5YOwC3EpQ6voRBztEx9mtb9msIhU2AF3pPEXFPzXFLYmSgNLv3NbXGD4SvQRSRu2MLw==;
 5:zIchyWC4wknpGl1dxQSQJEFyn/EzAYrze/7O5J2Iy6D0aYjW74/K8px96NeNouadVH5888IhPaoSdg3k36ko4X1Dga2dgYgJ7EosaPKs369qTTlcYydHbamc0Yt5vXayZjdouCOfbPQ69NKqtMCZFGpg0ljTjc7JArGabmjGKigNlglrNuXXMq+eqgbgRcTwKH1UbTqKdEPmA85wjCh5xg==;
 7:o6/7NIku9KmdVklofkZwsTxfw1m/HuDSu+75pMSIrbmxSIkZ8GWoyHUeWrnmoO1IapsxwTYxVR1kaDlQVD4Ko6ZzouiCEvB4LyeAeaBpHRKsemg5buJmJUYod2NkvuDrgd/0oALXxfNZzMN6Ce9Ryg==
x-ms-office365-filtering-correlation-id: 85f939aa-d575-45bb-35ce-08d68dc0d79a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
 SRVR:BN6PR11MB1795; 
x-ms-traffictypediagnostic: BN6PR11MB1795:
x-microsoft-antispam-prvs: <BN6PR11MB17950FA21B9BB7241D364DE3F0690@BN6PR11MB1795.namprd11.prod.outlook.com>
x-forefront-prvs: 094213BFEA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(376002)(346002)(396003)(136003)(366004)(189003)(199004)(76176011)(386003)(6506007)(305945005)(256004)(8936002)(26005)(186003)(99286004)(7736002)(52116002)(36756003)(53546011)(86362001)(97736004)(53936002)(2201001)(31686004)(14444005)(106356001)(105586002)(25786009)(110136005)(54906003)(2501003)(102836004)(2906002)(68736007)(31696002)(316002)(72206003)(6436002)(6486002)(6116002)(6512007)(81156014)(486006)(71190400001)(71200400001)(476003)(2616005)(446003)(8676002)(11346002)(81166006)(66066001)(6246003)(4326008)(14454004)(3846002)(229853002)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1795;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pkRXeUpDMbaNHCNnRx0H2DcerjVJ7ZwA8vPRY2CXC3w6RwKSnopmf3ltQCH0bvszNIWVa7XZtUrfYwUJfTmcnhpGW+ICmBcAJivhnoVXlk0SB6zURQdMeYYbQboCEf8JsX1JGca4OVGcfHRkT0IxrTVRGhJBt8XJDzDrucuJwYfjRoQ+VH19gGghcaZ1XJ64yrGnDLQ/rzEJQwuZt/ysTkhJ0/kIFkrrlKUESKMJkhxjyv5GSQFpvj6iJJ0/lKnZ7V3rpdOyPbq3QHgUD2oWdg3Q0HkuZpL4JCOWZtIZ+yBbC/V1QQihRKwqpUlkkEcIEzrhBF2csWQmGWTGAkGzFNv2gl8y8qKTjQ5oCYGH3+skSdqbDw3/qACChyyHu2X9Touw6UVgr8NKFZML6S0eva+pvPjz2fIqx1OZCvzBCXY=
Content-ID: <5487A002132CC7458ABE85AFEA9A8BF4@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 85f939aa-d575-45bb-35ce-08d68dc0d79a
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2019 12:27:49.6287 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1795
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190208_122756_710540_2D7F3BAB 
X-CRM114-Status: GOOD (  14.71  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 02/08/2019 01:39 PM, Bean Huo (beanhuo) wrote:
> Hi, Tudor
> 
>> SNOR_HWCPAS_READ_OCTO was renamed to SNOR_HWCPAS_READ_OCTAL
>> please update your remote and send a new patch.
>>
> Which branch do you mean? I checked linux-mtd, not renamed yet.

spi-nor/next

> 
>> The patch prefix is wrong, it should be prefixed with "mtd: spi-nor:". When in
>> doubt, you can check how were prefixed previous patches on the same file by
>> running something like:
>>
>> git log --oneline include/linux/mtd/spi-nor.h
>>
>> On 02/07/2019 03:46 PM, Bean Huo (beanhuo) wrote:
>>>
>>
>> This looks like a blank line, it's not needed, remove it please.
>>> Maybe this is wrong abbreviation, change from HWCPAS to HWCAPS.
>>
>> Indeed, it is, use imperative, something like: "Fix wrong abbreviation,
>> s/HWCPAS/HWCAPS"
>>>
>>> Signed-off-by: Bean Huo <beanhuo@micron.com>
>>
>> Your S-o-b tag doesn't match the author name, please fix this as well.
> 
> It is automatically added by git, what is correct way?

Your author name "Bean Huo (beanhuo)" is different than your S-o-b name, "Bean
Huo". Did you add your S-o-b tag by hand? The author name is automatically added
by git, it looks into your ~/.gitconfig file, at [user] name. S-o-b tag can also
be added by git, just use the "-s" option when committing the change: "git
commit -s".

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
