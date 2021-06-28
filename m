Return-Path: <SRS0=3VFJ=LW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72FE6C2B9F4
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jun 2021 05:57:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38377613EF
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jun 2021 05:57:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38377613EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/n+5GGIzYxrmzsN+SIy/VTsUVyK9VblVCvCD8H7VeRk=; b=jUVh09YtmsMPb2
	anEd4AOqS26aJM0Uc5g3GOLTOL10yD1hlNh6+mhhpIZE2HrLI5Et0XNCLcfROQrcww/CKmgJ91EIl
	b3Zk6Mvx1fCXRbqutTa5Nh08v9adU8UZw2rppkPUv+95Hjdx+/2WoJ1e8wucICoo6IxCmbcMvL1bB
	AQnrWMsXb91Yc+EXrnNcaZHZP8ZaoHcWyzLetlWr66Q8jFtCyZnphmEh3GvNxcq6yos5Gto1G+YKm
	sE8cQzKzgX1eXZM/U0g4SyA/eZL/ss88FFoO9sWFavDosJJgO+apMMyWoZ0rYi4RSef0VU5B/FJwt
	7JTQehQE5il37WNQbzUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxkFo-006uTl-LN; Mon, 28 Jun 2021 05:56:20 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxkFl-006uTA-07
 for linux-mtd@lists.infradead.org; Mon, 28 Jun 2021 05:56:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1624859776; x=1656395776;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Dm4keljnAAYKXrNYfHVpzqYA4tuDFokwmPyAbYuNO+o=;
 b=VB09WmmoBGwlgArsHQnCH/H8Kl12MxFmojh4hTcv8kYg3Abv5GwCbpcw
 KYFadYKIH16S6oJZdE3KUTmkRQeME+zleclXA6wCUKfwycs7M56hEBrwi
 Gne8zQLzOSqdIPN3lqMjni9IQnaQLfysVK3FlSFRb8A0xgM0+xpWuGT71
 /WAGiWGAQAdy5DAx3Hyh6UyEa/05ASGLP8SGAjE3KbYPdGOYAmIy7mLX/
 qFARjXiCZb+EuB84ekfgrlt0A6YAppYAhGm0GK/QWjqgrRgAqcMLQsD+p
 xw5iSp1MgBO1wNEjwYoFI9/NGsx0M+Vuec//g2QPIdlxZkvcopr5Af1o6 g==;
IronPort-SDR: 0nOXHmzD/tbbesUmJOoWl9fs1kJx0m+2gmufNJA3+FHsuL3wda7f2Y4FmCVSZ+vZLDQC6jG3R8
 1o/Og4VSJTkF1ZoLSTGLuT+IObUVzY5VXEcTJZKjvHl7MNnVUZs3Cp2yM9wG2DbAk+T5321bJM
 5qNtfDYUmw/02ro+mIt0noyqIS8IOHmkGrUdxkM+wZfR/WD26dxVEsxdF5C7ZtIFRf737lH1cH
 lGqjof+vWd+M1BFYq+V7JZEAQGwRiFOTAm7sutH52MDTdlG/3yTyDSL7xy5fw9uU/fdIMBlcPU
 E4w=
X-IronPort-AV: E=Sophos;i="5.83,305,1616482800"; d="scan'208";a="133706564"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 27 Jun 2021 22:56:15 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sun, 27 Jun 2021 22:56:06 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Sun, 27 Jun 2021 22:56:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MkQs3bttvBJRH15/54LRp5b5n5N8hYin1ty1Bo8Nvf9I8YZDCESS5M0VAzlOuq3x6l66YsdtPQgCQvotm6FpktfYabHsT/4cPy7a9bMdCVr9/ok94d90u6nwa9T2I2jMOujUZf7ptg+yMRL3caqwKi3NcDxSzhuA1IBUwczlRyRtc4xUa1B5xVU6UPGlrj6zD6l1XLu4EQfDyUaeocDWejKKa9eVyGqwf6dDc/7cHMStWZAlVCDe9FCgljTPl4iipWvmk6cv/Ij9T/m1K/IEguT9RqMNfjIZ2UPh5X2lwmJWmoDRKy5ZowN6hnNBNaze6IKMCgpDsd+gZE87eJaI0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dm4keljnAAYKXrNYfHVpzqYA4tuDFokwmPyAbYuNO+o=;
 b=Eh8BQ4A4ovFG10cMMxs/5SoYCi5mGqS+bE6IXKsliSDgLG7Hm2phlbvn9ltUF0szj6bflkcE7jqhd/UuhIoGBbkgSw9CfOuW/Y/GSAh5gaAw5L7327QCcFjffcgbsckB9M2+D1D/OmzOmOCyQcVVFd07M46Ued7RFPBhxqdvZELoA52aWN1YeKWwykmWhCW/Ut2W7mey5c9b3GQNXWtF5/hAv9O/Hxj8SWKtOhwLPyV7rYtY0MHqzocmwl7GYh5hQcqOCw6Jjlz9SmotDD6SpVNWYaXRGAuRqcPI6QisOFLCjjQAgps6MvBpWKP6SRPWkmqKzxymS7Zp0VkDm5dtDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dm4keljnAAYKXrNYfHVpzqYA4tuDFokwmPyAbYuNO+o=;
 b=PWcNwtjib3RlDu011nO+PG1Vy1jFD9WgaCZpjHVluBw2fZ/Zd2FaokUpp/nsrVMFb13lBc+JjVxQtYjT6XVvWPCWflRPxRGzAxzI53sPWLiBHn3EhnOhf9npbmYbQMKDGHsRJZYEABpN3/OgmvnyIy3vACJNlNB/Uo/7WpHMMp4=
Received: from PH0PR11MB4869.namprd11.prod.outlook.com (2603:10b6:510:41::8)
 by PH0PR11MB4901.namprd11.prod.outlook.com (2603:10b6:510:3a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Mon, 28 Jun
 2021 05:56:03 +0000
Received: from PH0PR11MB4869.namprd11.prod.outlook.com
 ([fe80::5067:83f9:991d:2ab4]) by PH0PR11MB4869.namprd11.prod.outlook.com
 ([fe80::5067:83f9:991d:2ab4%9]) with mapi id 15.20.4264.026; Mon, 28 Jun 2021
 05:56:03 +0000
From: <Tudor.Ambarus@microchip.com>
To: <macromorgan@hotmail.com>
CC: <linux-mtd@lists.infradead.org>, <vigneshr@ti.com>, <andreas@rammhold.de>, 
 <figgyc@figgyc.uk>, <richard@nod.at>, <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd: spi-nor: XTX: Add support for XTX XT25F128B
Thread-Topic: [PATCH] mtd: spi-nor: XTX: Add support for XTX XT25F128B
Thread-Index: AQHXKfj2Ve6ILG5rqk67W5iaVE1elQ==
Date: Mon, 28 Jun 2021 05:56:03 +0000
Message-ID: <0eb12da2-72f7-0c12-e03c-ea152e37336b@microchip.com>
References: <SN6PR06MB5342C82F372F37FB8E21B327A57A9@SN6PR06MB5342.namprd06.prod.outlook.com>
 <9930cb45-cd30-9cc5-c099-7cc547ec60d5@microchip.com>
 <SN6PR06MB5342947DCCA76AB0F4EF27BBA5779@SN6PR06MB5342.namprd06.prod.outlook.com>
In-Reply-To: <SN6PR06MB5342947DCCA76AB0F4EF27BBA5779@SN6PR06MB5342.namprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: hotmail.com; dkim=none (message not signed)
 header.d=none;hotmail.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d0cbea6c-713c-4fc4-c102-08d939f96a0c
x-ms-traffictypediagnostic: PH0PR11MB4901:
x-microsoft-antispam-prvs: <PH0PR11MB49015175AC8CF711163D08ABF0039@PH0PR11MB4901.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: I4MxkRgaEOu/3cD610B39clwcB1eGKqQ5V4BogiyPVMAl7wyZKWUgpWHyegEg9aJ31azlFx+8Tom11DHNlLjIw4JhOGby4VhaFNIfEFbRUUoBy8CQXJYbhS8fdPDFlPWb8wYX2Mwz6XwSjy1opgcbcrKHyWCn7EcsH5JVz+fwRAHazkCmT42AJbkpL3KXM4dBhUtHfpjwncgJ2X6Ra+ohk7kyFjFe1Cdkxa0E4SV07azWyc8hesnWUTz48YqXtCBL65WbGfEmIK6g8TXcNeK+Z3F6DVbo3t10lS8UnD+bLqEFQR2oAKhugASzut++878/AUX0RMjC4HQoER+0XV5UFFBS9urDrvRS9FP/0FZjE4qj1bfxfBMUgf9ZCazAZkm1NremxbcvQRzDqaTyghBeqFizMHZjaZhoExnxaH6iBnDISchpJKmHYLBQd4ypKDHVym8AJ/uYCTRsE7gyJqLhGmcCTj/bvuHOevkZihpqAEMeOyG3PN5BYldu1t2ugC0PNE8Zm5MzNhh1mrJGD9sTt0+d1OYpi15e1YhiGU44QTJsWfuctPl9GS33/hehCx3dKrMSeVYmZ3gjXM6ZaE32MDaF6qJfFrYp/6/wcOEoGvTPfhzOx6gInUMbYjJgFRtJeXN33CkHyZgmKahS816aEuophwpfR4NUXlf3F89OBE/anu1HRNF8grIwORXKK6zUdIrWgxn/1m+Mo6gIp15F1VvqzyIKAV1zOxSdyBix7PQVYUOjGQN3qmugBjamwuC1U1ZTtQ3uJ2pNPF+umOLE+KRk/aa5JjOUiWZw6tWEcJj27fTgf/hwXYc9iRkYwvOpwDmHyKiLE6X+qabqjZJdqHTaY80l6lgnR8H/BZ+od796kUC26RPUDTCREMup8eSP1Nwaznbm3RkCfsCyAmyEQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4869.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(39860400002)(376002)(346002)(396003)(122000001)(71200400001)(6486002)(38100700002)(6512007)(966005)(478600001)(31696002)(2616005)(45080400002)(31686004)(54906003)(2906002)(86362001)(316002)(83380400001)(36756003)(26005)(66946007)(76116006)(8676002)(91956017)(4326008)(66476007)(66556008)(5660300002)(66446008)(64756008)(6916009)(6506007)(53546011)(186003)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MzN5V2F6K24zSXZtY25uOUl4L0JwSEdURmFXVEEvNHZKNXN0KzF0VnRjRTlN?=
 =?utf-8?B?VTl0dHZ2VXV6VWZ5cjlHd1RQRVo4QUtuZWo5TkFOZ09uT0VMSlJIZllabXkr?=
 =?utf-8?B?U1E4b1k5ZFF4WjNST0NuelNvd3BQR1JsemYrUUJaNjZYMjNaMWlIN1c0WmlO?=
 =?utf-8?B?eENvZW82MWNlbFpqOUZ1SXpwQVdHOEdxaUFkRkdkSXdLVk4vQktyMWVjblZx?=
 =?utf-8?B?ZFdGcVhhOHdWbHNrd0tOQk9aMnpFWmFOcHYrL2NQd3I5ZXA1L2hWNTlzOTcw?=
 =?utf-8?B?R3hHSXpvQ3Y0RmFOVTVGWWZpK3dlNFhNMnlURmcwSFlYVEd6ejBKTm4rWFBO?=
 =?utf-8?B?OWcxejQzd1JncjVjWFo3SG1tN1hONUhtalJ3aW1USEp6WnRFMkROdWovR0tx?=
 =?utf-8?B?T1hBRWFtVEhZRWNlRFBIWFQ2a2pCcHRHZjBhdjVIU2ZJVDBTMUwvS0tSV3VE?=
 =?utf-8?B?QnVNZHI2L2xMa2JVdVQ2STJrQitLbWdPT09aeExLR1A2TFhjU3AyVS92U0tm?=
 =?utf-8?B?aEoxcTh1MEZQYit6SGdBaW02TnVnY2ZpaTFwcmpKZmFUSUJiTXI3RGpEQUlq?=
 =?utf-8?B?dnJxTVIyWXZkb3UwWGQ4TGRWOW9zRDlzMGNGODdHNEFUTmk5T1U1YnVYOUhE?=
 =?utf-8?B?d0N1VkdScXJKQWp2WjdjZ0cyWXJOMjZicHcwYlVyanNLZU5GRnludHFTdkgy?=
 =?utf-8?B?ZjBaZWlWVVhVUS9zcmpTNDBPM1luOWhiWFp3cnJ4MFE1SG9jN3VJVXFpNGJH?=
 =?utf-8?B?Y2J4d3JnT3lSRG9iUElXMHRCN0NoYklWZmRZNyt4ZC9ialFLd0JHaS9XTHlB?=
 =?utf-8?B?eFRmWVpEN0g1U0NMUWdUVHBLKzlVb1ErV1NRRkFBcVQ2RWI1WVlqREI1QTd4?=
 =?utf-8?B?UENtWlc1VFBYQ1hjYmNQOUVjV3ZvVFM2VGxJMWFyRG4vYlhtaHdyTTNXTFh5?=
 =?utf-8?B?Vmd5WDc4ZE5WOGQvQlI2MmpseVRQendGUjNNMU43L1REMUYrc3g3V0ovNVhm?=
 =?utf-8?B?WmZHcnFVU0xzUUF6L0dVbFZaYmk0UXdJLzY4Wm5DWm5TWDdLY3JaaS9RSGMy?=
 =?utf-8?B?TEM1Q2gvVnNlMmE3bHQ2QVhoM21INm9RMHB1dTRFNjl1TGdnT2wvUnNLY1Ns?=
 =?utf-8?B?TnMrQjhNdjZPNDJpSVV3bVYySTNVNlhrZzZuS1hRZDVSUnczY0p0N05QQjNO?=
 =?utf-8?B?M2I0TUlXOXYxTy9EbVN5WUhZckM4Y1Ixa1NXMHo4WUtLV0pHMktHczE1Vmps?=
 =?utf-8?B?cCtGZVRZZTF0Mm1Ld0Noc2dFRmZDcU80VUI5QW92OUR1N0xUd3VhVk1iU3h1?=
 =?utf-8?B?MW90NHpIK1Jyc3ZGdUd2M1RoTUJFc2ZxNzQwZDI1WW82ejg0dkpRVTNmbXR6?=
 =?utf-8?B?cnA5S21aODlvU01TVTJUSGZnbEJJTkFSZjVSK2VCSWxiTTkzMno3Q2I2WFE2?=
 =?utf-8?B?UnUvSVUvalRaMmh3SzMrb09TMWQwc29YZ0RKOGV0UVZWQVM4dGFlZEQ4Sm1v?=
 =?utf-8?B?OUJxRmRkcmdQbnpydWgwRWhtUmpycGtpSE1VWWxQTWpHZW85dFYrYkpSY2lG?=
 =?utf-8?B?Y0ErUGo0TjJkSHNkdXVZcnpBRTdFUFo0WUhGNE9tMUFyOWh2S1gyR3ZNa1Vq?=
 =?utf-8?B?RDQ4cjg0a01jUEZmdDMxTWMzdCtocmpHNm1mejhEQnFaOS9jNU5QV2ozVnRC?=
 =?utf-8?B?R3lsQzl1OHJxQUV0WWw5aG1xREFCODZ2Rks2OXYxY1ZnQU5nQWtVTnF0MjJj?=
 =?utf-8?Q?GKK7thHHN7F5VcQKEo=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <F764436464191A428DEE3D92E62491A3@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4869.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0cbea6c-713c-4fc4-c102-08d939f96a0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2021 05:56:03.7361 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B/UG29H8XG4qQQeB0m/92b1sYVXovjcncRB8GX6ave1SWkN2UVzbUyLYXZNLRHegQ5lXBCL8qtYADTjL05at3y6z8hL7F4MFI3MfINm1/Gw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4901
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210627_225617_181570_70AA5749 
X-CRM114-Status: GOOD (  19.52  )
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

Hi, Chris,

On 4/5/21 10:16 PM, Chris Morgan wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Mon, Apr 05, 2021 at 08:52:11AM +0000, Tudor.Ambarus@microchip.com wrote:
>> Hi,
>>
>> On 4/2/21 11:15 PM, Chris Morgan wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> Add support for a new vendor (XTX) along with a new chip from the
>>> vendor (XT25F128B). This chip is used in the Odroid Go Advance,
>>> and has been tested extensively using the spi-gpio driver, as it
>>> is connected to a serial flash controller that is not currently
>>> supported (but the pins can be repurposed to GPIO). Read, write, and
>>> erase all work as expected.
>>>
>>> Datasheet can be found here:
>>> https://na01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdatasheet.lcsc.com%2Fszlcsc%2F2005251034_XTX-XT25F128BSSIGT_C558844.pdf&amp;data=04%7C01%7C%7Cf7133c0ccefc4898050e08d8f8101c7d%7C84df9e7fe9f640afb435aaaaaaaaaaaa%7C1%7C0%7C637532095378348815%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=SgseEt9ZbY%2BIaZdMyKLTAh3rnD5zrVqJYV3d0jAt6qM%3D&amp;reserved=0
>>>
>>> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
>>
>> Chris, we're trying to figure out how to deal with the continuation codes.
>> Discussions on going at:
>> https://na01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flkml.org%2Flkml%2F2021%2F2%2F7%2F223&amp;data=04%7C01%7C%7Cf7133c0ccefc4898050e08d8f8101c7d%7C84df9e7fe9f640afb435aaaaaaaaaaaa%7C1%7C0%7C637532095378353805%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=UJW6JeEVwwzttJ7CfhAOqGAzV%2FPyBJf%2FjWYvw6%2BUwuk%3D&amp;reserved=0
>> https://na01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.spinics.net%2Flists%2Fkernel%2Fmsg3808260.html&amp;data=04%7C01%7C%7Cf7133c0ccefc4898050e08d8f8101c7d%7C84df9e7fe9f640afb435aaaaaaaaaaaa%7C1%7C0%7C637532095378353805%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=wyMehux468x49Nb%2FhypiKif9rztptk9CJuRWmBzZ0Og%3D&amp;reserved=0
> 
> Thanks, this helps.  For what it's worth, I ran the same command (spincl) on
> my Raspberry pi against this chip and came up with the following:
> 
> spincl -ib -m0 -c0 -s0 -p0 6 0x90
> 0x00 0x00 0x00 0x00 0x0b 0x17
> 
> spincl -ib -m0 -c0 -s0 -p0 4 0x9F
> 0x00 0x0b 0x40 0x18

I haven't checked what this spincl tool is doing. Would you please instead
hack the spi-nor core and read 15 bytes let's say, and just dump them with a dev_err?

> 
> Doesn't look like this one uses continuation codes either, sadly.
> Let me know what information I can provide to help with the
> continuation codes for these seemingly non-conformant chips.

Does this flash has a vendor table? We can get the bank number from the vendor's
table, Parameter ID field.

Michael has recently added support to dump the SFDP tables via sysfs.
Would you please dump the SFDP tables and post it here?

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
