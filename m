Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E33F7C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jan 2022 08:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IwG2YS3VAXhZNN4+ejPflM2HqtR9JqD6fW6J5CgqOWE=; b=TDgT7wb6moODtI
	H2/sO7EvieTJh9BAQxGryPgr/RfOSTh18JkxXg+eoVy5Wo5jpiVEFJgidGC2ESSACkP6d+FzUEDAE
	+Am8vb3Aufgc/KpuNZ8/QwZ8EWGFlWgKMQcGh1TEfNgmlFvYNhr3RUC5oNqIoK9p3+DVqtM5Y7o9I
	j4AyY114pm6QO6wWhSRDS4QculjdXgQWYVxsGejkTjaf+TT1ncD8tGVO4k5cZbR61tNdbLVYNmMRW
	Xd8YTRW3r2NH6V8AVVS2fkqrBuKdtmBsQKtO+IRH9ehaOOL4y2f90/e9Y888GEHklC0hsCgUhX2yx
	xeNoNzcO8mnn5g5C+YCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDMEd-000wVh-M4; Fri, 28 Jan 2022 08:03:55 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDMEX-000wUQ-RQ
 for linux-mtd@lists.infradead.org; Fri, 28 Jan 2022 08:03:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1643357029; x=1674893029;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=gZCXdJQduEhm1wYYn04LrNK0mO5UzR8J15jH4+a8CJY=;
 b=0mSIQEaGALMjaD8UGgPATKKuABsY2291btd+m7CVu0nolgOjhVDmKGQh
 OZ4G17w46JvBhVRKPqtVKCujqGp/4+58M4oQmoQYTsN2plSNwpZgPc+EB
 K31AHAtyZ+WfYgsKqgMhaYhVutdXDss/BYUzaw6fmw2Kd2eOcfa9+QIin
 8yw748X9lqnEiFmcLNqAbdb5qqPxTgoD8Fyq0cMx/5sHSReJh3bJoYw8K
 +GlC3Rd+XbZ54YwO7r6J0WJBBq+NYoRRBWrC0o5NWnmIofcdXHs5TibgG
 FBKQBzPKHNwqEMOeKyKZCqtlcXo9EhjIae4iywarAto2DIPKap9CPgsyl Q==;
IronPort-SDR: uc/J1PjrNdLa8L/FCp4DRP5k9g3UZJYTd9aOs7jyIZDPyg1MzkDMzqFuFyyN4+tdBwE8enWfLj
 9U4nCR2Du7OoEw52whzWEBXa3nal5NM2sDzxHaMQWwCePWylVSQWOzhq6AxTyrEP2SON+hqprQ
 8xPUNr+dPvJoVwil7Rf562vBxbWySSrpXI1MpYM1AEEFrCLK6f6F28EpzckFQxfRuf2F34dqZG
 9MTb+Tz0aYMrSVI32g2jx8Yaozw+6oI2QlgIJkgVEqIs6zTM4PaX8GrwSsTA3rPSTzDHG/EXAe
 uc9rViZxSp0wx3nfSjYcdPdQ
X-IronPort-AV: E=Sophos;i="5.88,323,1635231600"; d="scan'208";a="160314105"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Jan 2022 01:03:47 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 28 Jan 2022 01:03:47 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Fri, 28 Jan 2022 01:03:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lgclmpb9hZiqvy/phexfAkzgg+BOzG++tedpLp9QY2mguWR3NIZDyAuiK/gRhsvVHQPfLyxVfJjnK9PQ9m+W6tcr6HimMu3iUMFlnlaExAPcFxjza6jZrQhWCrCKxIV6k6ILBeLUbGgMAFOfkZTwqFB7vS//+kdf9RTl7SJfugfa0WlFX/ydN6ipQUZgFZuE0HncHwQNxRsAmJw2UO5RRnhwxUs8t01dUDox10D2Zl0ALF3KKnu0yu1uYPHT/bgmy6D+vAFWUXg8kIEIop232H99/3t9sczwZnv5hvqC9lSqMs5suoKECkD9RFr1Q66FQZQ3uhhKNf0/E5fQLVNAxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gZCXdJQduEhm1wYYn04LrNK0mO5UzR8J15jH4+a8CJY=;
 b=Id3WS+1WOpxbMGfT2n9MJbnFKcJFXfOY42EGhou4BS1drJ6sv/U3xsmD5/NcNEF4A9+/bcBG9ppM9IDPMsSnAG+8tcQzuERde5F4SA02tfZAjlZJF1mEN6QGAU7iN9DqluZOnJFrBO1AbjNdZxdGr4ibnz4c5DZV6O+37bjkTOwXg4Qptci9B19RyOHOz45dKIEUDLAvw9Ci0HVQf/1VntdY01GMSXclwY/OEpgkLZ3N7jdwd0p4q8Suo1qJ5AbW0fFq/sVWtfDJZAdAp9RkABWxkKhitviFggb8nlu3+8DXwWzfcCqGsXKhR764rjTESCHE4Akt+LZu2h2gaQywuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gZCXdJQduEhm1wYYn04LrNK0mO5UzR8J15jH4+a8CJY=;
 b=pKN/UVcSG0SHWaB4tkSQd021gsgQkit6qy6P5uxuSa8vLAAUUjNQyW2lO7b86whGtdayEjCQ650ArA7ROAeS3DwKRm8N/AdsV9hsdoWq1gyglIVtBlJg3MDru1AbfUsxszK5WEkYKuoeaiduTSksJ/gL25duYOQy/0ZD9LaygLs=
Received: from CO1PR11MB4865.namprd11.prod.outlook.com (2603:10b6:303:9c::9)
 by DM6PR11MB4076.namprd11.prod.outlook.com (2603:10b6:5:197::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Fri, 28 Jan
 2022 08:03:42 +0000
Received: from CO1PR11MB4865.namprd11.prod.outlook.com
 ([fe80::25bd:b3c9:a714:cdce]) by CO1PR11MB4865.namprd11.prod.outlook.com
 ([fe80::25bd:b3c9:a714:cdce%5]) with mapi id 15.20.4930.019; Fri, 28 Jan 2022
 08:03:42 +0000
From: <Tudor.Ambarus@microchip.com>
To: <miquel.raynal@bootlin.com>, <broonie@kernel.org>,
 <linux-spi@vger.kernel.org>
CC: <richard@nod.at>, <vigneshr@ti.com>, <p.yadav@ti.com>, <michael@walle.cc>, 
 <linux-mtd@lists.infradead.org>, <boris.brezillon@collabora.com>,
 <thomas.petazzoni@bootlin.com>, <juliensu@mxic.com.tw>,
 <jaimeliao@mxic.com.tw>
Subject: Re: [PATCH v10 06/13] spi: spi-mem: Add an ecc parameter to the
 spi_mem_op structure
Thread-Topic: [PATCH v10 06/13] spi: spi-mem: Add an ecc parameter to the
 spi_mem_op structure
Thread-Index: AQHYFB2QyOHe8cO4mk+ZdxB4Va1QQQ==
Date: Fri, 28 Jan 2022 08:03:41 +0000
Message-ID: <5b5f4b09-ddc1-ec0d-12c3-b4f64e7ffd0d@microchip.com>
References: <20220127091808.1043392-1-miquel.raynal@bootlin.com>
 <20220127091808.1043392-7-miquel.raynal@bootlin.com>
In-Reply-To: <20220127091808.1043392-7-miquel.raynal@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b37feed8-88fc-4d18-75dd-08d9e234b318
x-ms-traffictypediagnostic: DM6PR11MB4076:EE_
x-microsoft-antispam-prvs: <DM6PR11MB40760012D78371664DD1CD63F0229@DM6PR11MB4076.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JPOHjE5Zc5aFeP5sAZcC50fIcZcpdnfKVY7lo05OZTuzUa4mkIjpMFwc9giC+vxZbo4y6kVKpDDdXP0gGFuhHQIg+oVDBwwFqILdiVhkYIHv1HiQYC0iVhwRs7PZIlpgCEhZPn34+tl8bNb5VliDswGDOJGNo41zuRSZ76lRBLzmy68UsvyZV+oEtYLVwI/QBa+DkBJnL0cYmzE+ZxHLLjX4YwTDHCQtNTFg6+DoJETYdEs++oiVkt7C57DgaAqF05ulS2z0RyXGQoaxsKB9YU+8ZyImqSpkhkLJAXTPjJOgYnuc7CfbJK7ikEYqsKoXyKPdqaYMFodHhMzkluz/MB1iasOAZvMGqDRb+AaXsfqPEg1/v4xNz7jV5W58yWfSs/coKknmtTPER92nsQxUAy3cY1iTx0virS3MY+Ak8mPVtExbfv/a9DKgFvgoF9LscHRJ54BXuH4x5D/a+PoZZck5+HYHf7+KpFUvueH4muEsgWdyW0+aYFTmqLcHiG2W6UeZk6cLE1L7lRMYlPiQ6kBC6fpGeuTkXATJ++l2DyVQwiK+fQ91LkpqbFU5pgr0baQndgqPVmL2AuWjWupUAU2WW+1nVB1o5A+0wUDwHHjgeFkAeE2D1za/I+vxdNzmVfwG3pKCKTagulFYkZzpVL/AApbGxO4ESIPDwGWkJev0bqe2EsrapYAbwYjKAOcTuicWUDWOD4geFi/p8h5x5kmjw/5rJ/E9evHBkCof0diPZC167ezR19j/wYN980tLvQp9ljNdR57lzPZajDqywPGnnjAuLssjSdlnCJoTP0GxkPhQ9suscERyx+Qw3Ourp1TzhYHDaNu8FvADBSyN7DWilpm2h11buf1MhykqWi8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4865.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38070700005)(38100700002)(122000001)(2906002)(31686004)(83380400001)(36756003)(186003)(966005)(6486002)(26005)(316002)(2616005)(7416002)(86362001)(53546011)(110136005)(71200400001)(6506007)(508600001)(54906003)(76116006)(8936002)(66946007)(8676002)(66446008)(4326008)(66476007)(66556008)(6512007)(64756008)(5660300002)(31696002)(91956017)(43740500002)(45980500001)(20210929001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aTVjR0tZdUlYYTNDcFVnbk9HczQ2S1liekh0OUdpdFB0VXZpSDgvYVloTTJG?=
 =?utf-8?B?UUtyQW8weWpWWXp5aWt2OWpHOWNoaE8xUTdXSU9YL1lnekpuNlpMTjVmWGNS?=
 =?utf-8?B?Rlc5aS85d0xzbkxJc1l4Q1F2VzFxNGQzajZ3NW41dVlRbXJ4SmFyM1hpd1Fr?=
 =?utf-8?B?TWV3TmhJRHNBMXdabzVvcVFyUFU4bnpVNk1ZSWRmbUJrMkFPNkk0MkhGanlO?=
 =?utf-8?B?WU9ONDZpbGNiVW43Zjd0Y0FQbGNKQVIxUnZCQzZwMU9welAzV3o0MjdXM0Ir?=
 =?utf-8?B?Sy95Mk9kYXNIUmpDMDkyTmdyRFF0QVpNeHMzOERUVzJYOFMzSTE1eTRQM1U1?=
 =?utf-8?B?NTN6dFhRVzE2dTh6WWVkVG8vRkhqVjVEcWtmTnNSd2lFTUhwRVJpYXFFc29M?=
 =?utf-8?B?VVQvRjU1cXNzb1c1aFlYY3hNZTd4UEMvVkNKM3MwS2ljQWl5aU1kOXBudm1K?=
 =?utf-8?B?TkdIYUdZTGI4TUdwMXpZcHBBMEFkMmd4UGp2aGJwYVlTbDlkRW81dGhyeUxP?=
 =?utf-8?B?R1NlNmRoNTdyK3NKL2VYU0lEdTJ1SUVvUmNkOU44Y2xWdUttZ3Avd0Y4aVBW?=
 =?utf-8?B?TnJER1ZKaG1VWDJmMmkxUkc3R2NJNkMvcytVYTZzY0tnQzJNTE9hRjhTVXhr?=
 =?utf-8?B?YTIvR1ZxQ2g5MFdKcFZGVWh3d0hSOHF4U0lJVnptbmJmZm1HZGwwbUxXcUlW?=
 =?utf-8?B?N2FPZ3dGNEFQcnZEMlMzQklmV2JLbUxjaSt1T2wwWWJwdllSQTFPc3hXVTJO?=
 =?utf-8?B?MUdOUjNSZ0FMNGRHaHFlejRQK3JyeEZRM2xtcjc0dENmYlhTbTFuKzFITzdv?=
 =?utf-8?B?aHlBcXA5V0U0THdRS0M4N2I3S3FDZTZQQmhYWnl5QjBvdlphR3pLbXEzRVFS?=
 =?utf-8?B?cFBxcVA2dy9KRGdxVFRmdDN2QUlBN3hHZ0Y4SXl6ZEtpMlBxZm9KbWYyaHNS?=
 =?utf-8?B?RzFiT2V4ZmovWE42bGlkZElDQnNVVnNGTEdob00vbFNVdjZaNllESmVabGRQ?=
 =?utf-8?B?U3lrc1RhVHllb284MXplcEkwZnhUU2J3NjBvSk9wS2toQTk1L2wxdkhNcW9q?=
 =?utf-8?B?UTRGMWRWeGtDTE14NXRJR1YyZkZ6d0hBK1NXT3crcXpRbXppVmgwQ292UUlr?=
 =?utf-8?B?SzY4OVJWOXRjOUcxbjdObnhSRmFadFJLUi9qUmQ3TmNSNG5LK2oxR1AvRGc2?=
 =?utf-8?B?MDZac0VQSlpLZ0oraXk0MlRaQ1dqbTE1YjBxdFJHRXZZKzZyNW02ZCsrdGty?=
 =?utf-8?B?MWhFNkkxT0grNThFd1FMNVlobHVPSGFiVXBxTHFoRytOVkQzdCtCbnJlN3pQ?=
 =?utf-8?B?WW1IVSs0Sm9pZUJMVjlXTjNLaURxVDJLSzUyOGgzcDFhU1U5OWFKZmNUZTVp?=
 =?utf-8?B?UlFPcWNoOGxuRVNEdEJ5MVRoS0dSdUxNTWQrL1dJWU9tU3N3SFdDRHpxbDZl?=
 =?utf-8?B?MitMNXFhV0JNQjRlcU1VVHJoSG9EOTBRQ21aemhrM2NVMWR4WjE0NjgrajA5?=
 =?utf-8?B?ZnNvcFFnYlVXWnNkRzEyaldmN3V6YXFOSTFJbzlWdzJiWjhtRlh5TWtjajBy?=
 =?utf-8?B?R2wrWjZLM2g5QkpZUDBqS2JxVFJpWU5IVjlvb2xBdDQ5OWcrWlR4anBLY01H?=
 =?utf-8?B?UytaRTFnTW5ySGR4SWYwRHBqUld4aTlKaEJZTkY4ZVVwbDVzRmYyV2xvMVY0?=
 =?utf-8?B?b0FVa01RM3B1bHAza01Xc3pZZ2dlVU9vUnZ6VHk5NjY0K2dsdWlUazVxYkd1?=
 =?utf-8?B?MGUzaFRlTUhYQUxJZmk5RnB3Uk5BQVhTV3ZvZnJJVjVIcEtFaEM2N0lveGd4?=
 =?utf-8?B?MGh3QjJTV1lWaE9aYmlUNlRVTFhMS0xOZDZudEluZFZnb0M5RzJIQll3Zldl?=
 =?utf-8?B?M0YrV2JmZWV6TVZGNDVqY1d0Tkdac0xSSFJoQm53SzgweWQ1SmMyZ3EwSVZz?=
 =?utf-8?B?TlBvQXNWdXZTcWVIMnlwanVFVGVXMzN4VlNIZ1RQN3AzWERKa0xEY0V0VnAz?=
 =?utf-8?B?aDdMaWVxSUFGR09JaWV4TmczVWp1UHo5dXFaQUZyR1IrSGVBaEpkYmkwREw0?=
 =?utf-8?B?b1VOQmpBRzQreEIyMlZxdk54OEpSaDZ6VjdVUXFYTm5JWDJoTzZKbEE1MC9X?=
 =?utf-8?B?MGh5SWlZU3FLQ2pqWW1mVGdtRHBtS3NxUzUrL09kc1IrSlR2VUxXTUdPdHpX?=
 =?utf-8?B?eU1WVHlDQkxaLzJlYWJRb2xHMU1zYlZySHJoY0ZDZytoR1BFWmxRd3pwbFZV?=
 =?utf-8?B?UFRTb3MzNUxEQUREY0dMQkZVQ0lRPT0=?=
Content-ID: <0D96822FB907CE4D9D17A277FE0E543A@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4865.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b37feed8-88fc-4d18-75dd-08d9e234b318
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2022 08:03:41.9586 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dSOgIc6Frii2llFEKc0UU4/prwGk7v173agmc0OWmp2xgRLCZIAoy2NpulFTVfUXaNflwH5y6p8XBYiAgboyXKGS0v+T55lpeAv7fui+UJw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_000349_989672_0D3601C4 
X-CRM114-Status: GOOD (  23.94  )
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

On 1/27/22 11:18, Miquel Raynal wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Soon the SPI-NAND core will need a way to request a SPI controller to
> enable ECC support for a given operation. This is because of the
> pipelined integration of certain ECC engines, which are directly managed
> by the SPI controller itself.
> 
> Introduce a spi_mem_op additional field for this purpose: ecc.
> 
> So far this field is left unset and checked to be false by all
> the SPI controller drivers in their ->supports_op() hook, as they all
> call spi_mem_default_supports_op().
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Acked-by: Pratyush Yadav <p.yadav@ti.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Link: https://lore.kernel.org/linux-mtd/20220104083631.40776-7-miquel.raynal@bootlin.com
> ---
>  drivers/spi/spi-mem.c       | 5 +++++
>  include/linux/spi/spi-mem.h | 5 +++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
> index ed966d8129eb..f38ac31961c9 100644
> --- a/drivers/spi/spi-mem.c
> +++ b/drivers/spi/spi-mem.c
> @@ -178,6 +178,11 @@ bool spi_mem_default_supports_op(struct spi_mem *mem,
>                         return false;
>         }
> 
> +       if (op->data.ecc) {
> +               if (!spi_mem_controller_is_capable(ctlr, ecc))
> +                       return false;
> +       }
> +
>         return spi_mem_check_buswidth(mem, op);
>  }
>  EXPORT_SYMBOL_GPL(spi_mem_default_supports_op);
> diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
> index 4a1bfe689872..051050b40309 100644
> --- a/include/linux/spi/spi-mem.h
> +++ b/include/linux/spi/spi-mem.h
> @@ -89,6 +89,7 @@ enum spi_mem_data_dir {
>   * @dummy.dtr: whether the dummy bytes should be sent in DTR mode or not
>   * @data.buswidth: number of IO lanes used to send/receive the data
>   * @data.dtr: whether the data should be sent in DTR mode or not
> + * @data.ecc: whether error correction is required or not
>   * @data.dir: direction of the transfer
>   * @data.nbytes: number of data bytes to send/receive. Can be zero if the
>   *              operation does not involve transferring data
> @@ -119,6 +120,7 @@ struct spi_mem_op {
>         struct {
>                 u8 buswidth;
>                 u8 dtr : 1;
> +               u8 ecc : 1;
>                 enum spi_mem_data_dir dir;
>                 unsigned int nbytes;
>                 union {
> @@ -126,6 +128,7 @@ struct spi_mem_op {
>                         const void *out;
>                 } buf;
>         } data;
> +
drop this extra blank line please

Patches 1-6 are:
Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Cheers,
ta

>  };
> 
>  #define SPI_MEM_OP(__cmd, __addr, __dummy, __data)             \
> @@ -288,9 +291,11 @@ struct spi_controller_mem_ops {
>  /**
>   * struct spi_controller_mem_caps - SPI memory controller capabilities
>   * @dtr: Supports DTR operations
> + * @ecc: Supports operations with error correction
>   */
>  struct spi_controller_mem_caps {
>         bool dtr;
> +       bool ecc;
>  };
> 
>  #define spi_mem_controller_is_capable(ctlr, cap)       \
> --
> 2.27.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
