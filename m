Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3DC7C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Feb 2022 09:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TyVJwMQILt5kTa0uwR76KpspJqftEULsuE0WQe3nFGc=; b=YhQxqlRTHqZaTJ
	jXcbI9NwZMBFalTG2OLveZUuvugbsJUBLaRI62NxemVDdV6LlVDW76YTCZSCohYmr9CwM9QlZTElp
	3rQj2MrSgQ3bmlwOXZ6d8VNZY9hsoWkz3iXQeUseWDRx7ENjlUgtxkCyYeTnCuJuJ8eoSDkoS4VeK
	2nOSAi8b5m7+TSK3vV1ZBnb7qtohqaMNG09WlBA9cShCDylXAXxLJhixzdCeSJBeKZCWaJCsUiKmx
	/fC1tGd1c1UXlNjjTvfaINvwfzkU0AQ673alcTcWm8+npUUaYPRPRFijZeI6hGweUXcOJF59p4Ix0
	VwaL+ODPsDShNuke/JkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJY7d-00ENB9-WF; Mon, 14 Feb 2022 09:58:19 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJXt1-00EJ1g-TA; Mon, 14 Feb 2022 09:43:14 +0000
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21E8mjCI031709; 
 Mon, 14 Feb 2022 09:42:43 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e7aveu7wu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 09:42:43 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21E9dnqC001473;
 Mon, 14 Feb 2022 09:42:41 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3e64h9kgj7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 09:42:41 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 21E9gc8v38273394
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Feb 2022 09:42:39 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C24D14C040;
 Mon, 14 Feb 2022 09:42:38 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 274A94C05A;
 Mon, 14 Feb 2022 09:42:38 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 14 Feb 2022 09:42:38 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.60.190])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 74F062201DE;
 Mon, 14 Feb 2022 10:42:36 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org
Cc: Mark Brown <broonie@kernel.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-aspeed@lists.ozlabs.org,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 00/10] spi: spi-mem: Add driver for Aspeed SMC controllers
Date: Mon, 14 Feb 2022 10:42:21 +0100
Message-Id: <20220214094231.3753686-1-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: vREdrqhFBBnJcVUIFbWv2MHoqDOlP0nz
X-Proofpoint-ORIG-GUID: vREdrqhFBBnJcVUIFbWv2MHoqDOlP0nz
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-14_01,2022-02-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034
 priorityscore=1501 suspectscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 phishscore=0 impostorscore=0 spamscore=0 adultscore=0
 bulkscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202140058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_014312_116760_4D309D6B 
X-CRM114-Status: GOOD (  27.35  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksCgpUaGlzIHNlcmllcyBhZGRzIGEgbmV3IFNQSSBkcml2ZXIgdXNpbmcgdGhlIHNwaS1tZW0g
aW50ZXJmYWNlIGZvciB0aGUKQXNwZWVkIHN0YXRpYyBtZW1vcnkgY29udHJvbGxlcnMgb2YgdGhl
IEFTVDI2MDAsIEFTVDI1MDAgYW5kIEFTVDI0MDAKU29Dcy4KCiAqIEFTVDI2MDAgRmlybXdhcmUg
U1BJIE1lbW9yeSBDb250cm9sbGVyIChGTUMpCiAqIEFTVDI2MDAgU1BJIEZsYXNoIENvbnRyb2xs
ZXIgKFNQSTEgYW5kIFNQSTIpCiAqIEFTVDI1MDAgRmlybXdhcmUgU1BJIE1lbW9yeSBDb250cm9s
bGVyIChGTUMpCiAqIEFTVDI1MDAgU1BJIEZsYXNoIENvbnRyb2xsZXIgKFNQSTEgYW5kIFNQSTIp
CiAqIEFTVDI0MDAgTmV3IFN0YXRpYyBNZW1vcnkgQ29udHJvbGxlciAoYWxzbyByZWZlcnJlZCBh
cyBGTUMpCiAqIEFTVDI0MDAgU1BJIEZsYXNoIENvbnRyb2xsZXIgKFNQSSkKCkl0IGlzIGJhc2Vk
IG9uIHRoZSBjdXJyZW50IE9wZW5CTUMga2VybmVsIGRyaXZlciBbMV0sIHVzaW5nIGRpcmVjdGx5
CnRoZSBNVEQgU1BJLU5PUiBpbnRlcmZhY2UgYW5kIG9uIGEgcGF0Y2hzZXQgWzJdIHByZXZpb3Vz
bHkgcHJvcG9zZWQKYWRkaW5nIHN1cHBvcnQgZm9yIHRoZSBBU1QyNjAwIG9ubHkuIFRoaXMgZHJp
dmVyIHRha2VzIGEgc2xpZ2h0bHkKZGlmZmVyZW50IGFwcHJvYWNoIHRvIGNvdmVyIGFsbCA2IGNv
bnRyb2xsZXJzLgoKSXQgZG9lcyBub3QgbWFrZSB1c2Ugb2YgdGhlIGNvbnRyb2xsZXIgcmVnaXN0
ZXIgZGlzYWJsaW5nIEFkZHJlc3MgYW5kCkRhdGEgYnl0ZSBsYW5lcyBiZWNhdXNlIGlzIG5vdCBh
dmFpbGFibGUgb24gdGhlIEFTVDI0MDAgU29DLiBXZSBjb3VsZAppbnRyb2R1Y2UgYSBzcGVjaWZp
YyBoYW5kbGVyIGZvciBuZXcgZmVhdHVyZXMgYXZhaWxhYmxlIG9uIHJlY2VudCBTb0NzCmlmIG5l
ZWRlZC4gQXMgdGhlcmUgaXMgbm90IG11Y2ggZGlmZmVyZW5jZSBvbiBwZXJmb3JtYW5jZSwgdGhl
IGRyaXZlcgpjaG9vc2VzIHRoZSBjb21tb24gZGVub21pbmF0b3I6ICJVc2VyIG1vZGUiIHdoaWNo
IGhhcyBiZWVuIGhlYXZpbHkKdGVzdGVkIGluIFsxXS4gIlVzZXIgbW9kZSIgaXMgYWxzbyB1c2Vk
IGFzIGEgZmFsbCBiYWNrIG1ldGhvZCB3aGVuCmZsYXNoIGRldmljZSBtYXBwaW5nIHdpbmRvdyBp
cyB0b28gc21hbGwuCgpQcm9ibGVtcyB0byBhZGRyZXNzIHdpdGggc3BpLW1lbSB3ZXJlIHRoZSBj
b25maWd1cmF0aW9uIG9mIHRoZSBtYXBwaW5nCndpbmRvd3MgYW5kIHRoZSBjYWxpYnJhdGlvbiBv
ZiB0aGUgcmVhZCB0aW1pbmdzLiBUaGUgZHJpdmVyIGhhbmRsZXMKdGhlbSBpbiB0aGUgZGlyZWN0
IG1hcHBpbmcgaGFuZGxlciB3aGVuIHNvbWUga25vd2xlZGdlIG9uIHRoZSBzaXplIG9mCnRoZSBm
bGFzaCBkZXZpY2UgaXMga25vdy4gSXQgaXMgbm90IHBlcmZlY3QgYnV0IG5vdCBpbmNvcnJlY3Qg
ZWl0aGVyLgpUaGUgYWxnb3JpdGhtIGlzIG9uZSBmcm9tIFsxXSBiZWNhdXNlIGl0IGRvZXNuJ3Qg
cmVxdWlyZSB0aGUgRE1BCnJlZ2lzdGVycyB3aGljaCBhcmUgbm90IGF2YWlsYWJsZSBvbiBhbGwg
Y29udHJvbGxlcnMuCgpEaXJlY3QgbWFwcGluZyBmb3Igd3JpdGVzIGlzIG5vdCBzdXBwb3J0ZWQg
KHlldCkuIEkgaGF2ZSBzZWVuIHNvbWUKY29ycnVwdGlvbiB3aXRoIHdyaXRlcyBhbmQgSSBwcmVm
ZXJyZWQgdG8gdXNlIHRoZSBzYWZlciBhbmQgcHJvdmVuCm1ldGhvZCBvZiB0aGUgaW5pdGlhbCBk
cml2ZXIgWzFdLiBXZSBjYW4gaW1wcm92ZSB0aGF0IGxhdGVyLgoKVGhlIGRyaXZlciBzdXBwb3J0
cyBRdWFkIFNQSSBSWCB0cmFuc2ZlcnMgb24gdGhlIEFTVDI2MDAgU29DIGJ1dCBpdApkaWRuJ3Qg
aGF2ZSB0aGUgZXhwZWN0ZWQgcmVzdWx0cy4gVGhlcmVmb3JlIGl0IGlzIG5vdCBhY3RpdmF0ZWQg
eWV0LgpUaGlzIG5lZWRzIG1vcmUgdGVzdHMuCgpUaGUgc2VyaWVzIGRvZXMgbm90IHJlbW92ZSB0
aGUgY3VycmVudCBBc3BlZWQgU01DIGRyaXZlciBidXQgcHJlcGFyZXMKZ3JvdW5kIGZvciBpdHMg
cmVtb3ZhbCBieSBjaGFuZ2luZyBpdHMgQ09ORklHIG9wdGlvbi4gVGhpcyBsYXN0IHN0ZXAKY2Fu
IGJlIGFkZHJlc3NlZCBhcyBhIGZvbGxvd3VwIHdoZW4gdGhlIG5ldyBkcml2ZXIgdXNpbmcgdGhl
IHNwaS1tZW0KaW50ZXJmYWNlIGhhcyBiZWVuIHN1ZmZpY2llbnRseSBleHBvc2VkLiAKClRlc3Rl
ZCBvbjoKIAogKiBPcGVuUE9XRVIgUGFsbWV0dG8gKEFTVDI0MDApCiAqIEV2YWx1YXRpb24gYm9h
cmQgKEFTVDI1MDApIAogKiBPcGVuUE9XRVIgV2l0aGVyc3Bvb24gKEFTVDI1MDApCiAqIEV2YWx1
YXRpb24gYm9hcmQgKEFTVDI2MDAgQTApCiAqIFJhaW5pZXIgYm9hcmQgKEFTVDI2MDApCiAKWzFd
IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL2xpbnV4L2Jsb2IvZGV2LTUuMTUvZHJpdmVycy9t
dGQvc3BpLW5vci9jb250cm9sbGVycy9hc3BlZWQtc21jLmMKWzJdIGh0dHBzOi8vcGF0Y2h3b3Jr
Lm96bGFicy5vcmcvcHJvamVjdC9saW51eC1hc3BlZWQvbGlzdC8/c2VyaWVzPTIxMjM5NAoKVGhh
bmtzLAoKQy4gCgpDw6lkcmljIExlIEdvYXRlciAoMTApOgogIG10ZDogc3BpLW5vcjogYXNwZWVk
OiBSZW5hbWUgS2NvbmZpZyBvcHRpb24KICBkdC1iaW5kaW5nczogc3BpOiBBZGQgQXNwZWVkIFNN
QyBjb250cm9sbGVycyBkZXZpY2UgdHJlZSBiaW5kaW5nCiAgc3BpOiBzcGktbWVtOiBBZGQgZHJp
dmVyIGZvciBBc3BlZWQgU01DIGNvbnRyb2xsZXJzCiAgc3BpOiBhc3BlZWQ6IEFkZCBzdXBwb3J0
IGZvciBkaXJlY3QgbWFwcGluZwogIHNwaTogYXNwZWVkOiBBZGp1c3QgZGlyZWN0IG1hcHBpbmcg
dG8gZGV2aWNlIHNpemUKICBzcGk6IGFzcGVlZDogV29ya2Fyb3VuZCBBU1QyNTAwIGxpbWl0YXRp
b25zCiAgc3BpOiBhc3BlZWQ6IEFkZCBzdXBwb3J0IGZvciB0aGUgQVNUMjQwMCBTUEkgY29udHJv
bGxlcgogIHNwaTogYXNwZWVkOiBDYWxpYnJhdGUgcmVhZCB0aW1pbmdzCiAgQVJNOiBkdHM6IGFz
cGVlZDogRW5hYmxlIER1YWwgU1BJIFJYIHRyYW5zZmVycwogIHNwaTogYXNwZWVkOiBBY3RpdmF0
ZSBuZXcgc3BpLW1lbSBkcml2ZXIKCiBkcml2ZXJzL3NwaS9zcGktYXNwZWVkLXNtYy5jICAgICAg
ICAgICAgICAgICAgfCAxMjQxICsrKysrKysrKysrKysrKysrCiAuLi4vYmluZGluZ3Mvc3BpL2Fz
cGVlZCxhc3QyNjAwLWZtYy55YW1sICAgICAgfCAgIDkyICsrCiBhcmNoL2FybS9ib290L2R0cy9h
c3BlZWQtZzQuZHRzaSAgICAgICAgICAgICAgfCAgICA2ICsKIGFyY2gvYXJtL2Jvb3QvZHRzL2Fz
cGVlZC1nNS5kdHNpICAgICAgICAgICAgICB8ICAgIDcgKwogYXJjaC9hcm0vYm9vdC9kdHMvYXNw
ZWVkLWc2LmR0c2kgICAgICAgICAgICAgIHwgICAgOCArCiBkcml2ZXJzL210ZC9zcGktbm9yL2Nv
bnRyb2xsZXJzL0tjb25maWcgICAgICAgfCAgICA0ICstCiBkcml2ZXJzL210ZC9zcGktbm9yL2Nv
bnRyb2xsZXJzL01ha2VmaWxlICAgICAgfCAgICAyICstCiBkcml2ZXJzL3NwaS9LY29uZmlnICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDExICsKIGRyaXZlcnMvc3BpL01ha2VmaWxlICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDEgKwogOSBmaWxlcyBjaGFuZ2VkLCAxMzY5IGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9z
cGkvc3BpLWFzcGVlZC1zbWMuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9zcGkvYXNwZWVkLGFzdDI2MDAtZm1jLnlhbWwKCi0tIAoyLjM0LjEK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
