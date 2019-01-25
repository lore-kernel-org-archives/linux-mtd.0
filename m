Return-Path: <SRS0=EMkS=QB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 810DDC282C0
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jan 2019 13:31:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50AE4218CD
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jan 2019 13:31:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xe9F285+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=MicronCorp.onmicrosoft.com header.i=@MicronCorp.onmicrosoft.com header.b="WsdMa3rq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50AE4218CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=micron.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KCcJdTmmvJ5lb09VEU2pdwn53n0PTpm+4DJJRxPHCHE=; b=Xe9F285+8ZaiTR
	pw1WoqJ+0dGV90Xbeq2FuuPVOuRXOrDwYN+NOrt3k7mKXA7Kfab2iO5CkuOvJoDe4GBIkq4kHSZh5
	pQdvxXD1gY0Z8AfZn0XjS8O0nuXSlZ5q6pS4MDOzye0HP/1FMITrK3xPeTKuGsZ5p465SPuLhFCQa
	z+RsDY/N4v2w0xOYNbUDAY4fpVpOupx0NfmsYpWm2OGO5pPi2h6QQrd3W4Hxw3M7OplASiyTTeNDH
	gZ2LbCMQFjvRN9SGTTvK31H8GfmHY7lh0OlyjQ9DpvWzlfrfdjZmM60IO4cKiSEeTeaK4Jkb/8+uE
	QsQSW50/meXXcX9Om6bg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gn1a3-0003vi-K0; Fri, 25 Jan 2019 13:31:35 +0000
Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gn1a0-0003v3-09
 for linux-mtd@lists.infradead.org; Fri, 25 Jan 2019 13:31:34 +0000
Received: from mail.micron.com (bowex17g.micron.com [137.201.20.31])
 by mailout.micron.com (8.14.4/8.14.6) with ESMTP id x0PDVJHW020722;
 Fri, 25 Jan 2019 06:31:19 -0700
Received: from BOWEX17H.micron.com (137.201.20.32) by BOWEX17G.micron.com
 (137.201.20.31) with Microsoft SMTP Server (TLS) id 15.0.1365.1; Fri, 25 Jan
 2019 06:31:19 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (137.201.20.7) by
 BOWEX17H.micron.com (137.201.20.32) with Microsoft SMTP Server (TLS)
 id
 15.0.1365.1 via Frontend Transport; Fri, 25 Jan 2019 06:31:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=MicronCorp.onmicrosoft.com; s=selector1-micron-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YyvNweNMWgQRiZei7VMk7+pg1UWyStNmdTpgFGtCrXY=;
 b=WsdMa3rqAh+YHVJyQSXb9c7SlUqjkF/rDrXy2XqIziR0Yl/HugkFHycma63NRAUcHnlqi0tF578wgbap/M2vWyyUkaGcoruGEJ+CwUS6NtwnDvw9kHNRzT9iyJ2I+4vye8UFAOfmiWHUnqzGK78JXxAWanYZzG38Eb5uVL/bJKc=
Received: from BYAPR08MB4533.namprd08.prod.outlook.com (52.135.234.15) by
 BYAPR08MB5030.namprd08.prod.outlook.com (20.177.125.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1558.21; Fri, 25 Jan 2019 13:31:17 +0000
Received: from BYAPR08MB4533.namprd08.prod.outlook.com
 ([fe80::1182:ed1b:cf84:b5e3]) by BYAPR08MB4533.namprd08.prod.outlook.com
 ([fe80::1182:ed1b:cf84:b5e3%5]) with mapi id 15.20.1558.021; Fri, 25 Jan 2019
 13:31:17 +0000
From: "Bean Huo (beanhuo)" <beanhuo@micron.com>
To: Boris Brezillon <bbrezillon@kernel.org>
Subject: RE: [EXT] Re: [RESEND PATCH V2 2/2] mtd: core: NAND filling block
Thread-Topic: [EXT] Re: [RESEND PATCH V2 2/2] mtd: core: NAND filling block
Thread-Index: AdSvejlpF3Q6HUqcQlOcRwI7zje2QQAB5BGAAHucq4AAAGjwgADPxaSw
Date: Fri, 25 Jan 2019 13:31:17 +0000
Message-ID: <BYAPR08MB4533275427ECE1990F28B747DB9B0@BYAPR08MB4533.namprd08.prod.outlook.com>
References: <BYAPR08MB4533401FB969CA9A8D254F34DB9C0@BYAPR08MB4533.namprd08.prod.outlook.com>
 <20190119000135.0064da24@bbrezillon>
 <BYAPR08MB4533227B317D5AA334FEB240DB9F0@BYAPR08MB4533.namprd08.prod.outlook.com>
 <20190121111255.79be03de@bbrezillon>
In-Reply-To: <20190121111255.79be03de@bbrezillon>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=beanhuo@micron.com; 
x-originating-ip: [165.225.81.73]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BYAPR08MB5030;
 6:kI+8FBg7x5exHNdxmGhqkqYCCbRBXfcfj4Puube9BMkdCz/XMVAhQvERjdFoxaVcPCTeuuG/IoN43kAHrj7iZfWfZlr8SBzSO9/w1tkhj6Aww2Ac5hx3iMZ//TuoZagPOo6bp+hbU7CPH+4NsuMyOqc+SwCZqvIKqt/2fu9DPfiNSGZN91ky4uFUTLUzq3quvcDkyyuXaFGMeRK6a1Xe4x+Q5fjJkQ7HLvre1eH9teGHARXqvUDBLmsyigJ3iyD7wjY8RTy2Ee8EMQY/9pD9TXeOIgEyq0rwu7Fb2i3X810Bz9qX88Bly1F5swK23CQX704l8pJwBcevBZeeiNjP93QmLV3TVDaC6Dd0K/0zJwpkzp7qDZ6ieC5NmVNQj5GEti6io4zksZs1+HxIxRKC8urZiNWyKsb7oj9wPixWg12WQEaR8i5dXd9FtpJo2FlKgSqCMYiTW0nlTcR+4q8jAw==;
 5:mxtLgRxCCTfmJQeUzhN9Qt/M984fob4gEjmg1+VOcfYXw9DjTUaar9uGmIwX+vZZ1CVjXlNVHyYiIocbBBor/3tY6Fq0QHYQ9zcTPqUt6oIxGdbEuZGMStlVyqI9Qq9CgCSwMMK6ECcJQGePTI7JaaikjQZs8tbc1dpuEBlSv/scsIG09KU10HqybddavGGs+tEzZGavq21N5UPAq33g5g==;
 7:5dgUBCqjEpOTIgz2ohHGFJBcbc6D7mFNc+EdwAfavU/KQ+XYMv2PAtv++QqDIhZYFebFBR5/22vqDU8TqxiT0E4zFknyKOr8oAXUOILNECYApYojoxKzC1kSTxcJzZqrpmkYzVLdsz518KpwVYSfRA==
x-ms-office365-filtering-correlation-id: 124847ea-0170-49fe-2ad0-08d682c962ca
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
 SRVR:BYAPR08MB5030; 
x-ms-traffictypediagnostic: BYAPR08MB5030:|BYAPR08MB5030:
x-microsoft-antispam-prvs: <BYAPR08MB503049FB5631D330D5F875E4DB9B0@BYAPR08MB5030.namprd08.prod.outlook.com>
x-forefront-prvs: 0928072091
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(396003)(346002)(376002)(39860400002)(366004)(199004)(189003)(4326008)(107886003)(6246003)(316002)(54906003)(66066001)(446003)(305945005)(6436002)(9686003)(217873002)(25786009)(53936002)(14444005)(256004)(55016002)(8936002)(7736002)(6116002)(93886005)(3846002)(81166006)(86362001)(71190400001)(71200400001)(81156014)(105586002)(14454004)(478600001)(74316002)(229853002)(55236004)(68736007)(76176011)(7696005)(6916009)(11346002)(8676002)(186003)(33656002)(6506007)(97736004)(2906002)(486006)(476003)(26005)(102836004)(106356001)(99286004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR08MB5030;
 H:BYAPR08MB4533.namprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: micron.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8FET8QWjzf8rzUc0vLbvoSnyMMTGQL7i+j00gnUyjSuzAPq5lpl6MMz9+yrlasScYV1+8guaCBGgxWCVxjyCP2RsUNWqHXfcAk+GgoQwGJKTXPNhwR6WrZJa3YeWrjM22JydblvPhTFzko1EA1FOV1wHOhAUYqJIAiCHfTysTVOpduKIQr5JnALMZGJ5EXxx6gQeM4PIKZrUvTB/y6InIxjqACU6rjpxK+7S2HBL4MetWy+g88lVZXZIQXeEN11b9i6FR6jM/Ejmi/B9uQ4zwmxMi7rtPdcaTW5pOD5IsPGSOwoar8p5OHkAJVU7geBhjRq9xBi0cosIoA61TJ/tzpAws+O8vy73Nm9DMw1D+8I0fA58ludsaMDf9qNV1WdPHF0e6dQsNUQfvU44lot7cjFjJedcjBuM62W2rfI3NRg=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 124847ea-0170-49fe-2ad0-08d682c962ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2019 13:31:17.4856 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f38a5ecd-2813-4862-b11b-ac1d563c806f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR08MB5030
X-OriginatorOrg: micron.com
X-TM-AS-Product-Ver: SMEX-12.0.0.1782-8.200.1013-24388.005
X-TM-AS-Result: No--9.656800-0.000000-31
X-TM-AS-MatchedID: 150567-139010-700022-851106-700075-707325-703712-707654-7
 02358-701403-704214-701398-707476-704980-704342-703747-705388-704421-700151
 -702422-708712-700726-701450-711664-705861-703283-700492-702020-701914-1066
 40-702084-105700-148004-148007-148020-148050-20043-42000-42003-63
X-TM-AS-User-Approved-Sender: Yes
X-TM-AS-User-Blocked-Sender: No
X-MT-CheckInternalSenderRule: True
X-Scanned-By: MIMEDefang 2.78 on 137.201.130.65
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190125_053132_151312_B4E11E7F 
X-CRM114-Status: UNSURE (   8.44  )
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

>
>On Mon, 21 Jan 2019 10:04:15 +0000
>"Bean Huo (beanhuo)" <beanhuo@micron.com> wrote:
>
>> Hi, Boris
>>
>> >On Fri, 18 Jan 2019 22:12:04 +0000
>> >"Bean Huo (beanhuo)" <beanhuo@micron.com> wrote:
>> >
>> >> +	/* Corrupt page0 and page1, in order to simulate an
>> >> +	 * uncompleted eraseing scenario. Just for case of
>> >> +	 * power loss hits while below programming. in this
>> >> +	 * way, the PEB will be re-erased again.
>> >> +	 */
>> >> +	empty_page_mask |= 0x3;
>> >> +	memset(data_buf, 0xAA,  mtd->writesize);
>> >
>> >Why do you use the 0xaa pattern BTW?
>>
>> Random pattern or any pattern is ok. Just to fill in page.
>
>Let's use 0x0 then. This way all cells are actually in a "programmed"
>state. 
The proposed solution is effective in addressing the problem. A 00h pattern would also
work but it would add unnecessary stress to the device, by programming more memory cells.

>BTW, I'd still be interested in knowing more about the root cause of this
>issue. What causes this wrong "cell is erased" detection in your chips? I thought
>the ERASE operation was an iterative process and cells were being tested after
>each step to know whether they are erased or not in order to decide to do
>another step or stop.
>Am I wrong? What happens here to cause this erroneous detection?

I cannot comment on the details of the detection procedure, which is proprietary algorithm. The patch ensures that the erase detection is accurate.

//Bean  

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
