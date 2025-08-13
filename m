Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9538CC87FCF
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Aug 2025 12:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=blAi6Mo7WYwbuS526QewbS//svXpOfb/82nM7rtyGPQ=; b=usBbZzk+0amTsM
	O+Oh6ZLWzLwWY+CeQz7uQnK0Usni4FZu2XyVOUfGEr6FKyR8J5l4uyoitXQ1vzauVZ3JBr44HGbEe
	bmzu8lsT+NdSVCwwZNgUXhhtPZNeSnRs+03dbv1voabce5QS/0XS5hDeNdOUiiIB9YLvh/Z/CBO6d
	S8QlE7sM4hQpVmYCP0mGtxC1txNjneH+GFTQZfefw/2IR6Z9pIPApqFR7mCoiLE2Q+OxICuhr20M7
	NDOS9WrjYULeB0Ip5YYVcNqD2lAIN7mFWKf0jjKNl7BtfoNC2ibXFmoMKLWQ6CuxUphrIxFy+Fgmq
	YsazFBBz0SJ98nmw7bHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umAJH-0000000Dbfg-18rB;
	Wed, 13 Aug 2025 12:10:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um9iU-0000000DWj9-2CqV
	for linux-mtd@lists.infradead.org;
	Wed, 13 Aug 2025 11:32:27 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DBLjh1027100
	for <linux-mtd@lists.infradead.org>; Wed, 13 Aug 2025 11:32:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rjVZidOdjDRebLgVIpzz+zvbQWyC0jDD/g5NDXaHcRc=; b=ifG0z+Y7EQjfHETx
	wMQO6J6Ab6VYi4Yld5QZdL+gwbT9THXSLW0W/rDF8SBy2OYhz2lxxQkgTH3Q1HLv
	ebKs85DMDWV78OrOS0WDdWyfnLG0zSsYJLVv5+nvFGtD7sjJ4SyBqyxqJjQlKNVG
	t32VVDBc4FJbNpJGYU8DDH3RAGmFIB0XjWzYm4OYMgiflSMBXTaa4oRiA5NtOchC
	CYo+099+xrFmDeO2KWHfMxkQ7lAMB7TulNB20a/c+rbJnkp7pqk96ltEU8jc/+Hl
	aWpJcGZPFdsRQEdY4d5zXGkIvNYpPCRdWUAqDrFtfAli2LlV6mSjdQcgJLnLLyx9
	j/veKg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffhjqdqa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Wed, 13 Aug 2025 11:32:25 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b07b805068so14822111cf.3
        for <linux-mtd@lists.infradead.org>; Wed, 13 Aug 2025 04:32:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755084744; x=1755689544;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rjVZidOdjDRebLgVIpzz+zvbQWyC0jDD/g5NDXaHcRc=;
        b=S54Rrs0s6OC21ztPSvvrr80+/rmFV8WhBm9d2mkkt1NhWyJ4VdVwwQ/5DfrUeB9Par
         34dwJbzTIkV4xCpG0xNyux0q+UawA68IHM4uV/Vnl0+ZMshn9nm1Z5jWaXzMcMb7GRK6
         XTEegju71euAeGPwN3AtOnZ5z+BtqJmqIDWEXNlud3Om9Mxr95EfIX0CTqvNH0dOZL1F
         RZ62Q/kj9UP0VkZnwY4OLJfHxKkv0F12sFCpb/MHvjiFAcFcm36MBoSKxgS50zOq+M5m
         PUwPb2/1E5goPA8lvNRgWFD2xZWjFU3GJoSBaj6aFcF6zDcJHwWzZrp8Pylc1F/PitSu
         j+TA==
X-Forwarded-Encrypted: i=1; AJvYcCWrCavuTGG97s4gIyrCq4qVXSUgIJJWcDiNON0DFW7+wcNWwqOMKJbmkRSPldsYkId3y6XCQd3jM84=@lists.infradead.org
X-Gm-Message-State: AOJu0YyxRlelSMladwx+Yqm3B1JrOsUTIE5r1ea67cs8GFWVOsK7IOzl
	u+TjV9MntTtDzQGfIojj+G4KED8iGD6CHWR68C9CNCLd1yYclSx2w0cxlESiH8NnZ7kcJKgCIvU
	1XG4+Hb/RvnrW0ZZvbH5bf6GzZ+loZQmhQLCHSarXF7JX+Vf/avFZHsaHo5GamGcKJSwD
X-Gm-Gg: ASbGncsqB8WDdvy4b9fMGDXOCBwA2ZfhZn7PifrfeRAQnb2NDH6ZlplyBE4muT6JQHa
	5sTsKFsW4iJz869OkkcDxP93+K98Ba+Jqkpks4p4s7OnRGmZlEIwZciDrI6FR0uhaveIcT6+RUr
	NG3jMf7TyzFHp+A/kT1J92w0GoaRi+jRbvJydZzMMKZqmtJeN4DjcqSKz//Wo2D8rjAXCkmF90L
	bWkuckOU2BwW1LK/BQ5Ttgq47fk73s4v1Zp/V5Vaww/NA6BWnc6gHTe3KhaPuXrgllQZBWN1djP
	g21wZvsjeJHy8uKhkaK9n4S+m9P6/a2ttvKXgpU5AiyujYix9ONCAOjVWr4e3ckyC0IOlwAcz1G
	/8sX7nf5wjgnQtF9R1w==
X-Received: by 2002:a05:622a:43:b0:4ab:5c58:bb25 with SMTP id d75a77b69052e-4b0fc68ba3amr14426461cf.1.1755084744044;
        Wed, 13 Aug 2025 04:32:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEq0Aur4OMFrqMwkB9SaTqBRiff+d+TLLYRjRQr9B/aNZsuDsLG+6/BcDX/aVTr8EKoadGaEw==
X-Received: by 2002:a05:622a:43:b0:4ab:5c58:bb25 with SMTP id d75a77b69052e-4b0fc68ba3amr14426271cf.1.1755084743438;
        Wed, 13 Aug 2025 04:32:23 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0761f2sm2392951866b.11.2025.08.13.04.32.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 04:32:22 -0700 (PDT)
Message-ID: <c48906a9-4de0-453c-a827-5b45d3a6ed0a@oss.qualcomm.com>
Date: Wed, 13 Aug 2025 13:32:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spi: spi-qpic-snand: handle 'use_ecc' parameter of
 qcom_spi_config_cw_read()
To: Gabor Juhos <j4g8y7@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Md Sadre Alam <quic_mdalam@quicinc.com>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250808-qpic-snand-handle-use_ecc-v1-1-67289fbb5e2f@gmail.com>
 <3e790d99-5c6c-4148-85f5-0023a621afeb@oss.qualcomm.com>
 <e5b981f8-9b6b-42c6-b432-537d23f7fd58@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e5b981f8-9b6b-42c6-b432-537d23f7fd58@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NCBTYWx0ZWRfX+Zrxzi66CdgA
 OSt4Yqaa8YXxuxCPXhYNA+FuRKGRfAqVRopmsbpiGmlr8DZZhALh/SW3opacd8Maa54ejXuMSvK
 KrckEoUQdVr6JxgJYvpY+mAICdclJPOvvJzhcFc0ir4u0p4BgzRnQfZ+9EaffT/3pXwgeG0wNhW
 +P1dqL2PG/UjNSVgNHP7qUm31thMriy5fmIjqL5cXpPSfC8Qhh4M+IGlU4oJu2H2Dg1yMTkWvHJ
 +v+W4Bp4sktf4H0nq1r4ZzGZfdjSSXRpd2+oOSpMnQtsWJiCmxcxgE7D+30748kYZOwgvCK10Md
 UCN69XAbzyxWLn2jsTLDus1Y82yGD5n9GeVCUY3Pk4c6II8KSU2SqVblnXdhUqI+g0yeJWEvM/6
 z/fEfzjz
X-Proofpoint-GUID: TnZdLDSNUfTIksg7nJHg28shW6b6of6Q
X-Authority-Analysis: v=2.4 cv=TJFFS0la c=1 sm=1 tr=0 ts=689c77c9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=LMlhJLrcAiEsyVNmZoIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: TnZdLDSNUfTIksg7nJHg28shW6b6of6Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_043226_684778_D7D282C1 
X-CRM114-Status: GOOD (  20.35  )
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

T24gOC8xMi8yNSAxOjA2IFBNLCBHYWJvciBKdWhvcyB3cm90ZToKPiAyMDI1LiAwOC4gMTIuIDEx
OjU1IGtlbHRlesOpc3NlbCwgS29ucmFkIER5YmNpbyDDrXJ0YToKPj4gT24gOC84LzI1IDc6MTUg
UE0sIEdhYm9yIEp1aG9zIHdyb3RlOgo+Pj4gRHVyaW5nIHJhdyByZWFkLCBuZWl0aGVyIHRoZSBz
dGF0dXMgb2YgdGhlIEVDQyBjb3JyZWN0aW9uIG5vciB0aGUgZXJhc2VkCj4+PiBzdGF0ZSBvZiB0
aGUgY29kZXdvcmQgZ2V0cyBjaGVja2VkIGJ5IHRoZSBxY29tX3NwaV9yZWFkX2N3X3JhdygpIGZ1
bmN0aW9uLAo+Pj4gc28gaW4gY2FzZSBvZiByYXcgYWNjZXNzIHJlYWRpbmcgdGhlIGNvcnJlc3Bv
bmRpbmcgcmVnaXN0ZXJzIHZpYSBETUEgaXMKPj4+IHN1cGVyZmx1b3VzLgo+Pj4KPj4+IEV4dGVu
ZCB0aGUgcWNvbV9zcGlfY29uZmlnX2N3X3JlYWQoKSBmdW5jdGlvbiB0byBldmFsdWF0ZSB0aGUg
ZXhpc3RpbmcKPj4+IChidXQgYWN0dWFsbHkgdW51c2VkKSAndXNlX2VjYycgcGFyYW1ldGVyLCBh
bmQgY29uZmlndXJlIHJlYWRpbmcgb25seQo+Pj4gdGhlIGZsYXNoIHN0YXR1cyByZWdpc3RlciB3
aGVuIEVDQyBpcyBub3QgdXNlZC4KPj4+Cj4+PiBXaXRoIHRoZSBjaGFuZ2UsIHRoZSBjb2RlIGdl
dHMgaW4gbGluZSB3aXRoIHRoZSBjb3JyZXNwb25kaW5nIHBhcnQgb2YKPj4+IHRoZSBjb25maWdf
bmFuZF9jd19yZWFkKCkgZnVuY3Rpb24gaW4gdGhlIHFjb21fbmFuZGMgZHJpdmVyLgo+Pj4KPj4+
IFNpZ25lZC1vZmYtYnk6IEdhYm9yIEp1aG9zIDxqNGc4eTdAZ21haWwuY29tPgo+Pj4gLS0tCj4+
PiAgZHJpdmVycy9zcGkvc3BpLXFwaWMtc25hbmQuYyB8IDExICsrKysrKysrLS0tCj4+PiAgMSBm
aWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9zcGkvc3BpLXFwaWMtc25hbmQuYyBiL2RyaXZlcnMvc3BpL3NwaS1x
cGljLXNuYW5kLmMKPj4+IGluZGV4IDdiNzZkMmM4MmE1Mjg3ZGYxM2VlNmZjZWJjNGFiYmU1OGNh
ODYxZWUuLjExOTAwM2M0Nzg0ODkwNDU4YTQxYzY3ZmE4YmMxN2Q3MjEwMzBiMGQgMTAwNjQ0Cj4+
PiAtLS0gYS9kcml2ZXJzL3NwaS9zcGktcXBpYy1zbmFuZC5jCj4+PiArKysgYi9kcml2ZXJzL3Nw
aS9zcGktcXBpYy1zbmFuZC5jCj4+PiBAQCAtNDk0LDkgKzQ5NCwxNCBAQCBxY29tX3NwaV9jb25m
aWdfY3dfcmVhZChzdHJ1Y3QgcWNvbV9uYW5kX2NvbnRyb2xsZXIgKnNuYW5kYywgYm9vbCB1c2Vf
ZWNjLCBpbnQgYwo+Pj4gIAlxY29tX3dyaXRlX3JlZ19kbWEoc25hbmRjLCAmc25hbmRjLT5yZWdz
LT5jbWQsIE5BTkRfRkxBU0hfQ01ELCAxLCBOQU5EX0JBTV9ORVhUX1NHTCk7Cj4+PiAgCXFjb21f
d3JpdGVfcmVnX2RtYShzbmFuZGMsICZzbmFuZGMtPnJlZ3MtPmV4ZWMsIE5BTkRfRVhFQ19DTUQs
IDEsIE5BTkRfQkFNX05FWFRfU0dMKTsKPj4+ICAKPj4+IC0JcWNvbV9yZWFkX3JlZ19kbWEoc25h
bmRjLCBOQU5EX0ZMQVNIX1NUQVRVUywgMiwgMCk7Cj4+PiAtCXFjb21fcmVhZF9yZWdfZG1hKHNu
YW5kYywgTkFORF9FUkFTRURfQ1dfREVURUNUX1NUQVRVUywgMSwKPj4+IC0JCQkgIE5BTkRfQkFN
X05FWFRfU0dMKTsKPj4+ICsJaWYgKHVzZV9lY2MpIHsKPj4+ICsJCXFjb21fcmVhZF9yZWdfZG1h
KHNuYW5kYywgTkFORF9GTEFTSF9TVEFUVVMsIDIsIDApOwo+Pgo+PiBXaHkgYXJlIHdlIHJlYWRp
bmcgMiByZWdpc3RlcnMgKHRoZSAyIGluIHRoZSBmdW5jIGNhbGwpIGhlcmUsIC4uLgo+IAo+IEJl
Y2F1c2Ugd2hlbiBFQ0MgaXMgdXNlZCwgd2UgbmVlZCB0aGUgc3RhdHVzIG9mIHRoZSBFQ0MgY29y
cmVjdGlvbiBmcm9tIHRoZQo+IE5BTkRfQlVGRkVSX1NUQVRVUyByZWdpc3RlciB3aGljaCBpcyBw
bGFjZWQgcmlnaHQgYWZ0ZXIgdGhlIE5BTkRfRkxBU0hfU1RBVFVTLgo+IAo+IEhlcmUgYXJlIHRo
ZSByZWxldmFudCBkZWZpbml0aW9ucyBmcm9tIHRoZSAnbmFuZC1xcGljLWNvbW1vbi5oJyBoZWFk
ZXIgZm9yCj4gcmVmZXJlbmNlOgo+IAo+ICNkZWZpbmUJTkFORF9GTEFTSF9TVEFUVVMJCTB4MTQK
PiAjZGVmaW5lCU5BTkRfQlVGRkVSX1NUQVRVUwkJMHgxOAo+IAo+IFNvIHRoZSB0d28gcmVnaXN0
ZXJzIGNhbiBiZSByZWFkIHdpdGggYSBzaW5nbGUgRE1BIG9wZXJhdGlvbi4KPiAKPj4gLi4uIGJ1
dCAxIGV2ZXJ5d2hlcmUgZWxzZT8KPiAKPiBXaGVuIEVDQyBpcyBub3QgdXNlZCwgd2Ugb25seSBu
ZWVkIHRoZSB2YWx1ZSBmcm9tIHRoZSBOQU5EX0ZMQVNIX1NUQVRVUwo+IHJlZ2lzdGVyLCBzbyB3
ZSBkb24ndCBoYXZlIHRvIHJlYWQgdHdvIHJlZ2lzdGVycy4KCk9LIHllYWggSSBjYW4gc2VlIHRo
YXQKClJldmlld2VkLWJ5OiBLb25yYWQgRHliY2lvIDxrb25yYWQuZHliY2lvQG9zcy5xdWFsY29t
bS5jb20+CgpLb25yYWQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
