Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA02BC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Jul 2022 08:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=42771mfbdam+GBpFSDMy0wDMMF6JOoqGpiU7E3GaDis=; b=gTf6CXoE36YQHq
	DIk7GaRltDZmoCKtwsTbPMxoxbBjVBkjZ/lqeZLJpiQeczXQtn3F8FUzWHfv69f1OLVDRH456wAtZ
	5MrxP8rTu4gCHiOkdheZsYLFGIRgGi3rE9/LvePM+S2klvbGAddz7psc/d/rrl5EcI/2eBi6N0ncB
	iz1L8riX1+6uUzAssZ/7GWH63fhKq077f7uH8ODXmxkQqcO34gN9v9nguyTh4Tm9E4oNyjl19OJqL
	CNGTeq5UxCeB6lXYYFbaxcr7rS5sVDv83K7bux8kIAA7hQcbwXSANKpGuGwTTo4BTU61jnHULjZ8S
	ImPl71LsOSnJ7pls6+NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oER6P-002Boh-JM; Thu, 21 Jul 2022 08:00:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oER6L-002Bk5-Cw
	for linux-mtd@lists.infradead.org; Thu, 21 Jul 2022 08:00:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658390405; x=1689926405;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=i6p1PI3rOj4rtrZZu5BGhLl954yGb8XdTuYUi6PyrGw=;
  b=gYDOeSJZxunLO5jSszDkgjS77yyDlJAMT6eOpPXmamoCE/2/egaTyuMI
   hMSTiqu78pLIkcXx/An+ewe60lVicgwX/QpLdmscvMz2K84LZgweB8mvR
   D68cLmDW3dNd3t9xko5ZXW3O0zUh9LbsfbbZthn5544Fkkbyszu9HARiu
   DaSLV4tpYJXzhDKEl35H5E7XZ1fzSfeKdip8KjaU3dbGQEBU9gcXxd3Qr
   z5oRBw48JWJVfa32q8W5Td4Oap/JsbHPfkzV35c40owP3EMmIkzgJu+YC
   I44FMc7cJNkvBuN+kL5rbDMs5zFYdGRbtMuNEtVAFWgTVLd1rqjXFdTAd
   g==;
X-IronPort-AV: E=Sophos;i="5.92,288,1650956400"; 
   d="scan'208";a="168853893"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Jul 2022 00:59:58 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 21 Jul 2022 00:59:58 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Thu, 21 Jul 2022 00:59:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LtYgsfMkzSfFLCJkDH/ko0SUo+6oGJd5MMcDbHUw615CuJymBDdri9UJl+HY9HVWOIkJcacvYPIvetgyueMLQg2mRBC/5IiNCNj3Y6OG9+VoTPm9j1h7Ujh7czriMWTUw4hcsBynApmdysmUJr7JgqENOeGIjRIAdnTosMa3oGnq0XI73936Ydjhvw5DBGmTLHaMeGKzzt5QPcqGExKkcMXVN8AZUL47zZq2vPxDNIvjD3em8CdIhysDkN5lokSuw13JfL70oFtqSwmuv1L08lHWoOf7zBmD47TYtvZzQfXnji+c9i3C2Z5GNqySy2A0aoroR/+WQol0Lt5UCvj3oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i6p1PI3rOj4rtrZZu5BGhLl954yGb8XdTuYUi6PyrGw=;
 b=mV0RMX8ttJDlL710oR141MdowyrCN8LToxknz0zH948f8NSvtgSuKJHjI+wb35lwPnyvzoTvFEniF2hUmDbkCJ7ifhkhvo6xNuBH4DxlQ3FgC97b/Yw561QTC2tfUj2Tn1+tscrTR9y9NUO+d+DTLsPrOfC551Su7kFij9WbqdxWAu4rqrYzi9sR4+BmN0OvE///Svu32eeQ7QMpGdLAQ35QNIh7u/MZEon4ofRK71XQ2YZs0PjgZh2OIfmDtUMmDlvBe/3yGuJOZcbMvRT73Or7tcMHRemMduscCvzus/SAgVJEJ6vfwd9vv1Q+0KtXA2zjcQEsIac33v6Tx8Bktw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i6p1PI3rOj4rtrZZu5BGhLl954yGb8XdTuYUi6PyrGw=;
 b=HmVM6xtcFA0yz1yMODwhMvbtgQPz/JlPIopa5tN3Tds+ywskhEvrrR6r2zyuy9DjHi4M5nwr3QXvrvtTr4viVrWkGn/uoPVfq/SlV6VppI9i2i/9nH8b2ysNVL8fMl7Q+NtqkFuZqNqcZyuCnub3NgxKmuBu/nAkrvFPOuny23A=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 CY4PR11MB1525.namprd11.prod.outlook.com (2603:10b6:910:9::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.15; Thu, 21 Jul 2022 07:59:56 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1954:e4ab:eafd:9cb4]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1954:e4ab:eafd:9cb4%6]) with mapi id 15.20.5458.019; Thu, 21 Jul 2022
 07:59:56 +0000
From: <Tudor.Ambarus@microchip.com>
To: <jiaqing.zhao@linux.intel.com>, <linux-mtd@lists.infradead.org>,
	<p.yadav@ti.com>, <michael@walle.cc>
CC: <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] mtd: spi-nor: micron: Add SPI_NOR_DUAL_READ flag on
 mt25ql02g
Thread-Topic: [PATCH 2/2] mtd: spi-nor: micron: Add SPI_NOR_DUAL_READ flag on
 mt25ql02g
Thread-Index: AQHYnNfdv9ZVU9zPV02fSmHYhCykcA==
Date: Thu, 21 Jul 2022 07:59:56 +0000
Message-ID: <9fe7ad54-99d4-b972-1f4d-a5744efc5583@microchip.com>
References: <20220522054802.1719443-1-jiaqing.zhao@linux.intel.com>
 <20220522054802.1719443-2-jiaqing.zhao@linux.intel.com>
In-Reply-To: <20220522054802.1719443-2-jiaqing.zhao@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e2cc1fc9-1ab2-4f72-b809-08da6aef006d
x-ms-traffictypediagnostic: CY4PR11MB1525:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wpsFXi8cvHVEnURZdbMNG/u3LcmeCY8j6fzBDBADpGjTIPCJGmS5oMM5GwPovxPyfVXByQBrWolWHGmlbuhNa4a996RouKma7aKxsJ1rxkaaE7W6MP2u028EG/oC8GKZ2cmdOK5wc73VfKMJ4hnpD/4yyeg1eCjGAI/1S/wCTITaovBOSCnTmWQzACjINV+hjgE5Y4h192EDph2bA4WgByR1QB7bxxZk3eYA/MGYBunBzWoTD+UfUzlHe5QMoaQPmauhUvjB5mp6kUkl68I43W7ziKlJok6od7+5R0cwAT6HLwkrVoqaxJ3+Yj9SZdZ6vBfiF4SJXT5ItYEqDaHkUtkhlAiZlQsOr728A0iCUKTjpLqyuRw9XPRsA9xHwU2I+qeSyXS/rlggF2DpPh+Ua7ZMZdGtEGOra3xycm7UtuDDEkqot90faG/pE+4A2Y5vq9+HA75frVCX6eGPJiPOJCnmstEt9lm4rvG4+VcHKWmPtIR/rU8JEi891vYX6nELxlGFwv4LL30bk2gZWGeXlmCLsw5bL/bbjKO3EfXmhmNbPrtgG1SWxY3mPUdEWFz1kwisMzajZx26rO5RLgZKeR5AsVqtrbuIZwKSWdjNPeU8OjRyDBVtqsNpf1sV1NknjBpTAsAqGroabRlPolOw5ltKVY/QZMQ+2oFFEmbLRmZiQWaZ7QvLR6O5JJqv+vc+f9vajRGKlnsnz+bAQ6Dl3jKv7c+qaRZ7P2LN+chLGxnu6gfhGt1AOV6mDbF0HqxkFH2w3RMDSiyHtk+K7y8mhZF4xE4vHz3OLbyGWWpNWGM/e+TrbxO2MEomi4OKDAIzEZQ3igum6Jsy00G09MQDH/CRak95R/efqrkjifdJl74=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(39860400002)(136003)(346002)(396003)(366004)(6506007)(38100700002)(36756003)(316002)(66476007)(31686004)(2616005)(186003)(110136005)(38070700005)(83380400001)(4326008)(2906002)(64756008)(53546011)(966005)(66556008)(86362001)(31696002)(41300700001)(66446008)(5660300002)(91956017)(8936002)(71200400001)(478600001)(6512007)(76116006)(122000001)(6486002)(66946007)(26005)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aklDTXBIVlBSMFFBdFhPNHNPdm93RjRsREV6cGNhMzNPM2FiVEZPYVJJam9C?=
 =?utf-8?B?ci9VRjRncnVSa2duOHU0enpVaXhmb0dBVFhPUFl4REVxWEtBRW13RlNtY1VO?=
 =?utf-8?B?UkNpQ0hKYzEwTDkxR0prZXNLb3I4bGtRTFdCb2NhYmR5T0FJdGFaRlpnMnRs?=
 =?utf-8?B?c2lpb2dwZE9BL0lzcGJDNUpsVWRiUkJuS1FteVZtR2R5RklHU0dpdE14N3ZL?=
 =?utf-8?B?andkZ3BQMTkyQmlMVkUrYzdYMDBMeG5LK0RTUnNCTmpRRTFEOTBsUHBWdXJ1?=
 =?utf-8?B?TzRLR0tNN1FzUktyek56b3JGb3RZKzlUR1RPZXdzSmtCRjg1UGpvZnZWUXh1?=
 =?utf-8?B?c1RsdlBFa05qMjdpN3FSUkJHMm85Um9tUGR3V2dISHk2UUh1a29sazBXSVZa?=
 =?utf-8?B?SEJqeGdkV0pNR0JyWkkydzBaUzdSTHdWWU1lSEN1TUdDcytyRGhGK0QvRVZX?=
 =?utf-8?B?ZEJhNElZb3dESmRGOTZZSXkxaGZCdDZpT3VXNS9RUzZ1MTFQNE5YbVN6YTgx?=
 =?utf-8?B?MStnK1RpMVZIRHUrNU1UaXRVTXZQTURjZ1dFZ21SQzMzV21IaFJ0WTFnUFM4?=
 =?utf-8?B?Vi90ajV2R29TWE5XWE5LdENpUkdrbDNsbURmVGNJYVQxVXZCZE55R25UcGNi?=
 =?utf-8?B?WUxCc1A4VG15b2hDZkl6TlpRekJ2bUE0MVU2cng1SXdzNGNsRGdHSWRpYzd1?=
 =?utf-8?B?RDlKV01WZlRRMHdIcHY0SDF5cUNrdTZybDNyaW9ndGpUSnBDbE14UFBvald2?=
 =?utf-8?B?VVlDdXBuOWovZkZWY3piaXNsaWhyaEROKzlFMUYwOXdxYlVsak54SytqZVBv?=
 =?utf-8?B?VkU0MHFvM0RWbE84NGtEQ2RrY05tL2hhZXkrb0xpdjBLL2swQWtoWGxzWXN1?=
 =?utf-8?B?b0lPQVU2RkVIYlJEWXB4OWtaT2RjV2JvMStLc1Z0V1ZXRnZ6R0RRUW9UZFZ2?=
 =?utf-8?B?RWIwNTFRcTIzdTBRaDUxRFgwSDlSVjRJMVlmb3F2aWgwbFdqOGhzamdoMlVF?=
 =?utf-8?B?UXpmdE1WR205eWhmc3UvMjVqT29xR0lCc1dVbnNoOUdvSC8rRWVFVTNDQ3lI?=
 =?utf-8?B?bEhBbFR2NW5SVjh0WE5jTC9FZEgvZ2VxNXJ1d0NDWmNDWCtUNmpCSjB4dnVk?=
 =?utf-8?B?dHdVaXh5eVpSU203QmpJK3d6d1FrbDdJekpNNkQ1ZTZTZE8rK09RVFRDVTNW?=
 =?utf-8?B?RVhKUXAwQ2xwd0Q4WWtJTm5LUkd2MFFMdWdvV2g4ZVJiSGphdEVFd1FINXh1?=
 =?utf-8?B?MkUyUVZUbW9Sb1pYblJXcnQ5TGE1cUx6OC9SWldrZVc2WmZsTzYyWDFLRG00?=
 =?utf-8?B?bzQrb3FWdDlmQjkrYWxOR0VMUEhYd3ZBUTF2djhIT1FPRm9lSG9uanhmWGZy?=
 =?utf-8?B?dkdPSkZlUFRTNGsrUXhtSm13bTlkR3ZPNWdCSExXT2tYWjVCOUxkM3hsTysx?=
 =?utf-8?B?Rjd2V0tjU3gwdU5KWHM3dWg5emVDUXNVOHlJYXNjMkR4ZnQzeGJCbE5paFNQ?=
 =?utf-8?B?TlBabjhuN2NMTVZSc1NUYXJoYkFXM2hxZ004SVJsUDEzckI5TmdCb2VKQUJ1?=
 =?utf-8?B?RjJjUDB5NktEMlNtUUJlY2RhcjEwbFdTNVk3OEFGRHNPVFcrK2FJRnV4aElE?=
 =?utf-8?B?UE9pNFZ2M1lmL0F2S0s3WlZicGMvVEp6MlB5dExBeWJEY2o4VUVrczhYSkZW?=
 =?utf-8?B?Vnl4cTdpcUpKNGtXeGdOKzlnb2U3MUJGMFNPOWpQZ2tDZ0kwdTNaRXFsSXRE?=
 =?utf-8?B?ZjYwOWF3WVQ1SDBnd0doQXJKUFRWVnJIeWJ3b1hOUDl0NlpVUlhuRzN0cnZ5?=
 =?utf-8?B?Y0FLcUp2bkRnU1hiZlJLL2txd1dRQVEyS0RDWUFaek1LNjJPa1pBcUptbHl6?=
 =?utf-8?B?bGZraTNjSGdqSEQ1dUhEUloxcE9Wdzg5YWh0VVV2eGQ5Nm9pblB6TUpJYzF2?=
 =?utf-8?B?ak9YeldSZ2tBRTZjOEcrdHJDYXQ1bEJKcnFzSG1FMnZ1cnVYbk5HOGlhZis4?=
 =?utf-8?B?dmRtcHZjU2hiMGU1eVVud3RPaG1nZTRsNG5Pb2Q5cGVvNzJ4S1RMTThvbWdx?=
 =?utf-8?B?NGV1eDZmdDB3cFJkWnN2OFRxY0Z4ZTdoV0F5MFB1SXYvUENzay9DN1hHaTV4?=
 =?utf-8?B?Rnc2bEVFb2I2cGY5bnZDMHVGZndSMFB2KzV6K0UvTGdNTmNZTVpPZGMvMjJE?=
 =?utf-8?B?TXc9PQ==?=
Content-ID: <384FB453B8CA484686914261AD562570@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2cc1fc9-1ab2-4f72-b809-08da6aef006d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2022 07:59:56.2640
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IehlI358SsTN79f+sE0PoCergdX7wDWq4oOX2POWoXSbLxFb5DV9bKHyIhphhMIOuORrkt6PallDT4g+2w/EyJgyb3841wpwkmlwmotVnTQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1525
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_010005_533089_E4D2BFE5 
X-CRM114-Status: GOOD (  19.81  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 5/22/22 08:48, Jiaqing Zhao wrote:
> [You don't often get email from jiaqing.zhao@linux.intel.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification.]
> 
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> The Micron mt25ql02g supports x2 width dual mode operation. This patch
> adds the SPI_NOR_DUAL_READ flag to its flash_info entry.

can't the dual mode be retrieved from SFDP?
Can you dump the sysfs sfdp table please?

> 
> Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
> ---
>  drivers/mtd/spi-nor/micron-st.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
> index 8a20475ce77a..da0251c1a263 100644
> --- a/drivers/mtd/spi-nor/micron-st.c
> +++ b/drivers/mtd/spi-nor/micron-st.c
> @@ -233,7 +233,7 @@ static const struct flash_info st_nor_parts[] = {
>         },
>         { "mt25ql02g",   INFO(0x20ba22, 0, 64 * 1024, 4096)
>                 FLAGS(NO_CHIP_ERASE)
> -               NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ)
> +               NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
>                 MFR_FLAGS(USE_FSR)
>         },
>         { "mt25qu02g",   INFO(0x20bb22, 0, 64 * 1024, 4096)
> --
> 2.34.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
