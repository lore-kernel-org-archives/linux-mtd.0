Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 598B9C433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Mar 2022 08:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=30pYsQ0WP2bPb3vyWcFcBKTvBjhdzIYsAuNloTfOskI=; b=CDkcxYpIQL56dE
	3vqlYVxBhygNmCrnhlawplmPzLlehYlN0zwoWuz4veqLNBFi7/YxHXY62X4VhztcMnyr43nx1U6eE
	Hcu/vER1jo9vFIvIYyOZwd/Hs6dob0IVPZJixY9B3aF2u4bb+7GVcxqh7aOswoxShekadBPf/IlHL
	C3yCaYqXnvXsBT2U6oLya0bpz6Scp7szl/vL0CDUiEmhPGkUBokLhsOXdjvFAmh7mPUteGO2Zv36F
	qS2plxwb+YGEEtV6qrowHUqCo5LXcWAwwEOqbuL0ImFXIwU7aB9UF2nnbZi9XgxgZnUGjISHqNo8G
	1Q937ysdTmP0x3ggbkjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQ3St-0094e4-HS; Fri, 04 Mar 2022 08:39:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ3RG-009415-1s; Fri, 04 Mar 2022 08:37:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
 :Content-Type:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=Jaz3rADQtg0igOkstkUzgxEkPalgKU3CMaMYWy6Z8x0=; b=lzTUFXwUZkyP2Jo62wYYYEbWxC
 EBM5PVj7Ofa3/yCgR5XUPMg7YI1h8QX2wYsitg8I3KKJ9eryRPcelnAfO6s9LB1LlVhBkCndVKr/Q
 AfsBVXj3Acgd9P0sQKLid7wFRl9MZ+EJjAGKNnnrekUig0NO3zqdUBbJHdzJevTN2CPeu56CDN4YH
 aQssAZfz78tUdXtEeRsIc70uaW1EMVbZUEKGbZe3Z1OCps51077nNIapRZSvPdJFy34UhtmQbgb1L
 FwkS4vAZ5yj8e2KPfBSIP5qGQqvoG5xXuoTwE7bIHrXrnO3lL2mmMU9CptykFNMoVr56pPgrDbC5a
 yJwdlxTQ==;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ3RA-00F9Bq-RR; Fri, 04 Mar 2022 08:37:24 +0000
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2245mZOM017554; 
 Fri, 4 Mar 2022 08:36:58 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ekcxutmy4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Mar 2022 08:36:57 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 2247l3fu017315;
 Fri, 4 Mar 2022 08:36:57 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ekcxutmxr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Mar 2022 08:36:56 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2248Xu9E010690;
 Fri, 4 Mar 2022 08:36:55 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3ek4kg97h6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Mar 2022 08:36:55 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2248aq8G46203380
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Mar 2022 08:36:53 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E2DEB11C054;
 Fri,  4 Mar 2022 08:36:52 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3C63911C04C;
 Fri,  4 Mar 2022 08:36:52 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri,  4 Mar 2022 08:36:52 +0000 (GMT)
Received: from yukon.home (unknown [9.171.91.16])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 781B92201B4;
 Fri,  4 Mar 2022 09:36:50 +0100 (CET)
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
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Tao Ren <rentao.bupt@gmail.com>, Rob Herring <robh@kernel.org>
Subject: [PATCH v3 03/11] dt-bindings: spi: Add Aspeed SMC controllers device
 tree binding
Date: Fri,  4 Mar 2022 09:36:35 +0100
Message-Id: <20220304083643.1079142-4-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220304083643.1079142-1-clg@kaod.org>
References: <20220304083643.1079142-1-clg@kaod.org>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: vpEWkgt5DewMB-Xe7d8w_YuLaw2D-kKM
X-Proofpoint-GUID: tngVHb-kz-AyznNjZLB30r9bP_8y3fRd
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-04_02,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 adultscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203040044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_083721_233591_A1CA6805 
X-CRM114-Status: GOOD (  17.78  )
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

VGhlICJpbnRlcnJ1cHQiIHByb3BlcnR5IGlzIG9wdGlvbmFsIGJlY2F1c2UgaXQgaXMgb25seSBu
ZWNlc3NhcnkgZm9yCmNvbnRyb2xsZXJzIHN1cHBvcnRpbmcgRE1BcyAoTm90IGltcGxlbWVudGVk
IHlldCBpbiB0aGUgbmV3IGRyaXZlcikuCgpDYzogQ2hpbi1UaW5nIEt1byA8Y2hpbi10aW5nX2t1
b0Bhc3BlZWR0ZWNoLmNvbT4KVGVzdGVkLWJ5OiBKb2VsIFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1
PgpUZXN0ZWQtYnk6IFRhbyBSZW4gPHJlbnRhby5idXB0QGdtYWlsLmNvbT4KUmV2aWV3ZWQtYnk6
IEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+ClJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8
cm9iaEBrZXJuZWwub3JnPgpTaWduZWQtb2ZmLWJ5OiBDw6lkcmljIExlIEdvYXRlciA8Y2xnQGth
b2Qub3JnPgotLS0KIC4uLi9iaW5kaW5ncy9zcGkvYXNwZWVkLGFzdDI2MDAtZm1jLnlhbWwgICAg
ICB8IDg3ICsrKysrKysrKysrKysrKysrKysKIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICA5ICsrCiAyIGZpbGVzIGNoYW5nZWQsIDk2IGluc2VydGlvbnMo
KykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
c3BpL2FzcGVlZCxhc3QyNjAwLWZtYy55YW1sCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3NwaS9hc3BlZWQsYXN0MjYwMC1mbWMueWFtbCBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvYXNwZWVkLGFzdDI2MDAtZm1jLnlhbWwKbmV3
IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi5lMTZiYmNkMzg1NjAKLS0tIC9k
ZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL2FzcGVl
ZCxhc3QyNjAwLWZtYy55YW1sCkBAIC0wLDAgKzEsODcgQEAKKyMgU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IChHUEwtMi4wIE9SIEJTRC0yLUNsYXVzZSkKKyVZQU1MIDEuMgorLS0tCiskaWQ6IGh0
dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3NwaS9hc3BlZWQsYXN0MjYwMC1mbWMueWFtbCMK
KyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwor
Cit0aXRsZTogQXNwZWVkIFNNQyBjb250cm9sbGVycyBiaW5kaW5ncworCittYWludGFpbmVyczoK
KyAgLSBDaGluLVRpbmcgS3VvIDxjaGluLXRpbmdfa3VvQGFzcGVlZHRlY2guY29tPgorICAtIEPD
qWRyaWMgTGUgR29hdGVyIDxjbGdAa2FvZC5vcmc+CisKK2Rlc2NyaXB0aW9uOiB8CisgIFRoaXMg
YmluZGluZyBkZXNjcmliZXMgdGhlIEFzcGVlZCBTdGF0aWMgTWVtb3J5IENvbnRyb2xsZXJzIChG
TUMgYW5kCisgIFNQSSkgb2YgdGhlIEFTVDI0MDAsIEFTVDI1MDAgYW5kIEFTVDI2MDAgU09Dcy4K
KworYWxsT2Y6CisgIC0gJHJlZjogInNwaS1jb250cm9sbGVyLnlhbWwjIgorCitwcm9wZXJ0aWVz
OgorICBjb21wYXRpYmxlOgorICAgIGVudW06CisgICAgICAtIGFzcGVlZCxhc3QyNjAwLWZtYwor
ICAgICAgLSBhc3BlZWQsYXN0MjYwMC1zcGkKKyAgICAgIC0gYXNwZWVkLGFzdDI1MDAtZm1jCisg
ICAgICAtIGFzcGVlZCxhc3QyNTAwLXNwaQorICAgICAgLSBhc3BlZWQsYXN0MjQwMC1mbWMKKyAg
ICAgIC0gYXNwZWVkLGFzdDI0MDAtc3BpCisKKyAgcmVnOgorICAgIGl0ZW1zOgorICAgICAgLSBk
ZXNjcmlwdGlvbjogcmVnaXN0ZXJzCisgICAgICAtIGRlc2NyaXB0aW9uOiBtZW1vcnkgbWFwcGlu
ZworCisgIGNsb2NrczoKKyAgICBtYXhJdGVtczogMQorCisgIGludGVycnVwdHM6CisgICAgbWF4
SXRlbXM6IDEKKworcGF0dGVyblByb3BlcnRpZXM6CisgICJAWzAtOWEtZl0rIjoKKyAgICB0eXBl
OiBvYmplY3QKKworICAgIHByb3BlcnRpZXM6CisgICAgICBzcGktcngtYnVzLXdpZHRoOgorICAg
ICAgICBlbnVtOiBbMSwgMiwgNF0KKworcmVxdWlyZWQ6CisgIC0gY29tcGF0aWJsZQorICAtIHJl
ZworICAtIGNsb2NrcworCit1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlCisKK2V4YW1wbGVz
OgorICAtIHwKKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIv
YXJtLWdpYy5oPgorICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxl
ci9hc3BlZWQtc2N1LWljLmg+CisgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL2FzdDI2
MDAtY2xvY2suaD4KKworICAgIHNwaUAxZTYyMDAwMCB7CisgICAgICAgIHJlZyA9IDwweDFlNjIw
MDAwIDB4YzQ+LCA8MHgyMDAwMDAwMCAweDEwMDAwMDAwPjsKKyAgICAgICAgI2FkZHJlc3MtY2Vs
bHMgPSA8MT47CisgICAgICAgICNzaXplLWNlbGxzID0gPDA+OworICAgICAgICBjb21wYXRpYmxl
ID0gImFzcGVlZCxhc3QyNjAwLWZtYyI7CisgICAgICAgIGNsb2NrcyA9IDwmc3lzY29uIEFTUEVF
RF9DTEtfQUhCPjsKKyAgICAgICAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDM5IElSUV9UWVBFX0xF
VkVMX0hJR0g+OworICAgICAgICBmbGFzaEAwIHsKKyAgICAgICAgICAgICAgICByZWcgPSA8IDAg
PjsKKyAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImplZGVjLHNwaS1ub3IiOworICAgICAg
ICAgICAgICAgIHNwaS1tYXgtZnJlcXVlbmN5ID0gPDUwMDAwMDAwPjsKKyAgICAgICAgICAgICAg
ICBzcGktcngtYnVzLXdpZHRoID0gPDI+OworICAgICAgICB9OworICAgICAgICBmbGFzaEAxIHsK
KyAgICAgICAgICAgICAgICByZWcgPSA8IDEgPjsKKyAgICAgICAgICAgICAgICBjb21wYXRpYmxl
ID0gImplZGVjLHNwaS1ub3IiOworICAgICAgICAgICAgICAgIHNwaS1tYXgtZnJlcXVlbmN5ID0g
PDUwMDAwMDAwPjsKKyAgICAgICAgICAgICAgICBzcGktcngtYnVzLXdpZHRoID0gPDI+OworICAg
ICAgICB9OworICAgICAgICBmbGFzaEAyIHsKKyAgICAgICAgICAgICAgICByZWcgPSA8IDIgPjsK
KyAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImplZGVjLHNwaS1ub3IiOworICAgICAgICAg
ICAgICAgIHNwaS1tYXgtZnJlcXVlbmN5ID0gPDUwMDAwMDAwPjsKKyAgICAgICAgICAgICAgICBz
cGktcngtYnVzLXdpZHRoID0gPDI+OworICAgICAgICB9OworICAgIH07CmRpZmYgLS1naXQgYS9N
QUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCmluZGV4IDQxNzUxMDNlOTI4ZC4uZjVhYjc3NTQ4ZWY2
IDEwMDY0NAotLS0gYS9NQUlOVEFJTkVSUworKysgYi9NQUlOVEFJTkVSUwpAQCAtMjkyNSw2ICsy
OTI1LDE1IEBAIFM6CU1haW50YWluZWQKIEY6CURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tbWMvYXNwZWVkLHNkaGNpLnlhbWwKIEY6CWRyaXZlcnMvbW1jL2hvc3Qvc2RoY2ktb2Yt
YXNwZWVkKgogCitBU1BFRUQgU01DIFNQSSBEUklWRVIKK006CUNoaW4tVGluZyBLdW8gPGNoaW4t
dGluZ19rdW9AYXNwZWVkdGVjaC5jb20+CitNOglDw6lkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qu
b3JnPgorTDoJbGludXgtYXNwZWVkQGxpc3RzLm96bGFicy5vcmcgKG1vZGVyYXRlZCBmb3Igbm9u
LXN1YnNjcmliZXJzKQorTDoJb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnIChtb2RlcmF0ZWQgZm9y
IG5vbi1zdWJzY3JpYmVycykKK0w6CWxpbnV4LXNwaUB2Z2VyLmtlcm5lbC5vcmcKK1M6CU1haW50
YWluZWQKK0Y6CURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvYXNwZWVkLGFz
dDI2MDAtZm1jLnlhbWwKKwogQVNQRUVEIFZJREVPIEVOR0lORSBEUklWRVIKIE06CUVkZGllIEph
bWVzIDxlYWphbWVzQGxpbnV4LmlibS5jb20+CiBMOglsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5v
cmcKLS0gCjIuMzQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
