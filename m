Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65EF7C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Mar 2022 11:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QacwOJ29jvXv23BuRLapqg3Gf5nF4qkYvLsYIhZgJX4=; b=bVmHgFzLPZw83I
	h4Vk6P99hfJjcDtaFX8V2GzVtOHcRrd7Ur+p4zZIgELfeItnVQ0/uM6aw9Q7icWXULOM0aJa/98j7
	jcf0kF4goId1sMtjFMqVmYSEatX0UVc65Sz5xIBgKAAkBHFKfdropibeymfp6wtSoEkEcZmJ61/xN
	9RFbILdreJ9W0syRkBfWkTwyEA+iOoLzJRQNvpT46b0VWC0XI6btt/5MlrMKduz51rI7amuWUU7Xw
	Ynw3uJDd5FMllRDdoUR6qWGaoyjTCYfHeUihCwRI0zJEzRWTNSLZNom5eIKKDqwFg5L9ym+3lH55n
	PdW4Mxj0cUzMtWpcPdZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nP0UZ-00GNRB-Bh; Tue, 01 Mar 2022 11:16:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nP0UV-00GNPu-1t; Tue, 01 Mar 2022 11:16:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646133387; x=1677669387;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=sOFTi+ahPAf2FmMUeOKKgCYnpXozumaO6KlU9y39CJ0=;
 b=UB+ZESYOvNAOgkHM8c8d4JIIvQsyNFZqddSbebozRWjCpkbeoL0t+xZ3
 /txjt7W8ohu6Zw7MyDqXsFQeZt07/KdvHhXEsE76OYKbgKBX2OEVPIo0g
 0KADWdDSBOL9CJtY1IJx3SqG0VZwyV93Ao1qKoAelmJ/YacP5Z1q/X4Cj
 Ko++uh8sqSYz4dir1ieUa8N9ITHsE0xqhP5X23ZrCd3yQNeDy6d8i3JWC
 xzbn0jAjCJ3D4UW9UHOezvsF6Rw7PpEDukWZvVG1BSBDk3nDsFjiC9JCv
 dWjM32od8gUSXkcDbiADmov+ADwB28bg8SIFL182pMJ6Xnh9C6CUAuC9H Q==;
X-IronPort-AV: E=Sophos;i="5.90,145,1643698800"; d="scan'208";a="147636215"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Mar 2022 04:16:26 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 1 Mar 2022 04:16:25 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Tue, 1 Mar 2022 04:16:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kkxMbm9vbQG6BJQqmw2jpMMVSItws1opw33ey0BSKS2Tq19MDf5Mlpt+ihGwV1qRmiJbJDfzHY+dlyGvoSa8DxUYKs7JzlrPQz8h8qDwVZMpbphsyhhRftd7k6K2mOgwl6B7QumxNU2cnBpVLfpyTN+CGil4yU8G2mARvCS4Cdmy5GExmUxm8OwoSjYfqs2t4MVS0oWBV9PLCnXYBfD3g29oopV8ADJwVNECJrBsNCZQNWKFDHWIyv0s8RAwcNZCDSIfzn8Pb0DqmG/zJV0f8h5TlJEPAjfQrL/csVL0W2wF3bmvp1F2G0kd7y7PlxD51dMfIIioc/QwgCINDMmS/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sOFTi+ahPAf2FmMUeOKKgCYnpXozumaO6KlU9y39CJ0=;
 b=X9v4rPvPmc2ZDTfg4SXZPYdldf3EZI1VMK91gsPg+22eeazgjmWECZluqFYFGuYJC6MN8eESQ3nji30FAx0rOQU+Vpf1K+NoPFmOmJ1K//Hv3/AwGz/g3OYSTSLrqQzGeTe9mvxr4qMaqZb/fW/MtlBAoYpjfGRBCkjGumZHE2t/ojHH7bkuIz0g44FH9+S8IcW7Mv5MZiN6qnh8OZeZktuLBffYboIruEghp+/1TKWQoJhbIRoS3rusmU2zU/G5+NEYN4j15vDFnbq9D/84xqW4jHovNXhfYexAq8MET5969OtKz+k0RVdZhJ1Vay65gXrcKHn2gkSdTtMBpVEoHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sOFTi+ahPAf2FmMUeOKKgCYnpXozumaO6KlU9y39CJ0=;
 b=ivKy5SLOlQAGf5V41S2Az/P0gf36tkS/LTvzGfY/FD/INHz5yojoggGeI99MkYqrAIp4M216jSpKAj/WRpjGjpwy0NXkxDJROsW3rG5OedxgiTyhiMUcrmMHXrUFLSwhPq/7UgZubg2FwysafbWszMEOKpoMWMydHgajlm0DG9o=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.22; Tue, 1 Mar 2022 11:16:20 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9%5]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 11:16:20 +0000
From: <Tudor.Ambarus@microchip.com>
To: <heiko.thiery@gmail.com>, <p.yadav@ti.com>, <michael@walle.cc>
CC: <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <Nicolas.Ferre@microchip.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: macronix: Move set_4byte_addr_mode() to
 late_init()
Thread-Topic: [PATCH 1/2] mtd: spi-nor: macronix: Move set_4byte_addr_mode()
 to late_init()
Thread-Index: AQHYLV3GXH42A5SHgkmqaeiZ/c8f/g==
Date: Tue, 1 Mar 2022 11:16:20 +0000
Message-ID: <008ab673-75c8-8c41-a98a-af98394a8e56@microchip.com>
References: <20220301095640.313852-1-tudor.ambarus@microchip.com>
 <20220301095640.313852-2-tudor.ambarus@microchip.com>
In-Reply-To: <20220301095640.313852-2-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 33e020d7-8e49-431c-7720-08d9fb74e9af
x-ms-traffictypediagnostic: DS7PR11MB6039:EE_
x-microsoft-antispam-prvs: <DS7PR11MB60399F039A82DA451646D6A2F0029@DS7PR11MB6039.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TTFRDsOfZtmg7PvjKc6VvdhxMLOC03qWOLifUK2LQJ4HVEbaBjGWxYI1O6fiqa7tG3mGgWl/IiY69sJkw3Fu6Fy31Q6WlzSPmvQ7hts8UZSeCoPmsPdccvtJFazNjBGznFgc1jxpQ525TlH8sdHKorleYiqHvKNRUwvhnEmNKWgW0sSveB5J/bmDLMLME0HGVpTYYPedCVu+7R721ScnzypnjsdFl3w6lShGfulrtBa7Quy+qWTCRud5vGZ7Dvi20m9MelZdpUjfaS84vhd6k3pL2x2TNVMVDSuQsJW5LN84AH/vQX3hOoINqX+KLjXz4fpsSMMu+b25KEoa7Ui+xYeokprbvRx1SCOhUf9CvDj3qf8X0pTg5uzntXp5vYoz6u00DPmEpas+FczsC0wKWCn0WkDcI0vIhxNEuhkudbAktz2c+70sEM0c4xLOLa2/EnxjIP4o6DcDG9gj+6EDCDZLxPPQ+5/va+oN3SH6BT+9JEDHoqWztx9R1A1JLFinDM3cJxsLJRt7cW3jw/SB3SBTSkwT6lMkHF+fuO4tts6fehzAAFN4gDlFPfgk3ss9WRvFm7OqiPZEwpjCV8aUWczTze7ZKavOpXvUIobrNCjuyVRB9vVADSmPJVy3yE9K82xshI8dcSZ6WSaH+Ar0EwDO0t6J0eBh8sj4UJPnAWjeC8Hau82/zk2Lby+CF0GJqf7wa27g4si4hV3q/qHhkXbNjek+rMqDnRp5l7uwhiYO+edMsQIfSfVB8wTskNmyNz4Hp5WA+zhhmShl08OMCw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(5660300002)(38100700002)(54906003)(31696002)(186003)(86362001)(316002)(26005)(64756008)(8676002)(66556008)(66446008)(91956017)(66476007)(8936002)(53546011)(36756003)(2616005)(110136005)(508600001)(4326008)(66946007)(38070700005)(71200400001)(122000001)(6512007)(76116006)(107886003)(2906002)(6506007)(31686004)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Sk1PY0swOTVrVDhLc2FQTlpPTUNsWjhGQVRMTWFNajBmL01ZUnJiSHlVa3ox?=
 =?utf-8?B?dWN4by81MnV3UG02U2JvMlExUUd0djBvM2hGVHNJUlNWa1NqNXJlN3dJQXpq?=
 =?utf-8?B?U1VvUDdrTWtrTWxGMWRHVDNGTm1ySi96K0ZjbzBVcXY5cEVpZWFIaEhxUm1t?=
 =?utf-8?B?QlJydFFUMUVhSVB5aCtDc09vVXhwL1RSdVBQMEdsK1FSVk1KU3NrbTRzRFpM?=
 =?utf-8?B?OXFDT2RHT0U1OGVoeHBWcE9KZXQvNVo0cUM3NysrRVBzRmpUWWlYUHdScWZ3?=
 =?utf-8?B?SG5wK3pTa1h3TGdvNzFvRW42Zk9QZm1KN3VYTEpncXI3VVBrU05Fc1dhbXU0?=
 =?utf-8?B?eXFQUVpuSHBzbXJleWw5KzM0T21MWUU5MGhZcjBockdHL2w4OXRxUUxZOWtV?=
 =?utf-8?B?YmFGeTZVbEdtRU5kdS92d1lkcFp6MlR0L05jbmFhUG9IQ25NbjM4dGpkSkkz?=
 =?utf-8?B?OVhqMzBQZDN5QllPSjk1TEhJcThHNTM0dTdoQ2xDZlhpY0hwdjF0UnI4OEp2?=
 =?utf-8?B?RTV0YWE2VlRhZ0F3NmtzWENSazNURW9XaXg2TkFxcEIremNSWHVxYkdFNkor?=
 =?utf-8?B?MUFxRkMzckl2SVZWNmN6bDB6Nk4xUUpHUVZlV3pQWTY5c3p2TTVMNld1UkpQ?=
 =?utf-8?B?QjYrUlJPQlNPUlA3bXVtQXpxMEZOQURFVGNsaG1jN0RLd0VGc0IrU2ZVZUhk?=
 =?utf-8?B?dlZGMlZ5YTBJelYyUlZGeDZPUHBnSTNxZ2dCOGdINUVFRk93ekRTYnFaR3B5?=
 =?utf-8?B?ZldIaUlPdkNwRGFVeWs4ZnRGMTdvL2VaVkZwc21pSE1PcUkvc1ArSUIvaThh?=
 =?utf-8?B?UER0eGt2VlhScEtKWGJWQ1l1ODE2MkZYYmR3cHROYVp4LzRSckZWT3liQTdC?=
 =?utf-8?B?YW51U1N3MUZaYWp5UDhmVHhRSGJCdHdRc0dhamR2UlI0cmxTMWNKc25ENzVO?=
 =?utf-8?B?YnV4S29aU1lQdkJSSEVXSnpkSko4Z2cvdHhHdVA0MUtvcFdLNERVRkpVRFh5?=
 =?utf-8?B?QWtpdEE0MDQveGY3NWdUajV4WlJYQWRHSE15ZnJmVWVqbTEvNFUybXo2T2tP?=
 =?utf-8?B?ZjRKa2oxSk9PZ2MwTmdjVnpwNXB5OUI0T1pqWStsT2syL0dVcWxud1FKZVF3?=
 =?utf-8?B?dFV0QXBhKzNhVU9yOE5meHc1NnNoT2R3ZlZ3WEtGYXJucXYrS25IVlNHemZm?=
 =?utf-8?B?R3FEYmRQSVIxdlF0VmplOStxcmxlMVp2aUhYaUFnZVBBZnk3b0FQOWFtcVk3?=
 =?utf-8?B?Qm5uTzBueHNiVFcwOWRGTXRiU2VyOFFKWFBDVlkvTHJuaHhpWmNXRkF3RU54?=
 =?utf-8?B?aFV0VDBTSGYvUkFLQnN2N3JLSkIwaGZqTS9lSXl0UEtkeGNYNWpOdlY1Y1Fa?=
 =?utf-8?B?M2V3RlRyVHZHRitxNjJzOEl0WlQ2bGRJRkpXM3B2QVJZNmhwYVRsclRZRm04?=
 =?utf-8?B?THlENXpqUHJabkNYV1p6UU5ET2ZHNUdWbnV1ZjFwZVdkREN0WjNVbWNZeDlk?=
 =?utf-8?B?ZTgzMHVhY056K3E1bXNwc2tNeUdGWG16SE03Rkc2R2k1Mll3MWtZU2E2TzFB?=
 =?utf-8?B?QlFVcWZxdHJvZlJqSCtodnhYeVdnWHoxaGVNeDZ2MG1mY0xxSzZzMnJzK1lW?=
 =?utf-8?B?eTl0YXJvRkNHdVFCb01BeG9MUFRlajVlWmVkc3AzbnUvQUx6Z21IZnN6NG1B?=
 =?utf-8?B?YWpQWVVUMXg2U3hrbU9ybzFTTzlFZGFWazc2NnJDWW1hTnZRY3RhcFlKTUF5?=
 =?utf-8?B?NXJGa1BUaVU3RXM5UkZld2lMSiszdHRwamhHQy9ESVN0eWcwMnFuZEJRSlpO?=
 =?utf-8?B?OUFpL2JVQXdhWTNhdEZhYkU0TExQY1lHOTdKY2FGdm45MS9jcVY5UHBvNWxX?=
 =?utf-8?B?MUpMV1hPMFF3VVRXazJMOGFhOGFUdERENVpyYWxDcFJTYXU5clY5RGFRVFQ5?=
 =?utf-8?B?MlppaUZaK2lCWHYxcFU5N1NRUExsRm9qUzA1eWVmbnI1WHRqOFFHV2FqR2xs?=
 =?utf-8?B?UHhJYWFOVjEzM3pEbWVJcXFLQzdwem02YzF6UkcyOHJxcDlhWFRjNTREQmlj?=
 =?utf-8?B?ZkF0N0dRYWlGU293ak1kSlJUeHUrZXRocXArTnR3R040WU9mYTBPU21JU1JV?=
 =?utf-8?B?NUxIR3RYWUx1N0JvNmx4Uk9aYzVSSThxQmc0dEpXMG00WExCNE9oMjduOFZK?=
 =?utf-8?B?TG1nclBjcTFOZGZiMVUvUmR5Uk9BMGRKWkZkaThlMW0rRDc4TXkyaWVFNlBH?=
 =?utf-8?B?d3hSZS9NcTdoNVZoRnA0WW94ZUFRPT0=?=
Content-ID: <8E5CA8F9EDB7C54C843C047434163762@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33e020d7-8e49-431c-7720-08d9fb74e9af
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2022 11:16:20.4223 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0pqQgquaROimTAMgOGL/VelgMkLMXaJ55H7yk66N7Zp2c4Dn4AzQEO6FTwHofn0S12C86rgUozEfUsZ3L7WGZkcuAXf7Dqob6VkqA91ClD4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_031627_223165_E096287C 
X-CRM114-Status: GOOD (  19.38  )
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

On 3/1/22 11:56, Tudor Ambarus wrote:
> We'd like to get rid of the default_init() hooks to remove the spaghetti
> way of initializing the flash. set_4byte_addr_mode() is called after
> late_init(), it's safe to move where this method is set.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/macronix.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> index 45c2f2c50e56..3d0e34c9410c 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -147,11 +147,16 @@ static const struct flash_info macronix_nor_parts[] = {
>  static void macronix_nor_default_init(struct spi_nor *nor)
>  {
>  	nor->params->quad_enable = spi_nor_sr1_bit6_quad_enable;
> +}
> +
> +static void macronix_nor_late_init(struct spi_nor *nor)
> +{
>  	nor->params->set_4byte_addr_mode = spi_nor_set_4byte_addr_mode;
>  }

Meh, NACK. Actually the entering in 4 byte mode can be retrieved from BFPT[DWORD(16)].
So when flashes define BFPT we should retrieve the method from there. When they can't
we can add late_init hooks punctually for each flash, but not globally, per manufacturer.
So setting of set_4byte_addr_mode method will reside in the post_bfpt hook in your case
because the flash defines BFPT, but in an incomplete way. But this won't change the
behavior, no need to test again Heiko.

I'll clean the entire default_init() thingy and the setting of set_4byte_addr_mode
method in a patch set, probably tomorrow. Until then others that are interested can
review the other patches from [PATCH v4 0/6] mtd: spi-nor: Handle ID collisions.

Thanks again, Heiko.
Cheers,
ta

>  
>  static const struct spi_nor_fixups macronix_nor_fixups = {
>  	.default_init = macronix_nor_default_init,
> +	.late_init = macronix_nor_late_init,
>  };
>  
>  const struct spi_nor_manufacturer spi_nor_macronix = {

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
