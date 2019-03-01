Return-Path: <SRS0=kP5e=RE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EE77C43381
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Mar 2019 09:51:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D97620851
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Mar 2019 09:50:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cuDOwohJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nokia.onmicrosoft.com header.i=@nokia.onmicrosoft.com header.b="tUi/lk4O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D97620851
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nokia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d3oeBVM53VXqiAePkmx2zL9tQ2LmJUVFU/Ks2WAriAY=; b=cuDOwohJcY8lvi
	Wk5T9nvmkhu8VpNxIWBuu+rQrW4SAJRSHN5eLOTNLE/kRgl14PuuC9KdzHLz2T0rq+YyVcNiM2vdx
	No2ciPn2/Guqe9OGl62SYfO7S71eTAeckJLGV8oFcuRYnWTx3lHY2SxbpDw+tamKCk6W78U1qRv0P
	LomxAf3UQ1tFn2unYOmTfLMJrj5w0UeXSfoir9BkJeql8goPP+8n8JeYPUzGRo9q1r3SZ9vi3DHyZ
	BHyAszQroco0kFDf7ODxJs//H4v7jn6cIkUlCTAcKX3v/8g0/5QXKleWsea9JYQH9gGi5s8LMCpUv
	O+ElvPy/djWuDNxNDHaA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzeof-0006Ne-Fj; Fri, 01 Mar 2019 09:50:53 +0000
Received: from mail-eopbgr120109.outbound.protection.outlook.com
 ([40.107.12.109] helo=FRA01-PR2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzeob-0006Mx-Lj
 for linux-mtd@lists.infradead.org; Fri, 01 Mar 2019 09:50:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
 s=selector1-nokia-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u+w+qGO7GTR060pORtO8CVZdhD9UG4j7BnXFi6ym090=;
 b=tUi/lk4OaZiHbMhA2k6NNmUm0GJrTfSjJeopZS+tfD1OBrw1YWetvlJg05BokKBA9/0QcspaAbiBtpfPaj5ScgxoYazdkvXPReG/yhtx9nGaf/Wzwu6qTjwRC6I0SkMHcmvb5nZPFpIhv9XwSf5PzzaNDvXuIakh0bzvq5gVX0g=
Received: from PR1PR07MB5900.eurprd07.prod.outlook.com (20.177.212.21) by
 PR1PR07MB4860.eurprd07.prod.outlook.com (20.177.209.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1665.14; Fri, 1 Mar 2019 09:50:31 +0000
Received: from PR1PR07MB5900.eurprd07.prod.outlook.com
 ([fe80::2459:e669:7cd2:b538]) by PR1PR07MB5900.eurprd07.prod.outlook.com
 ([fe80::2459:e669:7cd2:b538%4]) with mapi id 15.20.1665.012; Fri, 1 Mar 2019
 09:50:31 +0000
From: "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
To: "Tudor.Ambarus@microchip.com" <Tudor.Ambarus@microchip.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 2/2] mtd: spi-nor: Always use biggest erase size
Thread-Topic: [PATCH 2/2] mtd: spi-nor: Always use biggest erase size
Thread-Index: AQHUs9bk77RvlSJjREa6El1S6pHNP6X1pmCAgAEaVAA=
Date: Fri, 1 Mar 2019 09:50:30 +0000
Message-ID: <e286d6bf-99a1-eedc-7b9f-a082603b0946@nokia.com>
References: <20190124112014.20167-1-alexander.sverdlin@nokia.com>
 <20190124112014.20167-3-alexander.sverdlin@nokia.com>
 <08858201-eebb-b9c0-a94d-9eec9106d23b@microchip.com>
In-Reply-To: <08858201-eebb-b9c0-a94d-9eec9106d23b@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [131.228.32.167]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
x-clientproxiedby: HE1PR0401CA0058.eurprd04.prod.outlook.com
 (2603:10a6:3:19::26) To PR1PR07MB5900.eurprd07.prod.outlook.com
 (2603:10a6:102:10::21)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=alexander.sverdlin@nokia.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 03f98c2f-23b5-49b9-a747-08d69e2b5754
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:PR1PR07MB4860; 
x-ms-traffictypediagnostic: PR1PR07MB4860:
x-microsoft-exchange-diagnostics: =?utf-8?B?MTtQUjFQUjA3TUI0ODYwOzIzOjRrRkRJWVh5ZGR0eHRXL091bis0VkVPUW82?=
 =?utf-8?B?dHZYYzV5NEZjNTZaNUl4Q016T0FkUTFyUllIbnZ5SVp6WWlYOEpieVFTWUF2?=
 =?utf-8?B?eFRZVm9weDc0OGVWWFZlc2RxbS9ZN05RRW1tWFJpd09xYml3Z3VCVDdxclRs?=
 =?utf-8?B?VDB1c0RNUE8wVllDZVNHY2diMTI0QXEySERSSDVkaTNSQzB0bndyU3NLTTBp?=
 =?utf-8?B?V0F4a1FOclErRmxWRzhXRDBXMnByQW90NnlxLysrRzhsQ0VRYlJXWTV2aFRX?=
 =?utf-8?B?bVpMeFRjcmtIVUw0UjVETS9sRkxGaHNmYUdZa0lyUTd4VlgzekVnazNGaU5q?=
 =?utf-8?B?YUxaZGR0RjhMbERmTFJYUnBEOXB3d05xcjdzdWt5QTZ6YmcwcHBZckhzMW1O?=
 =?utf-8?B?U0dYdjI5MS9YWWZNZVJUT3hQbGUxeGN1NUdWb2NldjZJSkpld2tqdG9WYlk5?=
 =?utf-8?B?cmhHUU1LMlozTGNQaUhpeE82N0MvSU96a2o0WTVnN3JJU2ZtZXg3aGpHOGlU?=
 =?utf-8?B?RVVyM3NHWUxhN3R4c1dLTkt0TjgyT2JVdllCeGdzZjZ0VmVicnZlNW1lajIv?=
 =?utf-8?B?bDFRYkNRUEY3T3o5cEN5SUdzVUhmTDJzUUtRdnJ0NFJTbDgzbnV4OGI2aWRr?=
 =?utf-8?B?NktNbjk0cXFDNzZJV2FGS29ZaXVRSDdlNkp3TjRTVGg3ZlRORUxBWGRObjBR?=
 =?utf-8?B?RjY4c0VlYjRleWlwR3BZakR0Zk43ejc5YmdkVUR1b1Vqb3c2U1hWUnBGK1oz?=
 =?utf-8?B?bEdlZ1k3ZVdFS1FBYjlHcFM0Q3RUQi8zN29KM3FaQjQ5Y2c4NHV2YlNIZDB3?=
 =?utf-8?B?bEFXNlNPTlR3ekE3Z0p2R1NHUjdvNnNSdzVZT3ROTEJ5cGwxUm14TVlHc3NN?=
 =?utf-8?B?YURYZHcrZlVad3RVYjBLN09LT3NBcUxEQUE4d0NmSWphL2JiRi9pSDlFVTgz?=
 =?utf-8?B?R1JoNnZadjdDNk1ZaXI0S0RjdWdrT3VVMU5rTzF4L0tpMlIvSFRSMW8wZHNS?=
 =?utf-8?B?Q0puelpmNytEMk81YmwzWkduVzVGWXhsY1h3MDAwT1FyRGtMQm5VSEJrQy81?=
 =?utf-8?B?RGY3dE1mSVRJY2ZJWjBRWlNaaDVjOWxuK090QncrMCtUOXB5djFkU3NhVzNN?=
 =?utf-8?B?UW83cDF1c3RRL3dndFNDa2h0TnNCZXBuNFZKeHNLcExIVkZ1c2lsVlM1bVVo?=
 =?utf-8?B?ZXprcFYrdEJTaXlNUW50bWc0YjlZUmt0UHpWRG9LWXJWZ2pIZjhTKzZ1SjND?=
 =?utf-8?B?dVUzOVBYM1A2bnJJWWc3UkpNa3FZME5iY3ljMFVSc3FxVTNzWWpEcUxaMy9Q?=
 =?utf-8?B?NTNKODhVOXFCcWd4VVNhOUNUTElHd0tFODBZZEE2MUdEODFFTTBZd01aWlZ0?=
 =?utf-8?B?Uk0yZFNIWkZteE9HdVNTYjJpNVpPUEtEbWFhWmlEQnBtNEM4UFFURmZVVmZK?=
 =?utf-8?B?cHFwblNoMUVhdXNlc3Y1RmNtWmhucXBiQ1lvRkUwbEU5a05SSkdOTWx5Vllq?=
 =?utf-8?B?ZEk0N1g5clRCSUZ0M0VEWFFvVUpCRHhqYmVkVk82WTZ0amtZMTVPWVArTzF3?=
 =?utf-8?B?Z00wVkd0eU8vQU5NUHNMYjRwOTRwYUpieGtZVit4Ykw4Qy9IcW42NEFMUWVH?=
 =?utf-8?B?UEhpb3pLb0JCeTRMNG5sMFdEV2I0UmhHRUlTY2R3elhWcGhMak5henlJbER0?=
 =?utf-8?B?ZldnYmRUY1ErdEMxN3dDVFlWU05CZjQ5S0VmNGxLTTN6NTgwdlM3ZWoyb0ZZ?=
 =?utf-8?B?WVFlc1N1MDMwLzM2Si9TZkc3cGdDT1VIUXNCdmRZZVE5elUxQno2K2ZLUlc4?=
 =?utf-8?B?R0QzcE5xVm1CVW9LUVIzMy9sa1N5NlEwcDAzd2I2Uzgzb2lFb3dIbnpGblF6?=
 =?utf-8?B?YklDQUJkR1MwU1BWdC9laEhwRUdlaVk1MGhNdDdrZVAzUzhMVnNqZzhwS1hL?=
 =?utf-8?B?WnhEUEFWeUFnPT0=?=
x-microsoft-antispam-prvs: <PR1PR07MB48607197A74F37B068C2F2E688760@PR1PR07MB4860.eurprd07.prod.outlook.com>
x-forefront-prvs: 09634B1196
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(136003)(346002)(376002)(396003)(366004)(199004)(189003)(65956001)(53936002)(2501003)(5660300002)(66066001)(71190400001)(71200400001)(65806001)(58126008)(478600001)(386003)(110136005)(8936002)(97736004)(53546011)(6512007)(102836004)(76176011)(6506007)(99286004)(65826007)(54906003)(2906002)(31696002)(86362001)(68736007)(52116002)(316002)(6436002)(81156014)(2616005)(476003)(486006)(186003)(26005)(8676002)(6116002)(81166006)(446003)(3846002)(6486002)(305945005)(14454004)(105586002)(4326008)(25786009)(14444005)(256004)(6246003)(106356001)(31686004)(64126003)(229853002)(7736002)(36756003)(11346002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:PR1PR07MB4860;
 H:PR1PR07MB5900.eurprd07.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: eECGNnG/WPXsIrEIJqGZHn4Ex1d0/bscxhfzUe97nfvlEBHbrC1vQUSuj1kkFW0ufV0iOw0RjK5GS4ZoYk5YlgI6T4IQedEgvUTwLyibBWHKraBgALiEaaSiOWxvep562QwKP8NhdYxvY9pMZzsac1Gwc96uhoKxbRwZ1PlF1k5fbmvsLFviwtvcE6YDblvpHwGvMZLEBhAUVfqDW/ZzDkV8nD/dy3TG6zILCATnoVrZ1rUhc6b+n0JPV1ZZvsvZfCcAqgR7XnwVLlZESathTPHuDXcJJZT/Nw4nTR9zd76s/c54k9GFH5WgqI4ZD8ViWpC39U4t4THopHds7HIOifrokkU0/Amwbt5Pw4UL1JSuq/7r+LCIcIC6tkEs1faOhSwP/ofJknDELvmk5hMYtMDujPjzkQwAJSLo1cTdQL4=
Content-ID: <026535BDB4281C4F805EBB359C629663@eurprd07.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03f98c2f-23b5-49b9-a747-08d69e2b5754
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2019 09:50:30.9074 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1PR07MB4860
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190301_015049_759189_4DC2DE22 
X-CRM114-Status: GOOD (  10.93  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "richard@nod.at" <richard@nod.at>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Tudor,

On 28/02/2019 18:00, Tudor.Ambarus@microchip.com wrote:
> On 01/24/2019 01:21 PM, Sverdlin, Alexander (Nokia - DE/Ulm) wrote:
>> Optimize erase time by always using biggest erase size for given erase
>> request. Do it by removing "sector"-at-a-time erase code.
>> spi_nor_erase_multi_sectors() seems to be mature enough to handle all
>> the cases better.
> 
> Did you check if the upper mtd layers are affected by this change?

For now I just change static function, I didn't want to remote
spi_nor_has_uniform_erase() infrastructure in the first step.

So I personally see no problems with my patch. It's also quite well
tested up to now.

>> For the above to work backwards-compatible regarding 4-bytes commands
>> spi_nor_set_4byte_opcodes() has to prepare them always, independent of
>> spi_nor_has_uniform_erase() flag.
>>
>> Remainder check in spi_nor_erase() becomes superfluous because
>> spi_nor_erase_multi_sectors() performs it anyway.
>>
>> The trigger for this change was n25q128a13: enabling SECT_4K increased
>> erase time of 128k block from 1.763s to 11.335s.
> 
> When needed, one can disable the 4K sectors with the MTD_SPI_NOR_USE_4K_SECTORS
> kconfig option. Does this help you?

This very same kernel runs on different boards with different flashes.
Seems that more modern flashes are not so slow when 4K sectors are used.

Moreover, I truly believe this was a dead code and want to be convinced
otherwise before real problems start :)

-- 
Best regards,
Alexander Sverdlin.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
