Return-Path: <SRS0=zR1V=RX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFA61C43381
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 18:56:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A821E206BA
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 18:56:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oVqWggGw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cypress.com header.i=@cypress.com header.b="DzMNuVur"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A821E206BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cypress.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7BhVieEIpzEBVCLMqwqR2rpBvYup9VAjMRsvtmWvfAE=; b=oVqWggGwlsDCEu
	N9GX0ijV4rCoHHSnaRbTPS1G2rvBVziBMJi6LP9pe9BgbHgGX5odhIPD8a6xriMrojuTpOT3KKOSS
	A0uY2J4IStYtEct7SB5MveDTLs7f6scRyc4sB38uek2JlyaNRXbYiDk3STwTZDu/Nthtnb9YVhEI+
	8FMGgkx1CwPhTufHlg/d/3fO7dyNXKAwbx8ANx3O7w/jDf470EmTZhTBjWetuVxDLQ7zli+VzQqTJ
	OZQF7U1ZX7UlYaMfboBNTzB7VSQdy3kOeVHDzhJtU+LK13pdhE46Fru+Fxk1EyPiFKI2nkLMzvjcU
	P13sbX/oGBLhrSqAGoXg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6gNx-0003dp-8F; Wed, 20 Mar 2019 18:56:21 +0000
Received: from mail-eopbgr750133.outbound.protection.outlook.com
 ([40.107.75.133] helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6gNs-0003dG-Q7
 for linux-mtd@lists.infradead.org; Wed, 20 Mar 2019 18:56:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cypress.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HNo5s5jyz3Rwmj2PVCP6dfxpWKE4pzjqnDqa5/XCgeI=;
 b=DzMNuVurl3WP6xHVd6SYAgUGir7E7k3iWlhLgFJvvcggA4tbxIpzhYv8vMUs2JCqJFiLHvGccdMgY692q5b7dJcaOiRUvSbU9t8VKKlrrUtGtAnr3BgfFB6KPNPQ9Hjf6PQy38kh7wCErZNPYpEPIqhskZ4vafWTIQ9axNlr39s=
Received: from BYAPR06MB5893.namprd06.prod.outlook.com (20.179.157.74) by
 BYAPR06MB5206.namprd06.prod.outlook.com (20.178.49.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1709.14; Wed, 20 Mar 2019 18:56:12 +0000
Received: from BYAPR06MB5893.namprd06.prod.outlook.com
 ([fe80::9995:d549:6e1c:c360]) by BYAPR06MB5893.namprd06.prod.outlook.com
 ([fe80::9995:d549:6e1c:c360%7]) with mapi id 15.20.1730.013; Wed, 20 Mar 2019
 18:56:12 +0000
From: Yong Qin <Yong.Qin@cypress.com>
To: Jonas Bonn <jonas@norrbonn.se>, "Tudor.Ambarus@microchip.com"
 <Tudor.Ambarus@microchip.com>, James Tomasetta <James.Tomasetta@cypress.com>
Subject: RE: [PATCH v2 1/3] mtd: spi-nor: always respect write-protect input
Thread-Topic: [PATCH v2 1/3] mtd: spi-nor: always respect write-protect input
Thread-Index: AQHUuB8ZhXd2N1Mh6EWe4SXNj0Cyz6YE33oAgAAMRYCAAcsCAIAAWT4wgADr6oCAAKGJ4IAKNP4AgAAD8ACAAYb4AIAACVgAgAAHWoCAAAHygIAAuCJQ
Date: Wed, 20 Mar 2019 18:56:12 +0000
Message-ID: <BYAPR06MB589357713279CE756A65B3238F410@BYAPR06MB5893.namprd06.prod.outlook.com>
References: <20190129220705.5143-1-jonas@norrbonn.se>
 <20190129220705.5143-2-jonas@norrbonn.se>
 <db7aef53-43bc-2c14-12bc-2f0d452b4bc8@microchip.com>
 <cb41d4e3-d300-89da-3378-6305699d610c@norrbonn.se>
 <6e20b1c1-4eaf-bdcc-aec4-59dcbe2a8a34@microchip.com>
 <BYAPR06MB5893F6DEA9B0965E234983CD8F480@BYAPR06MB5893.namprd06.prod.outlook.com>
 <4ddb8f33-93b1-9aa4-3fdd-c60cfa1d1d7d@microchip.com>
 <BYAPR06MB58937598257ADB18DAF344C38F490@BYAPR06MB5893.namprd06.prod.outlook.com>
 <41859b7a-98ad-fc6d-242e-6e9ab810e038@microchip.com>
 <9fcc328f-ae13-a294-a56c-0b5a6247b26a@norrbonn.se>
 <64b52a54-94a0-4b0b-683c-41eb07d5b09a@microchip.com>
 <37e1a622-1bb9-0104-c35d-8d7b6c6fcd73@norrbonn.se>
 <5d342253-1ca2-4673-7560-6698cc71696e@microchip.com>
 <71b64bdf-73f7-03b7-14a6-5fb2750b84a1@norrbonn.se>
In-Reply-To: <71b64bdf-73f7-03b7-14a6-5fb2750b84a1@norrbonn.se>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Yong.Qin@cypress.com; 
x-originating-ip: [99.228.74.150]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c7515cbc-4818-412f-2c67-08d6ad65b8c1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:BYAPR06MB5206; 
x-ms-traffictypediagnostic: BYAPR06MB5206:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BYAPR06MB520652DAAFDA896A1A7D23758F410@BYAPR06MB5206.namprd06.prod.outlook.com>
x-forefront-prvs: 098291215C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(376002)(396003)(39860400002)(136003)(366004)(199004)(189003)(13464003)(229853002)(97736004)(4326008)(71200400001)(478600001)(8676002)(6116002)(5660300002)(2906002)(7736002)(3846002)(14444005)(54906003)(106356001)(81156014)(105586002)(110136005)(256004)(2501003)(81166006)(93886005)(25786009)(14454004)(5024004)(74316002)(966005)(72206003)(8936002)(26005)(66066001)(68736007)(476003)(7696005)(446003)(55016002)(33656002)(186003)(6246003)(99286004)(316002)(6636002)(76176011)(11346002)(102836004)(6506007)(71190400001)(486006)(6436002)(6306002)(53546011)(9686003)(53936002)(52536014)(305945005)(86362001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR06MB5206;
 H:BYAPR06MB5893.namprd06.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: cypress.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XYPvJjeEAQdDi0IIjcLeUHB6IOUjUouTgALAzMC88GY9bzbryLzbRFVfJT3LvkYnJQzXtI1BdfgJalP09gc/Fnf+1Z5/fMO1LlOTQaQOBGn4nU1Lk0uvlWZtVGSFV2r0z7l6yEkV/1yZFBaPk74eJvN8fzjSvS2c+8a9AnZpjEAZujBcl0MxMJLQ5pBiuqNTRlUoAXa2zdi8ayonYyv+rROgRvPupoLwa1mPrT9ugEk2a8r4mS+B2eqZMVg1NYt7UWekoqsu051cB+IHcCMFuSzFv9Wgxl0DNe63UcQ/idi6Od2nJ6Q6R1san6svCk5aiDpRSg1wLFzJclY52lh33GuUAnIueDbWybT0ANoEX5Cvmpi8ZfsmHN/vydyxBeLOzgH9cs0m6K22x5qda8bFxcZ1eG5Kfc4kWW8yjBUuHYM=
MIME-Version: 1.0
X-OriginatorOrg: cypress.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7515cbc-4818-412f-2c67-08d6ad65b8c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2019 18:56:12.0672 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 011addfc-2c09-450d-8938-e0bbc2dd2376
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR06MB5206
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190320_115616_963411_F6371B3C 
X-CRM114-Status: GOOD (  24.29  )
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
Cc: "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "richard@nod.at" <richard@nod.at>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Jonas, Tudor,

I think Tudor described is a reasonable use case scenario.

BPNV bit default value is 0, which means BP0-2 bits are default Non-Volatile. In this case, BPNV bit does not need to be set. After the flash chip mounted on PCB board with WP# grounded, all need to do are: Program data into flash --> Set BP0-2 to 1 --> Set SRWD to 1, then both SRWD bit and BP0-2 bits are locked-down, unless disconnecting WP# from grounding. Reset will not change SRWD bit and BP0-2 bits since they all are Non-Volatile.

Best Regards,
Yong

-----Original Message-----
From: Jonas Bonn <jonas@norrbonn.se>
Sent: Wednesday, March 20, 2019 3:40 AM
To: Tudor.Ambarus@microchip.com; Yong Qin <Yong.Qin@cypress.com>; James Tomasetta <James.Tomasetta@cypress.com>
Cc: bbrezillon@kernel.org; richard@nod.at; marek.vasut@gmail.com; linux-mtd@lists.infradead.org; computersforpeace@gmail.com; dwmw2@infradead.org
Subject: Re: [PATCH v2 1/3] mtd: spi-nor: always respect write-protect input



On 20/03/2019 08:33, Tudor.Ambarus@microchip.com wrote:
>
>
> On 03/20/2019 09:06 AM, Jonas Bonn wrote:
>> External E-Mail
>>
>>
>>
>> On 20/03/2019 07:33, Tudor.Ambarus@microchip.com wrote:
>>> Jonas,
>>>
>>> On 03/19/2019 09:13 AM, Jonas Bonn wrote:
>>>>
>>>> On 19/03/2019 07:59, Tudor.Ambarus@microchip.com wrote:
>>>>> Jonas, Yong,
>>>>>
>>>>> On 03/12/2019 09:27 PM, Yong Qin wrote:
>>>>>> Hi Tudor,
>>>>>>
>>>>>> Good question.
>>>>>>
>>>>>> The WP# function is not available when the Quad mode is enabled (CR[1]=1). The WP# function is replaced by IO2 for input and output during Quad mode. With that said, if CR[1] is set to 1 (Quad mode enabled), the registers will not be protected.
>>>>>>
>>>>>> Technically default SRWD bit can be set as either 0 or 1. However, as most customers (applications) don't use this feature to protect registers, the default SRWD bit set to 0 might be a better choice, and reserve the option to change to 1 for the applications do need this feature.
>>>>>
>>>>> I think I found the reason why SRWD bit is configurable, and
>>>>> disabled by
>>>>> default: => to allow the installation of the flash in a system
>>>>> with a grounded WP# pin while still enabling write to the BP bits.
>>>>
>>>> I think this is bogus.  Why would you ground the SRWD pin?  That's a design error.
>>>
>>> I've talked with Microchip hardware team, we have this feature on sst26 flashes too.
>>>
>>> Grounding WP would not necessarily be a design error. The intention
>>> is that some users might choose to populate the Flash chip onto
>>> their PCB, program the memory in-circuit, and then lock down the write protection to use the chip like a ROM.
>>> Grounding WP allows them to do this. Since SRWD is set to '0' from
>>> the factory, so users can program the memory, set the block
>>> protection (BP) bits to protect the memory, and then set the SRWD
>>> bit to enable the grounded WP input and prevent changing the BP bits.
>>
>> Again, this is bogus.  The SRWD bit is non-volatile so just resetting the flash clears the bit and the BP bits can be changed.  This does not magically turn the flash into a ROM.  Grounded or not, the WP# is NOT respected until the SRWD bit is set; what you've described is yet another reason to default the SRWD to set.
>
> SRWD is a non-volatile bit: default at power-up will be the setting
> prior to power-down.

Ah, right you are! :)

By grounding the WP# pin, you are effectively turning the SRWD bit into an OTP bit.  Note that what you described above also requires setting the BPNV bit, otherwise protection is irrevocably reset to "unprotected"
at reset.  The BPNV bit cannot be set from Linux so whoever is using the "grounded pin" method must be programming the board in-factory from another system than Linux.  Therefore it's OK for Linux to default SRWD to asserted, irregardless of the state of WP#.

/Jonas



>
> Cheers,
> ta
>
>>
>> With the BPNV bit (see patch 3 that I posted in the v2 series), at least the flash can be made to start up write-protected; however, there is nothing preventing modification of the PROTection bits until SRWD is set AND WP# is asserted (through grounding or otherwise).  Linux currently defaults SRWD to cleared which is "unprotected", irregardless of the state of WP#.
>>
>>>
>>> The grounded WP pin + SRWD bit method is an older, legacy approach
>>> to the problem. We don't know how many users actually ground the WP
>>> pin in this manner, but there are probably some users out there who do.
>>
>> If they do so, they are fooling themselves... or they are running a
>> patched kernel! :)
>>
>> /Jonas
>>
>>
>>
>>
>>>
>>> Cheers,
>>> ta
>>>
>>>>
>>>> /Jonas
>>>>
>>>>>
>>>>> Jonas, Yong, what do you think?
>>>>>
>>>>> Cheers,
>>>>> ta
>>>>>
>>>>>>
>>>>>> Thanks,
>>>>>> Yong
>>>>>>
>>>>>> -----Original Message-----
>>>>>> From: Tudor.Ambarus@microchip.com <Tudor.Ambarus@microchip.com>
>>>>>> Sent: Tuesday, March 12, 2019 5:30 AM
>>>>>> To: Yong Qin <Yong.Qin@cypress.com>; jonas@norrbonn.se; James
>>>>>> Tomasetta <James.Tomasetta@cypress.com>
>>>>>> Cc: linux-mtd@lists.infradead.org; bbrezillon@kernel.org;
>>>>>> richard@nod.at; marek.vasut@gmail.com;
>>>>>> computersforpeace@gmail.com; dwmw2@infradead.org
>>>>>> Subject: Re: [PATCH v2 1/3] mtd: spi-nor: always respect
>>>>>> write-protect input
>>>>>>
>>>>>> Hi, Yong,
>>>>>>
>>>>>> Thank you for the explanation. There are still few things to clarify.
>>>>>>
>>>>>> On 03/11/2019 10:14 PM, Yong Qin wrote:
>>>>>>> SRWD bit (along with WP#) provides a way to protect Status and Configuration Registers from been modified unintendedly or by a malicious actor.
>>>>>>>
>>>>>>> By default, SRWD bit is 0, which means no protection on registers alternations. Registers can be modified easily by WRR command. (this is most of the application use cases).
>>>>>>>
>>>>>>> If set SRWD bit to 1, then when WP# is driven low during WRR command, WRR command will be ignored and Registers can't be modified. This provides a way to protect Registers, meanwhile still reserve the capability to modify Registers when necessary by driving WP# to high during WRR command.
>>>>>>
>>>>>> Does the SRWD bit protect the Status and Configuration Register bits even when in Quad Mode? WP# function is not available in Quad mode. How can one release this protection when in Quad Mode and SRWD set to 1?
>>>>>>
>>>>>> If SRWD bit is ignored in Quad Mode, then why didn't Cypress enable Status and Configuration Register bits protection by default? I.e., remove SRWD bit from SR1, make BIT(7) a NOP, and consider the Status and Configuration Register bits protection enabled by default when not in Quad Mode.
>>>>>>
>>>>>> Cheers,
>>>>>> ta
>>>>>>
>>>>>> This message and any attachments may contain confidential information from Cypress or its subsidiaries. If it has been received in error, please advise the sender and immediately delete this message.
>>>>>>
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/

This message and any attachments may contain confidential information from Cypress or its subsidiaries. If it has been received in error, please advise the sender and immediately delete this message.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
