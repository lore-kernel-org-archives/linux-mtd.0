Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD1A6C77B73
	for <linux-mtd@archiver.kernel.org>; Wed, 24 May 2023 09:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xoHrxTvj4Wb8l6rJ/6K45exKCPsunbffqr4M8wwCemA=; b=vFd2FwYe0ZHsPp
	4YCsRjqqgCE5rycxul2gxf6jf6qN2LqwMzQIJQw40kos2LKYtSVCQoQjKfVwddarypFFBU6oMgjqi
	BClEv4x9C2UVE+YRb8+GMgRoFRCMEMW5SuVdRrZu1Lm4OnhCoiw9Q6vfWj/XYVa6X4RSi0Fz+rec/
	Hsjs7OIUM8RQ7YtbP9qi03DiAVgRYJ8dFA1HMLUhFEmgo1MRHdrYZbmPntKEf0rJhuVdFMzBg1yth
	oIHQe2sawxvzO2vuHwlQi2feLSLqHMfskCVLezIoAqS9GJaRoAPLeuA3gXUJXEUF/Gzor4/O7XWqa
	CSdcrIwBFSSwWUzZKa6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1knu-00Cxty-0i;
	Wed, 24 May 2023 09:29:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1knr-00Cxt7-18
	for linux-mtd@lists.infradead.org;
	Wed, 24 May 2023 09:29:08 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34O5Jpuf031611;
	Wed, 24 May 2023 09:29:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=8wt6AN6pl6ghSok1hDDHJ3uMHeMEuXrVVpwKZb4ImaA=;
 b=UU9aHMhhqUWGQCCBxaNAJWeh5sY9aguwPdJseMPAVArbkX2nPuXqKqEig9Rb4p4PZ6Gb
 nz+iEjOglOnawlCEEa0fj11NC0c/4avjz/OXJqB8lWBcyO2HrdnR0Zqn5O4Ka9NOYXgt
 3Ox0EuTwQTj8LVXcLlNPJvQzVGUmZIGmyo1V0gRwVs3tGCtQajtSOzcfiekGOxEPOv+M
 ArnKXDkb7iZihguL12hVooZM0WXLqPu58SQYPdYWqBJnYI1RzSae973N5QmdlDq9VDsd
 QLuMAcnCHHkEHqB6kHaDP+1C00pA2oj2BEeic/3DyDUtgLhokH/zFOp8WrzoqEqV56u9 uw== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qscaurj71-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 May 2023 09:29:02 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34O9T1NI017392
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 May 2023 09:29:01 GMT
Received: from [10.201.3.104] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 24 May
 2023 02:28:58 -0700
Message-ID: <69bde397-9d6a-d6b2-846c-310fbbbaba98@quicinc.com>
Date: Wed, 24 May 2023 14:58:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 3/5] mtd: rawnand: qcom: Add support for param_page
 read exec_ops
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <mani@kernel.org>, <richard@nod.at>, <vigneshr@ti.com>,
        <linux-mtd@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_srichara@quicinc.com>
References: <20230511133017.6307-1-quic_mdalam@quicinc.com>
 <20230511133017.6307-4-quic_mdalam@quicinc.com>
 <20230522154916.3bb7be4e@xps-13>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <20230522154916.3bb7be4e@xps-13>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: iltTnx8JJHJ3PpptWLFUC1OqnB6XTwH_
X-Proofpoint-GUID: iltTnx8JJHJ3PpptWLFUC1OqnB6XTwH_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-24_05,2023-05-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305240079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_022907_516893_3679A0D4 
X-CRM114-Status: GOOD (  23.34  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiA1LzIyLzIwMjMgNzoxOSBQTSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIaSBNZCwKPiAK
PiBxdWljX21kYWxhbUBxdWljaW5jLmNvbSB3cm90ZSBvbiBUaHUsIDExIE1heSAyMDIzIDE5OjAw
OjE1ICswNTMwOgo+IAo+PiBUaGlzIGNoYW5nZSB3aWxsIGFkZCBleGVjX29wcyBmb3IgUEFSQU1f
UEFHRV9SRUFEIGNvbW1hbmQuCj4+Cj4+IENvLWRldmVsb3BlZC1ieTogU3JpY2hhcmFuIFJhbWFi
YWRocmFuIDxxdWljX3NyaWNoYXJhQHF1aWNpbmMuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBTcmlj
aGFyYW4gUmFtYWJhZGhyYW4gPHF1aWNfc3JpY2hhcmFAcXVpY2luYy5jb20+Cj4+IFNpZ25lZC1v
ZmYtYnk6IE1kIFNhZHJlIEFsYW0gPHF1aWNfbWRhbGFtQHF1aWNpbmMuY29tPgo+PiAtLS0KPj4g
Q2hhbmdlIGluIFt2Ml0KPj4KPj4gKiBNaXNzZWQgdG8gcG9zdCBDb3Zlci1sZXR0ZXIsIHNvIHBv
c3RpbmcgdjIgcGF0Y2ggd2l0aCBjb3Zlci1sZXR0ZXIKPj4KPj4gICBkcml2ZXJzL210ZC9uYW5k
L3Jhdy9xY29tX25hbmRjLmMgfCA5MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKystCj4+
ICAgMSBmaWxlIGNoYW5nZWQsIDkwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4KPj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYyBiL2RyaXZlcnMv
bXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYwo+PiBpbmRleCBkMmYyYTg5NzE5MDcuLjg3MTdkNTA4
NmY4MCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jCj4+
ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYwo+PiBAQCAtMzA4Niw3ICsz
MDg2LDk2IEBAIHN0YXRpYyBpbnQgcWNvbV9lcmFzZV9jbWRfdHlwZV9leGVjKHN0cnVjdCBuYW5k
X2NoaXAgKmNoaXAsIGNvbnN0IHN0cnVjdCBuYW5kX3N1Cj4+ICAgCj4+ICAgc3RhdGljIGludCBx
Y29tX3BhcmFtX3BhZ2VfdHlwZV9leGVjKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsICBjb25zdCBz
dHJ1Y3QgbmFuZF9zdWJvcCAqc3Vib3ApCj4+ICAgewo+PiAtCXJldHVybiAwOwo+PiArCXN0cnVj
dCBxY29tX25hbmRfaG9zdCAqaG9zdCA9IHRvX3Fjb21fbmFuZF9ob3N0KGNoaXApOwo+PiArCXN0
cnVjdCBxY29tX25hbmRfY29udHJvbGxlciAqbmFuZGMgPSBnZXRfcWNvbV9uYW5kX2NvbnRyb2xs
ZXIoY2hpcCk7Cj4+ICsJc3RydWN0IHFjb21fb3AgcV9vcDsKPj4gKwljb25zdCBzdHJ1Y3QgbmFu
ZF9vcF9pbnN0ciAqaW5zdHIgPSBOVUxMOwo+PiArCXVuc2lnbmVkIGludCBvcF9pZCA9IDA7Cj4+
ICsJdW5zaWduZWQgaW50IGxlbiA9IDA7Cj4+ICsJaW50IHJldCA9IDA7Cj4+ICsKPj4gKwlxY29t
X3BhcnNlX2luc3RydWN0aW9ucyhjaGlwLCBzdWJvcCwgJnFfb3ApOwo+PiArCj4+ICsJcV9vcC5j
bWRfcmVnIHw9IFBBR0VfQUNDIHwgTEFTVF9QQUdFOwo+PiArCj4+ICsJcHJlX2NvbW1hbmQoaG9z
dCwgTkFORF9DTURfUEFSQU0pOwo+PiArCS8qCj4+ICsJICogTkFORF9DTURfUEFSQU0gaXMgY2Fs
bGVkIGJlZm9yZSB3ZSBrbm93IG11Y2ggYWJvdXQgdGhlIEZMQVNIIGNoaXAKPj4gKwkgKiBpbiB1
c2UuIHdlIGNvbmZpZ3VyZSB0aGUgY29udHJvbGxlciB0byBwZXJmb3JtIGEgcmF3IHJlYWQgb2Yg
NTEyCj4+ICsJICogYnl0ZXMgdG8gcmVhZCBvbmZpIHBhcmFtcwo+IAo+IFRoZXJlIGlzIG5vIGd1
ZXNzIHRvIGRvLCBqdXN0IGZvbGxvdyB3aGF0IHRoZSBjb3JlIGFza3MuCgogICBTdXJlLCB3aWxs
IGZpeCB0aGlzIGluIG5leHQgcGF0Y2ggVjMuCj4gCj4+ICsJICovCj4+ICsJaWYgKG5hbmRjLT5w
cm9wcy0+cXBpY192MikKPj4gKwkJbmFuZGNfc2V0X3JlZyhjaGlwLCBOQU5EX0ZMQVNIX0NNRCwg
cV9vcC5jbWRfcmVnKTsKPj4gKwllbHNlCj4+ICsJCW5hbmRjX3NldF9yZWcoY2hpcCwgTkFORF9G
TEFTSF9DTUQsIHFfb3AuY21kX3JlZyk7Cj4gCj4gVGhlcmUgaXMgc29tZXRoaW5nIHdyb25nIGhl
cmUuCj4gCiAgIFdpbGwgZml4IHRoaXMgaW4gbmV4dCBwYXRjaCBWMy4KCj4+ICsKPj4gKwluYW5k
Y19zZXRfcmVnKGNoaXAsIE5BTkRfQUREUjAsIDApOwo+PiArCW5hbmRjX3NldF9yZWcoY2hpcCwg
TkFORF9BRERSMSwgMCk7Cj4+ICsJbmFuZGNfc2V0X3JlZyhjaGlwLCBOQU5EX0RFVjBfQ0ZHMCwg
MCA8PCBDV19QRVJfUEFHRQo+PiArCQkJCQl8IDUxMiA8PCBVRF9TSVpFX0JZVEVTCj4+ICsJCQkJ
CXwgNSA8PCBOVU1fQUREUl9DWUNMRVMKPj4gKwkJCQkJfCAwIDw8IFNQQVJFX1NJWkVfQllURVMp
Owo+PiArCW5hbmRjX3NldF9yZWcoY2hpcCwgTkFORF9ERVYwX0NGRzEsIDcgPDwgTkFORF9SRUNP
VkVSWV9DWUNMRVMKPj4gKwkJCQkJfCAwIDw8IENTX0FDVElWRV9CU1kKPj4gKwkJCQkJfCAxNyA8
PCBCQURfQkxPQ0tfQllURV9OVU0KPj4gKwkJCQkJfCAxIDw8IEJBRF9CTE9DS19JTl9TUEFSRV9B
UkVBCj4+ICsJCQkJCXwgMiA8PCBXUl9SRF9CU1lfR0FQCj4+ICsJCQkJCXwgMCA8PCBXSURFX0ZM
QVNICj4+ICsJCQkJCXwgMSA8PCBERVYwX0NGRzFfRUNDX0RJU0FCTEUpOwo+PiArCWlmICghbmFu
ZGMtPnByb3BzLT5xcGljX3YyKQo+PiArCQluYW5kY19zZXRfcmVnKGNoaXAsIE5BTkRfRUJJMl9F
Q0NfQlVGX0NGRywgMSA8PCBFQ0NfQ0ZHX0VDQ19ESVNBQkxFKTsKPj4gKwo+PiArCS8qIGNvbmZp
Z3VyZSBDTUQxIGFuZCBWTEQgZm9yIE9ORkkgcGFyYW0gcHJvYmluZyBpbiBRUElDIHYxICovCj4+
ICsJaWYgKCFuYW5kYy0+cHJvcHMtPnFwaWNfdjIpIHsKPj4gKwkJbmFuZGNfc2V0X3JlZyhjaGlw
LCBOQU5EX0RFVl9DTURfVkxELAo+PiArCQkJICAgICAgKG5hbmRjLT52bGQgJiB+UkVBRF9TVEFS
VF9WTEQpKTsKPj4gKwkJbmFuZGNfc2V0X3JlZyhjaGlwLCBOQU5EX0RFVl9DTUQxLAo+PiArCQkJ
ICAgICAgKG5hbmRjLT5jbWQxICYgfigweEZGIDw8IFJFQURfQUREUikpCj4+ICsJCQkgICAgICB8
IE5BTkRfQ01EX1BBUkFNIDw8IFJFQURfQUREUik7Cj4+ICsJfQo+PiArCj4+ICsJbmFuZGNfc2V0
X3JlZyhjaGlwLCBOQU5EX0VYRUNfQ01ELCAxKTsKPj4gKwo+PiArCWlmICghbmFuZGMtPnByb3Bz
LT5xcGljX3YyKSB7Cj4+ICsJCW5hbmRjX3NldF9yZWcoY2hpcCwgTkFORF9ERVZfQ01EMV9SRVNU
T1JFLCBuYW5kYy0+Y21kMSk7Cj4+ICsJCW5hbmRjX3NldF9yZWcoY2hpcCwgTkFORF9ERVZfQ01E
X1ZMRF9SRVNUT1JFLCBuYW5kYy0+dmxkKTsKPj4gKwl9Cj4+ICsKPj4gKwluYW5kY19zZXRfcmVh
ZF9sb2MoY2hpcCwgMCwgMCwgMCwgNTEyLCAxKTsKPj4gKwo+PiArCWlmICghbmFuZGMtPnByb3Bz
LT5xcGljX3YyKSB7Cj4+ICsJCXdyaXRlX3JlZ19kbWEobmFuZGMsIE5BTkRfREVWX0NNRF9WTEQs
IDEsIDApOwo+PiArCQl3cml0ZV9yZWdfZG1hKG5hbmRjLCBOQU5EX0RFVl9DTUQxLCAxLCBOQU5E
X0JBTV9ORVhUX1NHTCk7Cj4+ICsJfQo+PiArCj4+ICsJbmFuZGMtPmJ1Zl9jb3VudCA9IDUxMjsK
PiAKPiBUaGUgbGVuZ3RoIGlzIHByb3ZpZGVkIGJ5IHRoZSBpbnN0cnVjdGlvbi4KCiAgICBXaWxs
IGZpeCB0aGlzIGluIG5leHQgcGF0Y2ggVjMuCj4gCj4+ICsJbWVtc2V0KG5hbmRjLT5kYXRhX2J1
ZmZlciwgMHhmZiwgbmFuZGMtPmJ1Zl9jb3VudCk7Cj4+ICsKPj4gKwljb25maWdfbmFuZF9zaW5n
bGVfY3dfcGFnZV9yZWFkKGNoaXAsIGZhbHNlLCAwKTsKPj4gKwo+PiArCXJlYWRfZGF0YV9kbWEo
bmFuZGMsIEZMQVNIX0JVRl9BQ0MsIG5hbmRjLT5kYXRhX2J1ZmZlciwKPj4gKwkJICAgICAgbmFu
ZGMtPmJ1Zl9jb3VudCwgMCk7Cj4+ICsKPj4gKwkvKiByZXN0b3JlIENNRDEgYW5kIFZMRCByZWdz
ICovCj4+ICsJaWYgKCFuYW5kYy0+cHJvcHMtPnFwaWNfdjIpIHsKPj4gKwkJd3JpdGVfcmVnX2Rt
YShuYW5kYywgTkFORF9ERVZfQ01EMV9SRVNUT1JFLCAxLCAwKTsKPj4gKwkJd3JpdGVfcmVnX2Rt
YShuYW5kYywgTkFORF9ERVZfQ01EX1ZMRF9SRVNUT1JFLCAxLCBOQU5EX0JBTV9ORVhUX1NHTCk7
Cj4+ICsJfQo+PiArCj4+ICsJcmV0ID0gc3VibWl0X2Rlc2NzKG5hbmRjKTsKPj4gKwlpZiAocmV0
KQo+PiArCQlkZXZfZXJyKG5hbmRjLT5kZXYsICJmYWlsdXJlIGluIHNidW1pdHRpbmcgcGFyYW0g
cGFnZSBkZXNjcmlwdG9yXG4iKTsKPj4gKwo+PiArCWZyZWVfZGVzY3MobmFuZGMpOwo+PiArCj4+
ICsJcmV0ID0gcWNvbV93YWl0X3JkeV9wb2xsKGNoaXAsIHFfb3AucmR5X3RpbWVvdXRfbXMpOwo+
PiArCj4+ICsJaW5zdHIgPSBxX29wLmRhdGFfaW5zdHI7Cj4+ICsJb3BfaWQgPSBxX29wLmRhdGFf
aW5zdHJfaWR4Owo+PiArCWxlbiA9IG5hbmRfc3Vib3BfZ2V0X2RhdGFfbGVuKHN1Ym9wLCBvcF9p
ZCk7Cj4+ICsJbWVtY3B5KGluc3RyLT5jdHguZGF0YS5idWYuaW4sIG5hbmRjLT5kYXRhX2J1ZmZl
ciwgbGVuKTsKPj4gKwo+PiArCXJldHVybiByZXQ7Cj4+ICAgfQo+PiAgIAo+PiAgIHN0YXRpYyBp
bnQgcWNvbV9yZWFkX2lkX3R5cGVfZXhlYyhzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCBjb25zdCBz
dHJ1Y3QgbmFuZF9zdWJvcCAqc3Vib3ApCj4gCj4gCj4gVGhhbmtzLAo+IE1pcXXDqGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
