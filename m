Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A925C87FCB
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Aug 2025 13:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VjRAO4SKgK+Q0aetrVDtN8ZrUzOdeXzAmx2/A2guetU=; b=V0pDnJ+wW8D6le
	Nq/ADqA601+VJ8fjt0n4FQteJZW0nP+R8TZPBIIVo6O3u81k4hBufvUgN0WBXnS2iV8CfdJUHM7FB
	L5lSS5Y8PW7Ftow7DxMfoSf4yJX8Bq2yPIU1LguwZ40rhvbHaisLT+d8JxUMCnP9Kw+MSkocIhVLA
	8KSxsNJ+2xCUy1bViqMOdICH6huZz07UJJlis8OMTeyBDfJ/BJ6UFyv49AvSKIXMDfbZpOQuwk8ZB
	7R1l1FwEjA8JrO8nJfl0NyEwmhe2UQNGBIMHRzLU5vkEyL1isRBJ2aqVhZiDETh/tKlp9BrfdNqJP
	r3AEGXPb3Yy3dBSFLWZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiuu0-0000000AU2k-2nhZ;
	Mon, 04 Aug 2025 13:06:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiucC-0000000AQO4-2Xm7
	for linux-mtd@lists.infradead.org;
	Mon, 04 Aug 2025 12:48:33 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5746rw5u018248
	for <linux-mtd@lists.infradead.org>; Mon, 4 Aug 2025 12:48:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zFheNoJFftwlUhByal86hdBunVF358wbMQHu85MmEGA=; b=CRfKr2w/dSWVNReV
	amxfnKEU1UP5V+Hf36gAfER4V9LSdxV4liDYzGPw7ILeWzdxITAbYpjc/2ZaNk1B
	xm9+RqPtLq+B8an2pBUQBudXv7oibymFTHKGXY4mZweGGZfsGZoTpNC/MNl0GsP0
	SZmWEfjAYO2lrH4KqdITm0pJaeZq+JchfGRrYVpJ5xS1JVFU1lEJvFfU3d2S2X4J
	oTasuFfHY/pHXD11pVmOLgj+dLyK3TNNKFF6b7zo2l7Pp176xrCYCn67g5WtdKB3
	Jsx74JCtymSjy44MAmZR/spl84aKvsNsypcpt5+62oKkTitSQR4WALytmUORaoWz
	QzdQuw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48aqyv17ew-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Mon, 04 Aug 2025 12:48:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e69157a1d8so2770385a.1
        for <linux-mtd@lists.infradead.org>; Mon, 04 Aug 2025 05:48:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754311710; x=1754916510;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zFheNoJFftwlUhByal86hdBunVF358wbMQHu85MmEGA=;
        b=jc5O+Oz0lvJ640/s/6Nd+CSEBfXjK2IjMqKaP30Tm3YqcNCkSDJgmTNtCTtT+U9WD+
         ZEdi4lEu9rfmAsISjmhprbKmQZQ/Pdsp9AnjVAJ3eewJEV9U3J5y55TXNipBDJ/thrTK
         UogcEBYDm00y8sw4lT6sga1BpbESZKuBwZTrjDKq10ZPNmzP4gWv5fqBq/w+6EPtorHI
         IWpCFMIS4GRnE2D773Zk6SWoZy4xJ9ZNeUGGF9mWq0Spev3Qz6K06qy5yKIIjuqJBOnS
         qXUPh6YUiIoerdu4YTFxr+eKwe3/tp3/XE0bpk1Nw2hI/V1Yqvw8WYbH6DaB+YN2vLii
         s0ag==
X-Forwarded-Encrypted: i=1; AJvYcCWh1mn+WAy4XEtepJ+21ZG9kmU3SdeCurais7MRjWZWmEQVuO6i5lvaw3FM7ox9QRusIoABNG9iX6M=@lists.infradead.org
X-Gm-Message-State: AOJu0YxP4ppNSl1vCpW/VbShmgYRrSnrouyxuAijDmsEpKDalg7+pWS/
	cdXvFaY/b7nZfXZkLuOTbmyWIiPRYlREWTA9bMKFUTgRVRkv4X1n7pJIdRaxCEdk59Cn4OJ749n
	pdc2Lz/8oTiAkVloC7+5nYCjk9X0JOtnfgaKWPQES40s3/duEx4krnz+eqei+dXjL9TtI
X-Gm-Gg: ASbGncv7MR8loW8XABuaiaOE1uNfUSP6zh7Ud4MP9l1kYvLJ8zNCnjQX4N97eHsL940
	wuld23mAqEZNq3ZwRo+vxvy5znym9uwaEtwLQgk0+1wntcJQU6nrT2mxuxLkQWQEX5mlm+u6lQL
	OOCPrw/xnocg2zZD3DSrGAn7QJQCreso83Q+y+NYP36ksrmxdt4e0DZ96TPIrtcHgL5uaShr5uA
	YbIkG7RhsCcWA8+kxEWls52bMEmJAlq9pydbxM6KEifJAh5nya6eIx/1Wet3Ejol/kySC1lcWn9
	mKGEIurCvVht1upRmYnJtcqmp4mldaVF7WTrwOWGb149IR2gGUvCoT1B0ioqA5Eb2qaAGMJQ7rS
	nzn2w4S0lZ+zBq8zzuw==
X-Received: by 2002:a05:620a:1a96:b0:7e6:2435:b6a4 with SMTP id af79cd13be357-7e696391ba3mr588751485a.12.1754311710410;
        Mon, 04 Aug 2025 05:48:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfOK2zG/I1wPrVXqw3Ou3u51Ey0rE1CW66ekjlSXKZ6Q9KGh6EBm21/8VsABSjJCoV5JqjTg==
X-Received: by 2002:a05:620a:1a96:b0:7e6:2435:b6a4 with SMTP id af79cd13be357-7e696391ba3mr588749785a.12.1754311710004;
        Mon, 04 Aug 2025 05:48:30 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c022sm713556266b.101.2025.08.04.05.48.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 05:48:29 -0700 (PDT)
Message-ID: <ee95cbc8-c1e6-4b23-9e1d-4a74ef441adc@oss.qualcomm.com>
Date: Mon, 4 Aug 2025 14:48:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spi: spi-qpic-snand: use correct CW_PER_PAGE value for
 OOB write
To: Gabor Juhos <j4g8y7@gmail.com>, Mark Brown <broonie@kernel.org>,
        Md Sadre Alam <quic_mdalam@quicinc.com>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250801-qpic-snand-oob-cwpp-fix-v1-1-f5a41b86af2e@gmail.com>
 <b2e4d6b1-25bc-4b2e-ae54-6588f1573131@oss.qualcomm.com>
 <1ba00a38-7293-4f72-9aee-f87f41a3dcc6@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1ba00a38-7293-4f72-9aee-f87f41a3dcc6@gmail.com>
X-Proofpoint-GUID: VLgzTUIUbzbR_L3OXvLHeCZMD68INLFI
X-Authority-Analysis: v=2.4 cv=F/xXdrhN c=1 sm=1 tr=0 ts=6890ac1f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=6dxo4luPYu9H4ytEELAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: VLgzTUIUbzbR_L3OXvLHeCZMD68INLFI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDA3MCBTYWx0ZWRfX4j9XcA/HPDGJ
 X7ybpDkmVdAVy4WUU87XT2Mmhcq1yt3MqAiLnhDWeJepP2DadVVIDMCliKM6OK1HLKI2hZccTUV
 pvmpOIN2KEfmP017cahDDRLxrsDCre6BVdzOzRgCYD1nsNkiF9yk6lNgC2fIasaTUAEFdfhC9Gi
 dqBdpXxjy3X8012KkbjArUz7Uja+YOhC1LB9kh3ZBUHvC3aRc3W6cpyUH5En0hjVucO1ec+74Aq
 IAFstBtApSp8WGVOYelfIISZUZxWlqJqE1flV3tgBhJDRcI9KTe7dLFdQnGGMnTOu3L13r801ho
 2JsaYVGk2O62iJPgNYVdEHoSEBQjAwDXJxs/2OyU90umDDG3G3jd5nXgFvgfugrlvGQA4TUChZa
 yHKm9hyfjK2SmLzfSEkqVKgXIL3tuXMYgL8SksrOC4vFLs8FEYVk7oy/fUoGTHAeWh4YF9Yk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 mlxscore=0 phishscore=0 bulkscore=0 adultscore=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508040070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_054832_652598_85753754 
X-CRM114-Status: GOOD (  25.91  )
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

T24gOC80LzI1IDk6NDAgQU0sIEdhYm9yIEp1aG9zIHdyb3RlOgo+IEhpIEtvbnJhZCwKPiAKPiAy
MDI1LiAwOC4gMDEuIDEzOjA4IGtlbHRlesOpc3NlbCwgS29ucmFkIER5YmNpbyDDrXJ0YToKPiAK
PiAuLi4KPiAKPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NwaS9zcGktcXBpYy1zbmFuZC5jIGIv
ZHJpdmVycy9zcGkvc3BpLXFwaWMtc25hbmQuYwo+Pj4gaW5kZXggMGNmYTBkOTYwZmQzYzI0NWMy
YmJmNGY1ZTAyZDBmYzBiMTNlNzY5Ni4uNTIxNmQ2MGUwMWFhYjI2ZjkyN2JhYWVhMjQyOTY1NzFh
Nzc1MjdjYiAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvc3BpL3NwaS1xcGljLXNuYW5kLmMKPj4+
ICsrKyBiL2RyaXZlcnMvc3BpL3NwaS1xcGljLXNuYW5kLmMKPj4+IEBAIC0xMTk2LDcgKzExOTYs
NyBAQCBzdGF0aWMgaW50IHFjb21fc3BpX3Byb2dyYW1fb29iKHN0cnVjdCBxY29tX25hbmRfY29u
dHJvbGxlciAqc25hbmRjLAo+Pj4gIAl1MzIgY2ZnMCwgY2ZnMSwgZWNjX2JjaF9jZmcsIGVjY19i
dWZfY2ZnOwo+Pj4gIAo+Pj4gIAljZmcwID0gKGVjY19jZmctPmNmZzAgJiB+Q1dfUEVSX1BBR0Vf
TUFTSykgfAo+Pj4gLQkgICAgICAgRklFTERfUFJFUChDV19QRVJfUEFHRV9NQVNLLCBudW1fY3cg
LSAxKTsKPj4+ICsJICAgICAgIEZJRUxEX1BSRVAoQ1dfUEVSX1BBR0VfTUFTSywgMCk7Cj4+Cj4+
IEZXSVcgSSdtIGp1c3QgYSBmbHktYnkgcmV2aWV3ZXIgZm9yIHRoaXMgZHJpdmVyLCBidXQgdGhl
IGRvY3Mgc2F5Ogo+Pgo+PiBUaGUgdmFsdWUgaXMgdGhlIG51bWJlciBvZiBjb2Rld29yZHMgcGVy
IHBhZ2UgbWludXMgb25lCj4gCj4gV2VsbCwgdGhlIGRyaXZlciB1c2VzIHRoYXQgZGlmZmVyZW50
bHkgZXZlbiB3aXRob3V0IHRoZSBwYXRjaC4gU2VlIGJlbG93Lgo+IAo+PiAiTk9URTogVGhpcyBm
aWVsZCBtdXN0IGJlIGNsZWFyZWQgZm9yIGJsb2NrIGVyYXNlIG9wZXJhdGlvbiIKPiAKPiAgICAg
JCBnaXQgZ3JlcCAtaHAgJ0ZJRUxEX1BSRVAoQ1dfUEVSX1BBR0VfTUFTSywuKjsnIGRyaXZlcnMv
c3BpL3NwaS1xcGljLXNuYW5kLmMKPiAgICAgc3RhdGljIGludCBxY29tX3NwaV9ibG9ja19lcmFz
ZShzdHJ1Y3QgcWNvbV9uYW5kX2NvbnRyb2xsZXIgKnNuYW5kYykKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBGSUVMRF9QUkVQKENXX1BFUl9QQUdFX01BU0ss
IDApKTsKPiAgIAo+IFRoaXMgZnVuY3Rpb24gaW1wbGVtZW50cyB0aGUgYmxvY2sgZXJhc2Ugb3Bl
cmF0aW9uIGFuZCBpdCBjb3JyZXNwb25kcyB0byB0aGUKPiBkb2N1bWVudGF0aW9uLiBTbyBmYXIg
c28gZ29vZC4KPiAKPiAgICAgc3RhdGljIGludCBxY29tX3NwaV9yZWFkX2xhc3RfY3coc3RydWN0
IHFjb21fbmFuZF9jb250cm9sbGVyICpzbmFuZGMsCj4gICAgICAgICAgICAgICAgICAgIEZJRUxE
X1BSRVAoQ1dfUEVSX1BBR0VfTUFTSywgMCk7Cj4gICAgIHN0YXRpYyBpbnQgcWNvbV9zcGlfcmVh
ZF9jd19yYXcoc3RydWN0IHFjb21fbmFuZF9jb250cm9sbGVyICpzbmFuZGMsIHU4ICpkYXRhX2J1
ZiwKPiAgICAgICAgICAgICAgICAgICAgRklFTERfUFJFUChDV19QRVJfUEFHRV9NQVNLLCAwKTsK
PiAgIAo+IAo+IFRoZXNlIHR3byBmdW5jdGlvbnMgYXJlIHVzaW5nIGEgc2luZ2xlIGNvZGV3b3Jk
ICh3aXRoIHplcm8gQ1dfUEVSX1BBR0UgdmFsdWUpLgo+IFNvLCBpdCBzZWVtcyB0aGF0IGluIHJl
YWxpdHkgdGhlIENXX1BFUl9QQUdFIHZhbHVlIG1lYW5zIHRoZSBudW1iZXIgb2YgY29kZXdvcmRz
Cj4gKG1pbnVzIG9uZSkgdXNlZCB3aXRoaW4gYSBzaW5nbGUgb3BlcmF0aW9uIGV4ZWN1dGVkLiBP
ZiBjb3Vyc2UgaXQgaXMgcG9zc2libGUKPiB0aGF0IHRoZSBleGlzdGluZyBjb2RlIGlzIHdyb25n
IGhlcmUuCj4gCj4gICAgIHN0YXRpYyBpbnQgcWNvbV9zcGlfcmVhZF9wYWdlX2VjYyhzdHJ1Y3Qg
cWNvbV9uYW5kX2NvbnRyb2xsZXIgKnNuYW5kYywKPiAgICAgICAgICAgICAgICAgICAgRklFTERf
UFJFUChDV19QRVJfUEFHRV9NQVNLLCBudW1fY3cgLSAxKTsKPiAgICAgc3RhdGljIGludCBxY29t
X3NwaV9yZWFkX3BhZ2Vfb29iKHN0cnVjdCBxY29tX25hbmRfY29udHJvbGxlciAqc25hbmRjLAo+
ICAgICAgICAgICAgICAgICAgICBGSUVMRF9QUkVQKENXX1BFUl9QQUdFX01BU0ssIG51bV9jdyAt
IDEpOwo+ICAgICBzdGF0aWMgaW50IHFjb21fc3BpX3Byb2dyYW1fcmF3KHN0cnVjdCBxY29tX25h
bmRfY29udHJvbGxlciAqc25hbmRjLAo+ICAgICAgICAgICAgICAgICAgICBGSUVMRF9QUkVQKENX
X1BFUl9QQUdFX01BU0ssIG51bV9jdyAtIDEpOwo+ICAgICBzdGF0aWMgaW50IHFjb21fc3BpX3By
b2dyYW1fZWNjKHN0cnVjdCBxY29tX25hbmRfY29udHJvbGxlciAqc25hbmRjLAo+ICAgICAgICAg
ICAgICAgICAgICBGSUVMRF9QUkVQKENXX1BFUl9QQUdFX01BU0ssIG51bV9jdyAtIDEpOwo+IAo+
IAo+IFRoZSBwcmV2aW91cyBmdW5jdGlvbnMgYXJlIG9wZXJhdGluZyBvbiB3aG9sZSBwYWdlcywg
c28gdGhvc2UgYXJlIHVzaW5nIGFsbCBjb2Rld29yZHMKPiB3aXRoaW4gYSBwYWdlIHRodXMgJ251
bV9jdyAtIDEnIGlzIGdldHRpbmcgc2V0IGluIHRoZSByZWdpc3RlciBmaWVsZC4gVGhpcyBhbHNv
IG1hdGNoZXMKPiB3aXRoIHRoZSBkb2N1bWVudGF0aW9uLgo+IAo+ICAgICBzdGF0aWMgaW50IHFj
b21fc3BpX3Byb2dyYW1fb29iKHN0cnVjdCBxY29tX25hbmRfY29udHJvbGxlciAqc25hbmRjLAo+
ICAgICAgICAgICAgICAgICAgICBGSUVMRF9QUkVQKENXX1BFUl9QQUdFX01BU0ssIG51bV9jdyAt
IDEpOwo+IAo+IFRoaXMgaXMgdGhlIGZ1bmN0aW9uIGZpeGVkIGJ5IHRoZSBwYXRjaC4gQXMgaXQg
aXMgaW5kaWNhdGVkIGluIHRoZSBjb21taXQgZGVzY3JpcHRpb24KPiB0aGlzIGFsc28gdXNlcyBh
IHNpbmdsZSBjb2Rld29yZCBzaW1pbGFybHkgdG8gdGhlIHFjb21fc3BpX3JlYWRfKGxhc3RfY3cs
Y3dfcmF3KSBmdW5jdGlvbnMKPiBkZXNjcmliZWQgYWJvdmUgc28gdGhlIENXX1BFUl9QQUdFIHZh
bHVlIHNob3VsZCBiZSBzZXQgdG8gemVyby4KCkkgZGlkbid0IG1lYW4gdG8gZGlzcHV0ZSB3aGF0
IHlvdSBzYWlkIDopClNpbXBseSBpbmNsdWRlZCBzb21lIGNvbnRleHQgZm9yIG90aGVyIHJldmll
d2VycwoKQnV0IHRoYW5rcyBmb3IgdGhlIGluc2lnaHQsIHRoaXMgc2VlbXMgdG8gaW5kZWVkIG1h
a2Ugc2Vuc2UKdGhlIHdheSB5b3UgcHJlc2VudGVkIGl0CgpLb25yYWQKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
