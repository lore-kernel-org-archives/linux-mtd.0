Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75DA8C54FD0
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 07:41:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 476A42051A
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 07:41:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B3Z2N5ug";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="0a85zzfZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="YV3pmfnn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 476A42051A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5qjWucLUfcACsqIkCP5jdVMgtMUZ+BdJOVFeE+0XBJA=; b=B3Z2N5ugHbFkX2
	bPAcdoOaZzCsC1SoW32xWDNZUdJWi3IWjtAHgzJuiflzTQofQMNy5bMAsXaAudy6l6IlybOft2MlE
	vYwoo6kP6h50byuHYB2LEU5WoIV1J7uVaiIzptN+5pnhAdudvufVOzmoxLecVV4KmumW2ahNF9K01
	LaKBR6fGwDMzqOj412cPAE/1UMlt/pqRX/oAJSl54jCDwIzpS+0Y3ypiXx724Zk8iozVQthEDjL4K
	8Rxwm524dvTGjsbldT+BqB2bPjDPUShLmNKqbza+/46XSeURTkYydKwIT3Xq1pl2yjhvMTvFemI17
	mAJ1BvSajyFRqbHroknQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jSyO3-00080A-4K; Mon, 27 Apr 2020 07:41:07 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jSyNy-0007wT-BJ
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 07:41:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1587973262; x=1619509262;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=etMvnHCkUK93kBmHjE+Mrg/+AQarBBrxP9B2e1N6Wg8=;
 b=0a85zzfZbkqMV1JkVCs4m0B4y1pQP/fjKsx/pRlr9x2XjPLycnJJhaAG
 NWMmBzuwroHSQUd8GEbLOY+L+XzFDDejM6L04ImSMiRU/6f2JqjI5q9Y/
 ZfhibM8b07CrLhRrpRHUM4Jk5E/04Ou+NgWQYIwpWoDkcFm5Ds5I7LjGz
 akesouSLK4miFkF3C2W8aDkn3h2AX9nfiIiQKapnz8dX5U1dJJhfbKjrf
 LdEBFrQGZi25zL4p87T0XeuqbBlJ0EndNwX55jaJrrs8O2bgXcCRLNvLj
 He9kN/z3NpUEgvZb+YymFzt+Gn6MxKESZUpg1FWFGEceGNyI1i24+bxqL g==;
IronPort-SDR: oI03SF8Qsts9RvWUwh5/NEB0qvLVERESY9OQvsfuEObGwvKxUKRiZMQYiBDY20olH1ohln6iVz
 F2HdGBLuOCTzAK5o+Wxul4XGhzhrWrIlxpP01ABPjuCVUtyJLgOT9MTXun8G8BQiQy01f0yjhP
 noPhVTgbsi5EUXQYfsN6okcH8QUkj2JkCs7VOvT6oNS0EDm7qLdi6w1E5yD2r6715M+UKV5wie
 bOpLWt7IRYH8pruRv90m4ADoINy3FCWV0n185GsP38LbLDotf73jKjUwywAfx8j/8QOiLiqUw3
 Tok=
X-IronPort-AV: E=Sophos;i="5.73,323,1583218800"; d="scan'208";a="71605920"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 27 Apr 2020 00:40:59 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 27 Apr 2020 00:40:59 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 27 Apr 2020 00:40:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iDqAtUJIMB2sKkZ1vuyfJAzuGbXvNZ+OsklpC+L8idWXeWbJ7mmBaOOi6plxvCq7+vWINGj+vun7zpqWnCldrhae92zqSeR1FkAwKv6jG5B8lXLPaxiyYrI9Q7lzhbQ1gsi80G0q/whYMuTqlqz2dcz1mOHuS40PlieOU7QVFEU7ZiYv1wyB5GVEehfRI1/iSRjuUB7GE1cdRbiha5sfky6FUY/FztTEUWItK7+Hkau3qj8H26L1iQG1dasrsN1TC19jD3C0IU/FQCJ/rM+F3NoDOQFPf274l72mupdjr9vowgefMDpSbKo93m3xfEULwhFzGx6IMO3emAKMaf5pGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=etMvnHCkUK93kBmHjE+Mrg/+AQarBBrxP9B2e1N6Wg8=;
 b=QtrYDQOhEjRnuxmAlYERBlUKcpliKRsVnDySAJNgvLcV0RgAswPxLpNF+qDmoPAECpnI18oMES9SjWF4dxINJT1GWyDeilb4A6WvT+YP4Sm95ZzwOshzpt3jIzXr+gU0VnsDoDOyxuWaNVwdIxb9yc2FntloPjHlpEofen8U+P8SMizxqgTyDNlRGdvHDB+RvPLWtkcVozdc7eh/5+6zp1OB/ORU/4gjguoVi3f5OZU2Lq1kVpvbbBTnzx2HabZZJelqPN2PniYNeeaDvOaclmr6eOd7n6pnjZudqglj22xDXbLzagZD4ddF1pCVdjpp+9JIhV+KgiWWFzfXYz7cqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=etMvnHCkUK93kBmHjE+Mrg/+AQarBBrxP9B2e1N6Wg8=;
 b=YV3pmfnnB1o2YXPpy4EY4jcTmt57e4RNW+TdtKYupEna0elfSvjysB0DrTYEt2M5Z+kQzqVrL1pRlrV6HWRu0LVnAr8TFzsAUeAx7KQ7s44MosunoUXCCULVyWJvuETj6nyaD1DSXU+mq3IbC9Y5YXk4DmvVYAVWB1SYvHJ3nos=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4418.namprd11.prod.outlook.com (2603:10b6:a03:1cc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13; Mon, 27 Apr
 2020 07:40:58 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536%7]) with mapi id 15.20.2937.023; Mon, 27 Apr 2020
 07:40:57 +0000
From: <Tudor.Ambarus@microchip.com>
To: <alexander.sverdlin@nokia.com>
Subject: Re: [PATCH] mtd: spi-nor: Fixup page size and map selection for
 S25FS-S
Thread-Topic: [PATCH] mtd: spi-nor: Fixup page size and map selection for
 S25FS-S
Thread-Index: AQHWHGcvIWpaopvk8EurQ9gTxEc0wA==
Date: Mon, 27 Apr 2020 07:40:57 +0000
Message-ID: <2923841.9mhA2XUcB5@192.168.0.120>
References: <20200227123657.26030-1-alexander.sverdlin@nokia.com>
In-Reply-To: <20200227123657.26030-1-alexander.sverdlin@nokia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: af1fbc64-6857-4cf4-8c68-08d7ea7e531e
x-ms-traffictypediagnostic: BY5PR11MB4418:
x-microsoft-antispam-prvs: <BY5PR11MB441876B167A282F52B1CB53CF0AF0@BY5PR11MB4418.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0386B406AA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4419.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(396003)(376002)(136003)(39860400002)(346002)(366004)(6916009)(4326008)(53546011)(6506007)(2906002)(14286002)(478600001)(54906003)(316002)(296002)(5660300002)(26005)(6486002)(71200400001)(91956017)(76116006)(86362001)(66946007)(66556008)(64756008)(66446008)(66476007)(8936002)(186003)(8676002)(9686003)(81156014)(6512007)(39026012);
 DIR:OUT; SFP:1101; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: m9cD2FaRnTY93RdQq0RIT8HuPRTbixflRnFnxmsio+3xg8c5jmL4mj69kZhpinzoZGo9AOM+711bsoEDGeaMeeRN83JJ3IPH5WHbXqvrc86ypgFbDWDqO+bZDwL0u3KvTvcCFJ7bFA5QP6PhBLR3l9Q3bZMIdf0ydcm5bKu+O5reWpQOK9abglTrc/Mn657Vg2XP/Wr7Ufsv1C+fhRv0JJJOw5srPoTgXa3IB+5i+uq9DNXwFygV32OAiQyMbvfuY7FtSTpOgBSBIPrq5RD1L6e5Fm92a/EKveInIGuwAMGDNL2GHmZ7JljQu/CP1L4qNMBvqpEfV7b2can4qx5f0QKssfQYgFA0RXOQPbDbZ7raAvInQlqsLF3qRsogHpuQW9MACFbiKBwgJnR1HRkWdBP5wyC/UVc6+NDKACodA1c4ScM39HwsgUCk8iKo+vB9NRu1V8S0btLFC5LHPkctt0ROX6xV2hgcPK32v9i5G+hoJ7liNGV0zM29BgwXajw7
x-ms-exchange-antispam-messagedata: EwUiJ+F0If5POYpGbYqRUQBiSYkhvWRS0FDIsDsM5juaUw00VfK7P/24DeBjMrvvUZ+S4/EgVhuBaf8XL0zMChtpCIthpW0qhRdsDQMrRBSjrH8RqdoXlEBnAHEUhC4ouhPz0sq1MER8+iLwNRH24VxbSzYSomUlKxOU6WAzIbOb5NqZTlYuh/DUnIpix9wUHItKhxz5+uQVFPEPwHRnI/KRD+hAtL+qiLEuhqxVRry8gRHvVz9kdJEhuiKIrxkh1WGzOe8HcdJt7PvjoVFBDXTwEYd+AxkhKFItcBMLVP0In8Bdvgf17FPRR+jHIrksdy2Uxr7Nx3r3kphUOHbp17INIrOYjiVsMHlcHzl7trK73Ot4106EdnLpuydDNBsW2Pmt6+UWjvxKyWVQwUk1MJeZN1SxVVrg1oOl01l642g0afqOXAbzY7FgH1EIy0x3Dg3q79YbYghoraDWzWn5rBWoybfk7StqLBZ+Ewm4ZK4VxhIL9THlpBMIjiRz14HiGIKbhJcUNDFNLYiG/51aazgUDF1C8Sw7MPU3sOrklZzADaDh/pUjanCO+qmaOyvInW2HIt7PZOjzSNyWW2aEe8YrtbpViLwSQlBzwYn15nkqynUqWHchHnQFuN//w1yQlMG61SLAUTxELQN/kQXtKSA169Iu7ZOGGlnEstDuglCKskbb+EFy5EYzUALoqUPrioTQPC3i1WiGhEA9vNxP/u6comO/AYTrAn5S/XWZ42+szf7/g737FAWBsJ0goFUTZbgouCxVkAh5OtcqbdG5QgYwpwocEmDDwcf18ayDOd8=
x-ms-exchange-transport-forked: True
Content-ID: <7936A3C83BC410488D691B710A23A56F@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: af1fbc64-6857-4cf4-8c68-08d7ea7e531e
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2020 07:40:57.5155 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rrosHauOYIlJPEAPhfYP93ZHR781AaV2O0rQLmlyELjfuGzHQSsISOURzArdrC3EyO6FdKkCxW7HY09+ZQaP8vzoibkgN2faDDE2DxVkU34=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4418
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_004102_550732_236270E6 
X-CRM114-Status: GOOD (  14.12  )
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
Cc: bbrezillon@kernel.org, richard@nod.at, john.garry@huawei.com,
 stable@vger.kernel.org, marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Alexander,

On Thursday, February 27, 2020 2:36:57 PM EEST Alexander A Sverdlin wrote:
> From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> 
> Spansion S25FS-S family has an issue in Basic Flash Parameter Table:
> DWORD-11 bits 7-4 specify write page size 512 bytes. In reality this
> is configurable in the non-volatile CR3NV register and even factory
> default configuration is "wrap at 256 bytes". So blind relying on BFPT
> breaks write operation on these Flashes.
> 
> All this story is vendor-specific, so add the corresponding fixup hook
> which first restores the safe page size of 256 bytes from
> struct flash_info but checks is more performant 512 bytes configuration
> is active and adjusts the page_size accordingly.

Right, clear.

> 
> To read CR3V RDAR command is required which in turn requires addr width
> and read latency to be configured, which was not the case before. Setting
> these parameters is also later required for sector map selection, because:
> 
> JESD216 allows "variable address length" and "variable latency" in
> Configuration Detection Command Descriptors, in other words "as-is".
> And they are still unset during Sector Map Parameter Table parsing,
> which led to "map_id" determined erroneously as 0 for, e.g. S25FS128S.

Please let me know I I get this right. You need to determine the addr_width 
and read_dummy for the RDAR command, in order to determine if the 512 
page_size is active and use that instead. addr_width is not yet set because 
you probably are in the BFPT_DWORD1_ADDRESS_BYTES_3_OR_4 case, and as of now 
the case is not treated. nor->read_dummy is not set because the read operation 
is not yet selected.

Can we safely assume that the read_dummy for the RDAR command has the same 
value as the read_dummy value used for all the array read commands except Read 
(zero latency cycles) and RSFDP (8 latency cycles)? If yes, we can determine 
read_dummy from BFPT and get rid of the try and error iteration.

Next, we can probably use the same values at the SMPT parsing, if you hit the 
SMPT_CMD_ADDRESS_LEN_USE_CURRENT and SMPT_CMD_READ_DUMMY_IS_VARIABLE cases. 

Cheers,
ta


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
