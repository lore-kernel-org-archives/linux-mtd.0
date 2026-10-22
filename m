Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E0E606A319
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Oct 2026 08:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uA/YwY3k;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=IeNm51qS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BCBPwuQoqfkoF+9NptornoUNZHUdz44SOPZZUgw+J/Q=; b=uA/YwY3kVeOct6raTvlRDeAEw8
	oU+tS6Ah0/23D8TIMn6aAts04hNCmIouNHz+CdYjin396B8OvkKWM1jAUgEP8SHIf1vI/3jE8cpww
	PDjrWfyncMYhi/46AHZC7HWFDbd+EKI8/hCv9ZVtEvqU400D7ZNvd2W/qe8Wib1fSYZyDp0i6wfnf
	tyCo4np1MebEJhHg0/KqENfG+2Pke2ZCPT0pNhjWPaKP/VFXZdbuVWlQy/129Z8B9/eJlvLacQTpE
	sm4TOH0lzijTPvnPAr58NVQdJ5bJbvGl04u3li15v+MLlD1u71x3FxSTz/NEx/a35zqpsbVBkp0oy
	ZWyJ6UNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJoax-0000000DluA-2lv8;
	Thu, 22 Oct 2026 08:56:19 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJoar-0000000DltC-2Gn3
	for linux-mtd@lists.infradead.org;
	Thu, 22 Oct 2026 08:56:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=leHLn37W5MLVcUCN5WsLrAa4ByLteiqZQRRc65F777xBHeOrJxlmg56jdq2YzXEK9dzCLTk1c50JXGw0YFhx3kXywsqoQuZsFUm3D6zStif1X+aGhTP+EleKSVc5iKXwkxMmCAwjnsimTPPE6YPf+5gml1Wp073YysivkSZ6rjcS3OhgFPU60DtBKrAmSuEkW5YYBT3MZ8t3nXVvlCOOEqKHnqL+Tmn5PfQu95FpqvUOuzg4rCxLeio6zuvqB7EtfaUG5BdRQx4vOfN1i78rzW8Ij+wWwNSc0h/MujYjJMUOzcwRXhwKM0Xu86G2YxHsgQFPO9je4eMz7i6SzeCZEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tfi2G/TVNMwzWypspsMMLCIu1NnrCCYCEasxMLULsIw=;
 b=jOR66ejMH5R2u76PPwIerGjcJtHbzKMD+j2cjYShjnJYIxvbYwe57lXlGkQvppZWa2IGOyzFvJzIIrGD56t1nd21H7qNVm4fnHjujch17r7xJCZKOW01kheHCe1nHWr3wUk5L7zFI5UzO6UJtUVsR6bRVEQWZ95vmdl/9OdUA4tU+hbE6ALzYiphUQlzwJuuxUhCUab7BZSfLTIpBCO8RWt+YT7tGXL2nfZiry/3fhObag0s6ZaZSDc0HPFeKpuG0uGwigXPLd4bSQmxInO/gJ9MQu5xbcTUpwfsaHwbhgFbRiohIp3FO78BuRfoz0x/gkFZfVmu3bHn/giHJKDjYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tfi2G/TVNMwzWypspsMMLCIu1NnrCCYCEasxMLULsIw=;
 b=IeNm51qSjwqxB6RkjYsFNjlnNuZcELH5RfOvZ3BFlhOUQMkpeYePpnw3jwtlP8+UuNXzWNtRVNlJtmSik0jgWYOjjD5XiRFv3O202bLXQniwp9QbYy7BXlbAqF9mXro0vI6UhY0J5z/DP+Y2tymSdnQkBNDOQefYKIFIwp76s0DrLjQAUDOSTQKDnZXOnnKLD+klliHM3dllt+hlR6+ZpXXRK5/6lbHrjrscge9T28CKjWe4uiZnRa1RbFcx5bAydZ/7t8XyaZvEwshpKQD5J3piA6lz+XZFHyLQ5ZHtpoYdP2pXw2s/s6YiM90e+2nVOcOZZyAvrDwGIZrfZ2O4MA==
Received: from AS8PR04MB8820.eurprd04.prod.outlook.com (2603:10a6:20b:42f::13)
 by MA6PR04MB854626.eurprd04.prod.outlook.com (2603:10a6:250:52::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 08:56:04 +0000
Received: from AS8PR04MB8820.eurprd04.prod.outlook.com
 ([fe80::35d2:bfbc:a06e:fcb]) by AS8PR04MB8820.eurprd04.prod.outlook.com
 ([fe80::35d2:bfbc:a06e:fcb%7]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 08:56:04 +0000
From: "Bough Chen (OSS)" <haibo.chen@oss.nxp.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"Bough Chen (OSS)" <haibo.chen@oss.nxp.com>, Pratyush Yadav
	<pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, Takahiro Kuwano
	<takahiro.kuwano@infineon.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>, "michael@walle.cc"
	<michael@walle.cc>, Bough Chen <haibo.chen@nxp.com>, "Frank.Li@kernel.org"
	<Frank.Li@kernel.org>
Subject: RE: [PATCH v3] mtd: spi-nor: clear the default read_sr2 opcode for
 xSPI Profile 1.0 flashes
Thread-Topic: [PATCH v3] mtd: spi-nor: clear the default read_sr2 opcode for
 xSPI Profile 1.0 flashes
Thread-Index: AQHdYfvaQpwYcokI50GYu7pvYp0phrcJOHUAgAAJ5CA=
Date: Thu, 22 Oct 2026 08:56:03 +0000
Message-ID: <AS8PR04MB8820F1AAF591DCF5C9D0136090652@AS8PR04MB8820.eurprd04.prod.outlook.com>
References: <20261022-spi-nor-fix-v3-1-bffa00b75c27@nxp.com>
 <sashiko-outbox-181158@kernel.org>
In-Reply-To: <sashiko-outbox-181158@kernel.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8820:EE_|MA6PR04MB854626:EE_
x-ms-office365-filtering-correlation-id: ba0578fc-db4e-4459-8e37-08df301a4df9
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|19092799006|23010399003|1800799024|376014|7416014|366016|6133799003|18002099003|22082099003|3023799007|4143699003|5023799004|11063799006|38070700021|261009223027099003|261021121427099003|10067099003|56012099006;
x-microsoft-antispam-message-info: b3cUFJ54hFYjjtj+kVAjVqoCXfNSX/iFJzi5KNet63OFQOFq5u+oLkgOTqjsprGj8KdgSJIO887f41FCN3IATqJ1NJw6inY/PsLON0xLFuIZjaTyXz3jl9K8cNZ9QeI8R2dHZYBrGK/w0pputTd/0m6l8LrIpQbZ/k+GLjayq4OnQacpl2V5rj3iCh3y8nJcZ3y8WjhP0DCuGENYwPpghVS12vQhXGeXFOAZpkuxFzfsoh5/MTDAUIVsi3zT65RBIr7kAcgdyj1Kx8owcbn54q09GlTc/s5guAh1u9Vz7o/WGrifChhCMigYT9u1FoYT3iuH5fEQQePlMRW/pxkMRZLa27jYIvhNNpf9B51fjIl+Ehv47eWGoZ+eQTNvoc4jfzRMWApbQE4rbv7vGl/rfKwsKP2Zt5fhySSmpb5cZr1/0MwLZorHsMtyGVqP4VqO1cshaSep3P/3d+9PPk1Xfwz94uO9aq6waDkAT+qj2QmqqwLn9LGxJdOy5w06b5AWrYwdr8q7TlLJq13bro6GP95fyC9cP+ufnED7kS5UFkzOnYsT1IISr1WBJgodZ+wYk86uAVc4T0WAnfjJBlQ5L+dl5mETHNgCkZe5GqSmA+nCkUALlWAJriLCv0C1mbHoQCc4onSHs3J3iPvyIYiIU5UDYWaIXdiLDXb42yRLoyQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8820.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(1800799024)(376014)(7416014)(366016)(6133799003)(18002099003)(22082099003)(3023799007)(4143699003)(5023799004)(11063799006)(38070700021)(261009223027099003)(261021121427099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WkdENnE3TTY3NkJFUXlrWUxvMHRieThQSTRhRWNDK0FBemF3NVFHb29QZ1VJ?=
 =?utf-8?B?dWtMdkpqVHYxS0Q1bXdkb1p1WFJYYzduR1B6Z0hLUDFXbzYweWNCSlQ4bzRj?=
 =?utf-8?B?RWMxSm5BZ0FKeWwwNHVrQWhvRml4UXcxUWFGQ1M1c3J2WFlGYUNRNjRwbVgw?=
 =?utf-8?B?bGJ1RFh0K2JrUXNvZ3JPZE4rdThiY0hTNU5YaVE3TFRtcWgvRkhrVHZpbVVJ?=
 =?utf-8?B?ajJ3MVgzK3I2OEhwTGZXZU4yMEVvTE1mQXRlQnlHZVJxeWF5YlVhSWs5cE5N?=
 =?utf-8?B?a0VGbDZyYTlGTFF3eFljajk1Z29yZ1VSdFpCVkpSTEpBWXRSSkRKYldxdktu?=
 =?utf-8?B?bnZ6YUo3ek03VXJrbzdlRjFRN092U0EwNmVCSEFTR1BNcU13akVrUitlYmhY?=
 =?utf-8?B?UkhLTzFxRy9HSHNDcUU2bkd4cTdYRlNQM2s0VS80ekNXYmZVV2hNZUsvRldY?=
 =?utf-8?B?TlZUVTJIUS9OVUVQSXpjOWdFS2lLU2RDU0I1Z0Z4cUVkLzJPcXB4TFR5L21p?=
 =?utf-8?B?UUdOb0RoWDdRRUM0bHFyZ3g5aUVsVGN6dlZwZmV0dExZakE3dVNWMHdva1Rr?=
 =?utf-8?B?L0tuWVFFQnB0UEpBUXYzbG5PVWFwSWpNb3ZSSGlENEplRmFGeWE4ZlhTSSty?=
 =?utf-8?B?RTVQSmJZZTV6UUloR2Q4cVluWnREOVMrZnNHN3luT2VrNzFmaHZkV3pZZjJp?=
 =?utf-8?B?c0RsTS9Lc1hyNVdVTGZ1VE9hNzFnakVNT1pBY0diRjhseElZZExSZmIwb1ox?=
 =?utf-8?B?d0JFVSt6QjVkL3JJR3VRVnF0a2FqRHRHb1RyMFhZWkNtaXZjRFBiUy9zeURz?=
 =?utf-8?B?TUFJMlJ4Yjhqb2RaM1lITm1RWUU0Q1NyMFd6NkMvQlB5d05ZekRYcytyM3lh?=
 =?utf-8?B?enhoSzdPQmcxN3BMMm9vWERrZ3dzSGhSWGJZRVBmRHZJQlI5SmdXeGpvSVVS?=
 =?utf-8?B?M1RneS9nS1dQYWJhSjE4WmZrTEhHMlNwejRsSXJDKzZNejEwcndmUWNTYVBy?=
 =?utf-8?B?dTB6SXVNeFZQaFZnbzdxNk91VzdYNXlDWGp3TmRIYnZod0JIZXVmSXI0dW1q?=
 =?utf-8?B?L3M0cldCSDVKWEg2U3Z1MitUSjU1a25HamZLbEt0Qy8xUmFyS01TUTh2VUV5?=
 =?utf-8?B?REFNditScWhpOWY0T3k5elNEb201VUxGdWltRy9VZnIxWHpZMjZBTEhiZDIy?=
 =?utf-8?B?bmpJcThHWTdIZmIzbG04N2RFZ3VZY0V3M2ZzZ0ZSak4yb0ptMEZGK1NHM1B4?=
 =?utf-8?B?WTdXRy9XdCtXZ3l5THhJU09TV1BuVGd4ZTRuNTZDWHhlNzE0Q2hDVk1aYXZp?=
 =?utf-8?B?YTY5eUl4SlhzM0NqQnVOSEpHdjJNWktLamZ4bGsrNUMvUmVOc285aVZCQU9L?=
 =?utf-8?B?QWxiTUtQaS9uam9qV2d3S3pYWTVaY3lzUmlMdlo2ZkhlbEp4OWhwYjhSWCtW?=
 =?utf-8?B?QTBoSmp6SytyWDQyeGxNTlVmelBqQUxMV2grcityRWxuY1pEMncrdkx6S3BR?=
 =?utf-8?B?S2pRclFqeng4YXowUis2TDdlU0tBK25hV1V5aEJxZHFnOHpPNTlRTXFRYW9R?=
 =?utf-8?B?QlViazdaOThOUjVkOHRwRXdadVVnWVhWTW5WNERVSEFsd0ViNDZ0aWI1VmJa?=
 =?utf-8?B?dVBqRWVicW95ZjVuZVc1V3lYY2g5bTJGSFhEczREMWxSNXZPRmViNmIwYjhr?=
 =?utf-8?B?RnVFd2FPa0NiMWpPUWE2NHFNNDdHTXBwQ0F3MnhyZFFrcDV4TE50R05xb1lF?=
 =?utf-8?B?MVg5cGJreVNqTFAzNnpVRGV2am9YU3pUbFlpMCs1ekw1Sko5VmxWZWYvV2lK?=
 =?utf-8?B?Ti8xb0p6dTBnWnAwWUtxOVVYTVlCUGxLWUtqSmFSNFd0MmIvb0VDZXVQM0c0?=
 =?utf-8?B?WlJ2Q3ZLMkowWndDcFFMaXhNRm5iUzdZaEFFWlBybW0rRmpIZzZpU3NEZmRT?=
 =?utf-8?B?Sk1SKzNINHo2Wk50RExWd0FCNitBenRYUGlNL3ZsV2N4ZzYzMmhkb1lVRXJq?=
 =?utf-8?B?aHoyWCtuaXVIODY2ZVRzOGpxaVU4RENDL2s3cGVMVWpyTDlNS3BoMjRlb1Ro?=
 =?utf-8?B?cVRXeHdTWmFEZkNITVJBQVF5NUlWUEpnWmp6c29tVVlPUytPMnBRWTRLeTJs?=
 =?utf-8?B?SitpOG0xSmNjMDBoVGhqTW52WlVlazJzNWZMN1dzNGI5amZnVjEwKzUvTDZ6?=
 =?utf-8?B?U0lha0VaeHhzVEpHMzRCd3hhNlYzVEtaREpva0p5N1g0cCtwRjRWeXhUMGpY?=
 =?utf-8?B?RDhoRnJWeWNXQnhzeUFOQmUyT0lUMkluRlU5SVFmWjZLZy9jUHVXWmhLUDNq?=
 =?utf-8?Q?s7NWuY/gGAU0xY2jK4?=
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8820.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba0578fc-db4e-4459-8e37-08df301a4df9
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2026 08:56:04.0997
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fqZKNg6u8B7AKGNGR0KA798HAM4p38t7b2fgaBeLQdh8IeM76AgCLb713MswrcRRjoGiFF4hePaioSIwo8fU2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA6PR04MB854626
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_015613_772238_F252488F 
X-CRM114-Status: GOOD (  28.44  )
X-Spam-Score: -1.0 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBzYXNoaWtvLWJvdEBrZXJuZWwu
b3JnIDxzYXNoaWtvLWJvdEBrZXJuZWwub3JnPg0KPiBTZW50OiBUaHVyc2RheSwgT2N0b2JlciAy
MiwgMjAyNiA0OjIxIFBNDQo+IFRvOiBCb3VnaCBDaGVuIChPU1MpIDxoYWliby5jaGVuQG9zcy5u
eHAuY29tPjsgUHJhdHl1c2ggWWFkYXYNCj4gPHByYXR5dXNoQGtlcm5lbC5vcmc+OyBNaWNoYWVs
IFdhbGxlIDxtd2FsbGVAa2VybmVsLm9yZz47IFRha2FoaXJvDQo+IEt1d2FubyA8dGFrYWhpcm8u
a3V3YW5vQGluZmluZW9uLmNvbT47IE1pcXVlbCBSYXluYWwNCj4gPG1pcXVlbC5yYXluYWxAYm9v
dGxpbi5jb20+OyBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0PjsNCj4gVmlnbmVz
aCBSYWdoYXZlbmRyYSA8dmlnbmVzaHJAdGkuY29tPg0KPiBDYzogbGludXgtbXRkQGxpc3RzLmlu
ZnJhZGVhZC5vcmc7IGlteEBsaXN0cy5saW51eC5kZXY7IG1pY2hhZWxAd2FsbGUuY2M7DQo+IEJv
dWdoIENoZW4gPGhhaWJvLmNoZW5AbnhwLmNvbT47IEZyYW5rLkxpQGtlcm5lbC5vcmcNCj4gU3Vi
amVjdDogUmU6IFtQQVRDSCB2M10gbXRkOiBzcGktbm9yOiBjbGVhciB0aGUgZGVmYXVsdCByZWFk
X3NyMiBvcGNvZGUgZm9yDQo+IHhTUEkgUHJvZmlsZSAxLjAgZmxhc2hlcw0KPiANCj4gVGhhbmsg
eW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQgMSBwb3Rl
bnRpYWwgaXNzdWUocykNCj4gdG8gY29uc2lkZXI6DQo+IC0gW01lZGl1bV0gbXRkOiBzcGktbm9y
OiByZWFkX3NyMiBsZWZ0IHNldCBmb3IgOEQtOEQtOEQgZmxhc2hlcyB3aXRob3V0DQo+IFByb2Zp
bGUgMS4wDQo+IC0tDQo+IA0KPiBjb21taXQgZWY0MDc5ZTNhZWEyMDE0ODkwZTA4ZGYzMWVhNGQ4
Nzc1YTM5MmY4MQ0KPiBBdXRob3I6IEhhaWJvIENoZW4gPGhhaWJvLmNoZW5AbnhwLmNvbT4NCj4g
DQo+IG10ZDogc3BpLW5vcjogY2xlYXIgdGhlIGRlZmF1bHQgcmVhZF9zcjIgb3Bjb2RlIGZvciB4
U1BJIFByb2ZpbGUgMS4wIGZsYXNoZXMNCj4gDQo+IFRoaXMgY29tbWl0IGNsZWFycyBwYXJhbXMt
Pm9wY29kZXMucmVhZF9zcjIgaW4gc3BpX25vcl9wYXJzZV9wcm9maWxlMSgpIHNvDQo+IHRoYXQg
Zmxhc2hlcyB3aXRoIGFuIHhzcGkgcHJvZmlsZSAxLjAgdGFibGUgZG8gbm90IGlzc3VlIGFuIHVu
c3VwcG9ydGVkDQo+IDB4MzUgcmVnaXN0ZXIgcmVhZCB3aGVuIHJ1bm5pbmcgaW4gb2N0YWwgZHRy
IG1vZGUuDQo+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL3NmZHAuYyBi
L2RyaXZlcnMvbXRkL3NwaS1ub3Ivc2ZkcC5jDQo+ID4gaW5kZXggNGEzZjgyZTk3Y2VmOC4uNzIy
ZWVmZjcxZDBkZiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL3NmZHAuYw0K
PiA+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc2ZkcC5jDQo+ID4gQEAgLTEzNDQsNiArMTM0
NCwxNyBAQCBzdGF0aWMgaW50IHNwaV9ub3JfcGFyc2VfcHJvZmlsZTEoc3RydWN0IHNwaV9ub3IN
Cj4gKm5vciwNCj4gPiAgCSAqLw0KPiA+ICAJbm9yLT5wYXJhbXMtPmh3Y2Fwcy5tYXNrIHw9IFNO
T1JfSFdDQVBTX1BQXzhfOF84X0RUUjsNCj4gPg0KPiA+ICsJLyoNCj4gPiArCSAqIFRoZSB4U1BJ
IFByb2ZpbGUgMS4wIHRhYmxlIGRvZXMgbm90IGRlc2NyaWJlIGEgUmVhZCBDb25maWd1cmF0aW9u
DQo+ID4gKwkgKiBSZWdpc3RlciAoUkRDUiwgMzVoKSBpbnN0cnVjdGlvbiwgYW5kIHRoZSBzaW5n
bGUtYnl0ZSBSRENSIGRlZmF1bHQNCj4gPiArCSAqIGlzIG5vdCB1c2FibGUgaW4gOEQtOEQtOEQg
bW9kZS4gRHJvcCB0aGUgU1IyIHJlYWQgb3Bjb2RlIGZvcg0KPiB0aGVzZQ0KPiA+ICsJICogb2N0
YWwtY2FwYWJsZSBmbGFzaGVzIHNvIHNwaV9ub3JfcmVhZF9zcjFfYW5kX3NyMigpIGRlZ3JhZGVz
IHRvDQo+IGFuDQo+ID4gKwkgKiBTUjEtb25seSByZWFkIGFuZCBzcGlfbm9yX2luaXQoKSBkb2Vz
IG5vdCBpc3N1ZSBhbiB1bnN1cHBvcnRlZA0KPiA+ICsJICogY29tbWFuZCB0aGF0IHRoZSBmbGFz
aCBuZXZlciBhbnN3ZXJzLiBBIG1hbnVmYWN0dXJlciBkcml2ZXIgdGhhdA0KPiA+ICsJICogYWN0
dWFsbHkgbmVlZHMgU1IyIGNhbiBpbnN0YWxsIGl0cyBvd24gb3Bjb2RlIGluIGEgbGF0ZXIgZml4
dXAuDQo+ID4gKwkgKi8NCj4gPiArCW5vci0+cGFyYW1zLT5vcGNvZGVzLnJlYWRfc3IyID0gMDsN
Cj4gDQo+IFtTZXZlcml0eTogTWVkaXVtXQ0KPiBXaGF0IGhhcHBlbnMgb24gb2N0YWwgZHRyIGZs
YXNoZXMgdGhhdCBkbyBub3QgcHVibGlzaCBhbiB4c3BpIHByb2ZpbGUgMS4wDQo+IHRhYmxlLCBz
byBzcGlfbm9yX3BhcnNlX3Byb2ZpbGUxKCkgaXMgbmV2ZXIgY2FsbGVkPw0KPiANCj4gU3BlY2lm
aWNhbGx5LCBzb21lIGJhdGNoZXMgb2YgdGhlIE1pY3JvbiBtdDM1eHU1MTJhYmEgbGFjayB0aGUg
cHJvZmlsZSAxLjANCj4gdGFibGUgYW5kIGluc3RlYWQgY29uZmlndXJlIFNOT1JfUFJPVE9fOF84
XzhfRFRSIGluDQo+IGRyaXZlcnMvbXRkL3NwaS1ub3IvbWljcm9uLXN0LmM6bXQzNXh1NTEyYWJh
X3Bvc3Rfc2ZkcF9maXh1cCgpOg0KPiANCj4gCW5vci0+cGFyYW1zLT5od2NhcHMubWFzayB8PSBT
Tk9SX0hXQ0FQU19SRUFEXzhfOF84X0RUUjsNCj4gCXNwaV9ub3Jfc2V0X3JlYWRfc2V0dGluZ3Mo
Jm5vci0+cGFyYW1zLQ0KPiA+cmVhZHNbU05PUl9DTURfUkVBRF84XzhfOF9EVFJdLA0KPiAJCQkJ
ICAwLCAyMCwgU1BJTk9SX09QX01UX0RUUl9SRCwNCj4gCQkJCSAgU05PUl9QUk9UT184XzhfOF9E
VFIpOw0KPiAJLi4uDQo+IAlub3ItPnBhcmFtcy0+aHdjYXBzLm1hc2sgfD0gU05PUl9IV0NBUFNf
UFBfOF84XzhfRFRSOw0KPiAJc3BpX25vcl9zZXRfcHBfc2V0dGluZ3MoJm5vci0+cGFyYW1zLQ0K
PiA+cGFnZV9wcm9ncmFtc1tTTk9SX0NNRF9QUF84XzhfOF9EVFJdLA0KPiAJCQkJU1BJTk9SX09Q
X1BQXzRCLA0KPiBTTk9SX1BST1RPXzhfOF84X0RUUik7DQo+IA0KPiBJbiBkcml2ZXJzL210ZC9z
cGktbm9yL3NmZHAuYzpzcGlfbm9yX3BhcnNlX2JmcHQoKSwgcGFyYW1zLQ0KPiA+b3Bjb2Rlcy5y
ZWFkX3NyMiBpcyBpbml0aWFsaXplZCB0byBTUElOT1JfT1BfUkRDUiAoMHgzNSkgYW5kIHJlbWFp
bnMgc2V0DQo+IHdoZW4gdGhlIHF1YWQgZW5hYmxlIHJlcXVpcmVtZW50cyBmaWVsZCBjb250YWlu
cyBhIHJlc2VydmVkIHZhbHVlICh3aGljaA0KPiBtdDM1eHU1MTJhYmFfcG9zdF9zZmRwX2ZpeHVw
KCkgbm90ZXMgaXMgdGhlIGNhc2Ugb24gdGhpcyBwYXJ0KSBvcg0KPiBCRlBUX0RXT1JEMTVfUUVS
X05PTkU6DQo+IA0KPiAJcGFyYW1zLT5vcGNvZGVzLnJlYWRfc3IxID0gU1BJTk9SX09QX1JEU1I7
DQo+IAlwYXJhbXMtPm9wY29kZXMucmVhZF9zcjIgPSBTUElOT1JfT1BfUkRDUjsNCj4gCS4uLg0K
PiAJZGVmYXVsdDoNCj4gCQlkZXZfZGJnKG5vci0+ZGV2LCAiQkZQVCBRRVIgcmVzZXJ2ZWQgdmFs
dWUgdXNlZFxuIik7DQo+IAkJYnJlYWs7DQo+IA0KPiBTaW1pbGFybHksIG5vbi1zZmRwIGZsYXNo
ZXMgaW5pdGlhbGl6ZWQgd2l0aCBTUElfTk9SX09DVEFMX0RUUl9SRUFEIGluDQo+IGRyaXZlcnMv
bXRkL3NwaS1ub3IvY29yZS5jOnNwaV9ub3Jfbm9fc2ZkcF9pbml0X3BhcmFtcygpIGVuYWJsZQ0K
PiBTTk9SX0hXQ0FQU19SRUFEXzhfOF84X0RUUiB3aGlsZSBsZWF2aW5nIHBhcmFtcy0+b3Bjb2Rl
cy5yZWFkX3NyMg0KPiBzZXQgdG8gU1BJTk9SX09QX1JEQ1IgZnJvbSBzcGlfbm9yX2luaXRfZGVm
YXVsdF9wYXJhbXMoKS4NCj4gDQo+IFdoZW4gc3BpX25vcl9pbml0KCkgc3dpdGNoZXMgdGhlc2Ug
Zmxhc2hlcyB0byBTTk9SX1BST1RPXzhfOF84X0RUUiB2aWENCj4gc3BpX25vcl9zZXRfb2N0YWxf
ZHRyKCkgYW5kIHRoZW4gcnVuczoNCj4gDQo+ICAgc3BpX25vcl9pbml0KCkNCj4gICAgIC0+IHNw
aV9ub3JfY2FjaGVfc3JfbG9ja19iaXRzKCkNCj4gICAgICAgLT4gc3BpX25vcl9yZWFkX3NyMV9h
bmRfc3IyX2NhcmVmdWwoKQ0KPiAgICAgICAgIC0+IHNwaV9ub3JfcmVhZF9zcjJfY2FyZWZ1bCgp
DQo+ICAgICAgICAgICAtPiBzcGlfbm9yX3JlYWRfc3JfbGwoKQ0KPiANCj4gd291bGRuJ3QgdGhp
cyBzdGlsbCBpc3N1ZSB0aGUgdW5zdXBwb3J0ZWQgMHgzNTM1IHJlZ2lzdGVyIHJlYWQgaW4NCj4g
U05PUl9QUk9UT184XzhfOF9EVFIgbW9kZSBhbmQgZmFpbCBwcm9iZSBvciByZXN1bWUgd2l0aCBh
IGNvbnRyb2xsZXINCj4gdGltZW91dD8NCg0KSGkgTWlxdWVsLA0KDQpUaGUgU2FzaGlrbyBBSSBy
ZXZpZXcgcmFpc2VkIGEgdmFsaWQgcG9pbnQgb24gdjMuDQoNCkkgc2VlIHRocmVlIHdheXMgdG8g
Z28sIHdoaWNoIGRvIHlvdSBwcmVmZXI/DQoNCjEsIEtlZXAgdGhlIHYzIGFwcHJvYWNoIChjbGVh
ciBpbiBzcGlfbm9yX3BhcnNlX3Byb2ZpbGUxKCkpIGFuZCBmaXggdGhlIHJlbWFpbmluZw0KICAg
IGNhc2VzIG9uZSBieSBvbmUsIGNsZWFyaW5nIHJlYWRfc3IyIGluIGVhY2ggcmVsZXZhbnQgZml4
dXAgDQogICAgKGUuZy4gbXQzNXh1NTEyYWJhX3Bvc3Rfc2ZkcF9maXh1cCkgLyBuby1TRkRQIHBh
dGguDQoNCjIsIE1vdmUgdGhlIGNsZWFyIGludG8gc3BpX25vcl9sYXRlX2luaXRfcGFyYW1zKCks
IGdhdGVkIG9uIHRoZSA4RCByZWFkIGNhcGFiaWxpdHkNCiAgICAoaHdjYXBzICYgU05PUl9IV0NB
UFNfUkVBRF84XzhfOF9EVFIpIGFuZCByZWFkX3NyMiA9PSBSRENSLCBzbyBhbGwgOEQgDQogICAg
cGF0aHMgYXJlIGNvdmVyZWQgaW4gb25lIHBsYWNlLiANCiAgICBUaGUgZG93bnNpZGU6IGxhdGVf
aW5pdCBydW5zIGFmdGVyIHRoZSBtYW51ZmFjdHVyZXIgZml4dXBzLCBzbyBpZiBhIHZlbmRvciBs
YXRlcg0KICAgIHdhbnRzIHRvIHNldCBpdHMgb3duIFNSMiBvcGNvZGUgZm9yIDhEIGl0IHdvdWxk
IGJlIGNsb2JiZXJlZCBoZXJlIGFuZCBvdmVycmlkaW5nDQogICAgIGl0IGNsZWFubHkgYmVjb21l
cyBhd2t3YXJkLg0KDQozLCBHbyBiYWNrIHRvIHRoZSB2MiBhcHByb2FjaCAoY2xlYXIgaW4gc3Bp
X25vcl9zZXRfb2N0YWxfZHRyKCkgd2hlbiB0aGUgc3dpdGNoIHRvIDhEDQogICAgYWN0dWFsbHkg
c3VjY2VlZHMpLiBUaGlzIGNvdmVycyBldmVyeSBwYXRoIHRoYXQgZW5kcyB1cCBpbiA4RCByZWdh
cmRsZXNzIG9mIGhvdyB0aGUgDQogICAgY2FwYWJpbGl0eSB3YXMgZGlzY292ZXJlZCwgYnV0IGl0
IGlzIHJ1bnRpbWUtcHJvdG9jb2wgYmFzZWQgcmF0aGVyIHRoYW4gY2FwYWJpbGl0eSANCiAgICBi
YXNlZCwgd2hpY2ggeW91IGRpZG4ndCBwcmVmZXIgZWFybGllci4gQW5kIHRoaXMgbWV0aG9kIGhh
cyB0aGUgc2FtZSBkb3duc2lkZSBhcw0KICAgIG1ldGhvZCAyLg0KDQpSZWdhcmRzDQpIYWlibyBD
aGVuDQo+IA0KPiA+ICsNCj4gPiAgb3V0Og0KPiA+ICAJa2ZyZWUoZHdvcmRzKTsNCj4gPiAgCXJl
dHVybiByZXQ7DQo+IA0KPiAtLQ0KPiBTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hp
a28uZGV2LyMvcGF0Y2hzZXQvMjAyNjEwMjItc3BpLW5vci1maXgtdjMtMS0NCj4gYmZmYTAwYjc1
YzI3QG54cC5jb20/cGFydD0xDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
