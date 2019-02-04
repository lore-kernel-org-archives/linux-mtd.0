Return-Path: <SRS0=dO6W=QL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 010C2C282C4
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 12:42:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1ACC2087C
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 12:42:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aSI2JGNJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=prevas.se header.i=@prevas.se header.b="RcUol1NA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1ACC2087C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=prevas.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0sGV1xLpbBh6LMc5Z8H50flW7Z6NqiTE4Q3NzM4c/1o=; b=aSI2JGNJShGk8e
	KNP3QOQaCpo7jd4LrR8kHD3ymnYDLn8YJntb/GV+6CJJh7DAU47+jxDjKI7+3yKEe/xBTU5CnGQoy
	RcUIDnzACFXgcn/hmn7tfs8f1UpnMUsHWtSZurqzG41xl70wD4BcLN52XmyGqlbuE4joySgPxBHkZ
	7w0ZDrF6pJZ2jkeqdL6sHsYQ+zNf/eMKUW2F6Uybkb9izFr9x0bw45vrXj0wGaHvH7Qp3fSUSqgUk
	PHoK/ttzI7GyL6cnHtT8vNbWf+gAvMen7icHYV4ptkQ6H7m4ChV9lgjyR/790iDrc/XLL+HdVtSVw
	N/4E/bQd2IxW24ooTqyw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqdaL-0004gM-IC; Mon, 04 Feb 2019 12:42:49 +0000
Received: from mail-ve1eur01on072c.outbound.protection.outlook.com
 ([2a01:111:f400:fe1f::72c]
 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqdaI-0004fx-JN
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2019 12:42:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.se; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IG/ho2lmuNFaYUBQLbDo0+S83MznYbnBf2GnI+H3bqs=;
 b=RcUol1NAkkUwyEgdyzU+O02EqfOBpVgtSF466qVZlrU2R9bH4DmIQFDA6eJSHF6PrqVJz8FjhnNUBFXTqxv8M3IvnKcqT/HlgY0pSgvU/LQ8Wxp1UABtWEZICjFWZj3mWdyp35+U5Jf5rLGMlaEU+pgGNVBXZl/PMGesRIkRlhw=
Received: from VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM (20.178.126.212) by
 VI1PR10MB2239.EURPRD10.PROD.OUTLOOK.COM (20.177.62.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1580.22; Mon, 4 Feb 2019 12:42:40 +0000
Received: from VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::d49:d85b:58bf:cd5b]) by VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::d49:d85b:58bf:cd5b%6]) with mapi id 15.20.1580.019; Mon, 4 Feb 2019
 12:42:40 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: Boris Brezillon <bbrezillon@kernel.org>
Subject: Re: subpage reads/writes with fsl_elbc_nand driver
Thread-Topic: subpage reads/writes with fsl_elbc_nand driver
Thread-Index: AQHUuXCmx5juTY/djEmkcxSv7BQPyqXJjGeAgAYO7oA=
Date: Mon, 4 Feb 2019 12:42:40 +0000
Message-ID: <0e9a5c9f-03ba-79e0-f170-39b6ffb353d8@prevas.dk>
References: <add8754e-e044-a6d7-2ead-067777afbde4@prevas.dk>
 <20190131165558.59ed85ea@bbrezillon>
In-Reply-To: <20190131165558.59ed85ea@bbrezillon>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1P191CA0003.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::13)
 To VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:e3::20)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Rasmus.Villemoes@prevas.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [81.216.59.226]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; VI1PR10MB2239;
 6:VYT1TsSul3VckdboMYIt2SRsoQUgO0Et4PqN2zexNgVJ7RhzF7zVhJNPZ4wuma9G1F0yuOrEm2Z5CJv0uF4rVjf09HpfWG2f0foJFfzCssO+36aJL/sMOrZVa5YMyiv2TeUrksNieXy06rZ8ac/3Gvo9kd+5WiU/RqAETXWizt0fRhyKfOc4dmFCVill979kZ7QQUpT7McaVgJPQCaLajgS9NEFnepQDY4WT0wxvAp+YjV9rj6fTrhKJP5cY2+k4ZWBnSTnST9pA/zgzpFUlXFXR3o9onWq1kQ94ca+sMW0X5BaGkj+BPNHXIWITsNb7GCcmUOwyWd1VxXFXr7M4/+t9THY3CYK/ZhI6NQ0wzvvzq6ayFAM3jUVzRyt177jgmH/V6bszdQu/VfPgFcAAX/bPRwwEz0Sd53VEPBlbMe6BNWo/vvbVeW6KHtEMsF4Qg+/MVWRv4AF+WDBLnuhSfQ==;
 5:xLqAA/5Y9mnd+mEQrAPySSpCJjvxOlMwvw7t73EN56Qlx2E/bIOC+Edn8VZ0eDtPrINmKmODvspIXIfjKGIc/9Q1/pqW+UP0t6pUtYt8ES6vilAyMhQK3Pzkk4tf7OkVDvMTGfSokNA3Ixp4F8AfitjJxWJk1ptBGXz53hjR3DPmevBfhwDzjND1D44IiQEsRQxWU/klIwROFAKBr3Tn8w==;
 7:a5XPQ8+3aHbX0huX0JCp+g3wcupaHADBeaH34nzLJdZbAueisqSNALVz77ZBqC6cLWTARArjBULOVnvZgvf03t3XNSFQacE7/GT+n2DvYTAdRb920qMyNV5RgDLp0f7tFpNe9405FqQBMhiOAm11TQ==
x-ms-office365-filtering-correlation-id: d6814e85-340b-4d57-6ffd-08d68a9e3fde
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
 SRVR:VI1PR10MB2239; 
x-ms-traffictypediagnostic: VI1PR10MB2239:
x-microsoft-antispam-prvs: <VI1PR10MB2239FEB0C8868190660155378A6D0@VI1PR10MB2239.EURPRD10.PROD.OUTLOOK.COM>
x-forefront-prvs: 0938781D02
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(39850400004)(396003)(376002)(366004)(346002)(51914003)(199004)(189003)(6916009)(256004)(14444005)(11346002)(66066001)(31686004)(42882007)(186003)(26005)(316002)(8676002)(31696002)(2906002)(81156014)(6506007)(386003)(54906003)(36756003)(305945005)(7736002)(105586002)(102836004)(106356001)(6116002)(3846002)(72206003)(6486002)(44832011)(76176011)(6246003)(478600001)(6512007)(68736007)(14454004)(81166006)(71190400001)(52116002)(6436002)(71200400001)(8976002)(53936002)(229853002)(25786009)(74482002)(8936002)(4326008)(476003)(99286004)(2616005)(97736004)(446003)(5024004)(486006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR10MB2239;
 H:VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: prevas.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: c8CggkIeHnGc0nwx9dwW+hAea18gmFQ0XYp1XyjOP4FmXAicHuA6IEqr9WLAUS9xidPickaDfX8833E9HHIznj/1rmJzvO4yq78a/HIVEkBc13E9uOcYkg17ycsbxA5m5qDMfEi1OljJ5GJg9oOxne1Ju8h29DYZOy1ErQT/LLs+hWXiXM9aw1YmPnosXunrnvGXzQlmXfLWO18d1alf5fIeTQWmB71AmQ3vWArTMIL7E0M1BbO9yS6GMA/nAqC30pPk9qb32LVGmcs8TSt6G23Mplgsm4zYKUvMxQd86/Yzan7oMFApIQEIIoj56nwv50A/LBI51EKejIIlrgAT1ewSz86H5bvDFq04NKNl3N7Ua11C0JLmlxaqT5ZdpiE7MBUhTb01FQ/UYPRsJUt15W89MFol3rRfCj8YyVUeOGw=
Content-ID: <1E8E69C28DEE4E40AC7DEEE7150EE60C@EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: d6814e85-340b-4d57-6ffd-08d68a9e3fde
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2019 12:42:39.6399 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB2239
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190204_044246_686977_73C3F6EA 
X-CRM114-Status: GOOD (  12.76  )
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
Cc: Esben Haabendal <eha@deif.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "Per N. Christensen" <pnc@deif.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 31/01/2019 17.11, Boris Brezillon wrote:
> On Thu, 31 Jan 2019 14:24:15 +0000
> Rasmus Villemoes <rasmus.villemoes@prevas.dk> wrote:
> 
>> --- a/drivers/mtd/nand/raw/nand_base.c
>> +++ b/drivers/mtd/nand/raw/nand_base.c
>> @@ -6657,6 +6657,11 @@ static int nand_scan_tail(struct mtd_info *mtd)
>>                 pr_warn("WARNING: %s: the ECC used on your system is too
>> weak compared to the one required by the NAND chip\n",
>>                         mtd->name);
>>
>> +       if (IS_ENABLED(CONFIG_ML300PCM31)) {
>> +               pr_warn("setting NAND_NO_SUBPAGE_WRITE bit\n");
>> +               chip->ecc.write_subpage = NULL;
>> +               chip->options |= NAND_NO_SUBPAGE_WRITE;
>> +       }
>>         /* Allow subpage writes up to ecc.steps. Not possible for MLC
>> flash */
>> longer, but without the former the boot stops at
>>
>>     [    0.918927] ubi0 error: validate_ec_hdr: bad VID header offset
>> 2048, expected 512
>>     [    0.926549] ubi0 error: validate_ec_hdr: bad EC header
>>     [    0.931745] Erase counter header dump:
>>     [    0.935547]        magic          0x55424923
>>     [    0.939344]        version        1
>>     [    0.942359]        ec             9
>>     [    0.945373]        vid_hdr_offset 2048
>>     [    0.948610]        data_offset    4096
>>     [    0.951879]        image_seq      1882958541
>>     [    0.955678]        hdr_crc        0x1a47f3d3
>>     ...
>>     [    1.059976] ubi0 error: ubi_io_read_ec_hdr: validation failed for
>> PEB 0
>>     [    1.066669] ubi0 error: ubi_attach_mtd_dev: failed to attach
>> mtd0, error -22
>>     [    1.073824] UBI error: cannot attach mtd0
>>     [    1.083983] VFS: Cannot open root device "ubi0:rootfs" or
>> unknown-block(0,0): error -19
>>
> Just pass ubi.mtd=<part-name>,<page-size> on the command line. This way
> the VID header will be read/written from/to the second page instead of
> the 2nd subpage of the first page.
> 

Thanks for the quick response. I tried this, and the board does seem to
boot without the hunk above applied. Unfortunately, it seems to get
bricked after I write anything to the rootfs and reboot. I'll
investigate more thoroughly later, and also look into the conversion to
->exec_op, but for now I need to look into getting other parts of the
board working with a new kernel.

Thanks,
Rasmus
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
