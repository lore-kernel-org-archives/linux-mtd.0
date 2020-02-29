Return-Path: <SRS0=4xdD=4R=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53254C3F2C6
	for <linux-mtd@archiver.kernel.org>; Sat, 29 Feb 2020 12:47:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25A8C24699
	for <linux-mtd@archiver.kernel.org>; Sat, 29 Feb 2020 12:47:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NN0R4Nrt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ExertusOy.onmicrosoft.com header.i=@ExertusOy.onmicrosoft.com header.b="kgPmO2bw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25A8C24699
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=exertus.fi
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mxuuuZAeFLpntqMJMOAnywsA568VRffOONmcBihw3vc=; b=NN0R4NrtsfKL4Y
	+J/4Cxfyz+LAUCDMylufb1Sz8abMbhvbXxCqYtmdyet7TteCwsQpfJYUaZF1vG4FtBVziylb86Fgm
	3oXw51Oj0sNhgkDMStBq98vvGojvPJzJhjaEoZY7c+nLzo0OrMPPuZYRledCdOHUPVpZsJI8HYTN/
	42/IKG5yM9r0pa3f2ns4n4baJsNDkKwbsy1/b/l+pk0vLh5dzZy7HlIZO81BEFjBdU4kR/AXAXtJK
	OUl+WsFnp48emqU0MWk2ExUfEM1iPsljR1QIbc3DVHPp6WgfqVkRlKJyWyqMPh5Y863Y0SlnQ1IzM
	Yb/4iwUTv5vMEbb28fIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j81WP-00080y-IC; Sat, 29 Feb 2020 12:47:09 +0000
Received: from mail-eopbgr80097.outbound.protection.outlook.com ([40.107.8.97]
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j81WI-00080S-8p
 for linux-mtd@lists.infradead.org; Sat, 29 Feb 2020 12:47:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k5wrBONo5fDdgQhzK68E06be6N2+m1YbXEXurO7fu1a06Fub5NwL6V+ONQv7LcelUaRMWrwdAGEgGS/CPOnFHh40So9Y9kMKkmD4liWDt3fe/iJ4BRDxQsXYxYyko9xE7/llrYCzGjW2vYWbLlXX2o3bGIIh6EJmYXZl5VIybedHH//8pt4mgvOkC4rybRvKU6RPNhAc81bAqDAyCsiNr8Bq2QKZ91Lho2bi9Bnvipv9YLR0dUK8fPYzrpWw3LCSxTWo9wVITSBuVI0cuxq0XkMRk6cAwH2/Acve9XSoHFflaopQeczIN4zGIbren3AU9Yn+eDDcOEtOoLC6m3z/Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HjEaPl3RTDFLpdG3KhU0jtvgpzwa0sKuwgF95RBzh+o=;
 b=NshcnN4Ydq0pywykol5C4Mar0k/UP0Ziug94lcjxG/C8YgjTn/6mHV3ZlFvGAp81KcS7wSXJQjIFESQrqTsD23eurEuDRTAmgLlIyI04/AGBfi7Yh0OU4/jJVs8g2jx4eWXGo0VI9l0eEOH5P1HQmZS16PKPa3fJYx+/jkzbO2j3gkfI+mqKx8sxPLxp4A5SEgnxEH0kXrfXNuYtoDojoB3eie3Jv1vyk5hXWG/jyksUrWcijV/BhcNfJgRbiXN/pEtPJ7hs0XjYQNrIQGbNgpBhT8HqoUWbYqxJOGVfALgmsBE+9wPK5H1KYCKgCFZQJZostDfO+XG0FfLmFXCb2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exertus.fi; dmarc=pass action=none header.from=exertus.fi;
 dkim=pass header.d=exertus.fi; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ExertusOy.onmicrosoft.com; s=selector2-ExertusOy-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HjEaPl3RTDFLpdG3KhU0jtvgpzwa0sKuwgF95RBzh+o=;
 b=kgPmO2bwYWPH8oaowLz3VvjsKNBbQKkutMPbEusBgU9wWUgXUTPi2Yo9gmMmcP/LyxyUFTcwaZn2qZm6QPVarTexOe0J4jjV6KPwh+jNP11bL92Jmc48553/ZDLGU3CH6y6VEWE1ohE6422fa6FJ+AOwx+MTYjXEzva5VPWn70Y=
Received: from AM5PR0902MB2129.eurprd09.prod.outlook.com (10.173.254.160) by
 AM5PR0902MB2177.eurprd09.prod.outlook.com (10.167.171.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.14; Sat, 29 Feb 2020 12:46:50 +0000
Received: from AM5PR0902MB2129.eurprd09.prod.outlook.com
 ([fe80::ad47:8da1:fa12:3eca]) by AM5PR0902MB2129.eurprd09.prod.outlook.com
 ([fe80::ad47:8da1:fa12:3eca%4]) with mapi id 15.20.2750.027; Sat, 29 Feb 2020
 12:46:50 +0000
Received: from [10.3.1.192] (193.210.47.3) by
 HE1P189CA0021.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.15 via Frontend Transport; Sat, 29 Feb 2020 12:46:50 +0000
From: Timo Ketola <Timo.Ketola@exertus.fi>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: Power cut leads to "corrupt empty space"
Thread-Topic: Power cut leads to "corrupt empty space"
Thread-Index: AQHV7W5w0ROHw32Dgk6RN8346II1lKgvAwqAgAAJioCAABpqAIAC+sEA
Date: Sat, 29 Feb 2020 12:46:50 +0000
Message-ID: <92909395-0b0b-da7f-a896-a6c1f11a678f@exertus.fi>
References: <ee9d424c-8b89-c8f6-7b3b-1ab09371e04c@exertus.fi>
 <CAOMZO5BHW7r8aMT_7g91LpGem+WpP+PRKwnsfu9v7yn278pErQ@mail.gmail.com>
 <49a83666-2e08-833e-dc63-0fb820b5c6f3@exertus.fi>
 <CAOMZO5A0wCz6EUB_Qc+oS1UDLrBSLgAKEE0g8SYTDFq8AGLsVw@mail.gmail.com>
In-Reply-To: <CAOMZO5A0wCz6EUB_Qc+oS1UDLrBSLgAKEE0g8SYTDFq8AGLsVw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1P189CA0021.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::34)
 To AM5PR0902MB2129.eurprd09.prod.outlook.com
 (2603:10a6:206:b::32)
x-originating-ip: [193.210.47.3]
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Timo.Ketola@exertus.fi; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c0cc7b61-dcc2-4e42-be5d-08d7bd157232
x-ms-traffictypediagnostic: AM5PR0902MB2177:
x-microsoft-antispam-prvs: <AM5PR0902MB2177A023BC1891988484497C8AE90@AM5PR0902MB2177.eurprd09.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:873;
x-forefront-prvs: 03283976A6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39830400003)(136003)(346002)(376002)(366004)(396003)(199004)(189003)(4326008)(5660300002)(2906002)(31696002)(86362001)(44832011)(8936002)(8676002)(81166006)(81156014)(53546011)(52116002)(31686004)(6916009)(2616005)(956004)(508600001)(36756003)(16576012)(26005)(71200400001)(16526019)(316002)(6486002)(64756008)(66446008)(66556008)(186003)(66946007)(66476007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM5PR0902MB2177;
 H:AM5PR0902MB2129.eurprd09.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: exertus.fi does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1qyOHQz4q7yVzqsorkOsUbvLvBDqrKVTZC2ZdbCuE8XU/0/zaC7ZoDNSX1E7PTEbNiMBMrH1Dl3+ih1Ct51fdBKeAGGj5ZGdJGXstfiDzF+Qhya4DD1QG7IMgL35SdsmDfCYt9BfGQcbR0IDfERfKupH6Q9Of0uqus6SJNZ/lxe+zYTdHh6txdIEbj+clycTp7B+xYtS/8p9p1BOSPPBFdOKlVd/DknPxsAcH5iZ8FvCudZmm21OXOixWjTbY4gqZH0LMRadtNiJAKQl3ibOGaSjw9/rLT2EgmO2GOT+EFLhMzW7e9KieFSt7IcXgEYgGip3XavofHBemeZDbdGvT+EhhitXCmPqx/9PK9gy9TnOxv0V+esI9BPbHCyjcZ0XQjXcUWBaDYI0ST/CBNxrxla6FwmuocMN76LI+e9ZEaTIO8YVksJliHpJoNHi9yHs
x-ms-exchange-antispam-messagedata: hsWjqPvvsvN2IQSfohbup+Gvg10rLC1wrfN7E49JsJ98nbOXQIUTFR18csYEZUE9ReWXU55SxdAZh49p2CoZFIXhvawsLKfmIoqW5FvgR8UGspvyZPFyjJesm2hTprBznxDEX+zTVsxf1ULZpoa3UQ==
x-ms-exchange-transport-forked: True
Content-ID: <F52DB83A96A54849ABEAE46C34176D79@eurprd09.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: exertus.fi
X-MS-Exchange-CrossTenant-Network-Message-Id: c0cc7b61-dcc2-4e42-be5d-08d7bd157232
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Feb 2020 12:46:50.5774 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2ff5ff20-bcb9-4615-b2a6-3bbeefd7b8e3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Np4uXkTJvNQJ5pK8/seRoC4agRlGzGnEBxGA184bvrDHaLcEwOzlD7k/rhJ6V1bV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0902MB2177
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200229_044702_400209_76E86BE0 
X-CRM114-Status: GOOD (  21.02  )
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
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 27.2.2020 17.16, Fabio Estevam wrote:
> Hi Timo,
> 
> On Thu, Feb 27, 2020 at 10:42 AM Timo Ketola <Timo.Ketola@exertus.fi> wrote:
> 
>> That might take considerable effort. Would you think, there should be
>> fixes for this? Would it be on recovery side or preventing the issue
>> happening in the first place?
> 
> It is hard to tell. 4.9.88 is an old version, so better try with mainline
> 

Ok, I managed to get v5.4 booting - almost.

First, we had 'fsl,legacy-bch-geometry;' flag in device tree and I
couldn't find how I would get the same effect in this kernel in a
'standard way'. I had to put 'nand-ecc-strength = <8>;
nand-ecc-step-size = <512>;' into the device tree and make this change
in drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c:

> @@ -507,11 +507,11 @@ static int common_nfc_set_geometry(struct gpmi_nand_data *this)
>  	struct nand_chip *chip = &this->nand;
>  
>  	if (chip->ecc.strength > 0 && chip->ecc.size > 0)
>  		return set_geometry_by_ecc_info(this, chip->ecc.strength,
>  						chip->ecc.size);
> -
> +	return legacy_set_geometry(this);
>  	if ((of_property_read_bool(this->dev->of_node, "fsl,use-minimum-ecc"))
>  				|| legacy_set_geometry(this)) {
>  		if (!(chip->base.eccreq.strength > 0 &&
>  		      chip->base.eccreq.step_size > 0))
>  			return -EINVAL;

That is, call legacy_set_geometry unconditionally without then calling
set_geometry_by_ecc_info. After this it began to read the first half of
the NAND correctly.

The there is a bug (I think) in the NAND chip S34ML16G2. It has four
S34ML04G2 dies and two chip selects in the package and shows up as two
chips. It reports 128KiB per EB, 8192 EBs per LUN and 2 LUNs making up
2GiB. This is correct for the package but then Linux finds two such
chips, total of 4GiB, which is not correct. So I have this in
drivers/mtd/nand/raw/nand_base.c:

> @@ -4733,12 +4760,36 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
>  	if (!type->name || !type->pagesize) {
>  		/* Check if the chip is ONFI compliant */
>  		ret = nand_onfi_detect(chip);
>  		if (ret < 0)
>  			return ret;
> -		else if (ret)
> +		else if (ret) {
> +			if (type->name) {
> +				struct nand_device *nand = &chip->base;
> +				unsigned luns;
> +
> +				pr_info("%s detected\n", type->name);
> +				pr_info("luns %d, eraseblocks %d, pages %d, page size %d\n",
> +						nand->memorg.luns_per_target,
> +						nand->memorg.eraseblocks_per_lun,
> +						nand->memorg.pages_per_eraseblock,
> +						nand->memorg.pagesize);
> +				pr_info("sizes: page 0x%X, erase 0x%X, chip 0x%X\n",
> +						type->pagesize,
> +						type->erasesize,
> +						type->chipsize);
> +				luns = DIV_ROUND_DOWN_ULL((u64)type->chipsize << 20,
> +						nand->memorg.pagesize *
> +						nand->memorg.pages_per_eraseblock *
> +						nand->memorg.eraseblocks_per_lun);
> +				if (nand->memorg.luns_per_target != luns) {
> +					printk("Correcting luns-per-target to %d", luns);
> +					nand->memorg.luns_per_target = luns;
> +				}
> +			}
>  			goto ident_done;
> +		}
>  
>  		/* Check if the chip is JEDEC compliant */
>  		ret = nand_jedec_detect(chip);
>  		if (ret < 0)
>  			return ret;

output:

> nand: NAND 1GiB 3,3V 8-bit detected
> nand: luns 2, eraseblocks 8192, pages 64, page size 2048
> nand: sizes: page 0x0, erase 0x0, chip 0x400
> Correcting luns-pre-target to 1
> nand: device found, Manufacturer ID: 0x01, Chip ID: 0xd3
> nand: AMD/Spansion S34ML16G2
> nand: 1024 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 128
> nand: 2 chips detected

That idea worked on v4.9 imx kernel but not here. The driver reports ECC
errors for the second half of the NAND. I have debugged down to gpmi
driver and checked that page address is as should (e.g. realpage 524288,
page 0 0x80000 in nand_do_read_ops for the first page of the second
half) and target selection changes correctly. But it reads only FFs.
Still, it seems to erase correct blocks when trying to write BBTs.

I put this in drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c:

> @@ -2270,10 +2270,18 @@ static struct dma_async_tx_descriptor *gpmi_chain_command(
>  
>  	transfer->direction = DMA_TO_DEVICE;
>  
>  	desc = dmaengine_prep_slave_sg(channel, &transfer->sgl, 1, DMA_MEM_TO_DEV,
>  				       MXS_DMA_CTRL_WAIT4END);
> +	if (1) {
> +		unsigned i;
> +		char b[160], *p;
> +
> +		p = b + sprintf(b, "Transfer from/to chip %d, pio[0] %X, naddr %d, addr", chip, pio[0], naddr);
> +		for (i = 0; i < naddr; ++i) p += sprintf(p, " %02X", addr[i]);
> +		pr_info("%s\n", b);
> +	}
>  	return desc;
>  }
>  

and see

> Transfer from/to chip 1, pio[0] 930004, naddr 3, addr C0 FF 07

for erase, which seems to work and

> Transfer from/to chip 1, pio[0] 930006, naddr 5, addr 00 00 C0 FF 07

for reads/writes, which fail.

I'm real stuck.

--

Timo
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
