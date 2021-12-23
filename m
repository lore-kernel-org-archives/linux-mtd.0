Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A4BC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Dec 2021 13:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=duXNgoOjzuJZKKgThfQ8brvjkxrHQtCndWNqignj7ZM=; b=IjCI7mUwL2dYYJ
	+tGN1RDUoMAHNiHdYcWq2JAEryRiTHw5o/BUHVBOEgcCggbtTC8q5HAYA05LEg3EwVEqB1fAvfJFk
	PcUG3Gk4diooJfzrW0aPDrLmhftF14KIWMKJD7L1XUXM148DM2mOrC9oizs1kY6rIrkQJjFJwASsI
	cNXU9fMMZ2g2l5a4L6c9dq6zi6d0nb7YQPMTU+ESIWg1ZzRz+oT+DmeMdvIlSTT3BptnOTPtcwNjj
	n52/+BOAvkuLMMwAbL4Xs9S5g4hOCMo89NyWxUOUQRuSxN4+8IEavTs9Npn7bG1L48L3ZoywuYc+U
	i4LKKAoyH+9HOtdpCEbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0Nnb-00Clbp-Sy; Thu, 23 Dec 2021 13:06:24 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0NnZ-00Claa-J7
 for linux-mtd@lists.infradead.org; Thu, 23 Dec 2021 13:06:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1640264781; x=1671800781;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=RV919MFILHILtq24CTdiq3rANCwpv5JM5PrZZsHz/2U=;
 b=urTfZ912Wehy1SP/9U46jP+3hSKizjpiap+0w5atu0meuRTnE/Yr5vBw
 sO/jWHo/KFbgXv0t0DQwzAsVtEL8thwTgNY07HJmn1HXGm6/3iRr1xhKg
 2plG2ClXxiU+NBng+eKm0FHRVyH5tfDDUzs0+o0dYgmtdHyLHs5r4fVwV
 nWBpf9UlqT9Ebt/jo3XhEDyt5bxAECxKmM2ZcqAd50Yw1N4v7kqtlWxhV
 xFKyFIitvy0IzKjBqzuR5OxMeD3GIeCjQkVu41s0+MAwyrrggAQ8sMf7M
 Wv6zWZzjkpI1tnr4VUdZ82whg8O2HR2Lye4G85kFmw40BylyAisP3NCqE g==;
IronPort-SDR: 5Z4T4+m0STinfBzDs+cgU8tMsWjFvxW3R9nrmzRh8/U1M0ysgdD+qIV0F3h3HYOVNTNTkyci3A
 09DNO3wHWcfMJ98DZ93xQkFObIh99mCtcINbsdRwBk3iRUkN+qPsLDIVeWNDn3kD7n1PDrxaW9
 iuqatbq3dTPwvlXtORX5sj13bay27r5JAML2v+ujBPnDHSij10tnNA5tRg+R1iKPGJyE3iymhL
 pemmhtvibqU707csw+fxPB3OQz2p+klqGJhvOkyB7Jbt2UVle/fA6BCONn5iqL5O0/7EAHrF2w
 FXSGrK6+nU9NQO2i3XJ1QoV1
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="148177147"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Dec 2021 06:06:19 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 23 Dec 2021 06:06:19 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Thu, 23 Dec 2021 06:06:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DtpyomIXLDrAnbolqHhqCHKlnd8+V7+kFu4r/HZAzNEb65SmIOlmpfx4fIrcPDf1NC/3to0OSYaB5iAf+Si7s0q6zDk0SWi+UoG+D7KJDfuKNEp/Y6qSZA/2nMrVYK4DMdVOX+M4OFKJvYrMsJyTJ+Fwx1nGkdX2e+QTm3Fgkd6ksy3t0887oVgMwg5kslfs8Qf5ntqsovOT8W3gPwSzihgQXHy/aiDG11PPy179co70qj9snbF9iGrB5fnXHDERy2xZw+Dhv7sc3+m7zgDkvGXFoHJ9qYZ/wm+T/Cm/g0ZGzLSeGk6wAtOMNr/5HQ6e2akUbCJq/j9Nei5fXhfaPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RV919MFILHILtq24CTdiq3rANCwpv5JM5PrZZsHz/2U=;
 b=UxpiVDWuZAJe5bsNQ6j5QqcCcFSi2n8blMzrX7M/oXgplZzNLMxax3GeRKamI+AGUL2Dij7KnO4lSZCfMHRN3hrX56iTGMqHtCNb3rbCyYSqoDSRPtIRpor4BDcJ3GX3Uhtm8jB5nl2TW9PwA8/fL5Z2Eht8GUocEzAZRJrvj74YN0qDTH8Xm5W1HQ7nckFzuSnvEw8/3yl9fsZcy0SA27LNGaFDrYG/zmntg6hZw66vQBmDENp+yqnn9F4S3VIAhPA4Mc0w/KGNngnQ96MFxhGwjVZJwIfWqZGaNZMCE5O8xs900pw9ZIYmOokielTCJiGXYq3yZGMKXFTUCEDIjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RV919MFILHILtq24CTdiq3rANCwpv5JM5PrZZsHz/2U=;
 b=ZH/p5Fgg9Qefn+JxwnH3u5BX5UkLfOQ9PmXJt3J7o7ds2utScFbbL81F6zgpYig7/tIt2dSvWXP6LSFC7nJaxpv0e2s69jyLhCMZQAIUovI5i/74ecwl24h7QjvmY9zJIW3ZSIU6xaLh1x3KV5VyxmqOl96aX7OgKZkgyJbCY7A=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA2PR11MB5161.namprd11.prod.outlook.com (2603:10b6:806:fa::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Thu, 23 Dec
 2021 13:06:14 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::5c96:23c3:4407:d3b1]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::5c96:23c3:4407:d3b1%9]) with mapi id 15.20.4801.024; Thu, 23 Dec 2021
 13:06:14 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>, <broonie@kernel.org>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>
Subject: Re: [PATCH v2 2/6] mtd: spi-nor: spansion: write 2 bytes when
 disabling Octal DTR mode
Thread-Topic: [PATCH v2 2/6] mtd: spi-nor: spansion: write 2 bytes when
 disabling Octal DTR mode
Thread-Index: AQHX9/3dZMPS/7j9wEKlAvg+zFmXJw==
Date: Thu, 23 Dec 2021 13:06:14 +0000
Message-ID: <ec30ca85-5341-cd06-e007-c6c9aa24b0d1@microchip.com>
References: <20210531181757.19458-1-p.yadav@ti.com>
 <20210531181757.19458-3-p.yadav@ti.com>
In-Reply-To: <20210531181757.19458-3-p.yadav@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b8125b9d-a576-47d1-9d67-08d9c614ffc0
x-ms-traffictypediagnostic: SA2PR11MB5161:EE_
x-microsoft-antispam-prvs: <SA2PR11MB51619A6C23353CE9BA1791CAF07E9@SA2PR11MB5161.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iDkmoTQmJrFduvbySvpSKsUQVFmBqrPOh04Y+k+MjLAfAkmqWonAI5SDkbQjY6qbu/I9ebtQHfwoOU/wIGoZKdgnW/zB+k6e0orMUnNYyIvx0XZs9OOzFYWKzWvvrc5gbKBQggfsNdZ+vql6q9HbkF+8K2MLFjlBnmeZeTT58bAVdSMS5YKSnhNtfm7FNVh1JHb//R44gFUF5VbSYglcI7yyopV4SHsA2HT3lLPRh1OqckgccVcUzgp4z/3Iyhc8lEqkRMbNtp8mr3wK6AUs/0f+IDdP7PirXfgQVcZXTxIgR0vdD37Jq6uSKIl59CXNFAWL4UBQyJsajCMhSkEkdu03L1aVL6mf0HCAp4FEqeM3xHufr9tlL9kNv0dzZ7cNioLl23tmpxx4xMgNcUpuA/Yhxut7M8FO3PRqGs7MV41Fh13p8EurW0zav/nV8EVeivSiXSKzg84S2FN3n6LE76nN2/cT/2EG5XJvpnDNeLq6/3S4KMURttqazaVrhKZU8jpajdUUan230rtH/JoyYBDAMZdHnBEKV64kheC+jeDmZYUJj4SDu39LjHbkYKm7/l/EdQ3Bg8Nx/VczrefuNngSshz7ZOV44NO0GHzyPP5dgLmCE6nTTAJO4DYt6LX9n9QJ+a6Ckw7vsy2Y2uJO5wa8dJSUfxArmXTmAgaxjY6TmzkM0qY3Z1ye7XRWzpuCO+gDgAm4RAN/dD4w6K+U75j0R32mO5JGzkzQdj8j5mUf0MvsGYkEKmIwavbYU3iTnZ8VyRxSRRRvRYz+xVhzNw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6512007)(2906002)(508600001)(316002)(86362001)(83380400001)(71200400001)(31686004)(91956017)(110136005)(66556008)(36756003)(66476007)(76116006)(66446008)(64756008)(66946007)(2616005)(38070700005)(8676002)(5660300002)(31696002)(53546011)(6506007)(186003)(8936002)(38100700002)(26005)(6486002)(122000001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MUR5VjA2K0xWaXpKdXRpbk96ZGxzclozakpockdNSExzeXZGcEVnaituM2U1?=
 =?utf-8?B?bzYvRERmZEg0ak43WU83MEdyRks2NzBJemRWMmdneE1ORTlESy9uNFgxVzUx?=
 =?utf-8?B?YXpJMVhGaWVaVVMwYjkxNmpvRzRxYUhLY2lCTmNLYVNlVWxWZGFQWTUxdFRZ?=
 =?utf-8?B?OXpzeVAzRmpjc0ppSkVGY2UyUTM1M1J6cC95OFpkOW1XeEVrNlc2bEZtL2ll?=
 =?utf-8?B?b2FNWmJjTjNBMmF2MEJOa3RqRy9sSjZaRUJ3OW9JYWtEZE9tb3BrQTZJMUxZ?=
 =?utf-8?B?Z3N1anZXMHRJd1FNeXNnamxwRTJQR1RmY1ZLY2o3R1dJZFFOdjREKy9TZHhr?=
 =?utf-8?B?Z2JKOGVJNVpDdFI4YlQ0MEM5aVdWODRneFNETzlCUHRzVDZJY2xva1MzTFR1?=
 =?utf-8?B?bVdrZFBzQ1F2Z3dPbG1obGFVZ1RXZTYzRXU4UDRGY3hHOWo4Uk5TdEFXSDNm?=
 =?utf-8?B?T094bThFdHE0bEhLWmpHcWkyZmpoeTZ6dEpVWitXemlwaEFlSTNtZWtZZWNT?=
 =?utf-8?B?RllyTFc5SmlTSzhvRC9UbVJDTkZKSmxDTVZ1a25sVlNKUGpoRHdvOWdPQzNh?=
 =?utf-8?B?MVR6OHllMzJhTXVOUjZmZmMvTnFOU0FxSUkvK0lGL3Fqa2s2aE4wK1FmNGJE?=
 =?utf-8?B?cUV2cFN4QStxbXFES3R0MjNadTlpKzJ2WkRPR01aNFZQODBRdFowOUI0VFh4?=
 =?utf-8?B?bXVxRmxzQUh0dDVjU21MVG9sWmxDWE9HRDc5MXE0MGV6VTdackFNZ2xzcmtu?=
 =?utf-8?B?d3BheGdBSkR5SGt2RVF3aUNIcGdHYTBRM0J5WW5KQ2MreGNLRjRaclFrU0dr?=
 =?utf-8?B?ZlJrK3F5K0lQODV6dFJYZGFWOUFRcksvdnBYVmh1dWovSXl2bmczYTVZQUFk?=
 =?utf-8?B?bXRrSldGRlo0WDRFVDdLTDFzRTl6U0JPV0VPNklNOFZ2OEE2aHUwcG9zL01M?=
 =?utf-8?B?b2hUMXp0YjZia094MzJucFVtTGsreFZWcXZFNlAyZGo4bjBoWGYva015eWFL?=
 =?utf-8?B?QzRtVkw5bTUwN2NGTXMrZFpvWG9JY3BDMXU2dU1PcFhvSUtURlVsWmZJbEw1?=
 =?utf-8?B?TC82Mzh2VXJ3Vko3aWI5NUVIcUY5Z1IxNm4vKzBQa3dyZC8xeFRNM0IwRnNF?=
 =?utf-8?B?K0ZyNUd5UFFYYkhPajY1QnRGSC8xU1V6WHJXVTBvTnp4b0g4bUcwV2swRHJD?=
 =?utf-8?B?SzUveHJ2aUJkSCtSY2JNUzVweUxwU1cySlljWEl4bXdHUzFsYXhaT2xUUEtX?=
 =?utf-8?B?K1YyaU43ZHhSOVFoQjhzZFI5VjF4RmEwVXk0cm1XY0s1emROZ3VSc0RFS1ds?=
 =?utf-8?B?VklhdnlhRXFJSWJqUC9xNE9tSFhIRkduWGFUQmpTVFBXM1phcUpGZHJXYzgy?=
 =?utf-8?B?M25jVlNCbGxCeUFjYlBQaHJmbjZsKzVhNjdETlVCeEJVd3doSVhkZzJHSExJ?=
 =?utf-8?B?YkhGSmgwZWhLclJxK09yR2N0VGcrVzFtVEFwbStBMU5GZDBDUk5DYUI3QWxX?=
 =?utf-8?B?bzk1U0JwWElNZXBXajZXSWZ1MUUzV3ZtajdQOUNIcURVeXRRdGVOa25KbnpQ?=
 =?utf-8?B?TnJzQWxGd0k0c2hNVjU4RzQyU2RUMzdqWTFBTDlzUDJFd1d4aDEwTEZJeUtH?=
 =?utf-8?B?MmNLV0oxVE56a3lzZjl1MVFpM0gvUjJUL1pPSmtuTWlqdGhwbUFWeVI0U3BC?=
 =?utf-8?B?TUtqZ0JuaTNPRjRiYzJVVTB0QzFkVkhjUStxU20zc3p2bnZlRnRQNmp1Wkpk?=
 =?utf-8?B?WDJwZHRadnZabXdGcVhxeURxZFpQQmhrc2lvRUVKVVNsVGlHbm1oZUhMWE9j?=
 =?utf-8?B?aWNjS1VHNnYwOGdTVy9ZRC8rR0pDMm9TSThNZk41UkpUWm1pOUQxNlJzeFdx?=
 =?utf-8?B?TVpMOTZHUExNUllZTHpNd0hOYnpra0c4Q21DWDJPRGt4YkdFWHVlYXNYcldS?=
 =?utf-8?B?dUFXY1pjU1QvVVcyeHRDL21MZUFNVU9RQ3piNDNFdm1nZTFRMU8wWVBoRUhX?=
 =?utf-8?B?cnZoZ1NWNjFJNE1lOGZBWHl1N0lWWVpJclJEWkkzcStVYU0xMUhFSTFXK3NS?=
 =?utf-8?B?TXppTXFDdys1N09xa1hZZGtBMWphQzlpS095SHN4QnRnTmpLZVVHUlhyR0JI?=
 =?utf-8?B?cUlsMkFYMDJxSVkxMGdpdytROXFaaFJvcUV6a2I0bDlvNEh0c2ZMY1plUkxs?=
 =?utf-8?B?bXhQNjRWODNocm9EbTIyUkVwWURINU5PdlIrMEN6RGs0ZjM1THdIbnBKYWd6?=
 =?utf-8?B?dlNoN2JPS3VSdjhKNk81TXBlL0VRPT0=?=
Content-ID: <6EA117AE388EA343AB32BF08B152FAC2@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8125b9d-a576-47d1-9d67-08d9c614ffc0
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2021 13:06:14.0989 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vKKAsolJvwb2nE8REkklcBvuzolnVfA8xbAWRh2RffrsSTA11iQ/9C9eGK73TEB7Nrr0DrvDarFzmQTxvcVL0KHuAxmk9Fskz/a+bDqk/Mo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211223_050621_672998_9C5E93AE 
X-CRM114-Status: GOOD (  21.49  )
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

On 5/31/21 9:17 PM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> The Octal DTR configuration is stored in the CFR5V register. This
> register is 1 byte wide. But 1 byte long transactions are not allowed in
> 8D-8D-8D mode. Since the next byte address does not contain any
> register, it is safe to write any value to it. Write a 0 to it.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> ---
> 
> (no changes since v1)
> 
>  drivers/mtd/spi-nor/spansion.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index ee82dcd75310..e6bf5c9eee6a 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -65,10 +65,18 @@ static int spi_nor_cypress_octal_dtr_enable(struct spi_nor *nor, bool enable)
>         if (ret)
>                 return ret;
> 
> -       if (enable)
> -               *buf = SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_EN;
> -       else
> -               *buf = SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS;
> +       if (enable) {
> +               buf[0] = SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_EN;
> +       } else {
> +               /*
> +                * The register is 1-byte wide, but 1-byte transactions are not
> +                * allowed in 8D-8D-8D mode. Since there is no register at the
> +                * next location, just initialize the value to 0 and let the
> +                * transaction go on.
> +                */
> +               buf[0] = SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS;
> +               buf[1] = 0;

how about writing 0xff instead?

> +       }
> 
>         op = (struct spi_mem_op)
>                 SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WR_ANY_REG, 1),
> @@ -76,7 +84,7 @@ static int spi_nor_cypress_octal_dtr_enable(struct spi_nor *nor, bool enable)
>                                            SPINOR_REG_CYPRESS_CFR5V,
>                                            1),
>                            SPI_MEM_OP_NO_DUMMY,
> -                          SPI_MEM_OP_DATA_OUT(1, buf, 1));
> +                          SPI_MEM_OP_DATA_OUT(enable ? 1 : 2, buf, 1));
> 
>         if (!enable)
>                 spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
> --
> 2.30.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
