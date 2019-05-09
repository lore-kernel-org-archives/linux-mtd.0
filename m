Return-Path: <SRS0=HSOd=TJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E264C04AB1
	for <linux-mtd@archiver.kernel.org>; Thu,  9 May 2019 06:56:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02B38208C3
	for <linux-mtd@archiver.kernel.org>; Thu,  9 May 2019 06:56:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r5faEZaA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="UGeVcimO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02B38208C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TEFVlJ5HO3xi9hyS4/6vKBsXaJoin9OtK63q5klTUTc=; b=r5faEZaAXPUofy
	Zf04/NFYm4oiE2bS4gaFw8nKFmwgYfufHdX3WS5ife5iBACihjzmS4307ey8ODOk+ftKA/k9rp3uP
	Az1K5O2WaQb84yr7AEBKMJdLvURStKqqzErBa/TkHoh7kvJWA/CN9LO43NQn6OrcmMa5FmgXJcBAl
	8zzZsli9DcUfexEWJxLG9q8Zvc/amlau6sYlUgFEaVsoo26DSb0+6JjxoWocfqiwZakmOfGzExAUV
	jo2/tfj6zYKhdKf6/+gjWX6wM8SEFhQ2oIFvBTMr0/JOccCG3AjhR4FT3ebB4esz8EH4sZ+D7Sxet
	+QXk1txO0dkC0gBrbodw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hOcyM-0006Pw-44; Thu, 09 May 2019 06:56:06 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hOcyG-0006MQ-9G
 for linux-mtd@lists.infradead.org; Thu, 09 May 2019 06:56:02 +0000
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
X-IronPort-AV: E=Sophos;i="5.60,449,1549954800"; d="scan'208";a="33900131"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 08 May 2019 23:55:58 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.106) with Microsoft SMTP Server (TLS)
 id 14.3.352.0; Wed, 8 May 2019 23:55:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oe7dDHG2g8b14wJU7UPUmNsjTT74HKZZmmnPoRfDUSs=;
 b=UGeVcimOZt3Dt+oIoVjMJpVPGIdfy+Wnw4aa2ZK8vm+svsZ6mGxoYlm2CSYuiKjXyUa77tt9eYkB2u3iyRvROarNEa/s2Rb5hKQTVpLJEBMs1LfuUEAf8yXFH84qug0vLAveIEsEf6h0c2zhueyLc0b3vdlpXOwBoPyf0rO641o=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1825.namprd11.prod.outlook.com (10.175.100.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.11; Thu, 9 May 2019 06:55:55 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::35b3:7af:7216:8808]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::35b3:7af:7216:8808%10]) with mapi id 15.20.1878.022; Thu, 9 May 2019
 06:55:55 +0000
From: <Tudor.Ambarus@microchip.com>
To: <geert@linux-m68k.org>
Subject: Re: [PATCH v4 2/3] spi-nor: s25fl512s supports region locking
Thread-Topic: [PATCH v4 2/3] spi-nor: s25fl512s supports region locking
Thread-Index: AQHU3uz1n9sAm8MvGUei5wsE+JArGKZft50AgAANmoCAAAIxgIAABqiAgAAbqwCAAAZdgIAAApsAgAATIoCAAVI2gIAAKTcAgAAUAICAACvcAIAA6X4A
Date: Thu, 9 May 2019 06:55:54 +0000
Message-ID: <6a8d9a6c-5281-88d2-51ae-e2afad847a8f@microchip.com>
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
In-Reply-To: <CAMuHMdXghAWmNJLUq_uOUVPrrNTAcFq=QqCGjLU51FchvOu3=g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0202CA0021.eurprd02.prod.outlook.com
 (2603:10a6:803:14::34) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d09a7c98-215f-4979-104d-08d6d44b616e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:BN6PR11MB1825; 
x-ms-traffictypediagnostic: BN6PR11MB1825:
x-microsoft-antispam-prvs: <BN6PR11MB1825FD164699D38AD87FB64EF0330@BN6PR11MB1825.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 003245E729
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(396003)(366004)(39860400002)(376002)(136003)(189003)(199004)(5660300002)(31686004)(66446008)(66556008)(73956011)(68736007)(64756008)(6506007)(66476007)(54906003)(66946007)(2906002)(229853002)(14454004)(6512007)(11346002)(6436002)(6486002)(486006)(478600001)(476003)(2616005)(446003)(72206003)(81166006)(8676002)(81156014)(26005)(186003)(305945005)(4326008)(7736002)(316002)(102836004)(53546011)(6916009)(66066001)(25786009)(99286004)(386003)(6116002)(76176011)(3846002)(6246003)(53936002)(52116002)(71200400001)(256004)(36756003)(14444005)(71190400001)(86362001)(31696002)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1825;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hkKXEhh6AHWGHAduiBRPsxtFiB+iYW0SlTndfpF9CLyyjnvv4M8twWjBMujEZvmMkGFwfRAtgqu28Q34qtDsCuYzvIlo7J13ZoWhzw4ZFKjo/s6Q7AkKkvhpFZjVlk4GA5f0s9XB0dKNjG54wu0JArdcaEpMD1aV1KNeCtMwmvySmsd7YlnQh5N4M8EK24bHdHITgsimnzhG3/iinoDlTmISUCgV+Oy3JKMwACvMRndRUr4vDFK0bS/J6B4PjYo+w9AMgHge73iO3xuPin7HiIWgc3Zgp4qaTf7Jxa0koEF2SI5krcbiv0tEZ4pBb0KUHaWNMfdJXVT0v3mOAUOpYn2YAPzpv++Q2JSQZomDYUN7j7xDJnUpNGzDJh0mUISXjZPmL4ACwh53uu6ZYRXIinBKBRVMH0v//McZ853JnpY=
Content-ID: <A9E160BB747C784A95708706E0EFDED5@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d09a7c98-215f-4979-104d-08d6d44b616e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2019 06:55:54.6917 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1825
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190508_235600_387205_3948F459 
X-CRM114-Status: GOOD (  18.20  )
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

On 05/08/2019 08:00 PM, Geert Uytterhoeven wrote:
> External E-Mail
> 
> 
> Hi Tudor,>
> On Wed, May 8, 2019 at 4:23 PM <Tudor.Ambarus@microchip.com> wrote:
>> On 05/08/2019 04:11 PM, Geert Uytterhoeven wrote:
>>> On Wed, May 8, 2019 at 12:44 PM <Tudor.Ambarus@microchip.com> wrote:
>>>> Would you run this debug patch on top of mtd/next? I dumped the SR and CR before
>>>> and after the operations in cause.
>>>
>>> Thanks, giving it a try...
>>>
>>>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>>>> index 73172d7f512b..20d0fdb1dc92 100644
>>>> --- a/drivers/mtd/spi-nor/spi-nor.c
>>>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>>>> @@ -22,6 +22,8 @@
>>>>  #include <linux/spi/flash.h>
>>>>  #include <linux/mtd/spi-nor.h>
>>>>
>>>> +#define DEBUG
>>>
>>> Should be moved to the top of the file, before dev_dbg() is defined.
>>>
>>> Result is:
>>>
>>> m25p80 spi0.0: bfpt.dwords[1] = ffffffff
>>> m25p80 spi0.0: bfpt.dwords[2] = ffffffff
>>> m25p80 spi0.0: bfpt.dwords[3] = ffffffff
>>> m25p80 spi0.0: bfpt.dwords[4] = ffffffff
>>> m25p80 spi0.0: bfpt.dwords[5] = ffffffff
>>> m25p80 spi0.0: bfpt.dwords[6] = ffffffff
>>> m25p80 spi0.0: bfpt.dwords[7] = ffffffff
>>> m25p80 spi0.0: bfpt.dwords[8] = ffffffff
>>> m25p80 spi0.0: bfpt.dwords[9] = ffffffff
>>> m25p80 spi0.0: bfpt.dwords[10] = 00000000
>>> m25p80 spi0.0: bfpt.dwords[11] = 00000000
>>> m25p80 spi0.0: bfpt.dwords[12] = 00000000
>>> m25p80 spi0.0: bfpt.dwords[13] = 00000000
>>> m25p80 spi0.0: bfpt.dwords[14] = 00000000
>>> m25p80 spi0.0: bfpt.dwords[15] = 00000000
>>> m25p80 spi0.0: bfpt.dwords[16] = 00000000
>>> m25p80 spi0.0: failed to parse BFPT: err = -22
>>> m25p80 spi0.0: spi_nor_init_params sfdp parse failed, ret =-22
>>> m25p80 spi0.0: SR = 00000000
>>> m25p80 spi0.0: CR = 00000002
>>> m25p80 spi0.0: Erase Error occurred
>>> m25p80 spi0.0: timeout while writing SR, ret = -5
>>> m25p80 spi0.0: SR = 000000ff
>>> m25p80 spi0.0: CR = 000000ff
>>
>> ff can mean that the lines are "in air", maybe the flash resets when we
>> write_sr(nor, 0)? How about adding a delay here to let the flash reset?
> 
> No difference after adding msleep(1000).
> 

When the configuration register QUAD bit CR[1] is 1, only the WRR command format
with 16 data bits may be used, WRR with 8 bits is not recognized and hence the
FFs. You probably set quad bit in u-boot, while others don't. We can verify this
assumption with the patch form below. Can you try it?

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 73172d7f512b..0d636eab3ebf 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -6,6 +6,7 @@
  * Copyright (C) 2005, Intec Automation Inc.
  * Copyright (C) 2014, Freescale Semiconductor, Inc.
  */
+#define DEBUG

 #include <linux/err.h>
 #include <linux/errno.h>
@@ -200,7 +201,7 @@ struct sfdp_header {
  *         register does not modify status register 2.
  * - 101b: QE is bit 1 of status register 2. Status register 1 is read using
  *         Read Status instruction 05h. Status register2 is read using
- *         instruction 35h. QE is set via Writ Status instruction 01h with
+ *         instruction 35h. QE is set via Write Status instruction 01h with
  *         two data bytes where bit 1 of the second byte is one.
  *         [...]
  */
@@ -2795,8 +2796,11 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 		return err;

 	/* Fix endianness of the BFPT DWORDs. */
-	for (i = 0; i < BFPT_DWORD_MAX; i++)
+	for (i = 0; i < BFPT_DWORD_MAX; i++) {
 		bfpt.dwords[i] = le32_to_cpu(bfpt.dwords[i]);
+		dev_dbg(nor->dev, "bfpt.dwords[%d] = %08x\n", i + 1,
+			bfpt.dwords[i]);
+	}

 	/* Number of address bytes. */
 	switch (bfpt.dwords[BFPT_DWORD(1)] & BFPT_DWORD1_ADDRESS_BYTES_MASK) {
@@ -3532,8 +3536,10 @@ static int spi_nor_parse_sfdp(struct spi_nor *nor,
 	}

 	err = spi_nor_parse_bfpt(nor, bfpt_header, params);
-	if (err)
+	if (err) {
+		dev_dbg(dev, "failed to parse BFPT: err = %d\n", err);
 		goto exit;
+	}

 	/* Parse optional parameter tables. */
 	for (i = 0; i < header.nph; i++) {
@@ -3576,6 +3582,7 @@ static int spi_nor_init_params(struct spi_nor *nor,
 	struct spi_nor_erase_map *map = &nor->erase_map;
 	const struct flash_info *info = nor->info;
 	u8 i, erase_mask;
+	int ret;

 	/* Set legacy flash parameters as default. */
 	memset(params, 0, sizeof(*params));
@@ -3681,12 +3688,15 @@ static int spi_nor_init_params(struct spi_nor *nor,
 		memcpy(&sfdp_params, params, sizeof(sfdp_params));
 		memcpy(&prev_map, &nor->erase_map, sizeof(prev_map));

-		if (spi_nor_parse_sfdp(nor, &sfdp_params)) {
+		ret = spi_nor_parse_sfdp(nor, &sfdp_params);
+		if (ret) {
 			nor->addr_width = 0;
 			nor->flags &= ~SNOR_F_4B_OPCODES;
 			/* restore previous erase map */
 			memcpy(&nor->erase_map, &prev_map,
 			       sizeof(nor->erase_map));
+			dev_dbg(nor->dev, "%s sfdp parse failed, ret =%d\n",
+				__FUNCTION__, ret);
 		} else {
 			memcpy(params, &sfdp_params, sizeof(*params));
 		}
@@ -3908,9 +3918,86 @@ static int spi_nor_setup(struct spi_nor *nor,
 	return 0;
 }

+static int spi_nor_dump_sr_cr(struct spi_nor *nor)
+{
+	int ret = read_sr(nor);
+
+	dev_dbg(nor->dev, "SR = %08x\n", ret);
+        if (ret < 0) {
+                dev_err(nor->dev, "error while reading status register\n");
+                return ret;
+        }
+
+	ret = read_cr(nor);
+	dev_dbg(nor->dev, "CR = %08x\n", ret);
+        if (ret < 0) {
+                dev_err(nor->dev, "error while reading configuration register\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int spi_nor_clear_block_protection(struct spi_nor *nor)
+{
+	int ret;
+	u8 sr, cr, sr_cr[2] = {0};
+	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
+
+	ret = read_cr(nor);
+	dev_dbg(nor->dev, "CR = %08x\n", ret);
+        if (ret < 0) {
+                dev_err(nor->dev, "error while reading CR\n");
+		return ret;
+	}
+	cr = ret;
+
+	if (cr & CR_QUAD_EN_SPAN) {
+		/* disable quad if already set, must do it with 16-bit WRR */
+		ret = write_sr_cr(nor, sr_cr);
+		if (ret) {
+			dev_err(nor->dev, "error diasbling quad mode\n");
+			return ret;
+		}
+
+		/* read back and check it */
+		ret = read_cr(nor);
+		if (ret >= 0 && (ret & CR_QUAD_EN_SPAN)) {
+			dev_err(nor->dev, "Spansion Quad bit not cleared\n");
+			return -EINVAL;
+		}
+	}
+
+	/* Clear BP bits with 8-bit WRR */
+	ret = read_sr(nor);
+	dev_dbg(nor->dev, "SR = %08x\n", ret);
+	if (ret < 0) {
+		dev_err(nor->dev, "error while reading SR\n");
+                return ret;
+	}
+	sr = ret;
+
+	ret = write_enable(nor);
+        if (ret < 0) {
+                dev_err(nor->dev, "error on write enable, err = %d\n", ret);
+                return ret;
+	}
+
+	ret = write_sr(nor, sr & ~mask);
+        if (ret < 0) {
+                dev_err(nor->dev, "error on write_sr, err = %d\n", ret);
+                return ret;
+	}
+
+	ret = spi_nor_wait_till_ready(nor);
+        if (ret)
+                dev_err(nor->dev, "timeout while writing SR, ret = %d\n", ret);
+	return spi_nor_dump_sr_cr(nor);
+}
+
 static int spi_nor_init(struct spi_nor *nor)
 {
-	int err;
+	int err = 0, quad_err;

 	/*
 	 * Atmel, SST, Intel/Numonyx, and others serial NOR tend to power up
@@ -3919,18 +4006,38 @@ static int spi_nor_init(struct spi_nor *nor)
 	if (JEDEC_MFR(nor->info) == SNOR_MFR_ATMEL ||
 	    JEDEC_MFR(nor->info) == SNOR_MFR_INTEL ||
 	    JEDEC_MFR(nor->info) == SNOR_MFR_SST ||
-	    nor->info->flags & SPI_NOR_HAS_LOCK) {
-		write_enable(nor);
-		write_sr(nor, 0);
-		spi_nor_wait_till_ready(nor);
+	    nor->info->flags & SPI_NOR_HAS_LOCK)
+		/*
+		 * this should be done only on demand, not for every flash that
+		 * has SPI_NOR_HAS_LOCK set
+		 */
+		err = spi_nor_clear_block_protection(nor);
+	if (err) {
+		dev_err(nor->dev, "clearing BP bits failed, err = %d\n", err);
+		return err;
 	}

 	if (nor->quad_enable) {
-		err = nor->quad_enable(nor);
+		dev_dbg(nor->dev, "SR and CR before quad_enable:\n");
+
+		err = spi_nor_dump_sr_cr(nor);
 		if (err) {
-			dev_err(nor->dev, "quad mode not supported\n");
+			dev_err(nor->dev, "dump_sr_cr before quad enable fail, err = %d\n", err);
 			return err;
 		}
+
+		quad_err = nor->quad_enable(nor);
+		dev_dbg(nor->dev, "SR and CR after quad_enable:\n");
+		err = spi_nor_dump_sr_cr(nor);
+		if (err) {
+			dev_err(nor->dev, "dump_sr_cr after quad enable fail, err = %d\n", err);
+			return err;
+		}
+
+		if (quad_err) {
+			dev_err(nor->dev, "quad mode not supported, err = %d\n", quad_err);
+			return quad_err;
+		}
 	}

 	if (nor->addr_width == 4 && !(nor->flags & SNOR_F_4B_OPCODES)) {


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
