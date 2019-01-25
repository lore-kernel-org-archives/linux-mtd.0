Return-Path: <SRS0=EMkS=QB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA046C282C0
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jan 2019 13:39:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96E142085B
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jan 2019 13:39:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uAc7UwIb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=MicronCorp.onmicrosoft.com header.i=@MicronCorp.onmicrosoft.com header.b="EEzte+/j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96E142085B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=micron.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bfZD4VZ0LQUOImPuHInJdvrSj+0Zzu3OA0JAXiFCZgU=; b=uAc7UwIbElnyGx
	eG9e9W/Tg2qurB6orBaUfKSw6MHOJj3uRc18ItHXHnNqNGs4LNrMUrth8dnWu90KM0i3Se73MyzOn
	pCOBnlpRPVLPkYuvwLzAVTPY+4+OpytFn5CjJbgl1n966edBpmYK0zz167Wy3YqDLMakMr/lCvteN
	9I+Z/0hF0P9N7b2PgHVmmnVYwRMy2KvHTBRWermIoALbcoT5mVMAcV2HP8ys9vYKrlCe4DFYXNI3h
	tyGAwqKbASRsPOgSIVXotVqmYSKjTUYcacUVUxUd9oWCil8s/7Ivc48AnJWFIETmepjl7a++nZzm0
	MdNTr74I+wOi3xuQhs+A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gn1hj-0005jL-6x; Fri, 25 Jan 2019 13:39:31 +0000
Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gn1hh-0005j3-1p
 for linux-mtd@lists.infradead.org; Fri, 25 Jan 2019 13:39:30 +0000
Received: from mail.micron.com (bowex36f.micron.com [137.201.84.51])
 by mailout.micron.com (8.14.4/8.14.6) with ESMTP id x0PDdHVw018914;
 Fri, 25 Jan 2019 06:39:17 -0700
Received: from bowex36a.micron.com (137.201.85.222) by BOWEX36F.micron.com
 (137.201.84.51) with Microsoft SMTP Server (TLS) id 15.0.1365.1; Fri, 25 Jan
 2019 06:39:16 -0700
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (137.201.84.23)
 by bowex36a.micron.com (137.201.85.222) with Microsoft SMTP Server (TLS) id
 15.0.1365.1 via Frontend Transport; Fri, 25 Jan 2019 06:39:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=MicronCorp.onmicrosoft.com; s=selector1-micron-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uh/OQYffPy+iixiH2qLO/KPpOfCkmZ7NsXLYbekore4=;
 b=EEzte+/jr3X0PUluwprZaLefUwpboDPRCVo2W+OF14q1wI4nJy7h10r9wb1Htkf+29rqezP8ayjyT7DiCtu/VtNhwtdBYqvSKfeZrWRIHaXY86Dx93mFgQFS0voUavFC8WAtiYeRY2ArygBMz7ZmPfeFWOHOuqKhj4TqzFCqmOI=
Received: from BYAPR08MB4533.namprd08.prod.outlook.com (52.135.234.15) by
 BYAPR08MB4391.namprd08.prod.outlook.com (20.176.249.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1558.16; Fri, 25 Jan 2019 13:39:13 +0000
Received: from BYAPR08MB4533.namprd08.prod.outlook.com
 ([fe80::1182:ed1b:cf84:b5e3]) by BYAPR08MB4533.namprd08.prod.outlook.com
 ([fe80::1182:ed1b:cf84:b5e3%5]) with mapi id 15.20.1558.021; Fri, 25 Jan 2019
 13:39:13 +0000
From: "Bean Huo (beanhuo)" <beanhuo@micron.com>
To: Boris Brezillon <bbrezillon@kernel.org>
Subject: RE: [EXT] Re: [RESEND PATCH V2 2/2] mtd: core: NAND filling block
Thread-Topic: [EXT] Re: [RESEND PATCH V2 2/2] mtd: core: NAND filling block
Thread-Index: AdSvejlpF3Q6HUqcQlOcRwI7zje2QQABHseAAIBLtWAAAclogADK11Xw
Date: Fri, 25 Jan 2019 13:39:13 +0000
Message-ID: <BYAPR08MB45339AB26F5CC0FC6378C4E3DB9B0@BYAPR08MB4533.namprd08.prod.outlook.com>
References: <BYAPR08MB4533401FB969CA9A8D254F34DB9C0@BYAPR08MB4533.namprd08.prod.outlook.com>
 <20190118233943.5f003eef@bbrezillon>
 <BYAPR08MB4533ADDA97A62DF732E565B1DB9F0@BYAPR08MB4533.namprd08.prod.outlook.com>
 <20190121134423.6c1765a3@bbrezillon>
In-Reply-To: <20190121134423.6c1765a3@bbrezillon>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=beanhuo@micron.com; 
x-originating-ip: [165.225.81.73]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BYAPR08MB4391;
 6:p7nnAlUIXfE8MT4SU3CDg43TeZrUqStBkpu7D528Ng5SInHe3DnmTtwj13hoCKA5JjtH8um4fqBkGtps/ziRRS02UdkncQDeoCw4G3VXV2VjgZWI4LaWligP6tMdeoDIyjpdFTmOOJ0P6LioYHnsGbfK9mXOo2upETZ4JOIKRvkiL3yLthMvQ6GOvSYECb3veNquZI/gh8sTgp0WMnGT3Jh821BZFqQ8iuZMtvxTiah3ezyd15th0h5Pm2JwP+WXlxxrHy7NGdgQQrtfpIjcVzsjdnpeHzQd11Qtp+0PMz20PFvjEP2wBbZeJqAChIqQT2TY28T/1bzTBCI+NECEe9fKJwJfU8rqpCbGer0S+WPt0Axk9b5GKK9t1XRSY9N9YaBfD+Tx9ixApVehzSpn+1NMjrfop+8h1UYEnMb/7jVvEQZQpwHF91IbKPR9iD15n3wzPfDXxOqlYkFZlzrJCw==;
 5:BXEoDgXJvwg1A0cHer4SPBhnNnbehyUznu0FFr28P7W0n1G6537zOK4DjrOpLruVR6d2CcKt//Ar5y9VD9wQosOeioADx8UXn/3Mr+1rZOX6yiDd8M5hX6CpIR0SodFNRLfTPukepmwB5nHM9M1RshfU0FUdEDarvAh616K6ikUi2cuHs2rVAG0qdexgc+cCZ3SNPnLLY4eGQBmmK89yYg==;
 7:8eLsNjRG6JpEi2aygmDBEqg+9TEzzs0S9vEMAc2mKl65QM8Eg88u0YcB/l2Y7pikOrvCKDwqHsVxVshDm829YOwT9tj2MITFwA6+T3C+/DF7wKFRsxEg+q7O//ys/dmS8TzBUc5kbWfXGKlSftcbuQ==
x-ms-office365-filtering-correlation-id: 4778ff31-78f8-4f70-58d1-08d682ca7ea2
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
 SRVR:BYAPR08MB4391; 
x-ms-traffictypediagnostic: BYAPR08MB4391:|BYAPR08MB4391:
x-microsoft-antispam-prvs: <BYAPR08MB439143718FA7358C4A28262EDB9B0@BYAPR08MB4391.namprd08.prod.outlook.com>
x-forefront-prvs: 0928072091
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(376002)(346002)(39860400002)(136003)(366004)(189003)(199004)(93886005)(7696005)(217873002)(6436002)(8936002)(229853002)(2906002)(9686003)(86362001)(256004)(99286004)(4326008)(6246003)(4744005)(53936002)(25786009)(316002)(76176011)(107886003)(71190400001)(71200400001)(54906003)(11346002)(186003)(305945005)(446003)(8676002)(97736004)(55236004)(74316002)(33656002)(81156014)(476003)(81166006)(26005)(486006)(6506007)(102836004)(7736002)(66066001)(14454004)(68736007)(3846002)(6116002)(55016002)(478600001)(105586002)(6916009)(106356001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR08MB4391;
 H:BYAPR08MB4533.namprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: micron.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1w9ODpMmAXP2Z2HrqfA4N/mo0QfJFwzv9UhdGYxLHWEBhl6NQz9lbgHan9Zwnnuf3d5O7crf8jqpSv495ji10obYe7h42/BmfWI/v/IvK9quFOOCB7LCvIa6hEuxA6aG0DgosayzTjdJQeRtqrwDQrZDUT8NdfN/F83rwRfk/qqbyorq8m17bWatW9yR2xTjn4GJAK9mbFJUU0WEstWSShFLiGt+x94VyHQaw9LLivxORppFN+36t2KcKApJZh+DAObf0JxXLfDBUZViCFyzZ3UTbSm9AJIEMWRaq4YFvgXN8In8GOKjKeevxaG5uTmG3IzEHcbhtrJjfhaPgdv9zStBwLaDLp3QnLgGMPLsq7/MYtC9gldsLftqVbPQI6jVLDBTqa2IijJo1NFmbBieBTpp0KEGvCJe+qdcOlNMje8=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4778ff31-78f8-4f70-58d1-08d682ca7ea2
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2019 13:39:13.6715 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f38a5ecd-2813-4862-b11b-ac1d563c806f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR08MB4391
X-OriginatorOrg: micron.com
X-TM-AS-Product-Ver: SMEX-12.0.0.1782-8.200.1013-24388.005
X-TM-AS-Result: No--0.246400-0.000000-31
X-TM-AS-MatchedID: 150567-139010-703399-704935-709584-700104-711432-701594-7
 08712-148004-148007-148020-148050-41000-42000-42003-63
X-TM-AS-User-Approved-Sender: Yes
X-TM-AS-User-Blocked-Sender: No
X-MT-CheckInternalSenderRule: True
X-Scanned-By: MIMEDefang 2.78 on 137.201.130.65
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190125_053929_166303_D039D699 
X-CRM114-Status: UNSURE (   4.43  )
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

>> >
>> it is still 15 pages, page0~page14. But it is now odd pages, there
>> will one less odd pages than even pages.
>
>Why only odd pages? You did not reply to this question yet, and I really want to
>understand why.
>

Programming only odd pages will be effective, while reducing the number of programmed pages.
This is related to the proprietary device architecture and erase procedure. 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
