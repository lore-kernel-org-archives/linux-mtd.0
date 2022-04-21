Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A294C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 11:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J0yossC4ly+j+5FsZB+ERS4UECu6NZA7BmFd+C08fI8=; b=oc2Sr9hGweCb2Y
	HJjS4EV1Nxzk6sGo7xWQf3073wqgzlQfEUNi3za6wSVEt6cgdQMUYnqWdeEqFUQvjfjQMZo2pi4uR
	h8h3a89s2PPOxoiu9eZE3UdfSipA+lECpnL207rPtNTcs7evxtSlKN25NdpflJPrGsa/P4KWWmjcu
	m382XJ9BM8UQMJKhOEVVCd5E7kwHU3K4W1603n7k456Lv/VgaBcsxM0gA9rANPOwbkPExYQKe2zZt
	oEHs2ip3TtlANRD2NWZ+6tQ5zSxnm7YwVmLGaFVc0jUaPjYq8qJ/wMGEKteA+jlDBnydTibewh9GJ
	9EcTjdmqU45zm5AvbWIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhV76-00DDG8-H6; Thu, 21 Apr 2022 11:36:44 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhV73-00DDFU-Aq
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2022 11:36:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650541002; x=1682077002;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=yIesPOAo+SDn76v4rfueSblJiUqkKeL5JOLgsazWueM=;
 b=2gX2FSA5QWTL4mS6hu2Krv4M3yzgFMZVcrDoZu2LIqo8zBMzP9RFCHRK
 y29VXKszg+mVoxIhVWdMoZ1b+OqdT+BlaouLpYd+Qcyelc7dFzXp8g3s7
 oAmYjtj3e0hAmX9lSm7/TtSHojXYmNTg4z9+kYIGJfRjy7PEEGLWTf6jO
 TZ/AodKown+afJ0cuaKv8YxdIONV7JchFsotxGC1+yaEmWt5S6HHVkC27
 gcH13CnNv6O+5oLIUty1BXJ/2shvHUArxxOcuzrG94BNoWsUMqvbrjISM
 GATCSfUFQmyUiGuc28qW79co0t4fpjMOHoI5vOk20jNf1h4bFI8TrMoRx A==;
X-IronPort-AV: E=Sophos;i="5.90,278,1643698800"; d="scan'208";a="160834376"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 21 Apr 2022 04:36:30 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 21 Apr 2022 04:36:29 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Thu, 21 Apr 2022 04:36:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UM0TBX2VDJ1Aw//MATcFHNJRKmXwoglJlJTlJ9ZLExTiFdSEE88HAtwEWeLg/4usLqn7q5c40cvSUr+9dwQjkuEDqb8AZeTXJtSz9TZbXz8KOgSgB0VUb6qNce7lIyWSQpl/9+8XPud637x7EAiWJmP/QNQ4gThF2zdSBehbXKtp509LjQ3OjMryDBxo8o2tMoSTRVvE2fuNEUv66+a68HEMzt0MeA756DBa7eF1MaPBkudXmRwwY2Olkg8lQE+At4FkY4vhmauef3Wdb+LakKPGMC8qqlaKpz2kmmSATbcjAbBIUsh2qLXN1pEov5biBT0UvZOP0VNsf1AbIptXYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yIesPOAo+SDn76v4rfueSblJiUqkKeL5JOLgsazWueM=;
 b=TD1K616K/5Lgplq2J3MZcLPx95IY9TvvJwrRg8iBjDSyGfkl7QQGm4+XitbGMIsNG5g71bYqqgXZumSt8UwRQOlnGvMIB7yumZ/E6vT8zU+ptg/M9EmRFdULTXrl7MD/Uy6/4Mq7Fk+f8Czm0W9ahqt0NI402KwyXK8a63LMWdNSs2DRWEQNkld5TU+ml+rMLOZDjV0agUubivVxIqODO2xc+6/k5Mn9kBvC0qXTyWhJyM9UNu64mEMSQm0lgrIHGPYik8dLhjwzW16LMIfu9r2fp5ZZZyaJzkwxdX4AmIo4j7bZZSK8/x29RDXXZlUhM0vEu6ib8ua00t559npcAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yIesPOAo+SDn76v4rfueSblJiUqkKeL5JOLgsazWueM=;
 b=hQeHxzvx6C0wPKdZ9x2EkVcqNOJR/uc0DzYgYYKqceyJsto4QTq+aQwla9aoV1sjB9X3EgHrQFmwSCCrxiwBrbnRPyJqYNG63ZDJ/hTnV//RmTxRy6KcKqk4spo/btF43TeFvHNOybD+jUqkLinRJIUz4IfJ00Pusybe2BIcHOc=
Received: from CO1PR11MB4865.namprd11.prod.outlook.com (2603:10b6:303:9c::9)
 by MWHPR11MB1614.namprd11.prod.outlook.com (2603:10b6:301:11::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.25; Thu, 21 Apr
 2022 11:36:16 +0000
Received: from CO1PR11MB4865.namprd11.prod.outlook.com
 ([fe80::3d19:dba6:1424:44da]) by CO1PR11MB4865.namprd11.prod.outlook.com
 ([fe80::3d19:dba6:1424:44da%4]) with mapi id 15.20.5186.015; Thu, 21 Apr 2022
 11:36:16 +0000
From: <Tudor.Ambarus@microchip.com>
To: <tkuw584924@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <p.yadav@ti.com>, <Bacem.Daassi@infineon.com>, <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v13 2/4] mtd: spi-nor: spansion: Add support for volatile
 QE bit
Thread-Topic: [PATCH v13 2/4] mtd: spi-nor: spansion: Add support for volatile
 QE bit
Thread-Index: AQHYVWxPC1dIdG4rOEeRpjF1YXhMN6z6PSuA
Date: Thu, 21 Apr 2022 11:36:15 +0000
Message-ID: <381db18c-5e6f-9f39-ae92-7fdc21cc4844@microchip.com>
References: <cover.1650532121.git.Takahiro.Kuwano@infineon.com>
 <2c04068f34e4dbd25da541062f5309b1d9878c22.1650532121.git.Takahiro.Kuwano@infineon.com>
 <fff074e7-07ca-0334-a6f4-f4c0d57577d8@microchip.com>
 <f96c55f6-8d27-57f2-892d-d4fd922bd2e4@gmail.com>
 <cd0599c2-6099-def1-3cfd-f70ae1545565@microchip.com>
In-Reply-To: <cd0599c2-6099-def1-3cfd-f70ae1545565@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 73b86302-e0b4-4654-8f0d-08da238b255b
x-ms-traffictypediagnostic: MWHPR11MB1614:EE_
x-microsoft-antispam-prvs: <MWHPR11MB16145CF971450102BB9B9DBFF0F49@MWHPR11MB1614.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vUFSZuD8oKZtUux2JSLqeqf68QJbqNTFEjom9dXRJusrASJvoVPVpi+Ev5s+ZjnsEKxTcF/kIpgmM2Yf8A1yZ+kcAKkBL99M41Yd53w+obCIttdFcEkeaxjXuPQ97fXBNWt+0XGfokhbF3nRQsTDtb6YQUtCfu9mX72gh+eEVZsC62jjOJHzxWa9rV3KFV/Eq+yZvMX3XW+yv0keo2/LrLQRsh+Xh9SP8fEsHrML2KT3CRaixkWlXr17A/IAX81upZ0NJVPtJEfPLeoHydhT9BDq3GOIZG0HDwKLyI74bdR4J6NEzOesvrif9z0OXhjXR/aMddMMTEwB1IfPMwFgy87cTq4DNOeLyvYrgrVb9B3Hzwrj2HfkJLIcXcAGNotVPh8B8Qoa7Q0UHTUGkCQFLVxz0azUw07+Jx43UUaweB7FOMrkC8APviaGHQ0a2JczXWUa10pJeAWKt0n6l4z33GTRnsjm//ZgjUV5xIHwbXLOMotanut8ARrubfHv3pcCqN3nx4pAjr5idlp1ZBQa/31uIg/ZobVRK/qPvWMGULmrD6VznqKItoRNwPaHMkauTGS3IA7sa8pZkedZ+HyVrI2j0VOv34mtEdugZgsvoaS1siUxu/7AjfEk0mDrTEdLT5E4wkwRX8vSjU1hMS9ANgd5xWmQr6smrrr8abXFTfizrR5E5fF55dUguUcG+M1sw1fa6X+qXiA7IYtV2z6R8XixHT9fKbeNo5KddtY3bouTklBPPlQY44TMcSMKG57jsrMZEd9VpHyD5zmluOmWXTUZGxi/O+FPF7wf9oQIhVZi9pwqdA4D3rI72KTakgJxYgqDVNCJoh8l2Yp2h/EVt/j2CoDT9uut6LBgtzwt0OC9TusiaQvr64fzkKmIsHHwcaheyhEbc/zezBDECP++Bw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4865.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(31696002)(71200400001)(508600001)(53546011)(66946007)(91956017)(76116006)(8676002)(66476007)(66556008)(64756008)(4326008)(66446008)(6486002)(86362001)(966005)(54906003)(2616005)(31686004)(38070700005)(26005)(6512007)(38100700002)(316002)(2906002)(186003)(8936002)(83380400001)(36756003)(122000001)(5660300002)(6506007)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eldXa1ByRGkvZ3lWS3RWenovVndXcTZVc1NEK0JGeGJQU2JINmR4M2FtZzE1?=
 =?utf-8?B?ZTZCM3JvK1hqU3cwOHRRZFErM01nMlBOcGdpMGNpVnhuOEs1R2hVeGhyUmU2?=
 =?utf-8?B?NTNWSGRsekhGbU1selNncWRjcWxGUHdubWR1TWsxaHg4UExYV1JoWUdweVl3?=
 =?utf-8?B?Ny9FR1hUNWdkNWlqVVU5QjNqei83UTNXSTNTYmxuSDhaZEs2bmNMOXJ4V3Bn?=
 =?utf-8?B?YldNVXBVbllyWDBqSTN6WmZFYXZIc3c5NVRyQkE5V1JhT29BS2VYcE04ZTUv?=
 =?utf-8?B?ZnRBQ0VJYXRFNng2OHZaOHpWM09ING5RemYrK1VjV1BYOFZJL1hUelpEb1NE?=
 =?utf-8?B?c3AxaTdkejNuOEZqSHdoVllxZnA5SlpOTkR1dTIyNWNQMHhBOVg0V1JuWSt2?=
 =?utf-8?B?c1hwdTdMcjg5SjUrK3doUjduZ3VnaUlqTlZPaVFySDAyWUdwaHQxdmlLK2M2?=
 =?utf-8?B?bHVOTkN1STZLRjRTY2FsUHdoVzhlRWRyWHNraHFLbVM5RDUxeEREWU01RlBa?=
 =?utf-8?B?REg0NVRIeEJhK0lSZG5WUWk5TjdiR1JLRngxOEUzVWo3SVFPanZUa0xHdmUv?=
 =?utf-8?B?R1pyNTZjUDhIazN1enFTZ1paRXpEZDZtQjZISytrM1dBU08rbC9jZTdBNWZj?=
 =?utf-8?B?blZaVnA3cGFHM1h0RG1wY1JZak5oYjZFVWdQTG82MGZrQXdNQTVjS0lhSkNp?=
 =?utf-8?B?MnJBU3NIWlczYndYSGR1VjBaTThXN0I3Y1JIK3dRZ1lzTVk3WWxPZ3Job3BC?=
 =?utf-8?B?LzAzSVZpNDJXRGN0YnFlZGIyTktrbWtZck5nYjZldXpIQk9ieXE0UUFpQTk0?=
 =?utf-8?B?SU1ndUpZRHpTeWJtN256VU5TWElaNzdyYTNwaGJTUTA1dEwyU0NGVUZXcHJT?=
 =?utf-8?B?eXRnaUg5alZINkxucHk4bVNMNldYRmZPQ2FOTklKME9FeCtVdW5YSVBjVTZ5?=
 =?utf-8?B?Q1ZWN09OalJxNURWcDFOa002cFpVQkNoaFFibHhwT25JbTRYclN4Q1RkV3ZZ?=
 =?utf-8?B?TGpkNlRad0xVdWxzS2lwSnI2SkNSOUhpV09RMytrcEZxbWlVSjVURHZ3SHZa?=
 =?utf-8?B?OWx3R09IWVpGZHdud0NNTE43RW1VaFl1VVRqeUZVanloay9xaXI4SE5BQVB0?=
 =?utf-8?B?UU0yd3I3MUk2MlFTdE41MUl1Um1iOWlycGgzU251TDJwSmR0SU9SVkYzWVFS?=
 =?utf-8?B?MFVoVWpaTUJPSmtrbnNLalV0ZmFMT1QydmtaTCtOSEdOUXJJLzhFWlozSmVt?=
 =?utf-8?B?Zit5NDljUGVUaGUyc1hvVFUwOHJGdDAxU1hMSitQUGhiVFhoYmdQaTV2Smtr?=
 =?utf-8?B?SlMxeHVnWWltdkdLTi9BeHFzMXZlbzBkdHN1Tk5uMlhVNFVXcEYxZE01eGhQ?=
 =?utf-8?B?NkUzM0pObXFXa2dHTUluK0F0d0cvUVhMeXUyem5Db2JkZFdBUm95VGJIbGRH?=
 =?utf-8?B?cThSOURaODdrQjVZOWdINGtqSHBSenIrcHZwRTVXMVIwNXMwMllFRkpRbGpl?=
 =?utf-8?B?QUxBa0piN1I3cElZMW5HOVNPeDEwOWE5S2xZM1JraTMrMVd1OUVjSkE5OWhh?=
 =?utf-8?B?RmZnOUtYN1dGMDNUcTBBREN4alRvbUFNS1lPREkxZUx3UCtoNkpqY2dVTDRN?=
 =?utf-8?B?Umg3Wmo3cE9nLzBTWk1pWU5VY042eXdWRWRZWUUrVkwxa3Y0VVpJNGw5U3Nv?=
 =?utf-8?B?Y3dVeEYrQVZmTVBjRDQ3SmRsR21vWE82aFZGQU9PbXBibTZBSjVGRS9vQThU?=
 =?utf-8?B?WE5rWlFXU0ExQlJ4VCthMFFTTHpUSndUT1FQZ3pIeWpNR0RaQUJveDZndE5o?=
 =?utf-8?B?aWhCYitCYkdPbXVhQ25HSDl6bHk4RWJXNDl1M041b0x4UlluQXdEeTZnMW55?=
 =?utf-8?B?NFBCcENHV2ZPK0RzY01LMkhHL3hvZ3d1ZEpHeEV2TThqMGZuaFhUK0h4aWty?=
 =?utf-8?B?QkVWUEZ5TUwrQXVkMEhrNnFpZjVyMG5yQndWTmlTT0xySVZacmFOQzNZT3pj?=
 =?utf-8?B?V2x0bWYybUxjOU5zL1VxZXRTVUFtdVErTnNLclZHUXd4QUhkN2V2WEY1QVJR?=
 =?utf-8?B?RGZmOWFUc2RKS0RUL3BhamlVOGNkN2w1ZzllaUN5TEhsblhlUlFxNTBKUTVk?=
 =?utf-8?B?NTljbXdtNytKUDBuaUpDUW1NWGhHeG50UW9pbDBwOEw3ekpHTndvbkpjT2hE?=
 =?utf-8?B?eThQbkhsT242cUFOa2lJM3BEWmF6N1FzV3U0SjYxNTQxOFpQMklpbEc2Sm1j?=
 =?utf-8?B?UXVOdHlNbEU4WlBVcXB2WFgrNGxqUjV0NG5FSXdGczRUQk42K29UWlE1dlRY?=
 =?utf-8?B?bm4yZldnNHZGRElKSDBmUHdHb1hGMkpyQjJKTDJRYk1pUlkxV3diVzkwak52?=
 =?utf-8?Q?6ULbslcjIR8Bpn+w=3D?=
Content-ID: <09878CC83418164CB4C6AD6F70786D9C@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4865.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73b86302-e0b4-4654-8f0d-08da238b255b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2022 11:36:16.0217 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QkKdNG3PpT+vayqzwoEkDlemRBxCMhqyPKf5zubEjkOV7CEHGuCo6GT3UdzpnNNAXC1wbCxjX/rE9Be01aresHnXKQDfHI9KxGZ+OxsWrKA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1614
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_043641_422691_6F29E0CB 
X-CRM114-Status: GOOD (  15.04  )
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

On 4/21/22 13:56, Tudor.Ambarus@microchip.com wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 4/21/22 13:47, Takahiro Kuwano wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 4/21/2022 7:41 PM, Tudor.Ambarus@microchip.com wrote:
>>> On 4/21/22 12:40, tkuw584924@gmail.com wrote:
>> [...]
>>>> +/**
>>>> + * cypress_nor_quad_enable_volatile() - enable Quad I/O mode in volatile
>>>> + *                                      register.
>>>> + * @nor:       pointer to a 'struct spi_nor'
>>>> + *
>>>> + * It is recommended to update volatile registers in the field application due
>>>> + * to a risk of the non-volatile registers corruption by power interrupt. This
>>>> + * function sets Quad Enable bit in CFR1 volatile. If users set the Quad Enable
>>>> + * bit in the CFR1 non-volatile in advance (typically by a Flash programmer
>>>> + * before mounting Flash on PCB), the Quad Enable bit in the CFR1 volatile is
>>>> + * also set during Flash power-up.
>>>> + *
>>>> + * Return: 0 on success, -errno otherwise.
>>>> + */
>>>> +static int cypress_nor_quad_enable_volatile(struct spi_nor *nor)
>>>> +{
>>>> +       struct spi_mem_op op;
>>>> +       u8 cfr1v_written;
>>>> +       int ret;
>>>> +
>>>> +       op = (struct spi_mem_op)
>>>> +               CYPRESS_NOR_RD_ANY_REG_OP(3, SPINOR_REG_CYPRESS_CFR1V,
>>> nor->addr_width is 3, isn't it? can we use nor->addr_width instead of 3, please?
>>>
>> No, at the time this method is called, nor->addr_width is set to 4 by
>> spi_nor_set_addr_width().
> 
> I see. Allow me some time to re-read this.

Does this help you?
https://github.com/ambarus/linux-0day/commit/05f20ab7ee349628f0e2d22a4d3852038a6c8c70

Find the entire branch at:
https://github.com/ambarus/linux-0day/commits/spi-nor/next

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
