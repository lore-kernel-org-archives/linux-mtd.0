Return-Path: <SRS0=TRF+=P5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93888C282DB
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jan 2019 10:33:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C08E20870
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jan 2019 10:33:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fIkR8BwI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=MicronCorp.onmicrosoft.com header.i=@MicronCorp.onmicrosoft.com header.b="Nc2pGuak"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C08E20870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=micron.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fQDLGun8dUx6p1wYbRgQBXIsfwyMCom8SMQK+EX2/dE=; b=fIkR8BwI66KBTL
	H3c/QN1ZxL7oQUFZ1QHlUHbbp+m8FxU+XvAJQbFiggby5+YpxGBDCnEra9P1r9KEDqPCsgykP2tKr
	EHs1dd7ZDqcZgSaqsVXzBXEDZf5zlugLyb4vTV+yZH5x08IRS6XdF0z3Qc9WAW71Woyuxf2HJWR8f
	62suQXelAYXBa9j3PglpOIK5H/EQLk0cvTk4DCNEIMeUxwNYBhTlV3Kk6Y4ftJUA1QjR7UpXRbbKN
	BzS3J8kd1BKTaBPvt6VBrW5yJbMwhewiKe+u4Qmm7z4u7rCQL/57kglLYz2RBNd5eu6kaGsFY7L8b
	N9ABvkHev4mLy7IwB7vQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glWtR-0001QV-LG; Mon, 21 Jan 2019 10:33:25 +0000
Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glWtP-0001Q9-B7
 for linux-mtd@lists.infradead.org; Mon, 21 Jan 2019 10:33:24 +0000
Received: from mail.micron.com (bowex36c.micron.com [137.201.84.132])
 by mailout.micron.com (8.14.4/8.14.6) with ESMTP id x0LAX7AS001453;
 Mon, 21 Jan 2019 03:33:07 -0700
Received: from bowex36c.micron.com (137.201.84.132) by bowex36c.micron.com
 (137.201.84.132) with Microsoft SMTP Server (TLS) id 15.0.1365.1; Mon, 21 Jan
 2019 03:33:07 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (137.201.84.23)
 by bowex36c.micron.com (137.201.84.132) with Microsoft SMTP Server (TLS) id
 15.0.1365.1 via Frontend Transport; Mon, 21 Jan 2019 03:33:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=MicronCorp.onmicrosoft.com; s=selector1-micron-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hXH8I4U9/K21warRohly5Lh8LjVU36+iCkO2hPuBuBw=;
 b=Nc2pGuakTlwL31vz6yEKZfjA5kidp+Gs1obyfAibn34rYUDvh/SnNmkllHRhoiKrMHir9zvtyokvYsTSou2vplYLVLy1CqfBFw4ODtKNNqti9GK49zhx8cr3WqX4Gq8agmaaAjGV5RhNTW1dE6arhTDzG1Yd5tKUHG76wuP0p7U=
Received: from BYAPR08MB4533.namprd08.prod.outlook.com (52.135.234.15) by
 BYAPR08MB6008.namprd08.prod.outlook.com (20.178.51.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1516.18; Mon, 21 Jan 2019 10:33:05 +0000
Received: from BYAPR08MB4533.namprd08.prod.outlook.com
 ([fe80::1182:ed1b:cf84:b5e3]) by BYAPR08MB4533.namprd08.prod.outlook.com
 ([fe80::1182:ed1b:cf84:b5e3%5]) with mapi id 15.20.1537.031; Mon, 21 Jan 2019
 10:33:05 +0000
From: "Bean Huo (beanhuo)" <beanhuo@micron.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Boris Brezillon
 <bbrezillon@kernel.org>
Subject: RE: [EXT] Re: [RESEND PATCH V2 1/2] mtd: core: add erase preparation
 hook function pointer
Thread-Topic: [EXT] Re: [RESEND PATCH V2 1/2] mtd: core: add erase preparation
 hook function pointer
Thread-Index: AdSvehBLGVr5lZ4nR3eqL0un6737JAABRJ8AAFVSIAAAJ01mAA==
Date: Mon, 21 Jan 2019 10:33:04 +0000
Message-ID: <BYAPR08MB45339748DD53F6EEC4C4A642DB9F0@BYAPR08MB4533.namprd08.prod.outlook.com>
References: <BYAPR08MB453384AEAB702223F460039EDB9C0@BYAPR08MB4533.namprd08.prod.outlook.com>
 <20190118234236.0d296130@bbrezillon> <20190120162548.54cd26d9@xps13>
In-Reply-To: <20190120162548.54cd26d9@xps13>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=beanhuo@micron.com; 
x-originating-ip: [165.225.81.73]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BYAPR08MB6008;
 6:36JX3xFmF12r5B8Xp+jrzQagtgMD4xo/jujZX48kM9ZIESe7uBQ1HDnQyCTdnU+u8npljJyeV13X2glFN370MgJ/xhcCJpEwAMwSga/sODVt7VceF4hqEdjnXX7tH4jW+EFlAev+QUeZSmFhSoaUGtopAWySQwY1cXdJ/rZSa8s7rL7SYtvYpop7vOTgGupZvoIdxcUymelMuKhNWYOjzfx+O0GBdoaMBQhMU82ZHwRxR51ewWTmT8bD6bhJpU5zIp1lj33q1IO6Ayia5dXfh2RQovmAi49hmPUClCwTEdlLcECSUItG+pUPlW4h+NaBzXwgRKSkfRdnYJN4VoZsgdBA3lDMxPFSKTHSXX5gLY9J6CejG59XDhpkqqMjaIh4AVvZ/SOnSI/IzoL38OtvnvzKcDF4d1JFC1B3GKBBljj6wS6UKcuNXfSIJW/My/AwSABd/kxzqQZK9IQqr4ErEg==;
 5:G71sfXS61e9n76lTK9JT9ZC/2XW8ZBofwDBFZnNGjT7iUeB0gmXPc4DAz4ol6tbAAvgeU8fwk2kxhNSH5TWZ6DzIlcqElKI3Jq3Hc43b8rzhysuC6duxc58sQaZMPqp/OsksPUGZg1kKSaXB6/oKZJdR3qPYnndEQjU01/eMdQugoHEMS2cjPN/FvwToVTVif5XAyE/1jLd6o1ragMpV1A==;
 7:ObyvoPgAeZ4Tu0u8bnOpjbwSKEmY4JC5A+NkB/iRtnAVOHYK6I3FHXsoJ2xSZUildrOmUSybCXoJZLMqYwbQ56QCXKEhOfowIDdSAhIkmAfXaIzvwMnhqjXdgU1EPJ2LYH89mdnqTL2tkm5N8Gu8QQ==
x-ms-office365-filtering-correlation-id: 1fc5e309-0093-4fb8-ded4-08d67f8bd3d3
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(2017052603328)(7153060)(7193020);
 SRVR:BYAPR08MB6008; 
x-ms-traffictypediagnostic: BYAPR08MB6008:|BYAPR08MB6008:
x-microsoft-antispam-prvs: <BYAPR08MB6008A828B10F8F601EC4847FDB9F0@BYAPR08MB6008.namprd08.prod.outlook.com>
x-forefront-prvs: 0924C6A0D5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(366004)(396003)(376002)(346002)(39860400002)(199004)(189003)(71200400001)(6246003)(476003)(486006)(256004)(55016002)(229853002)(25786009)(14454004)(71190400001)(66066001)(74316002)(6506007)(217873002)(97736004)(33656002)(81166006)(55236004)(8936002)(4326008)(107886003)(102836004)(81156014)(106356001)(76176011)(26005)(54906003)(9686003)(99286004)(7696005)(86362001)(2906002)(105586002)(186003)(316002)(8676002)(6436002)(11346002)(3846002)(68736007)(4744005)(305945005)(6116002)(53936002)(478600001)(446003)(110136005)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR08MB6008;
 H:BYAPR08MB4533.namprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: micron.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: H7fdkYxSNGZmV4rlYZHXYwUusbVTf47GWeueMoptApjfbHC2zC3ooKCyWqWaVfiMvxdQMGHSTMZ7rhchIR5DX23/Uxq/T4h/JTQzzx/r0FaDotgI1ZBsHZRNxAkRP+gyox+FISHlfwfMvjf7P2neDAgyM3azRRZ2yWPO9rmwO6KuY2aW0n6sh8F1Z9n7i3958MqzdsrjJYzxiqIUFw+jmuMqvrwcn5Oid5M8pvL5++fhSoyD15xIIYtwYGW7peQvw64Lrk72/qZyYgTc56UIuJskLDjK5SmWbzqwAE8Dh8SAvcbfamw5duvEnZbU3S0+m1c9HCsPM8zAcEEWhllyrtpczD26AiuBgGskTCfCEl+b7B/fkGPEV3LbkSKX8yzoh87/7gq4V9HYrX6D6n7bp8IUTrK2eo9nmPwDoLVzJnE=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fc5e309-0093-4fb8-ded4-08d67f8bd3d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2019 10:33:04.6813 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f38a5ecd-2813-4862-b11b-ac1d563c806f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR08MB6008
X-OriginatorOrg: micron.com
X-TM-AS-Product-Ver: SMEX-12.0.0.1782-8.200.1013-24378.005
X-TM-AS-Result: No--2.475400-0.000000-31
X-TM-AS-MatchedID: 150567-700107-139010-188019-105700-701698-701604-704501-7
 04980-704034-702020-148004-148007-148020-148046-148133-10019-41000-42000-42
 003-63
X-TM-AS-User-Approved-Sender: Yes
X-TM-AS-User-Blocked-Sender: No
X-MT-CheckInternalSenderRule: True
X-Scanned-By: MIMEDefang 2.78 on 137.201.130.65
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190121_023323_489887_D576802F 
X-CRM114-Status: UNSURE (   8.56  )
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
Cc: "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "Zoltan Szubbocsev \(zszubbocsev\)" <zszubbocsev@micron.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "richard@nod.at" <richard@nod.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Thanks for reviewing, Miquel.

>> > diff --git a/drivers/mtd/nand/raw/internals.h
>> > b/drivers/mtd/nand/raw/internals.h
>> > index fbf6ca0..8382948 100644
>> > --- a/drivers/mtd/nand/raw/internals.h
>> > +++ b/drivers/mtd/nand/raw/internals.h
>> > @@ -42,6 +42,7 @@
>> >   *	     is here to let vendor specific code release those resources.
>> >   * @fixup_onfi_param_page: apply vendor specific fixups to the ONFI
>parameter
>> >   *			   page. This is called after the checksum is verified.
>> > + * @erase_pre: preparation before actually erase a physical block.
>
>What about "prepare a physical erase block before erasure" ?

I prefer your suggestion, apply it to next version patch.

//Bean
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
