Return-Path: <SRS0=ZCmB=XG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9D61C5ACAE
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Sep 2019 15:05:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8012F2075C
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Sep 2019 15:05:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sgoo2o96";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="r9EpZ81+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="6pu4hbsJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8012F2075C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JaTI0NdkPUAnzfMnpui/048gQS6hRlKJLRNvGACOPeY=; b=sgoo2o96hGP56K99c0RotCJj6
	Jq2WmcROipeKnkdSGVeXMYf/JMq6SlVuAosRTOG3LElT7Kw9m1Nf7pW3JM7fU3fQ7YmI/b0ZUllcW
	U4Zc67lNTx231iBbFiRm4StttsXe7Poazgf0tMDduj0Kj5UikBvaBQHn+tWtGW0yLL2G2FLoY8/Sy
	kE9VIKocdYwnwa4eSaFQm0xFZ2AZdVUsS9FCe6bnGNUJiVA5okSkfpjRBG2b3ZRJRbFVkXNi5ufF8
	U1qof/iiiQUknyAzUhqjHPTN8MP997ewLyXGNgDgo2wC+zXrRlgU1tXQTRogQaCvLF3sQGmdqkcYc
	taPUqAiYw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1i84B3-0004P9-Gd; Wed, 11 Sep 2019 15:05:01 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i84B0-0004Ok-22
 for linux-mtd@lists.infradead.org; Wed, 11 Sep 2019 15:05:00 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8BExB6M010648; Wed, 11 Sep 2019 08:04:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=proofpoint;
 bh=XKF/hQK9j2HSFIXn4AJeiDIdzr6FQZRV7grdxzwssss=;
 b=r9EpZ81+9T6Prpj76YShOaALWGUSF5CUGFW1PcnBJqR+s6Cq6BBHlBslMDT1MSBDj2oX
 j8n9bm81MVadxbWC3hVe5l1jTSUoIM4p04p+AYyGZnNf503PM9FAjsHfnytatCJysPZG
 bup7g5c2g3JcNYHS5vtZHkL/UxmwTfz3TkHayDK9p3ZLJR+yvUYIHundESiw38SHRvS0
 7lxl/uwHZhGGkwTzt8Ms8Q1olVzya7syFVZe+E1fEf+NDicyxCy1/MJOimd7F1ciTGYl
 U+y1SCiqgdlqnoc+kzZWN1+tm2ia9Xg6StfT8SSUQ+rLpJ/x8bNmYAyNpED0I+QeAOeV LA== 
Received: from nam01-bn3-obe.outbound.protection.outlook.com
 (mail-bn3nam01lp2059.outbound.protection.outlook.com [104.47.33.59])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2uxhm7v069-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Sep 2019 08:04:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IgmBWaZPuBH1oVtGidromc9snSGhppqmaMFUBfEIxjrLB/HDgiJLnAhv+V/hHCA5YpDOES4WrfmNh1OZkqr1J/bL8aUqa7BsgvKq71LPJlNNQLARBm0TICX+HayQGgomcSto/ZOpC9PIAO5vy5O3EO6lk6YNTPN5RDH+5tT+5f44iTXrsrhOLEWFdcS5q3DK/7bJ+eob93qW2pkOrn6dZ0mpwBFzjScRC6OtKlgEgxynxv2OhCNjz9y76imEVD9Bkb9mGFK+v632E04lWMvC5eUmgw60TtT8PVC447H/aAIg+1YM5eGffcjQnlFYK9WxfYNlB5/WwJvZJ3Z69myEKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XKF/hQK9j2HSFIXn4AJeiDIdzr6FQZRV7grdxzwssss=;
 b=C155skpN0wKtL2mYLT2Dv4HsksaoPVWcMmEVIxXuB27pe87Mw5qLzdnAJnziGk5uEEFJ2a79cscfE9UhaqY1lg26n5ELggN8+7soCVJyCyBWkROBucB+QQkQYxGLbKFnFWprlCrSVIzb3+j1c1PRe0bkvnHwlz93c11RmNmxgv+Ye11Z2qn5908ddxRrROBScnTKnm0jvH6OMTWqtrIIAQ/04asOIjgWFhbhwmATd0BHwh0UPTnHx6q17EmSzDTmUmnwU4bpkbIQOizvYBIU/YHA81cp3TqXRSuVMKOzBMTI/K+bZh8ElAyAhvri07qVncvvYIwXYaTsiYGH71b+RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 158.140.1.28) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=cadence.com; 
 dmarc=fail (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XKF/hQK9j2HSFIXn4AJeiDIdzr6FQZRV7grdxzwssss=;
 b=6pu4hbsJJavOK/sCA1gOm21wqCFDPZS/Zm0OqbG7pBbSOYycMaO84T5BrrgaD8yebIkBhvWc/p1EXxfMsR8DgBozBw0hMuIUe3WUb6zW4TpN/5Jt/L/NlW/XK3gqlVu77pTY9+PiRJq1/O5JiYhQan2g9U9k++tTXA/qr7xRNlU=
Received: from SN4PR0701CA0018.namprd07.prod.outlook.com
 (2603:10b6:803:28::28) by MWHPR07MB3437.namprd07.prod.outlook.com
 (2603:10b6:301:63::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2263.13; Wed, 11 Sep
 2019 15:04:37 +0000
Received: from DM3NAM05FT040.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e51::202) by SN4PR0701CA0018.outlook.office365.com
 (2603:10b6:803:28::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2263.15 via Frontend
 Transport; Wed, 11 Sep 2019 15:04:37 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx2.cadence.com (158.140.1.28) by
 DM3NAM05FT040.mail.protection.outlook.com (10.152.98.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.6 via Frontend Transport; Wed, 11 Sep 2019 15:04:36 +0000
Received: from mailsj6.global.cadence.com (mailsj6.cadence.com
 [158.140.32.112])
 by sjmaillnx2.cadence.com (8.14.4/8.14.4) with ESMTP id x8BF4XRf006971
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Wed, 11 Sep 2019 08:04:33 -0700
X-CrossPremisesHeadersFilteredBySendConnector: mailsj6.global.cadence.com
Received: from global.cadence.com (158.140.32.37) by
 mailsj6.global.cadence.com (158.140.32.112) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 11 Sep 2019 08:04:31 -0700
Date: Wed, 11 Sep 2019 16:04:24 +0100
From: Piotr Sroka <piotrs@cadence.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [v5 2/2] dt-bindings: mtd: Add Cadence NAND controller driver
Message-ID: <20190911150422.GA4973@global.cadence.com>
References: <20190725145804.8886-1-piotrs@cadence.com>
 <20190725145955.13951-1-piotrs@cadence.com>
 <20190830114638.33dc4eb2@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190830114638.33dc4eb2@xps13>
User-Agent: Mutt/1.5.20 (2009-12-10)
X-Originating-IP: [158.140.32.37]
X-ClientProxiedBy: mailsj7.global.cadence.com (158.140.32.114) To
 mailsj6.global.cadence.com (158.140.32.112)
X-OrganizationHeadersPreserved: mailsj6.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(39860400002)(376002)(346002)(36092001)(199004)(189003)(356004)(336012)(478600001)(55016002)(4326008)(26005)(386003)(6286002)(6246003)(186003)(16526019)(8676002)(8936002)(6666004)(66066001)(53416004)(2870700001)(33656002)(26826003)(426003)(11346002)(446003)(47776003)(956004)(14444005)(3846002)(70586007)(126002)(476003)(2906002)(486006)(70206006)(7416002)(7696005)(2486003)(6916009)(54906003)(23676004)(305945005)(6116002)(76130400001)(86362001)(229853002)(50466002)(246002)(5660300002)(58126008)(1076003)(66574012)(7736002)(76176011)(7636002)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR07MB3437; H:sjmaillnx2.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.cadence.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1b9373c-36fe-4885-dc63-08d736c95ce4
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR07MB3437; 
X-MS-TrafficTypeDiagnostic: MWHPR07MB3437:
X-Microsoft-Antispam-PRVS: <MWHPR07MB3437DF50C0423A4A80AEFA42DDB10@MWHPR07MB3437.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0157DEB61B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: /9O4EWH9vS9NCZ08hdFLHHV4H1PdkEOg82JC5prpSFSNHQC6omZYeilwqNXh/JLiQAdDw7i7s/g4dovjWV/UKU1w8wf0zd7j+sScb6Y1ndMdV8Ca0F0XVCt9N2hRFIApg3Mc8lh3guYEvDgQJ3fox6RLqra2B3QSt7cRNxBKoYbMcNc/dKqIDFcTf6rLUDCl86TXLzK2nGIXlbeYumOBF9CZZwHhH1dSTgu+rQpUigK05R7O27SOUtgDnwgYFnZzfV55Y7P33YYjoHbcgmoaFQljtFBoiPl94BX0UCWZ3Y+tCZaMxBnVMgMAttSEXKB9tfMrR72rcBPQB0p6n4F85UnnH3CAgOAorv+HixzuAiOOdSQZ3SoTt8kPg+M2YdVqw9p4yMJ73kyDlwphjbbjs/2CAPJRZt5113/QytRD5AM=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2019 15:04:36.5008 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1b9373c-36fe-4885-dc63-08d736c95ce4
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx2.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR07MB3437
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-11_08:2019-09-11,2019-09-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 spamscore=0
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 clxscore=1011 phishscore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1906280000 definitions=main-1909110139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190911_080458_567099_E3835865 
X-CRM114-Status: GOOD (  22.03  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 BrianNorris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Kazuhiro Kasai <kasai.kazuhiro@socionext.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWlxdWVsCgpUaGUgMDgvMzAvMjAxOSAxMTo0NiwgTWlxdWVsIFJheW5hbCB3cm90ZToKPkVY
VEVSTkFMIE1BSUwKPgo+Cj5IaSBQaW90ciwKPgo+UGlvdHIgU3Jva2EgPHBpb3Ryc0BjYWRlbmNl
LmNvbT4gd3JvdGUgb24gVGh1LCAyNSBKdWwgMjAxOSAxNTo1OTo1NQo+KzAxMDA6Cj4KPj4gRG9j
dW1lbnQgdGhlIGJpbmRpbmdzIHVzZWQgYnkgQ2FkZW5jZSBOQU5EIGNvbnRyb2xsZXIgZHJpdmVy
Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFBpb3RyIFNyb2thIDxwaW90cnNAY2FkZW5jZS5jb20+Cj4+
IC0tLQo+PiBDaGFuZ2VzIGZvciB2NToKPj4gLSByZXBsYWNlICJfIiBieSAiLSIgaW4gYWxsIHBy
b3BlcnRpZXMKPj4gLSBjaGFuZ2UgY29tcGF0aWJsZSBuYW1lIGZyb20gY2RucyxocG5mYyB0byBj
ZG5zLGhwLW5mYwo+PiBDaGFuZ2VzIGZvciB2NDoKPj4gLSBhZGQgY29tbWl0IG1lc3NhZ2UKPj4g
Q2hhbmdlcyBmb3IgdjM6Cj4+IC0gYWRkIHVuaXQgc3VmZml4IGZvciBib2FyZF9kZWxheQo+PiAt
IG1vdmUgY2hpbGQgZGVzY3JpcHRpb24gdG8gcHJvcGVyIHBsYWNlCj4+IC0gcmVtb3ZlIHByZWZp
eCBjYWRlbmNlXyBmb3IgcmVnIGFuZCBzZG1hIGZpZWxkcwo+PiBDaGFuZ2VzIGZvciB2MjoKPj4g
LSByZW1vdmUgY2hpcCBkZXBlbmRlbmRzIHBhcmFtZXRlcnMgZnJvbSBkdHMgYmluZGluZ3MKPj4g
LSBhZGQgbmFtZXMgZm9yIHJlZ2lzdGVyIHJhbmdlcyBpbiBkdHMgYmluZGluZ3MKPj4gLSBhZGQg
Z2VuZXJpYyBiaW5kaW5ncyB0byBkZXNjcmliZSBOQU5EIGNoaXAgcmVwcmVzZW50YXRpb24KPj4g
LS0tCj4+ICAuLi4vYmluZGluZ3MvbXRkL2NhZGVuY2UtbmFuZC1jb250cm9sbGVyLnR4dCAgICAg
ICB8IDUwICsrKysrKysrKysrKysrKysrKysrKysKPj4gIDEgZmlsZSBjaGFuZ2VkLCA1MCBpbnNl
cnRpb25zKCspCj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL210ZC9jYWRlbmNlLW5hbmQtY29udHJvbGxlci50eHQKPj4KPj4gZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvY2FkZW5jZS1uYW5kLWNv
bnRyb2xsZXIudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9jYWRl
bmNlLW5hbmQtY29udHJvbGxlci50eHQKPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4gaW5kZXgg
MDAwMDAwMDAwMDAwLi40MjM1NDdhM2Y5OTMKPj4gLS0tIC9kZXYvbnVsbAo+PiArKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2NhZGVuY2UtbmFuZC1jb250cm9sbGVy
LnR4dAo+PiBAQCAtMCwwICsxLDUwIEBACj4+ICsqIENhZGVuY2UgTkFORCBjb250cm9sbGVyCj4+
ICsKPj4gK1JlcXVpcmVkIHByb3BlcnRpZXM6Cj4+ICsgIC0gY29tcGF0aWJsZSA6ICJjZG5zLGhw
LW5mYyIKPj4gKyAgLSByZWcgOiBDb250YWlucyB0d28gZW50cmllcywgZWFjaCBvZiB3aGljaCBp
cyBhIHR1cGxlIGNvbnNpc3Rpbmcgb2YgYQo+PiArCSAgcGh5c2ljYWwgYWRkcmVzcyBhbmQgbGVu
Z3RoLiBUaGUgZmlyc3QgZW50cnkgaXMgdGhlIGFkZHJlc3MgYW5kCj4+ICsJICBsZW5ndGggb2Yg
dGhlIGNvbnRyb2xsZXIgcmVnaXN0ZXIgc2V0LiBUaGUgc2Vjb25kIGVudHJ5IGlzIHRoZQo+PiAr
CSAgYWRkcmVzcyBhbmQgbGVuZ3RoIG9mIHRoZSBTbGF2ZSBETUEgZGF0YSBwb3J0Lgo+PiArICAt
IHJlZy1uYW1lczogc2hvdWxkIGNvbnRhaW4gInJlZyIgYW5kICJzZG1hIgo+PiArICAtIGludGVy
cnVwdHMgOiBUaGUgaW50ZXJydXB0IG51bWJlci4KPj4gKyAgLSBjbG9ja3M6IHBoYW5kbGUgb2Yg
dGhlIGNvbnRyb2xsZXIgY29yZSBjbG9jayAobmZfY2xrKS4KPj4gKwo+PiArT3B0aW9uYWwgcHJv
cGVydGllczoKPj4gKyAgLSBkbWFzOiBzaGFsbCByZWZlcmVuY2UgRE1BIGNoYW5uZWwgYXNzb2Np
YXRlZCB0byB0aGUgTkFORCBjb250cm9sbGVyCj4+ICsgIC0gY2Rucyxib2FyZC1kZWxheS1wcyA6
IEVzdGltYXRlZCBCb2FyZCBkZWxheS4gVGhlIHZhbHVlIGluY2x1ZGVzIHRoZSB0b3RhbAo+PiAr
ICAgIHJvdW5kIHRyaXAgZGVsYXkgZm9yIHRoZSBzaWduYWxzIGFuZCBpcyB1c2VkIGZvciBkZWNp
ZGluZyBvbiB2YWx1ZXMKPj4gKyAgICBhc3NvY2lhdGVkIHdpdGggZGF0YSByZWFkIGNhcHR1cmUu
IFRoZSBleGFtcGxlIGZvcm11bGEgZm9yIFNEUiBtb2RlIGlzCj4+ICsgICAgdGhlIGZvbGxvd2lu
ZzoKPj4gKyAgICBib2FyZCBkZWxheSA9IFJFI1BBRCBkZWxheSArIFBDQiB0cmFjZSB0byBkZXZp
Y2UgKyBQQ0IgdHJhY2UgZnJvbSBkZXZpY2UKPj4gKyAgICArIERRIFBBRCBkZWxheQo+PiArCj4+
ICtDaGlsZCBub2RlcyByZXByZXNlbnQgdGhlIGF2YWlsYWJsZSBOQU5EIGNoaXBzLgo+PiArCj4+
ICtSZXF1aXJlZCBwcm9wZXJ0aWVzIG9mIE5BTkQgY2hpcHM6Cj4+ICsgIC0gcmVnOiBzaGFsbCBj
b250YWluIHRoZSBuYXRpdmUgQ2hpcCBTZWxlY3QgaWRzIGZyb20gMCB0byBtYXggc3VwcG9ydGVk
IGJ5Cj4+ICsgICAgdGhlIGNhZGVuY2UgbmFuZCBmbGFzaCBjb250cm9sbGVyCj4+ICsKPj4gKwo+
PiArU2VlIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvbmFuZC50eHQgZm9y
IG1vcmUgZGV0YWlscyBvbgo+PiArZ2VuZXJpYyBiaW5kaW5ncy4KPj4gKwo+PiArRXhhbXBsZToK
Pj4gKwo+PiArbmFuZF9jb250cm9sbGVyOiBuYW5kLWNvbnRyb2xsZXIgQDYwMDAwMDAwIHsKPj4g
KwkgIGNvbXBhdGlibGUgPSAiY2RucyxocC1uZmMiOwo+PiArCSAgcmVnID0gPDB4NjAwMDAwMDAg
MHgxMDAwMD4sIDwweDgwMDAwMDAwIDB4MTAwMDA+Owo+PiArCSAgcmVnLW5hbWVzID0gInJlZyIs
ICJzZG1hIjsKPj4gKwkgIGNsb2NrcyA9IDwmbmZfY2xrPjsKPj4gKwkgIGNkbnMsYm9hcmQtZGVs
YXktcHMgPSA8NDgzMD47Cj4KPkFyZSB5b3Ugc3VyZSB5b3Ugd2FudCB0byBleHBvcnQgdGhpcyB0
byB0aGUgdXNlcj8gTm90IHN1cmUgaXQgaXMgZWFzaWx5Cj51bmRlcnN0YW5kYWJsZSBhbmQgdHVu
YWJsZS4uLiBJJ20gbm90IGFnYWluc3QgYnV0IEkgd291bGQgaGF2ZSB0cm91Ymxlcwo+dHVuaW5n
IGl0IG15c2VsZiwgdW5sZXNzIHVzaW5nIHRoZSBkb2N1bWVudGVkIHZhbHVlLiBNYXliZSB5b3Ug
c2hvdWxkCj5leHBsYWluIG1vcmUgaG93IHRvIGRlcml2ZSBpdD8KSSBuZWVkIHRvIGV4cG9ydCB0
aGlzIHBhcmFtZXRlciBzb21laG93LiBUaGUgZGVmYXVsdCB2YWx1ZSBtYXkgbm90IGJlCnZhbGlk
IGZvciBvdGhlciBwbGF0Zm9ybXMuIApUaGlzIHZhbHVlIGRlcGVuZHMgb24gcGxhdGZvcm0sIGFu
ZCBtYXkgYmUgZGlmZmVyZW50IG9uIGRpZmZlcmVudCBTb0NzLiAKU28gSSB0aGluayB0aGUgRFRT
IGlzIHRoZSBiZXN0IHBsYWNlIHRvIHB1dCBzdWNoIGNvbmZpZ3VyYXRpb24KcGFyYW1ldGVyLgoK
Pgo+VGhlIHJlc3QgbG9va3MgZmluZSwgbGV0J3Mgc2VlIGlmIFJvYiBhZ3JlZXMuIE1heWJlIGhl
IHdpbGwgcmVxdWVzdCBhCj55YW1sIHNjaGVtYTsgaW4gdGhpcyBjYXNlIHlvdSBjYW4gY2hlY2sg
c3VueGkgTkFORCBiaW5kaW5ncyB3aGljaAo+YWxyZWFkeSBoYXZlIGJlZW4gY29udmVydGVkLgo+
Cj4+ICsJICBpbnRlcnJ1cHRzID0gPDIgMD47Cj4+ICsJICBuYW5kQDAgewo+PiArCSAgICAgIHJl
ZyA9IDwwPjsKPj4gKwkgICAgICBsYWJlbCA9ICJuYW5kLTEiOwo+PiArCSAgfTsKPj4gKwkgIG5h
bmRAMSB7Cj4+ICsJICAgICAgcmVnID0gPDE+Owo+PiArCSAgICAgIGxhYmVsID0gIm5hbmQtMiI7
Cj4+ICsJICB9Owo+PiArCj4+ICt9Owo+Cj5UaGFua3MsCj5NaXF1w6hsCgoKVGhhbmtzClBpb3Ry
IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
