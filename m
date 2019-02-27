Return-Path: <SRS0=gTFy=RC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F12B5C43381
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Feb 2019 13:29:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C23D02075B
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Feb 2019 13:29:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Sz5sHVm0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nokia.onmicrosoft.com header.i=@nokia.onmicrosoft.com header.b="dGud4GWV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C23D02075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nokia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9gX0Hx6AynV+6o/2FNP8i+AlOfJWHBvuyfz5nSHld2E=; b=Sz5sHVm0nHptwE
	BdnPDvRU704s48cTKpMs7DmR27UlsMSkdSpZlRLzbs/wQq5O0BFBzWhZS9hvHL6VPooIqDDJ6MWkO
	p9MYDVh0tqopOdLUYYaGSn0QTYTytsOZo4z9QydDA+Fejf0x+N2nRpH4yBjUcaFemvBnXHyBxuiZB
	xiVd30g31IqC3o12pxMcBY5TG+7a89p8iqfJJPQkKlTZAsycCxja/8AbriauDljloM4DvOsuHa5eh
	u+xsdmE7Ye3WAZnChj8HTbLswCSSBiQOq3INcGVaBjaTppi3pXbtaT0WCQpdOcyU8NLXLpecWZ6YF
	AUQlYG7cAhw4ho4GQx7A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gyzHY-0006sI-0y; Wed, 27 Feb 2019 13:29:56 +0000
Received: from mail-eopbgr80093.outbound.protection.outlook.com ([40.107.8.93]
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gyzHT-0006rd-Vp
 for linux-mtd@lists.infradead.org; Wed, 27 Feb 2019 13:29:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
 s=selector1-nokia-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TWo8ha4A1jc3cPp62/sDfOctjhJx7HxJN9JLF8NTPpE=;
 b=dGud4GWVIi2/5PNnYLffE1MVjS26vwGx8WP+yDJw9q8p98IVbTcOQyt3PM2+H5L/Tt/sHm/m83NuaBHaqtr26LqBtJf8Lew4MwzlcpejGhozwmVkhAo68Tz5FctGhXdeK1EYr69xO2JwZaP2Bo/k0CGqXBFMGeigokCovFTU8z0=
Received: from VI1PR07MB5902.eurprd07.prod.outlook.com (20.177.202.154) by
 VI1PR07MB4671.eurprd07.prod.outlook.com (20.177.57.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1665.13; Wed, 27 Feb 2019 13:29:44 +0000
Received: from VI1PR07MB5902.eurprd07.prod.outlook.com
 ([fe80::8899:2ceb:9508:1c00]) by VI1PR07MB5902.eurprd07.prod.outlook.com
 ([fe80::8899:2ceb:9508:1c00%5]) with mapi id 15.20.1665.012; Wed, 27 Feb 2019
 13:29:44 +0000
From: "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v2] spi-nor: intel-spi: Avoid crossing 4K address boundary
 on read/write
Thread-Topic: [PATCH v2] spi-nor: intel-spi: Avoid crossing 4K address
 boundary on read/write
Thread-Index: AQHUzoLR83xWyQgGN0a7EHqHdsNcMQ==
Date: Wed, 27 Feb 2019 13:29:44 +0000
Message-ID: <cb243c64-c329-de1a-4dac-b0304290d5bb@nokia.com>
References: <20190226112334.401-1-alexander.sverdlin@nokia.com>
 <20190227095617.20968-1-alexander.sverdlin@nokia.com>
 <20190227102732.GU2696@lahna.fi.intel.com>
In-Reply-To: <20190227102732.GU2696@lahna.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [131.228.32.166]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
x-clientproxiedby: HE1P195CA0003.EURP195.PROD.OUTLOOK.COM (2603:10a6:3:fd::13)
 To VI1PR07MB5902.eurprd07.prod.outlook.com
 (2603:10a6:803:9a::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=alexander.sverdlin@nokia.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9adee73e-ea8e-465a-2951-08d69cb7a2a5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR07MB4671; 
x-ms-traffictypediagnostic: VI1PR07MB4671:
x-microsoft-exchange-diagnostics: =?utf-8?B?MTtWSTFQUjA3TUI0NjcxOzIzOlFWUHV4anNoSWNESGdSbGFJb2ExNW4zNHN5?=
 =?utf-8?B?blZnd1BDZFpsZE9FTGlLMmdCcmZhcVVvRlNoUjV5ekdnMG9lblZLbDJ0ejhW?=
 =?utf-8?B?N2JPenR1SGE3VHJ6eGZTQjZ1a1dPR2tLN1dCM3FpNFNvTjhNcTBxZ21FTEV1?=
 =?utf-8?B?N01CZVAxY3FBZVd4SGFsMmdXanBaejAxS29XcVVBQ2F5ekpjOXJ2bzFndXI5?=
 =?utf-8?B?KysrSk95czFjZXlKUlJUd0g5eVZ2cE0yVm5VY3lUWjFqaXVjVEx6dWw5ZWxW?=
 =?utf-8?B?enk1Y09ZSzZzZHdRc1cveUZhSUtzUWg5MGxWRmZvSHQvcnkxdTZaaDRsTkha?=
 =?utf-8?B?aks0NnhBcnkyU3pabzVBNjdDcG1KK1dBRWhMWTVSdUMxdDE5QXJkbjFRRjlq?=
 =?utf-8?B?dHl4ZWRoMlBCOEtXaGhENTBTcGdaQzRvQmVPSUJ1Sm0ycjhWYjJDUUxjVDJG?=
 =?utf-8?B?cnA1bDdmMStpeVdDVzM4QkZaZ01YY2pzZ3FyMTNla2hSb3B3VzYxTys5UU1p?=
 =?utf-8?B?MGwrcFovLzZWbTQ1c2pmVlRvNXQ4S0JNbTZFU2U3c2VtTmVrKzNoTFpaazhu?=
 =?utf-8?B?ZzR1bjZzYTFBZ0xncTJMaDV1SW5XVnNnWllSTm9ZTFNuYmNrcHhrUUtqbkRi?=
 =?utf-8?B?Mi9DQ2V3N3hEek4yRWhDZE51Ty9RUnc5ckVQb0tQVFJmYy95YVJoZndsdGIv?=
 =?utf-8?B?dTNtcklaanBFZkF6eEV0L3hGRXpXeFJ1Z3ZYbktIaTBBcS8vdmV0REozYXZH?=
 =?utf-8?B?REhhaWsxTzBlRXh3UjdpbW80U2Fjc2txeTA5SGdJcnY0VGUzRG4wSmE1d1Z1?=
 =?utf-8?B?RGo0RmZ0cFcwOENKUUdZdHdRMklwNzJTNXE0Z3RxQ2x2Z29GWmx2M0RPN295?=
 =?utf-8?B?eWMxNjFZcnNzdDFTV0tQblljRVlJTGlTS1hDelFkVnUrZG95VnpwYytFN3NZ?=
 =?utf-8?B?bWliNWh0dlFTYlF2VjFKeERRSW1BT21vcHhTWSsxdzJvcU00ajFDYU5rZVcx?=
 =?utf-8?B?dmNSa3FvaXBnVGhCK2pYSm5sQyt1bGY0dkwrbDMzeFVRbkFtRTRVSjZHMDJL?=
 =?utf-8?B?TngzcEhldHBEdVNhamFHSXcxZi80SU01L0J2Nk5pdFlUZDdlWnBHKzV4MTNl?=
 =?utf-8?B?TFMyOW8vTDRkMXgyMjVQeVFENnBhZjVESk1QVGV6SXRHYjVGWTlDcGpDejRD?=
 =?utf-8?B?SElzaW9JYWZJMG1UbkFjR1BqYU11YlhzOXovbVlIdE9lZmxDZUNLK3ZvUEor?=
 =?utf-8?B?c2pXWnV2T2I0RFdMekFNdVFYcGk2YjkxYUdyRi9OVlpJb24vaHg3elZXZlBr?=
 =?utf-8?B?UUJuVXVKV3M5Z01wS0c1TXlWOWtsOWZ5Vk1OMGtncEpKcHpnMXpjaXRVSnJ5?=
 =?utf-8?B?bk91WklhbGMyYXIzYTgvQWdJRzNLcFpvT09LeWdvdHg4SkpDWkRQYUY4WGxW?=
 =?utf-8?B?MTI1bGpTVGN6WW5zVkJSN0dGNmVlY2lQNEF6UytDNkQzMjlHb0FXeTQ0SVNl?=
 =?utf-8?B?L2cwdEhwVmc0eEZDWWVVbmd6NE1lRlNWUlFINlZZZ0JnK3RBVlZOcDRjaFR6?=
 =?utf-8?B?WHZVSU41S3M3RjdMeUNNd1hNRThTRUxOZHJpZElDUVFkK0VCeDdGNW1FYVBw?=
 =?utf-8?B?RkkwVjYwWW95ZVlhMG9PTEhvQWxDNW5za1ppV3g3SmdORzBTS3p1bFRKdERs?=
 =?utf-8?B?RmhjQWhKZTNjVmJ2eWtjMWhMNC92Y0pQOXVWYy9HQUxxakttaGhJUmp6NGp0?=
 =?utf-8?B?MkxMbjBXMkNCWHJyRzlRQklzTUtTeStqTGJLL1dWSUdzRTMzUSsvVVkzVkRq?=
 =?utf-8?B?allFNHl3bmU0cytqR0RDbGF2QnFUbWoyT3hUQ1FpOXVYZVZtVG9UR3NhaXRH?=
 =?utf-8?B?YS9aWVpRaXpXK3dPZHRmYmJudHp0aHFwYUNDK2pEMjQwU2VkdGNZZGJDZFZD?=
 =?utf-8?Q?wZl2kM5ryYMJ9rF0YWyRxFUDm9zRMM=3D?=
x-microsoft-antispam-prvs: <VI1PR07MB4671B9981FF0723653D7A00988740@VI1PR07MB4671.eurprd07.prod.outlook.com>
x-forefront-prvs: 0961DF5286
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(346002)(136003)(366004)(376002)(396003)(189003)(199004)(54534003)(58126008)(6246003)(186003)(486006)(14454004)(76176011)(99286004)(6116002)(65826007)(316002)(7416002)(52116002)(3846002)(476003)(11346002)(2616005)(6512007)(5660300002)(6506007)(31686004)(4326008)(86362001)(105586002)(386003)(53546011)(31696002)(53936002)(8936002)(305945005)(478600001)(8676002)(36756003)(7736002)(81156014)(14444005)(102836004)(106356001)(68736007)(25786009)(71200400001)(446003)(71190400001)(6486002)(6916009)(2906002)(65806001)(65956001)(26005)(66066001)(54906003)(229853002)(64126003)(97736004)(256004)(81166006)(6436002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR07MB4671;
 H:VI1PR07MB5902.eurprd07.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: A0j4Z+BDOB6eYGQw1YCjHwUXjhe7PYuQExKEfMle7ui1A48Q2OyIgYDt8ex6NR//hI2GnGw+1nTuuUctOQ6UMgsvzh5WYNiFDS40wNiNuttv4/mgT2r+z+QKgSbNsr7n4V/FDJHKuBVy/anMCAhdtlCV6Eu0G2Q0eMWOTM6Dug3gp1Vrgqk/mp4fNL9oOBfr2AL4dxQor/x+6ohV6imMzhXB3JBSWGI6GR9savLzjpIzIq3W8apD25BfRLyvkr6iQZ2nTZ1o3wiRTI18sudtAvJ2Fy6bmjJmGZiPauty8ik4zprtWZGSn3XiFifdbKCtKb+Hx1dwN0mSHxcprtKlQ5k8NCKTNNineJUHCpMAxUljHVJ9fgv56vosZnihOoCOwd/zT1ZetEfdebd52KNAYuwXLNTuVxfHdV5s6l4MmI0=
Content-ID: <59A2BC1E2EB8EC46A34519656CF7D264@eurprd07.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9adee73e-ea8e-465a-2951-08d69cb7a2a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2019 13:29:44.3486 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB4671
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190227_052952_077409_F76B8682 
X-CRM114-Status: GOOD (  15.82  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Bin Meng <bmeng.cn@gmail.com>, "Porte,
 Romain \(Nokia - FR/Paris-Saclay\)" <romain.porte@nokia.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Fabreges,
 Pascal \(Nokia - FR/Paris-Saclay\)" <pascal.fabreges@nokia.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Mika and all,

On 27/02/2019 11:27, Mika Westerberg wrote:
> On Wed, Feb 27, 2019 at 09:57:15AM +0000, Sverdlin, Alexander (Nokia - DE/Ulm) wrote:
>> It was observed that reads crossing 4K address boundary are failing.

[...]

>> Reported-by: Romain Porte <romain.porte@nokia.com>
>> Tested-by: Pascal Fabreges <pascal.fabreges@nokia.com>
>> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
>> ---
>> Changelog:
>> v2:	More macros! As Mika suggested.
>>
>>  drivers/mtd/spi-nor/intel-spi.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/intel-spi.c b/drivers/mtd/spi-nor/intel-spi.c
>> index af0a220..8c279c4 100644
>> --- a/drivers/mtd/spi-nor/intel-spi.c
>> +++ b/drivers/mtd/spi-nor/intel-spi.c
>> @@ -632,6 +632,10 @@ static ssize_t intel_spi_read(struct spi_nor *nor, loff_t from, size_t len,
>>  	while (len > 0) {
>>  		block_size = min_t(size_t, len, INTEL_SPI_FIFO_SZ);
>>  
>> +		/* Read cannot cross 4K boundary */
>> +		blocksize = min(from + block_size, round_up(from + 1, SZ_4K)) -
>> +			    from;
> 
> Nit:
> 
> It looks better if you put it into one line like:
> 
> 		blocksize = min(from + block_size, round_up(from + 1, SZ_4K)) - from;
> 
> 
> Regardless of that,
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Please ignore v2!
There was a failure in build/test process on my side.
I will send v3.

-- 
Best regards,
Alexander Sverdlin.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
