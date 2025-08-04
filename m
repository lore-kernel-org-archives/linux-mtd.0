Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E8BFC87FCB
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Aug 2025 09:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EJOBDEvuUu3kZjNfTD5qM2CQ4HeqqkZfDfciJawK7bw=; b=ROlF+xlKtIM87I
	J0oUGgezuOBRrgKNYDN+LLLshOQP6BqbAolW8blLILiDjB2T/uwBhltpt2hW6AH7TxGLEMQ5thWoy
	lxXoMnSEkNDR5AiDcevUGvZRanXC1+vDjMAFwYqy9NCBoVJye/gHNB/lRSxqALlUNmWBz07kCtAE6
	ByflPxL7ck1hMFOVAssgF5vly5IsyjGKeedGSy8m2BN+a7YzhwEKkVdsxtK82Vi7XAVGT6I4baPCc
	Xz72bIkgqzvTOGZgPjk1rZd4YPOpf5Bzdqv6vzvxhiVkYr+aU00+V2TJVQhdIhIa7V3pnB5E4Xq68
	riW/rRTh5vrmz+SzuHYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uirSm-0000000A4nC-1eDE;
	Mon, 04 Aug 2025 09:26:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uir7g-0000000A2Nh-0zDJ
	for linux-mtd@lists.infradead.org;
	Mon, 04 Aug 2025 09:04:49 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 573NmiDN032126
	for <linux-mtd@lists.infradead.org>; Mon, 4 Aug 2025 09:04:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yxj88AoDLPC4Xz7nvIZCrmjG+oBu2ULVQ7Y3/Wt0Pxc=; b=H/j00l76Mr+gYapm
	+ZtxUX6bjTjpCIenYszeIdCS8nnZ+QQ7m5Ja34mr+hTJZ3N3w4ClQQnp7jW5sQEy
	kB4zFodR5A65bMjtX0cI9EDDKEvW1WyOqCDZFthtLgb9exhVJ0CAGt42dgiCYQzU
	WT0WmveQ62UM9ig64TDyxkD3he9zgjrl26+NSII0Ox0P6oc7So5KYV5de6y0KKto
	wZqCavNdiTBD62Yww9JsFsuOVHeEmhUDBgyBMQIGq/K/3bbe/sQRV+BNPmCW27oN
	oEQWD4hC/wcRxehaOfK5IIEkLhqh3OCMRXZJ6BThHhpBEoN+3nO4KJMvtdlA3dPw
	a9QMGw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489arwm91a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Mon, 04 Aug 2025 09:04:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e7f74bb018so12236585a.0
        for <linux-mtd@lists.infradead.org>; Mon, 04 Aug 2025 02:04:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754298265; x=1754903065;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yxj88AoDLPC4Xz7nvIZCrmjG+oBu2ULVQ7Y3/Wt0Pxc=;
        b=g1dhnNU2xV6fbg3JlCCMFyEZ7YotrFNNfPJkvw8wPMxQcMk3oqphKG15LpGvinlmxV
         OZBdWBxk0oWmrK9zlWdbutr5g9J/NdP7cGpPoPDOypJeqxV5utVeL4LheWf2yYSh521N
         Q7kGkU2l3XfUtLFMFpdplGA3CZdJHzkQQzMbm9zec8EKQKEqoixF8JHuiZOWMCcQ7XY4
         tOkft0i18i3nZrDpqUW0ZqaR9YjMwz3weZ7L+JYelNsxw3rib1OnMjs58HsJnBLcJSnl
         Z1AmirVqC2Ult/h58EVi1StJII8LPy3UNKot9o1bs4R+RQT6gqVNhpRHgh9FlKC5IG4f
         1lcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUd/WYjTv0kcFvN//LBBFvG7wr9FUndHnIlyL/hFAOxEI3TR8u98g4RKIZD4oULvzmzgbnJBh1aLII=@lists.infradead.org
X-Gm-Message-State: AOJu0Yws74qeRO6fVKTn5qcSTOl5u+DuX7wU3emQl5qwtxJlAs+l/ze1
	fy06aw1hDVGYRsvc6GUK72yWM+RopDQBVe2NUfDl1CzZYeMfYz8/07ZLtKygy4pL9vy/bhN67Xw
	goUUh6sbZOkCMEk+JW1Zi/sMTe4lLodyFWxzg5yD8Ol9GH7EfPqUQXJQ33Pzo2QFdTZon
X-Gm-Gg: ASbGnctkGz9a+iDLTsFt7xtYVoOJEXkvqaFW4Bv7SJ7l1sNE96z4ixpjphflfcDt4qr
	CybSlHxdWeb+C9mQ3+M2j8zacVxnMx11MwPmsUEeHyFvCkgtJHCrpyxwPdV//glMWwR850b0yep
	JTNleiSLCgx/SuNDwbZOYFRtpvM9EeegmmkivUL2WiucIZf4zX82TD16hg0BdEhdRGVwUEUeUCQ
	Tu/+mFaoQBS0RDnmfUNmeUecI2w8YeMFUSYChUJLtLo9YLumYtLsgCp++aLK/qiKNO5W9MmEv/E
	GuUPfouSeZfi96T3jVLw/o+gbZ/ho+N9qUxoH4EStZppDBxgplM/L3LNLBwVK+rHbOdNwPpyq2R
	gV/qt7uSAW2Ms3UPJiQ==
X-Received: by 2002:a05:620a:40c6:b0:7e8:5bb:b393 with SMTP id af79cd13be357-7e805bbb656mr66103385a.4.1754298265101;
        Mon, 04 Aug 2025 02:04:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHT5U6nf7OFxjlAHz3AXwYcJmyL/ozw3xGtfssCSEsyIVFeEN+uSY6B0F2EWAEjbDHiy3UmaQ==
X-Received: by 2002:a05:620a:40c6:b0:7e8:5bb:b393 with SMTP id af79cd13be357-7e805bbb656mr66101085a.4.1754298264504;
        Mon, 04 Aug 2025 02:04:24 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91aad117dsm695375766b.77.2025.08.04.02.04.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 02:04:24 -0700 (PDT)
Message-ID: <93403461-c0b2-4c0c-91b3-8cbd4c1c5ebe@oss.qualcomm.com>
Date: Mon, 4 Aug 2025 11:04:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spi: spi-qpic-snand: fix calculating of ECC OOB regions'
 properties
To: Gabor Juhos <j4g8y7@gmail.com>, Mark Brown <broonie@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250731-qpic-snand-oob-ecc-fix-v1-1-29ba1c6f94e5@gmail.com>
 <72d5f805-1637-4c82-af25-e78b978c5799@oss.qualcomm.com>
 <8883471e-57b9-4492-8d4a-aca3b4538682@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8883471e-57b9-4492-8d4a-aca3b4538682@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDA0OCBTYWx0ZWRfXzsDD/jRtLkqV
 Vv0cBiML4dG83iLpXhA80ml3FWmLFTwTQy0Rab6WeHaO1RA8Do7F7YzfG9oMS+ZEK88rdZ1pY7S
 +1nxPVs5oF/TD2Un1rsaRamtgmxKpxp1Jd7H4KmeCoKQjbNdzgi2llMRV4xwENYpwHtMxCpDS2w
 5B2S1sZa7Avp+Z9wiSrgsXAs8yn4EelCY+v2PQ4/nd+tab46Dt2nSzcQpDi7kcAQYo+t10nxQa5
 quiH3qEIrtye6UVyWhMr4PUfrDkCfBs+HEt47YbJxy5VxlaevZ2HlknlmtDa9uXIcWzXyK8WjB2
 QzPdwNuRuT38MA5HYVgPR4mVMB7Q3xvMjl4tiQtnmXgLRD9ZP+DVBVwtfWIqnBTe6JSKxksaE39
 tf7/fOCQr7NF7yLP6+Tuxg6dREL9Mqio8oLGmDRwMMkEeBWpfZjG46xQUflLY1tvyMp4mk4Y
X-Authority-Analysis: v=2.4 cv=We8Ma1hX c=1 sm=1 tr=0 ts=68907799 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=sgHexgGcLWnyGziH-awA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: VuTFSWrPQXpuTSmoETyoaP63oaDZv7eL
X-Proofpoint-ORIG-GUID: VuTFSWrPQXpuTSmoETyoaP63oaDZv7eL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_04,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0 mlxscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508040048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_020448_397794_0354683B 
X-CRM114-Status: GOOD (  19.76  )
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

T24gOC80LzI1IDk6MjIgQU0sIEdhYm9yIEp1aG9zIHdyb3RlOgo+IEhpIEtvbnJhZCwKPiAKPiAy
MDI1LiAwOC4gMDEuIDEzOjU2IGtlbHRlesOpc3NlbCwgS29ucmFkIER5YmNpbyDDrXJ0YToKPj4g
T24gNy8zMS8yNSA4OjExIFBNLCBHYWJvciBKdWhvcyB3cm90ZToKPiAKPiAuLi4KPiAKPj4+IC0t
LSBhL2RyaXZlcnMvc3BpL3NwaS1xcGljLXNuYW5kLmMKPj4+ICsrKyBiL2RyaXZlcnMvc3BpL3Nw
aS1xcGljLXNuYW5kLmMKPj4+IEBAIC0yMTMsOCArMjEzLDE2IEBAIHN0YXRpYyBpbnQgcWNvbV9z
cGlfb29ibGF5b3V0X2VjYyhzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgaW50IHNlY3Rpb24sCj4+PiAg
CWlmIChzZWN0aW9uID4gMSkKPj4+ICAJCXJldHVybiAtRVJBTkdFOwo+Pj4gIAo+Pj4gLQlvb2Jy
ZWdpb24tPmxlbmd0aCA9IHFlY2MtPmVjY19ieXRlc19odyArIHFlY2MtPnNwYXJlX2J5dGVzOwo+
Pj4gLQlvb2JyZWdpb24tPm9mZnNldCA9IG10ZC0+b29ic2l6ZSAtIG9vYnJlZ2lvbi0+bGVuZ3Ro
Owo+Pj4gKwlpZiAoIXNlY3Rpb24pIHsKPj4+ICsJCW9vYnJlZ2lvbi0+b2Zmc2V0ID0gMDsKPj4+
ICsJCW9vYnJlZ2lvbi0+bGVuZ3RoID0gcWVjYy0+Ynl0ZXMgKiAocWVjYy0+c3RlcHMgLSAxKSAr
Cj4+PiArCQkJCSAgICBxZWNjLT5iYm1fc2l6ZTsKPj4+ICsJfSBlbHNlIHsKPj4+ICsJCW9vYnJl
Z2lvbi0+b2Zmc2V0ID0gcWVjYy0+Ynl0ZXMgKiAocWVjYy0+c3RlcHMgLSAxKSArCj4+PiArCQkJ
CSAgICBxZWNjLT5iYm1fc2l6ZSArCj4+PiArCQkJCSAgICBxZWNjLT5zdGVwcyAqIDQ7Cj4+PiAr
CQlvb2JyZWdpb24tPmxlbmd0aCA9IG10ZC0+b29ic2l6ZSAtIG9vYnJlZ2lvbi0+b2Zmc2V0Owo+
Pj4gKwl9Cj4+Cj4+IEhvdyBhYm91dAo+Pgo+PiBpZiAoc2VjdGlvbiA9PSAwKSB7Cj4+IH0gZWxz
ZSBpZiAoc2VjdGlvbiA9PSAxKSB7Cj4+IH0gZWxzZSB7IHJldHVybiAtRVJBTkdFIH0KPj4KPj4g
Pwo+IAo+IFRoZSBjdXJyZW50IHdheSBmb2xsb3dzIHRoZSBpbXBsZW1lbnRhdGlvbiBpbiB0aGUg
cWNvbV9uYW5kYyBkcml2ZXIsIHNvIGl0IG1ha2VzCj4gaXQgZWFzaWVyIHRvIGNvbXBhcmUgdGhl
IHR3bywgYnV0IGl0IGNhbiBiZSBjaGFuZ2VkIG9mIGNvdXJzZS4KPiAKPiBIb3dldmVyLCBzaW5j
ZSB0aGUgJ3NlY3Rpb24nIHBhcmFtZXRlciBpcyBhbiBpbnRlZ2VyIGNhbiB3ZSBhZ3JlZSB1cCBv
biB1c2luZyBhCj4gc3dpdGNoIHN0YXRlbWVudCBpbnN0ZWFkIG9mIG11bHRpcGxlIGlmcz8KClRo
YXQgd29ya3MgdG9vCgpLb25yYWQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
