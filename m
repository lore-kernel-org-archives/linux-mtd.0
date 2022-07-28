Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41602C04A68
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Jul 2022 02:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ro5bV2EP55Th4rx32oJ/y8TWmSPwjFeXvy3Wwhtwljs=; b=u6vXvlRCbpG+lU
	F8PdWjTFdOLdrQY1uWs5o0X1DJirChw+VSRxLCrdFAW4DDYypGWLy+1a89eK9Sg+N+ffwg4T8BHS6
	81sFbMEW/TGYsw+38YKYouparlbZfGKAM4gr1vSr5QJAfJoC2szkNL08nHNaDuDz3gFTQoLCBLRpz
	716NcaJ93Cdyg2T0DlIsUXlNqdB8rRajogpsN3WmMiMsB2bum/xKVdOH0H5eFxaywfiPllx2gNaXi
	P2OyhPz7tXgJV3KCjNmF0B5gvnxbH4sYBtCSvyzRRqi3MeagT0VNfitCHb8qsUdb3qxsZmxLZCg8v
	2FMW7+0mO7vn7rKddXSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGtZA-0036Ei-4e; Thu, 28 Jul 2022 02:48:00 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGtZ7-0036C4-Cw
	for linux-mtd@lists.infradead.org; Thu, 28 Jul 2022 02:47:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658976477; x=1690512477;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=l2BmHrSciW1a4SGm3jVRdxEqTuyroYTDgoowQ4mNgOw=;
  b=NnBctE2Ic6PO3NcvZV3Na8SbdrGrCZsimUSl61s4RT1FG7ZkQHcZuhUm
   YcOHiSp4zRUy+TpkfyTMkfABUJ92+dRAdUhivJPp0T/5DI/dqRfdsuPbU
   xLRFrzFZmbFOyA8zjMofqLn0eWZ7z5ov6RJ/8Gyj3NhzjzJacOomRfl7D
   0oANxvWntC4cR1vxn/81VWLnc2NVpEXnQSEchA6ZcJvOAq7lBe8ljivZa
   T9QIQe8AbiDjIVj5cVpcEGMk3NN36WjovkcQoDd6o8lJdTRn3LmqahjiL
   eWwt9suH/qZ3Xjh/d3Ll8853gTT7S7MwUSs3HDtejzaNvFtvRChN4Q5qB
   g==;
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; 
   d="scan'208";a="184060844"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Jul 2022 19:47:46 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 27 Jul 2022 19:47:46 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Wed, 27 Jul 2022 19:47:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h2B42wQKOgWh0dA11kQVzOFAR7VjshZJX+CUVULG3+tzWG8AhWu7xgJsPR8EGVGUSMrGyI0r+gG9/zaFjQO17Iq8gd3kzykAGkwlGoqQ38KcdlMFRMY2k+m2lcnDL36h6dW6Vdpp6knnCMxXybVfwY5i6XPjukxc6u40NFtAWINkj8RHyQ9REE/wZetvAAVd04ULTDTW7aS1T/jsR7uieN1WMSA0QZGkWOYOQ8ejIWCe1N1o4w6670SL7USKB/pnNQ92MnPoZTTJsRHodTv83/aupUDlzZIqm51I8e898gp6AEummeQz3GEvEt7h7sLjm3nAXVg/xGQgGd80v0ASHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l2BmHrSciW1a4SGm3jVRdxEqTuyroYTDgoowQ4mNgOw=;
 b=d06vR1nlSnO9xtgwjMwRJx8u4AU1AgBlAdgGcOJCllwwrAcyCn+bOIGc/khbHsxKQbdZBYC6/qSbkKh/u8F+7Mja7dHVnws3Hzk9K9uMawt5r0JmcObAuzZDG7dJrVC+aj05CTka2wWUQhb6YgpyNWzrsFv/RSvlmWMLh6NYR7cy4oWQoSuWkcd13ZbmCuiAsUhwkh1nLio+Ni+S66U+l6gjrWDj+8M4IfOH4do8BVSTkj43cDZIrJXMNw3XASPVbt2BppoLsrOk19DnhOJsWTJolWyoAgkATi+ZmkxmSUjAZGPkKof+YgzyrX+ZanLnspnsz5DVi19ulwzqdJdM+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l2BmHrSciW1a4SGm3jVRdxEqTuyroYTDgoowQ4mNgOw=;
 b=Oyxmaoj1fYl1EIoL9ODFPMuy5g05fxBCoRRfhdGJjpDEMbhV8lQUAb4EJRYnApsj6Q740yvUQm8EQWv2gaXZY9fXX0muy6PD4aZvY2v0ajUzlMbdSkNpw3phD0vqgmnqfypVSVFFGUSL/QMAQ2b3CKSTY8VdmAmNxCiy0/604nk=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 DM4PR11MB6429.namprd11.prod.outlook.com (2603:10b6:8:b5::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.6; Thu, 28 Jul 2022 02:47:44 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::7549:c58c:5e93:7c35]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::7549:c58c:5e93:7c35%5]) with mapi id 15.20.5458.023; Thu, 28 Jul 2022
 02:47:43 +0000
From: <Tudor.Ambarus@microchip.com>
To: <linux-mtd@lists.infradead.org>, <p.yadav@ti.com>,
	<inux-kernel@vger.kernel.org>, <miquel.raynal@bootlin.com>,
	<patrice.chotard@foss.st.com>, <vigneshr@ti.com>, <richard@nod.at>
CC: <christophe.kerello@foss.st.com>
Subject: Re: mtd: spi-nor: fix spi_nor_spimem_setup_op() call in
 spi_nor_erase_{sector,chip}()
Thread-Topic: mtd: spi-nor: fix spi_nor_spimem_setup_op() call in
 spi_nor_erase_{sector,chip}()
Thread-Index: AQHYoixoGnLX55wXPUaCxJnAw9nzBQ==
Date: Thu, 28 Jul 2022 02:47:43 +0000
Message-ID: <a5cda5ac-02ab-a429-3593-cfccb9e3066d@microchip.com>
References: <20220629133013.3382393-1-patrice.chotard@foss.st.com>
 <165897588859.58160.1276614701145818210.b4-ty@microchip.com>
In-Reply-To: <165897588859.58160.1276614701145818210.b4-ty@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7552d3d3-c5bf-40ee-091c-08da70438bed
x-ms-traffictypediagnostic: DM4PR11MB6429:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UB4RRGXfhfGUiiaSmkpk88odtqNMdAvGCctiuNatiIQg/YOMcc/DHN8jZpjwd2RMS1ZuAMu9tZpiOzWPBftA0LPLCDQe1J8wEdbCyoPPR3Ij8CrGpHvtyH3vKJ+JpcqhPxQTggb9TFdPHTUFLrYmIpj1J1m14mgtdmBQ8w6Nf6Lmnx0UTmOaV/RKE2m5qZd0WZzJ/vpWkAzNd2IYlHwcwnSwxpdMDf6YhauFpSlEx9IrstUFqcS4aFUCOP6QCrNOcohqkYohc0stAgyQVRyvVxuo0KgHlpjfFzy44f3P453XMlKx50b0OITD1bVBOJyMs25y2nKLxhl1lGyaby16d+WvuFaycVq2fLl0a+sNvdytI6rYDpvhH53mronRs00olcpsOU0ks5unr/L0srVvLgu21BSV73gx+LUCSb0TjUYQYhq7vFpQluQ/NTT66N/zvV0LqvRduil3fZHerQ0YArT0MyQ+boNSs0gdcxUjggSt8Ex5lG8k3HbDa9IDkPWjCFCSXLpuGC0iwQgnyODwtHjn+NinqI3gFGjyhfsLS3l7BIep8wMvAUtTvCDQQGobh+VBNpFuq8t9YFp+n305rILgFwJOFInWzb406ocSbThIugDpyvlwcCoMHajrTXDnCrj4Weo8ws0eVhNnuxo0lc6RAmPPkkrOjDNdSvU2PcEueAYveRvnk0jNXxyfk+nuWC/HQCmFARzl7flcx9kAgdibLXqwJhZOd5oSNAyCrvlkL5Jssv68QcftXZTcxq5NXBDin6yErJRK5xijJEROlNuj23KRmKqeFWGSd4oA9rP22CG02Mz4DWw+IShJGk21pPfjDTrzv4W6G8u2ewTd5bK4FhzwfacNwRqVHVIfM/tVUQwa1QuhWvA1wGcYeqD5VFupOiruIWyMaMmp1zAuhygi8B7uc5jJOvs0NRnvYYEftvNahmUTMy8/I4PFyeif
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(346002)(39860400002)(136003)(376002)(366004)(36756003)(2906002)(4744005)(91956017)(66476007)(4326008)(64756008)(8936002)(31686004)(66446008)(66946007)(76116006)(38070700005)(31696002)(86362001)(110136005)(316002)(66556008)(8676002)(6506007)(71200400001)(6486002)(966005)(5660300002)(2616005)(478600001)(6512007)(186003)(53546011)(26005)(122000001)(38100700002)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q3lNdXJCOUNZb2piVGt6RFpVYUowUFhUdXZUVnR4aVRSNFphM05ZU0YwMGJF?=
 =?utf-8?B?Z0VteUlZUmFya2ZrazFoSDRZcXJlSHZjR1RBeXZUbkx2N1ZFbjA0eDBldUtr?=
 =?utf-8?B?Y0F1cEwxdDdtVFBnNExNSEhrYXFwN3AwOHlVODMxWFhPSEduUFJidEF2dHNp?=
 =?utf-8?B?L1V4L1RGbDFtSCtzekdzbUQ1QnR2WmMvRG9PcEl0cmszSExya29oQ2YxZVBt?=
 =?utf-8?B?V21Ncm4xVUh2V1BLU3BQRWdteEZTNUVhREhjektHYlJWT3J2Mm1reEdncHJk?=
 =?utf-8?B?TFlUM0F2Q2lIenBnZ3cvaXgrZENpeUUyMGJMZ3hYY3BqcGxhOXV3THpzSE92?=
 =?utf-8?B?RHN6amVmdVZiMkt4SVlqdy9SSi9rM3F0YVBZUE4yTnNScnZZMGNnV1FnYi9P?=
 =?utf-8?B?L2tMQWhSREpRUEIxbkRnREN6VGc0QkRQcXhVL3dPdEZ6Uk45bHM0MXNEa3Aw?=
 =?utf-8?B?dXhpTEp6aWp4eDVTUFMxdEVzeTB4QXh5dzFRNlN4UWxCMVpsL0cxbElOS3pU?=
 =?utf-8?B?WHJNWEoxd1dOZitKNzFYNWlkMUhIZEhnTEJUZlJvYXhGcWR0VkszUzZlMzFT?=
 =?utf-8?B?V0Y0UDFYSTk5NWJBbXpwdWw2VTdjVGJJL3A4N2Uydmt3dVQ3NDcvZndDUFFp?=
 =?utf-8?B?VTVkYU03RzR4VFhqZUFPeDhRTUhoU1JtNWtHa3ZTSFhiekhSUE81Rm5jZHA1?=
 =?utf-8?B?MThRbkFkNXFjK3FVRUdBQ1FqeFlScUQ1WEthczdTRVdqUXFZUW1vRUpkQUl6?=
 =?utf-8?B?eDd3RklXUDZqaDcwUlFyWkd0S1hmZnhzdi81YTJoSW5qRlhVUmgzSEJwN3d4?=
 =?utf-8?B?bVdUTTlGZDZXMStVZ083WDd5STJ5RXB3MWVOeVZ2WTJEcnltZ2ZWbW16TmNY?=
 =?utf-8?B?dzhhc0VwV3dmZUFKaFp3RWNRb21KNVpnRDZDT0wwRXpkOFdhNGdYRTI2RTEr?=
 =?utf-8?B?S0hyK1ExMDJUa2tQRWIxcUdsRDI3RGNsdFNWNytHdUpMOGhoZ0xCOVFNYnNG?=
 =?utf-8?B?QU9OV01PcUJnVVNQN0NhMWpMQXpyeHZGMHFGWVhrSTduckxQZHUrQ29QTHAv?=
 =?utf-8?B?SXBwRmVDbHlqUFRRR0ZuZWlQSys4WVloTTgrQ0hHRmtYdG1xOW5mK1VSUU9H?=
 =?utf-8?B?UXcxdUQzTStZaWZzMTFoRElMRitDOTJSU0NBVjdiR1BUamJwZmh1RjVpYWw0?=
 =?utf-8?B?SG9vZm05Y2xZS0xyT1Z3bEFTU1FXQlBxS2tLV3oreGVsZHQ1Q2RCTmRMUld0?=
 =?utf-8?B?blkzdElENXBmb2lMNXlFbEtiM296RHFkVVVMNGxlWE5EZFI2eGpYQmlialZS?=
 =?utf-8?B?eXNPbGtLMDI0TSsvaHBNQ2w0N2xjNGNKdU5ES0VVT2dlSXFQOFFITENlVmdR?=
 =?utf-8?B?WjN6U2p4VDFRT1QrWFJsUXJoUG13Y3gwZEFHamRKZ0ZRNFVwOVB3VE13ZENi?=
 =?utf-8?B?K2t0WWtudURLc3lCYmRodkVGTVg2V2Vtdm5SZGxOcHBabjBqZzgwRzVoUU82?=
 =?utf-8?B?VXdqb29PalpLd01KbzdxZndsdnNLdldRcnR0RFBTcHdVblhMWjlvaDdjdGNY?=
 =?utf-8?B?YndVcUFLU3dSNm1odTZ1SUVaZ3EzSW91YzFlbzZFVW5aaHZFM0I0dHE0dUdR?=
 =?utf-8?B?U1FBMDN1L29acE9qSEMvMEhwcDFKZHNPcTRHQm1VaVFENHIvZ3ZCV0M3aU9N?=
 =?utf-8?B?OTF1NFFpaEZLeDF4TDhZL3RveTk1SUhYbnJtODFSMkpoUUpUcjNZZmdZeE1Q?=
 =?utf-8?B?TytmQno0dUpveWhDOHdFZmF6eWQwblVMZytjTXVRcTJPdFJqaUdXWC9LQ1cz?=
 =?utf-8?B?eDNHdkNrazU2cTdWemJjWjUyaDJYOFRYaVRCSVNINkdXdkZrL25EMjcvcHBv?=
 =?utf-8?B?djJpZTloM3JRK2N4M0d4bExyZFdIV3R5Sk1pT3hWbDN6MGtlaXQzaFY5OUZn?=
 =?utf-8?B?YXhTeEplVXNidTJ1V09sdzhQa2F1alBXMHFXZldEWXVvMUJIQmkwa01oVXE5?=
 =?utf-8?B?UTJldlVFV0IySUdNQXg4T0dkQS85aWg1WHJtaUs0WWF5b3JLZ2hQdE5uWGFk?=
 =?utf-8?B?anRZMjhlbUxsMjI0ZkdUL3ZISDNGS2RmUkdXLzZQWlZPdVhZVWNleWlMZU1v?=
 =?utf-8?Q?ZTOaA8E9+Q/cLM8OE1DgjBLl7?=
Content-ID: <CE9358EF5B17A647AE7FC725F707BDEB@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7552d3d3-c5bf-40ee-091c-08da70438bed
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2022 02:47:43.8721
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WGK2TFhTj4wyhgL1JoiW998A2lga8BoGTW8IRppbGog/MIoD6B0oSxVHMqy8jKM/CcRH8jMyS5CSW/rq4E5BfL0Ef069cxa/Tk91D+sbmOk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6429
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_194757_677830_6E086531 
X-CRM114-Status: GOOD (  12.74  )
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

On 7/28/22 05:38, Tudor Ambarus wrote:
> On Wed, 29 Jun 2022 15:30:13 +0200, patrice.chotard@foss.st.com wrote:
>> From: Patrice Chotard <patrice.chotard@foss.st.com>
>>
>> For erase operations, reg_proto must be used as indicated in
>> struct spi_nor description in spi-nor.h.
>>
>> This issue was found when DT property spi-tx-bus-width is set to 4.
>> In this case the spi_mem_op->addr.buswidth is set to 4 for erase command
>> which is not correct.
>>
>> [...]
> 
> Used nor->reg_proto in spi_nor_controller_ops_erase() and applied to
> spi-nor/next, thanks!
> 
> [1/1] mtd: spi-nor: fix spi_nor_spimem_setup_op() call in spi_nor_erase_{sector,chip}()
>       https://git.kernel.org/mtd/c/7f5ee1a113a9
here's the correct link to the patch:
https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/commit/?h=spi-nor/next&id=f8cd9f632f4415b1e8838bdca8ab42cfb37a6584

> 
> Best regards,


-- 
Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
