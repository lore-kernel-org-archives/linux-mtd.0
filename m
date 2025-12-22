Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E03FAE6748D
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Dec 2025 09:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fudMHez6HeXCMMID5kUj/kfTWSYzc/hpiqWOqK8StEQ=; b=pBDl0K6f5ONPYY
	G+nrFx/AHKVYlL68d0BGOtYezioAVZRHrn9GfL9UW0Z5ve2EQIPQq93qtagttwebX6G7tMvZizhdp
	Ssl4qGN8g2GvJn9Y0uLZgZh2w/zwCNegIh7WMwFRWpq5JLa0+FYuUnzrP0jx2FiTU00Vt6baS+7BR
	5JV+eH99mz1Ciz59pZPhbGti7dwNUbM3u2Y3EsOH7stfORIf1AZGOmC29OEBP1rNiYFPq/Iqa8b2Q
	m/PbsnS8cw6j0leWxILYdRRv2meevFCvARKIoZo7LS6Px/2B7KthwxNtwNQ710ffJNIu9wKG52R6X
	oOBPCxuCcSSgc2JrHaZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXcRm-0000000DXHc-3Ge0;
	Mon, 22 Dec 2025 09:43:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXcRk-0000000DXHA-179h
	for linux-mtd@lists.infradead.org;
	Mon, 22 Dec 2025 09:43:21 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM8Hf5R024605
	for <linux-mtd@lists.infradead.org>; Mon, 22 Dec 2025 09:43:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SRN6yIHvb50RD5cHSXOJLx9V5J7+ESE2+V0TzNobP3c=; b=I35pNHTaCZ6XR6ek
	dfjSeGeIc2StDqkVojbLeB3W4YxYCFh7fa2iHjy+GAN5Fare3ZKH5LaF/VJc3GN6
	3XjrJGoBGNjd/Iu1CmCbiLzKm7cB6FLnxjMXs3JgjkYp7e2WqJS7b7Ib7mxOm1WN
	4yrZUYjOzgyXrV3ABtdh1cs45YEMyati9JpR7f97t4d7OD3QxW311LrD3KnkIUjb
	QOOSQKqq5RTtVoM1U9d0/xgrDzOdAWDaUch2+LIgWP29wTLn6H+utJExjEkq6zIY
	wovzZNH8WwBOade04GqHZ+i+ki9HldPG5tuz2aRDYXluii8QgtleC3x0LNkoRJRh
	cb1VHg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mrachbm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Mon, 22 Dec 2025 09:43:18 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f357ab5757so15889261cf.0
        for <linux-mtd@lists.infradead.org>; Mon, 22 Dec 2025 01:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766396598; x=1767001398; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SRN6yIHvb50RD5cHSXOJLx9V5J7+ESE2+V0TzNobP3c=;
        b=fxyuEQOkIKXW2gVNIUjHsnGX4ooqt0jKFvNyt5mfaV0IlNqrYTuEL11M7fhtRk2TEt
         5MpRZc73qY3lkVF5++/GLvvevKEabgfrkiLofo2qNgTRGdHnyOulowcf+O3HhIvdqLJ4
         92MnGsHPihp0b+ZQZ+QF8VGIqG1CudqA5EEqiJk4dpPxtuBrzznzsCIsZ5kXaAeiuYJ5
         o0lSZTmDGdULiAHYMu9jNzZWVqxXr8RpdqblZp88BGpY4zLberjN0DvM4dR7K0Gdkakr
         QNt7zvzuRlri3VJovUf9SQ+Tx6ovMPag2QLJkjImBU+WZy4yWZsS5gqc+I0lgFXZwmhH
         rHXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766396598; x=1767001398;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SRN6yIHvb50RD5cHSXOJLx9V5J7+ESE2+V0TzNobP3c=;
        b=KD+N7bNABb+jRPRbLRyh+vfo6tvu8iVbbNueplPja20C+l8ESGK9Uli/L2oPr31zPl
         B8Lf6BMmkVbAOvCNYu7nqkm6MFQcMaFyY8pljuvP+TKpuY/qZJNZnDgYws66Kcsu+XAU
         5YiPvR/pf0Ef5e/6sxh5Vyr04iX56PSGDZYhUuNsXSW9SOOLwVLe7Kb+ByspOUWp2R5V
         RsJx4y8xfGEosfH61CtBjNOYNA2hKiSwnT+RPPk3SUhkFPM1t4X4g6UHGcbUmzn0KtmO
         rA8DdlomhhzGgVZoYk/zRdHro3SzBpG8tYciIaFLSFklWlxRMHezidANDD/4QJLCL6mB
         u0tA==
X-Forwarded-Encrypted: i=1; AJvYcCXR0p8rO0gg1AfKYHyKSCYYZfLONmI1d1v8peq+HyOBS/gs5vlSO+lPH35HQjQdaqcT+wflm/yvDWs=@lists.infradead.org
X-Gm-Message-State: AOJu0YxuOCbnj+ihPwrY75rRDcwC+iaiSZnw5ZIXguvD+5mUg4fXdOtA
	LHiESJcP7Q0A0YRR96uBLXQ4LD94pAPJ40jkRayEUprrsLXhy/Bn2RCNqkI9lSYokqMaE0Mn8oE
	Jz3qE4MH0M3UEgIhG5IiEHqJ+k7Ggfc40dFrXsnQ0UVu0DA9IcTRU5hpQ9MaYQHGsjQDB
X-Gm-Gg: AY/fxX5oaqIPDMqV/7fPqX5nxlwRufwT1LcAuIZ+yL+5lgasvKwanttQIdlQGzlVHuu
	fajfeNrc8wOwkfTPPXoPUxsDHb/4Snmd0ZE+X57rrgLCjT7oBDhiskLvXwd3aK6HknLrMWfdTep
	PTFaEOZZ5nPPQt0WD41YXthZvzSIoi1nOfIrdi5PFVb+wc/PStwPwj8VPkKrUqUi6CqKX8rf0qm
	/0csZ6DUf0MZR6tHlHTUU3KdwPBSG6EwG6ILFgJkitJYMnhUZ72qCgbwYPMGmAr4+jsJMcag2+4
	nw6EkeE6phaDlsut699cHe0TBr+FOjqxTzPE/r3SWTGRu7U6wMPbBPp1Nsvxs51sQfLFKw3PCZi
	OQSekkMz7yjcPED+9OTNP6t4BseqO7P/6RzQScNMJl09cCuUEu2UtGnJW7Yqj36+HvQ==
X-Received: by 2002:ac8:7c49:0:b0:4ed:b409:ca27 with SMTP id d75a77b69052e-4f4abde36bemr115663961cf.10.1766396598109;
        Mon, 22 Dec 2025 01:43:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWEjq6Tt4UdxaYQznLhDZd0HwoWnAEDuVsJfSlwF5bhgr6WXMGypxWePXMaLpyymFWQ8ptQw==
X-Received: by 2002:ac8:7c49:0:b0:4ed:b409:ca27 with SMTP id d75a77b69052e-4f4abde36bemr115663781cf.10.1766396597726;
        Mon, 22 Dec 2025 01:43:17 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b91494c0esm9803980a12.20.2025.12.22.01.43.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 01:43:17 -0800 (PST)
Message-ID: <1b40552e-b292-4207-b7eb-9f50e37fd7e4@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 10:43:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mtd: devices: Add Qualcomm SCM storage driver
To: Junhao Xie <bigfoot@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Xilin Wu <sophon@radxa.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20251218180205.930961-1-bigfoot@radxa.com>
 <A41171D3EA8B583B+20251218180205.930961-3-bigfoot@radxa.com>
 <b14c51a0-7e87-4eb2-ae52-caf90f1bf545@oss.qualcomm.com>
 <4AB2F6CA8EF1ED90+cd685c52-a4c2-492d-9445-b081d4d857f7@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4AB2F6CA8EF1ED90+cd685c52-a4c2-492d-9445-b081d4d857f7@radxa.com>
X-Proofpoint-ORIG-GUID: a3pMbZ_ax5mmN-_xGhPYzdhDb3V1vl69
X-Proofpoint-GUID: a3pMbZ_ax5mmN-_xGhPYzdhDb3V1vl69
X-Authority-Analysis: v=2.4 cv=e9wLiKp/ c=1 sm=1 tr=0 ts=694912b6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=ksxQWNrZAAAA:8 a=pYEcKcru8prnKPtxzWcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA4NyBTYWx0ZWRfXy6ApdlLkXl4j
 nv6ebrNBQoo+gU3ApWBbEKkq7QD1JQWZgc63WpSDdFPCcTcb34HvA72e0xInhfq6CSQyFmdOWag
 r5hU2dvOXwcPRYmu7dByUs+QV3knkdiC+AuYJQtuzAhadVGnGNz6yhfoGan5cmp399O0n5Jrnh+
 OCI8TsXKXMNhnsRwinAbdTakIYLtdfeRuXBAqL/1KYlDQBqKrIaJuCy4enZ1GF7v5fBnLGyHaDt
 YvpbPIL76m/RDSNAlgpEoBjibaVbdSz+XYaRC88Wc4wZ4WWmaYKtbvlQWR+OjElXxvHlk0e6FdW
 ecIWR9Kh4TjkslqCZfvAZP/8IUJVsERFsS+GLhI6JUrwOFiQUkztLPnBEDpc4YGrUEM+uiJV/Pt
 8SI1plK4+YnoUcJ04a8Xe1M/vCjrmPxRVy4Ke/ngbsFYzaWs5eVSEF9fB9tqPd8xY8pTpvKknpg
 3FYyafedRu4jD3pKx1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0
 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_014320_427160_57E35476 
X-CRM114-Status: GOOD (  14.19  )
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

T24gMTIvMTkvMjUgNjoxMiBQTSwgSnVuaGFvIFhpZSB3cm90ZToKPiBPbiAyMDI1LzEyLzE5IDIw
OjA1LCBLb25yYWQgRHliY2lvIHdyb3RlOgo+PiBPbiAxMi8xOC8yNSA3OjAyIFBNLCBKdW5oYW8g
WGllIHdyb3RlOgo+Pj4gQWRkIE1URCBkcml2ZXIgZm9yIGFjY2Vzc2luZyBzdG9yYWdlIGRldmlj
ZXMgbWFuYWdlZCBieSBRdWFsY29tbSdzCj4+PiBUcnVzdFpvbmUgZmlybXdhcmUuIE9uIHNvbWUg
cGxhdGZvcm1zLCBCSU9TL2Zpcm13YXJlIHN0b3JhZ2UgKHR5cGljYWxseQo+Pj4gU1BJIE5PUiBm
bGFzaCkgaXMgbm90IGRpcmVjdGx5IGFjY2Vzc2libGUgZnJvbSB0aGUgbm9uLXNlY3VyZSB3b3Js
ZCBhbmQKPj4+IGFsbCBvcGVyYXRpb25zIG11c3QgZ28gdGhyb3VnaCBTQ00gKFNlY3VyZSBDaGFu
bmVsIE1hbmFnZXIpIGNhbGxzLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEp1bmhhbyBYaWUgPGJp
Z2Zvb3RAcmFkeGEuY29tPgo+Pj4gVGVzdGVkLWJ5OiBYaWxpbiBXdSA8c29waG9uQHJhZHhhLmNv
bT4KPj4+IC0tLQoKWy4uLl0KCj4+PiArCWhvc3QtPmJ1ZmZlcl9zaXplID0gU1pfMjU2SzsKPj4g
U2hvdWxkIHRoaXMganVzdCBiZSA9IGhvc3QtPmluZm8tPnBhZ2Vfc2l6ZT8KPiAKPiBUaGUgdmFs
dWUgb2YgcGFnZV9zaXplIGlzIHNtYWxsZXIgdGhhbiB3aGF0IHdlIHdhbnQgZm9yCj4gYnVmZmVy
aW5nIFNDTSB0cmFuc2ZlcnMuIFRoZSBidWZmZXIgaXMgaW50ZW5kZWQgZm9yIGJhdGNoaW5nCj4g
bGFyZ2VyIG9wZXJhdGlvbnMsIHNvIGEgbGFyZ2VyIGZpeGVkIHNpemUgaXMgdXNlZCBoZXJlLgo+
IAo+IHN0cnVjdCBxY29tX3NjbV9zdG9yYWdlX2luZm86Cj4gwqAgdG90YWxfYmxvY2tzID0gODE5
Mgo+IMKgIGJsb2NrX3NpemUgPSA0MDk2Cj4gwqAgcGFnZV9zaXplID0gMjU2Cj4gwqAgbnVtX3Bo
eXNpY2FsID0gMAo+IMKgIG1hbnVmYWN0dXJlcl9pZCA9IDAKPiDCoCBzZXJpYWxfbnVtID0gMTY2
MzIxNQo+IMKgIGZ3X3ZlcnNpb24gPcKgCj4gwqAgbWVtb3J5X3R5cGUgPSBOT1IKCkkgZG9uJ3Qg
c2VlIGhvdyB0aGUgYmlnIGJ1ZmZlciBpcyBhbnkgdXNlZnVsIFRCRiAtIHlvdSByZWFkIGludG8g
dGhpcwpidWZmZXIgYmVmb3JlIG91dHB1dHRpbmcgdG8gKmJ1ZiBhbmQgY29weSBkYXRhIGZyb20g
KmJ1ZiBpbnRvIHRoZQpob3N0X2J1ZmZlciBpbnN0ZWFkIG9mIHdyaXRpbmcgc3RyYWlnaHQgZnJv
bSB0aGUgZm9ybWVyLiBJZiBhbnl0aGluZywKdGhhdCdzIGFuIHVubmVjZXNzYXJ5IGNvcHkuCgpL
b25yYWQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
