Return-Path: <SRS0=c8/f=WB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D9E5C433FF
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Aug 2019 07:44:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 215D121871
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Aug 2019 07:44:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EY7FLVpQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="qtugD/z3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 215D121871
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aTIK6c2uH1Q3sy9Bzk1rWhyWvXIEMNwWIJbu0vl8kP0=; b=EY7FLVpQsoNu/I
	nrrh2Qs5mKUd8LF4UXOdx1jecyMspjH1fpHTsYmAy5E6iai1bDyLojpQty0SS2UWht05Ne3OuRU+1
	0xKlDRzPeK8bJJLywelRm+hiatGSyyiD1YAKYqrvgFI8GAu1XcNjbbWLvC7vrcF4RK1QjL5RTdEdi
	pwMPOPXgp+T9cdJc5yvWqxQwtBiewECwaHibDBVzLkiIXcgPPZbCZshKRQWrdua5cmVXaZcHF9hwq
	Am2uLnvDCJ4L70Wm/ooP8Ce3vo8Wp0QYgxT8JGoHO0DEHMGN9ScNExjXfG6N48LxTjrYKJ3jIY6wA
	mmNlXtIdqRsefJLUuXqg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1huXey-0005Ck-Uu; Mon, 05 Aug 2019 07:44:00 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1huXev-0005Bx-Un
 for linux-mtd@lists.infradead.org; Mon, 05 Aug 2019 07:43:59 +0000
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
IronPort-SDR: 4AAaTbLY7AqE+llloLaO5kHdo3k0Uy01J2l5PHth00RzH1hzE4zIsJPiMLBwLenBiGvL/E53uW
 6WNcN05aI4bCdRU4iwk/x+bmvHPGxHlA7z5gz6FhaR9ZjWYXE3AD8wKnXMB7sZmGBZ1T3rG0hW
 SzQiBaRwboD0af/XiFtmx0h0/PHVn/a/oB24OnpgsCnysS2y+igAULfTxzdog+sf0XaN+IlYoX
 pPq0SsmoL3LqvmfyKwI0h0Te1Ia6RJu56M5SWot6UJQHhCKWa+3nfNLkM8ac0YM8pMgDuYaGFb
 Ero=
X-IronPort-AV: E=Sophos;i="5.64,349,1559545200"; d="scan'208";a="45331127"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 05 Aug 2019 00:43:55 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 5 Aug 2019 00:43:38 -0700
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Mon, 5 Aug 2019 00:43:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dSPppaXzSDF4vX5NAhu3aj3BkVH1ciaYBmbjcsr/0bxRzHpNsEHOQPC//tNPRXsx8JVpWj356FTRpYJVwbBieo9dVr+JZsPZ/1ysXtzt428skE4Iz4Wn9y9WE6/Cr5u5g/RqbR0YX5lJ3kkpWPgmQJL0vj/kdOPDu+Ev9MH7q2V48m7pwCMA9J+cUDQG8u7LgqhWFCTYgsBiis5T98EkGNeRKN42y8388hqX4HjpPHVYIPUZdmLN4brxe7CekiU8kiBnxbhJ7mapde+Huo+ohWSiO0eJfg2gfDT+Z9gT5gk2n4arzPGbESVX7hzatjmzwEGQoJCE2En0+RMM374i/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gk3rkc5mjDRjkS9tWeXPmVt+SP7IE95cd4lWvchRFLE=;
 b=XcXOAjMnSbqB5dX5zrz8vn1ItLuRw8XW7ZB9WofoVfH6cIELodVSgGaEBltPew9iA7kwEabgXdlNnna7KT8kKER4kDMaYwT80OWb78pt7mZqk8F/4PLkL2VIk5E/pOyZnJfqfMKHe0HUXsD00pGDFURoiS3kQ5jSbqA53uzLe4d/da8R2Kp98LBaPP0rujleDdJ0ZqDlf5zFQVygABhlxo5nRxcEy79GTdGYKm6xiSO/hECwpkUm7L4B4bPr5HbRzfquT7dFY3/9p2lq1wRhhAbvX01Iex9I/DGAASh8oNLhdYGAMYF+xUwvlY5eg6fHDAq6yMIFzxHwWU7I3cpwLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=microchip.com;dmarc=pass action=none
 header.from=microchip.com;dkim=pass header.d=microchip.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gk3rkc5mjDRjkS9tWeXPmVt+SP7IE95cd4lWvchRFLE=;
 b=qtugD/z3Oh9quLaDF63wEqmdhpXeAA3WuOl7EbOd6iiQG+IzfnwPyv6oLunpt/2T7CcXh9F4c1OIrT7S93iQMhTK/ohWUwYvqGsNZ1tx0YRP2eTw90Yywkl7JUMi4vyH1JaHS3WP0rj9gcbW10OkMc1pP7u1Sh1B1bzmJq40sso=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4223.namprd11.prod.outlook.com (52.135.37.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Mon, 5 Aug 2019 07:43:37 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2136.018; Mon, 5 Aug 2019
 07:43:37 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@collabora.com>
Subject: Re: [PATCH 3/7] mtd: spi_nor: Rework quad_enable()
Thread-Topic: [PATCH 3/7] mtd: spi_nor: Rework quad_enable()
Thread-Index: AQHVR37TzKxNRrn8H0elIoBO1LpPu6bl1guAgAZd4wA=
Date: Mon, 5 Aug 2019 07:43:36 +0000
Message-ID: <6e0cd8fc-b5c0-0cf5-5b1e-78ff0dfe7443@microchip.com>
References: <20190731090315.26798-1-tudor.ambarus@microchip.com>
 <20190731090315.26798-4-tudor.ambarus@microchip.com>
 <20190801082949.2f08feae@collabora.com>
In-Reply-To: <20190801082949.2f08feae@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR09CA0151.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::35) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8ade760a-5f52-41aa-2399-08d71978a003
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR11MB4223; 
x-ms-traffictypediagnostic: MN2PR11MB4223:
x-microsoft-antispam-prvs: <MN2PR11MB4223A587DEA54552021427E6F0DA0@MN2PR11MB4223.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(366004)(376002)(136003)(346002)(39860400002)(199004)(189003)(52314003)(3846002)(2906002)(229853002)(6116002)(6436002)(54906003)(6486002)(8676002)(81156014)(86362001)(81166006)(99286004)(76176011)(31696002)(186003)(386003)(486006)(102836004)(71200400001)(71190400001)(2616005)(476003)(14444005)(316002)(8936002)(53546011)(52116002)(6506007)(26005)(256004)(478600001)(66476007)(64756008)(31686004)(66946007)(446003)(11346002)(66066001)(6512007)(14454004)(6916009)(5660300002)(66446008)(66556008)(6246003)(36756003)(68736007)(7736002)(25786009)(53936002)(305945005)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4223;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: YtbCL+WyRpnYe0+ncJccYF06+KW0nI3i/pCEeqOaynDJD9r6GHpwHJeS4BFe8k9LHImfN63qXRwgI58c3M0QnTNSiVh7XXOBcp5984+w6J7LW7bs4vZrv1VPKt0JBFkA8UbaHx7R+FuoeqfeSrbArx6SAOg0rFSOHDA7R6duIUhizsnqQL9ynfwxTvo6HNNKRCdl2t2SgrK7OBdMng4ZFO9MlTbjEs6Z4wFDHAw7xiC4LZ8WMhUob9xz0l2cmQkEtcC4tdh6N20O6hpbHrxU+pbVsEoJYRNZ9auFcuduATupsGyT0LXY1DRce7UBrBRH1m2ORJQxG9JICsSpbZvU225UnxtzYQqL65ikSMWcofpQFVf916VWq1UqUEIUPeDGKuzZFShR20F2sKvWp0MsWDsCqOdZx7/w8K3cnB1bHhs=
Content-ID: <C8BBF5BE3860AF45AB55E68A68B90264@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ade760a-5f52-41aa-2399-08d71978a003
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 07:43:36.9953 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tudor.ambarus@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4223
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190805_004358_164071_BFEB7CD2 
X-CRM114-Status: GOOD (  18.43  )
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
Cc: vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 08/01/2019 09:29 AM, Boris Brezillon wrote:
> External E-Mail
> 
> 
> On Wed, 31 Jul 2019 09:03:31 +0000
> <Tudor.Ambarus@microchip.com> wrote:
> 
>> From: Tudor Ambarus <tudor.ambarus@microchip.com>
>>
>> The goal is to move the quad_enable manufacturer specific init in the
>> nor->manufacturer->fixups->default_init()
>>
>> The legacy/core quad_enable() implementation is spansion_quad_enable(),
>> select this method by default.
>>
>> Set specific manufacturer fixups->default_init() hooks to overwrite
>> the default quad_enable() implementation when needed.
>>
>> Get rid of the spi_nor_flash_parameter int (*quad_enable)() pointer to
>> function, as we always choose to overwrite the nor->quad_enable,
>> if needed.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>> ---
>>  drivers/mtd/spi-nor/spi-nor.c | 103 +++++++++++++++++++++++-------------------
>>  1 file changed, 57 insertions(+), 46 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>> index 94aba5ce1462..a906c36260c8 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -101,8 +101,6 @@ struct spi_nor_flash_parameter {
>>  	struct spi_nor_hwcaps		hwcaps;
>>  	struct spi_nor_read_command	reads[SNOR_CMD_READ_MAX];
>>  	struct spi_nor_pp_command	page_programs[SNOR_CMD_PP_MAX];
>> -
>> -	int (*quad_enable)(struct spi_nor *nor);
>>  };
>>  
>>  struct sfdp_parameter_header {
>> @@ -2275,7 +2273,7 @@ static void gd25q256_default_init(struct spi_nor *nor,
>>  	 * indicate the quad_enable method for this case, we need
>>  	 * set it in the default_init fixup hook.
>>  	 */
>> -	params->quad_enable = macronix_quad_enable;
>> +	nor->quad_enable = macronix_quad_enable;
>>  }
>>  
>>  static struct spi_nor_fixups gd25q256_fixups = {
>> @@ -3618,24 +3616,24 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>>  	/* Quad Enable Requirements. */
>>  	switch (bfpt.dwords[BFPT_DWORD(15)] & BFPT_DWORD15_QER_MASK) {
>>  	case BFPT_DWORD15_QER_NONE:
>> -		params->quad_enable = NULL;
>> +		nor->quad_enable = NULL;
>>  		break;
>>  
>>  	case BFPT_DWORD15_QER_SR2_BIT1_BUGGY:
>>  	case BFPT_DWORD15_QER_SR2_BIT1_NO_RD:
>> -		params->quad_enable = spansion_no_read_cr_quad_enable;
>> +		nor->quad_enable = spansion_no_read_cr_quad_enable;
>>  		break;
>>  
>>  	case BFPT_DWORD15_QER_SR1_BIT6:
>> -		params->quad_enable = macronix_quad_enable;
>> +		nor->quad_enable = macronix_quad_enable;
>>  		break;
>>  
>>  	case BFPT_DWORD15_QER_SR2_BIT7:
>> -		params->quad_enable = sr2_bit7_quad_enable;
>> +		nor->quad_enable = sr2_bit7_quad_enable;
>>  		break;
>>  
>>  	case BFPT_DWORD15_QER_SR2_BIT1:
>> -		params->quad_enable = spansion_read_cr_quad_enable;
>> +		nor->quad_enable = spansion_read_cr_quad_enable;
>>  		break;
>>  
>>  	default:
>> @@ -4286,10 +4284,41 @@ static int spi_nor_parse_sfdp(struct spi_nor *nor,
>>  	return err;
>>  }
>>  
>> +static void macronix_set_default_init(struct spi_nor *nor)
>> +{
>> +	nor->quad_enable = macronix_quad_enable;
>> +}
>> +
>> +static void st_micron_set_default_init(struct spi_nor *nor)
>> +{
>> +	nor->quad_enable = NULL;
>> +}
>> +
>> +static void spi_nor_mfr_init_params(struct spi_nor *nor,
>> +				    struct spi_nor_flash_parameter *params)
> 
> So now we have spi_nor_mfr_init_params() and
> spi_nor_manufacturer_init_params(), that's a bit confusing. Can't we
> just inline the below code in the spi_nor_manufacturer_init_params()
> func? I guess this func will be removed anyway, so maybe it's not
> such a big deal.
> 

Will do. spi_nor_mfr_init_params() would have been removed anyway when moving
the manufacturer specific code out of the core. I chose separate function to
underline that these selects are done solely based on JEDEC_MFR, while the
default_init() sets data that can't be deduced from JEDEC_MFR. But might be
confusing, so will remove it.

> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> 
>> +{
>> +	switch (JEDEC_MFR(nor->info)) {
>> +	case SNOR_MFR_MACRONIX:
>> +		macronix_set_default_init(nor);
>> +		break;
>> +
>> +	case SNOR_MFR_ST:
>> +	case SNOR_MFR_MICRON:
>> +		st_micron_set_default_init(nor);
>> +		break;
>> +
>> +	default:
>> +		break;
>> +	}
>> +}
>> +
>>  static void
>>  spi_nor_manufacturer_init_params(struct spi_nor *nor,
>>  				 struct spi_nor_flash_parameter *params)
>>  {
>> +	/* Init flash parameters based on MFR */
>> +	spi_nor_mfr_init_params(nor, params);
>> +
>>  	if (nor->info->fixups && nor->info->fixups->default_init)
>>  		return nor->info->fixups->default_init(nor, params);
>>  }
>> @@ -4369,25 +4398,6 @@ static int spi_nor_init_params(struct spi_nor *nor,
>>  			       SPINOR_OP_SE);
>>  	spi_nor_init_uniform_erase_map(map, erase_mask, params->size);
>>  
>> -	/* Select the procedure to set the Quad Enable bit. */
>> -	if (params->hwcaps.mask & (SNOR_HWCAPS_READ_QUAD |
>> -				   SNOR_HWCAPS_PP_QUAD)) {
>> -		switch (JEDEC_MFR(info)) {
>> -		case SNOR_MFR_MACRONIX:
>> -			params->quad_enable = macronix_quad_enable;
>> -			break;
>> -
>> -		case SNOR_MFR_ST:
>> -		case SNOR_MFR_MICRON:
>> -			break;
>> -
>> -		default:
>> -			/* Kept only for backward compatibility purpose. */
>> -			params->quad_enable = spansion_quad_enable;
>> -			break;
>> -		}
>> -	}
>> -
>>  	spi_nor_manufacturer_init_params(nor, params);
>>  
>>  	if ((info->flags & (SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)) &&
>> @@ -4569,7 +4579,6 @@ static int spi_nor_setup(struct spi_nor *nor,
>>  			 const struct spi_nor_hwcaps *hwcaps)
>>  {
>>  	u32 ignored_mask, shared_mask;
>> -	bool enable_quad_io;
>>  	int err;
>>  
>>  	/*
>> @@ -4617,21 +4626,23 @@ static int spi_nor_setup(struct spi_nor *nor,
>>  
>>  	/* Select the Sector Erase command. */
>>  	err = spi_nor_select_erase(nor, nor->info->sector_size);
>> -	if (err) {
>> +	if (err)
>>  		dev_err(nor->dev,
>>  			"can't select erase settings supported by both the SPI controller and memory.\n");
>> -		return err;
>> -	}
>>  
>> -	/* Enable Quad I/O if needed. */
>> -	enable_quad_io = (spi_nor_get_protocol_width(nor->read_proto) == 4 ||
>> -			  spi_nor_get_protocol_width(nor->write_proto) == 4);
>> -	if (enable_quad_io && params->quad_enable)
>> -		nor->quad_enable = params->quad_enable;
>> -	else
>> -		nor->quad_enable = NULL;
>> +	return err;
>> +}
>>  
>> -	return 0;
>> +static int spi_nor_quad_enable(struct spi_nor *nor)
>> +{
>> +	if (!nor->quad_enable)
>> +		return 0;
>> +
>> +	if (!(spi_nor_get_protocol_width(nor->read_proto) == 4 ||
>> +	      spi_nor_get_protocol_width(nor->write_proto) == 4))
>> +		return 0;
>> +
>> +	return nor->quad_enable(nor);
>>  }
>>  
>>  static int spi_nor_init(struct spi_nor *nor)
>> @@ -4650,12 +4661,10 @@ static int spi_nor_init(struct spi_nor *nor)
>>  		}
>>  	}
>>  
>> -	if (nor->quad_enable) {
>> -		err = nor->quad_enable(nor);
>> -		if (err) {
>> -			dev_err(nor->dev, "quad mode not supported\n");
>> -			return err;
>> -		}
>> +	err = spi_nor_quad_enable(nor);
>> +	if (err) {
>> +		dev_err(nor->dev, "quad mode not supported\n");
>> +		return err;
>>  	}
>>  
>>  	if (nor->addr_width == 4 && !(nor->flags & SNOR_F_4B_OPCODES)) {
>> @@ -4782,6 +4791,9 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>>  	    nor->info->flags & SPI_NOR_HAS_LOCK)
>>  		nor->clear_sr_bp = spi_nor_clear_sr_bp;
>>  
>> +	/* Kept only for backward compatibility purpose. */
>> +	nor->quad_enable = spansion_quad_enable;
>> +
>>  	/* Parse the Serial Flash Discoverable Parameters table. */
>>  	ret = spi_nor_init_params(nor, &params);
>>  	if (ret)
>> @@ -4858,7 +4870,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>>  	 * - select op codes for (Fast) Read, Page Program and Sector Erase.
>>  	 * - set the number of dummy cycles (mode cycles + wait states).
>>  	 * - set the SPI protocols for register and memory accesses.
>> -	 * - set the Quad Enable bit if needed (required by SPI x-y-4 protos).
>>  	 */
>>  	ret = spi_nor_setup(nor, &params, hwcaps);
>>  	if (ret)
> 
> 
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
