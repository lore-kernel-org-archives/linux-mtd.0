Return-Path: <SRS0=c8/f=WB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49F8FC0650F
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Aug 2019 08:00:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DF722067D
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Aug 2019 08:00:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e43MMbp4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="URvIklek"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DF722067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D+tkyHYpI9vlci8KGxjeTbMHgMcUh5XdkEyjTpG81vI=; b=e43MMbp4Y8K9fo
	19i7mksgPU9kj3pmsMpVHui0/PB9L1znUkJb/lNBje0aiEAc+hzzjRXjay9zlS5eCKaDzXCyY2Uym
	EB/NEzv2xOEbdcrvE1uOaONQ4AOvI8fb5HM83GZ6eyXywXquLMyWKGKMCFxh8CcyJSMazI2ZwSslD
	zu+LuuXflfrRiwsLQaJT6gp9txtK/2N5vj2OdkWHdON2GEsg0IyauaJA7yu8GTHYPgPmOblfyGEYG
	BM65T190S5XGMebvGxwGvwV4XP7k2t/Bfgg67cr0tRYrHP5Gu0HV5X9aU6FuWMYQ0aRi3YKY9qJ/y
	TidFaEMgFhPQ53HbdlYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1huXug-00031w-27; Mon, 05 Aug 2019 08:00:14 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1huXud-00031X-DJ
 for linux-mtd@lists.infradead.org; Mon, 05 Aug 2019 08:00:13 +0000
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
IronPort-SDR: lRtyY+Vtk5bv5n848imIHdRFlWrg59tauXup6dBFhlfKfrV9/88rDJMoSyYRRT+loDi0sLPg7f
 VfnvF9fUwZ4cwIY3Haxr2IV6ElBSt+teQX0VP1EdeM5UwPcU5yBQ3VBVHmQdWewdej1Mf7VHhL
 3qlka6DMLapnyisgW7QWzlCPsBqSA8XIke2/XG+yl2nB1XuJowhvV2qHoRE1xmMHoqoY0zmth9
 oYtAZrbDgrfwredlUPNUjLaEU4Nw7oOv9HCWEB01yNHg8bB1JEN5PAiozdLE80a7Bgu1xXtW9J
 YM8=
X-IronPort-AV: E=Sophos;i="5.64,349,1559545200"; d="scan'208";a="45333401"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 05 Aug 2019 01:00:10 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 5 Aug 2019 01:00:02 -0700
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 5 Aug 2019 01:00:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ay8V2t+dbio4qqHNq3orM6ZqQDsi/WUJnQLw21DC9vT6bH30MYdKtKGQFvTxsPh9QMtSPL4ckO1le8dPmevqjrHpQDOlanyYeVamEudVWB43Q82+ZJGSP6pEHgS18LcdKd9bOdQe2/1UFekSHTOeXFoV0AsjrsvggKcBRHehc23c4UiE8nbQVKx2+JAWyGO3GB+xeDYw+KTiGjmuj/gnvXfeYAhf+sX3yKB2LSDCWw8jnJtSSenmfL+4W/HTm1uev8+2mU70YY/+VaSxRu+JSGDpLEqJmWN2o+KXM/REBbVu/KIpO26opWHlE47X1nxuiDDZJ0152R9oP+x4mFPYcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=01c1Kb6crj7WRNb1SZde8BFTGRemxxRsJpODHBSLTf8=;
 b=MWNevdtFzxHcX9abwQ5iuWHAR2KyTvvezVrV7TTo35P9J0wfdGBFbbBzvXfA/6uknjNm1lDDaW0PEeuA1KmsIXWcr2UzyBL14kMw6spndW/97umVLoBuYjTcJHSzK/fiuHFKoC0JhiHnOPutzeBzfDmIAMzoqWm9XlvnZWIfFxFoB5BsfJ2oTaxwvVTT2Y8Ai2o7LUSJYZxiHP637sXUPTuiqSoEYhcYmQR4AJr2ohZQlyeIe9gRHnysNxasxdC5zY1JSEe1g7lhKrin1l0u6/P7gNQeXLV6nqcXWHEZ5WUeQibcSd8GNbI9WH2rEbuM9RVRXjFI967IXp6qSRpznw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=microchip.com;dmarc=pass action=none
 header.from=microchip.com;dkim=pass header.d=microchip.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=01c1Kb6crj7WRNb1SZde8BFTGRemxxRsJpODHBSLTf8=;
 b=URvIklekAwz5GVf/Njl1nFKDNRm7ziMCaucPfekx77ZiX9chZMlRMjgj/LzWvysUoFGBfUeFxcoxzZZY41oGexuYKHQys15tXVYS41iSfZZ1Kkt36Lyw/mrrcV4hmD0f492ZfcBCI7WQg/loAADlmGAFEJmmy8IU54junME68aY=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3680.namprd11.prod.outlook.com (20.178.252.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Mon, 5 Aug 2019 08:00:00 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2136.018; Mon, 5 Aug 2019
 08:00:00 +0000
From: <Tudor.Ambarus@microchip.com>
To: <vigneshr@ti.com>, <boris.brezillon@collabora.com>, <marek.vasut@gmail.com>
Subject: Re: [PATCH 6/7] mtd: spi-nor: Rework the SPI NOR lock/unlock logic
Thread-Topic: [PATCH 6/7] mtd: spi-nor: Rework the SPI NOR lock/unlock logic
Thread-Index: AQHVR37XrXJde/MfmUq32aDZ/X2NkabrFOaAgAEjpAA=
Date: Mon, 5 Aug 2019 08:00:00 +0000
Message-ID: <d02fc366-55b6-f698-2419-f277e88dfe02@microchip.com>
References: <20190731090315.26798-1-tudor.ambarus@microchip.com>
 <20190731090315.26798-7-tudor.ambarus@microchip.com>
 <21112f0c-abf0-2b86-5847-2ad7676a29be@ti.com>
In-Reply-To: <21112f0c-abf0-2b86-5847-2ad7676a29be@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0502CA0010.eurprd05.prod.outlook.com
 (2603:10a6:803:1::23) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f7932a17-910b-49cf-7177-08d7197aea6e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR11MB3680; 
x-ms-traffictypediagnostic: MN2PR11MB3680:
x-microsoft-antispam-prvs: <MN2PR11MB3680A7005B1465A52E6AD40FF0DA0@MN2PR11MB3680.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(136003)(376002)(346002)(366004)(39860400002)(199004)(189003)(14444005)(54906003)(66066001)(476003)(53546011)(6506007)(386003)(14454004)(102836004)(2616005)(11346002)(229853002)(446003)(76176011)(4326008)(305945005)(31686004)(52116002)(36756003)(25786009)(486006)(186003)(256004)(7736002)(6436002)(478600001)(71190400001)(71200400001)(99286004)(31696002)(66446008)(81166006)(86362001)(8936002)(64756008)(66556008)(66476007)(26005)(81156014)(8676002)(53936002)(5660300002)(6486002)(66946007)(6512007)(7416002)(2906002)(2201001)(3846002)(6116002)(110136005)(6246003)(2501003)(68736007)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3680;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3gv+v90mxoYI7hiGafc20d4C+lYmk8s2Jty/9/G112N4qYGHASqBGhDY9f2BCjLqJQHlcs1f6YYYqq++ZBPmUdH1BdZrQB/CWKhKI1qthxmGuO1RSCJlSMz4oIpbHFSnZ1kO2b8tHB7Vbx0yYY1wpkSfz8TA8eAsS8xDi47oDhKCs+6xMNeXZAEOcjh/SC7/q33xETLlyMvX6Jc9rj4hvAdfae8y9j/JOQVbdVW/lTt+KKgKPexZW7CUL5pg6pXnqSdr4YuVUeq1w4BJeQtcd492vc1nCoYNUmgBguliNPs3THdgV0bK8XN4TV4iJCwLmbOzwIw6uzBS/ZRFK+c++HhAr1MnWHBTVfRIGgiSmXMlb8H3NkRRakXsAdx4ghQ00BKgVSHm619qKuzDbRO0vlChRnjCvmXMorA7OW7tKU4=
Content-ID: <5FA36FED9DFA4349BDCBD2285EB049D9@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f7932a17-910b-49cf-7177-08d7197aea6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 08:00:00.7564 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tudor.ambarus@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3680
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190805_010011_575338_3B38423F 
X-CRM114-Status: GOOD (  15.20  )
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
Cc: richard@nod.at, linux-kernel@vger.kernel.org, boris.brezillon@bootlin.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 08/04/2019 05:36 PM, Vignesh Raghavendra wrote:
> External E-Mail
> 
> 
> Hi Tudor,
> 
> On 31-Jul-19 2:33 PM, Tudor.Ambarus@microchip.com wrote:
>> From: Boris Brezillon <boris.brezillon@bootlin.com>
>>
>> Move the locking hooks in a separate struct so that we have just
>> one field to update when we change the locking implementation.
>>
>> stm_locking_ops, the legacy locking operations, can be overwritten
>> later on by implementing manufacturer specific default_init() hooks.
>>
>> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
>> [tudor.ambarus@microchip.com: use ->default_init() hook]
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> [...]
> 
>> @@ -1782,7 +1788,7 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>>  	if (ret)
>>  		return ret;
>>  
>> -	ret = nor->flash_is_locked(nor, ofs, len);
>> +	ret = nor->locking_ops->is_locked(nor, ofs, len);
>>  
>>  	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_LOCK);
>>  	return ret;
>> @@ -4805,6 +4811,10 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>>  	nor->quad_enable = spansion_quad_enable;
>>  	nor->set_4byte = spansion_set_4byte;
>>  
>> +	/* Default locking operations. */
>> +	if (info->flags & SPI_NOR_HAS_LOCK)
>> +		nor->locking_ops = &stm_locking_ops;
>> +
> 
> This condition is different than how lock/unlock ops are populated
> today. We would need to add SPI_NOR_HAS_LOCK to all SNOR_MFR_ST and
> SNOR_MFR_MICRON entries to be backward compatible or keep the condition
> as is.

Will do, thanks!

> 
>>  	/* Init flash parameters based on flash_info struct and SFDP */
>>  	spi_nor_init_params(nor, &params);
>>  
>> @@ -4819,21 +4829,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>>  	mtd->_read = spi_nor_read;
>>  	mtd->_resume = spi_nor_resume;
>>  
>> -	/* NOR protection support for STmicro/Micron chips and similar */
>> -	if (JEDEC_MFR(info) == SNOR_MFR_ST ||
>> -	    JEDEC_MFR(info) == SNOR_MFR_MICRON ||
>> -	    info->flags & SPI_NOR_HAS_LOCK) {
>> -		nor->flash_lock = stm_lock;
>> -		nor->flash_unlock = stm_unlock;
>> -		nor->flash_is_locked = stm_is_locked;
>> -	}
>> -
> 
> [...]
> 
>> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
>> index a434ab7a53e6..bd68ec5a10e7 100644
>> --- a/include/linux/mtd/spi-nor.h
>> +++ b/include/linux/mtd/spi-nor.h
>> @@ -425,9 +425,23 @@ struct spi_nor {
>>  	int (*set_4byte)(struct spi_nor *nor, bool enable);
>>  	int (*clear_sr_bp)(struct spi_nor *nor);
>>  
>> +	const struct spi_nor_locking_ops *locking_ops;
>> +
> 
> Also, to be consistent, document this new member.

Will do.
> 
> 
>>  	void *priv;
>>  };
>>  
>> +/**
>> + * struct spi_nor_locking_ops - SPI NOR locking methods
>> + * @lock: lock a region of the SPI NOR
>> + * @unlock: unlock a region of the SPI NOR
>> + * @is_locked: check if a region of the SPI NOR is completely locked
>> + */
>> +struct spi_nor_locking_ops {
>> +	int (*lock)(struct spi_nor *nor, loff_t ofs, uint64_t len);
>> +	int (*unlock)(struct spi_nor *nor, loff_t ofs, uint64_t len);
>> +	int (*is_locked)(struct spi_nor *nor, loff_t ofs, uint64_t len);
> 
> checkpatch does not like uint64_t. Please changes these to size_t

This respects what struct mtd_info is expecting:

        int (*_lock) (struct mtd_info *mtd, loff_t ofs, uint64_t len);
        int (*_unlock) (struct mtd_info *mtd, loff_t ofs, uint64_t len);
        int (*_is_locked) (struct mtd_info *mtd, loff_t ofs, uint64_t len);

I haven't seen the warnings, would you mind pasting them?
./scripts/checkpatch.pl --strict 6-7-mtd-spi-nor-Rework-the-SPI-NOR-lock-unlock-logic.patch
total: 0 errors, 0 warnings, 0 checks, 102 lines checked

6-7-mtd-spi-nor-Rework-the-SPI-NOR-lock-unlock-logic.patch has no obvious style problems and is ready for submission.

Cheers,
ta

> 
> Regards
> Vignesh
> 
> 
>> +};
>> +
>>  static u64 __maybe_unused
>>  spi_nor_region_is_last(const struct spi_nor_erase_region *region)
>>  {
>>
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
