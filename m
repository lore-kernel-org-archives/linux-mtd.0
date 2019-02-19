Return-Path: <SRS0=Ei3U=Q2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68D31C10F00
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Feb 2019 16:19:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 357952147A
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Feb 2019 16:19:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hWQLP0uc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="tC7ymklg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="JuL0FM9F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 357952147A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W9KTYbSonJ/pFUe0ohw2Fd8a6uoEWvvtUW0m5blk/zg=; b=hWQLP0ucwZgcRk
	u786Crt4G2h0uOX7OtJLnE6mfzEiRqXIijt5UgMOoOOws97jKceaJ9VVbMOifhAwJE+wgsQcKKIFv
	zMSPjQ8VGGC7TDi/Z8DgRdIiYyWG/zIwwItJGdz1YGydUk8Z1juEt8OZDSVCz1vTQMjlSw3waNhjR
	xNJqjSno+Hb7eLXB5JfCoEo7LPdVrDYvigUt6ukC3FzZmccANaUZ8O1RPmJruogiCmY0GE2kOK7as
	2KpA7imgP7wqmPUf6e22tW9QYQt45Td4vfifupNrqbhTS6KlI+oQR7jHWTBvd1C0eGUoUUQvR8qhf
	vg8TmvIi5WscJVKUwodw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gw87U-0000MJ-Sb; Tue, 19 Feb 2019 16:19:44 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gw87R-0000Lr-B7
 for linux-mtd@lists.infradead.org; Tue, 19 Feb 2019 16:19:43 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1JGFK8K026358; Tue, 19 Feb 2019 08:19:33 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=M3X3y/Hry+aNvcGemLH71HtxFVNNKaxPJtP1HB1E2c8=;
 b=tC7ymklgkj957JD0v2usPgdF15v8nFVYIVdD50NgBvhEU5tjXeXL0WJ198jnWhzGvKkW
 b9YMmjGgt5LdoC7xUGugbpjc6SPEGGpdj/mHntZV+gbhnXWLef3UWu1MeSAISYklVxOC
 UCG9pzX3+zJ1xOJBzleOCMryko6GGwLC6pFEdj9uwSzz6eqySD1UQFGCNuFlI8ql1iK6
 R6bivpABMDmleRjsIiUdlRUP6z6OqBgOBxe9Z+gwENsGb78kAZdQX4o6b/XDSi7YMUvu
 sJt5iuuS/3E5WY3A0mfADY2KeyB6niGZvPTqQiOv5Brl/CqsIABq04byGRenlHjAda6u mA== 
Authentication-Results: cadence.com; spf=pass smtp.mailfrom=piotrs@cadence.com
Received: from nam01-by2-obe.outbound.protection.outlook.com
 (mail-by2nam01lp2057.outbound.protection.outlook.com [104.47.34.57])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2qpeyydy33-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Tue, 19 Feb 2019 08:19:33 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M3X3y/Hry+aNvcGemLH71HtxFVNNKaxPJtP1HB1E2c8=;
 b=JuL0FM9FPspT/bYB53nsZlGhZdDJ0Hllo03YkvSKYhulGSOwiH5cApGfY+H2ytrMWRMhgrpK7Ex9hj4b/9KzYVUDgNnVNnT35tx7uPXr4T7J+hLN2pSXLYoyJ2yzmYtGcNRXoefc4RBhUh29N6cX6x/HbmFAL4jRL7BOvltlTa0=
Received: from CO2PR07CA0077.namprd07.prod.outlook.com (2603:10b6:100::45) by
 DM5PR07MB3097.namprd07.prod.outlook.com (2603:10b6:3:de::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1622.19; Tue, 19 Feb 2019 16:19:30 +0000
Received: from CO1NAM05FT053.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e50::202) by CO2PR07CA0077.outlook.office365.com
 (2603:10b6:100::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1622.16 via Frontend
 Transport; Tue, 19 Feb 2019 16:19:30 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx2.cadence.com (158.140.1.28) by
 CO1NAM05FT053.mail.protection.outlook.com (10.152.96.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1643.11 via Frontend Transport; Tue, 19 Feb 2019 16:19:29 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx2.cadence.com (8.14.4/8.14.4) with ESMTP id
 x1JGJRsM025137
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Tue, 19 Feb 2019 08:19:28 -0800
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Tue, 19 Feb 2019 17:19:26 +0100
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Tue, 19 Feb 2019 17:19:26 +0100
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id x1JGJQbs026955;
 Tue, 19 Feb 2019 16:19:26 GMT
Received: (from piotrs@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id x1JGJPP8026947;
 Tue, 19 Feb 2019 16:19:25 GMT
From: Piotr Sroka <piotrs@cadence.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/2] dt-bindings: nand: Add Cadence NAND controller driver
Date: Tue, 19 Feb 2019 16:19:20 +0000
Message-ID: <20190219161920.26602-1-piotrs@cadence.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20190219161406.4340-1-piotrs@cadence.com>
References: <20190219161406.4340-1-piotrs@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(376002)(136003)(396003)(39860400002)(346002)(2980300002)(199004)(36092001)(189003)(51416003)(106466001)(8936002)(2351001)(6916009)(47776003)(16586007)(76176011)(54906003)(42186006)(316002)(478600001)(26826003)(8676002)(246002)(87636003)(7416002)(50226002)(2906002)(7636002)(305945005)(36756003)(105596002)(26005)(6666004)(48376002)(336012)(126002)(2616005)(476003)(11346002)(356004)(1076003)(486006)(4326008)(426003)(6346003)(107886003)(446003)(186003)(86362001)(5660300002)(50466002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR07MB3097; H:sjmaillnx2.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.cadence.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f486b416-93a1-44b4-f4b1-08d696860692
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605104)(2017052603328)(7153060);
 SRVR:DM5PR07MB3097; 
X-MS-TrafficTypeDiagnostic: DM5PR07MB3097:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR07MB3097;
 20:7vGWriU2tnk8Z4Ldt7Oqy3aZCe99k8JFsu2et1bXYysKOsA1Kx1BY/e1R+tLVNFkEX7y3wQzAZsiy3eS3eUuFlWAgWLe+8xC9JiMNVTLGbvDM9XVDG4lpHT01y4pTkNhqGcg1/nNnZu4NZW60++hTlA9bdxm2luVwpcwNAwF0VdgU6FIE79QqmhfnY7IqC/eVnAhWyVgGDjbb4ynY+3EVac63xCoRNpb9ALHs7EyicjAjnGVtHJgGMOurEFH+uZx+zXVR8NopOeebjH9yCsUx2gmaAS0fr5PrRSxFipYNBX4dUVUfFcVAnhg80IP7i2L02Ytt8ZDx0amiBWlXFdr2yD+QcbaQMQVopILm0DrFdaHcSRIb6wgi36HUPU5XdNIpmSO1nM8ypav9SBi+rxULp8hAQG4XkrC1iugAGk2czqMhoyYoZVGiZSSaM8lIrl0ZVTVQlnM+aYRT998CbbwOWBIMVVtqY94uwv2j+glfZaseB3HyW9lQzIKWDxCeiTX
X-Microsoft-Antispam-PRVS: <DM5PR07MB30974FDDDF13317FA5341B74DD7C0@DM5PR07MB3097.namprd07.prod.outlook.com>
X-Forefront-PRVS: 09538D3531
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR07MB3097;
 23:+7Rj3Kjztm8bIdP3A4an5PlK73WDViMcoBbI/Oanm?=
 =?us-ascii?Q?/JGjnVKndpE/45lkrDHkOnZjVIMYaLMmk1P9Crl3HWKGH1tMQs3uGnzHtnH3?=
 =?us-ascii?Q?NX0GjADo8ndIkinmZqYC1xE5ccMPZ7byVt00Au6Hq8cjxuWZKi8Po2ZHA6hu?=
 =?us-ascii?Q?oTywl+cpDiex442HOXjDCqixsCMcqZIQ1QEMbgQi1cTmXtneNDDfMrC+MJsB?=
 =?us-ascii?Q?XAjsuYvzFVYAgpd4lhbV1/3PDJBHvPWrO8kwmXgzWqP6W/ZR5f74H9v531Uv?=
 =?us-ascii?Q?HoPUkC92f4Wr7+966Zw+3O2U6I1KsufTsgIdNUAtGwPvFvGqKBuzqz9n7+wj?=
 =?us-ascii?Q?AY8jUlEmywjqfD8Ltqe++FDciXlxggnT9L7IhnXrjJxG1ikZ2vqCiAozgwhM?=
 =?us-ascii?Q?VNKEMv+4mgPacg9crMXV1zMXDrqSt+iSyQR1+QldYsJsy0dpbLvfzHq9u2Qd?=
 =?us-ascii?Q?HsXBWBQMJLdZM/WeFs2FagH3XzY1oWPaXG6USH8b0/Urb0CH2Hrevvv1H7Lu?=
 =?us-ascii?Q?W15zAAakBNbdLA0GJBaVEhyUV4GnAeHsYyvODvdzEac8Dpl8r0WkkMToJnSQ?=
 =?us-ascii?Q?BoATwJeC4fwfYRV9j6d8h6a75OZdSVyBQnLn7jn89TCSIV6uBWg/q8IQbvEL?=
 =?us-ascii?Q?jodIxd1Ui492SaoqZKCKOgPne/WpjW6rqkdimf9bqZcx1hl0dGitTV8KtbmZ?=
 =?us-ascii?Q?92SVbbQGWlxDU4X5QetxdKUXAgkBKPnyTKhW/O31KNUBOpa0vNsRfE9lWGJ5?=
 =?us-ascii?Q?epNFD59h5QxwxPbWisbAsTxgrUf450+WO2GoeBjkn+WKskbB34azNN+ueeG7?=
 =?us-ascii?Q?1jrICun5Qkz9D+/eWWJM82PcB0xLW4/4myOyyfizOptJUv0JP/36YRE7wdQJ?=
 =?us-ascii?Q?zMdLLwFOsskuPgdxYS0Kdie0UqLZ3fvUUi5WRaRCKgIvl/jHxrQCPHDxVh+c?=
 =?us-ascii?Q?bMQZS5mWUqcnpRPzE04Zc4obaV2JTeyHgKz1kj/rjgRKAbFKtc1BpHTVXbx4?=
 =?us-ascii?Q?GtapeHd6+aXx4+MiTuolJjHFdO9bjfd6jDw6D7VRuxp4uPzlIZDjGKLfc9FQ?=
 =?us-ascii?Q?AfhSix1zDPNUxhDcEyJifAPteLy0me1pdOspgJ3rGRLRLLEXZHbix8iUueIs?=
 =?us-ascii?Q?O4kdeSapjQUl5R8Yu1yRHFuReeuzB32?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: SknGtHUpm7p2cKVtumDCDZqRs9eSPN68RgZWXNvkPPphQHfl+kwKCDHuj1JvwfLc/EtNwxwlggrb+9fsBlMK5IPlSVhR2vaumCrZlxxZhe+JLb+lzc3B3TCKozcUhv/hIl9pANUZN58gurU5VjF7eigmbVS1ahhflMeXiDnRNM/1Ua1kD4fs8LrMqdehN/TInPASt+s9O7DurpduXnEpM/0BuFfqQTx6yLA32ioMT1JySh2lz4+vyCr2MzCcewr691lssD6mwH7FuA8l1wKwypKz/Ezl6jAqGTf72Vtpt6KV5qDsZtEAGFc6K4a9GtK551ZPOKekua46nmttsY4aSzhmbTpV3an+jRyBe/O/NQQuiGTq6EFWaWrNE0FEQoqdueyeVaQR3sQMC+mYMggF5Q7/74jOnkZUEMaTo6PjOHw=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR07MB3097;
 20:jhH7lvssY86NLd43hlxsqlCZgrb0tgQ+j3tZRVeDi9zaalYno/NS4XdYbKjTzcv1dInqe6BbWSMyPQoHLkTkk/YwdNNA2q4tSB6S72/8yxzWDtcGMBo995Bbt1VGZYVG5yUBHEw0mTZaVvB2LFtNCvTa2VzytsFf2q+D9e+0OIvkkPNlYwn9iyrBwn9CLIo7DET+3wUJ+i8z5XZBVSlvL5t2XXyJ701Y8LpzaabP1WNlJEJLeOhhGOhiYjADJ3t5
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2019 16:19:29.5679 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f486b416-93a1-44b4-f4b1-08d696860692
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx2.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR07MB3097
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:_spf.salesforce.com
 include:mktomail.com
 include:spf-0014ca01.pphosted.com include:spf.protection.outlook.com
 include:auth.msgapp.com include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-19_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902190120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190219_081941_633838_DB7BEDED 
X-CRM114-Status: GOOD (  16.94  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, BrianNorris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Piotr Sroka <piotrs@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Signed-off-by: Piotr Sroka <piotrs@cadence.com>
---
Changes for v2:
- remove chip dependends parameters from dts bindings
- add names for register ranges in dts bindings
- add generic bindings to describe NAND chip representation
  under the NAND controller node 
---
 .../bindings/mtd/cadence-nand-controller.txt       | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/cadence-nand-controller.txt

diff --git a/Documentation/devicetree/bindings/mtd/cadence-nand-controller.txt b/Documentation/devicetree/bindings/mtd/cadence-nand-controller.txt
new file mode 100644
index 000000000000..3d9b4decae24
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/cadence-nand-controller.txt
@@ -0,0 +1,48 @@
+* Cadence NAND controller
+
+Required properties:
+  - compatible : "cdns,hpnfc"
+  - reg : Contains two entries, each of which is a tuple consisting of a
+	  physical address and length. The first entry is the address and
+	  length of the controller register set. The second entry is the
+	  address and length of the Slave DMA data port.
+  - reg-names: should contain "cadence_reg" and "cadence_sdma"
+  - interrupts : The interrupt number.
+  - clocks: phandle of the controller core clock (nf_clk).
+  - Children nodes represent the available NAND chips.
+
+Required properties of NAND chips:
+  - reg: shall contain the native Chip Select ids from 0 to max supported by
+    the cadence nand flash controller
+
+Optional properties:
+  - dmas: shall reference DMA channel associated to the NAND controller
+  - cdns,board-delay : Estimated Board delay. The value includes the total
+    round trip delay for the signals and is used for deciding on values
+    associated with data read capture. The example formula for SDR mode is
+    the following:
+    board_delay = RE#PAD_delay + PCB trace to device + PCB trace from device
+    + DQ PAD delay
+
+See Documentation/devicetree/bindings/mtd/nand.txt for more details on
+generic bindings.
+
+Example:
+
+nand_controller: nand-controller @60000000 {
+	  compatible = "cdns,hpnfc";
+	  reg = <0x60000000 0x10000>, <0x80000000 0x10000>;
+	  reg-names = "cadence_reg", "cadence_sdma";
+	  clocks = <&nf_clk>;
+	  cdns,board-delay = <4830>;
+	  interrupts = <2 0>;
+	  nand@0 {
+	      reg = <0>;
+	      label = "nand-1";
+	  };
+	  nand@1 {
+	      reg = <1>;
+	      label = "nand-2";
+	  };
+
+};
-- 
2.15.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
