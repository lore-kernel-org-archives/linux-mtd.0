Return-Path: <SRS0=+4Px=DI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FE7EC4727C
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 07:51:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 330772145D
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 07:51:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M5AQZo9g";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="LCyEKf35";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="azZvG+gh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 330772145D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TXyFN+iAQnnlQULCSzXs4kQLiyypDWcuR84BiI8Ns8g=; b=M5AQZo9gXLXjyaqvIfi0KHXjq
	DrqvJgRTHmkbtokdyIss2bkYnQcymUB1CJ/KdacKK7SftuBqXSQItWDZai4AuTMrUl3vP3ijsVufV
	I+dVKaC0jHpxT1iRJLPBGkte2kGDCVlX6wQ1bmQ//AnoEaKcaKe9V1HlUN1B+KeRAbrEd83zzJ65E
	QwoHHBxGLtzqAAqEUpJDlzy4A9mQ8DIYVtgbkk+i/irmoyNDCh2RjfI0HwnhNddeKnC/I9MaZsUld
	3V3Ia68cJ3Weom/rtOFn6zOkmscyCi571brb6+MbKTPFLMlzhr+HNW95Hsn5ZNdjz6kosR8Oj8jug
	+s/xX5VQA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNtMj-0003UB-L7; Thu, 01 Oct 2020 07:51:01 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNtMg-0003TH-9R
 for linux-mtd@lists.infradead.org; Thu, 01 Oct 2020 07:50:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1601538658; x=1633074658;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=PjiHrx1x2qoJ8KPnGzelpCAUXcIr8ovZQBZoitJVkZ0=;
 b=LCyEKf35tPA41JdlzAxPRp5nCljV1pnSKVnfIvESRMKuKZ83xzZIOmK1
 2gkdEGXi/Y5pwYd9Z9mIKIO+lNXAOBohhIZR9GgSSZwAbfOp8+ktUTibw
 lKUM+cxs5cRr5c50btsIq2kf+ZsvZqUOsl8GTeLMZ8qe2ZCBQ3922yqab
 zEhELIRf367vdSB8ZhIkrPnH0N58YJ11TyLufcDuUkz57hf9sY2b5Rahj
 QJ1HYbQ+YVf59nxSrzu/rGyw/lucer5wLJgZm9LFnPqnK+0VRqN2Bvq3x
 kiY2VJyIsvVsYJC/upQ5i4jCI+84hjlj4UoLUpnZT0JRVMo+wC+k8u2Jh g==;
IronPort-SDR: WT0OlUbH6LfRKURwiLZJw+94Huc1eo+J3tRTNhGe+kbzjk03Lg45EhbjPlQFcdFc0ng7hFIx5A
 lnYb5mr0PaV58EMZfIbQF/KN4WQ7sygmHrw4RfjEmrbBmzImnsqTBudXMCWXRbMdWEbvbxU8l4
 CgD4vbkBWL8i8clNtbrvG9j8oOWu8lHTkZKYOFdeAtlE4du55M24Qc6qPfBP55BJYrgFh59Pre
 QwRqBC4SRTbj8fuu7V1g0OivZfnNa0KyDQGMdm5lNSQ8qN+Rjjv2sabcOnNR1NeIJi+UOx9eJ+
 EVk=
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; d="scan'208";a="88757941"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Oct 2020 00:50:56 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 1 Oct 2020 00:50:26 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Thu, 1 Oct 2020 00:50:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JI0dlq1W6pasyOeC33bF9PWpKpFWz2ZY4XnmiFjhldfC+JU3SiSnwVG22jfXWMZDFKChgG0eiE06qfUu5tdX/Fa8BT77a5rtCeB1LzYbaaCtPUFcSxDxKRseKoas3qJKM0uaM7wzU0biQi66ss6ViiQdh7sLafxQKwdHSe5Jr3gLKWSRqpOu+oauxDn1vw+3VmgeHPmk4YJjpCbDbqSq7atcAVHMcgIqWCCaPGIR+2HqLQrUSLTsAS3IGhTmCqazQ9e86uSp5m7GRLWz+e00U7kzo7MIoGmZaKfmkfhdE5W7tzXUuRVI4rt9JwCiAJK0QV+EPgbELgAA4bU26VV3Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PjiHrx1x2qoJ8KPnGzelpCAUXcIr8ovZQBZoitJVkZ0=;
 b=LaC9bzJxgMLjx/yQR6/NiERxZqYF1hsvtJHAO5mRuSQviVUoABojkNZWPOa4IA6q9eDkQAmtOXfFaCO9QWnyakDp+5k3YaJVffMfvW4XFWo64+I1Km78CPS7dcrCr0B1kWYhr2TWl1jTncvKvdxpbBk3Xv3Vfqp2hTwwkfhD8F6K8QCIuLx47MvihItwUVIi6IxLGbsylwUqjDxgQEokswD58GCO3VD64WSQnP0WBODJAZ0N4XGvm7tgJstULZemIDbPnMuS7dMSnS7CGE63SeerylnuN2WmjbPxh/pXhMH4t1NALu0zQ2r4Os1AUPNedNb3oRaxItlL+yneRHB+Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PjiHrx1x2qoJ8KPnGzelpCAUXcIr8ovZQBZoitJVkZ0=;
 b=azZvG+ghDsujccr6GdeBrsxTLCSW/ROVjpL1TNnX4wzqarEWFZR3wkwr2JKeYYb49UDiBKGfdLFLgu443a/iEbIV634hlziLSFsoRSOI46UQlNPVH5D6TYooxC/el9JOg5pFjVr+omo3TP+cvXu9aMYNSZ5rG3UKcP/iwV/bB4k=
Received: from DM5PR11MB1914.namprd11.prod.outlook.com (2603:10b6:3:112::12)
 by DM6PR11MB4691.namprd11.prod.outlook.com (2603:10b6:5:2a6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.24; Thu, 1 Oct
 2020 07:50:49 +0000
Received: from DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a]) by DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a%4]) with mapi id 15.20.3433.032; Thu, 1 Oct 2020
 07:50:49 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v14 06/15] mtd: spi-nor: core: use dummy cycle and address
 width info from SFDP
Thread-Topic: [PATCH v14 06/15] mtd: spi-nor: core: use dummy cycle and
 address width info from SFDP
Thread-Index: AQHWl8eTpp+MWVKbCEOMYFc8fxZtOg==
Date: Thu, 1 Oct 2020 07:50:49 +0000
Message-ID: <769ddd25-3028-2c49-220d-7588a05b25e7@microchip.com>
References: <20200930185732.6201-1-p.yadav@ti.com>
 <20200930185732.6201-7-p.yadav@ti.com>
In-Reply-To: <20200930185732.6201-7-p.yadav@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [5.13.51.157]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d579683c-2f89-41de-b516-08d865deb67d
x-ms-traffictypediagnostic: DM6PR11MB4691:
x-microsoft-antispam-prvs: <DM6PR11MB46913B20F5E29BB8C38A61C2F0300@DM6PR11MB4691.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B6BqYmHWSaduydsrZ5jXbo4ngSrdhBChnMP1LlscEG0X5YIPjLxHjypYu7YVW+7FhkI1WKpNtBSo+j8RWLCZKRk4JL2G/LYb+q5LLfk+pb1fwuGG+D/LlvlfzYnYc6GnC+zzdz28XXSeZsBRLe0SWuQdNfRA4rEWYvsdDQdXsBUPxouYECMWTcA9dipKXSt7IMSBaFAVoRpa995IuVF8rObSy9Dh2ty+m0GkREGELevIy2+gCIe2G1SyaBQJX1pvuGTyE2VLWkYs1NKDmVe8zlbCBbqjM0mXzdKTsfBh0AeJNLza5EryAOCoflNNDz7RZd/WEJOqF/4nKChCmsxIiSuq0bCTncQUEaVYZbNfi8QUMFMkWXUU7HvNKEvsreOV8shKNDvpYVxiAsiBqrNhqyw/KqEA5WDaAGXTDTXFlLjG355IPz7DQtGbpK4Kw0aa
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1914.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(136003)(346002)(366004)(396003)(39860400002)(2906002)(316002)(91956017)(8676002)(186003)(110136005)(54906003)(66946007)(2616005)(53546011)(6512007)(26005)(6506007)(31686004)(8936002)(31696002)(36756003)(64756008)(6486002)(4326008)(71200400001)(66476007)(86362001)(5660300002)(66556008)(66446008)(478600001)(76116006)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 2cvMbKL5gypcRNOvZvc2NMHO/uX6OEjw5jgdui24m+hrNOY36iNMWmkKGJuHzvT9XO8GlR08e/tgLICc1uyv3u/VvuBYVVtA/2zlzisGNl1co8HtGfKBPMtVkVtvNHTI3S6vGvFAvHjzWX0ShF6uehG8PyNl7/8+Khql0Nnet8zRr3oLiqX6pvmxsIRxrbgmK8QhzINvjVrUqEmP90G2eDKBFJqs8kRhitOMKqNuFQrYvmnCtOAgQjDWOkHM+/jMd93NtjTpvY/ZpEEZMQwSgp4yrUHnMMZS/cahL3yXMXM0bDB8DjJ134GtyplWwMMQDN7h91XX6vsHG8IiPTwomkWMG1q8Nda7kTxni665KMBa8457+Z2ndXECkPuTkHq0AWgZ46MS3eG0LqvEaEVFmQWxfnQhiuJy97nS6WqcMXdkZ3ItL+nr4VydV7Q1sdy1F3tS3383EOfWEM9dNe2ZBht41LULT+VSRrUMSeaPY0z9ZuDw93F9fSTpidGJWC+8terKbwrNBfMLDtj0PmWHpXev8/FUTQojO2pLRnQ5pOlOUuVNp8jvfcS2EwuKLLHzCuqvzP52RLwdweNvDZ27HLHPqRNuqrVeT4fOAdxXfUDVZamlXn8YVMrfOlmlTTVeJpwEXd27zDA+mRa5jAubtA==
x-ms-exchange-transport-forked: True
Content-ID: <0A7DC3927CDDAE49A79BFDFA0F1A68AE@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1914.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d579683c-2f89-41de-b516-08d865deb67d
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2020 07:50:49.0402 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0C/vrdq56ikRToJ7KlRNrAqB9OpXCUoCPMl0xsO/LutaepfrHNNKs9ZSJP/qaFzJ9bSl67ncX+3O2FbUP00Ik75WoRRDF3vvCEnkmGx37ek=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4691
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_035058_476440_D51C8C0A 
X-CRM114-Status: GOOD (  17.54  )
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
Cc: boris.brezillon@collabora.com, nsekhar@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 9/30/20 9:57 PM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> The xSPI Profile 1.0 table specifies how many dummy cycles and address
> bytes are needed for the Read Status Register command in octal DTR mode.
> Use that information to send the correct Read SR command.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

> ---
>  drivers/mtd/spi-nor/core.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 97e82a4821f6..1465cf80f978 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -385,6 +385,11 @@ static int spi_nor_read_sr(struct spi_nor *nor, u8 *sr)
>                                    SPI_MEM_OP_NO_DUMMY,
>                                    SPI_MEM_OP_DATA_IN(1, sr, 0));
> 
> +               if (nor->reg_proto == SNOR_PROTO_8_8_8_DTR) {
> +                       op.addr.nbytes = nor->params->rdsr_addr_nbytes;
> +                       op.dummy.nbytes = nor->params->rdsr_dummy;
> +               }
> +
>                 spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> 
>                 ret = spi_mem_exec_op(nor->spimem, &op);
> @@ -418,6 +423,11 @@ static int spi_nor_read_fsr(struct spi_nor *nor, u8 *fsr)
>                                    SPI_MEM_OP_NO_DUMMY,
>                                    SPI_MEM_OP_DATA_IN(1, fsr, 0));
> 
> +               if (nor->reg_proto == SNOR_PROTO_8_8_8_DTR) {
> +                       op.addr.nbytes = nor->params->rdsr_addr_nbytes;
> +                       op.dummy.nbytes = nor->params->rdsr_dummy;
> +               }
> +
>                 spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> 
>                 ret = spi_mem_exec_op(nor->spimem, &op);
> --
> 2.28.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
