Return-Path: <SRS0=UNLD=RO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFA86C43381
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Mar 2019 20:15:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDEE92147C
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Mar 2019 20:15:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y+MfoRR+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cypress.com header.i=@cypress.com header.b="vp0OPB7Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDEE92147C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cypress.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3diIr3+OSTQxgqQC1aaFT/PaXY5GEmx2lgm18/OXiuA=; b=Y+MfoRR+KT0hF4
	a3pOsflhaeEuR3qtDn4X6DKLU7r7ysxOfLERfKvFkEtKotX+79wGZBvP9lvd0SZvNrCDSBf7sieV9
	HM9+XW+XpjDB7iVRw8Q5Q6RY1+9yFZ9ueWe70mA9EoYXMnTphH6P3Vie5/NC9Jy2v/gQLTMLRkabs
	BPq5Ecs6jmZkmPCSwyfWfkodYmOh1z5pfNb3r9mRzJw9Nu/mYpeCpy0H25zKK0Sg9iMDscO+7/oVb
	etvdZ9iymxy0BLI373tBdE2AW60SpMj+Du/VfkJtuXwpM4iiQ9IBly6PvfnYzdI5Dd/eQ6vsRA+2c
	PG07xsAyAMJljXLWF+/Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3RKH-0002sL-1J; Mon, 11 Mar 2019 20:15:09 +0000
Received: from mail-eopbgr750091.outbound.protection.outlook.com
 ([40.107.75.91] helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3RKD-0001hd-2m
 for linux-mtd@lists.infradead.org; Mon, 11 Mar 2019 20:15:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cypress.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TR0odx7WlXgEMltW5fckLOX6omuhpj/ATn9pxiSlqJI=;
 b=vp0OPB7Z0y6blr8heCtZH1sQm9IBIYruKKE7KUD3I/KHOam9HTb0kiTeWryZajsD7UkjRPoDNSbGF2xu6YQljEFlZtyux0Z1S1KlzJ/7AJ1Z7j179D5W/HWxBCmtr8O3yrSIAHes7GgyEZLMtFrQAF6ZvR3lM/0P5EO1QRFvQ5Y=
Received: from BYAPR06MB5893.namprd06.prod.outlook.com (20.179.157.74) by
 BYAPR06MB5878.namprd06.prod.outlook.com (20.179.157.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1686.18; Mon, 11 Mar 2019 20:14:59 +0000
Received: from BYAPR06MB5893.namprd06.prod.outlook.com
 ([fe80::9995:d549:6e1c:c360]) by BYAPR06MB5893.namprd06.prod.outlook.com
 ([fe80::9995:d549:6e1c:c360%7]) with mapi id 15.20.1686.018; Mon, 11 Mar 2019
 20:14:59 +0000
From: Yong Qin <Yong.Qin@cypress.com>
To: "Tudor.Ambarus@microchip.com" <Tudor.Ambarus@microchip.com>,
 "jonas@norrbonn.se" <jonas@norrbonn.se>, James Tomasetta
 <James.Tomasetta@cypress.com>
Subject: RE: [PATCH v2 1/3] mtd: spi-nor: always respect write-protect input
Thread-Topic: [PATCH v2 1/3] mtd: spi-nor: always respect write-protect input
Thread-Index: AQHUuB8ZhXd2N1Mh6EWe4SXNj0Cyz6YE33oAgAAMRYCAAcsCAIAAWT4w
Date: Mon, 11 Mar 2019 20:14:59 +0000
Message-ID: <BYAPR06MB5893F6DEA9B0965E234983CD8F480@BYAPR06MB5893.namprd06.prod.outlook.com>
References: <20190129220705.5143-1-jonas@norrbonn.se>
 <20190129220705.5143-2-jonas@norrbonn.se>
 <db7aef53-43bc-2c14-12bc-2f0d452b4bc8@microchip.com>
 <cb41d4e3-d300-89da-3378-6305699d610c@norrbonn.se>
 <6e20b1c1-4eaf-bdcc-aec4-59dcbe2a8a34@microchip.com>
In-Reply-To: <6e20b1c1-4eaf-bdcc-aec4-59dcbe2a8a34@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Yong.Qin@cypress.com; 
x-originating-ip: [99.228.74.150]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a735b9c7-9423-4991-0b80-08d6a65e3cfe
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600127)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:BYAPR06MB5878; 
x-ms-traffictypediagnostic: BYAPR06MB5878:
x-microsoft-exchange-diagnostics: =?utf-8?B?MTtCWUFQUjA2TUI1ODc4OzIzOjVUK0tXK0RZZzRNNzRDaWRTS0sxVTdaUk5t?=
 =?utf-8?B?S2dVVDhWOWJZMXJzeUN4bVYvWndxeEVGVHROSEwzUUROcSt6ZWl4amNCMk1L?=
 =?utf-8?B?b1A2aDl6elk2OVFDNTcvVWNxM0I2YjFKZDJ4Tm1uRDRNb3hCbk9iUTk3Qi9u?=
 =?utf-8?B?cFJsSVVoYW1mRWE3UWJVbEJ5aEd4ZWJ5UFQxTDNiOUVENGIxMXNXNXFPcE55?=
 =?utf-8?B?VjFjREptamxySmN6MjI2aHloMjhYN2dOMDNlRkh4czdxQ05CNWw5UmJWbGV0?=
 =?utf-8?B?Q1RKRGdidDdOTkZzTnkrYUJZcTBjbFFyOCtQQ2wyV214Mm4vL1I1Zmp3RElZ?=
 =?utf-8?B?eHZXK3RLdExhNklPejJJTUIza2VoZzk1d1RXckdTSGdBQVZOTjB4L0o0K1BB?=
 =?utf-8?B?UUhsUEhPa0NvNWxGdWwvd2J6TVBFNzF3UndZbldyQU1aRUNoSEpYVDlKQVpO?=
 =?utf-8?B?ZVpnanRDdHEyNFMvK3E0TjBJY044Q0U5bzdDWXVvK0gvcFJhUU1jd1B6UFhV?=
 =?utf-8?B?V0VNYlk5SlVrYXRiVEo5KzZZcFRFWHpxSzVhekUxc2JjMVp4MVZEUVNqa2VL?=
 =?utf-8?B?QVZ1Wmg5T0xNZHpHV3RBK0J4NGxRcWkvYW10MVhhOHhLdHdMYXNRZkRVZ2Mz?=
 =?utf-8?B?ZnFNOW1rV0NpVzJoYUkyNkppdkVqMU5DcXVSaCtWdFpSN2dqeThMWDd0bUhH?=
 =?utf-8?B?d29ISHZpT1owdGFCVmR6cmM3VTVZQnZkME10Z0lVREJQK1I4VGRrT3p1Z0lj?=
 =?utf-8?B?UVovY1pXSXVEckFXdXY4bHlIYisrdkRyZmJVcXI3UDQ1T0g5T05LVEp0WkpL?=
 =?utf-8?B?ZkpJRENOQjJEWGt5S1JHSGJtNUpKZ0hTZGZ0THlmOWUzN0M2Um51bUpIYUJk?=
 =?utf-8?B?N2FHT3NydWFFY0V5NEp1OXFzWm9DcWk3ZEMrY2ZMR3Fkdk5VRi9tT2V1U2Za?=
 =?utf-8?B?VC8vZnJTaVZZa2hMdHQ5d0ZGZXpQUlN4bG9KU0IxQm5tbEJ3VXc3ZVBwSHh0?=
 =?utf-8?B?ZmF1Z2dZTmFOdVc2c24yOTJ1cEd3bnFPWndFQVdnQWlWQkFIRUxYbzVFNGFP?=
 =?utf-8?B?U21JOXdLYjJyTXBscXFCZzRQdUxURnpVNU5RK2l5ajVpdXdaakdMakFkNXJZ?=
 =?utf-8?B?NHJLQlBpbnIzclJ1YXdMekhTdFVmYXhPOXBvb1pMcDRueUp1QXhldVpObS9k?=
 =?utf-8?B?bkM1T1lJNE9IdTErWDQxVkp3K2RDSjBGZkpOUkdNTi94R3ZoRkRER2NCNWhh?=
 =?utf-8?B?S1lRdGtCRHVLL3Y0VXBJNzdQdVlpWGo0VGxQT2c1b0xKSXhvZDFTRWUvNWoz?=
 =?utf-8?B?djMyVWphektYVkRaUFQ1MVI1b1lpRHVXNVdHaktkcGpaNkJpd1pvTTM5MkZl?=
 =?utf-8?B?QWE2RmJVdnZvb1BtUFRVNkFKMkZNUFVvYTZ2SU5pRTRKM1FyVVRHZXNTbk5k?=
 =?utf-8?B?cWFqUmN0QmpsbzVuck1KQ2FqSXFLTkUvNytmMmhxTjhZOWcrOVpCMHBZbVRN?=
 =?utf-8?B?U05pOXdkT3dnTmxxTHJNUzI1V2h0QWdjU2xFdUhPOXJIbHc0L3NOZHhaV2Qv?=
 =?utf-8?B?YXgvZXJuZlFpU3ArWW55MW93TTZJVU1UMTJ0c29IWGhJZ2V6VndhVDQ3T3hQ?=
 =?utf-8?B?UGFiSmdlcS9kWmR3K1dvS2JHTVlEUmNJVlBJODFSRHZWeHZYN1ZZNXFKbi9p?=
 =?utf-8?B?UUEvRVZqeEJTbnRwWEgzRndxTlhyVEZzRjRrUkgxYnBaMFk4djIwcXBxMFdF?=
 =?utf-8?B?c0xHblBFdzQxNnhWdHVRM2x3TzFnbjJQUitCS1l5TmZLQzR2VlE1WDhzUUlu?=
 =?utf-8?B?L3ZLQ3N0bTBseVRhWnNHcWY5anBwVHAvSlQ4ZmdjYVJhSWhvVVp4ZkFPczc0?=
 =?utf-8?B?QVBjWWhUWmZZbkZNVGdtYjlYTFpXU3ordWtSUWhEUlByVnRQdnZsbWc1TlFF?=
 =?utf-8?B?TXZ5dVhNTmlRPT0=?=
x-microsoft-antispam-prvs: <BYAPR06MB58785138D06D969D9909D6D68F480@BYAPR06MB5878.namprd06.prod.outlook.com>
x-forefront-prvs: 09730BD177
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(376002)(346002)(366004)(39860400002)(396003)(189003)(199004)(53754006)(13464003)(55674003)(486006)(14444005)(54906003)(11346002)(4326008)(5024004)(186003)(476003)(53546011)(93886005)(97736004)(8936002)(9686003)(76176011)(86362001)(99286004)(26005)(7696005)(55016002)(33656002)(102836004)(446003)(25786009)(68736007)(6246003)(110136005)(316002)(53936002)(71190400001)(52536013)(74316002)(7736002)(106356001)(14454004)(305945005)(105586002)(478600001)(5660300002)(81166006)(81156014)(8676002)(66066001)(2501003)(6506007)(72206003)(6636002)(6116002)(71200400001)(256004)(6436002)(229853002)(3846002)(2906002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR06MB5878;
 H:BYAPR06MB5893.namprd06.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: cypress.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: TjFgqOd308xqymWvpKBDIUoIRJuqzOFQRV1EAdq4cX14SqBj/r4TwgE/BLLTQYR2iqwE0YU5toO9bzd9lUtJ7r6lU3h00BpM1BBj/65lsEEQhnRdJifY5vbVLE7UgWw+QPPwlXfeaU/88ykyUrZBvOAwbisZgx5+yw7eoOf1qCdWWWPJQpXnFWhvKvrZkVIiaNg9oPu6ejgq1bkCa2RvddpoTaL9vmFoBLC547DToN0Yi7k4SL+Wlu2Acma8TnnutLVcblTLelzG4fBItetZ9Ki7qubGzZu+RgsL+GXugw4kHA+6BjjXZOMusksTQ4EB1wLf6mtzjNUJkNQ8HjluVCFjcTn6HXZY0QJYHVCYXUUvt6LbxzTacco8d1h2q0fiddjN6/t4thAppiy1PB4TuK/uJXSxxPNPGuGklyqIuL8=
MIME-Version: 1.0
X-OriginatorOrg: cypress.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a735b9c7-9423-4991-0b80-08d6a65e3cfe
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2019 20:14:59.8221 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 011addfc-2c09-450d-8938-e0bbc2dd2376
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR06MB5878
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190311_131505_229474_6B6316D8 
X-CRM114-Status: GOOD (  21.04  )
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

Hello all,

SRWD bit (along with WP#) provides a way to protect Status and Configuration Registers from been modified unintendedly or by a malicious actor.

By default, SRWD bit is 0, which means no protection on registers alternations. Registers can be modified easily by WRR command. (this is most of the application use cases).

If set SRWD bit to 1, then when WP# is driven low during WRR command, WRR command will be ignored and Registers can't be modified. This provides a way to protect Registers, meanwhile still reserve the capability to modify Registers when necessary by driving WP# to high during WRR command.

Flash data array can be protected by DYB, or PPB, or BP0-2 and TBPROT, or combination of these three methods. These 3 sector protection mechanisms and combinations provide flexibility (different security level) of data protection. If a sector is protected by any of DYB, or PPB, or BP bit, then it is not programmable or erasable. If a sector has none of DYB, PPB, BP bit set, then it is not protected and is programmable and erasable.

DYB is volatile bit. It can be easily and fast modified on the fly, and will be set to default value upon power cycle or hardware reset. So it provides least security level protection, normally is used to prevent unintended program/erase commands. It also does not have wear limitation (i.e., unlimited times of alternations). One example of the use case is that set DYB bits to protect all the data array sectors right after system powers on. Whenever program or erase the flash data array, clear the DYB bit (set to unprotect) for the target sector prior to sending program/erase command. After program/erase complete, set the relevant DYB bit to protect the sector again.

PPB is non-volatile bit. It is a little difficult to change than DYB. It provides medium security protection level. PPB bits have the same erase/program lifecycles as the flash data array.

BP0-2 and TBPROT provide another level of security protection.

SRWD bit and WP# can prevent BP0-2 and TBPROT bits to be modified, which can provide one more level of security protection.

Best Regards,
Yong

-----Original Message-----
From: Tudor.Ambarus@microchip.com <Tudor.Ambarus@microchip.com>
Sent: Monday, March 11, 2019 10:06 AM
To: jonas@norrbonn.se; James Tomasetta <James.Tomasetta@cypress.com>; Yong Qin <Yong.Qin@cypress.com>
Cc: linux-mtd@lists.infradead.org; bbrezillon@kernel.org; richard@nod.at; marek.vasut@gmail.com; computersforpeace@gmail.com; dwmw2@infradead.org
Subject: Re: [PATCH v2 1/3] mtd: spi-nor: always respect write-protect input

Hi, Jonas,

On 03/10/2019 12:42 PM, Jonas Bonn wrote:
> Hi,
>
> On 10/03/2019 10:58, Tudor.Ambarus@microchip.com wrote:
>> + James and Yong from Cypress.
>>
>> Hi, Jonas, James, Yong,
>>
>> On 01/30/2019 12:07 AM, Jonas Bonn wrote:
>>> The status register bit SRWD (status register write disable) is
>>> described in many words in the datasheets but effectively boils down to:
>>>
>>> i) if set, respect WP# when trying to change protection bits;
>>> ii) if unset, ignore WP# when trying to change protection bits
>>>
>>> In short, the bit determines whether the WP# signal is honored or not.
>>>
>>> It's difficult to imagine the use-case where the WP# is connected
>>> and asserted but the user doesn't want to respect its setting.  As
>>> such, this patch sets the SRWD bit unconditionally so that the WP#
>>> is _always_ respected; hardware that doesn't care about WP# normally
>>> won't even have it connected.
>>>
>>
>> Always setting SRWD to 1, dismisses the need of a SRWD bit in the first place.
>> Do you know why Cypress made this bit configurable and didn't enable it by default?
>
> I suspect it has some historical relevance; as things currently stand, I don't see how it's useful in its current form.
>
> We initially thought that the WP# signal turned on/off block protection but that's not the case; the block protection bits BP0-BP2 turn on/off block protection and the WP# signal only protects the BP[0-2] bits from being modified.  Turning off the WP# functionality via the SRWD bits means that the BP[0-2] bits are always modifiable and therefore the flash device is never really protected from writes by a malicious actor.
>
> The key question here is:  if the WP# signal is connected, why would you ever want its state to be ignored by the device?  De-asserting the signal has the same effect as setting the SRWD bit.  And the default state is un-asserted if the signal is not connected, so that case is covered, too.  I see no reason not to just always set SRWD and thereby make the WP# signal do what one expects of it, always.
>

I tend to agree with you. Let's wait for a few days, maybe James or Yong will tell us the Cypress's reasons of making SRWD configurable. In the meantime I'll check the datasheets of the flashes that have SPI_NOR_HAS_LOCK declared, see if SRWD is configurable and what were the reasons of making it so.

Cheers,
ta

This message and any attachments may contain confidential information from Cypress or its subsidiaries. If it has been received in error, please advise the sender and immediately delete this message.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
