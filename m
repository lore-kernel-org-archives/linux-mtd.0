Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F56C433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Mar 2022 17:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z4Bu4FDw1XITFZSsmEx8RjxgnYEA8S7xOOx4TlrQs4Q=; b=dGZCw+8kJyFAHf
	rFqAB+vEiZuBFikwk6p2Eo8hAmD5hLouHTPitkxjMoUpjVZYET8UoGtjfdDYzMR+QF/VTLqcc9IV1
	qrpbJ+Nh3u+R1mKrsrS+m9H24wn66jGa++5Wrfr/F0GgBcRpzwEP9ta8xt1l8WkY6IMxU2uzR7xMR
	+bo4nYvANFWb3SrcD5k0HTHHNykobQqVV7d+rENoczKUJDomwTaaP8T6N8m4okwjULp5XGRvQpXL7
	phvympu27iKnsclUWG9uYYKUUNHMylcbqwTGLQ2c79FGpX/qS3bJWeSjanfV/OYua+WECbAQX5RwT
	wwSmg3IM1S/d6Sfmjtug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPSyu-003cZU-13; Wed, 02 Mar 2022 17:41:44 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPSpP-003Z8U-KD; Wed, 02 Mar 2022 17:31:57 +0000
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 222HIm2I031426; 
 Wed, 2 Mar 2022 17:31:26 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ejcvcg7ky-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 17:31:25 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222HD01x032463;
 Wed, 2 Mar 2022 17:31:24 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 3efbfjqhah-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 17:31:24 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222HVLfc56426816
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 17:31:21 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A9ED952063;
 Wed,  2 Mar 2022 17:31:21 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 122FF52050;
 Wed,  2 Mar 2022 17:31:21 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id A9DE6220294;
 Wed,  2 Mar 2022 18:31:19 +0100 (CET)
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
Subject: [PATCH v2 03/10] dt-bindings: spi: Add Aspeed SMC controllers device
 tree binding
Date: Wed,  2 Mar 2022 18:31:07 +0100
Message-Id: <20220302173114.927476-4-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302173114.927476-1-clg@kaod.org>
References: <20220302173114.927476-1-clg@kaod.org>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 1bRNhRvvDZod2HQDRtBuuu36pGdkRi9V
X-Proofpoint-ORIG-GUID: 1bRNhRvvDZod2HQDRtBuuu36pGdkRi9V
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_12,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0
 mlxlogscore=901 impostorscore=0 clxscore=1034 suspectscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 mlxscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203020076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_093155_872172_F5CD1AD8 
X-CRM114-Status: GOOD (  19.01  )
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
ICAgfCA5MCArKysrKysrKysrKysrKysrKysrCiBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgOSArKwogMiBmaWxlcyBjaGFuZ2VkLCA5OSBpbnNlcnRpb25z
KCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3NwaS9hc3BlZWQsYXN0MjYwMC1mbWMueWFtbAoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvYXNwZWVkLGFzdDI2MDAtZm1jLnlhbWwgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL2FzcGVlZCxhc3QyNjAwLWZtYy55YW1sCm5l
dyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uMDI4OWE0ZjUyMTk2Ci0tLSAv
ZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwaS9hc3Bl
ZWQsYXN0MjYwMC1mbWMueWFtbApAQCAtMCwwICsxLDkwIEBACisjIFNQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiAoR1BMLTIuMCBPUiBCU0QtMi1DbGF1c2UpCislWUFNTCAxLjIKKy0tLQorJGlkOiBo
dHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9zcGkvYXNwZWVkLGFzdDI2MDAtZm1jLnlhbWwj
Ciskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMK
KwordGl0bGU6IEFzcGVlZCBTTUMgY29udHJvbGxlcnMgYmluZGluZ3MKKworbWFpbnRhaW5lcnM6
CisgIC0gQ2hpbi1UaW5nIEt1byA8Y2hpbi10aW5nX2t1b0Bhc3BlZWR0ZWNoLmNvbT4KKyAgLSBD
w6lkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qub3JnPgorCitkZXNjcmlwdGlvbjogfAorICBUaGlz
IGJpbmRpbmcgZGVzY3JpYmVzIHRoZSBBc3BlZWQgU3RhdGljIE1lbW9yeSBDb250cm9sbGVycyAo
Rk1DIGFuZAorICBTUEkpIG9mIHRoZSBBU1QyNDAwLCBBU1QyNTAwIGFuZCBBU1QyNjAwIFNPQ3Mu
CisKK2FsbE9mOgorICAtICRyZWY6ICJzcGktY29udHJvbGxlci55YW1sIyIKKworcHJvcGVydGll
czoKKyAgY29tcGF0aWJsZToKKyAgICBlbnVtOgorICAgICAgLSBhc3BlZWQsYXN0MjYwMC1mbWMK
KyAgICAgIC0gYXNwZWVkLGFzdDI2MDAtc3BpCisgICAgICAtIGFzcGVlZCxhc3QyNTAwLWZtYwor
ICAgICAgLSBhc3BlZWQsYXN0MjUwMC1zcGkKKyAgICAgIC0gYXNwZWVkLGFzdDI0MDAtZm1jCisg
ICAgICAtIGFzcGVlZCxhc3QyNDAwLXNwaQorCisgIHJlZzoKKyAgICBpdGVtczoKKyAgICAgIC0g
ZGVzY3JpcHRpb246IHJlZ2lzdGVycworICAgICAgLSBkZXNjcmlwdGlvbjogbWVtb3J5IG1hcHBp
bmcKKworICBjbG9ja3M6CisgICAgbWF4SXRlbXM6IDEKKworICBpbnRlcnJ1cHRzOgorICAgIG1h
eEl0ZW1zOiAxCisKK3BhdHRlcm5Qcm9wZXJ0aWVzOgorICAiQFswLTlhLWZdKyI6CisgICAgdHlw
ZTogb2JqZWN0CisKKyAgICBwcm9wZXJ0aWVzOgorICAgICAgc3BpLXJ4LWJ1cy13aWR0aDoKKyAg
ICAgICAgZW51bTogWzEsIDIsIDRdCisKKyAgICByZXF1aXJlZDoKKyAgICAgIC0gcmVnCisKK3Jl
cXVpcmVkOgorICAtIGNvbXBhdGlibGUKKyAgLSByZWcKKyAgLSBjbG9ja3MKKwordW5ldmFsdWF0
ZWRQcm9wZXJ0aWVzOiBmYWxzZQorCitleGFtcGxlczoKKyAgLSB8CisgICAgI2luY2x1ZGUgPGR0
LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2FybS1naWMuaD4KKyAgICAjaW5jbHVkZSA8
ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvYXNwZWVkLXNjdS1pYy5oPgorICAgICNp
bmNsdWRlIDxkdC1iaW5kaW5ncy9jbG9jay9hc3QyNjAwLWNsb2NrLmg+CisKKyAgICBzcGlAMWU2
MjAwMDAgeworICAgICAgICByZWcgPSA8MHgxZTYyMDAwMCAweGM0PiwgPDB4MjAwMDAwMDAgMHgx
MDAwMDAwMD47CisgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+OworICAgICAgICAjc2l6ZS1j
ZWxscyA9IDwwPjsKKyAgICAgICAgY29tcGF0aWJsZSA9ICJhc3BlZWQsYXN0MjYwMC1mbWMiOwor
ICAgICAgICBjbG9ja3MgPSA8JnN5c2NvbiBBU1BFRURfQ0xLX0FIQj47CisgICAgICAgIGludGVy
cnVwdHMgPSA8R0lDX1NQSSAzOSBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKKyAgICAgICAgZmxhc2hA
MCB7CisgICAgICAgICAgICAgICAgcmVnID0gPCAwID47CisgICAgICAgICAgICAgICAgY29tcGF0
aWJsZSA9ICJqZWRlYyxzcGktbm9yIjsKKyAgICAgICAgICAgICAgICBzcGktbWF4LWZyZXF1ZW5j
eSA9IDw1MDAwMDAwMD47CisgICAgICAgICAgICAgICAgc3BpLXJ4LWJ1cy13aWR0aCA9IDwyPjsK
KyAgICAgICAgfTsKKyAgICAgICAgZmxhc2hAMSB7CisgICAgICAgICAgICAgICAgcmVnID0gPCAx
ID47CisgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJqZWRlYyxzcGktbm9yIjsKKyAgICAg
ICAgICAgICAgICBzcGktbWF4LWZyZXF1ZW5jeSA9IDw1MDAwMDAwMD47CisgICAgICAgICAgICAg
ICAgc3BpLXJ4LWJ1cy13aWR0aCA9IDwyPjsKKyAgICAgICAgfTsKKyAgICAgICAgZmxhc2hAMiB7
CisgICAgICAgICAgICAgICAgcmVnID0gPCAyID47CisgICAgICAgICAgICAgICAgY29tcGF0aWJs
ZSA9ICJqZWRlYyxzcGktbm9yIjsKKyAgICAgICAgICAgICAgICBzcGktbWF4LWZyZXF1ZW5jeSA9
IDw1MDAwMDAwMD47CisgICAgICAgICAgICAgICAgc3BpLXJ4LWJ1cy13aWR0aCA9IDwyPjsKKyAg
ICAgICAgfTsKKyAgICB9OwpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwpp
bmRleCA0MTc1MTAzZTkyOGQuLmY1YWI3NzU0OGVmNiAxMDA2NDQKLS0tIGEvTUFJTlRBSU5FUlMK
KysrIGIvTUFJTlRBSU5FUlMKQEAgLTI5MjUsNiArMjkyNSwxNSBAQCBTOglNYWludGFpbmVkCiBG
OglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbW1jL2FzcGVlZCxzZGhjaS55YW1s
CiBGOglkcml2ZXJzL21tYy9ob3N0L3NkaGNpLW9mLWFzcGVlZCoKIAorQVNQRUVEIFNNQyBTUEkg
RFJJVkVSCitNOglDaGluLVRpbmcgS3VvIDxjaGluLXRpbmdfa3VvQGFzcGVlZHRlY2guY29tPgor
TToJQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4KK0w6CWxpbnV4LWFzcGVlZEBsaXN0
cy5vemxhYnMub3JnIChtb2RlcmF0ZWQgZm9yIG5vbi1zdWJzY3JpYmVycykKK0w6CW9wZW5ibWNA
bGlzdHMub3psYWJzLm9yZyAobW9kZXJhdGVkIGZvciBub24tc3Vic2NyaWJlcnMpCitMOglsaW51
eC1zcGlAdmdlci5rZXJuZWwub3JnCitTOglNYWludGFpbmVkCitGOglEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3Mvc3BpL2FzcGVlZCxhc3QyNjAwLWZtYy55YW1sCisKIEFTUEVFRCBW
SURFTyBFTkdJTkUgRFJJVkVSCiBNOglFZGRpZSBKYW1lcyA8ZWFqYW1lc0BsaW51eC5pYm0uY29t
PgogTDoJbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCi0tIAoyLjM0LjEKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
