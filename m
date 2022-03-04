Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6030DC433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Mar 2022 07:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gaYzCvQVxyIU19c4S9E7FP7ECSXpRToK1jChCFeIh8c=; b=lMoRfH23CnKSYf
	8bUPPBm6WnpGu1QpwwPzxdOTdxXuD6mCIpZSjpyOScuWe0PFBEpocCN+b+A5CBhVTwx44NQXM6kh6
	Wq45pFtU8HpWa1rrg1yCMT+GVe0qSkQAZbGO9HPGVcX3X0efmoxd/FVryT8TFRiYmF8dSRtq+Dh6d
	KTfeHxPYM+c3wWwLsirPUZYpeBImRs7RWioB2lf5pHcFZjsYDJj/IFo2gEz9Ihp9olcv1tUwOahCR
	fGnGI1Jo8HKlxW017+fLg/DaLXdpWRrYwVrLr2luOu7ugBWpIX/UeyVdZwJkJMoWwcyfQYdeKr9Pt
	Upc+8NeMoEqq/WriOaug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQ2Se-008mpt-SE; Fri, 04 Mar 2022 07:34:48 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ2Sb-008mp3-S1; Fri, 04 Mar 2022 07:34:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646379285; x=1677915285;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=7djVDIvqH7i6opOWObTLkFxNIeHy8oBmwjrZjN8xM6w=;
 b=iguDnvhkuC+Fceql4VgAj7Q3Q+jvoubsJ1c0yP7Xpb4s5t0IY4oENHWa
 NwiOXR20caXXcUFIORBLPyk32jDFdJ60CDmQ307uVgM8D6zIywQjGD+YG
 FWh3yCYuVlcUA/nwcRR3MUcZ4XDbep/CiKJvgBlYOrLV35BLmoMQpIzFR
 kaT0ZnPy8W0UJctGADRutRRQig6iQCNM/im1aa2782tgeDrPoWihK/rpL
 N0oOV2qozyPoPdRR665kfh0z3h6HHzySRUJRlJdHn/yZkJBRGiXhCY/X+
 bbDBxPLQ45yvJwXzrJk+fmj9pyykYM1PhjMEiI6S9lFQkoS87M40+6ySY w==;
X-IronPort-AV: E=Sophos;i="5.90,154,1643698800"; d="scan'208";a="155697645"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 04 Mar 2022 00:34:45 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 4 Mar 2022 00:34:44 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Fri, 4 Mar 2022 00:34:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=caLjam2Nl+IQ1zUyQNaZNPoa3WM4xOekaQQLJSSijFAjjR1eJEwXw9/K+2he2bGd1yPYaRKzpIyZ1ohj7bY23TbXZziWiaMapp3sZKpEQwS/vQojSu/6Xu8/+XWfop7YRHr5O/YA6RzzsTuQFEjSmYTm4KQMHqK4/LcUai2bBpSzKZUSUgRkKgNL77MtCXvMa07ksUwhahuycELnjAdNpQFFCw/Ztx4OuQqhNqtwVXNZodBUvPSGuAI7qndx0HFvI2ZVjXrdWXD3alVXDs5pIrDWtis1dUZWC5W/225UcXt6/6HQMyTE7axX91ckMLsAZYpBOmN1aqzveyeIjOq2zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7djVDIvqH7i6opOWObTLkFxNIeHy8oBmwjrZjN8xM6w=;
 b=hPvm/eEs3bVVzHDhzmgw+31OEIdrDS2ehLK3qnEYBNWTfnFu9UzUeY694ao/NxW2fkDpylk3YrSTtGurzG03jGpmb65qIdlQf2T1bDTLnGZxKjjiwdncVQkdyttiiPeIyIO1OcjOWeKrbgPW+0dIbX4C7YwtO7HndTfHf+ilfxRKEZK46Mm/u1NAFpkmTATvhady2M8spb7TBNqzQAS6lwLysltt/L6ITEWsPCGwR+nLnH3NAGKqzFgcHFFKKE2rnE1ORZbvAHlrwqdtAih/kzMwZsxuSg0TX/wjJVtGJDUJJ1Zzbee7qPsV4qn36EVmCcU/JiV0GP8wFuB9QviR7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7djVDIvqH7i6opOWObTLkFxNIeHy8oBmwjrZjN8xM6w=;
 b=vdWQhdMmdUTyINc8Z/F3ARM+Z0hKkO1u7wquLNbFbwob3Gdmf0JXQJOFjN+7e5t+ftZvZAocIEFkBJc1g5jenJI7NoerVd8GY+X//dKiT6d2aC/dLMQMorybVksmFr9/W9kNpNOpq1haF7265c3TVsVhD66ioPs/8m96nyxGTMc=
Received: from CO1PR11MB4769.namprd11.prod.outlook.com (2603:10b6:303:91::21)
 by DM6PR11MB3018.namprd11.prod.outlook.com (2603:10b6:5:68::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Fri, 4 Mar
 2022 07:34:34 +0000
Received: from CO1PR11MB4769.namprd11.prod.outlook.com
 ([fe80::6d66:3f1d:7b05:660b]) by CO1PR11MB4769.namprd11.prod.outlook.com
 ([fe80::6d66:3f1d:7b05:660b%5]) with mapi id 15.20.5038.017; Fri, 4 Mar 2022
 07:34:34 +0000
From: <Claudiu.Beznea@microchip.com>
To: <xiongx18@fudan.edu.cn>, <Tudor.Ambarus@microchip.com>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <bbrezillon@kernel.org>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <yuanxzhang@fudan.edu.cn>, <xiyuyang19@fudan.edu.cn>,
 <tanxin.ctf@gmail.com>
Subject: Re: [PATCH v3] mtd: rawnand: atmel: fix refcount issue in
 atmel_nand_controller_init
Thread-Topic: [PATCH v3] mtd: rawnand: atmel: fix refcount issue in
 atmel_nand_controller_init
Thread-Index: AQHYL5pLEMe6gY2CE0KrCTWBdGszmQ==
Date: Fri, 4 Mar 2022 07:34:34 +0000
Message-ID: <ee00de10-2970-6e58-601b-4898bfa1c452@microchip.com>
References: <20220302132758.3820-1-xiongx18@fudan.edu.cn>
In-Reply-To: <20220302132758.3820-1-xiongx18@fudan.edu.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9d2b33ff-2950-4724-879e-08d9fdb16de9
x-ms-traffictypediagnostic: DM6PR11MB3018:EE_
x-microsoft-antispam-prvs: <DM6PR11MB3018E870B2B93C2CAB55207887059@DM6PR11MB3018.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9JVIvgbWJ0yXhLQsqRKBF39b7qhEToZ0x22bbJ+Fv0qEyaQfPG0JZBis/SMUISiyeLIAj3dJXT3+uqO5GuJPXtLfGkH1igYfWB6pecMwdi9UWqV7I2OdsS1GcxYrVWleGPC/98UYMAsWfKb2VU6q1qUe7G6GHOUTdXft10vHBsal7dVR0TKxi8KDYuQYPbSDsh3TAQtVbvNfO3a3odsvcbG1nh2DujcSPN8dbRv3qIFOm+ahi6zfxThE8slQXhoTCbxF84BWNK8NMbkboQ1mUGgBdNn/+S3+AGfq6tejbKY+br94bGb7w/VP4n7Wgc0UWWYrp2qfa6u2r3UvURl//huTPhvl+abLJ2Pi2HW+LjicmxqcX7vSuWoMKe9upH3O5QKaAK0k60mUO1mNcgCaofS8cC2sv0L+82Gk/qbrYleGpg3lVj+Un+DF8P7Z1e42KsWyePi0CUI7OcSF3Ji7+hy1yIyHnnKxTF8zpNx6HbKOV9J4g+XcusA6of7D0xHTNvoinBVKuRwVONjhcxGVUQvfq3s5wNYjgBq4LDDRK/2mGrm6c1jyuxVfoWC6KfTcG8jdtT0fS/ODrLQahYZ13w+TRLw2hNlvvkm00XR/hMh1pxUV2rqNBuf101iRzk9+k1rIvncbQ6d4MXdoAEDLfHryrr0a3Uo6bj/MmT+xh7S+ZOmvINjO2PokwrD7OzF+B6IKlDOv7rfOcmkmep7DOZqdWHJ+rD5pAle89JavnY/CdGPJehZxCsS+oaSRMBxm317e6Ks5cUcEPo8kwfsQNpo3WEnsPyxrfHakpSyTG+8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4769.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(53546011)(6506007)(921005)(122000001)(66446008)(186003)(26005)(2616005)(83380400001)(54906003)(6512007)(86362001)(36756003)(31686004)(66946007)(64756008)(66476007)(76116006)(71200400001)(66556008)(8676002)(8936002)(4326008)(7416002)(31696002)(38070700005)(5660300002)(91956017)(110136005)(38100700002)(316002)(2906002)(6486002)(508600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dThTYzZKdi9KNlg5Qm4xdjd3MDdpYUp5Y1AwUStsaDNXNGV4Q3ZsWVpoQU83?=
 =?utf-8?B?TU9scGNmamtnak91OW1pNnBjUEpiZEdCZDBsRTJjTkFKY3NxMGJ1SVRBZ3lh?=
 =?utf-8?B?SUtELzVPM0tlRW5lcUsxVUFGcUc0bzVpdGNzZ0pnendUNmZ0RGpEb3BMSldo?=
 =?utf-8?B?eU1nT3FOZnlmdDRsWVdHWndHUWc5eStCVEFyaklYMEx6UmtpQTBPQ1o5MzF5?=
 =?utf-8?B?WUdTMUFuaHdPYjRsbUlYeWI3TWs5N3NxTXZGRnUzTGh4Q08rU2JnaU1La0RJ?=
 =?utf-8?B?dENFbTZlN04xQTNKbkIwcmR5V0ltaGJBZy93dE5GVE9LYTF6aXlEV1dqaSsr?=
 =?utf-8?B?MHdrWk04UWtwOE1oWS96QTVGbCtveVNCZTBtRGZTVXlsQkdCc1B4djdDWmxk?=
 =?utf-8?B?dGFUYlRyS092NkY4cUUyaEZTZEJmbG5uS3JFTk1kbG1DWi8rU0hYdktsTHFX?=
 =?utf-8?B?cVpvUEFENmR4cVlhUHc4dDBnVlQ3dnhhbFB2L0xINTd3Vm1FN0Y2amoreWsv?=
 =?utf-8?B?SjhPd2NUVmRDRmxKWDhkNG4wSllOYXJ0YWJZeE5mRWZubWh1MkFoYmNWVHF1?=
 =?utf-8?B?Yi9heThqTzErRXM4ME9OMHRTa1dGYU0wcVlrY1BqdW9WK3c0WnpVVmFOSE5y?=
 =?utf-8?B?QVpGYkQwKzk0QTZvaDJxUDRnMUJFRzBFV1MyWTlOM0U5amJRNFdaRkRBNUl6?=
 =?utf-8?B?dW5JU1dWaFF2QWdTSXdialoxYzM4eS83RTFTZ0hnQzdkd08zYUpmWmcySXJU?=
 =?utf-8?B?dHB3WkJidHh6bTY3SlZWOE1QWFlMVDZtQnhLZXNxUXpuVnd2ODEvNHZSWHRt?=
 =?utf-8?B?Q0RaV09jbFl5SmZxbVBNMFVmeGRMUXBTMGd4VXNTM25oaWR5WHZ5c0lodXJ4?=
 =?utf-8?B?aW54cDlTTThrNE9rc2JyTjZwKzhLQTBQR3RzOGt1ZkV3OFQvKzNtRW5kQkth?=
 =?utf-8?B?Q2pJcVVTYkdYTDVwQXBFdktxa1J1QU4wOWVuYzBIdFY5dnVnYlp1QkJ6N0di?=
 =?utf-8?B?NWx0aFpBM0x3djUwaTR2Mk1sL3pxTytDaFA4ZWVCRXFXaDJEaUxmK0gzMmpE?=
 =?utf-8?B?dTNrenZLc2lKZ01WRTVqSGhVdEg2QU5rNzJHVDN0eEZTek1iZkYwdWlpVzFh?=
 =?utf-8?B?dVU0STlraXRwbnFTcm9TT09tVlN5NENxNEQ5c0V4NXp6RFBqOHpOUEZMUXpo?=
 =?utf-8?B?WUVBb3VUWDNxTTdmd01JQ21jN3J5VGVqN0s0OFpNbEo5U1J3cXdkZWJreFpw?=
 =?utf-8?B?M0R5OUdiRHVnNSs1RHlWK2FiRktxL2NmOEJ1RG9jVE1OaEFQVnpJa0JqME41?=
 =?utf-8?B?VFU3aXZLVGZQdnRCcFFLMnBYcnR1eklqSWZ3ZjQ4VTFLN09LTWVVTm5iWlFa?=
 =?utf-8?B?TFpRanRXbTQ0S3hLNXIwSG5oNnVkWEtLa0c4d3g2ZUN3VmwrS0J1a1ZXOTBV?=
 =?utf-8?B?RGRKM3d1U1QySnR0Tk4zZnc3NklNV1c0R2E4S0c1aDV4dDNzU0FqVWhoVW9y?=
 =?utf-8?B?TGJETXNLeU5qZW56aW5SSXBJMEJxaDVzRHVaQXlrVWJYeW1kSkxVQlZNM2hl?=
 =?utf-8?B?QkROZWVlVE1aRWxFd2Nkd1BCeGxwbHkyMzRidjlyYmg5ajVqQXhkL0J4ZE5i?=
 =?utf-8?B?NGZCb0RCYmovZ3dUZEtqZG8vb1dTWnBTcnVNdFloVTFKNWk5dDdOOFJHS0Fh?=
 =?utf-8?B?SkU0Z2FOMXJCdXpNaGJCY0FJc2c3SS82dHBydnVobHFadWVQVGxEN2VmR0FG?=
 =?utf-8?B?ekxwbnpPK21JWmlnbG1pMFYyK2FrK3ZNUVZjb0ErQkJlUG9MdVlRV2NYU21W?=
 =?utf-8?B?aFlZTGMzWFNIbThIWm5wRENIbCttNE9jY21yL2JUQWowNXhRbFFITDBsRm9J?=
 =?utf-8?B?Smd6Y01BTDdGK3luVUtKYUw3R202ai9FYWYrb1dobFBXRllHZzJiR1pQNGhm?=
 =?utf-8?B?aDZuZ3dUQWc5dDBWWUhOdjM3TFZUdmJ1dE1TZnpya2ZrQ3dwWTZYcUJUSHdw?=
 =?utf-8?B?Mkw5ZTAyeFQ1UHVSUkRCVWpIbFMzK1h2aXJWeTRuTkFMZy9ZQ1locDBXekp6?=
 =?utf-8?B?R29oZWwvbVZ0UDNMQVg0bHJ1emp4TmNwMjFNVXRSTmZZWXRsYmZzRjcwd3lF?=
 =?utf-8?B?RS9kOHlqdzRHMkZEYTNaUTFlNXJPSGZkYlVHa2RWTlZ2VWcvb05GQkdFdWFO?=
 =?utf-8?B?ZlUwM2REUTlua1NVM1ErbHZ1cURlbzd5ZlRUK055bVhrU1B6dmFNWmI0UHJN?=
 =?utf-8?B?OEsvR2x5U3J5OHlDcFVyWWx1VGVnPT0=?=
Content-ID: <64870F2299E1D844A76DB1684DB9926C@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4769.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d2b33ff-2950-4724-879e-08d9fdb16de9
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2022 07:34:34.3289 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sDNwXvh2q2w3CVgU6ehXEkiw+f439tQ5P4noxWcrdBnZklsKDL5sOd4bPfdPLIxH5XU+3hnVpsnVHPnz6+eUoA75ruL5A/dlIaI488nvAf4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_233445_943934_62DD6834 
X-CRM114-Status: GOOD (  20.78  )
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

On 02.03.2022 15:27, Xin Xiong wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> The reference counting issue happens in several error handling paths
> on a refcounted object "nc->dmac". In these paths, the function simply
> returns the error code, forgetting to balance the reference count of
> "nc->dmac", increased earlier by dma_request_channel(), which may
> cause refcount leaks.
> 
> Fix it by decrementing the refcount of specific object in those error
> paths.
> 
> Fixes: f88fc122cc34 ("mtd: nand: Cleanup/rework the atmel_nand driver")
> Co-developed-by: Xiyu Yang <xiyuyang19@fudan.edu.cn>
> Signed-off-by: Xiyu Yang <xiyuyang19@fudan.edu.cn>
> Co-developed-by: Xin Tan <tanxin.ctf@gmail.com>
> Signed-off-by: Xin Tan <tanxin.ctf@gmail.com>
> Signed-off-by: Xin Xiong <xiongx18@fudan.edu.cn>
> ---
> V2 -> V3: Removed redundant lines
> V1 -> V2: Rewrited the error handling block
> ---
>  drivers/mtd/nand/raw/atmel/nand-controller.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
> index f3276ee9e4fe..3dc4a4bacde5 100644
> --- a/drivers/mtd/nand/raw/atmel/nand-controller.c
> +++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
> @@ -2060,13 +2060,15 @@ static int atmel_nand_controller_init(struct atmel_nand_controller *nc,
>         nc->mck = of_clk_get(dev->parent->of_node, 0);
>         if (IS_ERR(nc->mck)) {
>                 dev_err(dev, "Failed to retrieve MCK clk\n");
> -               return PTR_ERR(nc->mck);
> +               ret = PTR_ERR(nc->mck);
> +               goto out_release_dma;
>         }
> 
>         np = of_parse_phandle(dev->parent->of_node, "atmel,smc", 0);
>         if (!np) {
>                 dev_err(dev, "Missing or invalid atmel,smc property\n");
> -               return -EINVAL;
> +               ret = -EINVAL;
> +               goto out_release_dma;
>         }
> 
>         nc->smc = syscon_node_to_regmap(np);
> @@ -2074,10 +2076,16 @@ static int atmel_nand_controller_init(struct atmel_nand_controller *nc,
>         if (IS_ERR(nc->smc)) {
>                 ret = PTR_ERR(nc->smc);
>                 dev_err(dev, "Could not get SMC regmap (err = %d)\n", ret);
> -               return ret;
> +               goto out_release_dma;
>         }
> 
>         return 0;
> +
> +out_release_dma:
> +       if (nc->caps->has_dma && !atmel_nand_avoid_dma && nc->dmac)

As Boris also suggested previously, checking nc->dmac should be enough here.

> +               dma_release_channel(nc->dmac);
> +
> +       return ret;
>  }
> 
>  static int
> --
> 2.25.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
