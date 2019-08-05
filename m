Return-Path: <SRS0=c8/f=WB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F36D4C0650F
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Aug 2019 10:26:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C557620856
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Aug 2019 10:26:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F0gz0l9K";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="Sfjx4mJ8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C557620856
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZGSmHWXCcU1iOnzBjoWkoAXgUuMxezbEeRxft5bzddo=; b=F0gz0l9KKPdFNW
	wPeXfDcF0+xnC8hDwVMl7LfZqDiMQETr4wNq4wIz1qALy4qvsdYDNdSoUgtHs7s74mY8rF9JT3PFX
	REST9dKpBAFRXKqmAB5C4Fd5yMq1LfXi7GI/KvH3ChlmGxVkCfPr+XZ1d77OOfT7n3OqzXegLHwA6
	d0lyYnilFhsggw2G81HjoIJ42cmviEIIWeOhMk/LL67RS7JQiv7rEBai9zizPALsdH9KYTHvjGjOT
	kvaohnYOO35DlAytfOe1MQy/kGUPnK7k3EWevL+JnstNduFexVq5GJd9M/ZOExjZr5T54KE+gcZI4
	uuq8E+sPvtYKwYyMW91Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1huaBc-0000ix-Dq; Mon, 05 Aug 2019 10:25:52 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1huaBV-0000iD-Ak
 for linux-mtd@lists.infradead.org; Mon, 05 Aug 2019 10:25:49 +0000
Received-SPF: Pass (esa1.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa1.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa1.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: DxKR9W15XD3mz7Raxy5ycVPUB+Qjk6Sw5owHijlt5WWt4jnIHYFZgSA4XjJPcEeNmnMu6dwbmi
 95DlJ8eqxnIEN4aNc1+MQ5foGb5Vc21ZBZ7OzyGGiaNSUykqPfk4jaBTQMcWspUz6AiJNEOkzd
 IMWHON7+k42PhFgjJCU+nCQHvlxANvBed5u4LXukqo/vzpI5uKGGeOkUS8YRrIS4P+Msk4JxTv
 lT5DHKwcYfAeM3L3PdlfDK5Gjsm7gxQIoZwC2DMtBrf1eZC9IF0QTO1jC90+GH3bHSm3Wr5Yco
 xnY=
X-IronPort-AV: E=Sophos;i="5.64,349,1559545200"; d="scan'208";a="45345562"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 05 Aug 2019 03:25:43 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 5 Aug 2019 03:25:43 -0700
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 5 Aug 2019 03:25:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xjh9qRH3IY10PhWTh/rWf4x8+PqZgIzAziSgHbGmrN8n27stUyDy9osZpcvGQxBvAiEG+rILaI+K3ww5aIBrCdUmvn5yzQ72z1nfVAi50KTUWl6hzG2Aq03VjiPRb/d5h0aGpoKeBGTHCeGSeoJI0Y9DTfvuyYZwwdfDctYuZSOhQpkjLKf/mVpUIOoenFZIQ8l3p69apTkIlJgN0Y3a1iv2mE873UrXm/m9QNwatI1uaOmvx+QZ0ekH+935j921opdzbV4y65k7BVi6ArWIMg6qJ84zgIOmg8gjBzY0CArteDkbnbZHyegEDjvq8ZkmZGgmYnnw98UQ3G+HUid+vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+v+1mb8LNZU/oPMYE3RGfiExIiz1KJMGAfvLZW/fdLI=;
 b=nI5D14e8vzkHu1cslREYOerz4eCt8TDvfO1hkVH8ZCV8QfNIDj0W/XcXjAnm6l5YBMIQ/nL1f+nBbcRr0AgsTvx5rUpSq2r1sNYOkqKVgeRnTXGDYL0wkn9dFafBoEVKilbeMeSeCrdjbRg0+UomKfdBshzwU6cQ+J4N5RY17M7LJ2hTpNRsPYhlm2fo9TsU/iiOhlpa0KAKn6b7tuepMaqo35HY3fqiTNVmjofPwjCXTrBhIdlU+vXkY0balQDIiwAlADjk6YczsnHqOS6cayMePP9WRoL94zoLJJlwhkBHhiHYvGxoMmV1/98IsuUHIu2gfq7zwBf1ETffh2FuDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=microchip.com;dmarc=pass action=none
 header.from=microchip.com;dkim=pass header.d=microchip.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+v+1mb8LNZU/oPMYE3RGfiExIiz1KJMGAfvLZW/fdLI=;
 b=Sfjx4mJ8ejZ7MhMBwzsO0t1Q1k4MERaCYiKNqH6/gUf3iC8EtLYDkVLEyNA4tk4Bp1w4U7eJlz+/oe3dtay0KIczUmAeVe5QWYNU/5ZI4Q7BDyQEKjNlFWHU4OIP50uic5UMzajzh+vVs7O6l81Y7C1VdwVYU7orIaPKghaCE94=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4477.namprd11.prod.outlook.com (52.135.36.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Mon, 5 Aug 2019 10:25:41 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2136.018; Mon, 5 Aug 2019
 10:25:41 +0000
From: <Tudor.Ambarus@microchip.com>
To: <vigneshr@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>
Subject: Re: [PATCH v4 2/3] mtd: spi-nor: Move m25p80 code in spi-nor.c
Thread-Topic: [PATCH v4 2/3] mtd: spi-nor: Move m25p80 code in spi-nor.c
Thread-Index: AQHVSIVNR1h9SqkuukqZlfb/4kclfKbsXzAA
Date: Mon, 5 Aug 2019 10:25:41 +0000
Message-ID: <852ffdd1-a546-03db-3b60-47d60bd8d7cf@microchip.com>
References: <20190801162229.28897-1-vigneshr@ti.com>
 <20190801162229.28897-3-vigneshr@ti.com>
In-Reply-To: <20190801162229.28897-3-vigneshr@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0101CA0057.eurprd01.prod.exchangelabs.com
 (2603:10a6:800:1f::25) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a4e4ed8b-9ded-403d-4d80-08d7198f4452
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR11MB4477; 
x-ms-traffictypediagnostic: MN2PR11MB4477:
x-microsoft-antispam-prvs: <MN2PR11MB4477052247EB576403FA09EEF0DA0@MN2PR11MB4477.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(346002)(396003)(136003)(366004)(376002)(199004)(189003)(66946007)(66556008)(66446008)(7736002)(6512007)(99286004)(8936002)(26005)(186003)(14454004)(446003)(4326008)(6246003)(31686004)(6486002)(8676002)(478600001)(476003)(2616005)(81156014)(11346002)(486006)(53936002)(305945005)(71200400001)(81166006)(25786009)(6116002)(3846002)(68736007)(31696002)(6506007)(386003)(53546011)(66066001)(6436002)(36756003)(2906002)(316002)(52116002)(54906003)(110136005)(71190400001)(76176011)(229853002)(64756008)(66476007)(86362001)(256004)(5660300002)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4477;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: dfnoTbD+7yjLlXiXd9H2dgxMb2NyebARTMPv6ZBx8Ra2CJ90AfTTMYDfPyJoa4ZP/bfY79JZF9uGw5ScvVG57T5ASSbjhioOmqPOu2kEQWut4dGzFtvO0iYWtz+H8Lu6i6tcPR66MvcCnQEg/L2N399zWtDU70mwPIGjR9M1/95uwy2kjc+Gevy0k4M0hoXKxE63OL42CKeyqbW1bgjm5oH4mH8qfPSppOfhd9UZiaIxxdQf1kpHG/8LNEPF+4Dlj1fx5zgQWV+cu0GXBp5c/rSTepKeUFFWitV2X5dRK7dHTUWMu6zgodvyKZ0SnaVy9FiPpoTQlHQdtM9X+rvf7Ch0g8kTDz2nYSSSOmJh0h7Pgdqu1G3BtprU5b/ggQVC2RFEg4B4Nf7WUk2y56Im8S/YiGA3wX4vIwF3cyQwcGg=
Content-ID: <6A04998477AA694C9F22C195129CC8BE@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a4e4ed8b-9ded-403d-4d80-08d7198f4452
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 10:25:41.5175 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tudor.ambarus@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4477
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190805_032545_532167_D1F5C63D 
X-CRM114-Status: GOOD (  11.24  )
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
Cc: marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, tmaimon77@gmail.com, bbrezillon@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 08/01/2019 07:22 PM, Vignesh Raghavendra wrote:

> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index e02376e1127b..866962c715b4 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -19,6 +19,7 @@

cut

> +static ssize_t spi_nor_spimem_read_data(struct spi_nor *nor, loff_t from,
> +					size_t len, u8 *buf)
> +{
> +	struct spi_mem_op op =
> +		SPI_MEM_OP(SPI_MEM_OP_CMD(nor->read_opcode, 1),
> +			   SPI_MEM_OP_ADDR(nor->addr_width, from, 1),
> +			   SPI_MEM_OP_DUMMY(nor->read_dummy, 1),
> +			   SPI_MEM_OP_DATA_IN(len, buf, 1));
> +
> +	/* get transfer protocols. */
> +	op.cmd.buswidth = spi_nor_get_protocol_inst_nbits(nor->read_proto);
> +	op.addr.buswidth = spi_nor_get_protocol_addr_nbits(nor->read_proto);

nit: op.dummy.buswidth = op.addr.buswidth;

cut

>  
> @@ -688,6 +1003,16 @@ static int spi_nor_erase_sector(struct spi_nor *nor, u32 addr)
>  	if (nor->erase)
>  		return nor->erase(nor, addr);
>  
> +	if (nor->spimem) {
> +		struct spi_mem_op op =
> +			SPI_MEM_OP(SPI_MEM_OP_CMD(nor->erase_opcode, 1),
> +				   SPI_MEM_OP_ADDR(nor->addr_width, addr, 1),
> +				   SPI_MEM_OP_NO_DUMMY,
> +				   SPI_MEM_OP_NO_DATA);
> +
> +		return spi_mem_exec_op(nor->spimem, &op);
> +	}
> +

this should be done below in the function, after masking the address.

You add a double space after return in:
> +	return  nor->read_reg(nor, SPINOR_OP_RDSR2, sr2, 1);

There are some checkpatch warnings that we can fix now.

Looks good!
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
