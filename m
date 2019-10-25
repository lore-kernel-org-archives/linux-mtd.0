Return-Path: <SRS0=MD77=YS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99AC8CA9EA0
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Oct 2019 11:24:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EFF92070B
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Oct 2019 11:24:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iiyBGgbY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="rF5V/p3+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EFF92070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j9vpCWpTvmWbDJWwntERK1x57f2ozK0+3hrmMlg2q9o=; b=iiyBGgbYYHpUUA
	Yn60Oh5Z6qhKPo7bYPH5XDcxur4rgqNVCM77n5wNFDlVvgGoMNySjrBGv92o5pqjPwQy+spkRHEcz
	4flLwqOd6NHppHUGoDsB2fZKQVvLVU0eJAvSf5tFh3pd2t971Rvkd7yG2ZSEu0DBT6kdCNBrCZp98
	RLQRoOO1LO1ciL5yroYjCvL1xLdTsuyjU0l5/CMHA93C0vwJ5zggbLttjpSIdC3doGh93ZJM0ERaD
	FZgdIW2kMdb4SjoIe0qDWsreuL2T0KRZDfYCqa6EwZ/Aosv38/JCFSzflBAqvgkKMQzQ32a7OpV+a
	jAxfnKvc87JpgbbHctZw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNxht-0003r4-Lp; Fri, 25 Oct 2019 11:24:37 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNxho-0003q4-KV
 for linux-mtd@lists.infradead.org; Fri, 25 Oct 2019 11:24:34 +0000
Received-SPF: Pass (esa3.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa3.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa3.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: dCf/tAD7QEH82MLNALRsZyx+cRVDVKMHmIf+vqI/U8BZ/UgY9X94KDnDbloYNBUaC2WshBjwX1
 wpO914vN4kiyKLMGtitSEnU6//SN7CGrnYUF3E5VGGvzeLKqwbYHYJPBEoZc4VnLuDXBiz3wWE
 m+bQqq/y4Bm106Skx5FYIloe/juuSyX4ZrWj6IbdHfwc20kwF9/l7nbU76ONKneg8J+wjp+ncS
 Pr5jK8pGBuxr/UvOyx9sTObyw394nq9lINpVMj0Srj+yeKsOwdEeZae2YFgRSXExVf/GWCmxId
 S7Q=
X-IronPort-AV: E=Sophos;i="5.68,228,1569308400"; d="scan'208";a="54405486"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 25 Oct 2019 04:24:31 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 25 Oct 2019 04:24:23 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Fri, 25 Oct 2019 04:24:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XSS6yEL4G57MgB21MOQdJeWxg9OS5ZMYkz3CWMIpL9ooXm0J4ffO88vKBy/FzSssUz6yi8quBf4xQnudmFK80Z4eMlgHD2Sy4nisRfkvk1jAAZ9/ZSFlm16RWKH9wDEi5kKsi/w6hG2raeQyZge7n+0nEnI0+6qF7lsfGrRTY0cytFuHmWv2a7UpR/u0z5lm+jK4+/SnoAZCzNoSV6nHakMc+O3PSaLuj5LWrdCZ7wLgvr7VdFqrI2BXJETEhi5Kfuf7uNUMoJgAtkqPxiclkeI0503LccAenVmD1YnxOec7ULDew1BXl/eKtC6p/tXvs3Aaf+p8RXwsD9n7S4WKiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=snu267+/pXG91qGCLqVUPocZz9Dxoh/BPuZEK8o6sZo=;
 b=YI8lFg9SsWOABxouTgi6FZecOPUElcR570WnUVTcY/MOuvvz7B5tT2er6TdsioMvWsc2mjPslZMCEwSB15fvkVSZie2vU6/CaPvu22OiHcePPPKlG7XBd/Vw+Kwgm9g0PTl2cdv62A9VmNEog8VwjMwoYDMb0oGIwIOt6qtkSUObjlctQyY7IhIjegAVb2KNlHLbhUILOe6oXbCkmSBkXhIhPsrefaO4NkNFg7rQbFB6qwhsW/+SG4ynyv4291v/uOGGcxWYOs03vaLZ+yYCouIJir/zMQK7nFzYdD2Dq1fzOOwjROA1K5TERixH04zw4ZDefSRzZ52IHuT8/4gn8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=snu267+/pXG91qGCLqVUPocZz9Dxoh/BPuZEK8o6sZo=;
 b=rF5V/p3+kpP3mCqErS1meFlZmeXIrImaQ5e/+FZnYezr4JciXzH25bwHdBeHPiEmBSRYDr4D0FBiKGklMrX7878BQ70fZt3x5Ez+W/GYe2WcPaSvZgM8hPEDYNqwssiL/wF2+QySIdgbzpHPmpmrM5DBJ8+EYvuP/Wvhan7gJAY=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4207.namprd11.prod.outlook.com (52.135.37.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Fri, 25 Oct 2019 11:24:19 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457%5]) with mapi id 15.20.2347.030; Fri, 25 Oct 2019
 11:24:19 +0000
From: <Tudor.Ambarus@microchip.com>
To: <dan.carpenter@oracle.com>
Subject: Re: [bug report] mtd: spi-nor: Introduce 'struct
 spi_nor_controller_ops'
Thread-Topic: [bug report] mtd: spi-nor: Introduce 'struct
 spi_nor_controller_ops'
Thread-Index: AQHVixMVryUUADXWrEChfahP8ABYzKdrN06A
Date: Fri, 25 Oct 2019 11:24:19 +0000
Message-ID: <f86ee955-d08a-cd24-e214-95cb3746e756@microchip.com>
References: <20191025090309.GA7304@mwanda>
In-Reply-To: <20191025090309.GA7304@mwanda>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0601CA0016.eurprd06.prod.outlook.com
 (2603:10a6:800:1e::26) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [86.120.239.29]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 65ec737a-0472-4d32-873c-08d7593de069
x-ms-traffictypediagnostic: MN2PR11MB4207:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR11MB420715ACDADC871BF70E084EF0650@MN2PR11MB4207.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 02015246A9
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(376002)(136003)(346002)(396003)(366004)(199004)(189003)(6246003)(186003)(66946007)(6436002)(31696002)(316002)(71200400001)(14454004)(4326008)(6486002)(6116002)(66446008)(3846002)(11346002)(14444005)(2616005)(256004)(446003)(486006)(476003)(64756008)(7736002)(66476007)(25786009)(6916009)(305945005)(31686004)(99286004)(66556008)(53546011)(36756003)(386003)(71190400001)(6506007)(966005)(102836004)(478600001)(76176011)(52116002)(26005)(5660300002)(2906002)(66066001)(8936002)(6512007)(81166006)(6306002)(81156014)(86362001)(8676002)(229853002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4207;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1ETtFASJNmDxywgYDww1Xjiogr7GqGc1TK2mIT81rn6/1HYYRLPBEvqeGdTReqBP5n3Le7c2u+aAKB/yj+DXGmKE7htTHmddAUXGHg99s2hvzlBykvCk99KZSKkYMHfoYRJjlRJxaxlgPlWtZP1KMO8nVFHwMPwlyjXN5/EuGdTOCuwSwULFAOQiIlR/cdL5TO+uZ1cOj+aYQslarw7rcMgm5mcRxXZirbrH2KyiPWFFxp+arAlZFbS7otU+9yNdBpCUdfmWPGORxZzB+XCK36RS6eGWfjY9XW/u98VYIeib+dffvLbln+GkalrDGTMB33WVt9djBmtXFcdVmHxWMqxtNdDZ75S6M/7WW87e3rzY/dsLHk24U9RDBssIFc4BYYwHTW/f2T5xz53JUDJq3K2wDbpPVCMba6D8aisIL7jJQYaZyDRS49QqlGlA2rO932hpv7w5DMqLvLvdN5x5Lpqn3uHWk6reLefNCf4LlwU=
x-ms-exchange-transport-forked: True
Content-ID: <527C98B96BD897489FF93FC6D656F4D6@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 65ec737a-0472-4d32-873c-08d7593de069
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2019 11:24:19.1502 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VPond+/+plKSQu4hrNIFDYmcchl7lVAH6+O78lUUCPnleZYoMBRjuyPKjy+HgO4Ca62Ym58x8SRVtV7cOy1nQKW25nSiNcAzBE6q4mbMPU4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4207
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191025_042432_746216_0085FA46 
X-CRM114-Status: GOOD (  11.10  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 10/25/2019 12:03 PM, Dan Carpenter wrote:
> External E-Mail
> 
> 
> Hello Tudor Ambarus,

Hi,

The code should be fine, see below.

> 
> This is a semi-automatic email about new static checker warnings.
> 
> The patch 453977875364: "mtd: spi-nor: Introduce 'struct
> spi_nor_controller_ops'" from Sep 24, 2019, leads to the following
> Smatch complaint:
> 
>     drivers/mtd/spi-nor/spi-nor.c:967 spi_nor_erase_sector()
>     error: we previously assumed 'nor->controller_ops' could be null (see line 945)
> 
> drivers/mtd/spi-nor/spi-nor.c
>    944	
>    945		if (nor->controller_ops && nor->controller_ops->erase)
>                     ^^^^^^^^^^^^^^^^^^^
> Can this really be NULL?  Probably this check can be removed...

nor->controller_ops can be NULL when the controller is under the SPI-MEM
interface, i.e. nor->spimem != NULL.

If not under SPI-MEM, the controller implements its own operations.
controller_ops->erase is optional, can be NULL. This check verifies if the
controller implements its own operations and if the optional one (erase) is
present or not.

> 
>    946			return nor->controller_ops->erase(nor, addr);
>    947	
>    948		if (nor->spimem) {
>    949			struct spi_mem_op op =
>    950				SPI_MEM_OP(SPI_MEM_OP_CMD(nor->erase_opcode, 1),
>    951					   SPI_MEM_OP_ADDR(nor->addr_width, addr, 1),
>    952					   SPI_MEM_OP_NO_DUMMY,
>    953					   SPI_MEM_OP_NO_DATA);
>    954	
>    955			return spi_mem_exec_op(nor->spimem, &op);
>    956		}
>    957	
>    958		/*
>    959		 * Default implementation, if driver doesn't have a specialized HW
>    960		 * control
>    961		 */
>    962		for (i = nor->addr_width - 1; i >= 0; i--) {
>    963			nor->bouncebuf[i] = addr & 0xff;
>    964			addr >>= 8;
>    965		}
>    966	
>    967		return nor->controller_ops->write_reg(nor, nor->erase_opcode,>                        ^^^^^^^^^^^^^^^^^^^^^
> The patch adds a new unchecked dereference.

When the controller implements its own ops, nor->controller_ops->write_reg is
mandatory and backed-up by the:

static int spi_nor_check(struct spi_nor *nor)
{
        if (!nor->dev ||
            (!nor->spimem && nor->controller_ops &&
            (!nor->controller_ops->read ||
             !nor->controller_ops->write ||
             !nor->controller_ops->read_reg ||
             !nor->controller_ops->write_reg))) {
                pr_err("spi-nor: please fill all the necessary fields!\n");
                return -EINVAL;
        }

Cheers,
ta
> 
>    968						      nor->bouncebuf, nor->addr_width);
>    969	}
> 
> regards,
> dan carpenter
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
