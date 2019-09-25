Return-Path: <SRS0=nCGj=XU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B67FCC432C2
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Sep 2019 15:55:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8400821D7A
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Sep 2019 15:55:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q/fYZpmx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="AAbEnkMU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="dB9KJ3ag"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8400821D7A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NuSGuIKqj7kRbCMHLyCFOjf2Dn4cBBjsG/yVkeP0yzg=; b=q/fYZpmxRVKyCT
	nt9Iatts1p76ZvtNELGSgrA4k66R0qqnye/TyjibIVoRklg6BoLI5htWMRIYrmI5rpgcwWhnkyF+K
	Wv4GgPgFYqupoqpQQ1azbmeamhQoURSTTZlilI//fVM4XMUtDiHjSvs1BbZq30+7sYpDNRJphBi+2
	0fy4O7XDTkGYTO1m31uPsRj7pwE4pFLsGIvmbwOKH9kr/79hiHRiHMDJnzDZvfSlLOkokmrElECkI
	fsVRqpc7MWwSNQb3yZgWKiUqqkDV2NzVlcJFwIfI94JKvCD1yq/NWfnlyM0MLf0+cBBFqQeDoWSqh
	5FC0zgTOVfr3OsSomYJg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iD9dL-0006rs-Vw; Wed, 25 Sep 2019 15:55:16 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iD9dD-0005sS-TL
 for linux-mtd@lists.infradead.org; Wed, 25 Sep 2019 15:55:12 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8PFkSlA030449; Wed, 25 Sep 2019 08:54:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=proofpoint;
 bh=UBsn1y3sfjEhQwbDdih3F8ZpJ1dHNPu/2WffjRky0T0=;
 b=AAbEnkMUjp75q4YvCfcxTrVCYbjZLgaQXhu6XQKp/YlvFUU0tj1K9rpxGGvLZtpw8BZj
 qR2OGcCFv2Ijpc80MXyNxb8MX/rYdjIShvwVyIwQSKMVB9qRxlyxQt8k5Ogd4BX/s8xJ
 FCTmAm0aGahqjS0gA6f5F3GOwCbyXsJT+WPpU+haAJU1vsHeFVttBaQrreD+mI+A8S3N
 YfRv2ECRv2A7PvVg13pp1yYxK0QV/lOq79TvWMBLJPOFnkDrgBgj3sa82HpqdHE06Pst
 ZzgzwPMi6Y52dJY4F7vvEs2fq6XhP37xmdPvst/pXkCGAjhnXbeNlzw1cQoTfVibLxn3 Iw== 
Received: from nam05-co1-obe.outbound.protection.outlook.com
 (mail-co1nam05lp2052.outbound.protection.outlook.com [104.47.48.52])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2v5ge0gcv0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Wed, 25 Sep 2019 08:54:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KPW3WBKYC+vm/JF3xSBNTYQAT/rfwDMlFx5IdOBeT9Yrnw65XqugJyLJrIGDNToqP8hlhEW/vBhiSnu8iYRLklO6ZWPVpZe+6XSRrK6Z5bhJzQxR5+GeoiR+oUNwjbx5ky/nu3x/yBcds7oyfWtzFX2nLeiPL7buwmFk4XDZFeMbTX4FtrJobyWqj08HS44zhLlmF0jJvjOM4ucHNTkRmUB6KD83/MkqpI9M1g++7dV69juEMkK/dfI90mShS3mi0OejaTPAjYWNAOy0PsKSUTaFFwF1xbFwXTi0LrkH2jWtCQ1NKop6xnBQNwSuL+bfQlAWohNLNyegpuNYn2Tn/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UBsn1y3sfjEhQwbDdih3F8ZpJ1dHNPu/2WffjRky0T0=;
 b=Qvv7u7fwtBAaJN+gD8hu4L98BGu9UvK7XmT04HBfwQ/BIHq4W+P1yTStlliU3lvikg4z/Ex548TQHH/5Qc/vpanT72YRoBRMEFfKNBm1Vu59FXKINrxCqH8gaYGjScLX2E+50UTG8tP3wWikNwPoRfi5pCsQaSnpGqMYwz7JV2DApy83YI8QftaHgDiNfgCffSHkZaEKXUFd2xVRL0BKvP8OFu56IJV5bDNHINoGi6xN8tyK3Z/kP3cWR/zooEcb5TcUrVLVoxbf5TmbR3zllqhh1KSAF/jCDN7uO3upAwcoPfkrqlEtvqeD8MEoouboy2MtiRx+3rGDGYZv5Z4rYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 158.140.1.28) smtp.rcpttodomain=ti.com smtp.mailfrom=cadence.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UBsn1y3sfjEhQwbDdih3F8ZpJ1dHNPu/2WffjRky0T0=;
 b=dB9KJ3ag5PUtLZc0qetkkd1Pc4q7fOBpyroh301nNNIaVi36gGsYvwPt1UsJJsKp4YAggEuX/rw/ypp9dU5aueOToK7YPZj1tKjKHvkn5bROea512Le7/mJMD5a89XXRfbZ78EjfHKttRFjMEQzddQQ34AktbcanH6tiAc6hhd0=
Received: from BYAPR07CA0066.namprd07.prod.outlook.com (2603:10b6:a03:60::43)
 by BYAPR07MB6808.namprd07.prod.outlook.com (2603:10b6:a03:127::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.15; Wed, 25 Sep
 2019 15:54:22 +0000
Received: from BY2NAM05FT058.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e52::208) by BYAPR07CA0066.outlook.office365.com
 (2603:10b6:a03:60::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.21 via Frontend
 Transport; Wed, 25 Sep 2019 15:54:22 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx2.cadence.com (158.140.1.28) by
 BY2NAM05FT058.mail.protection.outlook.com (10.152.100.195) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.8 via Frontend Transport; Wed, 25 Sep 2019 15:54:21 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx2.cadence.com (8.14.4/8.14.4) with ESMTP id
 x8PFsGKr000577
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Wed, 25 Sep 2019 08:54:17 -0700
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Wed, 25 Sep 2019 17:54:16 +0200
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Wed, 25 Sep 2019 17:54:15 +0200
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id x8PFsFMh009125;
 Wed, 25 Sep 2019 16:54:15 +0100
Received: (from piotrs@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id x8PFs717009008;
 Wed, 25 Sep 2019 16:54:07 +0100
From: Piotr Sroka <piotrs@cadence.com>
To: 
Subject: [v8 0/2] mtd: rawnand: Add Cadence NAND controller driver
Date: Wed, 25 Sep 2019 16:52:42 +0100
Message-ID: <20190925155325.7035-1-piotrs@cadence.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39850400004)(376002)(346002)(396003)(136003)(36092001)(189003)(199004)(50226002)(186003)(5660300002)(1671002)(47776003)(70206006)(70586007)(50466002)(4326008)(7636002)(48376002)(86362001)(7416002)(87636003)(478600001)(1076003)(26826003)(305945005)(316002)(246002)(51416003)(109986005)(356004)(6666004)(486006)(476003)(8676002)(2616005)(54906003)(2906002)(26005)(126002)(16586007)(36756003)(42186006)(76130400001)(426003)(8936002)(336012)(266003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR07MB6808; H:sjmaillnx2.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.cadence.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee90c397-993d-46cd-a09c-08d741d0a19e
X-MS-TrafficTypeDiagnostic: BYAPR07MB6808:
X-Microsoft-Antispam-PRVS: <BYAPR07MB68082E5D16CE9301E12A880ADD870@BYAPR07MB6808.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 01713B2841
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8noWVPVij/riU/AC0s68UhoK7TjqYeiyPDdAiUiK71Qf4Lpu4sainlPJZOoM7cbX+NjFD/+NLWBu9Q/R8JrcLoSBRpWQvOw0VOCjsAzvQxGyzDmIUYvNWTkkCypYBqOKKuc4C1XeAa1fOjajWajoiAas8G+TQ9n8XqX3e/W6ZYYHbkkOkHv4Nb/jlWkb/AnyoaTDpqm9wbVV1WjrCXkl+rRP1kN8IVqajAyIS23gkVsVzf0ZoeNbcO2YjiSTP/QbI2Kp8y9MlGAGXCX2SjVHFbDyyESy3k67ClCkW4ZcBQ6+n+fXu4AZPbvq2qNVZ6+4LfwheW/Ymx2YEftlXRlHC+op8ReR5XuQpv08hzQpM4Xq28bF8cFtpkjw43pZE2T0LWIole8QRNlDvuKA4fDDeEAuuRy8Wgz1lEdMW1pPgHs=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2019 15:54:21.6224 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee90c397-993d-46cd-a09c-08d741d0a19e
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx2.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR07MB6808
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-09-25_07:2019-09-25,2019-09-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 malwarescore=0
 impostorscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1908290000 definitions=main-1909250146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190925_085508_339900_CDB0D246 
X-CRM114-Status: GOOD (  15.88  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Linus Walleij <linus.walleij@linaro.org>, Paul Cercueil <paul@crapouillou.net>,
 Liang Yang <liang.yang@amlogic.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 "Paul E. McKenney" <paulmck@linux.ibm.com>,
 Anders Roxell <anders.roxell@linaro.org>, Richard Weinberger <richard@nod.at>,
 Marek Vasut <marek.vasut@gmail.com>, Piotr Sroka <piotrs@cadence.com>,
 Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Kazuhiro Kasai <kasai.kazuhiro@socionext.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Driver for Cadence HPNFC NAND flash controller.

HW DMA interface
Page write and page read operations are executed in Command DMA mode.
Commands are defined by DMA descriptors.
In CDMA mode controller own DMA engine is used (Master DMA mode).
Other operations defined by nand_op_instr are executed in "Generic" mode.
In that mode data can be transferred only in by Slave DMA interface.
Slave DMA interface can be connected directly to AXI or to an external
DMA engine.

HW ECC support
Cadence NAND controller supports HW BCH correction.
 ECC is transparent from SW point of view. It means that ECC codes
are calculated and written to flash. In read operation ECC codes 
are removed from user data and correction is made if necessary.

Controller data layout with ECC enabled:
 -------------------------------------------------------------------------
|Sec 1 | ECC | Sec 2 | ECC ...... | Sec n | OOB (32B) | ECC | unused data |
 -------------------------------------------------------------------------

Last sector is extended by a out-bound data. Tha maximum size of
"extra data" is 32 bytes. The oob data are protected by ECC. If we need to 
read only oob data the whole last sector must be read. It is because 
oob data are part of last sector. Reading oob function always reads 
whole sector and writing oob function always writes whole last sector.
Written data are interleaved with the ECC therefore part of the 
last sector is located on oob area and the BBM is overwritten.

SKIP BYTES feature
To protect BBM the "skip byte" HW feature is used. 
Write page function copies BBM value from first byte of oob data to 
BBM offset defined by manufacturer. Read page functions always takes 
BBM from flash manufacturer offset. It causes that for not written 
pages the proper value of BBM marker is used.

ECC size calculation
Information about supported ECC steps and ECC strengths are read 
from controller registers. ECC sector size and ECC strength can be
configurable. Size of ECC depends on maximum supported sector size 
it not depends on selected sector size. Therefore there is a separate
function for calculating ECC size for each of possible 
sector size/step size.

Piotr Sroka (2):
  Add new Cadence NAND driver to MTD subsystem
  Add Cadence NAND controller driver

 .../bindings/mtd/cadence-nand-controller.txt       |   53 +
 MAINTAINERS                                        |    7 +
 drivers/mtd/nand/raw/Kconfig                       |    7 +
 drivers/mtd/nand/raw/Makefile                      |    1 +
 drivers/mtd/nand/raw/cadence-nand-controller.c     | 3036 ++++++++++++++++++++
 5 files changed, 3104 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/cadence-nand-controller.txt
 create mode 100644 drivers/mtd/nand/raw/cadence-nand-controller.c

-- 
2.15.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
