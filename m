Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D221C433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Mar 2022 17:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NAljXe/Idp95KzquGvgAb0kw0VgAFoVIsU1+2nl+0HQ=; b=x8jXzAueaDXxNX
	Q6pJRmghvYljZTZlnKZ+qQ/rUaEhxhykvghhkm37rTfDUChEoHppw7Y6GEvxk8hlXhLIW7UlIkhRm
	9e576cmN2KRHP+mAU3SMPxd6TT0Zj+qAQYWpgZz0gTTybdv5iAkUxV2+BrULjPnVx9hoCPp6rVGSd
	cuUqJELLUj3Kict1d+NXoHdbw1h3piODH18OZP87bJK4PP4NOjfC+ZmStaotrDvgndlAJupp2MR/B
	eSdNkfxcHdfbmQAyNpneY5unvfQvKaAIZNDSQ4CZDuDYEMmY6U/l+JY++dPMWhTL/cl1OabuYvXxz
	xYyTfncs+MWKGDL20R9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPSrp-003aMg-EV; Wed, 02 Mar 2022 17:34:25 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPSpK-003Z4V-3G; Wed, 02 Mar 2022 17:31:54 +0000
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 222Gmews002118; 
 Wed, 2 Mar 2022 17:31:22 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ejce98tqj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 17:31:22 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222HDEOI008064;
 Wed, 2 Mar 2022 17:31:20 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 3egbj1amfe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 17:31:20 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 222HKMxa50856382
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 17:20:22 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 00C8C42049;
 Wed,  2 Mar 2022 17:31:18 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 57AFC42041;
 Wed,  2 Mar 2022 17:31:17 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 17:31:17 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 9CCB52200FE;
 Wed,  2 Mar 2022 18:31:15 +0100 (CET)
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
Subject: [PATCH v2 00/10] spi: spi-mem: Add driver for Aspeed SMC controllers
Date: Wed,  2 Mar 2022 18:31:04 +0100
Message-Id: <20220302173114.927476-1-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: wDLBteKCrxXYtKjAXv-rfFdghRBIgirB
X-Proofpoint-ORIG-GUID: wDLBteKCrxXYtKjAXv-rfFdghRBIgirB
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_12,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0
 impostorscore=0 mlxlogscore=999 malwarescore=0 clxscore=1034 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203020076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_093150_342101_2F3D62F1 
X-CRM114-Status: GOOD (  31.17  )
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
eWV0LgpUaGVyZSBhcmUgc29tZSBpc3N1ZXMgb24gdGhlIHBpbmN0cmwgdG8gaW52ZXN0aWdhdGUg
Zmlyc3QuIAoKVGhlIHNlcmllcyBkb2VzIG5vdCByZW1vdmUgdGhlIGN1cnJlbnQgQXNwZWVkIFNN
QyBkcml2ZXIgYnV0IHByZXBhcmVzCmdyb3VuZCBmb3IgaXRzIHJlbW92YWwgYnkgY2hhbmdpbmcg
aXRzIENPTkZJRyBvcHRpb24uIFRoaXMgbGFzdCBzdGVwCmNhbiBiZSBhZGRyZXNzZWQgYXMgYSBm
b2xsb3d1cCB3aGVuIHRoZSBuZXcgZHJpdmVyIHVzaW5nIHRoZSBzcGktbWVtCmludGVyZmFjZSBo
YXMgYmVlbiBzdWZmaWNpZW50bHkgZXhwb3NlZC4gCgpUZXN0ZWQgb246CiAKICogT3BlblBPV0VS
IFBhbG1ldHRvIChBU1QyNDAwKQogKiBGYWNlYm9vayBXZWRnZSAxMDAgQk1DIChBU1QyNDAwKSBi
eSBUYW8gUmVuIDxyZW50YW8uYnVwdEBnbWFpbC5jb20+CiAqIEV2YWx1YXRpb24gYm9hcmQgKEFT
VDI1MDApIAogKiBJbnNwdXIgRlA1MjgwRzIgQk1DICAoQVNUMjUwMCkgYnkgSm9obiBXYW5nIDx3
YW5nenEuam5AZ21haWwuY29tPgogKiBGYWNlYm9vayBCYWNrcGFjayBDTU0gQk1DIChBU1QyNTAw
KSBieSBUYW8gUmVuIDxyZW50YW8uYnVwdEBnbWFpbC5jb20+CiAqIE9wZW5QT1dFUiBXaXRoZXJz
cG9vbiAoQVNUMjUwMCkKICogRXZhbHVhdGlvbiBib2FyZCAoQVNUMjYwMCBBMCBhbmQgQTMpCiAq
IFJhaW5pZXIgYm9hcmQgKEFTVDI2MDApCiAKWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1j
L2xpbnV4L2Jsb2IvZGV2LTUuMTUvZHJpdmVycy9tdGQvc3BpLW5vci9jb250cm9sbGVycy9hc3Bl
ZWQtc21jLmMKWzJdIGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51eC1h
c3BlZWQvbGlzdC8/c2VyaWVzPTIxMjM5NAoKVGhhbmtzLAoKQy4gCgpDaGFuZ2VzIGluIHYyOgoK
IC0gRml4ZWQgZHRfYmluZGluZ19jaGVjayB3YXJuaW5ncyAoUm9iKQogLSBOZXcgZW50cnkgaW4g
TUFJTlRBSU5FUlMgCiAtIEFkZHJlc3NlZCBMdWthcyBjb21tZW50cyByZWdhcmRpbmcgdGhlIFNQ
SSBjb250cm9sbGVyIHJlZ2lzdHJhdGlvbgogICBhbmQgZGV2aWNlIHJlbW92YWwuIENoZWNrZWQg
d2l0aCBkcml2ZXIgYmluZC91bmJpbmQgICAKIC0gSW50cm9kdWNlZCBzZXR1cCBhbmQgY2xlYW51
cCBoYW5kbGVycyBhbmQgcmVtb3ZlZCByb3V0aW5lIGxvb3BpbmcKICAgb24gdGhlIERUIGNoaWxk
cmVuIHByb3BlcnRpZXMgKFByYXR5dXNoKQogLSBDbGFyaWZpZWQgaW4gY29tbWl0IGxvZyByZXF1
aXJlbWVudHMgZm9yIHRyYWluaW5nLgogLSBSZW1vdmVkIGRlZmNvbmZpZyBjaGFuZ2VzIG9mIHBh
dGNoIDEgc2luY2UgdGhleSB3ZXJlIHJldmVydGVkIGluCiAgIHRoZSBsYXN0IHBhdGNoIChKb2Vs
KQoKQ8OpZHJpYyBMZSBHb2F0ZXIgKDEwKToKICBtdGQ6IHNwaS1ub3I6IGFzcGVlZDogUmVuYW1l
IEtjb25maWcgb3B0aW9uCiAgQVJNOiBkdHM6IGFzcGVlZDogQWRqdXN0ICJyZWciIHByb3BlcnR5
IG9mIEZNQy9TUEkgY29udHJvbGxlcnMKICBkdC1iaW5kaW5nczogc3BpOiBBZGQgQXNwZWVkIFNN
QyBjb250cm9sbGVycyBkZXZpY2UgdHJlZSBiaW5kaW5nCiAgc3BpOiBzcGktbWVtOiBBZGQgZHJp
dmVyIGZvciBBc3BlZWQgU01DIGNvbnRyb2xsZXJzCiAgc3BpOiBhc3BlZWQ6IEFkZCBzdXBwb3J0
IGZvciBkaXJlY3QgbWFwcGluZwogIHNwaTogYXNwZWVkOiBBZGp1c3QgZGlyZWN0IG1hcHBpbmcg
dG8gZGV2aWNlIHNpemUKICBzcGk6IGFzcGVlZDogV29ya2Fyb3VuZCBBU1QyNTAwIGxpbWl0YXRp
b25zCiAgc3BpOiBhc3BlZWQ6IEFkZCBzdXBwb3J0IGZvciB0aGUgQVNUMjQwMCBTUEkgY29udHJv
bGxlcgogIHNwaTogYXNwZWVkOiBDYWxpYnJhdGUgcmVhZCB0aW1pbmdzCiAgQVJNOiBkdHM6IGFz
cGVlZDogRW5hYmxlIER1YWwgU1BJIFJYIHRyYW5zZmVycwoKIGRyaXZlcnMvc3BpL3NwaS1hc3Bl
ZWQtc21jLmMgICAgICAgICAgICAgICAgICB8IDExODYgKysrKysrKysrKysrKysrKysKIC4uLi9i
aW5kaW5ncy9zcGkvYXNwZWVkLGFzdDI2MDAtZm1jLnlhbWwgICAgICB8ICAgOTAgKysKIE1BSU5U
QUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMTAgKwogYXJjaC9h
cm0vYm9vdC9kdHMvYXNwZWVkLWc0LmR0c2kgICAgICAgICAgICAgIHwgICAxMiArLQogYXJjaC9h
cm0vYm9vdC9kdHMvYXNwZWVkLWc1LmR0c2kgICAgICAgICAgICAgIHwgICAxNiArLQogYXJjaC9h
cm0vYm9vdC9kdHMvYXNwZWVkLWc2LmR0c2kgICAgICAgICAgICAgIHwgICAxNyArLQogZHJpdmVy
cy9tdGQvc3BpLW5vci9jb250cm9sbGVycy9LY29uZmlnICAgICAgIHwgICAgNCArLQogZHJpdmVy
cy9tdGQvc3BpLW5vci9jb250cm9sbGVycy9NYWtlZmlsZSAgICAgIHwgICAgMiArLQogZHJpdmVy
cy9zcGkvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxMSArCiBkcml2ZXJz
L3NwaS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAxICsKIDEwIGZpbGVz
IGNoYW5nZWQsIDEzMzAgaW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgZHJpdmVycy9zcGkvc3BpLWFzcGVlZC1zbWMuYwogY3JlYXRlIG1vZGUgMTAwNjQ0
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvYXNwZWVkLGFzdDI2MDAtZm1j
LnlhbWwKCi0tIAoyLjM0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
