Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A6DC77B75
	for <linux-mtd@archiver.kernel.org>; Mon,  8 May 2023 07:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mn3qes/wANhf6odhZXit61zpQeLbt30TpmpBkU3u94M=; b=JMHqJ748ChkugQ
	CkS1VCeb9nQJAabC0ZpfPFvROwJxYDAJgGPcVuYK8vm9A4t+HjoNqYW3RToMHnBQtmViZ+LcO2yy+
	jxPccFnz4gibdKhZBSIQyPDHpjfDgrOe7hRqg4HGTNqu93uqzOJSXApQD9PNqLgrO3VRORn4pJUdH
	V/QcHFlLy6tlTLWzrIwJT7Xpt+gJBbHkr5WO7OJyA19glUh5dTPd/9fpQK0BGWGuJadKymC6mkn4h
	97iZ3786UJuLRTauQ1zba5J03VhXvO0GLtOFhQpMBtz8foPx/57+VxBh4k8yZ0fTjW3Yr5Hgd4Jm4
	L+XPbn0Blu3V1K9DIM5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvvXa-00HVZP-0z;
	Mon, 08 May 2023 07:44:14 +0000
Received: from mail-os0jpn01on2061d.outbound.protection.outlook.com ([2a01:111:f403:700c::61d] helo=JPN01-OS0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvvXW-00HVXS-0c;
	Mon, 08 May 2023 07:44:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WE8wsVg22hp5a/YrrulPnGVmwgZDP3mkuP7mgDDTLkLbDb3+L5ayMGtva2WsUKWV2lmpbfs7aLwRrrBXo5xJ5r3wvTjWrtcP2eUmGszTg2ly8KbzxD8NxvkN0+kXnI0ioWSb8/yDoa4l90TsecG45XM6B0hugJgVplKbG46OOc1yqS1RCGE+GCvOlUku/b/ltp2ExeUlSuZQD2MnI1kAQ8oLjTeS0ekMRqewT6bgTms6lPcxw9qrDoQV+Z2YGQZ7uTGjzCgCIGSzyxSPMQ5UIPKM+FxXUos0pB9yFnCsgt06vSaWVF1c4Z5uVcDeGyo+hIfwBareDddZvmUn3+33qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RpHXR7pqNO0w3RUYiYK6pnW4ZAgecQxrzhXyT0bn5DE=;
 b=RS4lT91E1tIP1SneHva+fOFkMgRpdSDN4NG/Y0UGirh4h5WX66Ibt2/U6rHtKwmuhY3prgC6RomF/b0z258T7gcrzab9csPWj40vXcG5QBLSYn9P7N+6Tnlj/booQP/EQM9RyFop8bdu0oJqlw3C+vmiUFq1gx9udyOht96RSMAeQl1xuOE5j5RCYXcPJA0msv7DsTImalIvMnTcD30051fU6BN3k9525BlxnANQP6fW0RZSHOx6rmxvyQXoip/yA/n20fKQ/EpeGwSjP/3xBM3rlWr27cPPHOmfEv6tDqpNuJe9VInik8KT7KZntLrpJXExZr0qe+X+OGSmvBhxPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nskint.co.jp; dmarc=pass action=none header.from=nskint.co.jp;
 dkim=pass header.d=nskint.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nskint.onmicrosoft.com; s=selector1-nskint-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RpHXR7pqNO0w3RUYiYK6pnW4ZAgecQxrzhXyT0bn5DE=;
 b=Cjpuuo7GLjPGlyk4tJzFXQjL2aSgdcMlTmfjyIrbIcGOqMStYiKj5ykCEs2VlI8PE+RjTO8VUkfDXo0vimI9t5LfdmMx1UDXbwIPkBOZzClbDOldh+SdLpxfVRXT51GhHucp895J+xTd/VI0ztR+Y78isYa9p8hZ0KxD8g7jxnA=
Received: from OSZPR01MB7004.jpnprd01.prod.outlook.com (2603:1096:604:13c::9)
 by TY3PR01MB11370.jpnprd01.prod.outlook.com (2603:1096:400:36e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 07:44:01 +0000
Received: from OSZPR01MB7004.jpnprd01.prod.outlook.com
 ([fe80::148a:7cac:32d9:1c03]) by OSZPR01MB7004.jpnprd01.prod.outlook.com
 ([fe80::148a:7cac:32d9:1c03%5]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 07:44:01 +0000
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
Thread-Index:  AQHZMJVBHgHXafuso0ywMCCxmHrW5689ZDXggABfGwCAARZ4MIAA3JcAgBBuwJCAAFXLgIAAGoLg
Date: Mon, 8 May 2023 07:44:01 +0000
Message-ID:  <OSZPR01MB7004DE3578325B0F51C5CE598B719@OSZPR01MB7004.jpnprd01.prod.outlook.com>
References: <20230125081023.1573712-1-d-gole@ti.com>
 <20230125081023.1573712-5-d-gole@ti.com>
 <OSZPR01MB70048CE259A3D63C4179199A8B659@OSZPR01MB7004.jpnprd01.prod.outlook.com>
 <044a723e-b81e-f6f2-8bf7-3680a10abc86@ti.com>
 <OSZPR01MB7004D229048A950C93B40CC88B6A9@OSZPR01MB7004.jpnprd01.prod.outlook.com>
 <b1d30948-ba3d-a4cc-e1ed-851a9dedba7c@ti.com>
 <OSZPR01MB7004907B2FB95F45E9B83FEC8B719@OSZPR01MB7004.jpnprd01.prod.outlook.com>
 <11c63702-cd25-67c9-d0bc-21ec47e14c98@ti.com>
In-Reply-To: <11c63702-cd25-67c9-d0bc-21ec47e14c98@ti.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nskint.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSZPR01MB7004:EE_|TY3PR01MB11370:EE_
x-ms-office365-filtering-correlation-id: 57fedfc7-5a8a-4515-e0f2-08db4f97fd7f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  QcdoI9falS5qAsUTqam/lZLV6tuxA/J/eZ3N1rHZ5J8hAo5plF9pEyYNIAoUpY1LmZupDLnO1szH0nJhxtJEo1rjG9t7k9D9EONEZuLN6bW2KWeATmcqwdv35dxRHSjxAc2XwriT4TxT/Ui8laebKlmtlv0uk+bE8MFlb9GATFCYvgrkJKU65uPNGpS15HKvXY2cl4/eA4OxqkucHugOnfo61LoMMo+GBEClgILl1x2zDZ+hqRsTIMOmMAnwzWtABtoRp5+L3z2NjLBbLSt7Q/s+6r0V16/Ja0HKIuNEzpNZNHlpiRrZAm1FAa9lxNOctLc4mNR4Tl0c4uzmtNA1dc0SU8QqRTJEPFPvfBWko2OB+B2Sw9AJLdorGGS62pX3N5MYjStH6hvA1i5/2U6/uiykP33dFulKFM3P5g0QOflfKaYCnJ8GjA4rJItWkqUzPjNLCt6TDaLzrY5V83ysXokokzhcHXpqr12Tj0V8EyMhfvPOR1Ax41MAakyhx8AW92yiuxEJcvIrmrIwtE/snnAf5uEXCrGUwJXIeO/CRxuAuawi69TZj8FlzS+onnTM1Uslm02KOpZIxd8tDcxQMN5WBjQikQb4G43Mb8bUZAc=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB7004.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39840400004)(136003)(396003)(376002)(366004)(451199021)(83380400001)(186003)(2906002)(38100700002)(33656002)(86362001)(38070700005)(122000001)(55016003)(7696005)(8936002)(8676002)(966005)(316002)(71200400001)(41300700001)(7416002)(5660300002)(52536014)(54906003)(66946007)(6916009)(4326008)(76116006)(66476007)(66556008)(64756008)(478600001)(66446008)(6506007)(9686003)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?V2Y2NGoyT29ZMVZWOGtrNisycmdJTTNYRGQ4dVJZdzY5TDFhc0xSTEJXOGVo?=
 =?utf-8?B?eVQvcVlKR08ybDc2VUdpb1RBZ1Q3bjlQc3JJYSt1ZjIwcjRKVVBNQ25yWmZk?=
 =?utf-8?B?MXBZN0xnc3hwV2t2TGhVWkVBaUgzYm9ZdjVaYjF2VVRiMzltK055R3ZidkpZ?=
 =?utf-8?B?SGNiLy9tYU1ZcGpCWkJMc3NsMFhqNnBsbXRGOUpEOFRJMmhKM2pZWi9PcVlC?=
 =?utf-8?B?c2h0R1NZeklBZ2lONUNEbS9RQTVSQmZLRFRQUkFvQjVoTWlnNGsraHZ0SWRu?=
 =?utf-8?B?dEpzWVhMc29LMU01dFBQSGE3ak1NcksrSk50dmx1RTlTVkRsMDFGTVJ3Q3FC?=
 =?utf-8?B?ODhoS3JSaHZRR1F3eWlOZlFibC9Qc0V6YVVoK1dBT1Y0c3VVMkxUQk1Vengw?=
 =?utf-8?B?cURMTExzaUowUGdhQ2hXd3JmZk9mY3pnQmtaVUlXSW5CbVhCSkdHd2UyUFpM?=
 =?utf-8?B?NUVJeWgrUExjelR0QXpxb1hDVVNxMXRIb25rZVI1RlBMaWJZM3pLZnFDVEVO?=
 =?utf-8?B?T3hhZmRYREhrYko0VzNNZlowQ2tDK0NxT0tMRlY3ZUV4NXpnOSt0SFdOSkt1?=
 =?utf-8?B?d1dtSHRBWXQxTDVIQnNjdDM2UTRrVkdNbVVjOUJSeFJWT0N3WjY3WktoSEpY?=
 =?utf-8?B?TUxmdVhObVNiUm1DL2g3KzZmYUgrY21kUDBpbFlKbUdFR3BHMzJ3bXdnQWd6?=
 =?utf-8?B?aHVWSXIxUjd3Q2s5em5OUnZQUitUQWNjZmRQdkJ1WldEbVRJN09yc1B0dTR2?=
 =?utf-8?B?WUdqZUJrMXlpTGJmUDlQQTl4ZHZVRlI3OGtLSTFaMkFtWDNwUkp3cEtUU1p1?=
 =?utf-8?B?YzBadHFOOStlMFZXZzZ1Y2JEZlVKNGNSU2haYk15YnBWenZ3MTNNelRvSktW?=
 =?utf-8?B?RzBpejFPN2hQeFh0NWlSWGNTRjNjeVZybmtyWFNRM3VRSWdzQyt3dWs2Vk04?=
 =?utf-8?B?c0tnd1JLK1Z1T3NTRDRIanZlNGxCUVpNQWVNME5zRHJ4eEJIZUF5QUxwOTdl?=
 =?utf-8?B?aUQzSDRlS2d5OURhSU9Zb0RVd1ZFNHo0N1VqTm9PZHpCbmloL05Hc0FxT2JQ?=
 =?utf-8?B?Ujk1RWpIUnRaZUZHMHhRY0ZOWk9pNTJ3SkxFK2xIaU1UYkpxTGY2M2ZMMmln?=
 =?utf-8?B?OHZPTFB1RW43T0UzMmdmNyt5RUpQOUNkSGFwUHRvOVM1dTZTeEp1RE9LeEZv?=
 =?utf-8?B?cURlV1lYSCtzVDdJSzZsdE9UYjQ2WHdjRXpVcHIwTlE0WnNVMUVMVFlrYnpt?=
 =?utf-8?B?RHd4Vm5xRUtoV2o5SEVhbU16bmZhYWNtL25SbERHZXI0anZxQ3owYlBxV3dO?=
 =?utf-8?B?NGhiek91TEdVRUxuOVJ6K1drR1hJVHVKYk9aSHg4TXJkNXVoUityYXdVdjZ5?=
 =?utf-8?B?aEt6N1F2UFI3aEtSVWU1R1NpbFNjdEVwMzh6dk01anZzWWtmN0F1dFM3Z2ty?=
 =?utf-8?B?OWpObVZLVDBCWG9iWlN5SHVLWE5uYUd1bGN6dWZkek4zazZvQkVBQ0t0bVpk?=
 =?utf-8?B?ZGdzc0RsbXhWSjYyamw5dm9mdmt1WFkxQWlFdTdVUld5UXkrcW1QRGU5SG9E?=
 =?utf-8?B?TFhhdUQwR1poaFcvMkJ5YnVUd0RsNno1VXBHQjlzd2ZYejNMU0FLWG95WTBm?=
 =?utf-8?B?d29mU0hUQkFLSWcyOWJ5VkdHYWxCMVlic1hvSklxREs0ZkJzcTNlMm1kNzZq?=
 =?utf-8?B?SGhDeEtaZE5kZlZiT2tZbXcySVRvSXA0Z2ZTWkhJQkJlNi90RnQ0MEZSWFIz?=
 =?utf-8?B?S2F6VXNyQmMzR2JpWmRvaEFJZndNR1JKNk9zdy85b2ppeldlOVd6UjdzREsy?=
 =?utf-8?B?aGdQUjdZL2lJcnNTY0l0SFlZSjRkdkY0Q3YxMUdaM1hiSnpKcjBHWWZYQllv?=
 =?utf-8?B?ZkdyRU5WdHVOQmpCTnNWTnpNQXRIT0pCMW0vbzBJbTd6Nmk2Qlp6YkZpOVJs?=
 =?utf-8?B?TzExZUI1bXZ3Z1JSNlhsV1I2dVl2S2R3RDNrL2tKc090c2xYenlNZmNZdmor?=
 =?utf-8?B?eHhscmVaQlErVUtjTlRxS0J4aXNIR2piREJGTHB5cnh6V3FZc1lkMTNTUTEz?=
 =?utf-8?B?RWZUNkUxa1p3d2F0UlRQc1V3QTdMRE9CaHZjakhxRnFTNFRYNGs0Y1VZL1o2?=
 =?utf-8?Q?xWwiYSZ9Fi6GKqbUqY7J/nff6?=
MIME-Version: 1.0
X-OriginatorOrg: nskint.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB7004.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57fedfc7-5a8a-4515-e0f2-08db4f97fd7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2023 07:44:01.4107
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 727455a2-9822-4451-819f-f03e059d1a55
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u2fws7BK4abYGKXk9Aqrz/ms4VDx7fYhxsjAr3rZGEicVJyqLVnWsJpCOv2+w6fNlPb3EnVoWfA6XlKS87+1gA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11370
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_004410_409891_488591A7 
X-CRM114-Status: GOOD (  17.83  )
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

> > - Error at startup
> >    - Kernel log
> > [    0.980598] **********spi_mem_op dump**************
> > [    0.980613] addr: nbytes:0x0 , buswidth 0x0, dtr 0x0, val 0x0
> > [    0.984223] cmd: nbytes:0x1 , buswidth 0x1, dtr 0x0, opcode 0x9F
> > [    0.988656] data: nbytes:0x6 , buswidth 0x1, dtr 0x0, data dir 0x1
> > [    0.993362] ***************************************
> > [    0.998329] spi-nor spi0.0: found mt25ql512a, expected n25q512a
> > [    1.006574] **********spi_mem_op dump**************
> > [    1.006583] addr: nbytes:0x3 , buswidth 0x1, dtr 0x0, val 0x0
> > [    1.010150] cmd: nbytes:0x1 , buswidth 0x1, dtr 0x0, opcode 0x5A
> > [    1.014596] data: nbytes:0x10 , buswidth 0x1, dtr 0x0, data dir 0x1
> > [    1.019285] ***************************************
> > [    1.524271] cadence-qspi ff705000.flash: Flash command execution
> timed out.
> 
> This print message is from cqspi_exec_flash_cmd. This function should only
> be called from cqspi_command_read/write .
> 
> However, from spi_mem_op dump that you have provided above, where
> addr.nbytes is 3 and data.nbytes is 0x10 (which is > 8) it should never have
> entered the cqspi_command_read function.

The location of the log output is after the call to cqspi_mem_process(), so I assume it is called with the following data.

[ 1.533483] **********spi_mem_op dump**************
[ 1.533489] addr: nbytes:0x3 , buswidth 0x1, dtr 0x0, val 0x10
[ 1.537055] cmd: nbytes:0x1 , buswidth 0x1, dtr 0x0, opcode 0x5A
[ 1.541579] data: nbytes:0x8 , buswidth 0x1, dtr 0x0, data dir 0x1
[ 1.546266] ***************************************

Thus, the condition is met and cqspi_command_read() is called.
We have also applied the following patch and confirmed that it is called.

- patch
```
diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
index 64b6a460d739..8d3681e1f35c 100644
--- a/drivers/spi/spi-cadence-quadspi.c
+++ b/drivers/spi/spi-cadence-quadspi.c
@@ -1365,15 +1365,21 @@ static int cqspi_mem_process(struct spi_mem *mem, const struct spi_mem_op *op)
 	 * reads, prefer STIG mode for such small reads.
 	 */
 		if (!op->addr.nbytes ||
-		    op->data.nbytes <= CQSPI_STIG_DATA_LEN_MAX)
+		    op->data.nbytes <= CQSPI_STIG_DATA_LEN_MAX) {
+			printk("----- %d:%s() (1) -----\n", __LINE__, __func__);
 			return cqspi_command_read(f_pdata, op);
+		}
 
+		printk("----- %d:%s() (2) -----\n", __LINE__, __func__);
 		return cqspi_read(f_pdata, op);
 	}
 
-	if (!op->addr.nbytes || !op->data.buf.out)
+	if (!op->addr.nbytes || !op->data.buf.out) {
+		printk("----- %d:%s() (3) -----\n", __LINE__, __func__);
 		return cqspi_command_write(f_pdata, op);
+	}
 
+	printk("----- %d:%s() (4) -----\n", __LINE__, __func__);
 	return cqspi_write(f_pdata, op);
 }

```

- log
```
[    0.786600] ----- 1369:cqspi_mem_process() (1) -----
[    0.790312] **********spi_mem_op dump**************
[    0.790319] addr: nbytes:0x0 , buswidth 0x0, dtr 0x0, val 0x0
[    0.793885] cmd: nbytes:0x1 , buswidth 0x1, dtr 0x0, opcode 0x9F
[    0.798325] data: nbytes:0x6 , buswidth 0x1, dtr 0x0, data dir 0x1
[    0.803013] ***************************************
[    0.807892] spi-nor spi0.0: found mt25ql512a, expected n25q512a
[    0.816062] ----- 1373:cqspi_mem_process() (2) -----
[    0.819775] **********spi_mem_op dump**************
[    0.819782] addr: nbytes:0x3 , buswidth 0x1, dtr 0x0, val 0x0
[    0.823348] cmd: nbytes:0x1 , buswidth 0x1, dtr 0x0, opcode 0x5A
[    0.827792] data: nbytes:0x10 , buswidth 0x1, dtr 0x0, data dir 0x1
[    0.832480] ***************************************
[    0.837442] ----- 1369:cqspi_mem_process() (1) -----
[    1.344671] cadence-qspi ff705000.flash: Flash command execution timed out.
[    1.350328] **********spi_mem_op dump**************
[    1.350334] addr: nbytes:0x3 , buswidth 0x1, dtr 0x0, val 0x10
[    1.353901] cmd: nbytes:0x1 , buswidth 0x1, dtr 0x0, opcode 0x5A
[    1.358427] data: nbytes:0x8 , buswidth 0x1, dtr 0x0, data dir 0x1
[    1.363114] ***************************************
[    1.367981] spi-nor spi0.0: operation failed with -110
[    1.375376] spi-nor spi0.0: mt25ql512a (65536 Kbytes)
```

> Please can you share the exact output of uname -a where you observe this
> error?

My environment has shortened the output of uname -a, so it may not be useful.
Instead, I will give you information about the kernel I am using.
It is the following (v6.3):
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=457391b0380335d5e9a5babdec90ac53928b23b4

> Are you carrying any sort of local patches? Can you make sure that the
> CQSPI_STIG_DATA_LEN_MAX is 8 in your case too?

There is no local patch and CQSPI_STIG_DATA_LEN_MAX remains 8.

-- 
Thanks and Regards,
Yoshitaka Ikeda
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
