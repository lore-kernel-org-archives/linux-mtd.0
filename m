Return-Path: <SRS0=zmx6=62=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C255BC54E4A
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 08:21:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A92320674
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 08:21:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CKLvrTRx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="azk3QugB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="jYcKZqnH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A92320674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z4a9zosbgyQ9ysjx/md3a7jgfyM2HukrEFLAV8g54vs=; b=CKLvrTRxhOwe+V
	Mqz/OVI6z2Sa1vPrUR7g3B26HNUomSyv/mbmXDj1cY+wxR7o1UOPsTP0vKT/e4zknddkgqsm3XZeA
	TOY2r2OEcU46u89rveRsdIWYPicA1v1Nv62alUsimHswvtRK5JSC/v2qGGoVPFvRTTRFxBmcsYsXs
	xke49Hvg8e+6fF+ZfUJNGZESdxWZZ/9eL4pJDM1FvVjPaFrJ1brmrPG1e3uxRYmLwM5QU6s/8vJW6
	TM69XNdgiEsOGpUEWasjl2KDqyK31LD1ALHSrRxxR01HJ++422EeAjwE9L6ULUZHsT6xYiWdxraWm
	0/Nczr/YzId0m9wH0lVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYQA0-0008NH-Mj; Tue, 12 May 2020 08:21:08 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYQ9w-0008Mg-85
 for linux-mtd@lists.infradead.org; Tue, 12 May 2020 08:21:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1589271663; x=1620807663;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=4SnxzzdOrjAYCxR1gfjm4F3ozW6OzunOINQsRLUWqFA=;
 b=azk3QugB0FVgUMZJeQ3zh4nu8G2puc8VmsBX8yvYGptGaYzMsRut/LiQ
 Qvmv7SHdSnhGuQcwtNY5Jb89NbTq68tme3kwTXIqgGeyu7L1q3H6iXNd3
 OOqhjvvXvocgVpRteivahdB+2H8zcGPKPTDZWu4kkQjXDsErqVEl56ZwL
 MdUTiLIBXATKEvu7UdUq/fNLeyLekB2A6mRxhyPylycBx5P7mA99ZGRNR
 Hs5kA+TJBpn+MD6c9oasYp2Xzgg0tR8d8g+wVP3T9EJ0iqHIAUPs8R1bb
 TfhhZpSYTTvYyrGf3J/FvswEZoP79Wr7X4r8bX/WF8fDPe7TJ67MiHZqy w==;
IronPort-SDR: zhPxSJLRnO/x3MbpIPvv3HXmcO5bWnvmLwmUPhVZf9XDksSE2QzhvkIu4zqtfH6rEP04wv3Fim
 S2y//wcsyvUvG3Xu9B4+hlmQyu9yPRHn7lVV256ICDHp7VzMEjdQDwEjEDFYyhgR0m7j9W9F6d
 4h/2s0y2YzKjuUPK3fOLeF7dzAYtDLO5ZZ5TS+nYB6Q3q8y5Z8x5MZwDq7FbXIJyvswBZT7aHG
 ZKKALsZA7qRGIHpoqfg3zT0DGk6I8zLgJ6fmE7TAcG27tdHbt5sjOyy7XCrUk0FRGuZ5PVvUJJ
 FVA=
X-IronPort-AV: E=Sophos;i="5.73,383,1583218800"; d="scan'208";a="74966211"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 12 May 2020 01:21:01 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 12 May 2020 01:21:03 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 12 May 2020 01:21:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iKghqORpPIJXoDkgI58eOB2G5EkXAh4KgPtkgZ4qpE4zqW4XLGJJm1Yr5vHvw0VwHyQQNgqWRkIE9a16DTHuzV7eSqzMOOeJCt5reGov2sAZmEPzGnGQMEW8a+flPo/ZLk9jziY9sP4wJnEMY35DDvA/htuo3ighJ2pnm8gKhCskdlhwrYCDRtLMDkOOvwy2n6b62TwYJ26mwmciB67tP49GWD23VJFCAovkGWYV8lPu8cKrmBhYyzAQyMIEC/2XhN0rTuTm7DdDVX1BQGQegNR3awWahpV6mgWcLpvs9Dcx4wydcZbaWnIDv+CNl+Pdx45smacY9Pi582FqFgWODg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KWsLLFOtGouDXeeZFPDVC1hjal53MZ7S9pCMjIeeGRY=;
 b=fVUmb0JQmUluH9ZQbvvPnV7S1Ry1m1NOIn7hVDhZnycqGaV9kQp/dcpgUU19hvqNkb11y5ursmq6QmAcviSeJPvHchQ1o40kp7vnbNJXlKx4hmfNHVAh3mWTaKuY2Ipbgl8qQVfHFpdBCQxpVYQVBUQMQq3F0EFMiQtHJy64TDudPXflBX6oHBLicDt4gq2ryoY8ht+46aZw5i4O5KO6WWrbxaDGWWE8zXjsqRD+/9gnwaGRyKrVt0kfK2GBtft4GhBDOjwjbk9kSutjYfWEI4iM/4DXyiaCOnKcJDwoEjc5dYdE5QOpFmWzrxuKr01B2YYwThF+Aq6aS+QzyCp47w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KWsLLFOtGouDXeeZFPDVC1hjal53MZ7S9pCMjIeeGRY=;
 b=jYcKZqnHxaSLW8/kzSjZFVpEB73iLUdWuRyIiSIk8Ln3onWjo03W1R62O4AKolX+3RYx8+iOR9mFkL68ze6pqF203GJAjObBi1WdHL4r9+M+h0emWHYCVWE1ecLhibRKYwLz7qlRhwgR1weilREn1S5dlEyW1TndxMCN7NpZ3As=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB3973.namprd11.prod.outlook.com (2603:10b6:a03:185::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.34; Tue, 12 May
 2020 08:20:59 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536%7]) with mapi id 15.20.2979.033; Tue, 12 May 2020
 08:20:59 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2 0/6] mtd: rawnand: atmel: Convert the driver to
 exec_op()
Thread-Topic: [PATCH v2 0/6] mtd: rawnand: atmel: Convert the driver to
 exec_op()
Thread-Index: AQHWKDZEn6FyQpVROEGLJCooPb1NSw==
Date: Tue, 12 May 2020 08:20:59 +0000
Message-ID: <9746929.hYsEJGkLLB@192.168.0.120>
References: <20200429132046.583658-1-boris.brezillon@collabora.com>
In-Reply-To: <20200429132046.583658-1-boris.brezillon@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: collabora.com; dkim=none (message not signed)
 header.d=none;collabora.com; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ad8e4179-b116-45a9-c3b6-08d7f64d66ed
x-ms-traffictypediagnostic: BY5PR11MB3973:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB3973A9906003CCF34CD06C1BF0BE0@BY5PR11MB3973.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:1360;
x-forefront-prvs: 0401647B7F
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j3EswTXkwdhnRHfAJST7PAQKZ88Wo5u7rT9aZh/qxQvMiMnGuIgYYQ0RnsmASN5M/y+P3kaupPWhvismTeXxx+QHc5hYJ1XgDWjYkCLRo65KyhwFX+ce1rrV02mZHGTXVnUZxaSecRFqJteP/ufcrxjKhWQhVVkzXZH4VHP/a+RuqlOqM1BcRrexXCvbbSGsgsXdlguLtwYBdIHau53jB0J16Z5HH9kNh7NOvZTZ4PF3aKqldUJ3z7t7Yy6slCdMS43qplaACGclma6a0fIlmd9DnoZYzuSZ+HaLT1tPdgroj38BL9WZV3RTSH/qvCGEYmnVtN1RrntujMkgzZ4sq1wPamxJLiEldKQpI9BL/VJZ/YIko78iEEXiD3SIcgB4gZh0FSOuQkEu33HOV5pk6SMhm7qW/022hB92XMrmvQULAMXHtDN6kGEkJhHF98kunwWJp0/TjyoukKbOFfHQcBZ6lkzu2sgNXnSrEfbfgMb0VvAKG2B7tYUHHOq3bnq9JeHiVf6I8Fw8MmdPuubyI2EW25IYbtY2m5AWainXxygVhvorLM0tcE+XKa8PyJd1h0CG7xzEaHrn402tVx3WDg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4419.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(366004)(346002)(136003)(39860400002)(396003)(33430700001)(71200400001)(186003)(8936002)(26005)(6512007)(14286002)(9686003)(53546011)(33440700001)(6506007)(8676002)(6916009)(76116006)(6486002)(5660300002)(66446008)(66476007)(2906002)(316002)(66946007)(91956017)(478600001)(54906003)(66556008)(64756008)(4326008)(86362001)(473944003)(414714003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: jYSWgVOiLGj/pGqQDW3PcIctoIjO1rzIQUsV8gWw0c17c9/4eV8x+IRyEB3/KO0RyIB762aU3T556cQWrF8juper6eWJbbrOrG2qXCLgpB8awzOLoC3fB48W5bKK9WokYIsM+0BsAWeA5/iLYIflgpQsdWC/FrqZ6PXFVSphWhIS4CmuZGESQOxgaPXDgqFs7uB5aHdtU7vBr6tYFURKrW5PEufq4sAQfgKSMFq2yu5NkGs4zL5rhe/2VUV+4dirCU87X/9acV9R71IGM4hshdkvFMKcr3RWO4pYQpj1wK07vVgzCqs1hWSXMimDG8jmCCR9h9ad8Z0SIupniGGPdsx2VXaiWZMFIecN+HgtFqsorihGAC3qg9YvP8RwaE5uWbKFBUt1SrJjBKPNL1nanqwNoC+BQBuiXfxeClhSuSD/h281ylC9OkSqm/c02V58P0Ij5AmBpFYozJvSxXvqJZ4zph7zU8vhFTDAHobyDaw=
Content-ID: <C705C91E127EF74885B53810DBFBD364@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ad8e4179-b116-45a9-c3b6-08d7f64d66ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2020 08:20:59.5007 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AiMa4pyefC/+lJgKCljhowDl8GoCwag2Rkq8DC8wowI46nrI+W7WhAlXXn0wpjpJcgJIJlu68knrScmFuj4CmWSw5lYhJvWAWfe/GRW8YGs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3973
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_012105_500166_AD485F35 
X-CRM114-Status: GOOD (  14.61  )
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
Cc: alexandre.belloni@bootlin.com, vigneshr@ti.com, richard@nod.at,
 Nicolas.Ferre@microchip.com, Ludovic.Desroches@microchip.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Boris,

On Wednesday, April 29, 2020 4:20:40 PM EEST Boris Brezillon wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the
> content is safe
> 
> Hello,
> 
> This v2 splits changes to make the diff more readable and fixes a bug
> reported by Tudor (thanks for testing/helping me debug the issue BTW).
> Note that the patch propagating the CS information to sub operations
> has been dropped since the new version no longer depends on it, but
> will be posted as part of another series where it's needed (the
> cafe_nand conversion).
> 
> Regards,
> 
> Boris
> 
> Boris Brezillon (6):
>   mtd: rawnand: atmel: Enable the NFC controller at probe time
>   mtd: rawnand: atmel: Drop redundant nand_read_page_op()
>   mtd: rawnand: atmel: Use nand_{write,read}_data_op()
>   mtd: rawnand: atmel: Use nand_prog_page_end_op()
>   mtd: rawnand: atmel: Convert the driver to exec_op()
>   mtd: rawnand: atmel: Get rid of the legacy interface implementation
> 
>  drivers/mtd/nand/raw/atmel/nand-controller.c | 464 +++++++++++--------
>  1 file changed, 258 insertions(+), 206 deletions(-)
> 
> --

I got a -ETIMEOUT when trying to write to the NAND flash on sam9x60eK
# nandwrite /dev/mtd11 1M
Writing data to block 0 at offset 0x0
libmtd: error!: cannot write 4096 bytes to mtd11 (eraseblock 0, offset 176128)
        error 110 (Connection timed out)
nandwrite: error!: /dev/mtd11: MTD write failure
           error 110 (Connection timed out)
nandwrite: error!: Data was only partially written due to error
           error 110 (Connection timed out)

On sama5d4_xplained I did the following tests:
1/ check erase, write, read: OK
flash_erase /dev/mtd5 0 4
dd if=/dev/urandom of=1M bs=1M count=1
nandwrite /dev/mtd5 1M
mtd_debug read /dev/mtd5 0 1048576 read
sha1sum read 1M

2/ mtd_speedtest: sama5d4_xplained: 10% write speed drop
before:
mtd_speedtest: eraseblock write speed is 6468 KiB/s
mtd_speedtest: testing eraseblock read speed
mtd_speedtest: eraseblock read speed is 10330 KiB/s

after:
mtd_speedtest: eraseblock write speed is 5728 KiB/s
mtd_speedtest: testing eraseblock read speed
mtd_speedtest: eraseblock read speed is 10261 KiB/s

3/ rootfs on NAND. I could read/write reliably from the flash. Rebooted the 
platform and checked that no corruptions happened after write accesses.

Cheers,
ta



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
