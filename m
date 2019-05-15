Return-Path: <SRS0=9tRn=TP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D03FFC04E53
	for <linux-mtd@archiver.kernel.org>; Wed, 15 May 2019 20:45:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 908562084E
	for <linux-mtd@archiver.kernel.org>; Wed, 15 May 2019 20:45:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i861vx7g";
	dkim=fail reason="length tag value exceeds body size" (1024-bit key) header.d=cisco.com header.i=@cisco.com header.b="TUw0OUnr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cisco.onmicrosoft.com header.i=@cisco.onmicrosoft.com header.b="r7vy1Nrs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 908562084E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=cisco.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Kf3y7hmdVCkChH0EJFVUbYWolFpsCtNWpMXYmYVJA3M=; b=i861vx7gTMmjsS
	1BqPTHnu+uxJWu4erXErVO3zRn9KwJ5xjrNMo333HBh38+yH1AfZ8zxZxh3cKor2o9Tg8fmHoHD+x
	PN0NxSBv4EVS2Fay1AjfYwQCI2J7Qwj8Om0RzJyMrPi7IDnulMR/S3DzJO3fLFKcgPdj1e9Enz1g5
	lAbd3cR/xar4NnLIsOxRiFOo3BBTHGWxNtMyTaTe2dedSNF8XCoBoCjJ4NVPGAV38glZ0uTqHA1jw
	2Df26MLRecIVafN/I3fWPBlRUGgpHfBNLVBLC61h1vaS/qR/3g+8AjUCfEunq3CO98ohI+sknwJrG
	+MN2qe4yKTN+You4J7pQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hR0mQ-0005iU-NR; Wed, 15 May 2019 20:45:38 +0000
Received: from rcdn-iport-8.cisco.com ([173.37.86.79])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hR0mN-0005i4-DS
 for linux-mtd@lists.infradead.org; Wed, 15 May 2019 20:45:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=830; q=dns/txt; s=iport;
 t=1557953135; x=1559162735;
 h=from:to:cc:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=1EW9TDbzRse7TuuGkbStZdCP/HtthI7NcbjgmX//ktw=;
 b=TUw0OUnrrHuz5fqzyVZbb4KsO+LYI18vERZXY+cybKOJ4elCWb3ci+Sb
 jwGrSoiWJM09joTDr3zEKp8COVIKSnZpYlXrWX13Q5iLzAM0f+oGTovOC
 SiF7furVepXpu/P//oAysQfjdssbZ7R1A/0Y9DW+dh3x4SmyBEM8QB5EV Q=;
IronPort-PHdr: =?us-ascii?q?9a23=3AEtOF/hDQqbSWv3TG3Z/+UyQJPHJ1sqjoPgMT9p?=
 =?us-ascii?q?ssgq5PdaLm5Zn5IUjD/qs03kTRU9Dd7PRJw6rNvqbsVHZIwK7JsWtKMfkuHw?=
 =?us-ascii?q?QAld1QmgUhBMCfDkiuN/7lZio1FcJqX15+9Hb9Ok9QS47z?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AVDwC1edxc/4sNJK1kHQIfBQeBTQK?=
 =?us-ascii?q?BKBRQA4E+IAQLKIQRg0cDjnKCMpdKglIDVAkBAQEMAQEtAgEBhEAZghQjNwY?=
 =?us-ascii?q?OAQMBAQQBAQIBBG0cAQuFTRYREQwBATcBEQEiAiYCBDAVEgQOJ4MAgWsDHQE?=
 =?us-ascii?q?CoRoCgTWIX3GBL4J5AQEFgkeCOhiCDwmBCyYCAQEBAYtLF4FAP4E4DBOCTIg?=
 =?us-ascii?q?MMoImixuCRYZokxUJAoIJApJcFAeCBJNqLYwHlQoCBAIEBQIOAQEFgWUiKYE?=
 =?us-ascii?q?ucBVlAYJBghgag0yKU3KBKY9GAQE?=
X-IronPort-AV: E=Sophos;i="5.60,474,1549929600"; d="scan'208";a="558122177"
Received: from alln-core-6.cisco.com ([173.36.13.139])
 by rcdn-iport-8.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 15 May 2019 20:45:30 +0000
Received: from XCH-RCD-016.cisco.com (xch-rcd-016.cisco.com [173.37.102.26])
 by alln-core-6.cisco.com (8.15.2/8.15.2) with ESMTPS id x4FKjU44019581
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
 Wed, 15 May 2019 20:45:30 GMT
Received: from xhs-aln-002.cisco.com (173.37.135.119) by XCH-RCD-016.cisco.com
 (173.37.102.26) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 15 May 2019 15:45:30 -0500
Received: from xhs-rtp-001.cisco.com (64.101.210.228) by xhs-aln-002.cisco.com
 (173.37.135.119) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 15 May 2019 15:45:29 -0500
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (64.101.32.56) by
 xhs-rtp-001.cisco.com (64.101.210.228) with Microsoft SMTP Server
 (TLS) id
 15.0.1473.3 via Frontend Transport; Wed, 15 May 2019 16:45:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com; 
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1EW9TDbzRse7TuuGkbStZdCP/HtthI7NcbjgmX//ktw=;
 b=r7vy1Nrs1R3m/ImOZpXhhJZ7NeUeqxuVUnFNBbWDasHlHs7CL5yFrdp8aclRmpDT/38A4efNcgEqYNwnY4bkUp0VlEh/HYu1OSAimQXiClcuzXDnb9ERfh4f75e8qAc2MR6Y5ekXpCurEjO25gcG4xunxilf0F28LqfjWE5sAdk=
Received: from BYAPR11MB3461.namprd11.prod.outlook.com (20.177.187.14) by
 BYAPR11MB3752.namprd11.prod.outlook.com (20.178.238.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Wed, 15 May 2019 20:45:27 +0000
Received: from BYAPR11MB3461.namprd11.prod.outlook.com
 ([fe80::494e:92a0:85c6:a3dd]) by BYAPR11MB3461.namprd11.prod.outlook.com
 ([fe80::494e:92a0:85c6:a3dd%7]) with mapi id 15.20.1900.010; Wed, 15 May 2019
 20:45:27 +0000
From: "Shreya Gangan (shgangan)" <shgangan@cisco.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Removal of dump_stack()s from  /fs/ubifs/io.c
Thread-Topic: Removal of dump_stack()s from  /fs/ubifs/io.c
Thread-Index: AQHVC18gL8Dvs2CcT0+L+hHPz5/XQA==
Date: Wed, 15 May 2019 20:45:27 +0000
Message-ID: <E44E4181-1CFB-493C-8023-147472049D19@cisco.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shgangan@cisco.com; 
x-originating-ip: [2001:420:30d:1254:f50a:d60e:60dd:2496]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c7ce545e-ebef-448c-ca29-08d6d9764344
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:BYAPR11MB3752; 
x-ms-traffictypediagnostic: BYAPR11MB3752:
x-microsoft-antispam-prvs: <BYAPR11MB3752F0BD46529599D446FA6BDB090@BYAPR11MB3752.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0038DE95A2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(39860400002)(376002)(396003)(136003)(346002)(199004)(189003)(6436002)(73956011)(66946007)(4744005)(5640700003)(66556008)(64756008)(66476007)(66446008)(102836004)(186003)(478600001)(53936002)(6486002)(33656002)(2906002)(4326008)(76116006)(8676002)(81166006)(81156014)(316002)(2351001)(8936002)(82746002)(86362001)(71190400001)(46003)(305945005)(14454004)(5660300002)(83716004)(71200400001)(6512007)(6916009)(99286004)(36756003)(6506007)(6116002)(25786009)(2616005)(476003)(14444005)(68736007)(256004)(7736002)(2501003)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR11MB3752;
 H:BYAPR11MB3461.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: cisco.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XC1KO1Izp0yu1EXerufzRIZfTaL/MifG1FG8EOeEU6DEBDIZHbl5/BF4UaluqE5aMAISVDnTPhH/cELGHfMbsQSbPpMcQ/O8txlTsmVMScoLEcwYhgXo3Fzx9o2QZ91+aF8XDXCqj8DY/a7wfbNHaMKes+5rxDs/ZTtvjbsRzgmHrukplVDxlP0TdD1Pn/HWEdIHXrS/x9fr44cp0E2kepHscrynmt4qkIQKWBmv5u/7oco9s7de6Cb63o9c7Q5HcFf6aKiGIfEWdm+mUr2Q0hlSly7KLTTMceGW6/X7TxGUp8QFkay03ZUV9Rj+B76tz+Hj/nuZPgGOfZ+rluDImhbWQHDddTmAX7SM1fVMkeSSm1Lg711rGjvFA6ci6vbWrKW2qV90oHLNOUIafvnpo12vZ+IE+iXuG1Seh87iTWE=
Content-ID: <9B57E62027753246B31A0AEF8BAB1A0A@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c7ce545e-ebef-448c-ca29-08d6d9764344
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2019 20:45:27.5355 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3752
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.37.102.26, xch-rcd-016.cisco.com
X-Outbound-Node: alln-core-6.cisco.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190515_134535_619003_9B814BAD 
X-CRM114-Status: UNSURE (   5.43  )
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,
    
 /fs/ubifs/io.c has dump_stack() in multiple functions upon errors and sometimes warnings. 
Since the error and warning messages seem to be unique, the functional value of these dump_stacks is not apparent.
Why are these dump_stacks required and what issues might occur upon the removal of these?

Example: 
What is the usecase of the dump_stack in the following code snippet in file /fs/ubifs/io.c?
    if (err) {
    		ubifs_err(c, "changing %d bytes in LEB %d failed, error %d",
    			  len, lnum, err);
    		ubifs_ro_mode(c, err);
    		dump_stack();
    	}
    
Regards,

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
