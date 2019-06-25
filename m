Return-Path: <SRS0=BdDe=UY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66E2AC48BD5
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jun 2019 07:56:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FCBD20659
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jun 2019 07:56:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sph+aqe5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="3qW2VgCI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FCBD20659
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iXXSmZyIxj0Daj6VugqL0iQbwKbtgQ4WfIWF+bjzZfI=; b=sph+aqe5ul72s9
	lBvB51Yx64Rqte9n0M9BqbgKqGg4/IX5xidR2dU028Otz65XDmyHohzPBbpzpse7yRftgJ05gBiJt
	s9hnbMtuFi0bXYsKTLHCKNgUDHNkFmz+NjVAQyvi/5oNQSsMcXy54i0FqS6lVJyOH1VyVaW8JJfQu
	QqO+nO0WrEeeWwPtfA3jK3CCK0B/ped/5W+x+kWTwzm+2XK17PVXxO9sVQua515FTK4POrcLlnchA
	c2hB0vTDX5m7/7fohtDX4mnYZ8rcDLWgZ7/ATi1nPcl2XrT6aTG1nYswPbyVvDJnY6jy+ffzHDcdT
	v0h6MrW7mI9oqEW+1Ktw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hfgJ8-0001cs-LK; Tue, 25 Jun 2019 07:56:02 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfgHB-0007Nn-Gg; Tue, 25 Jun 2019 07:54:08 +0000
Received-SPF: Pass (esa2.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa2.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa2.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
X-IronPort-AV: E=Sophos;i="5.63,415,1557212400"; d="scan'208";a="38762188"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 25 Jun 2019 00:53:58 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex03.mchp-main.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 25 Jun 2019 00:54:02 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Tue, 25 Jun 2019 00:53:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/BEFb3qHZ7fxUXHyvbyLY6Js/BQDUjQ4ENe41GLGg58=;
 b=3qW2VgCIcvrBNHqbDQKOvAZXawzQxZMUuuUt70f0vSMTh8xPYV+PfGti8LBG5yTYQTx7Gr4zIZlmUAMZ23USI5lBj7H5XrJWA38Gea6YaMGoyjpaq6HSwvqZv9IVpAZYzYSlD9JYtslE4yuokTvw3urj6X1G9IDqrwQ+6ytAnbI=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1889.namprd11.prod.outlook.com (10.175.100.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Tue, 25 Jun 2019 07:53:50 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::e581:f807:acdc:cb36]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::e581:f807:acdc:cb36%9]) with mapi id 15.20.2008.017; Tue, 25 Jun 2019
 07:53:50 +0000
From: <Tudor.Ambarus@microchip.com>
To: <Eugeniy.Paltsev@synopsys.com>, <marex@denx.de>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: spi-nor: add support for sst26wf016, sst26wf032
 memory
Thread-Topic: [PATCH] mtd: spi-nor: add support for sst26wf016, sst26wf032
 memory
Thread-Index: AQHVHUfULV5f3c0l6EGHxaXBBI7PvaanjSsAgAOlG4CAAOlhAA==
Date: Tue, 25 Jun 2019 07:53:50 +0000
Message-ID: <927c5fe0-9e6a-f6bb-80e5-835bc3c8cbca@microchip.com>
References: <20190607154308.20899-1-Eugeniy.Paltsev@synopsys.com>
 <aab6510e-9608-584e-1556-613bb0be482e@microchip.com>
 <305636da161f6c204e39936696301c226c1c95f9.camel@synopsys.com>
In-Reply-To: <305636da161f6c204e39936696301c226c1c95f9.camel@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR04CA0135.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::33) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 12c1b12d-971d-46ea-244d-08d6f94242df
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BN6PR11MB1889; 
x-ms-traffictypediagnostic: BN6PR11MB1889:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR11MB18894266632840456ADC50A0F0E30@BN6PR11MB1889.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0079056367
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(376002)(346002)(39860400002)(136003)(366004)(189003)(199004)(305945005)(6486002)(6436002)(2201001)(7736002)(4326008)(229853002)(14454004)(6116002)(3846002)(14444005)(256004)(86362001)(31696002)(2906002)(966005)(6512007)(6306002)(72206003)(53936002)(11346002)(446003)(486006)(476003)(2616005)(6246003)(53546011)(6506007)(386003)(102836004)(54906003)(110136005)(316002)(99286004)(31686004)(76176011)(52116002)(81156014)(8936002)(8676002)(36756003)(81166006)(26005)(2501003)(186003)(66446008)(64756008)(66556008)(66476007)(66066001)(5660300002)(68736007)(71190400001)(71200400001)(25786009)(7416002)(66946007)(73956011)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1889;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: U5O/ZrcH67QyTrxuhLmuOhuypX8hDTbtBtMX69FisAGO5+j4hL21DLlEabEP6Tl41nSOul7HprJ5jqkzILfnBun5vm0TKJeL0IW9Mio8lmo3mebsi/l1wIwWAWRzduzVKErY3EUJAMFWGLpKte3uxNEADibW7SHMi4o+vhmLBwZrS91xNp0Fh7dZ5NLIaQALwQZtlp3RBdx/oXuWRP+q9md/87U1d26xKzSaM0QcoFKhOPh1f7pbO2TU0fxvKAYzk3KfMS7HlJZkhC2f98PBbPN6wwVyGusv2S+pKfpSMCvU4OtuLRbdkACyYf1+PNfxJVuk6eaV0hDi3bU+/ssr4sohcbqlLKDDVQ9Sjj+l5WceUj40YrXjVgRUTdSX+LWxIUtLg77uQkC+Dmed7wgslSYlqySS3SFCVPcfJrKJrR0=
Content-ID: <DFF2834F5B4A7C44970D84CB21E333E8@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 12c1b12d-971d-46ea-244d-08d6f94242df
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2019 07:53:50.7534 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tudor.ambarus@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1889
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190625_005401_739055_54790F79 
X-CRM114-Status: GOOD (  15.68  )
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
Cc: computersforpeace@gmail.com, richard@nod.at, Alexey.Brodkin@synopsys.com,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com, miquel.raynal@bootlin.com,
 linux-snps-arc@lists.infradead.org, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Eugeniy,

On 06/24/2019 08:58 PM, Eugeniy Paltsev wrote:
> External E-Mail
> 
> 
> Hi Tudor,
> 
> On Sat, 2019-06-22 at 10:18 +0000, Tudor.Ambarus@microchip.com wrote:
>> Hi, Eugeniy,
>>
>> On 06/07/2019 06:43 PM, Eugeniy Paltsev wrote:
>>> External E-Mail
>>>
>>>
>>> This commit adds support for the SST sst26wf016 and sst26wf032
>>> flash memory IC.
>>
>> Please specify if you tested both flashes, with 1-1-1, 1-1-2 and 1-1-4 reads.
>> Let us know which controller you used. I ask for these to be sure that we don't
>> add flashes that are broken from day one.
>>
>>> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
>>> ---
>>>  drivers/mtd/spi-nor/spi-nor.c | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>>> index 73172d7f512b..224275461a2c 100644
>>> --- a/drivers/mtd/spi-nor/spi-nor.c
>>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>>> @@ -1945,6 +1945,8 @@ static const struct flash_info spi_nor_ids[] = {
>>>  	{ "sst25wf040b", INFO(0x621613, 0, 64 * 1024,  8, SECT_4K) },
>>>  	{ "sst25wf040",  INFO(0xbf2504, 0, 64 * 1024,  8, SECT_4K | SST_WRITE) },
>>>  	{ "sst25wf080",  INFO(0xbf2505, 0, 64 * 1024, 16, SECT_4K | SST_WRITE) },
>>> +	{ "sst26wf016",  INFO(0xbf2651, 0, 64 * 1024, 32, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>>
>> I confirm that the above is correct.
>>
>>> +	{ "sst26wf032",  INFO(0xbf2622, 0, 64 * 1024, 64, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>>
>> There are sst26wf032 flashes that don't support SPINOR_OP_READ_1_1_2 (0x3b) and
>> SPINOR_OP_READ_1_1_4 (0x6b), check
>> https://urldefense.proofpoint.com/v2/url?u=https-3A__pdf1.alldatasheet.com_datasheet-2Dpdf_view_392063_SST_SST26WF032.html&d=DwIGaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=ZlJN1MriPUTkBKCrPSx67GmaplEUGcAEk9yPtCLdUXI&m=YKOAFhTsmcxVNOmy6DO67WYZYdo6xYa7ojebIBU-K-c&s=k2yRqWlXBllfG2R2HvqTwAjGYCmvjGm9tmVYxzDg_wA&e= .
>> You
>> can't add SPI_NOR_DUAL_READ and SPI_NOR_QUAD_READ if 0x3b and 0x6b commands are
>> not supported. Check spi_nor_init_params().
> 
> Yep, thanks for pointing.
> We are using 'sst26wf016b' on HSDK devboard. I added 'sst26wf032' to make flash upgrade easier,
> but I don't check carefully enough that it has completely different control logic and not only size.
> I'd better drop 'sst26wf032' in v2 patch respin as untested. 

ok

> 
> In this setup we use "snps,dw-apb-ssi" SPI controller and we don't use dual/quad IO. Should I
> drop (SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) for "sst26wf016" in v2 respin?

We can keep them. Please specify in the commit message what was tested and say
that the flash's datasheet advertises both dual and quad reads. We will give a
benefit of a doubt to the flash manufacturer.

Thanks,
ta
> 
>>
>> Cheers,
>> ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
