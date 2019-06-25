Return-Path: <SRS0=BdDe=UY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4EE2C48BD6
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jun 2019 13:03:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 791822085A
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jun 2019 13:03:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iizzwiDa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="drfYbCky";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="Cw9QLvi4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 791822085A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Af73h34bp3m/75ljiDZY2liAwqxVZCJ4+XZxietaaNY=; b=iizzwiDa0s1AP2ZI9SqoGeEjA
	WW+z9Cz0emn82f0X/7P3Mj2Zt11MRw6xZDCnz4u/5etWxCsvD/xqRxEMuAco/zsFiyP7obudlgLsF
	eQgl+jGVBEYg1y0qFnDx2GmL+xFsRgfXQU1Y60DNXmOOLpe0ZaWZxpB7oLWQmN/ulP1Sy8VhfSEa8
	xkSuZSMs568f0wIOiZ/pCEtXOES8FeeCIV9YijvN2gixqgCn+yn7MF9Q9whFZsP5aSQaq+x0N6OyY
	39DwSpjWJ8h8qzgY0SLJmuY/uG6bfCJKHWke9EAHVqULf7z0bGxdWnrP0ajhuu+pd1j3xJh/wrcXz
	u2Zs15A0w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hfl6o-0000f3-U6; Tue, 25 Jun 2019 13:03:38 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfl6j-0000b3-Mf
 for linux-mtd@lists.infradead.org; Tue, 25 Jun 2019 13:03:36 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5PCw7db023869; Tue, 25 Jun 2019 06:02:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=proofpoint;
 bh=6/L280bG7WbLlAFBA0tCA+XXFTRNq1fQ85feTolBYYA=;
 b=drfYbCkytdDUujoemcr5LVxad7NAb4J5BxGka6DJypNY/lsVMJ11sgFdh6dFbZLYez+I
 TXKRrBoW+onxgGg/uFRaqSRzJWF5rwzTElgrgu0rMhEDN3HCN74REIK66KqPdFES8oqW
 06rlKZQCBpYIWQLb2B0GVNAGsiHctrhZtg1kdAGlj/WiTu/OZzHfvaCnKyfwPz32rlqn
 8b9/9jJOOnMJGCSz8XvKT54FesMwQpkLqnJujZGQTmv/MnSC6guGRUEpkS2Ex6bjzEkZ
 ElgzF7Ck24Ozu5VspuKkrjtgpLOpLynAc1KlsQFQa1ywbuE1VzjbaMa7kk0+xUsgnI8I Lw== 
Authentication-Results: cadence.com; spf=pass smtp.mailfrom=piotrs@cadence.com
Received: from nam05-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam05lp2059.outbound.protection.outlook.com [104.47.49.59])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2t9gvscm3p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Tue, 25 Jun 2019 06:02:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6/L280bG7WbLlAFBA0tCA+XXFTRNq1fQ85feTolBYYA=;
 b=Cw9QLvi4J4IZwKTfNO6PfAjtqSPFL34gEe0uo710PIdzmIIhf0UAfKs4eoMbo8zCQQ+mN3ucbNvrCSnHrkMyuY5jrZMugtHguwV5v1sapmqHZPCaTpphfhcVU35tUxjzyYPsanXDFylyYAV0i9yM3/nWMLJKAErhzVLdyTYhHDI=
Received: from CY1PR07CA0017.namprd07.prod.outlook.com
 (2a01:111:e400:c60a::27) by SN2PR07MB2496.namprd07.prod.outlook.com
 (2603:10b6:804:11::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2008.16; Tue, 25 Jun
 2019 13:02:52 +0000
Received: from CO1NAM05FT022.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e50::208) by CY1PR07CA0017.outlook.office365.com
 (2a01:111:e400:c60a::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2008.16 via Frontend
 Transport; Tue, 25 Jun 2019 13:02:52 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 199.43.4.28 as permitted sender)
Received: from rmmaillnx1.cadence.com (199.43.4.28) by
 CO1NAM05FT022.mail.protection.outlook.com (10.152.96.130) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2032.6 via Frontend Transport; Tue, 25 Jun 2019 13:02:50 +0000
Received: from mailsj6.global.cadence.com (mailsj6.cadence.com
 [158.140.32.112])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id x5PD2hti000451
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Tue, 25 Jun 2019 09:02:44 -0400
X-CrossPremisesHeadersFilteredBySendConnector: mailsj6.global.cadence.com
Received: from global.cadence.com (158.140.32.37) by
 mailsj6.global.cadence.com (158.140.32.112) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 25 Jun 2019 06:02:39 -0700
Date: Tue, 25 Jun 2019 14:02:33 +0100
From: Piotr Sroka <piotrs@cadence.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [v3 1/2] mtd: nand: Add Cadence NAND controller driver
Message-ID: <20190625130231.GA31865@global.cadence.com>
References: <20190614150638.28383-1-piotrs@cadence.com>
 <20190614150956.31244-1-piotrs@cadence.com>
 <dd96bd1b-e944-e95d-31c9-6dd1d0b5720f@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dd96bd1b-e944-e95d-31c9-6dd1d0b5720f@gmail.com>
User-Agent: Mutt/1.5.20 (2009-12-10)
X-Originating-IP: [158.140.32.37]
X-ClientProxiedBy: mailsj6.global.cadence.com (158.140.32.112) To
 mailsj6.global.cadence.com (158.140.32.112)
X-OrganizationHeadersPreserved: mailsj6.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.43.4.28; IPV:CAL; SCL:-1; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(39860400002)(376002)(346002)(396003)(136003)(2980300002)(199004)(189003)(36092001)(8936002)(6116002)(81156014)(67846002)(126002)(81166006)(356004)(33656002)(6286002)(3846002)(4326008)(68736007)(6246003)(86362001)(26826003)(53936002)(55016002)(76130400001)(476003)(8676002)(70586007)(1411001)(5660300002)(58126008)(478600001)(2870700001)(54906003)(336012)(1076003)(26005)(16526019)(229853002)(7416002)(70206006)(316002)(6666004)(69596002)(186003)(53416004)(2486003)(47776003)(7696005)(23676004)(66066001)(2906002)(305945005)(956004)(50466002)(386003)(14444005)(6916009)(7736002)(446003)(426003)(11346002)(486006)(76176011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN2PR07MB2496; H:rmmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3cf982eb-e2a7-42e5-95d3-08d6f96d6deb
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:SN2PR07MB2496; 
X-MS-TrafficTypeDiagnostic: SN2PR07MB2496:
X-Microsoft-Antispam-PRVS: <SN2PR07MB24967DB816663F52C418C181DDE30@SN2PR07MB2496.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0079056367
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 1zX0Px24ccs2Z41Hnv8wZfa5QYv1WDtlMG9NX70MHWSmodfI57yEQUglBn3C2egt7FEDSA67qvTyTgFwjDgF4IXIaxeQf12LwKICEIZlao+hNtjyO+HveoiDWfF6bI6GlWlvqWEztuurz5WqrGl8MDKmsD0IIFL92uku01Tm4RdulUb47oPRA/9qtsbPsAOccaiKTvv3i+0madqptwEx6vLd5BQZzGLtAjisPVJ1X5g+B6ahdDnjXnQwZG9FZZ5rK11ioewPDObzRI1DdIS8+4RWdog0PI9prLKbvKdYuFup4pZHa+h/6H2+fltNa7Z+76h9k3sDxk6II9xvMmNObYYHbfHAmErdROnvvMB4g+dR7vteddfvNVTpqWfMfKHyIiV5B7Kxe4B8/uKfCAG4lYmlsQkuRk0k2BywZJSweX8=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2019 13:02:50.5177 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cf982eb-e2a7-42e5-95d3-08d6f96d6deb
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[199.43.4.28];
 Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR07MB2496
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:spf.smktg.jp
 include:_spf.salesforce.com
 include:mktomail.com include:spf-0014ca01.pphosted.com
 include:spf.protection.outlook.com include:auth.msgapp.com
 include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-25_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906250101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190625_060334_244989_1AA4843C 
X-CRM114-Status: GOOD (  21.71  )
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
Cc: Arnd Bergmann <arnd@arndb.de>, Boris Brezillon <bbrezillon@kernel.org>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Stefan Agner <stefan@agner.ch>, Marek Vasut <marek.vasut@gmail.com>, Paul
 Burton <paul.burton@mips.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgRG1pdHJ5CgpUaGUgMDYvMTYvMjAxOSAxNjo0MiwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+
RVhURVJOQUwgTUFJTAo+Cj4KPjE0LjA2LjIwMTkgMTg6MDksIFBpb3RyIFNyb2thINC/0LjRiNC1
0YI6Cj4KPkNvbW1pdCBkZXNjcmlwdGlvbiBpcyBtYW5kYXRvcnkuCj4KPj4gU2lnbmVkLW9mZi1i
eTogUGlvdHIgU3Jva2EgPHBpb3Ryc0BjYWRlbmNlLmNvbT4KPj4gLS0tCj4KPltzbmlwXQo+Cj4+
ICsKPj4gKy8qIENhZG5lbmNlIE5BTkQgZmxhc2ggY29udHJvbGxlciBjYXBhYmlsaXRpZXMgZ2V0
IGZyb20gZHJpdmVyIGRhdGEuICovCj4+ICtzdHJ1Y3QgY2FkZW5jZV9uYW5kX2R0X2RldmRhdGEg
ewo+PiArCS8qIFNrZXcgdmFsdWUgb2YgdGhlIG91dHB1dCBzaWduYWxzIG9mIHRoZSBOQU5EIEZs
YXNoIGludGVyZmFjZS4gKi8KPj4gKwl1MzIgaWZfc2tldzsKPj4gKwkvKiBJdCBpbmZvcm1zIGlm
IGFnaW5nIGZlYXR1cmUgaW4gdGhlIERMTCBQSFkgc3VwcG9ydGVkLiAqLwo+PiArCXU4IHBoeV9k
bGxfYWdpbmc7Cj4+ICsJLyoKPj4gKwkgKiBJdCBpbmZvcm1zIGlmIHBlciBiaXQgZGVza2V3IGZv
ciByZWFkIGFuZCB3cml0ZSBwYXRoIGluCj4+ICsJICogdGhlIFBIWSBpcyBzdXBwb3J0ZWQuCj4+
ICsJICovCj4+ICsJdTggcGh5X3Blcl9iaXRfZGVza2V3Owo+PiArCS8qIEl0IGluZm9ybXMgaWYg
c2xhdmUgRE1BIGludGVyZmFjZSBpcyBjb25uZWN0ZWQgdG8gRE1BIGVuZ2luZS4gKi8KPj4gKwl1
OCBoYXNfZG1hOwo+Cj5UaGVyZSBpcyBubyBuZWVkZWQgdG8gZGVkaWNhdGUgOCBiaXRzIHRvIGEg
dmFyaWFibGUgaWYgeW91IG9ubHkgY2FyZSBhYm91dCBhIHNpbmdsZQo+Yml0LiBZb3UgbWF5IHdy
aXRlIHRoaXMgYXM6Cj4KPmJvb2wgaGFzX2RtYSA6IDE7CkkgbW9kaWZpZWQgaXQgbG9jYWxseSBi
dXQgaXQgbG9va3MgdGhhdCBjaGVja3BhdGNoIGRvZXMgbm90IGxpa2Ugc3VjaApub3RhdGlvbgoi
V0FSTklORzogQXZvaWQgdXNpbmcgYm9vbCBhcyBiaXRmaWVsZC4gIFByZWZlciBib29sIGJpdGZp
ZWxkcyBhcwp1bnNpZ25lZCBpbnQgb3IgdTw4fDE2fDMyPiIKU28gbWF5YmUgSSB3aWxsIGxlYXZl
IGl0IGFzIGlzLgoKPltzbmlwXQo+Cj4+ICtzdGF0aWMgc3RydWN0Cj4+ICtjZG5zX25hbmRfY2hp
cCAqdG9fY2Ruc19uYW5kX2NoaXAoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCkKPj4gK3sKPj4gKwly
ZXR1cm4gY29udGFpbmVyX29mKGNoaXAsIHN0cnVjdCBjZG5zX25hbmRfY2hpcCwgY2hpcCk7Cj4+
ICt9Cj4+ICsKPj4gK3N0YXRpYyBzdHJ1Y3QKPj4gK2NkbnNfbmFuZF9jdHJsICp0b19jZG5zX25h
bmRfY3RybChzdHJ1Y3QgbmFuZF9jb250cm9sbGVyICpjb250cm9sbGVyKQo+PiArewo+PiArCXJl
dHVybiBjb250YWluZXJfb2YoY29udHJvbGxlciwgc3RydWN0IGNkbnNfbmFuZF9jdHJsLCBjb250
cm9sbGVyKTsKPj4gK30KPgo+SXQncyBiZXR0ZXIgdG8gaW5saW5lIGV4cGxpY2l0bHkgc3VjaCBj
YXNlcyBiZWNhdXNlIHRoZXkgd29uJ3QgZ2V0IGlubGluZWQgd2l0aCBzb21lCj5rZXJuZWwgY29u
ZmlndXJhdGlvbnMsIGxpa2UgZW5hYmxlZCBmdHJhY2luZyBmb3IgZXhhbXBsZS4KPgo+PiArc3Rh
dGljIGJvb2wKPj4gK2NhZGVuY2VfbmFuZF9kbWFfYnVmX29rKHN0cnVjdCBjZG5zX25hbmRfY3Ry
bCAqY2Ruc19jdHJsLCBjb25zdCB2b2lkICpidWYsCj4+ICsJCQl1MzIgYnVmX2xlbikKPj4gK3sK
Pj4gKwl1OCBkYXRhX2RtYV93aWR0aCA9IGNkbnNfY3RybC0+Y2FwczIuZGF0YV9kbWFfd2lkdGg7
Cj4+ICsKPj4gKwlyZXR1cm4gYnVmICYmIHZpcnRfYWRkcl92YWxpZChidWYpICYmCj4+ICsJCWxp
a2VseShJU19BTElHTkVEKCh1aW50cHRyX3QpYnVmLCBkYXRhX2RtYV93aWR0aCkpICYmCj4+ICsJ
CWxpa2VseShJU19BTElHTkVEKGJ1Zl9sZW4sIGRhdGFfZG1hX3dpZHRoKSk7Cj4+ICt9Cj4+ICsK
Pj4gK3N0YXRpYyBpbnQgY2FkZW5jZV9uYW5kX3dhaXRfZm9yX3ZhbHVlKHN0cnVjdCBjZG5zX25h
bmRfY3RybCAqY2Ruc19jdHJsLAo+PiArCQkJCSAgICAgICB1MzIgcmVnX29mZnNldCwgdTMyIHRp
bWVvdXRfdXMsCj4+ICsJCQkJICAgICAgIHUzMiBtYXNrLCBib29sIGlzX2NsZWFyKQo+PiArewo+
PiArCXUzMiB2YWw7Cj4+ICsJaW50IHJldCA9IDA7Cj4+ICsKPj4gKwlyZXQgPSByZWFkbF9wb2xs
X3RpbWVvdXQoY2Ruc19jdHJsLT5yZWcgKyByZWdfb2Zmc2V0LAo+PiArCQkJCSB2YWwsICEodmFs
ICYgbWFzaykgPT0gaXNfY2xlYXIsCj4+ICsJCQkJIDEwLCB0aW1lb3V0X3VzKTsKPgo+QXBwYXJl
bnRseSB5b3UgZG9uJ3QgY2FyZSBhYm91dCBoYXZpbmcgbWVtb3J5IGJhcnJpZXIgaGVyZSwgaGVu
Y2UKPnJlYWRsX3JlbGF4ZWRfcG9sbF90aW1lb3V0KCkuCm9rIEkgd2lsbCB1cGRhdGUgaXQuCj4K
Pj4gKwlpZiAocmV0IDwgMCkgewo+PiArCQlkZXZfZXJyKGNkbnNfY3RybC0+ZGV2LAo+PiArCQkJ
IlRpbWVvdXQgd2hpbGUgd2FpdGluZyBmb3IgcmVnICV4IHdpdGggbWFzayAleCBpcyBjbGVhciAl
ZFxuIiwKPj4gKwkJCXJlZ19vZmZzZXQsIG1hc2ssIGlzX2NsZWFyKTsKPj4gKwl9Cj4+ICsKPj4g
KwlyZXR1cm4gcmV0Owo+PiArfQo+PiArCj4+ICtzdGF0aWMgaW50IGNhZGVuY2VfbmFuZF9zZXRf
ZWNjX2VuYWJsZShzdHJ1Y3QgY2Ruc19uYW5kX2N0cmwgKmNkbnNfY3RybCwKPj4gKwkJCQkgICAg
ICAgYm9vbCBlbmFibGUpCj4+ICt7Cj4+ICsJdTMyIHJlZzsKPj4gKwo+PiArCWlmIChjYWRlbmNl
X25hbmRfd2FpdF9mb3JfdmFsdWUoY2Ruc19jdHJsLCBDVFJMX1NUQVRVUywKPj4gKwkJCQkJMTAw
MDAwMCwKPj4gKwkJCQkJQ1RSTF9TVEFUVVNfQ1RSTF9CVVNZLCB0cnVlKSkKPj4gKwkJcmV0dXJu
IC1FVElNRURPVVQ7Cj4+ICsKPj4gKwlyZWcgPSByZWFkbChjZG5zX2N0cmwtPnJlZyArIEVDQ19D
T05GSUdfMCk7Cj4+ICsKPj4gKwlpZiAoZW5hYmxlKQo+PiArCQlyZWcgfD0gRUNDX0NPTkZJR18w
X0VDQ19FTjsKPj4gKwllbHNlCj4+ICsJCXJlZyAmPSB+RUNDX0NPTkZJR18wX0VDQ19FTjsKPj4g
Kwo+PiArCXdyaXRlbChyZWcsIGNkbnNfY3RybC0+cmVnICsgRUNDX0NPTkZJR18wKTsKPgo+QW5k
IGhlcmUuLiBsb29rcyBsaWtlIHRoZXJlIGlzIG5vIG5lZWQgZm9yIHRoZSBtZW1vcnkgYmFycmll
cywgaGVuY2UgdXNlIHRoZSByZWxheGVkCj52ZXJzaW9ucyBvZiByZWFkbC93cml0ZWwuIFNhbWUg
Zm9yIHRoZSByZXN0IG9mIHRoZSBwYXRjaC4KPgpvawo+PiArCXJldHVybiAwOwo+PiArfQo+PiAr
Cj4+ICtzdGF0aWMgdm9pZCBjYWRlbmNlX25hbmRfc2V0X2VjY19zdHJlbmd0aChzdHJ1Y3QgY2Ru
c19uYW5kX2N0cmwgKmNkbnNfY3RybCwKPj4gKwkJCQkJICB1OCBjb3JyX3N0cl9pZHgpCj4+ICt7
Cj4+ICsJdTMyIHJlZzsKPj4gKwo+PiArCWlmIChjZG5zX2N0cmwtPmN1cnJfY29ycl9zdHJfaWR4
ID09IGNvcnJfc3RyX2lkeCkKPj4gKwkJcmV0dXJuOwo+PiArCj4+ICsJcmVnID0gcmVhZGwoY2Ru
c19jdHJsLT5yZWcgKyBFQ0NfQ09ORklHXzApOwo+PiArCXJlZyAmPSB+RUNDX0NPTkZJR18wX0NP
UlJfU1RSOwo+PiArCXJlZyB8PSBGSUVMRF9QUkVQKEVDQ19DT05GSUdfMF9DT1JSX1NUUiwgY29y
cl9zdHJfaWR4KTsKPj4gKwl3cml0ZWwocmVnLCBjZG5zX2N0cmwtPnJlZyArIEVDQ19DT05GSUdf
MCk7Cj4+ICsKPj4gKwljZG5zX2N0cmwtPmN1cnJfY29ycl9zdHJfaWR4ID0gY29ycl9zdHJfaWR4
Owo+PiArfQo+PiArCj4+ICtzdGF0aWMgdTggY2FkZW5jZV9uYW5kX2dldF9lY2Nfc3RyZW5ndGhf
aWR4KHN0cnVjdCBjZG5zX25hbmRfY3RybCAqY2Ruc19jdHJsLAo+PiArCQkJCQkgICAgdTggc3Ry
ZW5ndGgpCj4+ICt7Cj4+ICsJdTggaSwgY29ycl9zdHJfaWR4ID0gMDsKPj4gKwo+PiArCWZvciAo
aSA9IDA7IGkgPCBCQ0hfTUFYX05VTV9DT1JSX0NBUFM7IGkrKykgewo+PiArCQlpZiAoY2Ruc19j
dHJsLT5lY2Nfc3RyZW5ndGhzW2ldID09IHN0cmVuZ3RoKSB7Cj4+ICsJCQljb3JyX3N0cl9pZHgg
PSBpOwo+PiArCQkJYnJlYWs7Cj4+ICsJCX0KPj4gKwl9Cj4KPklzIGl0IGEgZXJyb3IgY2FzZSB3
aGVuIGkgPT0gQkNIX01BWF9OVU1fQ09SUl9DQVBTPwpZZXMgaXQgaXMgYW4gZXJyb3IgYnV0IGl0
IGNvdWxkIGFwcGVhciBvbmx5IGlmIEVDQyBjYXBhYmlsaXR5IHJlZ2lzdGVycwpoYXZlIHdyb25n
IHZhbHVlcy4gSSB3aWxsIGhhbmRsZSB0aGF0IGVycm9yIGFueXdheS4KCj4+ICsJcmV0dXJuIGNv
cnJfc3RyX2lkeDsKPj4gK30KPj4gKwo+PiArc3RhdGljIGludCBjYWRlbmNlX25hbmRfc2V0X3Nr
aXBfbWFya2VyX3ZhbChzdHJ1Y3QgY2Ruc19uYW5kX2N0cmwgKmNkbnNfY3RybCwKPj4gKwkJCQkJ
ICAgIHUxNiBtYXJrZXJfdmFsdWUpCj4+ICt7Cj4+ICsJdTMyIHJlZyA9IDA7Cj4+ICsKPj4gKwlp
ZiAoY2FkZW5jZV9uYW5kX3dhaXRfZm9yX3ZhbHVlKGNkbnNfY3RybCwgQ1RSTF9TVEFUVVMsCj4+
ICsJCQkJCTEwMDAwMDAsCj4+ICsJCQkJCUNUUkxfU1RBVFVTX0NUUkxfQlVTWSwgdHJ1ZSkpCj4+
ICsJCXJldHVybiAtRVRJTUVET1VUOwo+PiArCj4+ICsJcmVnID0gcmVhZGwoY2Ruc19jdHJsLT5y
ZWcgKyBTS0lQX0JZVEVTX0NPTkYpOwo+PiArCXJlZyAmPSB+U0tJUF9CWVRFU19NQVJLRVJfVkFM
VUU7Cj4+ICsJcmVnIHw9IEZJRUxEX1BSRVAoU0tJUF9CWVRFU19NQVJLRVJfVkFMVUUsCj4+ICsJ
CSAgICBtYXJrZXJfdmFsdWUpOwo+PiArCj4+ICsJd3JpdGVsKHJlZywgY2Ruc19jdHJsLT5yZWcg
KyBTS0lQX0JZVEVTX0NPTkYpOwo+PiArCj4+ICsJcmV0dXJuIDA7Cj4+ICt9Cj4+ICsKPj4gK3N0
YXRpYyBpbnQgY2FkZW5jZV9uYW5kX3NldF9za2lwX2J5dGVzX2NvbmYoc3RydWN0IGNkbnNfbmFu
ZF9jdHJsICpjZG5zX2N0cmwsCj4+ICsJCQkJCSAgICB1OCBudW1fb2ZfYnl0ZXMsCj4+ICsJCQkJ
CSAgICB1MzIgb2Zmc2V0X3ZhbHVlLAo+PiArCQkJCQkgICAgaW50IGVuYWJsZSkKPj4gK3sKPj4g
Kwl1MzIgcmVnID0gMDsKPj4gKwl1MzIgc2tpcF9ieXRlc19vZmZzZXQgPSAwOwo+Cj5QbGVhc2Ug
ZG9uJ3QgaW5pdGlhbGl6ZSB2YXJpYWJsZXMgaWYgbm90IG5lY2Vzc2FyeS4gWW91IGNvdWxkIGFs
c28gd3JpdGUgdGhpcyBpbiBhCj5zaW5nbGUgbGluZS4KPgo+CXUzMiBza2lwX2J5dGVzX29mZnNl
dCwgcmVnOwo+Cj5TYW1lIGZvciB0aGUgcmVzdCBvZiB0aGUgcGF0Y2guCj4KT2sgdG8gSSB3aWxs
IGNoYW5nZSBpdC4KPj4gKwlpZiAoY2FkZW5jZV9uYW5kX3dhaXRfZm9yX3ZhbHVlKGNkbnNfY3Ry
bCwgQ1RSTF9TVEFUVVMsCj4+ICsJCQkJCTEwMDAwMDAsCj4+ICsJCQkJCUNUUkxfU1RBVFVTX0NU
UkxfQlVTWSwgdHJ1ZSkpCj4+ICsJCXJldHVybiAtRVRJTUVET1VUOwo+PiArCj4+ICsJaWYgKCFl
bmFibGUpIHsKPj4gKwkJbnVtX29mX2J5dGVzID0gMDsKPj4gKwkJb2Zmc2V0X3ZhbHVlID0gMDsK
Pj4gKwl9Cj4+ICsKPj4gKwlyZWcgPSByZWFkbChjZG5zX2N0cmwtPnJlZyArIFNLSVBfQllURVNf
Q09ORik7Cj4+ICsJcmVnICY9IH5TS0lQX0JZVEVTX05VTV9PRl9CWVRFUzsKPj4gKwlyZWcgfD0g
RklFTERfUFJFUChTS0lQX0JZVEVTX05VTV9PRl9CWVRFUywKPj4gKwkJICAgIG51bV9vZl9ieXRl
cyk7Cj4+ICsJc2tpcF9ieXRlc19vZmZzZXQgPSBGSUVMRF9QUkVQKFNLSVBfQllURVNfT0ZGU0VU
X1ZBTFVFLAo+PiArCQkJCSAgICAgICBvZmZzZXRfdmFsdWUpOwo+PiArCj4+ICsJd3JpdGVsKHJl
ZywgY2Ruc19jdHJsLT5yZWcgKyBTS0lQX0JZVEVTX0NPTkYpOwo+PiArCXdyaXRlbChza2lwX2J5
dGVzX29mZnNldCwgY2Ruc19jdHJsLT5yZWcgKyBTS0lQX0JZVEVTX09GRlNFVCk7Cj4+ICsKPj4g
KwlyZXR1cm4gMDsKPj4gK30KPj4gKwo+PiArLyogRnVjbnRpb25zIGVuYWJsZXMvZGlzYWJsZXMg
aGFyZHdhcmUgZGV0ZWN0aW9uIG9mIGVyYXNlZCBkYXRhICovCj4KPnMvRnVjbnRpb25zL0Z1bmN0
aW9uLywgcGxlYXNlIHVzZSBzcGVsbGNoZWNrZXIuIEknZCBhbHNvIHJlY29tbWVuZCB0byBzdGFy
dCBhbGwKPnNpbmdsZS1saW5lIGNvbW1lbnRzIHdpdGggYSBsb3dlciBjYXNlIChhbmQgd2l0aG91
dCBhIGRvdCBpbiB0aGUgZW5kKSBiZWNhdXNlIGl0IGlzIGEKPm1vcmUgY29tbW9uIHN0eWxlIGlu
IHRoZSBrZXJuZWwgYW5kIGlzIGEgYml0IGVhc2llciBmb3IgdGhlIGV5ZXMuCk9rICBJIHdpbGwg
ZG8gaXQuIAo+Cj5bc25pcF0KICAKVGhhbmtzClBpb3RyIFNyb2thCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
