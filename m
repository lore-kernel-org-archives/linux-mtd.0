Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C34E9C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Mar 2022 10:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zaZcs4LQ0ubYV2cTVPndYrKf1C/tPfFTRtFwY02EUUs=; b=JDPCzVEiD1v9n9
	QS8+HcglAjlccHzSKvjmgIHMc75WzCqIbTsaowfyvo9DFQiVTiSBWk28MpcaE1h2jbXD69pFoMkXq
	texqPa6AwUP+wE88JD6mS2n6Mz3r3y2ET0vzJmHuPcjxivbr2YbvFJ84EmePNUGU1r+oGTuMaCjlk
	Qk9sTBYTVbQRHvJd/uQGilzsjKF3VSxHmxqyFnEDJTrwLyIWqP+cbQAM8XRbKr5uTswJoI6r+jxc9
	y6nz9f3cTNxHr53yujBMulVBYi7aEbiuHH2t0O1/+CG3sdTLzxpfMdw/GtI/p9g13N8tG8RU+rt45
	LG9/TWbZDXTJp8WkYhyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXgwP-001e9f-MO; Fri, 25 Mar 2022 10:13:10 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXgsw-001cV7-Le; Fri, 25 Mar 2022 10:09:38 +0000
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22P9ZM8W013340; 
 Fri, 25 Mar 2022 10:09:00 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3f0t26v3s7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Mar 2022 10:09:00 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22P9xLMJ008133;
 Fri, 25 Mar 2022 10:08:56 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 3ew6t94x2w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Mar 2022 10:08:56 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22PA8sGt53281182
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 10:08:54 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 51E1D42042;
 Fri, 25 Mar 2022 10:08:54 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AC0BF42041;
 Fri, 25 Mar 2022 10:08:53 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 25 Mar 2022 10:08:53 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.95.248])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id E21EB220121;
 Fri, 25 Mar 2022 11:08:51 +0100 (CET)
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
Subject: [PATCH v4 00/11] spi: spi-mem: Convert Aspeed SMC driver to spi-mem
Date: Fri, 25 Mar 2022 11:08:38 +0100
Message-Id: <20220325100849.2019209-1-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: JU0KiGmldJHd887xHBSDyergg_o_ZDeg
X-Proofpoint-GUID: JU0KiGmldJHd887xHBSDyergg_o_ZDeg
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-25_02,2022-03-24_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 clxscore=1034 impostorscore=0
 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203250057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_030934_866905_8F6D209E 
X-CRM114-Status: GOOD (  30.78  )
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
Zmlyc3QuIAoKVGVzdGVkIG9uOgogCiAqIE9wZW5QT1dFUiBQYWxtZXR0byAoQVNUMjQwMCkKICog
RmFjZWJvb2sgV2VkZ2UgMTAwIEJNQyAoQVNUMjQwMCkgYnkgVGFvIFJlbiA8cmVudGFvLmJ1cHRA
Z21haWwuY29tPgogKiBFdmFsdWF0aW9uIGJvYXJkIChBU1QyNTAwKSAKICogSW5zcHVyIEZQNTI4
MEcyIEJNQyAoQVNUMjUwMCkgYnkgSm9obiBXYW5nIDx3YW5nenEuam5AZ21haWwuY29tPgogKiBG
YWNlYm9vayBCYWNrcGFjayBDTU0gQk1DIChBU1QyNTAwKSBieSBUYW8gUmVuIDxyZW50YW8uYnVw
dEBnbWFpbC5jb20+CiAqIE9wZW5QT1dFUiBXaXRoZXJzcG9vbiAoQVNUMjUwMCkKICogRXZhbHVh
dGlvbiBib2FyZCAoQVNUMjYwMCBBMCBhbmQgQTMpCiAqIFJhaW5pZXIgYm9hcmQgKEFTVDI2MDAp
CiAKWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL2xpbnV4L2Jsb2IvZGV2LTUuMTUvZHJp
dmVycy9tdGQvc3BpLW5vci9jb250cm9sbGVycy9hc3BlZWQtc21jLmMKWzJdIGh0dHBzOi8vcGF0
Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51eC1hc3BlZWQvbGlzdC8/c2VyaWVzPTIxMjM5
NAoKVGhhbmtzLAoKQy4gCgpDaGFuZ2VzIGluIHY0OgoKICAtIFJlYmFzZWQgb24gNS4xOCAKICAt
IFJlbW92YWwgb2YgdGhlIFNQSS1OT1IgYmFzZSBkcml2ZXIgKHdlIGhhZCBlbm91Z2ggdGVzdHMp
CiAgLSBGaXggZm9yIHNtYWxsIHNpemUgZmxhc2ggZGV2aWNlcyBvbiBBU1QyNjAwIChQb3RpbikK
CkNoYW5nZXMgaW4gdjM6CgogLSBGaXhlZCBjb21waWxlIHdhcm5pbmcgb24gYXNwZWVkX3NwaV9k
aXJtYXBfcmVhZCgpIHByb3RvdHlwZSByZXBvcnRlZAogICBieSBrZXJuZWwgdGVzdCByb2JvdCAK
IC0gUmVtb3ZlZCB1bm5lY2Vzc2FyeSBlbnRyeSBpbiBhc3QyNjAwLWZtYy55YW1sCiAtIE5ldyBw
YXRjaCBmcm9tIFRhbyB0byBzZXQgc3BpLW1heC1mcmVxdWVuY3kgb24gYWxsIEZNQyBkZXZpY2Vz
CgpDaGFuZ2VzIGluIHYyOgoKIC0gRml4ZWQgZHRfYmluZGluZ19jaGVjayB3YXJuaW5ncyAoUm9i
KQogLSBOZXcgZW50cnkgaW4gTUFJTlRBSU5FUlMgCiAtIEFkZHJlc3NlZCBMdWthcyBjb21tZW50
cyByZWdhcmRpbmcgdGhlIFNQSSBjb250cm9sbGVyIHJlZ2lzdHJhdGlvbgogICBhbmQgZGV2aWNl
IHJlbW92YWwuIENoZWNrZWQgd2l0aCBkcml2ZXIgYmluZC91bmJpbmQgICAKIC0gSW50cm9kdWNl
ZCBzZXR1cCBhbmQgY2xlYW51cCBoYW5kbGVycyBhbmQgcmVtb3ZlZCByb3V0aW5lIGxvb3BpbmcK
ICAgb24gdGhlIERUIGNoaWxkcmVuIHByb3BlcnRpZXMgKFByYXR5dXNoKQogLSBDbGFyaWZpZWQg
aW4gY29tbWl0IGxvZyByZXF1aXJlbWVudHMgZm9yIHRyYWluaW5nLgogLSBSZW1vdmVkIGRlZmNv
bmZpZyBjaGFuZ2VzIG9mIHBhdGNoIDEgc2luY2UgdGhleSB3ZXJlIHJldmVydGVkIGluCiAgIHRo
ZSBsYXN0IHBhdGNoIChKb2VsKQoKQ8OpZHJpYyBMZSBHb2F0ZXIgKDkpOgogIEFSTTogZHRzOiBh
c3BlZWQ6IEFkanVzdCAicmVnIiBwcm9wZXJ0eSBvZiBGTUMvU1BJIGNvbnRyb2xsZXJzCiAgZHQt
YmluZGluZ3M6IHNwaTogQWRkIEFzcGVlZCBTTUMgY29udHJvbGxlcnMgZGV2aWNlIHRyZWUgYmlu
ZGluZwogIHNwaTogc3BpLW1lbTogQ29udmVydCBBc3BlZWQgU01DIGRyaXZlciB0byBzcGktbWVt
CiAgc3BpOiBhc3BlZWQ6IEFkZCBzdXBwb3J0IGZvciBkaXJlY3QgbWFwcGluZwogIHNwaTogYXNw
ZWVkOiBBZGp1c3QgZGlyZWN0IG1hcHBpbmcgdG8gZGV2aWNlIHNpemUKICBzcGk6IGFzcGVlZDog
V29ya2Fyb3VuZCBBU1QyNTAwIGxpbWl0YXRpb25zCiAgc3BpOiBhc3BlZWQ6IEFkZCBzdXBwb3J0
IGZvciB0aGUgQVNUMjQwMCBTUEkgY29udHJvbGxlcgogIHNwaTogYXNwZWVkOiBDYWxpYnJhdGUg
cmVhZCB0aW1pbmdzCiAgQVJNOiBkdHM6IGFzcGVlZDogRW5hYmxlIER1YWwgU1BJIFJYIHRyYW5z
ZmVycwoKUG90aW4gTGFpICgxKToKICBtdGQ6IHNwaS1ub3I6IGFzcGVlZDogc2V0IHRoZSBkZWNv
ZGluZyBzaXplIHRvIGF0IGxlYXN0IDJNQiBmb3IKICAgIEFTVDI2MDAKClRhbyBSZW4gKDEpOgog
IEFSTTogZHRzOiBhc3BlZWQtZzQ6IFNldCBzcGktbWF4LWZyZXF1ZW5jeSBmb3IgYWxsIGZsYXNo
ZXMKCiBkcml2ZXJzL210ZC9zcGktbm9yL2NvbnRyb2xsZXJzL2FzcGVlZC1zbWMuYyAgfCAgOTEw
IC0tLS0tLS0tLS0tLS0KIGRyaXZlcnMvc3BpL3NwaS1hc3BlZWQtc21jLmMgICAgICAgICAgICAg
ICAgICB8IDExOTcgKysrKysrKysrKysrKysrKysKIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL210
ZC9hc3BlZWQtc21jLnR4dCAgICB8ICAgNTEgLQogLi4uL2JpbmRpbmdzL3NwaS9hc3BlZWQsYXN0
MjYwMC1mbWMueWFtbCAgICAgIHwgICA4NyArKwogTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgICAxMCArCiBhcmNoL2FybS9ib290L2R0cy9hc3BlZWQtZzQu
ZHRzaSAgICAgICAgICAgICAgfCAgIDE2ICstCiBhcmNoL2FybS9ib290L2R0cy9hc3BlZWQtZzUu
ZHRzaSAgICAgICAgICAgICAgfCAgIDE2ICstCiBhcmNoL2FybS9ib290L2R0cy9hc3BlZWQtZzYu
ZHRzaSAgICAgICAgICAgICAgfCAgIDE3ICstCiBkcml2ZXJzL210ZC9zcGktbm9yL2NvbnRyb2xs
ZXJzL0tjb25maWcgICAgICAgfCAgIDEwIC0KIGRyaXZlcnMvbXRkL3NwaS1ub3IvY29udHJvbGxl
cnMvTWFrZWZpbGUgICAgICB8ICAgIDEgLQogZHJpdmVycy9zcGkvS2NvbmZpZyAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgICAxMSArCiBkcml2ZXJzL3NwaS9NYWtlZmlsZSAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgICAxICsKIDEyIGZpbGVzIGNoYW5nZWQsIDEzMzkgaW5zZXJ0aW9u
cygrKSwgOTg4IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbXRkL3Nw
aS1ub3IvY29udHJvbGxlcnMvYXNwZWVkLXNtYy5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVy
cy9zcGkvc3BpLWFzcGVlZC1zbWMuYwogZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvYXNwZWVkLXNtYy50eHQKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL2FzcGVlZCxhc3QyNjAwLWZt
Yy55YW1sCgotLSAKMi4zNC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
