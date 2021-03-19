Return-Path: <SRS0=vdk9=IR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D5A7C433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Mar 2021 14:34:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 047FD64F18
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Mar 2021 14:34:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 047FD64F18
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=weidmueller.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Date:Message-ID:References:
	Cc:To:Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jPRHjkVTQVbPsqd0vJ8bEEf99I/RoOTtl83lEaYa1w0=; b=J95tWjDVXNaVoip9az8MyW5Tx
	H1pUu1SVzw+6VRzyrOOB++0ZSVq4C3gNMDqij6aoW6X2X9r+7lvcOGuQM428YCpoygw8T2AOjGh2l
	/FJmnOYTYEte0xUuGNHEIVkkEUEcXZZ/e3PNk/TLFAXQTDlSFt6tIEwu+hOvm+l9exFLRNPUMhSZY
	qzm1v3bcH9+6p/ibMHkRu9v9C3Ei/U/JE1D15ZJDbgWXIERf5W+gCq3V7dYD7JZZFrKSAR47wfPwk
	gcYSyPyjBD3gaawfaD/9Pa7I2Cw1f8uxzSc4wwr1aexd4Jh9rHZPEphfNg14Mf6O6lG4B9uoH9dZr
	WcplG0n6w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lNGCM-007XzP-IF; Fri, 19 Mar 2021 14:33:58 +0000
Received: from mail-vi1eur05on2072.outbound.protection.outlook.com
 ([40.107.21.72] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lNGCH-007Xya-DJ
 for linux-mtd@lists.infradead.org; Fri, 19 Mar 2021 14:33:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y9vB3MT7Fej8oSb7plBI04W5zbH5DYxrLt6Ftd4JVzbavfqQ3cxnbmsOt/IB111jCxtPYpXyAft690QPtqj3lR0DkwNeRufFqwqYIw7vCrP0CnM5fJcJwIM7l0i6gREHx3U4O2NogLUSC3DY37fNlLS6fWg36rkTzZZ0OYa//jjWHXOyqeaDgtYoyDmlWOefR5AHyvNU7N0cAnxqyNZD+Jt/pF/YLxnBhMirUdHaHtHof7Oad+IjtuDDwKiD5HMuKZRwAjHpUJBtGwafZAFVy8cZzK7s2Oqv8M6TVw7ROk1iWT/WVjzT7GwsRBWDk6UGpiYeR56RUMBXYVM0WQAkiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eHJ+hXyrlshYPAo1zZ/4uXZBrqk6DcUZId4nbJJOozw=;
 b=L4CrQqlEjI7o0sM3OKv3u94f/dNQm8cs6yZ5Fsi8JawvGtLv0gETMbsVgtmSJUUyc+mjJE04TeKq6G1sl6V9a3d9eIPYdiIteKQYgNo6GiNoswXygSxuK+0K6KeFHq6usZ43wPlnxMxgKayd+aXDsZ7hRbBlg4ZjgiouHJ3/RAAOH/EsKxOzASTAkjNPk861EXj+PrFWo93rN5s3zt1XoRIkyz1t+yFHLlMK3Yt/D1XgDV6dbm1yOqADfSiFc9xvTt5ykzr+ZOV+xQ8UU9jBXruyro3BQk0MTtD3w+A6ZPh+L8CO+kmE7boeJjzs4NLSEqe0woJkJIX1XLPwnwi3Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eHJ+hXyrlshYPAo1zZ/4uXZBrqk6DcUZId4nbJJOozw=;
 b=IKEjVk7SaQtOW5Y8PIQBzW6nphkbg4w6UrPXacR6JuujE6oWlNERB8gHqVXBLWxlW3iz3lfWzdvdafwQn43ljfVMPwYoB/FuXR0jV9cdUyz34R/gUrT19MXEAmYPLNWUoDmkEnZvW+QcLUpEMkCysliEEcAW7V/IkA7eOa94PS0=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=weidmueller.com;
Received: from AM0PR08MB5201.eurprd08.prod.outlook.com (2603:10a6:208:15b::28)
 by AM0PR08MB4324.eurprd08.prod.outlook.com (2603:10a6:208:144::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 14:33:49 +0000
Received: from AM0PR08MB5201.eurprd08.prod.outlook.com
 ([fe80::b0c8:b583:1bcf:93f0]) by AM0PR08MB5201.eurprd08.prod.outlook.com
 ([fe80::b0c8:b583:1bcf:93f0%3]) with mapi id 15.20.3955.023; Fri, 19 Mar 2021
 14:33:49 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Subject: Re: spi-nor: maxronix MX25L12835F support
To: Heiko Thiery <heiko.thiery@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tudor.Ambarus@microchip.com, Michael Walle <michael@walle.cc>,
 p.yadav@ti.com, ycllin@mxic.com.tw, zhengxunli@mxic.com.tw,
 juliensu@mxic.com.tw, linux-mtd@lists.infradead.org
References: <20210216092743.jkhfjewu3cbnm5zm@ti.com>
 <92b5b932-a672-9fb6-c604-5263a0668eb3@microchip.com>
 <CAEyMn7aMNjKHXhe_hN15XVczombrTnNqASmva_-MT92+qqV8xA@mail.gmail.com>
 <615749fe-52f5-9e07-db46-41e5e03b55cf@microchip.com>
 <CAEyMn7aXXOS3abS=n_8Y6GtN-xYRYyGT3H-AoavWqCqqM01V9A@mail.gmail.com>
 <fb31d09c-d20a-9a42-6ed2-fd74c7699dfc@microchip.com>
 <CAEyMn7bY9CisxoWcpF=zR+DYJpW+=EeWLGE_gAB3WK9hvkcuJQ@mail.gmail.com>
 <9263ef4d-7944-00bb-8e2f-b7d33e5aab87@ti.com>
 <e1901135-0433-d693-56c9-3a9fdaca1d55@microchip.com>
 <20210301133618.rzs4amh5ujwys277@ti.com>
 <99f92851b9ee95d01564ae01c56085eb@walle.cc>
 <beaf17ed-d200-4470-f726-e4a71d9565fb@microchip.com>
 <729a56daea261808db672472e47d8c20@walle.cc>
 <116efdb0-8b82-914d-2389-d73e2ea2e89a@microchip.com>
 <c4db1916-18fe-5167-31c1-6bc652bb6212@ti.com>
 <CAEyMn7Z0mYTrtd6TwKJqL6He9g-6o0yYJ2H78oG8gZy9mxXETw@mail.gmail.com>
 <5ea9c0cb-3281-7bfd-e2b1-8217eff94c20@ti.com>
 <CAEyMn7b+vHNiSRJTP2Qs3doK2n3xgCQm9YFBCYEn09GWLehQ0Q@mail.gmail.com>
Message-ID: <ee7bf6f7-dccf-2ff2-bb70-2b819997002b@weidmueller.com>
Date: Fri, 19 Mar 2021 15:33:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <CAEyMn7b+vHNiSRJTP2Qs3doK2n3xgCQm9YFBCYEn09GWLehQ0Q@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [94.134.103.158]
X-ClientProxiedBy: AM0PR01CA0092.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::33) To AM0PR08MB5201.eurprd08.prod.outlook.com
 (2603:10a6:208:15b::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.178.36] (94.134.103.158) by
 AM0PR01CA0092.eurprd01.prod.exchangelabs.com (2603:10a6:208:10e::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Fri, 19 Mar 2021 14:33:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49d76ab5-a381-4591-bc9d-08d8eae402e3
X-MS-TrafficTypeDiagnostic: AM0PR08MB4324:
X-Microsoft-Antispam-PRVS: <AM0PR08MB43249BFA44CB705E1A4B4E56D7689@AM0PR08MB4324.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wj050p/wRlMb4SedlmyjfERdRthJntW3Y91MSzEMJxWl8aEVNw+7q4hCm/qeNABjOKVixAAxXfsAkIMHOwoKLov5j4GdRc5tjg9Uz9RPX/qI3aoA8TahLSmGZFdYNUBhqOU2lF3OvX+w+vIYm0TXNPTpyfc4UkdIwEx33FvxmULBL3U2sn7SVdlrMO2pZXGr8qkIhOKy2qC0ID23GSB1G2gaPpZC63Kh9t9M5N8VBMOED/fJWu/5qiyeiLt4xxBWZqWpZHRzgSgQilQ0U6TWFmRtRmI9d0nNuXtmWOlZNhVU4UGsv8rn6P3b2XOZdw7wAIaYLuMx8lxmQVRE0ZTnU6sHbNhAGCnN+SPqf5wTFoehUE5cAyBcNIkZYqyp51wc/mZ8wrfN3E4FsVB/6sjdxCd6wD8Il30SxjVsWMsxCFCX7TivY+L/LDQxR8H4p0sLhyAy4L7/LosFjYi7cqnXaMmT/yJfmfYDnp/sX8/rPjh6MC+wnnpfjzoguSd6gyKtevdhWcm876O6H2jPipEirYvozAXzOQ4nDKDQm+8tE/FCQbJlXz2cjiItN6amUU8fB27ZXaENWHzjQj3vc2yKr1aJIjrCLFUQ7X8Jtg0XC7UrpdqA0a2BH9jwP2kPdYD/FYyusJN+8gpMgwyjS5VKkrQ4/g/3SeyhsdkCkXUt3G4t801pNB8s4YQOJ1d5FhbB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR08MB5201.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39850400004)(136003)(366004)(346002)(376002)(478600001)(31696002)(53546011)(52116002)(26005)(110136005)(38100700001)(66476007)(316002)(66556008)(66946007)(186003)(5660300002)(36756003)(8936002)(2906002)(8676002)(86362001)(956004)(66574015)(31686004)(2616005)(6666004)(4326008)(6486002)(16576012)(16526019)(83380400001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QUovU3JNWEJzK2FlbDR2RklTeGhoNjhRNmpja04xdlZBSVBib2tnYmRuT2Zx?=
 =?utf-8?B?RnRLWUxxZXlQYm9YZEt1VEpyOWM2bDkyNmhGclp0QkpOSzZNTlIwTGxhZDhY?=
 =?utf-8?B?alFqVVR4Z2xndFpXczZhUWpjMHVUQ3dKOUZQZnpOdDVMVzM5NllWcVlKNTI5?=
 =?utf-8?B?cnlPbkVUb1dNRUJDMExnSnl1aGdPMHBxcHhuVjFSdU50MFlJdnc0QkxJa1Zi?=
 =?utf-8?B?SXlIc2hsTGdVeUhzWFpjSFcySitURUZyTEttZ2RKcEdqcG05bFN0N0tmc1J4?=
 =?utf-8?B?RW1GenVhbThnWVRhSHFaYndzSDRVUVdlZUNWZXBTSUo1cmExakEyV1M5UmpJ?=
 =?utf-8?B?WkpYUGdjVTJiUFpPbkkvUGJJRWZDNU5Pd2RDa0V5UEt4Zkp0OE9odUdVWERF?=
 =?utf-8?B?amJveDRsUXZjOXVmWUsxWmJwU09zVk1aWTdCUzZpVThtSFdWUTN2Mnl6bmVT?=
 =?utf-8?B?SS8rRTBwZllHSW5QdURFU2lMMEpnVDAwUHZTdVNxeVFsb3cxaG9scjlPV0o4?=
 =?utf-8?B?SFNuV04zb1E5NkFaVjlvNjVvWm4rWFcrMUptd1ZIMVFsbitNVW9XOXBoOVRW?=
 =?utf-8?B?ekVGRXdCV2c3MmtaN0R5TUR1b3hhd0pRR3JnVDBlQ2hubVJIOW1ydVdmV3dR?=
 =?utf-8?B?NDZicWhlRmZHVUdjREFWSlFmTnRvL2dEVjdzVEJHbFpOTElQZ0JFU29iSUdv?=
 =?utf-8?B?N0svL2R5ZkY2TlZwcHhmUVVYK0k1N1MvVFptMDRiUCtZcUprL294SlJMZ2c0?=
 =?utf-8?B?VkxuUkNldEJvZTVtMDJSWUQ0aTM5a0owcGhsWHlLeDk3VGhjVjltc09kaEQx?=
 =?utf-8?B?WDdPV1hKamR5ZTVvQW0rY1RQdUtxVDNxTWE2VlUya29wbnkrT2NXUnR1R0du?=
 =?utf-8?B?K0k2UlpWaGtFNFE1WUw1ZDdmdStVU21menZmb0xDc1d4aFhkMEU1MVdMdy84?=
 =?utf-8?B?U0tFS2R2eVJrUFBWY1UveTJxS3hEenNLaklYYUIyR2J4eDFYQUFwNEtpQ3Qr?=
 =?utf-8?B?T0ZKUGFjVFRSUHg3L0xDcU1qbUF2RG9NTnJpOUhlc2srQUV3MUc0THBzR1BS?=
 =?utf-8?B?QzZ3eVVWZm9Jd3NTbEhBRDFxVHo1ejZDNE5CdTY3N1RDZU1UV0x3TTNWcHlN?=
 =?utf-8?B?U0J0bG1RaDlRcmZmUHprTmVKSUNpUjRaWHM0UjE3ZjZPVXAyMSt5RUY2aHFj?=
 =?utf-8?B?UlJpZjhKSDdYbzZTc1YvMnNaek9KaEtHUkdhbyt6ZGZRdFNDZVVhMzlWUFhs?=
 =?utf-8?B?WWg1MU85N3dwNDl1YkdoZ3g4ZXpQY3ZXUHVRNENwd2MzTU0yQTF0Q0oySDV5?=
 =?utf-8?B?MDRteEJiUitYTVIrV2E3YlgrREVrMGJkK1VtQW02c0wwb1U0cmx6OEJjVG1M?=
 =?utf-8?B?NVdIaE9pKzRWamVCc0ovRVlVNUNZZG5hZ0VWTmVyWHlvKzdXZmNYSWN1UWNl?=
 =?utf-8?B?SDc3cys2RXR0WUgrTXBwYmR3a1RiZHBRclRVQnlkcVRIUVltcllvKy9SQXR0?=
 =?utf-8?B?TCs4SmN2aE15YWxGUnFmTVFCSWQrZnNYNURnK0hWREpybG1zWUM2NnFneEQ5?=
 =?utf-8?B?VUQxQkMwQWhEQ1YxaDhDQ0lJY0Irem9IYXBTYVhEQVVzOFlzQWJQVGc2dWFD?=
 =?utf-8?B?QzZVT2lCMGhkWkpPZGo1cThJU2M1QnZRSmhzRW0ybVh0OEdwTjVtTlhTL1g0?=
 =?utf-8?B?c3dtVnBEdUtNZVZUWjNFQVhjVjVXcHhYK2gzdGUyMEtNYnBJcGxPd2JTc0pN?=
 =?utf-8?Q?eszVC3t3eIkz79yxcIbgBaQgDB6eIoR7dRcm2i8?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49d76ab5-a381-4591-bc9d-08d8eae402e3
X-MS-Exchange-CrossTenant-AuthSource: AM0PR08MB5201.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 14:33:49.6086 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MqTM/27/z8iShWhODPCQTWBHN/GKhxvHQZq0HgIN2B4+4Jhibk47O2WjYvs0AB0xXPMkjaYtrFZVCL8RzQM1PA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4324
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210319_143353_637814_9AE8F3D4 
X-CRM114-Status: GOOD (  19.28  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksCgpBbSAwNC4wMy4yMDIxIHVtIDA4OjEwIHNjaHJpZWIgSGVpa28gVGhpZXJ5Ogo+IEhpIFZp
Z25lc2gsCj4gCj4gQW0gRG8uLCA0LiBNw6RyeiAyMDIxIHVtIDA4OjAyIFVociBzY2hyaWViIFZp
Z25lc2ggUmFnaGF2ZW5kcmEgPHZpZ25lc2hyQHRpLmNvbT46Cj4+Cj4+Cj4+Cj4+IE9uIDMvMy8y
MSA3OjE0IFBNLCBIZWlrbyBUaGllcnkgd3JvdGU6Cj4+PiBIaSBWaWduZXNoLAo+Pj4KPj4gWy4u
Ll0KPj4+Pj4+Pgo+Pj4+Pj4+IEhvdyBhYm91dCBuYW1pbmcgdGhlbSBzb21ldGhpbmcgbGlrZSAi
dXBkYXRlZC1mbGFzaC1uYW1lIHx8Cj4+Pj4+Pj4gZmlyc3QtbmFtZSIuCj4+Pj4+Pj4gQW55d2F5
LCB0aGVzZSBhcmUganVzdCB3b3JrYXJvdW5kcy4gTWFudWZhY3R1cmVycyBzaG91bGRuJ3QgdXNl
IHRoZQo+Pj4+Pj4+IHNhbWUKPj4+Pj4+PiBKRURFQyBJRCBmb3IgbmV3IGZsYXNoZXMuIFRoZXkg
c2hvdWxkIGF0IGxlYXN0IGFkZCBhbiBleHRlbmRlZCBJRC4KPj4+Pj4+Cj4+Pj4+PiBNaCwgd2hh
dCBhYm91dCBhIGxpc3Qgb2YgbmFtZXM/IEkgbWVhbiB5ZXMgaXQgaXMgYSB3b3JrYXJvdW5kLCBi
dXQKPj4+Pj4+IHRoZXJlIGlzIGFjdHVhbCBoYXJkd2FyZSBkb2luZyB0aGlzLCBzbyBJTUhPIGxp
bnV4IGhhcyB0byBkZWFsIHdpdGgKPj4+Pj4+IGl0IGluIHNvbWUgd2F5LiBPVE9IIHRoYXQgbGlz
dCBtaWdodCBiZSBsb25nIGFuZCBkb2Vzbid0IGxvb2sgZ29vZAo+Pj4+Pj4gaW4gZG1lc2cgKG9y
IHdoZXJldmVyIHRoYXQgc3RyaW5nIG1pZ2h0IGJlIHVzZWQpLgo+Pj4+Pj4KPj4+Pj4+IEl0IG1p
Z2h0IGNvbWUgaW4gaGFuZHkgdG8gaGF2ZSBhIG1lY2hhbmlzbSBpbiBwbGFjZSBpZiBzb21lb25l
Cj4+Pj4+PiByZWFsbHkgY2FyZXMgYWJvdXQgaXQgdGhvdWdoLgo+Pj4+Pj4KPj4+Pj4KPj4+Pj4g
QSBsaXN0IG9mIG5hbWVzIHdpdGggZGlmZmVyZW50aWF0aW9uIGF0IHJ1bi10aW1lLCB3aGVyZSBw
b3NzaWJsZSwKPj4+Pj4gc291bmRzIGdvb2QuIE90aGVyd2lzZSB3ZSdsbCBzdGljayB0byBhIGRl
ZmF1bHQgbmFtZSwgd2hhdGV2ZXIgdGhhdAo+Pj4+PiB3aWxsIGJlLiBEbyB5b3UgY2FyZSB0byBz
Y3JhdGNoIGEgcGF0Y2ggZm9yIHRoZSBsaXN0IG9mIG5hbWVzIGlkZWE/Cj4+Pj4+Cj4+Pj4+IFdl
J2xsIHN0aWxsIGhhdmUgYSBzaW5nbGUgZmxhc2ggZW50cnksIHdpdGggYSBsaXN0IG9mIG5hbWVz
LCBhbmQgd2UKPj4+Pj4gc3RpbGwgbmVlZCB0byBlaXRoZXIgZG8gdGhlIFNGRFAgZGV0ZWN0aW9u
IGZpcnN0LCBvciB0byB0cmlnZ2VyIHRoZQo+Pj4+PiBTRkRQIGRldGVjdGlvbiB3aXRoIGFuIGV4
cGxpY2l0IGZsYXNoIGluZm8gZmxhZy4gSSdsbCBmb2xsb3cgUHJhdHl1c2gncwo+Pj4+PiBzdGVw
cyBhbmQgZXZhbHVhdGUgdGhlICJkZXRlY3QgU0ZEUCBmaXJzdCIgaWRlYS4KPj4+Pj4KPj4+Pgo+
Pj4+IElmIHdlIGRvIGdvIGRvd24gdGhlIHJvYWQgb2YgImRldGVjdCBTRkRQIGZpcnN0Iiwgd2Ug
c2hvdWxkIGFkZAo+Pj4+IFNQSV9OT1JfU0tJUF9TRkRQIHRvIGZsYXNoZXMgdGhhdCBjdXJyZW50
bHkgZG9uJ3QgY2xhaW0gRFVBTC9RVUFEL09DVEFMCj4+Pj4gY2FwYWJpbGl0eSBjdXJyZW50bHkg
aW4gb3JkZXIgdG8gYXZvaWQgYW55IHN1cnByaXNlcyBkdWUgdG8gd3JvbmcgdmFsdWVzCj4+Pj4g
aW4gdGhlIHRhYmxlLgo+Pj4KPj4+IERvZXMgdGhpcyBtZWFuIHRoYXQgYWxsIGVudHJpZXMgdGhh
dCBoYXZlIERVQUwvUVVBRC9PQ1RBTCBkZWZpbmVkIGNhbgo+Pj4gaGF2ZSB0aGVtIHJlbW92ZWQg
QW5kIHRoZSBjb3JyZWN0IHZhbHVlcyB3aWxsIGJlIGRldGVjdGVkL3NldCBieSBTRkRQPwo+Pj4K
Pj4KPj4gTm8sIG5vdCBhbGwgRHVhbC9RdWFkL09jdGFsIFNQSSBmbGFzaGVzIGhhdmUgU0ZEUCB0
YWJsZXMgcG9wdWxhdGVkLgo+PiBSZW1vdmluZyBEVUFML1FVQUQvT0NUQUwgY2FwYWJpbGl0aWVz
IGZvciBhIGZsYXNoIHRoYXQgZG9lcyBub3QgaGF2ZQo+PiBTRkRQIHRhYmxlcyBwb3B1bGF0ZWQg
KG9yIGhhcyB3cm9uZyB2YWx1ZXMpIHdpbGwgY2F1c2UgcmVncmVzc2lvbiBhcwo+PiBjb2RlIG1h
eSBmYWxsYmFjayB0byBsZWdhY3kgU1BJIG1vZGUuCj4gCj4gU28gaW4gdGhhdCBjYXNlIHJlbW92
aW5nIHRoZSBmbGFncyBjYW4gb25seSBiZSBkb25lIG9uIGNoaXBzL2ZsYXNoZXMKPiB0aGF0IGFy
ZSBjaGVja2VkIGFuZCByZXZpZXdlZCBmb3IgYSB2YWxpZCBmdW5jdGlvbmFsIFNGRFAgZGV0ZWN0
aW9uLgo+IAoKSXNuJ3QgdGhlIGFzc3VtcHRpb24gd3JvbmcgdGhhdCBsZWdhY3kgZmxhc2hlcyBk
b2Vzbid0IHN1cHBvcnQgU0ZEUD8gQXQgCnRoZSBtb21lbnQgdGhlIGRyaXZlciBlbmFibGVzIFNG
RFAgb25seSBpZiB0aGUgZmxhc2ggc3VwcG9ydHMgCkRVQUwvUVVBRC9PQ1RBTCBtb2RlLiBXZSBz
aG91bGQgZW5hYmxlIGl0IGZvciBhbGwgZmxhc2hlcyBvciBhbGxvdyB0aGUgCmxlZ2FjeSBmbGFz
aGVzIHRvIGV4cGxpY2l0IGVuYWJsZSBpdC4KCldoYXQgaXMgdGhlIG1lYW5pbmcgb2YgU1BJX05P
Ul9TS0lQX1NGRFA/IElzIHRoaXMgYSBsZWZ0b3ZlciBhbmQgc2hvdWxkIApiZSByZXBsYWNlZCBi
eSBwb3N0X3NmZHAgZml4dXA/CgpXaGF0IGlzIHRoZSBhZHZhbnRhZ2Ugb2YgU0ZEUCBmaXJzdD8g
QmVjYXVzZSBvZiBiYWNrd2FyZCBjb21wYXRpYmlsaXR5IAp5b3UgaGF2ZSB0byBjaGVjayB0aGUg
Zmxhc2ggaW5mbyBkYXRhIGFuZCB5b3UgbmVlZCBhIGZsYWcgZm9yIGNvbXBhdGlibGUgCm9yIGlu
Y29tcGF0aWJsZSBmbGFzaGVzLgoKSW5kZXBlbmRlbnRseSBvZiB0aGUgU0ZEUCByZWFkIHBvc2l0
aW9uIHdlIGNvdWxkIGFkZCB0aGUgClNQSV9OT1JfU0tJUF9TRkRQIGZsYWcgdG8gYWxsIGxlZ2Fj
eSBmbGFzaGVzIGFuZCBlbmFibGUgU0ZEUCBmb3IgYWxsIApmbGFzaGVzLiBPciB3ZSBjb3VsZCBy
ZW1vdmUgdGhlIFNQSV9OT1JfU0tJUF9TRkRQIGZsYWcgYW5kIGFkZCBhbiAKU1BJX05PUl9TRkRQ
IGZsYWcgdG8gZXhwbGljaXRseSBlbmFibGUgU0ZEUC4KCktpbmQgcmVnYXJkcwogICBTdGVmYW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
