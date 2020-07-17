Return-Path: <SRS0=C/uX=A4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F493C433E1
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jul 2020 10:34:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 588C72070E
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jul 2020 10:34:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xhUv99mU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="CNkRcOgJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="eTvsP5Ss"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 588C72070E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GSOVSqpkGjusQO48l6uBHXy2fWW6I82tNlMrbs8Niyc=; b=xhUv99mUpQDTLnoB7rACSyv7Y
	RQ78Gq5FL97coytUyHnXvc1BGWVqn30XEsDoUtf/wgpTPtj2XVL4DHCpnwCU8qSUxoRthDrUQMzEy
	wCx2DuUfx7LuzqQK8ovaAPjwmaf4sXJzaGpe/zREu+WPjNipL19kIj9nSb2aI3+jZvFWAlQuV34+B
	YNQV+3M0ODdakN4saZE/t4VksYsOpy4dLTNMdgeJV5HA2L6olh7JhUG53zlTvHMfFVga9zsL7gfX3
	RmiewE5EN1Vj3M9+5nT5Ky5/tvzzaUZNP/66zGrZwhnZM8dAuCjpXFSBt75/DP9ZQj6xLLtXWPUJV
	Gda+ur2+Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwNgU-0002hd-EG; Fri, 17 Jul 2020 10:33:42 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwNgR-0002gN-RY
 for linux-mtd@lists.infradead.org; Fri, 17 Jul 2020 10:33:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1594982019; x=1626518019;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=FgUx8q/UZ9872/Ke6gVpyQHJ6eeif9sNYCseNTqr1rU=;
 b=CNkRcOgJm/yhe85Ml0ez/5HsmEtNUSivsLWaVqqyYuMow6V1exPCG2du
 cDkiPE7XutafGKcLDx8YDy3UvFUWvciqMKYdyEU63vs+5vvnExlpjGpbZ
 Gwgy7+KVK9+NXFzPU+6P/uY0L5p6Rui9tGBokulhGoTgyYjuwmzGLmjnG
 wUuI7QU0UDtGZz2BbxXWIGGKAqMEolexIoarYQvYaBcQVmzULtKno1r/d
 M+6z7CnlDkPcQyjFQ++Q3pbEYMk5+DXgGMMjOwi90PwOkmtiqzbDpcZ6I
 yYgyKAqHemf+G9EdEDgtN9qYbt7nQH3rB69MBMhf9UbRFTN+4VkJJKK60 Q==;
IronPort-SDR: jVXHUpJ9R31c90QWqQqxDjXWqCnop9wUXspwwf966kgQbXNVB4fUdzr02jNt1QZX0Gyz363wUF
 Vgqukifz8/cVd+ePE/zZUVoK5tiRL2BGxag4p+hBAFY4J8YlpwtOD6CNdcIW5+k96T7H/nCb20
 Wg2/0+12elBZWjm5aQYkGS3E2cG6XGQN8+1YCY2F5xn5aegd1KvCxnaTnUHldo1nMMgjJC/O7D
 +V6OM0FFBm8JO/9Z8oMatuy4JmcNqVUH5j5tgGtxweDDURAZ0XdTbGJer/+uRzTg5gRH1D22Iu
 mPw=
X-IronPort-AV: E=Sophos;i="5.75,362,1589266800"; d="scan'208";a="19555234"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Jul 2020 03:33:37 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 17 Jul 2020 03:33:01 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Fri, 17 Jul 2020 03:33:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KtTp0iFo9Uqu9nqxymVEJm/APz5s1MQppxmBR9dPKyNBymGMEDKgdcRFOHOWBSkyULrcm9a2tss6f4ygnpki2TlDDgGD0omwqiGAX2XBXo3wLdc7vhkgQW52bmFDcbQUAZXRiyDkCzH9T/JM+Y7FWPa+nO3GyN4CwCa7ALqx6FtfrHrRXJUKDuOB58Tutk2r2vcbcAbKxxvR4HLmVzE1wQfCtCjFx9PLuyiiuMZ/HKxqpK2AQcU+dT+iw54IITE623Id39ZGk2DtyUblJH6dd3PMW3JYXTg724s53vGNMOKwjv3OTjancU7MEZV51Q9CXItNlF6JbT69n92fKk0P7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FgUx8q/UZ9872/Ke6gVpyQHJ6eeif9sNYCseNTqr1rU=;
 b=eUOhsnFtbKSIoju1rJdEr6Dj06T6Mc9GI7Td5s9QfQrQGFtiE1pFnQcGE7RHqZsfVNCm//ZFNyvydJvUSR9vYqSLJk71tgyYieF4TPPrnsq076WWjHx6+NgeEkN8MdjFlWhVGiKCba7yoVqLVjUbg7FIZJVyeekHNKV3QqU14c/ZYj9enhj7HZ+NvjxhQ2nFKsA1cm+xBMXo+teDtcMPOoChw4Ht99P14LIKElMQ3ujJsqM7t+edxTqiEKvE8sbFqTIbikO02+jBJ+LioWnXcQ8jJWBecdnVwvTki11vJoLlpf/a/d4dv42EMRfZ1pjt48xibFXTNqViHucoFgdNBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FgUx8q/UZ9872/Ke6gVpyQHJ6eeif9sNYCseNTqr1rU=;
 b=eTvsP5Sszzyffwm5Il24nBb11YV6BWt+Rx8GUX6ypXXS/y/ac7SDf9uAR+pFTmdk9KpwJzeelkY2IuHMz52Iy7D45darFu/wnMsO/DInTt9lid8bpqav1IY2qWaWsmykc++L7kOWhpt7gLbDnmWeim6pMPGsP+5YDU/hkTWplYQ=
Received: from BYAPR11MB2856.namprd11.prod.outlook.com (2603:10b6:a02:bd::11)
 by BYAPR11MB2646.namprd11.prod.outlook.com (2603:10b6:a02:c6::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20; Fri, 17 Jul
 2020 10:33:36 +0000
Received: from BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::7424:cb9d:3c63:5181]) by BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::7424:cb9d:3c63:5181%7]) with mapi id 15.20.3174.029; Fri, 17 Jul 2020
 10:33:36 +0000
From: <Tudor.Ambarus@microchip.com>
To: <dac2@pensando.io>, <linux-mtd@lists.infradead.org>, <vigneshr@ti.com>
Subject: Re: [PATCH 2/2] mtd: spi-nor: Support SPI_NOR_DUAL_READ on Micron
 mt25qu02g.
Thread-Topic: [PATCH 2/2] mtd: spi-nor: Support SPI_NOR_DUAL_READ on Micron
 mt25qu02g.
Thread-Index: AQHWXCW58IWRpdQGEEW5x0rkX33S3A==
Date: Fri, 17 Jul 2020 10:33:35 +0000
Message-ID: <1724beec-aceb-b6e9-1288-da340d3fd43c@microchip.com>
References: <20200716211631.38949-1-dac2@pensando.io>
 <20200716211631.38949-3-dac2@pensando.io>
In-Reply-To: <20200716211631.38949-3-dac2@pensando.io>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: pensando.io; dkim=none (message not signed)
 header.d=none;pensando.io; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [86.122.210.166]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e33cb40b-3d57-4415-61d2-08d82a3cdc96
x-ms-traffictypediagnostic: BYAPR11MB2646:
x-microsoft-antispam-prvs: <BYAPR11MB2646A58191E50AE549AF4C7EF07C0@BYAPR11MB2646.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tswlYmScNFMwfGHwZ4Pf53Cvo/PV6z8azJdCEjXKr7/duZ5AVrbZl7Igf28yy5CsBOOOhVid6VJT2fCVW99buPrx/uUT5Iayopm1xu38QkHmj3odpMvtM7/oPXFlLGZPimmjx2Yh/DsEaUMmgQnYXQDEexneW+zoIumErE6Z7wE8Qiu8yGAGlzDtB8+dVl2zFblRlUBLse94hTVH0oW+CwUaBWHBJ41nVsrE+7czEsAaFQSUDY8A2UNwlQyoG9lTiiUXObuCIUiCc9LF3SEDp/IlOLieJSgg1eRt1aYrfuSVN9NxqlOsyC7n/VmU97++ded2vtyjr8Fqeua5U4TkPDKxy9VqJmPDIGTST6it7ED2eHNP7hIbouHF93QVpEm8
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2856.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(39860400002)(366004)(376002)(136003)(346002)(396003)(36756003)(2616005)(76116006)(66476007)(26005)(66446008)(64756008)(66556008)(86362001)(31696002)(110136005)(5660300002)(186003)(83380400001)(8676002)(6506007)(6512007)(53546011)(6486002)(478600001)(66946007)(316002)(8936002)(2906002)(31686004)(71200400001)(91956017)(4326008)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: Aa9mBv3xQ95BpX8MiuuZvTBMoPfwwHnWSR2H200y4Vp3/Rhns1KwbvoaZGsQelR5sI8Spm4ZmyZB8aukIKaVuFkQj2IcWrArzIrMRxJ7vbA7nSq7danChuJy/P2CIcXCLm4+jfrSnWDlf6JmZB+TstM5mLpDlHNZlYk2Fdpi3pb66tog59LexWDW2Phsr34lWx9etsL/4USbo66I4xMald+tDKjsplL1hw8gJFbAzBdILjV4IAGM1EblsChK10P6rrEx0nXWX+cVUmQ7pDkErWxSzQDM6facZusIdYjiRYUmdrTARoOa85Dde8aNq7VgfY9iRu6xK+x3NvcFLeRDzHi+M/6xMKLoMNoAum9TV85sLVtt8XVrT0PrwiMSj+uwmYOduo5XCJka8gnFTBy/OTnCZFoki5ywK0uljmHvCCD2K1wPPfGEMJBgWMXXkRQ9znuu8RodSXlHr5PLIjyQK6qHr/UZ+cm+YqDh1dDCxTVPhY+nGj50ttylnSVMUwyd
x-ms-exchange-transport-forked: True
Content-ID: <D4E51A84343F3B42AD9B0CD24FC980E8@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2856.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e33cb40b-3d57-4415-61d2-08d82a3cdc96
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2020 10:33:35.9163 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: btrpB1UZayQuQUFrroMZ4CEPJhSHpfH7MYHHsXSWcWajZYuhI76HheAXc2umiU7qCHMIVIDFcd3ndyhYbPbPceBtswh+FEoqFe8MGlK2c+Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2646
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200717_063340_208169_764EF088 
X-CRM114-Status: GOOD (  16.48  )
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
Cc: snelson@pensando.io
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 7/17/20 12:16 AM, David Clear wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> The Micron mt25qu02g supports both x2 and x4 transactions.  Add the
> SPI_NOR_DUAL_READ to its spi_nor_ids[] table entry.

In spi_nor_select_read() we select the fastest read. Since this flash
supports Quad Read, the Dual Read will never get selected. As of now,
there is no benefit in adding SPI_NOR_DUAL_READ when SPI_NOR_QUAD_READ
is specified.

Both SPI_NOR_DUAL_READ and SPI_NOR_QUAD_READ trigger the parsing of
SFDP, maybe we should choose to add just the fastest SPI_NOR_*_READ
supported by the flash when declaring one. We would have to update
all the flash entries. Vignesh?

> 
> Signed-off-by: David Clear <dac2@pensando.io>
> Acked-by: Shannon Nelson <snelson@pensando.io>
> ---
>  drivers/mtd/spi-nor/micron-st.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
> index 3dca5b9af3b6..ef3695080710 100644
> --- a/drivers/mtd/spi-nor/micron-st.c
> +++ b/drivers/mtd/spi-nor/micron-st.c
> @@ -71,8 +71,8 @@ static const struct flash_info st_parts[] = {
>                               SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
>                               NO_CHIP_ERASE) },
>         { "mt25qu02g",   INFO(0x20bb22, 0, 64 * 1024, 4096,
> -                             SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
> -                             NO_CHIP_ERASE) },
> +                             SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
> +                             SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
> 
>         { "m25p05",  INFO(0x202010,  0,  32 * 1024,   2, 0) },
>         { "m25p10",  INFO(0x202011,  0,  32 * 1024,   4, 0) },
> --
> 2.17.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
