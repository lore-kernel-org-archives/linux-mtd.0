Return-Path: <SRS0=HSOd=TJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7A63C04AB1
	for <linux-mtd@archiver.kernel.org>; Thu,  9 May 2019 10:31:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B90F82053B
	for <linux-mtd@archiver.kernel.org>; Thu,  9 May 2019 10:31:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Eed5txjn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="xBxX3o2G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B90F82053B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7XjcIHSU9FZnY+NsX+UxwDwCxm+UQCqrRA2LzQu35Q0=; b=Eed5txjnlxt5jk
	RhH5mRwKZ43d0gUcECX56ZoVW/1wDFHPRfUXHVhSUUbJTrJH+9Pg09An3S4PD5RW/dfKGzwiS1OOq
	vauvPx9qbVo/ZQIuJxuyN34AmmA6xJ0EKrNVfZHKmMurRfzZFKgGz8Xs4sGE4MfNQ6Oaeai4m5KM/
	caeHCwvIgK3OyNBO3qNwvb9xleDZiNPJ1cN1DPWMdO8RjEdJIsAGTefgDYKUsnjOTcJ5BnkOFQjt3
	ikPpkhmb3CDBNat6n8pS4hawtFC3ickyPZ1Vi+IPdQMYVk7zWMV+lqj2bfneKCUgFP2YiNOMypZD/
	Emc2Kn8OUxlJxQ7ufcJA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hOgLB-0002lV-Ae; Thu, 09 May 2019 10:31:53 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hOgL6-0002kx-0c
 for linux-mtd@lists.infradead.org; Thu, 09 May 2019 10:31:49 +0000
Received-SPF: Pass (esa5.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa5.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa5.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
X-IronPort-AV: E=Sophos;i="5.60,449,1549954800"; d="scan'208";a="30759862"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 09 May 2019 03:31:45 -0700
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.108) with Microsoft SMTP Server (TLS)
 id 14.3.352.0; Thu, 9 May 2019 03:31:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o8HpuWk0tNGFXNt38eIE/8gRwdJJKf1X2SLf162Q03E=;
 b=xBxX3o2GmveoefhlVv26B2AXpoW/owhGbQJpQH8aVyjzvjNuZjd9cSp9naaQoz2EA5HkUVCIh0P5KN4aoTClMKLWJIudrHLBnRXPF5S0zieJR6sAi/BWxSfu7btBE1JK/Qqmz3/trMbjK7pBt+ubsLc01PYa5i1Hm/I9V+9zOEI=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1459.namprd11.prod.outlook.com (10.172.21.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.22; Thu, 9 May 2019 10:31:41 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::35b3:7af:7216:8808]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::35b3:7af:7216:8808%10]) with mapi id 15.20.1878.022; Thu, 9 May 2019
 10:31:41 +0000
From: <Tudor.Ambarus@microchip.com>
To: <geert@linux-m68k.org>
Subject: Re: [PATCH v4 2/3] spi-nor: s25fl512s supports region locking
Thread-Topic: [PATCH v4 2/3] spi-nor: s25fl512s supports region locking
Thread-Index: AQHU3uz1n9sAm8MvGUei5wsE+JArGKZft50AgAANmoCAAAIxgIAABqiAgAAbqwCAAAZdgIAAApsAgAATIoCAAVI2gIAAKTcAgAAUAICAACvcAIAA6X4AgAAl0YCAABZ5gA==
Date: Thu, 9 May 2019 10:31:41 +0000
Message-ID: <7649e84f-debb-cec8-d6d6-d33d9dce4259@microchip.com>
References: <20190320071605.4289-1-jonas@norrbonn.se>
 <20190320071605.4289-3-jonas@norrbonn.se>
 <CAMuHMdVH85iFJngkU6W61ybwR2j3YQ7=cugPxgC57hUgBOc5KA@mail.gmail.com>
 <1f33e1e5-d7bf-76a0-c4d3-ecbc35fbfd4f@microchip.com>
 <CAMuHMdU83vLeVSqMZuJwR4yd382mau-OE1saMAOC2+6HodsHvg@mail.gmail.com>
 <fac5fa6d-95e9-cfb0-4d5a-6b16d4470190@norrbonn.se>
 <CAMuHMdUEdNr5rgCdaGAFJ-WK4oL2DC419smk+QYOJ7qJvkWA8A@mail.gmail.com>
 <a9ad3641-1eb8-782c-9dfd-0db41256d3f1@microchip.com>
 <ad49240c-2073-4045-c11c-fb6bad231321@microchip.com>
 <CAMuHMdVcp--qRo3m8kSQ=++Vx33kvxBWEHFVHfh-j=pq1x-GPQ@mail.gmail.com>
 <898831ba-b8bb-7c2b-e623-2e6c26da91b5@microchip.com>
 <CAMuHMdXFwFAPzYPKqj+FZgSq01VAD0izS3ELyOg1YBwTAQ_QkQ@mail.gmail.com>
 <8b004a57-0fd9-04fe-d031-1d98d890f826@microchip.com>
 <CAMuHMdXghAWmNJLUq_uOUVPrrNTAcFq=QqCGjLU51FchvOu3=g@mail.gmail.com>
 <6a8d9a6c-5281-88d2-51ae-e2afad847a8f@microchip.com>
 <CAMuHMdVBguF4ZQHTqwr6GAJKuUcvBGu-5p0GeYRmZ3dG8tXa2g@mail.gmail.com>
In-Reply-To: <CAMuHMdVBguF4ZQHTqwr6GAJKuUcvBGu-5p0GeYRmZ3dG8tXa2g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P189CA0032.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::45) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 34ab72bc-b8be-412b-861d-08d6d469865c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:BN6PR11MB1459; 
x-ms-traffictypediagnostic: BN6PR11MB1459:
x-microsoft-antispam-prvs: <BN6PR11MB1459E8346E1940772A50ED16F0330@BN6PR11MB1459.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-forefront-prvs: 003245E729
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(39860400002)(396003)(376002)(346002)(366004)(51914003)(199004)(189003)(316002)(73956011)(14444005)(256004)(66946007)(6916009)(5660300002)(72206003)(54906003)(6436002)(66476007)(53936002)(66446008)(64756008)(66556008)(2906002)(68736007)(31686004)(76176011)(478600001)(99286004)(31696002)(86362001)(52116002)(6116002)(8936002)(446003)(11346002)(3846002)(2616005)(476003)(486006)(6246003)(186003)(71200400001)(8676002)(305945005)(71190400001)(6506007)(386003)(81166006)(4326008)(26005)(6512007)(53546011)(102836004)(7736002)(66066001)(6486002)(36756003)(14454004)(229853002)(81156014)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1459;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LnSn1S7ksA9FGYRGhHIUOY7rEnJ3sxlGRRHMCoNy1/MgdWIOXkhfxLYilEDcZKjtpOJNqBMjXRoBWniB4nkc3jN0nhGPgZYmIqxrwmMzb6VwsnR89E7ZR4OUN2Pzm7nCv1c69MWYyHv5jeku3gQRcBwLjtSmi7DZ+R0om11Ul5jORHG17gfL/9tDAsDh2fhR02h2Sg7pqKqpcTqxVSxqdNqlC6tfMhGWGGDXrlBw8UFn9LvjixLC9QycMwoFY5TqpuCKmlR7E9/JuPta8pvZx7s4x8E9nzqJBBSW/rErgXMndXmcMHSININayaBIV9Z6bd6sJeOqBFP115eIZYFRylVw6n0JH3T+yCv3VKYBx3SpoFwJaSdGuHw7YLHWGKCr2ZgW8qp3Vxvr/RCHWxd2GzQ0x9+u2wOcu5AduUh+md8=
Content-ID: <10A2E6B549FB8E46BCE5CD44D1D59F4E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 34ab72bc-b8be-412b-861d-08d6d469865c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2019 10:31:41.2500 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1459
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190509_033148_179072_A9E83BED 
X-CRM114-Status: GOOD (  14.46  )
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
Cc: linux-renesas-soc@vger.kernel.org, jonas@norrbonn.se,
 linux-mtd@lists.infradead.org, marek.vasut+renesas@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Geert,

On 05/09/2019 12:11 PM, Geert Uytterhoeven wrote:
> External E-Mail
> 
> 
> Hi Tudor,
> 
> On Thu, May 9, 2019 at 8:56 AM <Tudor.Ambarus@microchip.com> wrote:
>> When the configuration register QUAD bit CR[1] is 1, only the WRR command format
>> with 16 data bits may be used, WRR with 8 bits is not recognized and hence the
>> FFs. You probably set quad bit in u-boot, while others don't. We can verify this
>> assumption with the patch form below. Can you try it?
> 
> Thanks!
> 
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
> 
>> +static int spi_nor_clear_block_protection(struct spi_nor *nor)
>> +{
>> +       int ret;
>> +       u8 sr, cr, sr_cr[2] = {0};
>> +       u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
>> +
>> +       ret = read_cr(nor);
>> +       dev_dbg(nor->dev, "CR = %08x\n", ret);
>> +        if (ret < 0) {
>> +                dev_err(nor->dev, "error while reading CR\n");
>> +               return ret;
>> +       }
>> +       cr = ret;
>> +
>> +       if (cr & CR_QUAD_EN_SPAN) {
>> +               /* disable quad if already set, must do it with 16-bit WRR */
>> +               ret = write_sr_cr(nor, sr_cr);
>> +               if (ret) {
>> +                       dev_err(nor->dev, "error diasbling quad mode\n");
> 
> disabling
> 
>> +                       return ret;
>> +               }
> 
> renesas_spi e6b10000.spi: DMA available
> renesas_spi e6b10000.spi: registered master spi0
> spi spi0.0: setup mode 3, 8 bits/w, 30000000 Hz max --> 0
> m25p80 spi0.0: bfpt.dwords[1] = ffffffff
> m25p80 spi0.0: bfpt.dwords[2] = ffffffff
> m25p80 spi0.0: bfpt.dwords[3] = ffffffff
> m25p80 spi0.0: bfpt.dwords[4] = ffffffff
> m25p80 spi0.0: bfpt.dwords[5] = ffffffff
> m25p80 spi0.0: bfpt.dwords[6] = ffffffff
> m25p80 spi0.0: bfpt.dwords[7] = ffffffff
> m25p80 spi0.0: bfpt.dwords[8] = ffffffff
> m25p80 spi0.0: bfpt.dwords[9] = ffffffff
> m25p80 spi0.0: bfpt.dwords[10] = 00000000
> m25p80 spi0.0: bfpt.dwords[11] = 00000000
> m25p80 spi0.0: bfpt.dwords[12] = 00000000
> m25p80 spi0.0: bfpt.dwords[13] = 00000000
> m25p80 spi0.0: bfpt.dwords[14] = 00000000
> m25p80 spi0.0: bfpt.dwords[15] = 00000000
> m25p80 spi0.0: bfpt.dwords[16] = 00000000
> m25p80 spi0.0: failed to parse BFPT: err = -22
> m25p80 spi0.0: spi_nor_init_params sfdp parse failed, ret =-22
> m25p80 spi0.0: SR and CR before quad_enable:
> m25p80 spi0.0: SR = 00000000
> m25p80 spi0.0: CR = 00000002
> m25p80 spi0.0: SR and CR after quad_enable:
> m25p80 spi0.0: SR = 00000000
> m25p80 spi0.0: CR = 00000002
> m25p80 spi0.0: s25fl512s (65536 Kbytes)
> m25p80 spi0.0: mtd .name = spi0.0, .size = 0x4000000 (64MiB),
> .erasesize = 0x00040000 (256KiB) .numeraseregions = 0
> 3 fixed-partitions partitions found on MTD device spi0.0
> Creating 3 MTD partitions on "spi0.0":
> 0x000000000000-0x000000080000 : "loader"
> 0x000000080000-0x000000600000 : "user"
> 0x000000600000-0x000004000000 : "flash"
> renesas_spi e6b10000.spi: registered child spi0.0
> renesas_spi e6b10000.spi: probed
> 
> And /dev/mtd0 reading works fine.
> Thanks!
> 

I'm glad that it worked, thanks for the help. I'll do a patch to fix this case,
but probably it will qualify for -next. Is -next ok for you?

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
