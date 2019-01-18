Return-Path: <SRS0=FXe4=P2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E83C4C1B0F7
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 22:11:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE92E2086D
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 22:11:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="abvdY0OM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=MicronCorp.onmicrosoft.com header.i=@MicronCorp.onmicrosoft.com header.b="VDeJohHC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE92E2086D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=micron.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9KTGrhNQyIugKt4UDlaaTT1MZRyQmyJa+hijj101Y8g=; b=abvdY0OMMCbkf1
	vEUGUvoD3MA+vwV4wirpz/ck4RNMHVQMkpfRiqECmC+s8HBAcw4EvFmM/8KXbuK1hnc+TylEr4By+
	2qPLp0H7y9ytMgrzdr9tysxTGy1clYy4RJoZHC2eWFsh3107Inle/+7zU6Ekt+UCt3CqSCZ1PtPmk
	coV3v7J6GkXGDbsYWsA7q4dBEze63k720Vujdtmt5yO4kgU44uK2ZsuMpA19n/Nulk7Rpb00pVM05
	NGhTFeWAMjQF80gFJ5GDQAgoUXWyvXYcVkRAEqF7w9GbgQQYIfcXCTJpR+avK4H+DWXbFnVCfkw77
	YHbwdabnhbA0G0eESLqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkcMh-0003X9-Ie; Fri, 18 Jan 2019 22:11:51 +0000
Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkcMe-0003Wi-VQ
 for linux-mtd@lists.infradead.org; Fri, 18 Jan 2019 22:11:50 +0000
Received: from mail.micron.com (bowex17c.micron.com [137.201.21.211])
 by mailout.micron.com (8.14.4/8.14.6) with ESMTP id x0IMBFDR031643;
 Fri, 18 Jan 2019 15:11:15 -0700
Received: from bowex36b.micron.com (137.201.84.100) by bowex17c.micron.com
 (137.201.21.211) with Microsoft SMTP Server (TLS) id 15.0.1365.1; Fri, 18 Jan
 2019 15:11:15 -0700
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (137.201.84.23)
 by bowex36b.micron.com (137.201.84.100) with Microsoft SMTP Server (TLS) id
 15.0.1365.1 via Frontend Transport; Fri, 18 Jan 2019 15:11:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=MicronCorp.onmicrosoft.com; s=selector1-micron-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3GIzC65Ii2yLm/Wq1ixVsBWSLEcT2/RAYzJR9hC7bFM=;
 b=VDeJohHCpgituT3NN6ef2WfhSBWb1CS1CsImRbyr53xXlM941VwOFZP920ITnU4EkL8spZzPS5MARpYhXGOnAoqLtOJ2ufoZYKhRB30gWtxJqv0Gwa/a2SXUALQTJ+jhPQ/YiWGm6qlVarBhfWnTV7Ozm8o5wH5I66PlqqAFSIo=
Received: from BYAPR08MB4533.namprd08.prod.outlook.com (52.135.234.15) by
 BYAPR08MB6069.namprd08.prod.outlook.com (20.178.51.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1537.26; Fri, 18 Jan 2019 22:11:13 +0000
Received: from BYAPR08MB4533.namprd08.prod.outlook.com
 ([fe80::1182:ed1b:cf84:b5e3]) by BYAPR08MB4533.namprd08.prod.outlook.com
 ([fe80::1182:ed1b:cf84:b5e3%5]) with mapi id 15.20.1537.028; Fri, 18 Jan 2019
 22:11:13 +0000
From: "Bean Huo (beanhuo)" <beanhuo@micron.com>
To: "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "richard@nod.at" <richard@nod.at>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>
Subject: [RESEND PATCH v2 0/2] mtd: core: NAND erase preparation
Thread-Topic: [RESEND PATCH v2 0/2] mtd: core: NAND erase preparation
Thread-Index: AdSvedJj2RV1WPjyQOaH5JMJeIgYCQ==
Date: Fri, 18 Jan 2019 22:11:13 +0000
Message-ID: <BYAPR08MB453347A7E682B9F39943F7AADB9C0@BYAPR08MB4533.namprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=beanhuo@micron.com; 
x-originating-ip: [165.225.81.41]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BYAPR08MB6069;
 6:UNzVo9ZYf/NiXuKaTbZ+/dImsJUsim+2ayOCbOuXDTbAMzf7texDab6r8AbAatKfSjilQ+BYY6UM827rCXbskWYWtDKRZIiI23n9Z7HTvkugmyPJah8rKn9xeLZi3F0W3r+WPK7wuBblqAtf2ttQs9s3yxE8NNkgxZP2Vd65DvaWxnkk1bdgAagaHK5VpgoRjdrX2r7398zedikW0YO8E3parvAWdxD1ekkfc6w1onkoyBXMT9lHU2tFZn8G6Dy4zNNf4YB0sdR7REgEqrQpI97Z4gdvEyMak+i+Zq/wpO5n5edXaAdXA9ANAsFB6EJmWvZrzWtin9E/k8dHZLCPqYCR0/jVAwfz284qjrRDx7OZ4ATnO3NDNlzykIkH0Z5ndtlTVCMto2XPwdSp9os1LoieElM3ihUaXIplKYw3XLy5hDwAYKtGttzgMLjvAcs3De9ibFCUOrr8mici9pqZ+g==;
 5:MHBVCgPkA0UnATOm7JdMXI55Gkqd0sYwp7b8JVKThWwO85T8c0AamkM3B+TXqzSATMPvt68RxgFI3XTz80ZN1dYPzUhXovgDVkB/2o06INfZ/udsXsjalDtkQT8tdnm94XvIuas9ZeYIt07jig1wlqpShjcfEV4SBA9DtMBIDGNlVjGzb5NT4Nf3ucyrdSYVj5eA1rG+snJDUb1jLumfgw==;
 7:PleVP89Ii3xDVsjlRjXoYDvulLSH474oSF5RkVs4lhPL5ecgDxvBKeUlTd+JL/TyicK1DjA73ytFrOJubT8GUkSfH/C5Yaee49naG/ciSUZ91bnqwm3QPD9btRVIUjJh8o3m67+3P8cMDTlyeiunPQ==
x-ms-office365-filtering-correlation-id: 7d5aef0e-8df0-4c09-2ad4-08d67d91dc14
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600109)(711020)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:BYAPR08MB6069; 
x-ms-traffictypediagnostic: BYAPR08MB6069:|BYAPR08MB6069:
x-microsoft-antispam-prvs: <BYAPR08MB6069F36ECB73EDF3E0DB6400DB9C0@BYAPR08MB6069.namprd08.prod.outlook.com>
x-forefront-prvs: 0921D55E4F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(376002)(366004)(136003)(346002)(396003)(54534003)(189003)(199004)(6436002)(217873002)(5660300001)(106356001)(68736007)(2906002)(71200400001)(26005)(71190400001)(7696005)(8936002)(105586002)(86362001)(2201001)(102836004)(81156014)(81166006)(7736002)(305945005)(55236004)(6506007)(8676002)(74316002)(55016002)(99286004)(110136005)(486006)(25786009)(97736004)(2501003)(33656002)(9686003)(186003)(53936002)(478600001)(256004)(316002)(66066001)(476003)(3846002)(14454004)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR08MB6069;
 H:BYAPR08MB4533.namprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: micron.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vGElbE8BFKhsIAv4rjJ61efmJz9D8YiDorf2Rf4KU3Lv4EIDNDw6YCRZQPnR+jICy0NyVpvoqLinxjfQVnyVB6sqgtc3ts+LjG1DG+0+4nFPdBOSntjSMfAK2hQ/93eKSzBuoluYHNPPcNkMRzAO7jl6WmUL/UTKVTQap3RzpG7sVoanb/YFJm4ht47hBekJdD8O/HXn6nbdK3ONmhWMr6WGo5gaRTOErbU+XotcATeFtI7FhGconr11JI7JEczHAtji5ADwCr5YYTzASalLuGa0ZzDPt6IMbL9Wmk8pa2ypa+bl0btGLHMUskR+22BetiAt3OOfQGpRBv737KuPMHlYSRPHeE/PfuuMcjRDQtksSXG6M5HhBpYbieKjnBk0Ztbo3/7F1dz2Szf8UvcnzUd3iLFpn404JsvDA1llf28=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d5aef0e-8df0-4c09-2ad4-08d67d91dc14
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2019 22:11:13.3824 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f38a5ecd-2813-4862-b11b-ac1d563c806f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR08MB6069
X-OriginatorOrg: micron.com
X-TM-AS-Product-Ver: SMEX-12.0.0.1782-8.200.1013-24372.000
X-TM-AS-Result: No--5.976500-0.000000-31
X-TM-AS-MatchedID: 700038-702931-704156-703788-707451-707866-701708-707064-7
 80016-705232-701618-709803-707800-703399-704930-700104-701236-701305-700648
 -703523-704421-708797-702098-700251-851106-701475-700016-148004-148007-1480
 20-148050-42000-42003-63
X-TM-AS-User-Approved-Sender: Yes
X-TM-AS-User-Blocked-Sender: No
X-MT-CheckInternalSenderRule: True
X-Scanned-By: MIMEDefang 2.78 on 137.201.130.65
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_141149_166301_D3A1C619 
X-CRM114-Status: UNSURE (   6.38  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On some legacy planar 2D Micron NAND devices when a
block erase command is issued, occasionally even
though a block erase operation successfully completes
and returns a pass status, the flash block may not be
completely erased. Subsequent operations to this block
on very rare cases can result in subtle failures or
corruption. These extremely rare cases should nevertheless
be considered.

These rare occurrences have been observed on partially 
written blocks. Partially written blocks are not uncommon
with UBI/UBIFS.

To avoid this rare occurrence, we make sure that at least
15 pages have been programmed to a block before it is erased.
In case we find that less than 15 pages have been programmed,
additional pages are programmed in the block. The observation
is that additional pages rarely need to be written and most of
the time UBI/UBIFS erases blocks that contain more programmed
pages.

Change log:

v1-v2:
  Rebased V1 to latest Linux kernel.
  Add erase preparation function pointer in nand_manufacturer_ops.
	 
 
Signed-off-by: Bean Huo <beanhuo@micron.com>
Reviewed-by: ZOLTAN SZUBBOCSEV <zszubbocsev@micron.com>

Bean Huo (2):
  mtd: core: add erase preparation hook function pointer
  mtd: core: NAND filling block

 drivers/mtd/nand/raw/internals.h   |   2 +
 drivers/mtd/nand/raw/nand_base.c   |   5 ++
 drivers/mtd/nand/raw/nand_micron.c | 119 +++++++++++++++++++++++++++++++++++++
 3 files changed, 126 insertions(+)

-- 
2.7.4

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
