Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B52EBC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Feb 2022 10:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VnnO7UiPZVJDtPEoeRNlCHmUyr4zIjvoGxQT7KgCQdA=; b=DBOCNGgVu8GpH7
	Cuc6Fi3W0Aiq/VgivGCAb1ggDZSJ7Mfo6dVTAXzHTem6pEgWJHamDlke2raRu1+JbJz992GYCHd6b
	NXqgja80OQTeDtzCp5fFdQ+pQ7XB9l3dKTHG0lrNzAHr2FGq80nEaY69aEE+229e37KtFN/M/3+a5
	iN+BlMbzHV+q5uL4ha+ccYuL+ZmpYrY/heHMV/iVpBTZvLZsubnHbCwPdScWMUneaYbcTqSx1oh61
	a0bZN9WCs6hHHUzocEjhu6kmhLtXcm6YxagmPYGqHrM38+BlfD14aR20qP7nAu5X4s91lNKyMBxNh
	u99ltwai1l0QZlg8yPjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJYS1-00ETIA-By; Mon, 14 Feb 2022 10:19:21 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJXt8-00EJ1P-4J; Mon, 14 Feb 2022 09:43:20 +0000
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21E8sLWM021842; 
 Mon, 14 Feb 2022 09:42:46 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e7c4dscmj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 09:42:45 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21E9biYV021918;
 Mon, 14 Feb 2022 09:42:44 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 3e645jbjs2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 09:42:44 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 21E9WNfw31326704
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Feb 2022 09:32:23 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6F0F04203F;
 Mon, 14 Feb 2022 09:42:41 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CFB9042045;
 Mon, 14 Feb 2022 09:42:40 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 14 Feb 2022 09:42:40 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.60.190])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 3F91F2201DE;
 Mon, 14 Feb 2022 10:42:39 +0100 (CET)
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
Subject: [PATCH 02/10] dt-bindings: spi: Add Aspeed SMC controllers device
 tree binding
Date: Mon, 14 Feb 2022 10:42:23 +0100
Message-Id: <20220214094231.3753686-3-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220214094231.3753686-1-clg@kaod.org>
References: <20220214094231.3753686-1-clg@kaod.org>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: SVAXzlNXx-lcWtADIb1AJM6h38RvEX5S
X-Proofpoint-ORIG-GUID: SVAXzlNXx-lcWtADIb1AJM6h38RvEX5S
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-14_01,2022-02-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1034 lowpriorityscore=0 impostorscore=0
 suspectscore=0 mlxlogscore=815 priorityscore=1501 mlxscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202140058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_014318_401645_52126D9B 
X-CRM114-Status: GOOD (  16.08  )
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
b0Bhc3BlZWR0ZWNoLmNvbT4KU2lnbmVkLW9mZi1ieTogQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0Br
YW9kLm9yZz4KLS0tCiAuLi4vYmluZGluZ3Mvc3BpL2FzcGVlZCxhc3QyNjAwLWZtYy55YW1sICAg
ICAgfCA5MiArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOTIgaW5zZXJ0aW9u
cygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9zcGkvYXNwZWVkLGFzdDI2MDAtZm1jLnlhbWwKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL2FzcGVlZCxhc3QyNjAwLWZtYy55YW1sIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwaS9hc3BlZWQsYXN0MjYwMC1mbWMueWFtbApu
ZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLmVkNzFjNGQ4NjkzMAotLS0g
L2Rldi9udWxsCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvYXNw
ZWVkLGFzdDI2MDAtZm1jLnlhbWwKQEAgLTAsMCArMSw5MiBAQAorIyBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogKEdQTC0yLjAgT1IgQlNELTItQ2xhdXNlKQorJVlBTUwgMS4yCistLS0KKyRpZDog
aHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvc3BpL2FzcGVlZCxhc3QyNjAwLWZtYy55YW1s
IworJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwj
CisKK3RpdGxlOiBBc3BlZWQgU01DIGNvbnRyb2xsZXJzIGJpbmRpbmdzCisKK21haW50YWluZXJz
OgorICAtIENoaW4tVGluZyBLdW8gPGNoaW4tdGluZ19rdW9AYXNwZWVkdGVjaC5jb20+CisgIC0g
Q8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4KKworZGVzY3JpcHRpb246IHwKKyAgVGhp
cyBiaW5kaW5nIGRlc2NyaWJlcyB0aGUgQXNwZWVkIFN0YXRpYyBNZW1vcnkgQ29udHJvbGxlcnMg
KEZNQyBhbmQKKyAgU1BJKSBvZiB0aGUgQVNUMjQwMCwgQVNUMjUwMCBhbmQgQVNUMjYwMCBTT0Nz
LgorCithbGxPZjoKKyAgLSAkcmVmOiAic3BpLWNvbnRyb2xsZXIueWFtbCMiCisKK3Byb3BlcnRp
ZXM6CisgIGNvbXBhdGlibGU6CisgICAgZW51bToKKyAgICAgIC0gYXNwZWVkLGFzdDI2MDAtZm1j
CisgICAgICAtIGFzcGVlZCxhc3QyNjAwLXNwaQorICAgICAgLSBhc3BlZWQsYXN0MjUwMC1mbWMK
KyAgICAgIC0gYXNwZWVkLGFzdDI1MDAtc3BpCisgICAgICAtIGFzcGVlZCxhc3QyNDAwLWZtYwor
ICAgICAgLSBhc3BlZWQsYXN0MjQwMC1zcGkKKworICByZWc6CisgICAgaXRlbXM6CisgICAgICAt
IGRlc2NyaXB0aW9uOiByZWdpc3RlcnMKKyAgICAgIC0gZGVzY3JpcHRpb246IG1lbW9yeSBtYXBw
aW5nCisKKyAgY2xvY2tzOgorICAgIG1heEl0ZW1zOiAxCisKKyAgaW50ZXJydXB0czoKKyAgICBt
YXhJdGVtczogMQorCitwYXR0ZXJuUHJvcGVydGllczoKKyAgIkBbMC05YS1mXSsiOgorICAgIHR5
cGU6IG9iamVjdAorCisgICAgcHJvcGVydGllczoKKyAgICAgIHNwaS1yeC1idXMtd2lkdGg6Cisg
ICAgICAgIGVudW06IFsxLCAyLCA0XQorCisgICAgcmVxdWlyZWQ6CisgICAgICAtIHJlZworCity
ZXF1aXJlZDoKKyAgLSBjb21wYXRpYmxlCisgIC0gcmVnCisgIC0gY2xvY2tzCisKK3VuZXZhbHVh
dGVkUHJvcGVydGllczogZmFsc2UKKworZXhhbXBsZXM6CisgIC0gfAorICAgICNpbmNsdWRlIDxk
dC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9hcm0tZ2ljLmg+CisgICAgI2luY2x1ZGUg
PGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2FzcGVlZC1zY3UtaWMuaD4KKyAgICAj
aW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2svYXN0MjYwMC1jbG9jay5oPgorCisgICAgc3BpQDFl
NjIwMDAwIHsKKyAgICAgICAgcmVnID0gPCAweDFlNjIwMDAwIDB4YzQKKyAgICAgICAgICAgICAg
ICAweDIwMDAwMDAwIDB4MTAwMDAwMDAgPjsKKyAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47
CisgICAgICAgICNzaXplLWNlbGxzID0gPDA+OworICAgICAgICBjb21wYXRpYmxlID0gImFzcGVl
ZCxhc3QyNjAwLWZtYyI7CisgICAgICAgIGNsb2NrcyA9IDwmc3lzY29uIEFTUEVFRF9DTEtfQUhC
PjsKKyAgICAgICAgc3RhdHVzID0gImRpc2FibGVkIjsKKyAgICAgICAgaW50ZXJydXB0cyA9IDxH
SUNfU1BJIDM5IElSUV9UWVBFX0xFVkVMX0hJR0g+OworICAgICAgICBmbGFzaEAwIHsKKyAgICAg
ICAgICAgICAgICByZWcgPSA8IDAgPjsKKyAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImpl
ZGVjLHNwaS1ub3IiOworICAgICAgICAgICAgICAgIHNwaS1tYXgtZnJlcXVlbmN5ID0gPDUwMDAw
MDAwPjsKKyAgICAgICAgICAgICAgICBzdGF0dXMgPSAiZGlzYWJsZWQiOworICAgICAgICB9Owor
ICAgICAgICBmbGFzaEAxIHsKKyAgICAgICAgICAgICAgICByZWcgPSA8IDEgPjsKKyAgICAgICAg
ICAgICAgICBjb21wYXRpYmxlID0gImplZGVjLHNwaS1ub3IiOworICAgICAgICAgICAgICAgIHNw
aS1tYXgtZnJlcXVlbmN5ID0gPDUwMDAwMDAwPjsKKyAgICAgICAgICAgICAgICBzdGF0dXMgPSAi
ZGlzYWJsZWQiOworICAgICAgICB9OworICAgICAgICBmbGFzaEAyIHsKKyAgICAgICAgICAgICAg
ICByZWcgPSA8IDIgPjsKKyAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImplZGVjLHNwaS1u
b3IiOworICAgICAgICAgICAgICAgIHNwaS1tYXgtZnJlcXVlbmN5ID0gPDUwMDAwMDAwPjsKKyAg
ICAgICAgICAgICAgICBzdGF0dXMgPSAiZGlzYWJsZWQiOworICAgICAgICB9OworICAgIH07Ci0t
IAoyLjM0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
