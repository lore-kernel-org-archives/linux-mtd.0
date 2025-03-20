Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60918C28B30
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Mar 2025 06:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GvTp0Th5tf2hAO6cxCOeeoM5Z++kHlRpUzRCmmW+vtE=; b=bBbsbmiQ2GuQSYQNtbY3jQJjN+
	l3Pxh33Zw+ngm6LKj2a9rJ9mT3TwxzwYkAYGMrNqurJ8jc/04iO0rSz+sLGiB8u2fs3swAZFZcJnE
	0ry82ncVElG4PJRwSsphTboFnPd16bJh3ocDGvZ7USZhuyEnG0/8qUZ8cJULtpR3P1SBfpMSmgxmH
	NHrMSVDC9NlVvPnXOagng3bxTt1RBhB2OTQj7wyOhSQfEFoVhPh1+s6HamIARC/k99xI6h8ek0gE5
	H975RQb37Bh7vbiHk/X5K/1WuFUO0EPnGvVPtJXmwRe4r8XLQAmrStCImctvw96KPbmdu7QHbyg+2
	LqybLyMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv8z8-0000000BH7y-1bS9;
	Thu, 20 Mar 2025 06:02:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv8vz-0000000BGnp-0ejb
	for linux-mtd@lists.infradead.org;
	Thu, 20 Mar 2025 05:59:16 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52K4rwmg021621;
	Thu, 20 Mar 2025 05:59:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nfn6s62Sd9gS4WebcWOa6jAcwo0r94FJpZpiVn1PjJc=; b=cfd/H9w/peEOcRei
	04ovvzupazBivy7743WQTyqW1C3ocy3uXtiigvx4k033vTUJwnx0PoBhhh1/9l59
	GJ6Lp3/d7zueNURUrFXLDFT2U3YLZbWJ93XjFcFXDld56YJr7AVWM4mCg7XGXq2+
	AljET6wPiFrCs/0o3QX4KK8cGQkUBRG11JHxUZu7yXg6b/lQOX+qsLZ/81FnW7qA
	mtTCMXuJ7OgYD4P6+d1ZLKnebjieEoGXBvQhK837TmHcBrFCuDF/rqDZk5Ldi3Wr
	ktoKnYoyA9Ysnn5OnaKWE011sMT0aHIEdSE70K64uxbS4ivkCxYAPfDHcdUHpylP
	mCMXJw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45gcd18460-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 05:59:09 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52K5x8U2001272
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 05:59:08 GMT
Received: from [10.152.201.53] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 19 Mar
 2025 22:59:04 -0700
Message-ID: <abe02188-9cb8-aa4b-9723-372000e08110@quicinc.com>
Date: Thu, 20 Mar 2025 11:29:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 1/4] mtd: rawnand: qcom: Pass 18 bit offset from QPIC
 base address to BAM
Content-Language: en-US
To: Gabor Juhos <j4g8y7@gmail.com>, <manivannan.sadhasivam@linaro.org>,
        <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <broonie@kernel.org>, <bbrezillon@kernel.org>,
        <linux-mtd@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>
References: <20250310120906.1577292-1-quic_mdalam@quicinc.com>
 <20250310120906.1577292-2-quic_mdalam@quicinc.com>
 <32785a6a-3f30-4d77-b32d-ee70c459de1b@gmail.com>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <32785a6a-3f30-4d77-b32d-ee70c459de1b@gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=bfFrUPPB c=1 sm=1 tr=0 ts=67dbaead cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=fSq50Qp5J-9m2WgZyFwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: YqL-auvLiDSNqCt_67f9tQJVRmp9iRzP
X-Proofpoint-ORIG-GUID: YqL-auvLiDSNqCt_67f9tQJVRmp9iRzP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_01,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 clxscore=1011 suspectscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 adultscore=0 phishscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503200036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_225915_325994_663AD254 
X-CRM114-Status: GOOD (  24.85  )
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

CgpPbiAzLzE4LzIwMjUgODoyMiBQTSwgR2Fib3IgSnVob3Mgd3JvdGU6Cj4gMjAyNS4gMDMuIDEw
LiAxMzowOSBrZWx0ZXrDqXNzZWwsIE1kIFNhZHJlIEFsYW0gw61ydGE6Cj4+IEN1cnJlbnRseSB3
ZSBhcmUgY29uZmlndXJpbmcgbG93ZXIgMjQgYml0cyBvZiBhZGRyZXNzIGluIGRlc2NyaXB0b3IK
Pj4gd2hlcmVhcyBRUElDIGRlc2lnbiBleHBlY3RzIDE4IGJpdCByZWdpc3RlciBvZmZzZXQgZnJv
bSBRUElDIGJhc2UKPj4gYWRkcmVzcyB0byBiZSBjb25maWd1cmVkIGluIGNtZCBkZXNjcmlwdG9y
cy4gVGhpcyBpcyBsZWFkaW5nIHRvIGEKPj4gZGlmZmVyZW50IGFkZHJlc3MgYWN0dWFsbHkgYmVp
bmcgdXNlZCBpbiBIVywgbGVhZGluZyB0byB3cm9uZyB2YWx1ZQo+PiByZWFkLgo+Pgo+PiB0aGUg
YWN0dWFsIGlzc3VlIGlzIHRoYXQgdGhlIE5BTkRjIGJhc2UgYWRkcmVzcyBpcyBkaWZmZXJlbnQg
ZnJvbSB0aGUKPj4gUVBJQyBiYXNlIGFkZHJlc3MuIEJ1dCB0aGUgZHJpdmVyIGRvZXNuJ3QgdGFr
ZSBpdCBpbnRvIGFjY291bnQgYW5kIGp1c3QKPj4gdXNlZCB0aGUgUVBJQyBiYXNlIGFzIHRoZSBO
QU5EYyBiYXNlLiBUaGlzIHVzZWQgdG8gd29yayBhcyB0aGUgTkFORGMgSVAKPj4gb25seSBjb25z
aWRlcnMgdGhlIGxvd2VyIDE4IGJpdHMgb2YgdGhlIGFkZHJlc3MgcGFzc2VkIGJ5IHRoZSBkcml2
ZXIgdG8KPj4gZGVyaXZlIHRoZSByZWdpc3RlciBvZmZzZXQuIFNpbmNlIHRoZSBiYXNlIGFkZHJl
c3Mgb2YgUVBJQyB1c2VkIHRvIGNvbnRhaW4KPj4gYWxsIDAgZm9yIGxvd2VyIDE4IGJpdHMgKGxp
a2UgMHgwNzk4MDAwMCksIHRoZSBkcml2ZXIgZW5kZWQgdXAgcGFzc2luZyB0aGUKPj4gYWN0dWFs
IHJlZ2lzdGVyIG9mZnNldCBpbiBpdCBhbmQgTkFORGMgd29ya2VkIHByb3Blcmx5LiBCdXQgb24g
bmV3ZXIgU29Dcwo+PiBsaWtlIFNEWDc1LCB0aGUgUVBJQyBiYXNlIGFkZHJlc3MgZG9lc24ndCBj
b250YWluIGFsbCAwIGZvciBsb3dlciAxOCBiaXRzCj4+IChsaWtlIDB4MDFDOTgwMDApLiBTbyBO
QU5EYyBzZWVzIHdyb25nIG9mZnNldCBhcyBwZXIgdGhlIGN1cnJlbnQgbG9naWMKPj4KPj4gVGhl
IGFkZHJlc3Mgc2hvdWxkIGJlIHBhc3NlZCB0byBCQU0gMHgzMDAwMCArIG9mZnNldC4gSW4gb2xk
ZXIgdGFyZ2V0cwo+PiB0aGUgbG93ZXIgMTgtYml0cyBhcmUgemVybyBzbyB0aGF0IGNvcnJlY3Qg
YWRkcmVzcyBiZWluZyBwYWFzZWQuIEJ1dAo+PiBpbiBuZXdlciB0YXJnZXRzIHRoZSBsb3dlciAx
OC1iaXRzIGFyZSBub24temVybyBpbiBRUElDIGJhc2Ugc28gdGhhdAo+PiAweDMwMDAwMCArIG9m
ZnNldCBnaXZpbmcgdGhlIHdyb25nIHZhbHVlLgo+Pgo+PiBTRFg3NSA6IFFQSUNfUVBJQyB8IDB4
MDFDOTgwMDAgKExvd2VyIDE4IGJpdHMgYXJlIG5vbiB6ZXJvKQo+PiBTRFg1NSA6IFFQSUNfUVBJ
QyB8IDB4MUIwMDAwMCAoTG93ZXIgMTggYml0cyBhcmUgemVybykgU2FtZSBmb3IKPj4gb2xkZXIg
dGFyZ2V0cy4KPj4KPj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPj4gRml4ZXM6IDhkNmI2
ZDdlMTM1ZSAoIm10ZDogbmFuZDogcWNvbTogc3VwcG9ydCBmb3IgY29tbWFuZCBkZXNjcmlwdG9y
IGZvcm1hdGlvbiIpCj4+IFRlc3RlZC1ieTogTGFrc2htaSBTb3dqYW55YSBEIDxxdWljX2xha3Nk
QHF1aWNpbmMuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBNZCBTYWRyZSBBbGFtIDxxdWljX21kYWxh
bUBxdWljaW5jLmNvbT4KPj4gLS0tCj4gCj4gPC4uLj4KPiAKPj4gICAvKgo+PiBkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9saW51eC9tdGQvbmFuZC1xcGljLWNvbW1vbi5oIGIvaW5jbHVkZS9saW51eC9t
dGQvbmFuZC1xcGljLWNvbW1vbi5oCj4+IGluZGV4IGNkNzE3MmU2YzFiYi4uNjI2OGYwOGI5ZDE5
IDEwMDY0NAo+PiAtLS0gYS9pbmNsdWRlL2xpbnV4L210ZC9uYW5kLXFwaWMtY29tbW9uLmgKPj4g
KysrIGIvaW5jbHVkZS9saW51eC9tdGQvbmFuZC1xcGljLWNvbW1vbi5oCj4+IEBAIC0yMDAsNyAr
MjAwLDcgQEAKPj4gICAjZGVmaW5lIGRldl9jbWRfcmVnX2FkZHIobmFuZGMsIHJlZykgKChuYW5k
YyktPnByb3BzLT5kZXZfY21kX3JlZ19zdGFydCArIChyZWcpKQo+PiAgIAo+PiAgIC8qIFJldHVy
bnMgdGhlIE5BTkQgcmVnaXN0ZXIgcGh5c2ljYWwgYWRkcmVzcyAqLwo+PiAtI2RlZmluZSBuYW5k
Y19yZWdfcGh5cyhjaGlwLCBvZmZzZXQpICgoY2hpcCktPmJhc2VfcGh5cyArIChvZmZzZXQpKQo+
PiArI2RlZmluZSBuYW5kY19yZWdfcGh5cyhjaGlwLCBvZmZzZXQpICAoKG5hbmRjKS0+cHJvcHMt
Pm5hbmRjX29mZnNldCArIChvZmZzZXQpKQo+IAo+IFRoZSBtYWNybyBoYXMgbm8gcGFyYW1ldGVy
IG5hbWVkICduYW5kYycsIHNvIHRoaXMgd29ya3Mgb25seSB3aGVuIHRoZXJlIGlzIGFuCj4gaWRl
bnRpZmllciB3aXRoIHRoYXQgbmFtZSBpbiB0aGUgY29kZSB3aGVyZSB0aGUgbWFjcm8gaXMgdXNl
ZC4KPiAKPiBBZGRpdGlvbmFsbHksIHRoZSBtYWNybyB3aWxsIG5vIGxvbmdlciByZXR1cm4gdGhl
IHBoeXNpY2FsIGFkZHJlc3Mgb2YgYSByZWdpc3Rlcgo+IGFmdGVyIHRoZSBjaGFuZ2UsIHNvIGJv
dGggdGhlIGNvbW1lbnQgYmVmb3JlIHRoZSBtYWNybyBhbmQgdGhlIG5hbWUgb2YgdGhlIG1hY3Jv
Cj4gd2lsbCBiZSBtaXNsZWFkaW5nLgo+IAo+IFNpbmNlIHRoZSBtYWNybyBpcyB1c2VkIG9ubHkg
aW4gdGhlIHFjb21fcHJlcF9iYW1fZG1hX2Rlc2NfY21kKCkgZnVuY3Rpb24gdG8KPiBjb21wdXRl
IHRoZSAnYWRkcicgcGFyYW1ldGVyIGZvciB0aGUgYmFtX3ByZXBfY2V7X2xlMzJ9KCkgZnVuY3Rp
b25zLCBtYXliZSBpdAo+IHdvdWxkIGJlIGJldHRlciB0byBnZXQgcmlkIG9mIGl0IGNvbXBsZXRl
bHksIGFuZCBkbyB0aGUgY29tcHV0YXRpb24gZGlyZWN0bHkgaW4KPiB0aGUgZnVuY3Rpb24gaW5z
dGVhZC4KT2ssIFdpbGwgaGFuZGxlIGluIG5leHQgcmV2aXNpb24uCj4gCj4gUmVnYXJkcywKPiBH
YWJvcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
