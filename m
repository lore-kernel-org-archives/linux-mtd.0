Return-Path: <SRS0=0U+/=U6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEC9FC0650E
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jul 2019 10:22:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95ABE206A3
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jul 2019 10:22:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VW925TKR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="ABk+s767";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="hNR4KpMv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95ABE206A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4Wb9AxdrIe0n4KGkx947GbraFf9tofBsQxYDTrne48M=; b=VW925TKRsnV3CJLpFIFl05p9J
	nDhLjRLsMLYeKdAw55MU790cjYSzZwqZn5A34NjUAIcYuytfhJIgHVmo2+p5qr45yuIQhetuhD5MB
	/J3u63LBiqL+M8goaFxq0pSkJ8JGDFueOFF73h3wznMg93q15jgTNJLHQ0R1Elh1w++ySb5d3340B
	+tDmu7p/2dzzqKsmg+UNstWYc3dyseFA8GuHte1jF+1FPneJv1n61iYPZ1/j5G8ttElpEXyh3kmkC
	dWdkFgFftXi1463D4ITlVemHXw6TwOaIFpErRXNYimwF5X+8BC6Kyel9SNsbaQSuD03iR6VhvjNtr
	hX16fkfNQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hhtRv-0005pV-5h; Mon, 01 Jul 2019 10:22:15 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hhtRs-0005p3-OX
 for linux-mtd@lists.infradead.org; Mon, 01 Jul 2019 10:22:14 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x61ALjrl014560; Mon, 1 Jul 2019 03:21:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=proofpoint;
 bh=XrTaj9yCxa7DzuzbtG+ohG3nR8HkjedZTJgpqNJvwDQ=;
 b=ABk+s767kgWQ7YgMVSuqGNX5MBW8UU7ZTfFWxjcICrHkjH5wzSp4l4eLBF5VGrDZ1MDs
 tQEcs5/EsBDwHbbd0s91EgZoslSL2MSADAt1mcGSt6D1J2ubrFGjwzFdyQg4mN3GuZVg
 tzvR+adMOfkuiDMnYGJgR3y9K4ABWOxdMCoVFmIMJCQS1T+4s+AHwQUb3s2ZDLfzO5XS
 dCY+q4aJS1LI+VFlArpXeW69kyNgEZfossQZ5YKANUhMQVVGXwAB2U2sdB4wUzqPdvoR
 uCB73ySnlu0lhKh8EMoCLT2L34up1jNmCAstpVKksQQKilLNscDd3FsYYjkjyNSVkUk4 AQ== 
Authentication-Results: cadence.com; spf=pass smtp.mailfrom=piotrs@cadence.com
Received: from nam01-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam01lp2055.outbound.protection.outlook.com [104.47.32.55])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2te4hweh0w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 01 Jul 2019 03:21:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XrTaj9yCxa7DzuzbtG+ohG3nR8HkjedZTJgpqNJvwDQ=;
 b=hNR4KpMvCcbSdkohGqIo3EVfeHC1w7gkBDJJM2k7smtA6FuQPFDQf+3waTB+FAjWkepnNs2ADlcEFroOJ1gLiAKtDeI//zCJuzOnlzl37PkPWAr/mwfpXfrABBXBcYTDzb3xmxpp53PZewmH/CjyOuOKWKoUM/aEItEUBe9d1Mw=
Received: from DM6PR07CA0027.namprd07.prod.outlook.com (2603:10b6:5:94::40) by
 MWHPR07MB3599.namprd07.prod.outlook.com (2603:10b6:301:64::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Mon, 1 Jul 2019 10:21:48 +0000
Received: from DM3NAM05FT049.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e51::202) by DM6PR07CA0027.outlook.office365.com
 (2603:10b6:5:94::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2032.20 via Frontend
 Transport; Mon, 1 Jul 2019 10:21:48 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx1.cadence.com (158.140.1.28) by
 DM3NAM05FT049.mail.protection.outlook.com (10.152.98.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.8 via Frontend Transport; Mon, 1 Jul 2019 10:21:47 +0000
Received: from mailsj6.global.cadence.com (mailsj6.cadence.com
 [158.140.32.112])
 by sjmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id x61ALkYg012269
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Mon, 1 Jul 2019 03:21:46 -0700
X-CrossPremisesHeadersFilteredBySendConnector: mailsj6.global.cadence.com
Received: from global.cadence.com (158.140.32.37) by
 mailsj6.global.cadence.com (158.140.32.112) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 1 Jul 2019 03:21:43 -0700
Date: Mon, 1 Jul 2019 11:21:36 +0100
From: Piotr Sroka <piotrs@cadence.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 1/2] mtd: nand: Add Cadence NAND controller driver
Message-ID: <20190701102135.GA20033@global.cadence.com>
References: <20190219161406.4340-1-piotrs@cadence.com>
 <20190219161823.22466-1-piotrs@cadence.com>
 <20190305190954.6c38d681@xps13>
 <20190321093356.GA19577@global.cadence.com>
 <20190512142426.11453a6c@xps13>
 <20190606151948.GA10565@global.cadence.com>
 <20190627181542.131aa061@xps13>
 <20190701095143.GA21903@global.cadence.com>
 <20190701120454.6c8ac48e@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190701120454.6c8ac48e@xps13>
User-Agent: Mutt/1.5.20 (2009-12-10)
X-Originating-IP: [158.140.32.37]
X-ClientProxiedBy: mailsj6.global.cadence.com (158.140.32.112) To
 mailsj6.global.cadence.com (158.140.32.112)
X-OrganizationHeadersPreserved: mailsj6.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(136003)(376002)(39860400002)(2980300002)(36092001)(199004)(189003)(246002)(7696005)(23676004)(7636002)(7736002)(386003)(229853002)(8936002)(8676002)(76176011)(186003)(2486003)(305945005)(26005)(16526019)(86362001)(66574012)(126002)(6916009)(1076003)(956004)(7416002)(476003)(67846002)(486006)(446003)(11346002)(2906002)(50466002)(6666004)(3846002)(6116002)(33656002)(426003)(2870700001)(4326008)(356004)(47776003)(316002)(5660300002)(66066001)(53416004)(54906003)(58126008)(6246003)(6286002)(478600001)(70206006)(70586007)(336012)(26826003)(55016002)(76130400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR07MB3599; H:sjmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.cadence.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 59558c44-7684-42a5-755d-08d6fe0decea
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR07MB3599; 
X-MS-TrafficTypeDiagnostic: MWHPR07MB3599:
X-Microsoft-Antispam-PRVS: <MWHPR07MB35993B1CA4B5707003E17D20DDF90@MWHPR07MB3599.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 00851CA28B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: mavBlga0pxj3gvoZqeX9R9VXUA1XC7kN1gXkaOGOj3gsD3q+QA6j5J3cakp6jJ3ecweHkqYx1Aw6ZF1AR05I7VKZCPjm9xpb7Rb0kbDswOTySoPXFhIEA8F8QdNcIZ1HEe1BSJs/dW3QQgN18ZxQzS5P/T3ls7vpZPj0ZT2WeK0LrCho/w2YTv1AbLZP3ho9GPQTapoaBtiN+4cqR/u1I1p9vJQOQOIcX3AbckoB81qD/tCMfS7xoHtyujFFUzg6AGP31qNDDmTvtB+LxyOD0wRo0K7vTdsa38IgYVPZWcBQhkM/YEoo5bLZTn9UMKjcCLGBVovszEJxpf+LmlqpUEWKy/xApCF26EzXT4bdIAOkZ07DnqFWAuYZKQW6n9z+IlP3K0nNsxEUbbJmkvbaTUzjk8CbTIzQBmmqrFM6xZA=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2019 10:21:47.3985 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59558c44-7684-42a5-755d-08d6fe0decea
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR07MB3599
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:spf.smktg.jp
 include:_spf.salesforce.com
 include:mktomail.com include:spf-0014ca01.pphosted.com
 include:spf.protection.outlook.com include:auth.msgapp.com
 include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-01_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=849 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907010129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190701_032212_922196_51680CE7 
X-CRM114-Status: GOOD (  16.66  )
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
 Marcel
 Ziswiler <marcel.ziswiler@toradex.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>,
 Marek Vasut <marek.vasut@gmail.com>, Paul Burton <paul.burton@mips.com>, Geert
 Uytterhoeven <geert@linux-m68k.org>, linux-mtd@lists.infradead.org,
 Dmitry Osipenko <digetx@gmail.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhlIDA3LzAxLzIwMTkgMTI6MDQsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj5FWFRFUk5BTCBNQUlM
Cj4KPgo+SGkgUGlvdHIsCj4KPlBpb3RyIFNyb2thIDxwaW90cnNAY2FkZW5jZS5jb20+IHdyb3Rl
IG9uIE1vbiwgMSBKdWwgMjAxOSAxMDo1MTo0NQo+KzAxMDA6Cj4KPgo+Wy4uLl0KPj4gPj4gPj4g
Pgo+PiA+PiA+PiA+VGhpcyBkcml2ZXIgaXMgd2F5IHRvbyBtYXNzaXZlLCBJIGFtIHByZXR0eSBz
dXJlIGl0IGNhbiBzaHJpbmsgYQo+PiA+PiA+PiA+bGl0dGxlIGJpdCBtb3JlLgo+PiA+PiA+PiA+
Wy4uLl0KPj4gPj4gPj4gPgo+PiA+PiA+PiBJIHdpbGwgdHJ5IHRvIG1ha2UgaXQgc2hvcmVyIGJ1
dCBpdCB3aWxsIGJlIGRpZnVjdWx0IHRvIGFjaGl2ZS4gSXQgaXMgYmVjYXVzZSAtIHRoZXJlIGFy
ZSBhIGxvdCBvZiBjYWxjdWxhdGlvbiBuZWVkZWQgZm9yIFBIWSAgICAgIC0gRUNDIGFyZSBpbnRl
cmxlYXZlZCB3aXRoIGRhdGEgKGxpa2Ugb24gbWFydmVsbC1uYW5kIG9yIGdwbWktbmFuZCkuCj4+
ID4+ID4+ICAgIFRoZXJlZm9yZTogICAgKyBSQVcgbW9kZSBpcyBjb21wbGljYXRlZCAgICArIHBy
b3RlY3RpbmcgQkJNIGluY3JlYXNlcyBudW1iZXIgb2YgbGluZXMgb2Ygc291cmNlIGNvZGUKPj4g
Pj4gPj4gLSBuZWVkIHRvIHN1cHBvcnQgdHdvIERNQSBlbmdpbmVzIGludGVybmFsIGFuZCBleHRl
cm5hbCAoc2xhdmUpIFdlIHdpbGwgc2VlIG9uIG5leHQgcGF0Y2ggdmVyc2lvbiB3aGF0IGlzIHRo
ZSByZXN1bHQuICAgICAgVGhhdCBwYWdlIGxheW91dCBsb29rczoKPj4gPj4gPgo+PiA+PiA+TWF5
YmUgeW91IGRvbid0IG5lZWQgdG8gc3VwcG9ydCBib3RoIGludGVybmFsIGFuZCBleHRlcm5hbCBE
TUE/Cj4+ID4+ID4KPj4gPj4gPkkgYW0gcHJldHR5IHN1cmUgdGhlcmUgYXJlIHJvb21zIGZvciBz
aXplIHJlZHVjdGlvbi4KPj4gPj4KPj4gPj4gSSBkZXNjcmliZSBob3cgaXQgd29ya3MgaW4gZ2Vu
ZXJhbCBhbmQgbWF5YmUgeW91IGhlbHAgbWUgY2hvc2UgYmV0dGVyIHNvbHV0aW9uLgo+PiA+Pgo+
PiA+PiBIVyBjb250cm9sbGVyIGNhbiB3b3JrIGluIDMgbW9kZXMuIFBJTyAtIGNhbiB3b3JrIGlu
IG1hc3RlciBvciBzbGF2ZSBETUEKPj4gPj4gQ0RNQSAtIG5lZWRzIE1hc3RlciBETUEgZm9yIGFj
Y2Vzc2luZyBjb21tYW5kIGRlc2NyaXB0b3JzLgo+PiA+PiBHZW5lcmljIG1vZGUgLSBjYW4gdXNl
IG9ubHkgU2xhdmUgRE1BLgo+PiA+Pgo+PiA+PiBHZW5lcmljIG1vZGUgaXMgbmVjY2Vzc2VyeSB0
byBpbXBsZW1lbnQgZnVuY3Rpb25zIG90aGVyIHRoYW4gcGFnZQo+PiA+PiBwcm9ncmFtLCBwYWdl
IHJlYWQsIGJsb2NrIGVyYXNlLiBTbyBpdCBpcyBlc3NlbnRpYWwuIEkgY2Fubm90IGF2b2lkCj4+
ID4+IHRvIHVzZSBTbGF2ZSBETUEuCj4+ID4KPj4gPlRoaXMgZGVzZXJ2ZXMgYSBuaWNlIGNvbW1l
bnQgYXQgdGhlIHRvcC4KPj4gT2sgSSB3aWxsIGFkZCB0aGUgbW9kZXMgZGVzY3JpcHRpb24gdG8g
Y292ZXIgbGV0dGVyLiA+Cj4KPk5vdCBvbmx5IHRvIHRoZSBjb3ZlciBsZXR0ZXI6IFBlb3BsZSBy
ZWFkIHRoZSBjb2RlLiBJbnRlcmVzdGVkIHBlb3BsZQo+bWlnaHQgYWxzbyByZWFkIHRoZSBjb21t
aXQgbG9nIHdoaWNoIGlzIHF1aXRlIGVhc3kgdG8gZmluZC4gVGhlIGNvdmVyCj5sZXR0ZXIgaG93
ZXZlciB3aWxsIGp1c3QgZGlzYXBwZWFyIGluIHRoZSBoaXN0b3J5IG9mIHRoZSBJbnRlcm5ldC4g
SQo+d291bGQgcmF0aGVyIHByZWZlciB5b3UgZXhwbGFpbiBob3cgdGhlIElQIHdvcmtzIGF0IHRo
ZSB0b3Agb2YgdGhlCj5kcml2ZXIuClNvIEkgd2lsbCBhZGQgdGhlIG1vZGVzIGRlc2NyaXB0aW9u
IHRvIGJvdGggY292ZXIgbGV0dGVyIGFuZCAKYXQgdGhlIHRvcCBvZiB0aGUgZHJpdmVyLiAKPgo+
Cj5UaGFua3MsCj5NaXF1w6hsCgpUaGFua3MsClBpb3RyIAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
