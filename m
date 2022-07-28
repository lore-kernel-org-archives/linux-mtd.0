Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 197F5C04A68
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Jul 2022 13:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PQ510IoQ1kgSD/wgC6a1op+wCIt7LWHSDHooyh7UMYc=; b=CP2RyiVXmbgnhe
	pJ4KW5qvoHvWMSbOPba/LgmZOKMSH5UhUb0+8cuZ+p/Oji7QaWEyWdjH2xYRMN0uI4i7E5IaqLk5Q
	o26bTXG2Mek1QOR9GngmYRcroW0mF6XtAduCA2yEnykGzPSuIR7lW8St9ZDH37YXkkBRGX5gFog9+
	oNwXUQG25TJR+XFgbJWGsHV34GC2Aqte05bcoWVPFO+zvEy2qc67kT7Y89/buiLyb0zRXb6P2l7xq
	C9ZsFfg02Y7uAIVnPrwn72p3zQ57MG4uZvjv9+TOi7H0R+SBNNTarKBDMFn4k1Uer2W5dTnx1n2bU
	/JPWP9mQnqsXOt6P265g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH3bi-009i6Q-7i; Thu, 28 Jul 2022 13:31:18 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH3bf-009i0w-30
	for linux-mtd@lists.infradead.org; Thu, 28 Jul 2022 13:31:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1659015075; x=1690551075;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=XUSKSeiaiXKN2xiayW6PozrXSMSjFdxIcU4lmcfM4OM=;
  b=GJUZxCR3ZeFJd1z3m1Up56CSE6WXn+b3EbxYiIJd0jz6YGaSuBSM9C0M
   UD4f1EdwEm/z0lj5SRtcc7lNWV7m5Zh8ciNEXDULgaaX2+Afx58ju7DBW
   GH+0A0NWscyPGyVDeMgzTWDBCzHL18HrTWkRSa8tqK7BRB2HiEWwSmzwI
   790zrDhsH0Q8yERONOXs2TKgJxu/PEThn4wv85AxMIBHsUJHaDt3n+9Jz
   Zb+fSUHIQrvNuy6NmQgx7Hy9Jy9C1gghFoCYamRV1UHdntKDKpUq1IbBJ
   oJio3D+VgGxnc7y06Qi1Y3wcDYP+Vp2RppTCVEzpm9duA/C11FU2Vsr3t
   A==;
X-IronPort-AV: E=Sophos;i="5.93,198,1654585200"; 
   d="scan'208";a="174001987"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Jul 2022 06:31:07 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 28 Jul 2022 06:31:05 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Thu, 28 Jul 2022 06:31:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N4Cr0xe89UBHDfddQU2Tl7V5r3PndjBDV4rut+wjB58UIwfNagi79cgfaaWlm2U6zQnS1TEcDZyTWO3o4QF6WLellM8l17kPpu8syuLoJg39LF83bFK1vd6HeTDtthwDQ9joX73MYoL3wNrR6hOnCJx9rKdLuI6yVsMu3sfwX4NiwrxbbZDsS42HtP7XirZelQ5mGvm2bSWF8GAPcXfEXbyHE0RPTqom9BRZn7vbg/CKgJqFGvvdcVJS61LV4QfKrWM5mhHr8VL5maYptFq60vVycABijNxROmYuq4psiI6BmC0VEpYGrJeZXzhPNfeCtD4+mxwJ8kRLtSHOZWgomg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XUSKSeiaiXKN2xiayW6PozrXSMSjFdxIcU4lmcfM4OM=;
 b=hx7gOZ7k9KR1dE/se432zrbpQSeBjDAdIEIujVz4EfBvwgwssBnwx31VJRuOMWGarlj8Z1Hu8AxUz37JpEvs6Rl24N294cWX/zLII0I0yVqurhRo62YgLxnuMo7FCJg7zShFDwvqV78SHwWV+fREREZoRBtwPh7oTy2KI03i0/TYmM+cVcyHAqHvmVzFiJ7OTWyO8d68as0BPElJff/wXJEl9XOAjB3s3OgxfjkuiIkUz3aQBObuNAj37ttK2j2oA/RrwN8+uczjaASLrgUzEUW/ERYgHXSOvTxYPlgww0WqzQ7hdJlSQzlzcat8VYHEfnaYpn6Hop2Fr0+jua4KYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XUSKSeiaiXKN2xiayW6PozrXSMSjFdxIcU4lmcfM4OM=;
 b=Why/ZQtFktkJqn/j9c7K4dmH/SurA8jxurlXU7pzeCozZSCJHNo0o90goojAyc0FpOqPiuCfWgDecc/XtN3EVmrDSEzbxuDzfNE5d4pIshI4QdEaO3ze7vGG4wDVcFU9Sug6mOt2FDGexdB+RB5METOBZDohQh7g90ltS22J1P0=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 DM5PR1101MB2202.namprd11.prod.outlook.com (2603:10b6:4:50::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.19; Thu, 28 Jul 2022 13:31:03 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::7549:c58c:5e93:7c35]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::7549:c58c:5e93:7c35%5]) with mapi id 15.20.5458.023; Thu, 28 Jul 2022
 13:31:01 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>
CC: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<vigneshr@ti.com>, <quic_c_sbhanu@quicinc.com>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] mtd: spi-nor: introduce SNOR_ID3()
Thread-Topic: [PATCH 1/2] mtd: spi-nor: introduce SNOR_ID3()
Thread-Index: AQHYmzRwuAFPdIe45ECo1RhI0CKwAw==
Date: Thu, 28 Jul 2022 13:31:01 +0000
Message-ID: <29f4cff4-edc5-3838-2495-253e794178ae@microchip.com>
References: <20220510140232.3519184-1-michael@walle.cc>
 <20220510140232.3519184-2-michael@walle.cc>
 <160ddac1-6d0a-c922-1380-09e7823a285e@microchip.com>
 <41e6b74d-6973-60da-1556-82a1e879ffd4@microchip.com>
 <ff6ffb3f8e77b29b44883d30c9b4385e@walle.cc>
In-Reply-To: <ff6ffb3f8e77b29b44883d30c9b4385e@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5d003c66-087a-4642-3640-08da709d6a08
x-ms-traffictypediagnostic: DM5PR1101MB2202:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yY/oC5qfFN+OknbeCZzNkMTfrOxs7tZhlVyXLwHJoa8fbGkSt/1asrAqxKoKBL/DnYXVKbQvaY9z/r/oM85HfJ8zBNe40ciZLFjpzvWeSTUhqFBYz/5E6+9Tc4AxuESwaR8ad1VwwcEWK8bYO39ZHyS5hUVbEouM8dtV66dVqyJO4w0CahfVhHThD7gvCY4KJlS4iGXuVPpzubVVDokjrTSc2sE0Vu9E9CtjcaRNB0BCKZvqryGCvG01w6b8iOMPIkjzI+VD6/usKoQbQBj5tERiCVBr21meW+tcwYc/cz5F4r18A15WadoerZvWehtHIa5C3JdiYhv8ll8GV3KIEcJ5a9ixj4dEBy9LZpWWbIpCRJn4l8vWxABPfIQcO44OW+o8XI3HeKjwdnIbNsmKpZdbcDWmUzXP5i8oCRvFQQRn6zmaXkMvLBDrk5VZjDCZ0TV0oS13bXMTZYPUFOklVvkaXKgoHSK6Z0Jzrk9jXCNrJtS/eALqTx6+QI48Zy0spA8oBW1n7Bbmt6muRvZhVPD+gVheWsToILMsiFE8KroBDC6d4zgkIiPUxd9GQHO7y7UtigTV0ESKX5fsQxax/eDs00r7jbHKIVGafh5I+FAmIbyKNikncznwehC6RwcckoJRblfDV+/VTw+LZSru5fAxrmdnqZu421Cs+ojLJT752KPmUeWkGCOT3qygoZEJmmspK7oEu27iBTxD9mlV3rEgqm2lk9Zj7QD6lm/CWHy0pJUVBlH+4iVMM48G7aiXRfSN/2qcb76SVPLg9Nl38rNc0Bwq/JWHk1/8YgHMJAuAu9Py5GDExu3SqRLn55+U3wOJDIzK5qYIQMMTKn3GrWbJc40ypvOUWPUu6+nPZ+kSksXkD5VwThH8YT21SCp4
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(396003)(366004)(376002)(39860400002)(346002)(186003)(66556008)(2616005)(122000001)(36756003)(38070700005)(2906002)(5660300002)(6512007)(4326008)(6916009)(316002)(4744005)(76116006)(54906003)(38100700002)(8676002)(8936002)(66946007)(31696002)(53546011)(71200400001)(66446008)(31686004)(91956017)(41300700001)(478600001)(6506007)(66476007)(64756008)(26005)(6486002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MEFMbVh5NUJKSHpXWCt5d2RWUzduc2dXWnpFeklaNGIxYjFkMldDUCtkeDVN?=
 =?utf-8?B?ZFptSlYzQ3FncTYrYldmL0wrZUZiNUp2MUFaYmp6YjN0NHJWMjVYcWZIMGJn?=
 =?utf-8?B?djNCY0JwWkpNVzBXWWRLckF3Q3RUVmhzd1lmMVRUazd3TmZ0NFd5MUtENmha?=
 =?utf-8?B?T2U5UEJoZTA1NndRZ0pUa2NDVVkyT1pOS2lUeVc5QThwcTRraDVSZzhFUDkz?=
 =?utf-8?B?RFVCaUhSYUJOcW82M2NFdzN0d3RDREVmWFJ5eFdpNi9sZVQ2SDRqaFFYMmY0?=
 =?utf-8?B?UWJsbzlOdDlxRnBSeDlSZ0tycVluWS9objhrWXVFN2JqTGVqczBOVWRZcE1F?=
 =?utf-8?B?T3BLemI2QU1wRXIzT3grcEUxdFFhWTJYYUR3aVo0VS9GSDlaR08vSkpheVVz?=
 =?utf-8?B?Z01lbXZseUI2Yk9rVnFXMUo1VWdPdEVkYktaeGlIT2ptREpxdjRhZkhNS3FJ?=
 =?utf-8?B?c0p5VGIwYlNKelRZSHFlZndiajdHTm16K1J3VEFHWjkzVy9rTU55aE1pOEhj?=
 =?utf-8?B?TktEdTNBVlVRMjFBUzk5V0xibTdIRzZCUE9aUVZFZ09IRjZNbUpObVgxVjNn?=
 =?utf-8?B?OFluRzdacXpnRWxoNFR0ZGFQcUcwYWFTKyswdzdVTmRLak5OaERINk9pd3M1?=
 =?utf-8?B?TEtFZTRycG1LcmNTbWV4bk1yNEdOV3dwTW01dCsxTHBwN2NBckJBd2NNTXNt?=
 =?utf-8?B?eks2MGU4RHh5Y1F4V05yeHlwR3hlL2dEOSt5a1U5aktEUk95Vkt3bXBhOE5B?=
 =?utf-8?B?MlUxbmJjYVFqUFJrNTNtZDVQT2oyK2V1VUl5T3dRQnU4Y1RqQmI2aTB1TkMw?=
 =?utf-8?B?dVgyU2NRRzVqL1Uya29WZHlGM1NsYm5HbUdBUldHUE1qVFJVMHdNQkNmMllW?=
 =?utf-8?B?dSthMHk5NkZtaDZtb1BVemtqcXI1M0JQOFFPS3NMeGxFTlYwSEU3TFZBSldo?=
 =?utf-8?B?MmNtUkFIMVpBaHBlSUZScGRwRkdwckhwR24wUlREZEYxYzVZd0c3MVFFMGh3?=
 =?utf-8?B?V3dCd1FBTTJZbDZzdzRMNC9FV09hQ01WUTFuMXBMd0NXNlArSENoR2ZFTEhr?=
 =?utf-8?B?OWlJN2pURkVqQ2RsQnRyUS91SWRWOFNKTHRVZGhBbTBQN0paZ2ZYV0hlZm5T?=
 =?utf-8?B?ayt1WmIrd2xDNEVUSTFwdDNScktmYWVwcXBtT3YvaFFQWkludmNkTjUrbUJZ?=
 =?utf-8?B?QTN4cGltaU9waWRwakdpdUtPMXNiWXZiM0NHOUZzTUp2TEZndGJyNDV1djhu?=
 =?utf-8?B?alFGSXRxcTh6bjBrQVUzOUM5WkI3a2EvVzJXQWJPUyt1SXZSODYwN0M0enJw?=
 =?utf-8?B?V3BhYU1FL3VLQmxFTkphemhkK2NsMEtHTFNQN1JXb0p3Z0p6NGNQMUJhYjI2?=
 =?utf-8?B?VjdQbFVIM2x5QUlsZ1ljWDdlL3VHTGtYRmkwMTE0d0FwWnJBNDBsUzVJdnF0?=
 =?utf-8?B?RW1tMGdVc2RZRFFjd05QSHJDNDY3WGhXYzgyQi9ackx3Ly9VNHFnV3Z5L3dD?=
 =?utf-8?B?alJ1RnB4b1NiN3R1ODIrSUJQQ0pEOGQ1NXRKU3dFSUliZHhrUXVkOGNoRW1q?=
 =?utf-8?B?ZENadzFZRzZ4RmpqQS9XTUZNUDdNWVJlUk04N2orbk1ZSW5ldElBSFNGZE51?=
 =?utf-8?B?MWV0ZlFiaFJrUXdwQy9zaWpZQ1JKQ0ZpM1NCamx1RWlmRXl0RVlMYm4yNWRP?=
 =?utf-8?B?bFN4SVlGY3pQekI0S1k2RnI2MTJmbUI4dHdOeStWTUF4UGRKWFd5d2FFNDVz?=
 =?utf-8?B?dndSQTVmZHlXUmtsdDBUOFpLS2xGUGZwQko2a1pXQ3J6bEVNRGhOVENRTnBt?=
 =?utf-8?B?VlRDejYwQUZTWTBuQU8zR3lkb0ZvMkdHMkNSZElUTEFxZzlmRkdlOGZaR1RV?=
 =?utf-8?B?dkhlVmIzWXZpWWU5bElCQStpWldXek43ejloc1QxeUhaTWFha3UwMTBSNStp?=
 =?utf-8?B?MDFERExFU3lyRUpkTkhFbk5nRkxtd1NzU1R4d0N4ZTRqUmp5Ni82dkpabS9l?=
 =?utf-8?B?VWxzVFNvZ1kybjFEWlhHWW5YRjlpMlpqZ0dKZ0xId003cHcvd1FrZXc4MHdN?=
 =?utf-8?B?RUQyTE8xZHpnQ2E3OVNXbUNUbTU5eVRIVG1GTlFmREE4RWRtK1ZjbC9LVHJw?=
 =?utf-8?B?VWhXUVdzdlErV053MzBlaXF3cXZZNk53bFMrV1JHRUVWWnFIUXRPeVRibmxK?=
 =?utf-8?B?NkE9PQ==?=
Content-ID: <0790D10B2EB53F408958DEC7DD75C1CE@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d003c66-087a-4642-3640-08da709d6a08
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2022 13:31:01.6821
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NUpLMOSS9zXYcdF3kMmU3VaBNOdj7ClWPdaFxE93XeoUulCI2GbYDsWHHKGbj3t1YtzoSRYDtoqV5XVyQ8ZBLz2P66wx2qOQ+qLkayev1Jo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_063115_413686_83AFC214 
X-CRM114-Status: GOOD (  14.45  )
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

On 7/28/22 16:12, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
>>>> +#define SNOR_ID3(_jedec_id)
>>
>> How about SFDP_ID3 and SFDP_ID6 instead?
> 
> Yes, probably a better name. I was also thinking about splitting
> the id in vendor, device and additional bytes. But I haven't
> thought of the actual implementation that much. Such as:
> 
> #define SFDP_ID(<u8 vid>, <u16 did>, <variable aux bytes>)
> #define SFDP_ID_FULL(<num_continuation_code>, <u8 vid>, <u16 did>,
> <variable aux bytes>)
> 
> Couldn't make up a better name than that _FULL for now. Happy to hear
> suggestions :)
> 

You mean splitting the ID in manufacturer ID, flash ID and extended flash ID?
I'd like to understand the benefits of splitting this, can you give me an
example? In the past I though about introducing some flash info macros for
families of flashes of the same vendor, it will reduce the number of lines
on flash definition, but not really related.

-- 
Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
