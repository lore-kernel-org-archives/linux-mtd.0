Return-Path: <SRS0=c8/f=WB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0657CC0650F
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Aug 2019 11:51:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDD4B20665
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Aug 2019 11:51:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rcvWDJ99";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="atNFzFSO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDD4B20665
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aQLEPbbZWU3IT4tWjjfQb62IfHhQgb7BI5VC7uKSAZI=; b=rcvWDJ99Ai0bUY
	BJkLGSQYW6ZC0LNWNE2fHd24a9CiKbhNXSKsv25HqRlRaCiU4KZPzROw4ofXipq2fe1Ohu3aGJ4WW
	x2YOIhZKuOf8wYR8XZJA6CXlDKgfxBbQN5wgQxWqlCVNUK6LZ+7WJuzszzzMqUvyBBMfF95H9lkmw
	x37S4hg1fYbFfRNuAKQeOIl9/E/kzpxxFwfik85GyPNFUvXO/LjJ762E0Su0rHpwP+fZ9luEOWzNQ
	OydQLm+3eIcrUzhrMJcGwIF1EG8GZt8ogY4BakFnkmuOnr8rVTYMrSo6O7uT9Vvvp7iy3s3TOto7R
	S+O6qyK3eWqEgz+IroUw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hubWP-00066x-7A; Mon, 05 Aug 2019 11:51:25 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hubWM-00066C-7E
 for linux-mtd@lists.infradead.org; Mon, 05 Aug 2019 11:51:23 +0000
Received-SPF: Pass (esa5.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa5.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa5.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: lifZH3wGHBRAdrYexc9ea0wZi/mxZJIoiwCRc8c8f4lep8If6WgDTiK60r405QvUFenVSlJV9q
 FzJFD6djYqp4QPGXYKDRuEOnkQZPWxr8+2aA8xfqETfNnEbg9/yPnmijv9I9O7NP/84y7oZh/S
 xZGX4m2lBeZ7rcvZAtDwe8G1z4sz4fH47zaxhF11J/BrWW3eCesJcI0LGyJwDeo0Ei0OncBj6G
 9kgTX9tBPh90fyHaQ/v12xCeJ9oqrwCKBHomRV30Nr15zQ9XTcIJY6PjUQXeCRT6ts2NrEtjSN
 kxw=
X-IronPort-AV: E=Sophos;i="5.64,349,1559545200"; d="scan'208";a="42413242"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 05 Aug 2019 04:51:19 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 5 Aug 2019 04:51:18 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Mon, 5 Aug 2019 04:51:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hTKrv7i4DC4LA4pb8i396HuHEaf8BKG6VfpHKpF7VKqCrwYxXoDsyi1hfJE3yg3jGMN+GZtR0PnZ0qWplbEOmS6G6kI7QfJIxY9vjqDxz1tnI9qR+eWNhE2K7GG52Qg2XjE4VmWu4FNLMiMUHYrSdDQmAeeHWh1Saptso2T1giQMStrTkPgLlc5PYhqeIA2HOJ7n2pxFPBjD/YkcLRkFiO4SItmW2WwWwUWAkapKN/a8cyJeo2sQJDNwuJJmz1fx3txLnX+pm2zSdWz1VpdVRcXPIHgvuZq2+H7zjSsDusejmfuMweTHMZUW1btHNmZPWiSaQ+0jgF5qdymo20Nm9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VEuMaxV+bXkmxp6ViOS6Lds0F46bzYUEj0TvlPycnfs=;
 b=hHW2DI+asZ0jtYmNM0TUte14vRkScKl06a3pzkc+T3CRifNswLGmROLBbeoVCbv5SGiD5BoBEYmruHMkLhH3EjnmwlxqRUfaNhHsTh+K/+07da5ncNVddedu/Woq4DjnqGmWI/kRoP6OQwIfHLN8iSDOEpI0AO1j+TKT0bzGgcy66Mq8fdpzJxojnMi1OnwoJOliEG9yHWc7Mr3poH40oKQsOeGLM8aUigE75yWq1Frv0ObKMttG5pSaaWXh8Unw6+s/mcgG3zDOhwTtGwoKCNZCo8Ol2snDb/kQFGaOJt1IZ/6vBryfU52nTrOIykpnkSlCzAOSiYHNFPvEZjjsPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=microchip.com;dmarc=pass action=none
 header.from=microchip.com;dkim=pass header.d=microchip.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VEuMaxV+bXkmxp6ViOS6Lds0F46bzYUEj0TvlPycnfs=;
 b=atNFzFSO+owsA+ZHL14rPejf4BZPgkwXsdAjIp+64JM+47Hn/NK8rTbJ7CXPJY9lNPcp45kq8z2VAzEcR6kC/tNEi7iZ+Xl+6fQH9eqDTkKgNH7Rs8OqjK072bnspNbdYtlNEdKu9b+40d6dZOIiXDDqSAKS8D3+jWQGuftf6pM=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3790.namprd11.prod.outlook.com (20.178.253.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Mon, 5 Aug 2019 11:51:17 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2136.018; Mon, 5 Aug 2019
 11:51:17 +0000
From: <Tudor.Ambarus@microchip.com>
To: <vigneshr@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>
Subject: Re: [PATCH v4 2/3] mtd: spi-nor: Move m25p80 code in spi-nor.c
Thread-Topic: [PATCH v4 2/3] mtd: spi-nor: Move m25p80 code in spi-nor.c
Thread-Index: AQHVSIVNR1h9SqkuukqZlfb/4kclfKbsXzAAgAAMhwCAAAtlgA==
Date: Mon, 5 Aug 2019 11:51:17 +0000
Message-ID: <50066b1c-6c4c-4aa7-c03d-1d2876afa2c2@microchip.com>
References: <20190801162229.28897-1-vigneshr@ti.com>
 <20190801162229.28897-3-vigneshr@ti.com>
 <852ffdd1-a546-03db-3b60-47d60bd8d7cf@microchip.com>
 <c4aa9ee0-9deb-9432-5ae6-0c807092ef35@ti.com>
In-Reply-To: <c4aa9ee0-9deb-9432-5ae6-0c807092ef35@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P189CA0014.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::27) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4a932877-b881-48e9-6518-08d7199b395c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR11MB3790; 
x-ms-traffictypediagnostic: MN2PR11MB3790:
x-microsoft-antispam-prvs: <MN2PR11MB37906F9ACFA115646902C128F0DA0@MN2PR11MB3790.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(376002)(136003)(39860400002)(396003)(346002)(189003)(199004)(6246003)(229853002)(2906002)(256004)(26005)(66066001)(2201001)(31686004)(25786009)(14444005)(53936002)(71190400001)(478600001)(66556008)(8936002)(6512007)(6116002)(66446008)(6436002)(81166006)(5660300002)(81156014)(64756008)(66476007)(66946007)(3846002)(71200400001)(446003)(110136005)(11346002)(316002)(7736002)(305945005)(76176011)(4326008)(52116002)(54906003)(8676002)(102836004)(53546011)(476003)(2616005)(186003)(6486002)(2501003)(386003)(6506007)(36756003)(486006)(68736007)(99286004)(31696002)(86362001)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3790;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: MiSITnm+dX3YKAPq4Kp0+Fuspa9t+YsSO+PR3m+MjLAgfbnXWEuciIQbDuzGgY8UU+cM7LEp7+e7wVtNujH4DGJamc948hbLezXSatwptQ8oVMTIejlWs3D9uKLpjtvJM85b40jF9vvJ0qUuBUIYEHiw9Mx1f5bvAdDeU1opmQVR9jPJGDQek8oB/LMIH3kz/SffqISftn7FWuru1g78PLRvrJx2CTcwTS/jaCdkcvRm1dJ3rsogRlnBtJ5196I0tGurmeFh7sWioIe3TePyGOM9SJWSOFHoKy0wcoDq4yy9b6iR2pb0Y6cluxnwuLZHc18Bv5taK8vEm7lM2aSFQB//IqLTakIB59uMJmZ2LqJeluINhc1GwKcB60wS3evLZ/VxLFuAbV/dqBM+6GwahrzZVSaaEXC+hE0seByNoSk=
Content-ID: <9148F9C01450134FB27D8410B29BE24A@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a932877-b881-48e9-6518-08d7199b395c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 11:51:17.0945 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tudor.ambarus@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3790
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190805_045122_438277_18849D17 
X-CRM114-Status: GOOD (  12.98  )
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
Cc: marek.vasut@gmail.com, bbrezillon@kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, tmaimon77@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 08/05/2019 02:10 PM, Vignesh Raghavendra wrote:
> External E-Mail
> 
> 
> 
> On 05/08/19 3:55 PM, Tudor.Ambarus@microchip.com wrote:
>>
>>
>> On 08/01/2019 07:22 PM, Vignesh Raghavendra wrote:
>>
>>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>>> index e02376e1127b..866962c715b4 100644
>>> --- a/drivers/mtd/spi-nor/spi-nor.c
>>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>>> @@ -19,6 +19,7 @@
>>

>>>  
>>> @@ -688,6 +1003,16 @@ static int spi_nor_erase_sector(struct spi_nor *nor, u32 addr)
>>>  	if (nor->erase)
>>>  		return nor->erase(nor, addr);
>>>  
>>> +	if (nor->spimem) {
>>> +		struct spi_mem_op op =
>>> +			SPI_MEM_OP(SPI_MEM_OP_CMD(nor->erase_opcode, 1),
>>> +				   SPI_MEM_OP_ADDR(nor->addr_width, addr, 1),
>>> +				   SPI_MEM_OP_NO_DUMMY,
>>> +				   SPI_MEM_OP_NO_DATA);
>>> +
>>> +		return spi_mem_exec_op(nor->spimem, &op);
>>> +	}
>>> +
>>
>> this should be done below in the function, after masking the address.
> 
> Nope. It would have been true if addr been sent as part of op.data.buf.out. 
> But since addr is being send as part of op.addr.val, spi-mem.c takes care of this for spi_transfer(s)
> 

Is this valid also for the controllers that implement the ctlr->mem_ops?

>>
>> You add a double space after return in:
>>> +	return  nor->read_reg(nor, SPINOR_OP_RDSR2, sr2, 1);
>>
> 
> Ah, Will fix
> 
>> There are some checkpatch warnings that we can fix now.
>>
> 
> I did see warnings like:
>>
>> WARNING: line over 80 characters
>> #1023: FILE: drivers/mtd/spi-nor/spi-nor.c:2554:
>> +				   SPI_MEM_OP_DATA_IN(SPI_NOR_MAX_ID_LEN, id, 1));
> 
> I think its okay to overshoot 80 char limit for better readability. 

ok

> Let me know if you think otherwise> 
>> ERROR: space required after that ',' (ctx:VxV)
>> #1270: FILE: drivers/mtd/spi-nor/spi-nor.c:4846:
>> +	{"mx25l25635e"},{"mx66l51235l"},
>> 	               ^
> 
> This and similar warnings can be fixed, but will throw off alignment wrt previous lines.
> Therefore I let them be as is.

ok

Cheers,ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
