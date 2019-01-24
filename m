Return-Path: <SRS0=xpfJ=QA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 518C0C282C3
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 15:52:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F698218B0
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 15:52:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aiAeMmOo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=MicronCorp.onmicrosoft.com header.i=@MicronCorp.onmicrosoft.com header.b="HoFubRRE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F698218B0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=micron.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QBN6KfiIcvnvVnXG1AGsmlU9zVUR2GUlM0ambBApC1Q=; b=aiAeMmOoTkBBvd
	xyVa3BcGD3dJ+Vxk+fu/yhBv8LOu7Wz6F6peTQi/vSIKhtTp9W2xsxHXW9K0dQPiWBjcpf3QqLyi+
	ByNFksMw7tRx69q1j9LjSEXhqzDJOFZK1d7iBi2Zw5ujBPxbsT2QKP5VHNZ16bs93fcXQTuejGIv4
	96S8qFGKEL9gv/sAxeXnYLFSofuJBYAMavL/h4AHWzMDcP/bKDm12dPruDnsrxPEu3005N7gZ0i3M
	c8Ylr40NtIs009iAosMDDnrGDp8q+37Hsofmvdqu+aGwRO9YhCmZ1D1EkLliOk1j4Q2D5wQ7fYwQX
	CXTmZt98UtimYv+i+gWQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmhIi-0002vO-MA; Thu, 24 Jan 2019 15:52:20 +0000
Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmhIf-0002v5-5a
 for linux-mtd@lists.infradead.org; Thu, 24 Jan 2019 15:52:18 +0000
Received: from mail.micron.com (bowex36e.micron.com [137.201.85.221])
 by mailout.micron.com (8.14.4/8.14.6) with ESMTP id x0OFq61S008180;
 Thu, 24 Jan 2019 08:52:06 -0700
Received: from bowex17e.micron.com (137.201.21.213) by bowex36e.micron.com
 (137.201.85.221) with Microsoft SMTP Server (TLS) id 15.0.1365.1; Thu, 24 Jan
 2019 08:52:05 -0700
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (137.201.20.7) by
 bowex17e.micron.com (137.201.21.213) with Microsoft SMTP Server
 (TLS) id
 15.0.1365.1 via Frontend Transport; Thu, 24 Jan 2019 08:52:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=MicronCorp.onmicrosoft.com; s=selector1-micron-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3QjNV+FWHew/ZJeQgbA+p9pgqyuO8SF9VdhwLrdljYU=;
 b=HoFubRRE3Iu4ZliEoeeC12yTRbIlVVGSjIyB+xBTmCqKAbHw0QPqHKMyzJblxbmbG5VqMKDfW7hdXNiQR+R3h5SeCswMvLQW0WEDyTB10rpgeaApQruHmzTm7qOGdjpyrmXd8bT1C7s5ReNaWP6wporApndKD4NKWdNK5keQeTk=
Received: from BYASPR01MB0031.namprd08.prod.outlook.com (20.177.126.204) by
 BYAPR08MB4566.namprd08.prod.outlook.com (52.135.234.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1558.16; Thu, 24 Jan 2019 15:52:03 +0000
Received: from BYASPR01MB0031.namprd08.prod.outlook.com
 ([fe80::d419:6aa:fd87:333d]) by BYASPR01MB0031.namprd08.prod.outlook.com
 ([fe80::d419:6aa:fd87:333d%2]) with mapi id 15.20.1558.016; Thu, 24 Jan 2019
 15:52:03 +0000
From: "Bean Huo (beanhuo)" <beanhuo@micron.com>
To: Boris Brezillon <bbrezillon@kernel.org>
Subject: RE: [EXT] Re: [RESEND PATCH V2 1/2] mtd: core: add erase preparation
 hook function pointer
Thread-Topic: [EXT] Re: [RESEND PATCH V2 1/2] mtd: core: add erase preparation
 hook function pointer
Thread-Index: AdSvehBLGVr5lZ4nR3eqL0un6737JAABRJ8AAHqmBDAAAJ4tAACkDQGg
Date: Thu, 24 Jan 2019 15:52:03 +0000
Message-ID: <BYASPR01MB003118C655FAC3F9A85D81DDDB9A0@BYASPR01MB0031.namprd08.prod.outlook.com>
References: <BYAPR08MB453384AEAB702223F460039EDB9C0@BYAPR08MB4533.namprd08.prod.outlook.com>
 <20190118234236.0d296130@bbrezillon>
 <BYAPR08MB453351FB4AF6F99B24865822DB9F0@BYAPR08MB4533.namprd08.prod.outlook.com>
 <20190121103218.67a6600c@bbrezillon>
In-Reply-To: <20190121103218.67a6600c@bbrezillon>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=beanhuo@micron.com; 
x-originating-ip: [165.225.81.73]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BYAPR08MB4566;
 6:YmyEBhpMcjo5/yIhKAvi+E+FZh4ODc3f2OF1UXEWzgVeHXWdRd0ufbbneddHpuM69kfsgVNXWjirpOLi/tbIsGEEnE50Sg8baqJ9eFPfXjnyZbuenb2Qx3GGO8C3YKwxfkLiq1olTZj5Eo3vau3EwahoBBRLrTDZqGEUS9yn6Rn/Tm1pFatjURLiFfX3CjnSE6qxEM04EhWNJjs3WaGsp3VH6D2EGbUNwjOVFc8NSlgteCFBQBiprMwtuaGJb9PnNkz08ImcSkvU1XeUPlb9GRVPi70zGAdmT5Csrlj53MAft5/N1RDoPD/Jys3+vZnrB1YkS6F88TcmmWumxh0hw8+PCSunn+P8dd0d5a0EohJJo0ay1zV9X6/ts2KSjstP7JGdQrNKJz/JgdL5qqwmno2rXVTgF09Q30/WCUhrqtyeA7eLx/VfJnZ6TGo6CNcSRser6wFY+cBWq1cAQzTaIA==;
 5:lO5GOPGaW8RMnZbLGwPVpi6fcKQapT5Um7oa04nKSdkgVK6leqFuY3cA6y8cStaDafRGWi5wB3LeJXvyOwBNw3uKy8j9JZFDoFRaFeCgHVrZGXs4upmIAdavUlFLAkxvEC6yKUOXy6zhmgP/ynGCiB7RBUeOBleDeeKSLNYc0UK9c6vCmD9kPmL8at8f4zj3X0jE6i9RgLeeOv9dD9ERsQ==;
 7:G+upPV8ZeyDennnWLu8hOaezn+oUKaQK7u5V3/I7WI6jjToQNvS7WcB8TuGpt0tXGEoHdjqPoFr2jOrzoWXEyrlhdXNHeSeVLI+rpdz7JiZSJEJ+eiaTwQXjrTfGzYu1STAjgh445d5zlcLoL+bkrw==
x-ms-office365-filtering-correlation-id: c6a2ef1c-946d-4900-8642-08d68213e292
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
 SRVR:BYAPR08MB4566; 
x-ms-traffictypediagnostic: BYAPR08MB4566:|BYAPR08MB4566:
x-microsoft-antispam-prvs: <BYAPR08MB456646E0756F9066603BC081DB9A0@BYAPR08MB4566.namprd08.prod.outlook.com>
x-forefront-prvs: 0927AA37C7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(136003)(366004)(346002)(39860400002)(396003)(189003)(199004)(486006)(229853002)(93886005)(55016002)(71190400001)(71200400001)(33656002)(106356001)(68736007)(6116002)(3846002)(74316002)(9686003)(7736002)(476003)(66066001)(217873002)(305945005)(446003)(53936002)(14444005)(256004)(76176011)(6436002)(11346002)(26005)(55236004)(186003)(4326008)(14454004)(97736004)(8936002)(7696005)(86362001)(6246003)(478600001)(6506007)(99286004)(81166006)(81156014)(8676002)(107886003)(102836004)(6916009)(316002)(25786009)(105586002)(54906003)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR08MB4566;
 H:BYASPR01MB0031.namprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: micron.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vtYfGEVbL87a6bj2gbT9XFZK/DvhKpayb47gXLZQ0Vcw3zkXQROEQlh0giRbViibsfzTwe0P/6eJg52CGFqihqSrAup4wkPnqtUSAqgFoFkZacqekQcQY0bQm7eReisGlZj7Eotrkd+qgIGG9XUx3Ea1rvavysv4aeJ251k9lIOXECQIo7q7X+iIQZzAJqU5N4cJHu0WuovmUiHz9cBO2icU9ocd4iX4GJbpyC3i8SlPbdLSkEGDxP2UXDQwuGBLYarjGeTidtBDR6oLAwgjoH7SrftZyvqH5hy9kou6yqEKRLCPKG9pdB2+p5jhGLTNblnj24FVBlj2GT9aGk72FQJyZFrgI3YPCQ9VegqLeD3DgNNSDm/ZOCeAWcgxMZFkD+wMJmapbneRvxb8w5KISNhuaNDG8yj8u7FbIHeSJJU=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c6a2ef1c-946d-4900-8642-08d68213e292
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2019 15:52:03.5495 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f38a5ecd-2813-4862-b11b-ac1d563c806f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR08MB4566
X-OriginatorOrg: micron.com
X-TM-AS-Product-Ver: SMEX-12.0.0.1782-8.200.1013-24386.005
X-TM-AS-Result: No--1.929000-0.000000-31
X-TM-AS-MatchedID: 150567-139010-700251-707476-702020-707800-702067-703788-7
 02126-702098-701099-704421-708797-148004-148007-148020-148050-20043-42000-4
 2003-63
X-TM-AS-User-Approved-Sender: Yes
X-TM-AS-User-Blocked-Sender: No
X-MT-CheckInternalSenderRule: True
X-Scanned-By: MIMEDefang 2.78 on 137.201.82.98
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190124_075217_267791_F86B62B2 
X-CRM114-Status: UNSURE (   8.17  )
X-CRM114-Notice: Please train this message.
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
Cc: "richard@nod.at" <richard@nod.at>,
 "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>,
 "Zoltan Szubbocsev \(zszubbocsev\)" <zszubbocsev@micron.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Boris

>> >>  struct nand_manufacturer_ops {
>> >>  	void (*detect)(struct nand_chip *chip); @@ -49,6 +50,7 @@ struct
>> >> nand_manufacturer_ops {
>> >>  	void (*cleanup)(struct nand_chip *chip);
>> >>  	void (*fixup_onfi_param_page)(struct nand_chip *chip,
>> >>  				      struct nand_onfi_params *p);
>> >> +	int (*erase_pre)(struct nand_chip *chip, int page);
>> >
>> >Let's move this hook to nand_chip and name it ->pre_erase() or
>> >->erase_preparation().
>> >
>>
>> Can you tell us more reasons why moves this hook to nand_chip?
>
>Because it's supposed to be a per-chip thing. I mean, not all of your chips have
>this bug (at least I hope), so we want to only have a
>->pre_erase() implementation when it's really needed. The manufacturer
>specific ->init() hook will decide when it's appropriate to populate this -
>>pre_erase pointer based on the NAND chip id (or the NAND chip model).
>

>> In my opinion, it is better to add this hook in nand_manufacturer_ops,
>> since nand_manufacturer_ops Already exists in nand_chip, also this function is
>related to specific NAND manufacturer.
I still think, keep this hook in nand_manufacturer_ops is better, otherwise, just add one
Function hook pointer in nand_chip, it is very weird.

//Bean

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
