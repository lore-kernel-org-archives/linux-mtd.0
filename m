Return-Path: <SRS0=17bk=XI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0142C49ED7
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Sep 2019 14:42:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7178820693
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Sep 2019 14:42:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z2qnGyvr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="BM4JCaPW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="VssIR/9p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7178820693
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Qi2wX/jFNQdsSJoGtRlpHZ7sba1SA6nTn6DUI/DIE3w=; b=Z2qnGyvrYVu/uEavR90GcPIAa
	VbWgYZpXKpPf4iMiVRFyphRKUJNMGZ9lEohuKCWs14/RThBDvj4D5nbn6ZlKGB+wTwmByGGbicehA
	tdrQTcbngg+o2XS5ISa9b5AcRu6/nMrj4hPCROA+hLBe2xFzWAeBBW6VlEkNphKA329fRxc3izTDE
	0E1KE9DEst+uov+zWsPDV7xYbQbpBpEf8VNmyV0JlWQ+rOCCDbwQqu7GREJ8RCYNUKP/WzIHzGa6L
	1EZNGpZL28zSrFvpt4LW0wCoZwV3EDnVralfmrOlQ1y4L8OOx6DAKy5eaPyycChSld5pSr0egW5lK
	e3iYZVuMw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1i8mlz-00076d-8p; Fri, 13 Sep 2019 14:42:07 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i8mlv-000769-4F
 for linux-mtd@lists.infradead.org; Fri, 13 Sep 2019 14:42:05 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8DEch3p020197; Fri, 13 Sep 2019 07:41:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=proofpoint;
 bh=duyz2Dwm08NgnJrpTrXi8XpLm1p3CgA80hr2CwvNyPc=;
 b=BM4JCaPWFJaH4cNlDqblUQcYu0Td8ueNkqvN3B+F4zgs72AoqxGB9oBlLBGWhrcsuJ7J
 amuJ0nifsUJYL6F0FLlKCkTGDdrsl8TgBuNUcVEdad8UopsxxfvqTLiOHvHenpoYlVnj
 VLJiU141K1JzLhSfYF6U85l2CG0/wNpR/+pO6vcfS58BFWAp41CufpfR3RGAK0rltLkf
 FnyzXZ6DkylaQznXYxXQ1fy42fgVNqpYYW75aXU6EA0WBGHWJRDAtlGY+QaOBwtKejRZ
 TIwbaANNuUnqGOEN1M+vLb/lMSkVGBuRYMgBiFSAKLt5WRYbQWG6mt65twEk3a4hRAuo qQ== 
Received: from nam02-cy1-obe.outbound.protection.outlook.com
 (mail-cys01nam02lp2052.outbound.protection.outlook.com [104.47.37.52])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2uytddkydn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Fri, 13 Sep 2019 07:41:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IGx0Ao/75qgXSAy5ufcvN8+Ym93OsNnbLxmotCz+mY75vZSzeVxvqQ3CUwcwmlR9CdKBxt4ks1DoC/qUKKezf2oLIRm2Lol1VDCqyShhwIFjZ8sLeJ34RN2jjUCq5wY0ueQS6MWflW9B17ine5SLknzq3igy6EFwmFiyNThEDVnZ3y3cTGi3JRbVGWklPe7WBsO3NwZEnIApRMcntCk5dtb7eVl59jGTIB79on0ScGw4htrSZQ0t1D2msRvafLxJcR9oX/EgzoN40IY/7ekSXfCdApow4YNL9fVCk3//rxrWOUOfwq1psKptRzSB/Ef7dnqijR7lQhtWpBr4cmGVJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=duyz2Dwm08NgnJrpTrXi8XpLm1p3CgA80hr2CwvNyPc=;
 b=ea70RoyC5QOYXuTCafv+ww42f28kSGEa6tvxGGtTkG5+2yO1kT9i6DvMHMRGBZmgijdjA7axHtuQ4f93S6UggoeMNXWiTPakm0a8ejIaPt81MSQmCnLvnXtnAetpcHQe6mEaTBgim7IdgExKyTkUDy0KqkaEEKWjq4lNZjRFGh1eSmOMUBrHAez8fGg+Ol/sYXv8RxKSM260/1vEijFSiHcQU7h3UL4wbrK1Jz6cq3w6UbZ+JcUuciW9+QSuqtMCV9ZdITVS3U0Y1U1A9ckFBcxMiCs0vJyKk96wEAGuUs1SWLCktirRUWJfhjIt64h7Va3IJHAdxAYD1jfzVI2iGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 158.140.1.28) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=cadence.com; 
 dmarc=fail (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=duyz2Dwm08NgnJrpTrXi8XpLm1p3CgA80hr2CwvNyPc=;
 b=VssIR/9pEZBlQfqfRyMFSpw0lNiiXSBmXBpMHsjoHhExP1XqSo49suFe1bmrGdOGJjoztpUKZB3xOke6Q6Ykqny5n9kSHCh0lBuLkTrxaANKq63m0K2/p+vAan56CVEtjElltyVnPc8/jORcBRwnJqKbxjSKVKZ6/ZNN3DvXClU=
Received: from SN4PR0701CA0024.namprd07.prod.outlook.com
 (2603:10b6:803:28::34) by BN7PR07MB4562.namprd07.prod.outlook.com
 (2603:10b6:406:aa::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2263.21; Fri, 13 Sep
 2019 14:41:33 +0000
Received: from DM3NAM05FT059.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e51::205) by SN4PR0701CA0024.outlook.office365.com
 (2603:10b6:803:28::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2263.21 via Frontend
 Transport; Fri, 13 Sep 2019 14:41:33 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx1.cadence.com (158.140.1.28) by
 DM3NAM05FT059.mail.protection.outlook.com (10.152.98.176) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2284.10 via Frontend Transport; Fri, 13 Sep 2019 14:41:33 +0000
Received: from mailsj6.global.cadence.com (mailsj6.cadence.com
 [158.140.32.112])
 by sjmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id x8DEfSfS025862
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Fri, 13 Sep 2019 07:41:29 -0700
X-CrossPremisesHeadersFilteredBySendConnector: mailsj6.global.cadence.com
Received: from global.cadence.com (158.140.32.37) by
 mailsj6.global.cadence.com (158.140.32.112) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 13 Sep 2019 07:41:26 -0700
Date: Fri, 13 Sep 2019 15:41:22 +0100
From: Piotr Sroka <piotrs@cadence.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [v5 2/2] dt-bindings: mtd: Add Cadence NAND controller driver
Message-ID: <20190913144121.GB11985@global.cadence.com>
References: <20190725145804.8886-1-piotrs@cadence.com>
 <20190725145955.13951-1-piotrs@cadence.com>
 <20190830114638.33dc4eb2@xps13>
 <20190911150422.GA4973@global.cadence.com>
 <20190913144903.0323a23a@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190913144903.0323a23a@xps13>
User-Agent: Mutt/1.5.20 (2009-12-10)
X-Originating-IP: [158.140.32.37]
X-ClientProxiedBy: mailsj7.global.cadence.com (158.140.32.114) To
 mailsj6.global.cadence.com (158.140.32.112)
X-OrganizationHeadersPreserved: mailsj6.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(39860400002)(136003)(396003)(189003)(199004)(36092001)(53416004)(126002)(50466002)(486006)(426003)(8676002)(76130400001)(246002)(336012)(76176011)(58126008)(33656002)(4326008)(7696005)(23676004)(2486003)(54906003)(386003)(7636002)(305945005)(7736002)(55016002)(6246003)(6286002)(356004)(6666004)(6916009)(229853002)(7416002)(26005)(47776003)(16526019)(26826003)(5660300002)(6116002)(316002)(8936002)(478600001)(3846002)(66066001)(956004)(186003)(70206006)(1076003)(2906002)(476003)(446003)(11346002)(2870700001)(86362001)(70586007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR07MB4562; H:sjmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.cadence.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a11f57d3-6135-4c97-d45d-08d7385878f7
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BN7PR07MB4562; 
X-MS-TrafficTypeDiagnostic: BN7PR07MB4562:
X-Microsoft-Antispam-PRVS: <BN7PR07MB45627BEE1B451A6349E296D9DDB30@BN7PR07MB4562.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0159AC2B97
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: gjkPqEaX3nnxgxe+4X8MH1JYsQjJ2Hxr5BADJWE0+ij6+XNtO7jO57qghHZzHAp8W7loLqGWcNqdW1+wC26KEMCY0mJ/M/yAj3GFr6pngORJIwPPwLCCymrskAXty/ASkn90Jsvmd9zcURvjQ7km0iusS3FKkzaGDlEyEJ+03D/Xjfj9Mxega4lEWMHQN32QkosGDMmfcQCDY56PJJ1lq/WZ8Zm5mGyphjQyWQ8XIzPpP2OhMECXNRM8fHVgQyEla15itaGU/MYBpQpOH4mUdyaejz1pgLIjJEyzf98HW8t022oNAkJbGh2MC7UCBs71XMty4a5gvIgT0s3atZAanm+y7QpY0B2R8sLUDv/ExU9X6Xwjm0gxRNKLkyqMzohNBMkk4A/qX05DsBMm8ALhQetyTdru1zwVwpoRbPWWSeA=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2019 14:41:33.2678 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a11f57d3-6135-4c97-d45d-08d7385878f7
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR07MB4562
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-13_07:2019-09-11,2019-09-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 bulkscore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1909130147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190913_074204_111013_31C81AB9 
X-CRM114-Status: GOOD (  21.92  )
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

VGhlIDA5LzEzLzIwMTkgMTQ6NDksIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj5FWFRFUk5BTCBNQUlM
Cj4KPgo+SGkgUGlvdHIsCj4KPlBpb3RyIFNyb2thIDxwaW90cnNAY2FkZW5jZS5jb20+IHdyb3Rl
IG9uIFdlZCwgMTEgU2VwIDIwMTkgMTY6MDQ6MjQKPiswMTAwOgo+Cj4+IEhpIE1pcXVlbAo+Pgo+
PiBUaGUgMDgvMzAvMjAxOSAxMTo0NiwgTWlxdWVsIFJheW5hbCB3cm90ZToKPj4gPkVYVEVSTkFM
IE1BSUwKPj4gPgo+PiA+Cj4+ID5IaSBQaW90ciwKPj4gPgo+PiA+UGlvdHIgU3Jva2EgPHBpb3Ry
c0BjYWRlbmNlLmNvbT4gd3JvdGUgb24gVGh1LCAyNSBKdWwgMjAxOSAxNTo1OTo1NQo+PiA+KzAx
MDA6Cj4+ID4KPj4gPj4gRG9jdW1lbnQgdGhlIGJpbmRpbmdzIHVzZWQgYnkgQ2FkZW5jZSBOQU5E
IGNvbnRyb2xsZXIgZHJpdmVyCj4+ID4+Cj4+ID4+IFNpZ25lZC1vZmYtYnk6IFBpb3RyIFNyb2th
IDxwaW90cnNAY2FkZW5jZS5jb20+Cj4+ID4+IC0tLQo+PiA+PiBDaGFuZ2VzIGZvciB2NToKPj4g
Pj4gLSByZXBsYWNlICJfIiBieSAiLSIgaW4gYWxsIHByb3BlcnRpZXMKPj4gPj4gLSBjaGFuZ2Ug
Y29tcGF0aWJsZSBuYW1lIGZyb20gY2RucyxocG5mYyB0byBjZG5zLGhwLW5mYwo+PiA+PiBDaGFu
Z2VzIGZvciB2NDoKPj4gPj4gLSBhZGQgY29tbWl0IG1lc3NhZ2UKPj4gPj4gQ2hhbmdlcyBmb3Ig
djM6Cj4+ID4+IC0gYWRkIHVuaXQgc3VmZml4IGZvciBib2FyZF9kZWxheQo+PiA+PiAtIG1vdmUg
Y2hpbGQgZGVzY3JpcHRpb24gdG8gcHJvcGVyIHBsYWNlCj4+ID4+IC0gcmVtb3ZlIHByZWZpeCBj
YWRlbmNlXyBmb3IgcmVnIGFuZCBzZG1hIGZpZWxkcwo+PiA+PiBDaGFuZ2VzIGZvciB2MjoKPj4g
Pj4gLSByZW1vdmUgY2hpcCBkZXBlbmRlbmRzIHBhcmFtZXRlcnMgZnJvbSBkdHMgYmluZGluZ3MK
Pj4gPj4gLSBhZGQgbmFtZXMgZm9yIHJlZ2lzdGVyIHJhbmdlcyBpbiBkdHMgYmluZGluZ3MKPj4g
Pj4gLSBhZGQgZ2VuZXJpYyBiaW5kaW5ncyB0byBkZXNjcmliZSBOQU5EIGNoaXAgcmVwcmVzZW50
YXRpb24KPj4gPj4gLS0tCj4+ID4+ICAuLi4vYmluZGluZ3MvbXRkL2NhZGVuY2UtbmFuZC1jb250
cm9sbGVyLnR4dCAgICAgICB8IDUwICsrKysrKysrKysrKysrKysrKysrKysKPj4gPj4gIDEgZmls
ZSBjaGFuZ2VkLCA1MCBpbnNlcnRpb25zKCspCj4+ID4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9jYWRlbmNlLW5hbmQtY29udHJvbGxl
ci50eHQKPj4gPj4KPj4gPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tdGQvY2FkZW5jZS1uYW5kLWNvbnRyb2xsZXIudHh0IGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9jYWRlbmNlLW5hbmQtY29udHJvbGxlci50eHQKPj4gPj4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4gPj4gaW5kZXggMDAwMDAwMDAwMDAwLi40MjM1NDdhM2Y5
OTMKPj4gPj4gLS0tIC9kZXYvbnVsbAo+PiA+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbXRkL2NhZGVuY2UtbmFuZC1jb250cm9sbGVyLnR4dAo+PiA+PiBAQCAtMCww
ICsxLDUwIEBACj4+ID4+ICsqIENhZGVuY2UgTkFORCBjb250cm9sbGVyCj4+ID4+ICsKPj4gPj4g
K1JlcXVpcmVkIHByb3BlcnRpZXM6Cj4+ID4+ICsgIC0gY29tcGF0aWJsZSA6ICJjZG5zLGhwLW5m
YyIKPj4gPj4gKyAgLSByZWcgOiBDb250YWlucyB0d28gZW50cmllcywgZWFjaCBvZiB3aGljaCBp
cyBhIHR1cGxlIGNvbnNpc3Rpbmcgb2YgYQo+PiA+PiArCSAgcGh5c2ljYWwgYWRkcmVzcyBhbmQg
bGVuZ3RoLiBUaGUgZmlyc3QgZW50cnkgaXMgdGhlIGFkZHJlc3MgYW5kCj4+ID4+ICsJICBsZW5n
dGggb2YgdGhlIGNvbnRyb2xsZXIgcmVnaXN0ZXIgc2V0LiBUaGUgc2Vjb25kIGVudHJ5IGlzIHRo
ZQo+PiA+PiArCSAgYWRkcmVzcyBhbmQgbGVuZ3RoIG9mIHRoZSBTbGF2ZSBETUEgZGF0YSBwb3J0
Lgo+PiA+PiArICAtIHJlZy1uYW1lczogc2hvdWxkIGNvbnRhaW4gInJlZyIgYW5kICJzZG1hIgo+
PiA+PiArICAtIGludGVycnVwdHMgOiBUaGUgaW50ZXJydXB0IG51bWJlci4KPj4gPj4gKyAgLSBj
bG9ja3M6IHBoYW5kbGUgb2YgdGhlIGNvbnRyb2xsZXIgY29yZSBjbG9jayAobmZfY2xrKS4KPj4g
Pj4gKwo+PiA+PiArT3B0aW9uYWwgcHJvcGVydGllczoKPj4gPj4gKyAgLSBkbWFzOiBzaGFsbCBy
ZWZlcmVuY2UgRE1BIGNoYW5uZWwgYXNzb2NpYXRlZCB0byB0aGUgTkFORCBjb250cm9sbGVyCj4+
ID4+ICsgIC0gY2Rucyxib2FyZC1kZWxheS1wcyA6IEVzdGltYXRlZCBCb2FyZCBkZWxheS4gVGhl
IHZhbHVlIGluY2x1ZGVzIHRoZSB0b3RhbAo+PiA+PiArICAgIHJvdW5kIHRyaXAgZGVsYXkgZm9y
IHRoZSBzaWduYWxzIGFuZCBpcyB1c2VkIGZvciBkZWNpZGluZyBvbiB2YWx1ZXMKPj4gPj4gKyAg
ICBhc3NvY2lhdGVkIHdpdGggZGF0YSByZWFkIGNhcHR1cmUuIFRoZSBleGFtcGxlIGZvcm11bGEg
Zm9yIFNEUiBtb2RlIGlzCj4+ID4+ICsgICAgdGhlIGZvbGxvd2luZzoKPj4gPj4gKyAgICBib2Fy
ZCBkZWxheSA9IFJFI1BBRCBkZWxheSArIFBDQiB0cmFjZSB0byBkZXZpY2UgKyBQQ0IgdHJhY2Ug
ZnJvbSBkZXZpY2UKPj4gPj4gKyAgICArIERRIFBBRCBkZWxheQo+PiA+PiArCj4+ID4+ICtDaGls
ZCBub2RlcyByZXByZXNlbnQgdGhlIGF2YWlsYWJsZSBOQU5EIGNoaXBzLgo+PiA+PiArCj4+ID4+
ICtSZXF1aXJlZCBwcm9wZXJ0aWVzIG9mIE5BTkQgY2hpcHM6Cj4+ID4+ICsgIC0gcmVnOiBzaGFs
bCBjb250YWluIHRoZSBuYXRpdmUgQ2hpcCBTZWxlY3QgaWRzIGZyb20gMCB0byBtYXggc3VwcG9y
dGVkIGJ5Cj4+ID4+ICsgICAgdGhlIGNhZGVuY2UgbmFuZCBmbGFzaCBjb250cm9sbGVyCj4+ID4+
ICsKPj4gPj4gKwo+PiA+PiArU2VlIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
dGQvbmFuZC50eHQgZm9yIG1vcmUgZGV0YWlscyBvbgo+PiA+PiArZ2VuZXJpYyBiaW5kaW5ncy4K
Pj4gPj4gKwo+PiA+PiArRXhhbXBsZToKPj4gPj4gKwo+PiA+PiArbmFuZF9jb250cm9sbGVyOiBu
YW5kLWNvbnRyb2xsZXIgQDYwMDAwMDAwIHsKPj4gPj4gKwkgIGNvbXBhdGlibGUgPSAiY2Rucyxo
cC1uZmMiOwo+PiA+PiArCSAgcmVnID0gPDB4NjAwMDAwMDAgMHgxMDAwMD4sIDwweDgwMDAwMDAw
IDB4MTAwMDA+Owo+PiA+PiArCSAgcmVnLW5hbWVzID0gInJlZyIsICJzZG1hIjsKPj4gPj4gKwkg
IGNsb2NrcyA9IDwmbmZfY2xrPjsKPj4gPj4gKwkgIGNkbnMsYm9hcmQtZGVsYXktcHMgPSA8NDgz
MD47Cj4+ID4KPj4gPkFyZSB5b3Ugc3VyZSB5b3Ugd2FudCB0byBleHBvcnQgdGhpcyB0byB0aGUg
dXNlcj8gTm90IHN1cmUgaXQgaXMgZWFzaWx5Cj4+ID51bmRlcnN0YW5kYWJsZSBhbmQgdHVuYWJs
ZS4uLiBJJ20gbm90IGFnYWluc3QgYnV0IEkgd291bGQgaGF2ZSB0cm91Ymxlcwo+PiA+dHVuaW5n
IGl0IG15c2VsZiwgdW5sZXNzIHVzaW5nIHRoZSBkb2N1bWVudGVkIHZhbHVlLiBNYXliZSB5b3Ug
c2hvdWxkCj4+ID5leHBsYWluIG1vcmUgaG93IHRvIGRlcml2ZSBpdD8KPj4gSSBuZWVkIHRvIGV4
cG9ydCB0aGlzIHBhcmFtZXRlciBzb21laG93LiBUaGUgZGVmYXVsdCB2YWx1ZSBtYXkgbm90IGJl
Cj4+IHZhbGlkIGZvciBvdGhlciBwbGF0Zm9ybXMuIFRoaXMgdmFsdWUgZGVwZW5kcyBvbiBwbGF0
Zm9ybSwgYW5kIG1heSBiZSBkaWZmZXJlbnQgb24gZGlmZmVyZW50IFNvQ3MuIFNvIEkgdGhpbmsg
dGhlIERUUyBpcyB0aGUgYmVzdCBwbGFjZSB0byBwdXQgc3VjaCBjb25maWd1cmF0aW9uCj4+IHBh
cmFtZXRlci4KPgo+V2hhdCBhYm91dCBhIGRpZmZlcmVudCBjb21wYXRpYmxlIGlmIGl0IGRlcGVu
ZHMgb24gdGhlIFNvQz8KSSBjb25zaWRlcmVkIGl0IGJ1dCB0aGlzIGRlYWx5IGNvbnNpc3RzIG9m
IFBBRHMgZGVsYXkgYW5kIFBDQiB0cmFjZQpkZWxheS4gUEFEIGRlbGF5cyBhcmUgU29DIGRlcGVu
ZGVudC4gVW5mb3J0dW5hdGVsbHkgUENCIGRlbGF5IG5vdC4KV2hhdCBjYW4gSSBkbyBJIGNhbiBz
cGxpdCBpdCBvbiB0d28gZGVsYXlzLCBQQURfZGVsYXkgYW5kIHRyYWNlX2RlbGF5LgpUaGVuIGhh
bmRsZSBQQURfZGVsYXkgYnkgY29tcGF0aWJsZSBhbmQgdHJhY2VfZGVsYXkgYnkgZHRzLiBCdXQg
SSBhbSBub3QKc3VyZSB3aGV0aGVyIGl0IGNoYW5nZXMgYW55dGhpZy4gU3RpbGwgYSBkZWxheSBu
ZWVkIHRvIHBhc3NlZCBieSBkdHMuCj4KPlRoaXMgd2F5IHlvdSBjYW4gcmV0cmlldmUgYSBkaWZm
ZXJlbnQgZHJpdmVyIGRhdGEgc3RydWN0dXJlIGFuZCBhdm9pZAo+dGhlIHBhaW4gZm9yIHRoZSB1
c2VyLgoKPgo+VGhhbmtzLAo+TWlxdcOobAoKClRoYW5rcwpQaW90cgogIAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
