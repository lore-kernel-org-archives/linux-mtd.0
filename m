Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91002E77188
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jan 2025 13:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rEJvxPMjxdoMNU2zJQEchvHcdoE5e7iLB5yXgCXpOmg=; b=QJek9freJwvrhK
	LYiJ+K+wQ2G3txSYywzMQAdiZf7ksGN21sJjFBn/bhAYtJwDSiUjTYMpT4R8sjrx7PSF1xH9NvJce
	cD+bMuiIBkYWTFGs9sWQzQ6momKmjYdTh+jj8ggLyWW+palHwDMNidw5UDK3ydTC+ZGP1BjS4VHOL
	kolBoCzBWzSFs3wBdhYJrCvezTyfUuW/oAQMqnxOhlS6TeIveWgFv4O9ueUzEO3uCkj+8sRMdBMd5
	iI3fQSS9xsdjg0BjN3Olz82u0S9Hhwq0yauIFVbl5cHcMEdc6wTfZdy9Rg0pxu0DUsL6jsYGBFzQn
	LCJAis5C4bhswym2AVCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUn14-00000001NBO-30We;
	Mon, 06 Jan 2025 13:19:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUmyC-00000001Meb-3HRC
	for linux-mtd@lists.infradead.org;
	Mon, 06 Jan 2025 13:16:38 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 506C8nMI017057;
	Mon, 6 Jan 2025 13:16:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Rf7oXGLumTIZDwdMDq2aR1
	PdoWsVej2SESBLdy8Fyl8=; b=kMllTYnpPdIaxq/HzCSrF7i1VKDnu313N/5Z8p
	1SX7Pe4wXD8/rwL2S7KYsn/pmK/3oc2F/JZW96OSL+7/Aply1dyHWuTpH3rjMNa2
	i9toLOKKkKg8LczPK8Qt77qbFxz9xl+ns/YZ4q6Oe+oTwf4AdZ7DO4Xor5N8oz3g
	SPdBbEFS/Yt2/6ex7nwe0X6FjpAVVSOlGFnWftNgTSZXJZUTvhqdezJk0I/3wAs8
	Mh0x9mB8Va7CqkFn57f4oHSm3c7Xi0dU9OG/Ec6kdoVmhgTfhTgx+E9iPktrBMh3
	xnR8RNt6+gMjgsnax1OwROMoTKHssOMPIGozJadMqlVv1pOg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44054ehewx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 13:16:22 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 506DGHFa010988
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 6 Jan 2025 13:16:17 GMT
Received: from hu-mdalam-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 6 Jan 2025 05:16:13 -0800
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <sfr@canb.auug.org.au>, <boris.brezillon@collabora.com>,
        <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>,
        <quic_mdalam@quicinc.com>
Subject: [PATCH] mtd: rawnand: qcom: Fix build issue on x86 architecture
Date: Mon, 6 Jan 2025 18:45:58 +0530
Message-ID: <20250106131558.2219136-1-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: IPVfhfgEpwmZ9mSyqS92s4RZaIe22U7t
X-Proofpoint-ORIG-GUID: IPVfhfgEpwmZ9mSyqS92s4RZaIe22U7t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 mlxlogscore=946 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501060118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_051637_004490_A588AC43 
X-CRM114-Status: GOOD (  14.68  )
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

Rml4IGEgYnVmZmVyIG92ZXJmbG93IGlzc3VlIGluIHFjb21fY2xlYXJfYmFtX3RyYW5zYWN0aW9u
IGJ5IHVzaW5nCnN0cnVjdF9ncm91cCB0byBncm91cCByZWxhdGVkIGZpZWxkcyBhbmQgYXZvaWQg
Rk9SVElGWV9TT1VSQ0Ugd2FybmluZ3MuCgpPbiB4ODYgYXJjaGl0ZWN0dXJlLCB0aGUgZm9sbG93
aW5nIGVycm9yIG9jY3VycyBkdWUgdG8gd2FybmluZ3MgYmVpbmcKdHJlYXRlZCBhcyBlcnJvcnM6
CgpJbiBmdW5jdGlvbiDigJhmb3J0aWZ5X21lbXNldF9jaGvigJksCiAgICBpbmxpbmVkIGZyb20g
4oCYcWNvbV9jbGVhcl9iYW1fdHJhbnNhY3Rpb27igJkgYXQKZHJpdmVycy9tdGQvbmFuZC9xcGlj
X2NvbW1vbi5jOjg4OjI6Ci4vaW5jbHVkZS9saW51eC9mb3J0aWZ5LXN0cmluZy5oOjQ4MDoyNTog
ZXJyb3I6IGNhbGwgdG8g4oCYX193cml0ZV9vdmVyZmxvd19maWVsZOKAmQpkZWNsYXJlZCB3aXRo
IGF0dHJpYnV0ZSB3YXJuaW5nOiBkZXRlY3RlZCB3cml0ZSBiZXlvbmQgc2l6ZSBvZiBmaWVsZAoo
MXN0IHBhcmFtZXRlcik7IG1heWJlIHVzZSBzdHJ1Y3RfZ3JvdXAoKT8gWy1XZXJyb3I9YXR0cmli
dXRlLXdhcm5pbmddCiAgNDgwIHwgICAgICAgICAgICAgICAgICAgICAgICAgX193cml0ZV9vdmVy
Zmxvd19maWVsZChwX3NpemVfZmllbGQsIHNpemUpOwogICAgICB8ICAgICAgICAgICAgICAgICAg
ICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgogIExEIFtN
XSAgZHJpdmVycy9tdGQvbmFuZC9uYW5kY29yZS5vCiAgQ0MgW01dICBkcml2ZXJzL3cxL21hc3Rl
cnMvbXhjX3cxLm8KY2MxOiBhbGwgd2FybmluZ3MgYmVpbmcgdHJlYXRlZCBhcyBlcnJvcnMKClRo
aXMgcGF0Y2ggYWRkcmVzc2VzIHRoZSBpc3N1ZSBieSBncm91cGluZyB0aGUgcmVsYXRlZCBmaWVs
ZHMgaW4Kc3RydWN0IGJhbV90cmFuc2FjdGlvbiB1c2luZyBzdHJ1Y3RfZ3JvdXAgYW5kIHVwZGF0
aW5nIHRoZSBtZW1zZXQgY2FsbAphY2NvcmRpbmdseS4KCkZpeGVzOiA4YzUyOTMyZGE1ZTYgKCJt
dGQ6IHJhd25hbmQ6IHFjb206IGNsZWFudXAgcWNvbV9uYW5kYyBkcml2ZXIiKQpTaWduZWQtb2Zm
LWJ5OiBNZCBTYWRyZSBBbGFtIDxxdWljX21kYWxhbUBxdWljaW5jLmNvbT4KLS0tCiBkcml2ZXJz
L210ZC9uYW5kL3FwaWNfY29tbW9uLmMgICAgICAgfCAgMiArLQogaW5jbHVkZS9saW51eC9tdGQv
bmFuZC1xcGljLWNvbW1vbi5oIHwgMTkgKysrKysrKysrKystLS0tLS0tLQogMiBmaWxlcyBjaGFu
Z2VkLCAxMiBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbXRkL25hbmQvcXBpY19jb21tb24uYyBiL2RyaXZlcnMvbXRkL25hbmQvcXBpY19jb21tb24u
YwppbmRleCA4YWJiYjk2MGE3Y2UuLmUwZWQyNWI1YWZlYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9t
dGQvbmFuZC9xcGljX2NvbW1vbi5jCisrKyBiL2RyaXZlcnMvbXRkL25hbmQvcXBpY19jb21tb24u
YwpAQCAtODUsNyArODUsNyBAQCB2b2lkIHFjb21fY2xlYXJfYmFtX3RyYW5zYWN0aW9uKHN0cnVj
dCBxY29tX25hbmRfY29udHJvbGxlciAqbmFuZGMpCiAJaWYgKCFuYW5kYy0+cHJvcHMtPnN1cHBv
cnRzX2JhbSkKIAkJcmV0dXJuOwogCi0JbWVtc2V0KCZiYW1fdHhuLT5iYW1fY2VfcG9zLCAwLCBz
aXplb2YodTMyKSAqIDgpOworCW1lbXNldCgmYmFtX3R4bi0+YmFtX3Bvc2l0aW9ucywgMCwgc2l6
ZW9mKGJhbV90eG4tPmJhbV9wb3NpdGlvbnMpKTsKIAliYW1fdHhuLT5sYXN0X2RhdGFfZGVzYyA9
IE5VTEw7CiAKIAlzZ19pbml0X3RhYmxlKGJhbV90eG4tPmNtZF9zZ2wsIG5hbmRjLT5tYXhfY3dw
ZXJwYWdlICoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbXRkL25hbmQtcXBpYy1jb21tb24u
aCBiL2luY2x1ZGUvbGludXgvbXRkL25hbmQtcXBpYy1jb21tb24uaAppbmRleCBlNzljNzk3NzVl
YjguLjRkOWI3MzZmZjhiNyAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9tdGQvbmFuZC1xcGlj
LWNvbW1vbi5oCisrKyBiL2luY2x1ZGUvbGludXgvbXRkL25hbmQtcXBpYy1jb21tb24uaApAQCAt
MjU0LDE0ICsyNTQsMTcgQEAgc3RydWN0IGJhbV90cmFuc2FjdGlvbiB7CiAJc3RydWN0IGRtYV9h
c3luY190eF9kZXNjcmlwdG9yICpsYXN0X2RhdGFfZGVzYzsKIAlzdHJ1Y3QgZG1hX2FzeW5jX3R4
X2Rlc2NyaXB0b3IgKmxhc3RfY21kX2Rlc2M7CiAJc3RydWN0IGNvbXBsZXRpb24gdHhuX2RvbmU7
Ci0JdTMyIGJhbV9jZV9wb3M7Ci0JdTMyIGJhbV9jZV9zdGFydDsKLQl1MzIgY21kX3NnbF9wb3M7
Ci0JdTMyIGNtZF9zZ2xfc3RhcnQ7Ci0JdTMyIHR4X3NnbF9wb3M7Ci0JdTMyIHR4X3NnbF9zdGFy
dDsKLQl1MzIgcnhfc2dsX3BvczsKLQl1MzIgcnhfc2dsX3N0YXJ0OworCXN0cnVjdF9ncm91cChi
YW1fcG9zaXRpb25zLAorCQl1MzIgYmFtX2NlX3BvczsKKwkJdTMyIGJhbV9jZV9zdGFydDsKKwkJ
dTMyIGNtZF9zZ2xfcG9zOworCQl1MzIgY21kX3NnbF9zdGFydDsKKwkJdTMyIHR4X3NnbF9wb3M7
CisJCXUzMiB0eF9zZ2xfc3RhcnQ7CisJCXUzMiByeF9zZ2xfcG9zOworCQl1MzIgcnhfc2dsX3N0
YXJ0OworCisJKTsKIH07CiAKIC8qCi0tIAoyLjM0LjEKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
