Return-Path: <SRS0=TRF+=P5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC54EC282DB
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jan 2019 10:04:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A7C120663
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jan 2019 10:04:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V/L3bPN6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=MicronCorp.onmicrosoft.com header.i=@MicronCorp.onmicrosoft.com header.b="CmgqixYM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A7C120663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=micron.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Ztdm/I6CoqTyF4VS6+utVjgZpKo6CgLYyVdCnh/1a0=; b=V/L3bPN68wbRKa
	glusJ9s8dJNlishl83Nxl6OakLQexHbM0YLKp6TMhcqE7G9Yz2brQSdB8Vk6ucUphLgIRnXZJ7Vly
	bujGkcUmgDEoB/n9XrAr/vkvXQuHoij2+S+H6sZNQfj/d9ZdRKudG68Tab6t73ZhhwSPFTpqQgUp5
	ol/eFYMVqjkk5Yz99oY9mufHgsZDViAkVG/oxW4QP/VVIkVtMdr/62KlRqLnBXbFzN5IOzM01xhG9
	/femzfMc1n38K+bh0xKB/vHtjbfjjGz6ybc6gZsgLnU91ol99JJ0FC6e3WttGs8V6ncvc4ZHi6rVp
	fk+Mo9WjlkR9RS9IpDnQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glWRX-0006FI-Tu; Mon, 21 Jan 2019 10:04:35 +0000
Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glWRU-0006Em-Cu
 for linux-mtd@lists.infradead.org; Mon, 21 Jan 2019 10:04:33 +0000
Received: from mail.micron.com (bowex36g.micron.com [137.201.84.120])
 by mailout.micron.com (8.14.4/8.14.6) with ESMTP id x0LA4J4L032586;
 Mon, 21 Jan 2019 03:04:19 -0700
Received: from bowex36e.micron.com (137.201.85.221) by BOWEX36G.micron.com
 (137.201.84.120) with Microsoft SMTP Server (TLS) id 15.0.1365.1; Mon, 21 Jan
 2019 03:04:18 -0700
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (137.201.84.23)
 by bowex36e.micron.com (137.201.85.221) with Microsoft SMTP Server (TLS) id
 15.0.1365.1 via Frontend Transport; Mon, 21 Jan 2019 03:04:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=MicronCorp.onmicrosoft.com; s=selector1-micron-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EhN6/rvnm165iMDl0W+HqSP5PA/BqWBvEedeA0Y9WnM=;
 b=CmgqixYMkbNdxyVSLVoUfbppbEJlxponojAqnnh8QtObLPqUOv4T8XAKxY6/f/DBbiFmI2fdVV6o2pCW0EN+imKCeBI/reg4Kanc1L2GSH093Ff1PwYyxp8YzFKVcmw7Ti4KZb0i8zH+IdN8SIRHj+/AztTwPzu2oVtzA0c0Nww=
Received: from BYAPR08MB4533.namprd08.prod.outlook.com (52.135.234.15) by
 BYAPR08MB4952.namprd08.prod.outlook.com (20.176.255.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1537.29; Mon, 21 Jan 2019 10:04:16 +0000
Received: from BYAPR08MB4533.namprd08.prod.outlook.com
 ([fe80::1182:ed1b:cf84:b5e3]) by BYAPR08MB4533.namprd08.prod.outlook.com
 ([fe80::1182:ed1b:cf84:b5e3%5]) with mapi id 15.20.1537.031; Mon, 21 Jan 2019
 10:04:16 +0000
From: "Bean Huo (beanhuo)" <beanhuo@micron.com>
To: Boris Brezillon <bbrezillon@kernel.org>
Subject: RE: [EXT] Re: [RESEND PATCH V2 2/2] mtd: core: NAND filling block
Thread-Topic: [EXT] Re: [RESEND PATCH V2 2/2] mtd: core: NAND filling block
Thread-Index: AdSvejlpF3Q6HUqcQlOcRwI7zje2QQAB5BGAAHucq4A=
Date: Mon, 21 Jan 2019 10:04:15 +0000
Message-ID: <BYAPR08MB4533227B317D5AA334FEB240DB9F0@BYAPR08MB4533.namprd08.prod.outlook.com>
References: <BYAPR08MB4533401FB969CA9A8D254F34DB9C0@BYAPR08MB4533.namprd08.prod.outlook.com>
 <20190119000135.0064da24@bbrezillon>
In-Reply-To: <20190119000135.0064da24@bbrezillon>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=beanhuo@micron.com; 
x-originating-ip: [165.225.81.73]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BYAPR08MB4952;
 6:OMOQb+QAJwjlk/tVRPIB9BP3kGO+hmartwE/Bbbc+Z9izGVYdHfCn6daKF8I9l3e6IUkgaX4/BGBuLPwV6omZ+utXxYpqaITQMd+bc3rW32aNrqVGV6I4PwWNbSLwp+nJSpABihpNuX8aebykVSUG9rZn8+gQKMKdtHkUkZlD1PKmMWKAvXiwUaiYVLvSLuNBMgZAeCH3cyN6hZ8WgO7UYU7WiBlnhBlKLcaNWBviwLhc6s6hCZ45FOzn9d+GLXN8SDwbuRANVW9dOf/nsnrE6KZ9jeYSyvpHonlGQZ2XoXKg3wEO/j2sfAUXy7GWRPIva923CLzt7ZIJ8lGOlMzQ9oziyTdqIMzM4h6aNDXcUo2D6E6+hkHve0aHvtvcc2xsOfa/EsvlktE97QEyHdttRDSzCa6q9p6X8lV5Nnx0CHQ6HcS8fUATPtLd7RfmE3n7MKcn3OBMBzZzcj0f9ZOVg==;
 5:sIljnf5YjRkUZ95YPabQ7smzOu1X6o4ULR9YwXqTggMjNONprnAMbiwXCl80iRwbxcTx1YhtqOx2Ft5L3LLdLO3BFT/YDmHmQPLai56k6AWB5uB/z4LBkEHYoDbS3yLhAOVq/VgqmsKXkDcWrE9kaic5/YhaIg4PLgilHlYykJdzP0Wguc+Xk6jsKrNEuDTwk2M4kYgTbCgGMMH9WLxlzQ==;
 7:517Snu4snAFwKmzlE9irUl5NjZSuuTgpwXGBXvuYJ8ONc0GLFSxnoemN03pfs7CSS594yLg14nM1dhVIgedZjvn+2QIECgZOEJNa9dHktrLyuXLgLCrqiTRxA1R+DXi/shcadjuAN/E+qlmvCLr9lA==
x-ms-office365-filtering-correlation-id: 08c0d40f-493f-4337-e98d-08d67f87cd57
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(2017052603328)(7153060)(7193020);
 SRVR:BYAPR08MB4952; 
x-ms-traffictypediagnostic: BYAPR08MB4952:|BYAPR08MB4952:
x-microsoft-antispam-prvs: <BYAPR08MB495240549C2205D28D8AF645DB9F0@BYAPR08MB4952.namprd08.prod.outlook.com>
x-forefront-prvs: 0924C6A0D5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(366004)(39860400002)(396003)(136003)(346002)(189003)(199004)(53936002)(86362001)(6506007)(256004)(4744005)(14444005)(6436002)(229853002)(55236004)(102836004)(14454004)(217873002)(2906002)(97736004)(26005)(106356001)(76176011)(105586002)(305945005)(7736002)(81156014)(81166006)(8676002)(8936002)(99286004)(9686003)(7696005)(71190400001)(71200400001)(66066001)(316002)(478600001)(3846002)(55016002)(107886003)(486006)(68736007)(186003)(74316002)(25786009)(4326008)(54906003)(6916009)(446003)(11346002)(6116002)(476003)(33656002)(6246003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR08MB4952;
 H:BYAPR08MB4533.namprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: micron.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hbOubshABDmoC+unNNvvfK2u4z26/88+edGWBmVE0CaiVBHT5R9d2Cn/yYiyai6Klxr936KmDN4N4DRJ/Ayhj3jGQEMJ6XQgKxIAFMEjZtTWn2riirVQwUnSvwaGmFRuSNn3ZWwpUONmQb45WcAT9YcLPm+uO+VFNx3hs5D6fRGuUoDOJMqODNE8iUh2MbSlbdRHGc7CqNP7RouImIxGuwTu3yVNGqgjwi+doWNF0BlCM0xntTwm28dvMScH4qXzM8V0lH0Q/tGLC93q2aJeC1I5UPp85SU2cGSWj7JnQt+5i1nzc60AM0boDG8kJVs+CwIj9rPLQG0BWCmXtHm7UofYzejalrtX8SppVTp6AuKUykxpZN8ovNSzKjUxuTybNNAxV3HA2Ot5YtgII82NoG53nNGHiLDBAnMTRS055Kw=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 08c0d40f-493f-4337-e98d-08d67f87cd57
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2019 10:04:15.9875 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f38a5ecd-2813-4862-b11b-ac1d563c806f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR08MB4952
X-OriginatorOrg: micron.com
X-TM-AS-Product-Ver: SMEX-12.0.0.1782-8.200.1013-24378.005
X-TM-AS-Result: No--0.929000-0.000000-31
X-TM-AS-MatchedID: 150567-139010-851106-700075-707325-703712-707654-702358-7
 01403-704214-701398-148004-148007-148020-148050-10018-41000-42000-42003-63
X-TM-AS-User-Approved-Sender: Yes
X-TM-AS-User-Blocked-Sender: No
X-MT-CheckInternalSenderRule: True
X-Scanned-By: MIMEDefang 2.78 on 137.201.130.65
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190121_020432_499233_D69ED7AD 
X-CRM114-Status: UNSURE (   6.31  )
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

>On Fri, 18 Jan 2019 22:12:04 +0000
>"Bean Huo (beanhuo)" <beanhuo@micron.com> wrote:
>
>> +	/* Corrupt page0 and page1, in order to simulate an
>> +	 * uncompleted eraseing scenario. Just for case of
>> +	 * power loss hits while below programming. in this
>> +	 * way, the PEB will be re-erased again.
>> +	 */
>> +	empty_page_mask |= 0x3;
>> +	memset(data_buf, 0xAA,  mtd->writesize);
>
>Why do you use the 0xaa pattern BTW?

Random pattern or any pattern is ok. Just to fill in page.

//Bean


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
