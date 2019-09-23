Return-Path: <SRS0=TNJo=XS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B634EC04EBF
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Sep 2019 12:14:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C67F20820
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Sep 2019 12:14:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fpd61lku";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="hjgDuB73";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="CP3PoJN1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C67F20820
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8cY+oCqInLssqmBE74MHGrtY1NhL+1MMxXrZG0zAHPU=; b=Fpd61lkuRp39efqQ9m2/wgcYm
	Ji7Rim7znMZQrRTwTiKVAOS3nJSy1+VGplPlzdzxLz1ene82RrVc6xw46rNi2B5K/M7TW4kjjb+cJ
	bVQZzVJp+eJbcXZpC+NG0iArul/KjICPF7rMB2U9rT9mksNbohbcIMWqPKRCYIdRwdxZHDwDXPgS1
	B5Zpzs1NTofqso492/fMEnIIs4CktdNggKGcEnmiOxQT+Hm2fcp11VOZGmqZp6Dc06mGzSumvmF3/
	7wYGHIIIIXUOmdzhWE8vpagfrpF2NpV5ZlK5tPjvgW4YHfbdANIZeZdJTQ3C1EBY2vmOVyMYzwcAJ
	nMCy4qUqg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iCNEe-0002pZ-Cg; Mon, 23 Sep 2019 12:14:32 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCNEb-0002p9-4s
 for linux-mtd@lists.infradead.org; Mon, 23 Sep 2019 12:14:30 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8NC9JgB030945; Mon, 23 Sep 2019 05:14:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=proofpoint;
 bh=ueEAepJsk6iB8zdgMQedWvIrCGnLn5GAbw5vkakjyuc=;
 b=hjgDuB73QMmhdKqJVH9Mk/0iZHeUBMHcenINx3XRCS1uK6ACqQn2SqZW9q7tLyqAXy6g
 fPp09RLo2kgn/RbrDYfrO33zz7oNePIQsI2/o0Y27deXzeX4oPG83GCRuh5glLteSBbx
 y/2FGZ6kGtxhS4/2KHUuixJefInyRuU4vc9PIAsbRg3hlinlgx0SnoeAfw73kzuE+aVI
 hB7xAbuG45bR81elLcm2Cu1A00Z2KhEwDTQWdHO8Bl0POc5M8DyviqIlDAN0PLHq5wf+
 NVT4s98VIbBKpD7OyuOmBQXJZJQyml7O21jAY7j3QF88vu3gNCSzx7nmWmk2VUNVHx54 Dg== 
Received: from nam05-by2-obe.outbound.protection.outlook.com
 (mail-by2nam05lp2051.outbound.protection.outlook.com [104.47.50.51])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2v5fewf3y5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Sep 2019 05:14:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HqqML6Lm6AKqaRXXpNjPqkEw5A1cUl0aXV2oxkq84E/50170UejFJtXKxe62vPo4n1TlVIGo5mxcPFvtDT4WbXLZVKs4th66tAYN5zuXr/9Eb1OwgpCSl/a7EmsselaTgsBTsQgYMXms1j5ZB61/WB4jYyzq3NVVkfOD0mhlF7p69ELxgu328gA7wDOpG7x6dWHzKXMh6jWkGwg/kL0cms2oTfzxfF0HBES4AkcDlxFau48TJ++/D71rwuUFa/LA+zZ7vfeKZtOMPe/X52EfRiGtmMSlVb6tAGANuBSVqahPJe1sznsRajrVZh62CVClMx7rVJvC3ynS+62QBMuOew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ueEAepJsk6iB8zdgMQedWvIrCGnLn5GAbw5vkakjyuc=;
 b=GiPfevih8rmtNyMERVzdoBudWldJgEzZkNQUczyvKXZumZhqefq0g3x9sdqN5/JJ499QbaLeIbY6UMFGgW5NyKAQaa9AsEELuusoySsKCeqErTaBd2U5xEd1TKWrDA/IY1RNVQcCPrBYbsA+HH3qhVGAWk/pjs8tD24OxkkoPqmEsk3SYulhtPpb7LbM9s7FuZKedtSlLkN0pEuRLOO/slUn7N3dakGbAftdLAWIvp0bjTZ6WCFrCvqZKJhdyUZF9fzQyimG3wE5lWr3DIbXhnxf34eNf4+erHWV7Mp141uswLKverqGnZ4/pGbiepdqQzYS9DbhjGWdj2UdSNQUiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 199.43.4.28) smtp.rcpttodomain=infradead.org smtp.mailfrom=cadence.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ueEAepJsk6iB8zdgMQedWvIrCGnLn5GAbw5vkakjyuc=;
 b=CP3PoJN1KiNDG/CvlHZU72v0YD3s3tgt6URDtp01tJlRzTujN+rKF34xB0jItrv3MK3PZDQbve4a/GwgmZmoGkIHR0bdk4o0EM+++bNwU8sbDwphIUXO34cRlekIsDQdH5SErBwpnUD3RWNUh4e+LpFyLmByrU9FyKRZReYtgMM=
Received: from CH2PR07CA0020.namprd07.prod.outlook.com (2603:10b6:610:20::33)
 by DM6PR07MB6844.namprd07.prod.outlook.com (2603:10b6:5:159::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.19; Mon, 23 Sep
 2019 12:13:57 +0000
Received: from BY2NAM05FT050.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e52::202) by CH2PR07CA0020.outlook.office365.com
 (2603:10b6:610:20::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2284.20 via Frontend
 Transport; Mon, 23 Sep 2019 12:13:57 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 199.43.4.28 as permitted sender)
Received: from rmmaillnx1.cadence.com (199.43.4.28) by
 BY2NAM05FT050.mail.protection.outlook.com (10.152.100.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.8 via Frontend Transport; Mon, 23 Sep 2019 12:13:56 +0000
Received: from mailsj6.global.cadence.com (mailsj6.cadence.com
 [158.140.32.112])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id x8NCDnOr020068
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Mon, 23 Sep 2019 08:13:50 -0400
X-CrossPremisesHeadersFilteredBySendConnector: mailsj6.global.cadence.com
Received: from global.cadence.com (158.140.32.37) by
 mailsj6.global.cadence.com (158.140.32.112) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 23 Sep 2019 05:13:46 -0700
Date: Mon, 23 Sep 2019 13:13:39 +0100
From: Piotr Sroka <piotrs@cadence.com>
To: Schrempf Frieder <frieder.schrempf@kontron.de>
Subject: Re: [PATCH] - change calculating of position page containing BBM
Message-ID: <20190923121337.GA15230@global.cadence.com>
References: <20190919124139.10856-1-piotrs@cadence.com>
 <20190919145819.66e74aef@xps13>
 <f03d93a5-4393-2405-b597-80b762059f01@kontron.de>
 <20190919151820.2bb8313d@xps13>
 <7a9675e4-8bcc-f822-6028-f78d0d12c3bf@kontron.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7a9675e4-8bcc-f822-6028-f78d0d12c3bf@kontron.de>
User-Agent: Mutt/1.5.20 (2009-12-10)
X-Originating-IP: [158.140.32.37]
X-ClientProxiedBy: mailsj7.global.cadence.com (158.140.32.114) To
 mailsj6.global.cadence.com (158.140.32.112)
X-OrganizationHeadersPreserved: mailsj6.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.43.4.28; IPV:CAL; SCL:-1; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(376002)(396003)(346002)(36092001)(189003)(199004)(54094003)(1076003)(6916009)(33656002)(66574012)(336012)(5660300002)(53546011)(386003)(16526019)(26005)(186003)(7696005)(2486003)(23676004)(446003)(11346002)(476003)(76176011)(53416004)(956004)(7416002)(426003)(81166006)(305945005)(81156014)(4326008)(7736002)(6246003)(70586007)(70206006)(2906002)(6286002)(8676002)(6116002)(3846002)(14444005)(26826003)(8936002)(55016002)(50466002)(6666004)(356004)(229853002)(2870700001)(478600001)(86362001)(486006)(66066001)(58126008)(316002)(126002)(76130400001)(47776003)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR07MB6844; H:rmmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9127f97c-a3f4-4c81-f504-08d7401f824f
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR07MB6844; 
X-MS-TrafficTypeDiagnostic: DM6PR07MB6844:
X-Microsoft-Antispam-PRVS: <DM6PR07MB6844056AF27D471146E33A63DD850@DM6PR07MB6844.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0169092318
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: iQavoL+ESTE/CSyIS0H0rD+Z5bXyE6R0Q65mNea3/GlEYwv9swTLfbjrNC6TJPGF/PySizGLnb9J3Sl6cboIDBMyFOScjYf/6RIBGsx/hAgoYwX6yVUEzAyn1GONUGvdeTGU7PomtmXax0PctBtR2bU2P2IVKZ1TuJ4vtPLAs7WpcI85bJtcceRqMY8Y2aGwW0ZHNHiRSXD6t8hXJxUuB9q2K49TI4VQz8VE378q3HXEnvAVVSSqE2TRZ/3K1k6xCgwWMnImqYE/vEBvpczQ4WtccvYS5B4mEYM9KztWQUaIPVwY6EXig7GRPw9Bmgvj0eek4ffgBoS7LniLkS/V99fw4zZu9cMJY3efTE6YzplHqfnfILSH0aNHSZttrbI/cp7Zl8mfFlrJePi+XSIXYp+s8DinJzIMu5543w9+Mes=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2019 12:13:56.9045 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9127f97c-a3f4-4c81-f504-08d7401f824f
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[199.43.4.28];
 Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR07MB6844
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-23_04:2019-09-23,2019-09-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 spamscore=0 bulkscore=0 mlxscore=0 adultscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 clxscore=1015 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-1908290000
 definitions=main-1909230123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190923_051429_463348_E538ED60 
X-CRM114-Status: GOOD (  16.53  )
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
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8KClRoZSAwOS8xOS8yMDE5IDEzOjMzLCBTY2hyZW1wZiBGcmllZGVyIHdyb3RlOgo+RVhU
RVJOQUwgTUFJTAo+Cj4KPk9uIDE5LjA5LjE5IDE1OjE4LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+
PiBIZWxsbywKPj4KPj4gU2NocmVtcGYgRnJpZWRlciA8ZnJpZWRlci5zY2hyZW1wZkBrb250cm9u
LmRlPiB3cm90ZSBvbiBUaHUsIDE5IFNlcAo+PiAyMDE5IDEzOjE1OjA4ICswMDAwOgo+Pgo+Pj4g
T24gMTkuMDkuMTkgMTQ6NTgsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4+Pj4gSGkgUGlvdHIsCj4+
Pj4KPj4+PiBQaW90ciBTcm9rYSA8cGlvdHJzQGNhZGVuY2UuY29tPiB3cm90ZSBvbiBUaHUsIDE5
IFNlcCAyMDE5IDEzOjQxOjM1Cj4+Pj4gKzAxMDA6Cj4+Pj4KPj4+Pj4gQ2hhbmdlIGNhbGN1bGF0
aW5nIG9mIHBvc2l0aW9uIHBhZ2UgY29udGFpbmluZyBCQk0KPj4+Pj4KPj4+Pj4gSWYgbm9uZSBv
ZiBCQk0gZmxhZ3MgaXMgc2V0IHRoZW4gZnVuY3Rpb24gbmFuZF9iYm1fZ2V0X25leHRfcGFnZQo+
Pj4+PiByZXBvcnRzIEVJTlZBTC4gSXQgY2F1c2VzIHRoYXQgQkJNIGlzIG5vdCByZWFkIGF0IGFs
bCBkdXJpbmcgc2Nhbm5pbmcKPj4+Pj4gZmFjdG9yeSBiYWQgYmxvY2tzLiBUaGUgcmVzdWx0IGlz
IHRoYXQgdGhlIEJCVCB0YWJsZSBpcyBidWlsZCB3aXRob3V0Cj4+Pj4+IGNoZWNraW5nIGZhY3Rv
cnkgQkJNIGF0IGFsbC4gRm9yIE1pY3JvbiBmbGFzaCBtZW1vcmllcyBub25lIG9mIHRoaXMKPj4+
Pj4gZmxhZyBpcyBzZXQgaWYgcGFnZSBzaXplIGlzIGRpZmZlcmVudCB0aGFuIDIwNDggYnl0ZXMu
Cj4+Pgo+Pj4gSSB3b25kZXIgaWYgaXQgd291bGRuJ3QgYmUgYmV0dGVyIHRvIGZpeCB0aGUgTWlj
cm9uIGRyaXZlciBpbnN0ZWFkOgo+Pj4KPj4+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L25h
bmRfbWljcm9uLmMKPj4+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfbWljcm9uLmMK
Pj4+IEBAIC00NDgsNiArNDQ4LDggQEAgc3RhdGljIGludCBtaWNyb25fbmFuZF9pbml0KHN0cnVj
dCBuYW5kX2NoaXAgKmNoaXApCj4+Pgo+Pj4gICAgICAgICAgIGlmIChtdGQtPndyaXRlc2l6ZSA9
PSAyMDQ4KQo+Pj4gICAgICAgICAgICAgICAgICAgY2hpcC0+b3B0aW9ucyB8PSBOQU5EX0JCTV9G
SVJTVFBBR0UgfAo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBOQU5EX0JC
TV9TRUNPTkRQQUdFOwo+Pj4gKyAgICAgICBlbHNlCj4+PiArICAgICAgICAgICAgICAgY2hpcC0+
b3B0aW9ucyB8PSBOQU5EX0JCTV9GSVJTVFBBR0U7Cj4+Cj4+IFRoYXQncyB3aGF0IEkgZm9yZ290
IGluIG15IGxhc3QgYW5zd2VyIHRvIHRoaXMgdGhyZWFkLCBJIHRoaW5rIEkgb25seQo+PiB0b2xk
IFBpb3RyIHByaXZhdGVseTogSSB3b3VsZCBsaWtlIGJvdGguIEkgdGhpbmsgaXQgaXMgaW1wb3J0
YW50IHRvIGZpeAo+PiB0aGUgYmJtX2dldF9uZXh0X3BhZ2UgZnVuY3Rpb24gYnV0IGZvciBjbGFy
aXR5LCBzZXR0aW5nIHRoZSBGSVJTVFBBR0UKPj4gZmxhZyBpbiBNaWNyb24ncyBkcml2ZXIgc2Vl
bXMgYWxzbyBwZXJ0aW5lbnQuCj4KPkluZGVlZCwgdGhhdCBzb3VuZHMgcmVhc29uYWJsZS4gUGlv
dHIsIGNhbiB5b3Ugc2VuZCBhbm90aGVyIHBhdGNoIHdpdGgKPnRoZSBkaWZmIGFib3ZlPyBBbmQg
YnkgdGhlIHdheTogdGhhbmtzIGZvciBmaXhpbmcgbXkgY29kZSA7KQo+Cj5SZXZpZXdlZC1ieTog
RnJpZWRlciBTY2hyZW1wZiA8ZnJpZWRlci5zY2hyZW1wZkBrb250cm9uLmRlPgo+ClRoYW5rcyBG
cmllZGVyIGFuZCBNaXF1ZWwgZm9yIHRoZSB2ZXJ5IHF1aWNrIHJlcGx5LiBJIHdpbGwgc2VuZCBu
ZXh0CnZlcnNpb24gY29udGFpbmluZyBNaWNyb24gZHJpdmVyIGZpeC4KCj4+Cj4+Pgo+Pj4gICAg
ICAgICAgIG9uZGllID0gbWljcm9uX3N1cHBvcnRzX29uX2RpZV9lY2MoY2hpcCk7Cj4+Pgo+Pj4K
Pj4+Pgo+Pj4+ICJub25lIG9mIHRoZXNlIGZsYWdzIGFyZSBzZXQiCj4+Pj4KPj4+Pj4KPj4+Pj4g
VGhpcyBwYXRjaCBjaGFuZ2VzIHRoZSBuYW5kX2JibV9nZXRfbmV4dF9wYWdlIGZ1bmN0aW9uLgo+
Pj4+Cj4+Pj4gIkFkZHJlc3MgdGhpcyByZWdyZXNzaW9uIGJ5IGNoYW5naW5nIHRoZQo+Pj4+IG5h
bmRfYmJtX2dldF9uZXh0X3BhZ2VfZnVuY3Rpb24uIgo+Pj4+Cj4+Pj4+IEl0IHdpbGwgcmV0dXJu
IDAgaWYgbm9uZSBvZiBCQk0gZmxhZyBpcyBzZXQgYW5kIHBhZ2UgcGFyYW1ldGVyIGlzIDAuCj4+
Pj4KPj4+PiAgICAgICAgICAgICAgICAgICAgICAgICBubyBCQk0gZmxhZyBpcyBzZXQKPj4+Pgo+
Pj4+PiBBZnRlciB0aGF0IG1vZGlmaWNhdGlvbiB3YXkgb2YgZGlzY292ZXJpbmcgZmFjdG9yeSBi
YWQgYmxvY2tzIHdpbGwgd29yawo+Pj4+PiBzaW1pbGFyIGFzIGluIGtlcm5lbCB2ZXJzaW9uIDUu
MS4KPj4+Pj4KPj4+Pgo+Pj4+IEZpeGVzICsgc3RhYmxlIHRhZ3Mgd291bGQgYmUgZ3JlYXQhCk9r
IEkgd2lsbCBhZGQgZml4ZXMgdGFnIGFuZCAiQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPiIu
IAoKPj4+Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBQaW90ciBTcm9rYSA8cGlvdHJzQGNhZGVuY2Uu
Y29tPgo+Pj4+PiAtLS0KPj4+Pj4gICAgZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMg
fCA4ICsrKysrKy0tCj4+Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCj4+Pj4+Cj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9uYW5kX2Jhc2UuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jCj4+Pj4+IGlu
ZGV4IDVjMmMzMGE3ZGZmYS4uZjY0ZTNiNjYwNWM2IDEwMDY0NAo+Pj4+PiAtLS0gYS9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYwo+Pj4+PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9uYW5kX2Jhc2UuYwo+Pj4+PiBAQCAtMjkyLDEyICsyOTIsMTYgQEAgaW50IG5hbmRfYmJtX2dl
dF9uZXh0X3BhZ2Uoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgaW50IHBhZ2UpCj4+Pj4+ICAgIAlz
dHJ1Y3QgbXRkX2luZm8gKm10ZCA9IG5hbmRfdG9fbXRkKGNoaXApOwo+Pj4+PiAgICAJaW50IGxh
c3RfcGFnZSA9ICgobXRkLT5lcmFzZXNpemUgLSBtdGQtPndyaXRlc2l6ZSkgPj4KPj4+Pj4gICAg
CQkJIGNoaXAtPnBhZ2Vfc2hpZnQpICYgY2hpcC0+cGFnZW1hc2s7Cj4+Pj4+ICsJdW5zaWduZWQg
aW50IGJibV9mbGFncyA9IE5BTkRfQkJNX0ZJUlNUUEFHRSB8IE5BTkRfQkJNX1NFQ09ORFBBR0UK
Pj4+Pj4gKwkJfCBOQU5EX0JCTV9MQVNUUEFHRTsKPj4+Pj4KPj4+Pj4gKwlpZiAocGFnZSA9PSAw
ICYmICEoY2hpcC0+b3B0aW9ucyAmIGJibV9mbGFncykpCj4+Pj4+ICsJCXJldHVybiAwOwo+Pj4+
PiAgICAJaWYgKHBhZ2UgPT0gMCAmJiBjaGlwLT5vcHRpb25zICYgTkFORF9CQk1fRklSU1RQQUdF
KQo+Pj4+PiAgICAJCXJldHVybiAwOwo+Pj4+PiAtCWVsc2UgaWYgKHBhZ2UgPD0gMSAmJiBjaGlw
LT5vcHRpb25zICYgTkFORF9CQk1fU0VDT05EUEFHRSkKPj4+Pj4gKwlpZiAocGFnZSA8PSAxICYm
IGNoaXAtPm9wdGlvbnMgJiBOQU5EX0JCTV9TRUNPTkRQQUdFKQo+Pj4+PiAgICAJCXJldHVybiAx
Owo+Pj4+PiAtCWVsc2UgaWYgKHBhZ2UgPD0gbGFzdF9wYWdlICYmIGNoaXAtPm9wdGlvbnMgJiBO
QU5EX0JCTV9MQVNUUEFHRSkKPj4+Pj4gKwlpZiAocGFnZSA8PSBsYXN0X3BhZ2UgJiYgY2hpcC0+
b3B0aW9ucyAmIE5BTkRfQkJNX0xBU1RQQUdFKQo+Pj4+PiAgICAJCXJldHVybiBsYXN0X3BhZ2U7
Cj4+Pj4+Cj4+Pj4+ICAgIAlyZXR1cm4gLUVJTlZBTDsKPj4+Pgo+Pj4+IExvb2tncyBnb29kIG90
aGVyd2lzZS4KPj4+Pgo+Pj4+IFRoYW5rcywKPj4+PiBNaXF1w6hsCj4+Pj4KPj4KPj4gVGhhbmtz
LAo+PiBNaXF1w6hsCj4+CgpUaGFua3MsClBpb3RyCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
