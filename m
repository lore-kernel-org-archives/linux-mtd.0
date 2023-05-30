Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4AF1C77B7E
	for <linux-mtd@archiver.kernel.org>; Tue, 30 May 2023 02:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ZLlkjvKj975YJIcriIpWvNt8GjjI6ECBQwFmVp3L0g=; b=GTNtPYsJ16bIb8
	318JTYNvzsk7DZkYFWwtJ9ipXxcyYukRQ+bcwg+qkAMkAuXcEYWBhdf+yRpdURCc328ti/pCAaAxu
	u0evHdJh2reaO10MNSwtLqM2ZvO0aZ6Sf0d42azXS1xX3JyXGu1g0pdCN0jSvfMBVoCMtJd7NWl5e
	BizRts0tYMTU7D0yJqhrUJeWE9rMOa+wZAVttp0h3aucoSfEOTc+T7ldGiCP63nIMfUqW/V5q1vDw
	yAhFbWRKGyrbYQwL75WoOfxuKz0xcr/fkGx7vXDy9hnpsw6m+i5d8LFGfT8mfcdD3LSAQYWj11F27
	RonUk7N1amcph4mt6sHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3pWz-00CFf5-2q;
	Tue, 30 May 2023 02:56:17 +0000
Received: from mail-os0jpn01on20619.outbound.protection.outlook.com ([2a01:111:f403:700c::619] helo=JPN01-OS0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3pWu-00CFeA-2T;
	Tue, 30 May 2023 02:56:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oZ0QVi5cmH4Jxsozpq0vy6/jkUHUxFDeWi9PMkkGFjcY3L6vxbStfMQe6qzzxPqIq1HcuBBySbDVFrOGYyyOlxq8XLqTfhue2Aw7AheOR2JHYf3+Uv8VgpQllw8EMHGf3Ve5nM6Mm4SW+cq/eJ3i2a78T+XgjAv5Iktp8Z2aJ3Aad4FkwGxQ4Y7vbgEcjHEs6aupYVDoFjzO1Y9AMhb5c1xEEOJBhiDDLK4FUvAjlMzsHYdz4x6S/3ab2C5j0yadEmDCt06NjczJdWCxMo24m6rhaJcEkgEaes8X/bFRSZtuLxzXL2sYiMxE66VdaBUSQ5OrDxIyGgnIfnTNw9z4mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ylYeiHZr+qrnXTyg0Hj6/5fp1UDgxLXKgF71SzX/ieU=;
 b=dgJYKMwFMf96BaDcyQtPzhnDDdNzACMHJCL26qNMsooMr8q+EbvD9kN0zZETlQ/NV1Oz4lkysghyvusUbBadC/fgsuXtVgZwDTyRw3+ibzgbsHmM1wOh4GJOwHQReunx9LkeOTmY6xkdbcUtbEsMvJ5hHbZrQOa83H1CFjWH3deSl5rDNUCjJScYf95LQfa4cFBQGQUELhcmrwlT1pCpLReAAItBCgun7Bt115hcnsrWJqsWBavjQirIFqdqjY+U3NGNaVF2zL6MvmTJwwd7nEEikh7HJryzEF7iaOKoYV8InkMAhkP/YoFnQlZ9yOG5ej7sj5YkDKAMio/hoPxplQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nskint.co.jp; dmarc=pass action=none header.from=nskint.co.jp;
 dkim=pass header.d=nskint.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nskint.onmicrosoft.com; s=selector1-nskint-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ylYeiHZr+qrnXTyg0Hj6/5fp1UDgxLXKgF71SzX/ieU=;
 b=mv8CdNmwjtFg971FCU3GSoZvFV6PGZMdMXNiDrRiNOWM7SuV29mxF2EPuofp/QCRPNL72Js2H5CEA+W8lqmJWTT4dA6kq3QC7AoBTsp8jltTfo1aDoQ5SUrSbAfgUXMz2bh/r+NnwkxGoet/xmcylwJVYRtWKxWOomIgQzpH9f0=
Received: from OSZPR01MB7004.jpnprd01.prod.outlook.com (2603:1096:604:13c::9)
 by TYVPR01MB11154.jpnprd01.prod.outlook.com (2603:1096:400:369::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 02:56:03 +0000
Received: from OSZPR01MB7004.jpnprd01.prod.outlook.com
 ([fe80::148a:7cac:32d9:1c03]) by OSZPR01MB7004.jpnprd01.prod.outlook.com
 ([fe80::148a:7cac:32d9:1c03%4]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 02:56:03 +0000
From: Yoshitaka Ikeda <ikeda@nskint.co.jp>
To: Dhruva Gole <d-gole@ti.com>
CC: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Vignesh
 Raghavendra <vigneshr@ti.com>, Vaishnav Achath <vaishnav.a@ti.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "Takahiro.Kuwano@infineon.com"
	<Takahiro.Kuwano@infineon.com>, Pratyush Yadav <ptyadav@amazon.de>, Mark
 Brown <broonie@kernel.org>
Subject: RE: [PATCH v2 4/4] spi: cadence-quadspi: use STIG mode for small
 reads
Thread-Topic: [PATCH v2 4/4] spi: cadence-quadspi: use STIG mode for small
 reads
Thread-Index: AQHZMJVBHgHXafuso0ywMCCxmHrW5689ZDXggABfGwCAARZ4MIAA3JcAgBBuwJCAAFXLgIAAGoLggCJKngA=
Date: Tue, 30 May 2023 02:56:03 +0000
Message-ID: <OSZPR01MB70043790C2DCF696243326B38B4B9@OSZPR01MB7004.jpnprd01.prod.outlook.com>
References: <20230125081023.1573712-1-d-gole@ti.com>
 <20230125081023.1573712-5-d-gole@ti.com>
 <OSZPR01MB70048CE259A3D63C4179199A8B659@OSZPR01MB7004.jpnprd01.prod.outlook.com>
 <044a723e-b81e-f6f2-8bf7-3680a10abc86@ti.com>
 <OSZPR01MB7004D229048A950C93B40CC88B6A9@OSZPR01MB7004.jpnprd01.prod.outlook.com>
 <b1d30948-ba3d-a4cc-e1ed-851a9dedba7c@ti.com>
 <OSZPR01MB7004907B2FB95F45E9B83FEC8B719@OSZPR01MB7004.jpnprd01.prod.outlook.com>
 <11c63702-cd25-67c9-d0bc-21ec47e14c98@ti.com>
 <OSZPR01MB7004DE3578325B0F51C5CE598B719@OSZPR01MB7004.jpnprd01.prod.outlook.com>
In-Reply-To: <OSZPR01MB7004DE3578325B0F51C5CE598B719@OSZPR01MB7004.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nskint.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSZPR01MB7004:EE_|TYVPR01MB11154:EE_
x-ms-office365-filtering-correlation-id: 176c762d-4d45-4c5d-53c0-08db60b9683b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SjWQM4BQifVD4mT4QIjBhRT3KPuhjIe2udxEedpOXdq1+sOGYGq7YMyj3+ZqcDkNrpR0WPxOBhBFdfqJquaOQGKmStxQAjRCH97vzun/cme77VLqvihzNf59/IQbfzeTVrXEDDD7uXq32W90B+uwZEEYuy2D5BgX/pZNZ1iLXNrj/eziWskRA65ks3K0CPEi5452ZObJ+TqSpuo4dh1M8tOiKMHGTnTH2E+lZ0I2tF8ZD/xO1zQc+ORWwPeG8NCmqnQIpOlKTfm50BE9c4PxC7aYu44QropXwD3kiZzV0vvBPblq/T00cFePd6oRR/oK6co2Umlj0xiR3CXuT5C2UU0fG3YCXuJZl0sWG5hatmFIMDI9l9EpV+I0yS1wMtMba1z67qL1G5hzoX0II0cxTyGMheA/tlNOvRfTkTlUig2O9/f91IvxUUsZtdqNBAdUAjB5b6d1mffAoCyoeZf4d0dvt5UKpGm2YokO+n4h5r12368ztT57/mNAwglgWHzLhHMTh2AI1TfHoefscXKUu+SiJJXnrZ89+HJKIxy5qZEkQndht1pH215Tmu+YOcrMGaURXdSNpTGKDY7nCZ4szpVgoOFMenvvlnhg8W38NNE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB7004.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39850400004)(136003)(396003)(376002)(366004)(451199021)(71200400001)(478600001)(54906003)(8676002)(8936002)(7416002)(5660300002)(52536014)(33656002)(38070700005)(2906002)(86362001)(66476007)(4326008)(6916009)(122000001)(64756008)(66556008)(66446008)(66946007)(76116006)(316002)(55016003)(38100700002)(41300700001)(966005)(186003)(6506007)(9686003)(53546011)(26005)(7696005)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UXFzWFl5WVZlWjBPTkJlL3hhMDVVTXJZbjNIc0huMWllamFuSkJGajVkeWV3?=
 =?utf-8?B?RzFIWmlXdlF5WllHUkRwSzV6Y1o4R2tXcjZiTTlDYnZ6cXdxTm1ZdVZ0VUYz?=
 =?utf-8?B?OHlUUnFxMmZHQ1YzVlZMUi9sdmh2Mk8rZm50cVdMUDAzdVNqRUVXdVdMY2dr?=
 =?utf-8?B?TURWeDBkZEc4U0RhRmNRRzZJUFRSZy92R1plNmJvNVZZQmxmY3pWU0d3ekxP?=
 =?utf-8?B?WGp5ODNWUktLRjBBNUI4QjdCaVJiME85Qnh2K3RVbDB0Y1VCUVIrb2svc252?=
 =?utf-8?B?Ym1vcm91OS9QNjBweStpdGhSaTZ2OGZCbVhPL0h1bFUvVEZpWmcyUUg1ZWl1?=
 =?utf-8?B?a1hxNzB1cW9HeEs0K1Erd2RXcVBDci80U0lMZ0FoY0hjY0tyVzNKS2pqNTVi?=
 =?utf-8?B?MGprekFJNlBxZ3lSN3hPa0dOVGI2UUJqNy8yT1dDUE1zb1ZNRnNUSytIenJK?=
 =?utf-8?B?SmEweEpFTDN1Nm5iNWxHcS9paEJvNVlKYS9XWFl6TWVHSHdzZFNUaFBaYk0r?=
 =?utf-8?B?ZVBuUUFLYitDVjlrNFFZMU5FUWtGbjJ3SXdhRWhVTXBWdVROdWwrNXp6Ky9R?=
 =?utf-8?B?ZHZLWWRzKzU3QXlaTnNWSEdEWmp0Q2RMcDUvM3NjR3B0N2FMMWYxYXBHdU0r?=
 =?utf-8?B?eGtheUJCUnpnV2J0WUkzTmpaSmVGcnFjY0d0RGZDSmNxM2IyYW9JOVF4ajM0?=
 =?utf-8?B?MmxGdEZBajg4SWlJV0tJb2pnODl2WjJldDh6MlhmbEIzS3NIZ1EvOE5BamNa?=
 =?utf-8?B?Q0ZPTGh5NjI2Zmh4bTNBcVVIb2pxenlGenNVZ2g2R0Q0TDNpRWJwMXB4cys4?=
 =?utf-8?B?OUpRbWJuRWNCanByc2YrdVJRNVpEM2VBMzhvVFJtMjNueVlwQW9QU1ZCbkd4?=
 =?utf-8?B?Zjg3OEtJUDFEMmliNkhhUWc3TXdmeDZKNEJ0bXFNdjBHUXQyZVZzVGUwQ0NM?=
 =?utf-8?B?cXdMSTd6TGZDelRTRFo4NkZrSnV6d2t1LzVqTjFObzBzRjZIQnZUUms1NU5G?=
 =?utf-8?B?dlpKMVE3eUNTYlJYRlpoTTFiODlLSkp0QXByNTdLdzhRM1poR0FFbjBoYlhQ?=
 =?utf-8?B?RFRXTmJRbi9oSjI4Q2M0NkxGcWZxZzJTQUNSWmZ1bW5sZk41VHdualRFbFB2?=
 =?utf-8?B?aTJ6bUtZeEJqclZQc3NTOGJ4NkZaVmlVcUZ3R1k1OGtOOHpZQjNKUks5Ny9E?=
 =?utf-8?B?alA3TFlRUEg2aElwNnNzbDkydk84RmZZUGhMVm1KWHlzZmZDYUVEdnROZTFp?=
 =?utf-8?B?NlhLRVkxdlpVUlcrYWdoOStXd0V6RTFlbXhaVDJxMndvUkQ3a0VRcEc1N09y?=
 =?utf-8?B?dm04cmRURjBYMTdmWXhxSC80bUo1cWZyQmhmcTRpUHo2UEpPcjZnNEhiV1dm?=
 =?utf-8?B?YWh4SDVJNmZrS1kzTms4TWJOK0dXNEFpUDhjRlhXRDJDQXFaOGRKQWxTVVJ4?=
 =?utf-8?B?UWpxNEl2L2kyeWJKRWhQRG5VT1hDT245Z2NCQ1RUR3Y4WlNlOE5ydWxKRmFT?=
 =?utf-8?B?dDl6NWV3aS9jeTI5Y0Y1UmVEa09hbUxVQmJ5RFRxTmgyLzBzYUhZY3JtKzdW?=
 =?utf-8?B?cHJINjdoekx1YTNZeEtHWW9GTjJJYW11d1JLQ2p6NVdyZENENkIyU1liaVBZ?=
 =?utf-8?B?blFETEdOY3lGRnRvRkxVODB4Kzh2QW42V3I5SHlzSkVSM2dvNkZ1R05Cby9I?=
 =?utf-8?B?ak5mOVFKTnFqNjJIcng0Wkg0WE9BKzQveDJFWmJBZXBjUkhoemtvNDl4ZFRk?=
 =?utf-8?B?M3R1T2svZzFobmFDRlcyaWxpOWFyamJmcXlGdkRrUEQrYWhBbjFaNmFyRFRO?=
 =?utf-8?B?NDNlNnlJZkdBZzR3UVAyeEZSTzlXV1NTNlc5N3Q3djNLM2JXUStIeHFLY0x2?=
 =?utf-8?B?alFIK1liSU9naC8rZHV6NWQyRTgvdVkzMVB0cUt2SER6SjlSMStpVVJ6SFpK?=
 =?utf-8?B?WUxlZlBIdTV3UkYrVzhveEJKaldJTHdJNWZKbEpraGFSM2ZkNjlZZ1NiaTFp?=
 =?utf-8?B?dHBCUEFqUUdGUjJSL1BJdGJUNER1bFJqc2ZkRWNmUHcza3Q3eGJIRFNjZStl?=
 =?utf-8?B?azlUY292dG1YNGZ5eVFpbStjdkpqVFNFeG15Yk5DVlZaU05OdFg0L0JzRjZG?=
 =?utf-8?Q?J8NC4iuZCk1ZezCM/wVYfFi8E?=
MIME-Version: 1.0
X-OriginatorOrg: nskint.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB7004.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 176c762d-4d45-4c5d-53c0-08db60b9683b
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2023 02:56:03.6722
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 727455a2-9822-4451-819f-f03e059d1a55
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9OUTyqHXinkHEYVPHN7zCYHKxd1KpClrZrQxfjRCKRajycy8liF9syIa8g2/nH/lG3yNZC/7XmZkXUz97Vp2Zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB11154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_195612_994044_95F63725 
X-CRM114-Status: GOOD (  25.44  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Dhruva,

The patch described below was able to avoid this problem.
However, we could not find any material to determine if it was correct.


Dear all,

Is there anyone else in a similar environment?


```
diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
index 8f36e1306e16..4a9535e6c86a 100644
--- a/drivers/spi/spi-cadence-quadspi.c
+++ b/drivers/spi/spi-cadence-quadspi.c
@@ -1365,7 +1365,9 @@ static int cqspi_mem_process(struct spi_mem *mem, const struct spi_mem_op *op)
 	 * reads, prefer STIG mode for such small reads.
 	 */
 		if (!op->addr.nbytes ||
-		    op->data.nbytes <= CQSPI_STIG_DATA_LEN_MAX)
+		    (op->data.nbytes <= CQSPI_STIG_DATA_LEN_MAX &&
+			!of_device_is_compatible(cqspi->pdev->dev.of_node,
+					    "intel,socfpga-qspi")))
 			return cqspi_command_read(f_pdata, op);
 
 		return cqspi_read(f_pdata, op);
```

Thanks and Regards,
Yoshitaka Ikeda



> -----Original Message-----
> From: Yoshitaka Ikeda <ikeda@nskint.co.jp>
> Sent: Monday, May 8, 2023 4:44 PM
> To: Dhruva Gole <d-gole@ti.com>
> Cc: linux-spi@vger.kernel.org; linux-kernel@vger.kernel.org; Vignesh
> Raghavendra <vigneshr@ti.com>; Vaishnav Achath <vaishnav.a@ti.com>;
> linux-mtd@lists.infradead.org; linux-arm-kernel@lists.infradead.org;
> Takahiro.Kuwano@infineon.com; Pratyush Yadav <ptyadav@amazon.de>;
> Mark Brown <broonie@kernel.org>
> Subject: RE: [PATCH v2 4/4] spi: cadence-quadspi: use STIG mode for small
> reads
> 
> Hi Dhruva,
> 
> > > - Error at startup
> > >    - Kernel log
> > > [    0.980598] **********spi_mem_op dump**************
> > > [    0.980613] addr: nbytes:0x0 , buswidth 0x0, dtr 0x0, val 0x0
> > > [    0.984223] cmd: nbytes:0x1 , buswidth 0x1, dtr 0x0, opcode 0x9F
> > > [    0.988656] data: nbytes:0x6 , buswidth 0x1, dtr 0x0, data dir 0x1
> > > [    0.993362] ***************************************
> > > [    0.998329] spi-nor spi0.0: found mt25ql512a, expected n25q512a
> > > [    1.006574] **********spi_mem_op dump**************
> > > [    1.006583] addr: nbytes:0x3 , buswidth 0x1, dtr 0x0, val 0x0
> > > [    1.010150] cmd: nbytes:0x1 , buswidth 0x1, dtr 0x0, opcode 0x5A
> > > [    1.014596] data: nbytes:0x10 , buswidth 0x1, dtr 0x0, data dir 0x1
> > > [    1.019285] ***************************************
> > > [    1.524271] cadence-qspi ff705000.flash: Flash command execution
> > timed out.
> >
> > This print message is from cqspi_exec_flash_cmd. This function should
> > only be called from cqspi_command_read/write .
> >
> > However, from spi_mem_op dump that you have provided above, where
> > addr.nbytes is 3 and data.nbytes is 0x10 (which is > 8) it should
> > never have entered the cqspi_command_read function.
> 
> The location of the log output is after the call to cqspi_mem_process(), so I
> assume it is called with the following data.
> 
> [ 1.533483] **********spi_mem_op dump************** [ 1.533489] addr:
> nbytes:0x3 , buswidth 0x1, dtr 0x0, val 0x10 [ 1.537055] cmd: nbytes:0x1 ,
> buswidth 0x1, dtr 0x0, opcode 0x5A [ 1.541579] data: nbytes:0x8 , buswidth 0x1,
> dtr 0x0, data dir 0x1 [ 1.546266] ***************************************
> 
> Thus, the condition is met and cqspi_command_read() is called.
> We have also applied the following patch and confirmed that it is called.
> 
> - patch
> ```
> diff --git a/drivers/spi/spi-cadence-quadspi.c
> b/drivers/spi/spi-cadence-quadspi.c
> index 64b6a460d739..8d3681e1f35c 100644
> --- a/drivers/spi/spi-cadence-quadspi.c
> +++ b/drivers/spi/spi-cadence-quadspi.c
> @@ -1365,15 +1365,21 @@ static int cqspi_mem_process(struct spi_mem
> *mem, const struct spi_mem_op *op)
>  	 * reads, prefer STIG mode for such small reads.
>  	 */
>  		if (!op->addr.nbytes ||
> -		    op->data.nbytes <= CQSPI_STIG_DATA_LEN_MAX)
> +		    op->data.nbytes <= CQSPI_STIG_DATA_LEN_MAX) {
> +			printk("----- %d:%s() (1) -----\n", __LINE__,
> __func__);
>  			return cqspi_command_read(f_pdata, op);
> +		}
> 
> +		printk("----- %d:%s() (2) -----\n", __LINE__, __func__);
>  		return cqspi_read(f_pdata, op);
>  	}
> 
> -	if (!op->addr.nbytes || !op->data.buf.out)
> +	if (!op->addr.nbytes || !op->data.buf.out) {
> +		printk("----- %d:%s() (3) -----\n", __LINE__, __func__);
>  		return cqspi_command_write(f_pdata, op);
> +	}
> 
> +	printk("----- %d:%s() (4) -----\n", __LINE__, __func__);
>  	return cqspi_write(f_pdata, op);
>  }
> 
> ```
> 
> - log
> ```
> [    0.786600] ----- 1369:cqspi_mem_process() (1) -----
> [    0.790312] **********spi_mem_op dump**************
> [    0.790319] addr: nbytes:0x0 , buswidth 0x0, dtr 0x0, val 0x0
> [    0.793885] cmd: nbytes:0x1 , buswidth 0x1, dtr 0x0, opcode 0x9F
> [    0.798325] data: nbytes:0x6 , buswidth 0x1, dtr 0x0, data dir 0x1
> [    0.803013] ***************************************
> [    0.807892] spi-nor spi0.0: found mt25ql512a, expected n25q512a
> [    0.816062] ----- 1373:cqspi_mem_process() (2) -----
> [    0.819775] **********spi_mem_op dump**************
> [    0.819782] addr: nbytes:0x3 , buswidth 0x1, dtr 0x0, val 0x0
> [    0.823348] cmd: nbytes:0x1 , buswidth 0x1, dtr 0x0, opcode 0x5A
> [    0.827792] data: nbytes:0x10 , buswidth 0x1, dtr 0x0, data dir 0x1
> [    0.832480] ***************************************
> [    0.837442] ----- 1369:cqspi_mem_process() (1) -----
> [    1.344671] cadence-qspi ff705000.flash: Flash command execution timed
> out.
> [    1.350328] **********spi_mem_op dump**************
> [    1.350334] addr: nbytes:0x3 , buswidth 0x1, dtr 0x0, val 0x10
> [    1.353901] cmd: nbytes:0x1 , buswidth 0x1, dtr 0x0, opcode 0x5A
> [    1.358427] data: nbytes:0x8 , buswidth 0x1, dtr 0x0, data dir 0x1
> [    1.363114] ***************************************
> [    1.367981] spi-nor spi0.0: operation failed with -110
> [    1.375376] spi-nor spi0.0: mt25ql512a (65536 Kbytes)
> ```
> 
> > Please can you share the exact output of uname -a where you observe
> > this error?
> 
> My environment has shortened the output of uname -a, so it may not be useful.
> Instead, I will give you information about the kernel I am using.
> It is the following (v6.3):
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id
> =457391b0380335d5e9a5babdec90ac53928b23b4
> 
> > Are you carrying any sort of local patches? Can you make sure that the
> > CQSPI_STIG_DATA_LEN_MAX is 8 in your case too?
> 
> There is no local patch and CQSPI_STIG_DATA_LEN_MAX remains 8.
> 
> --
> Thanks and Regards,
> Yoshitaka Ikeda
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
