Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2CFAC433FE
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Dec 2021 12:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PLcBDz9iTYblWLmDKFqqe/sFKLcqPZ8p7btAPyO8qoY=; b=UDVCCkoKht/paa
	xFYo9Hi8RWIedbjEZO+2400uD5/av0YFcpiApQs1fa0weWP8iezxdokELsHypRBgVjmT9KUHOz5fO
	S6LAGMRpGtCf+kBrZgidxYePSRz950jShHoJgDW0SJ2tmKCYfu9J9Js7W5KZE/fpMBSVHCQCZhxCf
	SgnlF17GnT2J2wunN00Y9iu9qxGAhNyBPy+WzxwJ9zGJI3odziJzJlaUYzkQ2lT1WuILStJncjgy3
	c4nTEnFtVVLs6uJz2dEcWTKOuzoRI3Atom9WEzsOW3uFK2/yYQAUrKoFm/YEgh+r27hcUbOe5AjyZ
	7KGqx1CIpJs13k5nJz0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myCVv-00ABfO-BR; Fri, 17 Dec 2021 12:39:07 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myCVp-00ABaI-Ml
 for linux-mtd@lists.infradead.org; Fri, 17 Dec 2021 12:39:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1639744741; x=1671280741;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=T7RmckshB059a2g4k2kQ9q9knzjMl2o0sY0Yxvpn/Sc=;
 b=k1TkCsZGzysuCfgSw9TubnQdClbGxuo3c4gOnRoJr0fT6+mDI+AdLVac
 EvLxdEfxORhXCqsvd95nd79a40Iv/evieT3Nlcs9HmaWJEDlc5r2MMMfp
 MacV7O9W+dt7fOW5JuVB5Nn1wDPtxGNQbgJ7OQ7O7C+HDXLwuPqkdqO6X
 xhwFh4R30T5yrC6bgICaoPP2fKAEATZOnij1PTpmxX5aoelWWU9S5MOpx
 qM7laeTy00s11I7zO4HktclEzR005TtTW1KeYJnybzVqaXtYQoPv+oKud
 4omP6vBWY9dpLvLybg5WVj8wPB20TkiyB6nkTjEa98pzsEglRcA1FxYnQ w==;
IronPort-SDR: GWOtd0AXRVhNBgj/UcfcFkSchGvaOIrxd1VyNzKpQ+Kxbe9rxZnQVqKxK2p76dyjb3wzOs9p0s
 9yt6smwj0/EToyxbs0sxT6TmN+UdTZtovigMv8ewzSXqGQLY2kSXcZOjo/axjoQUpd4W42IJEt
 WPNCNjbWZq63J3YQq0tkt6Wbaf/pG6ve4CInqmthO82npjiq5yDCWQaqDNYGcUg2yQLEamENGc
 AnmNv6LFvhoFMvGEBaI19M4oVnZGFBiorQ3Ap6THlfysjYIB8CDGPO4idHS/lfKvj5cfZ+KD0J
 w7GlTkbUIimHtG0AEr/sTuu/
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="147584686"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Dec 2021 05:38:58 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 17 Dec 2021 05:38:57 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Fri, 17 Dec 2021 05:38:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cWyybUfJE6MWTXISDNTXGrfwrSw6elH3tjaOq3OC4s0DMHVBn7BxE7qGIBVoq5fvfgItl0WWPOXwoUWDOWMCOuvXECgrXTMA5sGNbIgqyZFdCD2EM2rOhOslDW0bEiQbKEAemt/NRzchLuge8/59s6NkaH65BHQSu3fPYCEth8euD6V7MtHH/L8Z5+Y1+3L5PznBiTw9XoGe9m02hh7bQqRoK/OWXpjSIhGIRuUinzKsQZxdg9x7xjTiVPhOg0SZhr9GrCWSCm/gp5NSIpMyc0oqjAvyk6pRZdtvqP1n4MN/cBQ3pP+eH7OrHHPfgrCRmC+W15v4v8u7MfScr69MRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T7RmckshB059a2g4k2kQ9q9knzjMl2o0sY0Yxvpn/Sc=;
 b=OyN10l1obEJ2bhOVuaz7vWaolvrt3gEZFRIjf03ZYHyI8nloe+RrWm4ZD2fZDamytI+AWYht1hiakDfIMxerNhzFBuJy0Bx3syrZYuxqtVPlQUK+AiD77XHa/YRKOa8UxfEtc4E2UDrxI5ZhZTBnFgGvpbwcuHkeIc99wv/Dfo2vXRrajsbIWgEL0hguXWaRgxtlbZKEO4Wpe4+7lwFk/xTv7633SFroIEJYavuXEyuB2oaMSN8CKkSdS9lIWfPmYQwsvQ7u/iENhN8CAmko48xJ4iZCm1l2iq/6wpwegYuyMY8Zr7ynA0WfVZszqSz/QV7uPdYlbS9MjlO8SYdUfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T7RmckshB059a2g4k2kQ9q9knzjMl2o0sY0Yxvpn/Sc=;
 b=vWrliljXqhTa6EnPGn9PT6MfRFrVXDRAhzWfwh4iJn+HnkJVGSEl3JVqXHxqsaG8efzOszITwU6036Ai5c86Bwrxi0cT5jCZ8xzhb6PbNch+zjIuIO+9y27ktAbTKn6cpQSAc24iqojoMtvx8QgZ/CbnNI46ft1BCABgRuCtz60=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB3391.namprd11.prod.outlook.com (2603:10b6:805:bc::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Fri, 17 Dec
 2021 12:38:52 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::5c96:23c3:4407:d3b1]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::5c96:23c3:4407:d3b1%9]) with mapi id 15.20.4778.018; Fri, 17 Dec 2021
 12:38:52 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>
CC: <michael@walle.cc>, <vigneshr@ti.com>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <Nicolas.Ferre@microchip.com>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>
Subject: Re: [PATCH v2 2/2] mtd: spi-nor: macronix: Add support for mx66lm1g45g
Thread-Topic: [PATCH v2 2/2] mtd: spi-nor: macronix: Add support for
 mx66lm1g45g
Thread-Index: AQHX80ML08Rm+S6s0UW0k/rjmom+8Q==
Date: Fri, 17 Dec 2021 12:38:52 +0000
Message-ID: <c94a306d-a71f-6465-bb3d-d9e6ae55148b@microchip.com>
References: <20211209190436.401946-1-tudor.ambarus@microchip.com>
 <20211209190436.401946-2-tudor.ambarus@microchip.com>
 <20211217113810.mzqrwf6vxfniggn3@ti.com>
In-Reply-To: <20211217113810.mzqrwf6vxfniggn3@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8d226b1d-0b5b-4d2a-d9f4-08d9c15a2efe
x-ms-traffictypediagnostic: SN6PR11MB3391:EE_
x-microsoft-antispam-prvs: <SN6PR11MB339196EF64EAA36F76421AD8F0789@SN6PR11MB3391.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /qTAjEj7lMAqvdkWDuClvmVG3NDK6shcGN+s4e+4vSUIK+VWthgLVeBu4d2wESRn9l+aXiTaXmLZ19I2yuFvEt2PRbCjl5cH4lXh4Y1VJcRpIz5XyeINqgjpzk3PqRUvAo/NiYnKsxrX3lUCSjxbvet4Uw34sKuPakP304fbv1gyFmBSdrhA49Wqorv75yT85+AaDRp/zACU2dqgd4r3ds/ptVT8L6r5AdD9KMiq0CQ7+iKD2nM4npYcKY/EFol5ApUmi6KuGxC/ilhVtZG5EnqEjEo+nFzd/brWUElgvYys1+BkHXmhhSxcts7zN1zJ6RU8R3EJnoomnSR9ChDOnpokmKvV4OM6I3wdnukXD84tnnwhgwhTBNpJe6YZ0EDfE4/Q/YujdSni0osmfGqpOq1pVeUXMbKOtrV3W5yznFfjaTIpsF91vgRvs4LwSjWZIrg9T6b8acPSf8DN43WeC7UM7lvm95AYgCePrMmpmACoa3Ho8a9Hj1xWoPlro6c5mYHDGQCUaB3Dh+4Sq+IcC5Ec9EhRTrdMCESmI7CloOQ3MKMadzktTz8v5RIBrSpOOljAdTztIfrhBsB+IfDbj2fM+Fd6yN+fbxmbd/HpBjoVn0znaQMwn13peWY2pMCGPIXNHMx7F4tH3Sd+7RtdMdBnCFjPWC/BSXfkQR06TNLfUXWnaBj0kGZPr6Ws6ta+rtNJbIKG5C7u3GI6CYzRTYdBzeh6jt+NwmDN43SzVEJ65L4A2bJ2iJwQ5zpDE/ssqkGf7nFECmGO0dDvzWcY7hzAJllglf4/tHpT6elNqUDuzse0X9iojoPpkux+E0tgE04f3YmTBtCpS5S+iwjVVmC/z+0ypD3GIXROGwpX4It8r2m5uEX/gD6dvBD3jvO4if4a4/Gx7MbgC6f5MgYzKF8SNgokAWHRtFkXI9CN+qA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(26005)(2906002)(31696002)(86362001)(6512007)(5660300002)(6486002)(31686004)(83380400001)(54906003)(8676002)(186003)(316002)(4326008)(64756008)(66446008)(66556008)(8936002)(66476007)(6506007)(38070700005)(53546011)(966005)(66946007)(2616005)(76116006)(6916009)(36756003)(122000001)(38100700002)(508600001)(71200400001)(91956017)(138113003)(98903001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VFpwazFaU3BNTkJzS3Y3bko4OEsyNU5GVEtCNEZ1eWtvR0NaVEgraUZEREly?=
 =?utf-8?B?S3M1cjVYQno1Mk1ES2RFSzh0UWwzcGU2RWFsd0lhUjdid1oyV2gvdm9Jd3RT?=
 =?utf-8?B?bWFkellyNllUQzRVSS9WRzFZdGxaaDVlY0VoQXI3YjBXbjlKNUZwblM5RlhG?=
 =?utf-8?B?Um9ORDROVTNKSThlV2FPVFM5bjJsU2s4NXA1Rm1ub2RCeTBsZ0h2Q05nOURj?=
 =?utf-8?B?aW54TnVTTjdHa3g4M0tWYTU0bjhOOG84K0dWWC8vQ3p1S2VlcUNSSzNvUjhN?=
 =?utf-8?B?cDNrVlNwZ0lDaTlOWWNiZ203eFpPaXBRRnZreTBzZ0FwczNZUmhLb2NmKzFi?=
 =?utf-8?B?MU5XZ0JxdjgrYnBlVzh2ZVVWcmp4UjVDQ0NOVytqRFBHTkNmcW5sZ2IyeTY1?=
 =?utf-8?B?d29XOHFuelB5bXZzWUZWcmljVWMra3dVcFR6c3JIS2FNVFBhR3BrQ1hpR2Ra?=
 =?utf-8?B?c1F6WUZXbU84V3VKa3NzSHF5ckVncUd5azZPellVYmRjZ1lRbzF1cEM5aWpG?=
 =?utf-8?B?RitUTndLaFRMTk5ZWEV4RzFUaVdwVnErbWV1SDREVXk2WllnOVJoL0kybXBj?=
 =?utf-8?B?ZjJEaS92d2ZiaFgvWFZpQ1RjdGpCZTVGSFNzdzBNY21nUmplVHljT2RMOWZw?=
 =?utf-8?B?MjVPMlRMQmgzY2U0cG5aWkhFUmIwRUVrYTZucU1aMVMyRDJmVmJLZmpmeHUz?=
 =?utf-8?B?RUVPbXllak56aUtXR2V2SE8yRDdINFA5Wm5nSCtTU0VjdjBYeVNjZFVxUnhr?=
 =?utf-8?B?TWxMVFRzU0MrMkdLZmExSGdIUVZpUXJkQ3F4akVRUW45U2NjY0JMamxmbSs4?=
 =?utf-8?B?cGd5eU1HMlRVMmJ4dm50K1pjV3VVTTQ0UncwK2hRamg2c0FqVmNsbG55M043?=
 =?utf-8?B?bG9Vak0yblE2ZytPaGhrVGNEQzRxOWpHc1gya3BsbXhmeVcrU29nMEtpQ1FC?=
 =?utf-8?B?N0JYYVFSRG9CbDdRczFnQkp5TnpZR0NUQUcxRklYMWJoNHQxS0V3QjczNGhL?=
 =?utf-8?B?cFJyM0EwQUZwRk5ndTMvN28rTFZtbUZ6ZDJ0VU4xODgzVXJUdmhnZWNtekdt?=
 =?utf-8?B?V05LOHRvd2pjcXFaUFlEKzJGbmxoV1MxNWYyVWo3NC9XdFN5dncwVzVZcXVs?=
 =?utf-8?B?WTh2ckRjWG9ZL0NTemRIMU92VlRLbnd6d0VueEQ3emlsaks4c05WdXJQVFk4?=
 =?utf-8?B?VFROUHN6MUM1SjcxWUJJUlZwcDVqV3VmZGt5SklIVlJsb0RlYnJTQmVzU1hx?=
 =?utf-8?B?cVIxYmQwb1RLLzZpOFRxcmpzOUg4bTZTeGs4cnZQWGdWQWZQdm1WSzVIY2FE?=
 =?utf-8?B?cXFBdVRVSlFoeGZ0NHoxQVBoN0hvdGVrMVdIS1ZIMi9jdCtVUFp6VHFHYTJz?=
 =?utf-8?B?OUthWXhPaDNMMkp1ZUVIRkIwNXpsSWFJMHNTSmNlclBoWEp4WkwvSk9KS3Jt?=
 =?utf-8?B?cEl5VEtkWitRa2VrRHVGTWVlNmd0bHVVaEJnek5STWRBOFpFWXJhaGRnK0ZF?=
 =?utf-8?B?V05HWUlYY1lZN2puZmlpTlNRVnlpd2hDcVdvYTRYNklSTmFFcFAzTnl2SjNM?=
 =?utf-8?B?VGhwQ3Y3cDdoQXc5OHQzc3dKQnNZVGJGd2R3bE5rTmhBWHFodmpEb0JGSmJB?=
 =?utf-8?B?OGxQVjJlcXFudjRVNzRrSFhPd0FENzh3VWY3MWhlMTVxTmdXajVIZEhVWS9X?=
 =?utf-8?B?UUdqRFlaUGpIUC9ZNTcrcU5ZRTh4NFA2TDk1cXF0bGw0d1J4TUpnM2N5NGJ5?=
 =?utf-8?B?Zm1rUE5Td3pFTUlmazljalIxV011Q3NoeThPYnlLNU91bGJsUUo1RmZXNHZi?=
 =?utf-8?B?VjhNWFV0WWxnbDZna0JubUQzQ01zYTVvS1FxVGZNWGd4TWkxVDF6VmxSREt6?=
 =?utf-8?B?ckNkMGZ3VlVHV3lJTSt6V0lwbURFRXgyZlh3R1p2ZndiT1hoeWZpaHN4MHlT?=
 =?utf-8?B?TDMzQ3NBMThxYVZhN1pxaEgwR2xCZHp3eW1YVWlpbi9yYzdJOWR2aHNQcUNi?=
 =?utf-8?B?aC9id2pLcVBOdGd5Mm4vUXZ5d1k3V1BvMjdPUE94YnhjRHZ1dkZTWGVlQTFG?=
 =?utf-8?B?cHhUSk82QmVmaVB5dWtZMTVZc2VUMXFadmFrZ1FFbHE0MkJRbXpPQ2JKdUlx?=
 =?utf-8?B?cnFNL29VQXJHZE5aL2h1a0VtRW4ydjA0NkIvSzBLNkViTG4rQ09OMFJoMG9Z?=
 =?utf-8?B?SnBybm5GbUtzaHdpS3pVbXRZUU5ESFFkb2kyRWRTYXRmTWxudW85czJMaW5N?=
 =?utf-8?B?ZHc1TW16ckhuS3dUOG5vWjhaUWl3PT0=?=
Content-ID: <2754CEF33E724742889450FC0B293F8E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d226b1d-0b5b-4d2a-d9f4-08d9c15a2efe
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2021 12:38:52.8172 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oDZGG4DXUnwjZlJh20fCzhz2IifJxpLG+juzQII5Wggb9dCBUANUYoCKbqoiD4yQGnJ9b0DQmC4GoDxhkYizW3hz41t0RimBfBlb8Jn5W8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3391
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_043901_837349_B3A60333 
X-CRM114-Status: GOOD (  27.02  )
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

On 12/17/21 1:38 PM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 09/12/21 09:04PM, Tudor Ambarus wrote:
>> mx66lm1g45g supports just 1-1-1, 8-8-8 and 8d-8d-8d modes. There are
>> versions of mx66lm1g45g which do not support SFDP, thus use
>> SPI_NOR_SKIP_SFDP. The RDID command issued through the octal peripheral
>> interface outputs data always in STR mode for whatever reason. Since
> 
> Huh! I hope this is a mistake from the chip designers, because if it
> isn't they need a stern talking-to ;-)
> 
>> 8d-8d-8s is not common, avoid reading the ID when enabling the octal dtr
>> mode. Instead, read back the CR2 to check if the switch was successful.
>> Tested in 1-1-1 and 8d-8d-8d modes using sama7g5 QSPI IP.
> 
> Datasheet?

MX66LM1G45G datasheet:
https://www.macronix.com/Lists/Datasheet/Attachments/7929/MX66LM1G45G,%203V,%201Gb,%20v1.1.pdf

If you meant the controller's datasheet, it's not publicly available yet.
> 
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>> ---
>> v2: SPI_NOR_SOFT_RESET as a FIXUP_FLAG
>>
>> # cat /sys/devices/platform/soc/e080c000.spi/spi_master/spi1/spi1.0/spi-nor/jedec_id
>> c2853b
>> # cat /sys/devices/platform/soc/e080c000.spi/spi_master/spi1/spi1.0/spi-nor/manufacturer
>> macronix
>> # cat /sys/devices/platform/soc/e080c000.spi/spi_master/spi1/spi1.0/spi-nor/partname
>> mx66lm1g45g
>> # cat /sys/devices/platform/soc/e080c000.spi/spi_master/spi1/spi1.0/spi-nor/sfdp
>> cat: can't open '/sys/devices/platform/soc/e080c000.spi/spi_master/spi1/spi1.0/spi-nor/sfdp': No such file or directory
>>
>>  drivers/mtd/spi-nor/macronix.c | 113 +++++++++++++++++++++++++++++++++
>>  1 file changed, 113 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
>> index 67aaa83038b6..9d71149233e3 100644
>> --- a/drivers/mtd/spi-nor/macronix.c
>> +++ b/drivers/mtd/spi-nor/macronix.c
>> @@ -32,6 +32,112 @@ static struct spi_nor_fixups mx25l25635_fixups = {
>>       .post_bfpt = mx25l25635_post_bfpt_fixups,
>>  };
>>
>> +#define SPINOR_OP_READ_CR2           0x71
>> +#define SPINOR_OP_WRITE_CR2          0x72
>> +#define SPINOR_OP_MX_DTR_RD          0xee
>> +
>> +#define SPINOR_REG_CR2_MODE_ADDR     0
>> +#define SPINOR_REG_CR2_DTR_OPI_ENABLE        BIT(1)
>> +#define SPINOR_REG_CR2_SPI           0
>> +
>> +#define SPINOR_REG_CR2_DUMMY_ADDR    0x300
>> +#define SPINOR_REG_CR2_DUMMY_20              0
>> +
>> +static int spi_nor_macronix_octal_dtr_enable(struct spi_nor *nor, bool enable)
>> +{
>> +     struct spi_mem_op op;
>> +     int ret;
>> +
>> +     /* Use 20 dummy cycles for memory array reads. */
> 
> I just want to point out that if the default dummy cycle value can work
> at the maximum frequency the flash supports, you don't need to do this.
> I did it for S28 and MT35 because this wasn't the case but I remember
> some flashes having sane defaults and not needing this.

This is a volatile bit field with the default value of 20 dummy cycles
indeed, so it should be fine if the bootloaders do not touch it. Anyway,
it's probably a good idea to reset the flash at kernel level before
starting configuring it, so we can consider the default values as sane.
I'll drop this config, sure.

> 
>> +     if (enable) {
>> +             nor->bouncebuf[0] = SPINOR_REG_CR2_DUMMY_20;
>> +             op = (struct spi_mem_op)
>> +                     SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WRITE_CR2, 1),
>> +                                SPI_MEM_OP_ADDR(4, SPINOR_REG_CR2_DUMMY_ADDR,
>> +                                                1),
>> +                                SPI_MEM_OP_NO_DUMMY,
>> +                                SPI_MEM_OP_DATA_OUT(1, nor->bouncebuf, 1));
>> +
>> +             ret = spi_nor_write_enable(nor);
>> +             if (ret)
>> +                     return ret;
>> +
>> +             ret = spi_mem_exec_op(nor->spimem, &op);
>> +             if (ret)
>> +                     return ret;
>> +
>> +             ret = spi_nor_wait_till_ready(nor);
>> +             if (ret)
>> +                     return ret;
>> +     }
>> +
>> +     /* Set/unset the octal and DTR enable bits. */
>> +     if (enable)
>> +             nor->bouncebuf[0] = SPINOR_REG_CR2_DTR_OPI_ENABLE;
>> +     else
>> +             nor->bouncebuf[0] = SPINOR_REG_CR2_SPI;
>> +
>> +     op = (struct spi_mem_op)
>> +             SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WRITE_CR2, 1),
>> +                        SPI_MEM_OP_ADDR(4, SPINOR_REG_CR2_MODE_ADDR, 1),
>> +                        SPI_MEM_OP_NO_DUMMY,
>> +                        SPI_MEM_OP_DATA_OUT(1, nor->bouncebuf, 1));
> 
> This is not quite right. You can't have a 1-byte data phase in 8D mode
> since then your data phase is only half a cycle. What happens to the
> other half cycle would be undefined behavior for most controllers. I
> sent some patches addressing this some time back [0]. Unfortunately they
> fell off my radar.

right, will update. Please resend the series when you find time.

> 
>> +     if (!enable)
>> +             spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
>> +
>> +     ret = spi_nor_write_enable(nor);
>> +     if (ret)
>> +             return ret;
>> +
>> +     ret = spi_mem_exec_op(nor->spimem, &op);
>> +     if (ret)
>> +             return ret;
>> +
>> +     /* Read back CR2 to make sure the switch was successful. */
>> +     op = (struct spi_mem_op)
>> +             SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_READ_CR2, 1),
>> +                        SPI_MEM_OP_ADDR(4, SPINOR_REG_CR2_MODE_ADDR, 1),
>> +                        SPI_MEM_OP_DUMMY(enable ? 4 : 0, 1),
>> +                        SPI_MEM_OP_DATA_IN(1, nor->bouncebuf, 1));
> 
> Same as above.

ok

> 
>> +     if (enable)
>> +             spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
>> +
>> +     ret = spi_mem_exec_op(nor->spimem, &op);
>> +     if (ret)
>> +             return ret;
>> +
>> +     if (enable) {
>> +             if (nor->bouncebuf[0] != SPINOR_REG_CR2_DTR_OPI_ENABLE) {
>> +                     dev_dbg(nor->dev, "Failed to enable 8d-8d-8d mode.\n");
> 
> Nitpick: s/8d-8d-8d/8D-8D-8D/

sure

> 
>> +                     return -EINVAL;
>> +             }
>> +     } else if (nor->bouncebuf[0] != SPINOR_REG_CR2_SPI) {
>> +             dev_dbg(nor->dev, "Failed to disable 8d-8d-8d mode.\n");
> 
> Nitpick: s/8d-8d-8d/8D-8D-8D/

ok. Thanks!
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
