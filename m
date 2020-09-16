Return-Path: <SRS0=QbZc=CZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 810DFC43461
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Sep 2020 09:37:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2427F2220F
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Sep 2020 09:37:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uxr9AcWA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="XZDcQD9P";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="o32TrEK4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2427F2220F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nuNkvER3jdnMIjM+Gfv/rvDcsw3kqgG4ZsyFCaBWlu8=; b=uxr9AcWA2e0qB0p96EpdYxino
	oSTw1ogMcsSM9GJVXTiB+Azhpjfar2uAATkSxF88o9tnmIHJqT9GoLCae1wwac9UuE9m4IT6XL6HD
	Orn9qoXbBNfHVu9j4T6S+GR9QzwiBtzTd0hehmH+Uh5oWWZk4u9NO+FfQte+wFCtglL/I3RZfRXSm
	IKJOlhjQwiDA+Ew5yhtnkpFTm8hHnnnWGyMRwr5qIpekOP7nLMZScnLSDfHFTViW2ve+fIO9B80nF
	RNVDn5pN+fl2OKFdsJR3uVHmrwosFGdnYp4GeO9a+QVUVESRpfukX8anY5Pknstnzhuj9sUcVIQ1e
	raLW2OEQw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kITrY-00026c-55; Wed, 16 Sep 2020 09:36:28 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kITrV-000265-4e
 for linux-mtd@lists.infradead.org; Wed, 16 Sep 2020 09:36:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1600248985; x=1631784985;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=FgldDGaeYa0tYIh2F4rl+Za7Ta9yuiNoTF+KMVTSebY=;
 b=XZDcQD9PjV5QQoJjNuDGDOOls/PafFc5kity3ppq+Iv08Lx4/4B1Dtwc
 WVSB3aowemb452GOPmSGKA8J7pqv7f/YlgBuLBwt9TWplKimaCYsITU+4
 u3kCjomudNA2vDsYKqpoqf6Oek+IVNtRDFp7KnSAl1eo2tUMOR3TM6Yi2
 +ZRhwhEU8DxfBgzXulPrpUMPTRM/wfha/8PldTIuRESfLV+qhUX4reHLq
 42qSWRxQfNTa/zJ+HwggrPqrVAXgwnfVDzqENYXTLQqjWtOCHq7Ptsk7g
 OqGVhq4zQMxanhBciF30n2T7BFfWmANR4mP56Q2UcV8AI8BghVxzsShf8 Q==;
IronPort-SDR: 6EZflJUx3YdCQaoPL5zoSAHrxklQ7UFTHO8UUuqyuNxaAF6eTb6kC+YiJRiXue5pnxojDA/rMZ
 0E40DJCqKPeNZgHoTU0ji40YO4eXTxG20Kzn0CxlHLrasbd5vM57yZkB2G84srcYTuVyq0vtff
 njBupGywA3a36jBfP3Az0Qt7p6LapFeoef3T1UpxMnuia4k5dDrxUwLT++h9qlTP1sqvMdzlQP
 iBojGsmseGvjfWSdi/KGi5zME7O1YvquZX2bSjAEnrsswhhrje0SSJFUTrwtkpPvZZ8lJYLIXF
 RSg=
X-IronPort-AV: E=Sophos;i="5.76,432,1592895600"; d="scan'208";a="26587040"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 16 Sep 2020 02:36:21 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 16 Sep 2020 02:36:05 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Wed, 16 Sep 2020 02:36:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YhjTAIPFLlA9/ayJLd9fMRQOdg0C1gdTxMEOZyJcBT7SIMb+lHLbBzOSrTKbtE8BW8bX5k3VhCcLAs339w0SlJyEcnlFG2rMXRE4zg/XALQ0f23heu1xrRDE3AYqxRywO5k8Okq6NP9V7Wm4xvfulRzCi/B2ufszL0poP5DjrE7X2edMSFm4LCK2BJmWgL2FoN6ej1I/hTAYaqn7hBIQbZQvO1pgx/JvoOVh6+fZSa8+H1z7s7wrmZF0ONDkfh4IF8hHLdelOn1n7Li/LpTTuX9KSG0Tad8CFqTBCXUa74mXw1r3DynR7przoyXLwuBaBnzAIaoZoFw9Q14mFaViHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FgldDGaeYa0tYIh2F4rl+Za7Ta9yuiNoTF+KMVTSebY=;
 b=RQ4ZaBxELiDSTKlIgaYFvH+AiaviwR27YriJ/SCGomZPhO+I/TZz8s/hvi3MINK7sx16GLdnUYCw5dS8P4IrWme/8e15JZjKSQnRifPw/hWwwNIDB+fKTl1v4Q1PAdBD9Zm1II78aLd0ISaBRBUilpsyXgYSWELXpGld9VZ2oePws3WlydCh283aSxyS0ZW20kKzI4KqP1uW2N6zPPoum8pKdCdYdbUeM+8ENZFsesBMqz5H6sJjQP283GTNyh+F1JjQlsVu4fPP8M7OywH4vhk0yYrG68oxxDjLilYqMZMTx29352+20A4kq+S3La62tE2uOmq3xuZIx+e17Kd/yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FgldDGaeYa0tYIh2F4rl+Za7Ta9yuiNoTF+KMVTSebY=;
 b=o32TrEK49rRq6q0GNopM4zJ14O8j/dMJPv38tPsF4z6Grb1gvTJ2+bAN8q5rM57l4Wxf/b2ZSaM8QP4eFFFsSehTK0EDgnds6gnUKrWYYkY9R6FIlwWY4Jtxo1MxHSo7NgCY5Q9/cZ6O/oscSDsd6HhZ16UvuqTDTSiN08G1XMw=
Received: from DM5PR11MB1914.namprd11.prod.outlook.com (2603:10b6:3:112::12)
 by DM5PR11MB1257.namprd11.prod.outlook.com (2603:10b6:3:12::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Wed, 16 Sep
 2020 09:36:20 +0000
Received: from DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::a8e8:d0bc:8b3c:d385]) by DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::a8e8:d0bc:8b3c:d385%11]) with mapi id 15.20.3391.014; Wed, 16 Sep
 2020 09:36:20 +0000
From: <Tudor.Ambarus@microchip.com>
To: <vigneshr@ti.com>, <m.felsch@pengutronix.de>, <miquel.raynal@bootlin.com>, 
 <richard@nod.at>, <sergei.shtylyov@cogentembedded.com>,
 <boris.brezillon@collabora.com>, <michael@walle.cc>, <j.neuschaefer@gmx.net>
Subject: Re: [PATCH 1/3] mtd: spi-nor: sst: fix write support for SST_WRITE
 marked devices
Thread-Topic: [PATCH 1/3] mtd: spi-nor: sst: fix write support for SST_WRITE
 marked devices
Thread-Index: AQHWjAzVSbw2cN8jH0Sx48szyJxchQ==
Date: Wed, 16 Sep 2020 09:36:20 +0000
Message-ID: <7cee3de0-19ee-d9f7-fd04-7f0771f73da5@microchip.com>
References: <20200911144703.25409-1-m.felsch@pengutronix.de>
 <20200911144703.25409-2-m.felsch@pengutronix.de>
 <dc80d00a-27a3-6c75-5820-97ad2e297d8e@ti.com>
In-Reply-To: <dc80d00a-27a3-6c75-5820-97ad2e297d8e@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [82.77.80.152]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 796c6b88-7aa5-4bd7-e9e3-08d85a23f80a
x-ms-traffictypediagnostic: DM5PR11MB1257:
x-microsoft-antispam-prvs: <DM5PR11MB1257A4941A26D0FB3F8EC919F0210@DM5PR11MB1257.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:949;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mjR1qvehKHBclAiNfd7Sv0T9wCqJ/PJCAMYzWkLGwWfjIOoqRTwoHLoZE2zA6cMGiKj1J1fe6BhDRv1BgevBCTsUbB3ZGfAiIVk9DVO3hT7vBuLJQ6QBgm1XHVap33QjM+zHEA5TDftb1h6re/5VWqWd7c3nEjeqZN7HnMYhLfKltP7EKWDWUPtQqln1l/l6nvLdavF6ZQCxR9BCg4zMUynivSN6b9J4Pjc+mXX1pnLsqsrLLc2/+U10AZg7QcwuKxig20YvVL6NBO67AnP9qT9oUE3hnP73kJVENLlE537F2pv9TzV87cWlVjpuPQDK6qqO4X0Dq/kqNvH+wUN2hhDogEV0fHyZzGTfEtQFcGhcuzsEbFbnHU0F3pZkwJqtA6/BD1H7NAj297ziODc7b+ot72++FiqPi+dk+NZEH4Q=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1914.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(39850400004)(376002)(346002)(366004)(31696002)(8676002)(83380400001)(478600001)(6512007)(7416002)(2906002)(26005)(316002)(86362001)(186003)(31686004)(71200400001)(2616005)(64756008)(4326008)(66946007)(6506007)(6486002)(36756003)(91956017)(66446008)(54906003)(53546011)(66476007)(66556008)(76116006)(5660300002)(8936002)(110136005)(341764005)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: iDber/c6ZYg/BmvdcBw8RfcRwzkHH6fdE71KDa1ntWS6EMc+G4E68MKlQPj+3PfTMdy75xfRLMuVdOKxLyLsoJk9XQ6I8Ex4v2VM01HserEMXKQjYA5rbfG8IzB1+PRaeuS6mIyIeePL59Stf29FG2Llfhy6AL7auNy8rW8fYO2E7pVoOiZqrpW5pFTd4Ij/eNtYfbEfo7+aZNWx9NAgSGTc/gRJ2tronDYi+GqyXYEJEADh6eQWAH5CQfkpvP13vP2tRnVjuMxBA3QvW3ppfaJ7Ia3F5EjNbWLFvVrCg+k6OP6mCtC/6W3ff9YuHrWxuOM77JgD6P0WfeIbrvbM25a2qD8EM9laF5hyJx5X3PKVckvgy29Eo9Cu7napSD2HgOxYKmTAUdOqW3CfXQUkO6o3QV2eMQ5iUkQfCYZdYmwl16HQ4wDycrPYV12+ZkUiw8iiK4gReTtnGsJk+E/2ZCD1m/0qaqKmG8tPhyMojFeevItF1VukFYbSNuHTpYVh2hNppbiHmATQBUIC2ktf4ZW5tRybogME9AriUoOAfjM/YJGRJSReJCaViErh21N2zFXRDvg/b4JRyD0fXriH3NpzD9RQnbdGue6dMLaasCD1vlQT5Ma1hqjw1NUVRYsJarqNXQT7VpBtDI1XIUgqzw==
x-ms-exchange-transport-forked: True
Content-ID: <8C9805C0D0E8F84DA6D369ACAD48482D@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1914.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 796c6b88-7aa5-4bd7-e9e3-08d85a23f80a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2020 09:36:20.4345 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cJx4F4RgBs9MDsQXIdCaax/kILUU2PxAPkSQLWLJF1h3d4JQ06Ya0nW10gSkPNQ8JCsNCzzVtr4wedbQKvoGx+uKbxw8NIjJ3jGIwc2nrKE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1257
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200916_053625_468891_7FE6EA1D 
X-CRM114-Status: GOOD (  21.69  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 9/14/20 3:00 PM, Vignesh Raghavendra wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 9/11/20 8:17 PM, Marco Felsch wrote:
>> The sst write support for devices using the special SST_WRITE routine
>> is broken since commit commit df5c21002cf4 ("mtd: spi-nor: use spi-mem
>> dirmap API") because the spi_nor_create_write_dirmap() function checks
>> SPINOR_OP_AAI_WP and sst_write_second. These checks are not valid during
>> probe. The check seems also to be broken since the "op->addr.nbytes = 0"
>> causes the devm_spi_mem_dirmap_create() function to return
>> PTR_ERR(-EINVAL) and the probe() function will fail.
>>
>> It seems that the commit only copy'n'pasted the existing logic. Use the
>> correct SST_WRITE flag and return 0 to fix both issues.
>>
>> Fixes: df5c21002cf4 ("mtd: spi-nor: use spi-mem dirmap API")
>> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
>> ---
>>  drivers/mtd/spi-nor/core.c | 12 +++++++++---
>>  1 file changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index 65eff4ce6ab1..31869ac245a8 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -3289,15 +3289,21 @@ static int spi_nor_create_write_dirmap(struct spi_nor *nor)
>>       };
>>       struct spi_mem_op *op = &info.op_tmpl;
>>
>> +     /*
>> +      * Most SST SPI-NOR's have a special write routine.which should so
> 
> s/SPI-NOR/SPI NOR.
> 
>> +      * dirmap.wdesc is not supported for these.
> 
> Or How about more readable version:
> 
> "Most SST flashes have special sequence for writing data to the flash
> and therefore cannot support writes through direct mapping APIs."
> 
>> +      */
>> +     if (nor->info->flags & SST_WRITE) {
>> +             nor->dirmap.wdesc = NULL;
> 
> nor->dirmap.wdesc is known to be NULL at this point. So no need to set
> to NULL again.
> 
>> +             return 0;
>> +     }
>> +
>>       /* get transfer protocols. */
>>       op->cmd.buswidth = spi_nor_get_protocol_inst_nbits(nor->write_proto);
>>       op->addr.buswidth = spi_nor_get_protocol_addr_nbits(nor->write_proto);
>>       op->dummy.buswidth = op->addr.buswidth;
>>       op->data.buswidth = spi_nor_get_protocol_data_nbits(nor->write_proto);
>>
>> -     if (nor->program_opcode == SPINOR_OP_AAI_WP && nor->sst_write_second)
>> -             op->addr.nbytes = 0;
>> -
>>       nor->dirmap.wdesc = devm_spi_mem_dirmap_create(nor->dev, nor->spimem,
>>                                                      &info);
>>       return PTR_ERR_OR_ZERO(nor->dirmap.wdesc);
>>

With Vignesh's comments addressed, one can add:
Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
