Return-Path: <SRS0=ZMJ0=QO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1E29C282C2
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Feb 2019 10:17:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E269218FE
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Feb 2019 10:17:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eZOmnAFh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="TD2cK1f9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="If/wAqJp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E269218FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6vNifPwPfEcE5UPX4I3L+gc7rYBWaHGWeuTCH7KwfWU=; b=eZOmnAFhClSjv+
	Emu2B9AzctV+L8dN7Abuvl4I/IzITEcPPLfrXgHfNfQADycRRjaHoPix7XNcwT9jbQcd6u8wu0PAK
	sSCaPhtZAgr4vMDIS6SPtrS0Vbg5jyrYN9AzfH66SiSnsPVHppiZrXoaXUmg8b5S15LUn/1lkLBWR
	11Q00yUk10PH0dMvOyGxg/LWTjtgNEbFhjzMv7pCLTfxoz0NYgNWWtEktbzIkAB6ditNewR5Wl1QG
	ThK5Ex5I42TmwgNYmkEZ9ly5wtJgJrpVy73C+MUx+m+HNiOZr/Gp7bQtQ0cBi3C0Eb0NRqAkBFA47
	wRH1js/6vKE10NuzwVOg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grgkC-0005Oy-Nu; Thu, 07 Feb 2019 10:17:20 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grgkB-0005Op-Im
 for linux-mtd@bombadil.infradead.org; Thu, 07 Feb 2019 10:17:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=MIME-Version:Content-Transfer-Encoding:
 Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:
 From:Sender:Reply-To:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OocYwaDgGgEkcmIkMxGJMbrj8WR+9YDQRhmrDncw/aE=; b=TD2cK1f9HMDSSm5OKUsDpVAFej
 tzXLNS/mOCnnT0b4x7GFGm62a7A3u+U1W6ZQ+gT96qYttV+H++MBLVMtWFQGSp1v0WqLWUgHlNyz+
 Wy9XL4c4/k3yHb4c0pOwlF7ISPyjALFgqpBf2D6fyKFmqSZgHra5e4iyJxOIo+T8VCVHv4PT28lay
 +WYH1YA9ibrrYonyLgVVhQFvCPIVqf479L/3+yEZUlgRlyhnr387DXk/VKdXkGT25FvbZHjT6x8hk
 PfB+8MuJdo5qg7yetwV7DQK4kI0gC9aq4I5rG72po8PHkIiUcYYxRJGlnlTFyUhHfpF+VlkYzLO9+
 DybAqTEA==;
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grgk7-0003oR-Qz
 for linux-mtd@lists.infradead.org; Thu, 07 Feb 2019 10:17:17 +0000
X-IronPort-AV: E=Sophos;i="5.56,564,1539673200"; d="scan'208";a="26411786"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 07 Feb 2019 03:16:09 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.38) with Microsoft SMTP Server (TLS) id
 14.3.352.0; Thu, 7 Feb 2019 03:16:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OocYwaDgGgEkcmIkMxGJMbrj8WR+9YDQRhmrDncw/aE=;
 b=If/wAqJpe9fuFj9RFe8RatYGuK/R6GYRDl1+2yO09czaZ4oOVqkCmujbFPvQouHm74/fHG3xulR+he9Jc3+SmmhvaxMgHT8I1kfqo3f0jC/M6SVm2vnbK1UxSAMdrn7IVEnPAZvWV3FHSfDsbenpfz92VtwhgH2FV3G9Xvrg2cc=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1395.namprd11.prod.outlook.com (10.173.31.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1601.19; Thu, 7 Feb 2019 10:16:05 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::847:4296:13b9:fc9f]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::847:4296:13b9:fc9f%8]) with mapi id 15.20.1580.019; Thu, 7 Feb 2019
 10:16:05 +0000
From: <Tudor.Ambarus@microchip.com>
To: <frieder.schrempf@kontron.de>, <marek.vasut@gmail.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: Add support for EN25Q80A
Thread-Topic: [PATCH 1/2] mtd: spi-nor: Add support for EN25Q80A
Thread-Index: AQHUsvEnBk05JSMTaE23Hh40f7Dva6XOJEMAgAX+zQCAABNIgA==
Date: Thu, 7 Feb 2019 10:16:05 +0000
Message-ID: <5bdbd64f-bacd-8192-b7eb-6ec4c06baec0@microchip.com>
References: <20190123075538.12681-1-frieder.schrempf@kontron.de>
 <f0b2c97b-419a-1e3e-4624-52c60fe32065@microchip.com>
 <52338dfe-aca1-503d-6871-c4be09f1f3ac@kontron.de>
In-Reply-To: <52338dfe-aca1-503d-6871-c4be09f1f3ac@kontron.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0502CA0016.eurprd05.prod.outlook.com
 (2603:10a6:803:1::29) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [86.127.52.185]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BN6PR11MB1395;
 6:UBGdhYNU2VksNKzqjF+1jIp+yOAIDGIpq+Pjuymkcy31V5KKe2Twvka2YBnvIGBS3JcJE7Hw1tyL3ee56vlK9MeVFFTou9o8jK8IwC/Mj62XWOq/vJYFe8LVIj+69CSbFuFpOiarYebqdNz0uCAaRo57ad3+fndWRdy/7ljwzyclDPju7QNUMOYFSX+2BVs1/X2JjC1WkzX8aZgYo+C15e14v6RrOrddQTMa5Zp5y/5uR+79Y0hNpZmkpCUvxZzCf/ZIql40Pz+FtfdjMM4DjTzLhUGecsmqrnIpi5XfzR5wTxJ1umTuhJBXX6vEJyn89dxrp+RmR1X/kWb4Svk2cGN7COHOIXOwHUHBPF7QfcEXriNBS+hmL3DKwP2t0P+fqXQo8yeTOQUGPhB8wa1q4Pg3+o1qqxdIczqez3qrJFhegX6jQhhG0hvo7+5ca9BTrXu2758lojWXY7Np9UuKfQ==;
 5:vYXFIsY/AX25vNZKhFVb2xqs4nRB8VbmhiEH9BEXIPDrgwCGmW83pPHpLzeSi6RpHISO3+JOXTGtSAa8Xez/Csyg8UjLSOcc7FaFiMfrc4yUQnEy4rKjmCd9ERlFOH5syl4zmtEc2pVOHcHC0hzf+W/AnXZqqPkE6hKb4+iU1KF5hKqzCJGBTh2uEKzEi+bUJV80PPyV3DQmoKO+sJdNuw==;
 7:ayWmmsE30LcDqBa8ltbnecLEZaMKXW4r0yW1fTNC4exfjK3eexQk9nh90xmump+8O/XvaET4T1Wsp2Y7HCTflIK7AwPpA4m26B+egO5cHQj2/Gt7/EFIKBBe9M2KJH9EqkDaWZwUEhGUNRfC5pPieA==
x-ms-office365-filtering-correlation-id: a9eeb8f2-aee6-48c0-c5b7-08d68ce5451c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
 SRVR:BN6PR11MB1395; 
x-ms-traffictypediagnostic: BN6PR11MB1395:
x-microsoft-antispam-prvs: <BN6PR11MB13959A614DD2B4C82E984252F0680@BN6PR11MB1395.namprd11.prod.outlook.com>
x-forefront-prvs: 0941B96580
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(39860400002)(396003)(136003)(346002)(376002)(199004)(189003)(99286004)(14454004)(86362001)(81166006)(81156014)(2906002)(6116002)(3846002)(486006)(72206003)(76176011)(4744005)(6512007)(4326008)(478600001)(31696002)(476003)(8676002)(52116002)(446003)(2501003)(6246003)(11346002)(2616005)(7736002)(105586002)(106356001)(71190400001)(71200400001)(53936002)(229853002)(54906003)(186003)(6436002)(316002)(31686004)(68736007)(305945005)(26005)(36756003)(110136005)(97736004)(102836004)(53546011)(6486002)(66066001)(8936002)(256004)(386003)(6506007)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1395;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: t545v9qwGYKvyPNBjr2Zjn/uyEsHUo3RR5LHVn6Vfj1lNlWFtrfXEEuYd7T3QyfPAiqwS3XbnkQrpA0s5xSwdhI2DCWgGj2Ug4WbtCgDa5Xv6AG3Mqkq5zNmLWWXjKhTpozvV5RMVwfTAIcc1IzNrI4GyT/4ToCD447uMA7WTpU1qdiiTKIzQ6HVdlXiF3dQlb3+F9q56whKJmAY0OX3cq3eHxleRtHM1ezdR00HP55cJhTTHkATWcK0CiJISLv2Nui76T/qzZSjZtHg/3YV7Qcb6QhSPtVIs0NEdi+WowBU2IfXahYp5BCGKBT4dg0Ym2D2/eQgsBbe+rMOpgL9bgKarucjbDyotT2YNtQvGN/1U4+0xLilY2P4tly/DwodRAkq41H8x+lb3ILRmcEIrCgkEmXOsGgad0CQKGzmR9o=
Content-ID: <D99B0DF6776D71468F28514BF1C14753@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a9eeb8f2-aee6-48c0-c5b7-08d68ce5451c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2019 10:16:04.1616 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1395
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190207_051716_023651_60A6CEC7 
X-CRM114-Status: GOOD (  14.54  )
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
Cc: bbrezillon@kernel.org, richard@nod.at, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Frieder,

On 02/07/2019 12:06 PM, Schrempf Frieder wrote:
> Hi Tudor,
> 
> On 03.02.19 14:33, Tudor.Ambarus@microchip.com wrote:
>> Hi, Frieder,
>>
>> On 01/23/2019 09:56 AM, Schrempf Frieder wrote:
>>> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>>>
>>> This adds support for the EON EN25Q80A, a 8Mb SPI NOR chip.
>> I would suggest to specify who is using this flash and how did you test it. This
>> way we will not end up with support for flashes that are not actually used.
> Ok. The flash is used by a board that I plan to upstream. Maybe I should 
> just resubmit this together with the actual board support patches?
> 
> Likewise for my other patch (MX25V8035F), this is for another board I 
> plan to upstream soon.
> 

Sounds good.

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
