Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D53DBD6101C
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Jan 2026 14:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gb8uT4lnpfLWvPRefVDCV7LCzuRhHD7BNjGj5R2ZIig=; b=hPBvjZB+9WOV3y
	slT1aR5OXFKxaiYbj4qgm25ti0FpKgF+mnMpEJCCQgCPsJN61BrmHkW7s60zSsCZL6067a6K2YAOZ
	D7HHPd23a+/gzgfSoLnbWIeXWmNrfDtzjxWaX04vleX7YeiVfyN7+k35zEFzjjgK+2tG43xRleVew
	+toAp6cV1/lStTrjB8Na+bSRmZimwgqU+yaozVLfSUsLicuMTOJXVfi76PszVNvPtnQO7h2vVGWls
	akQU+TjYO5h9npyQ9mSEbbeZLacgKyCdwHf6SxDiPzc9xR7BoYUK+tVRNOSAjRC+pAJ3X/29co2+X
	xjK/N/+K8C3fVnEgISrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlSq9-00000000Cuj-3XTG;
	Thu, 29 Jan 2026 14:17:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlSq7-00000000CuO-0GBp
	for linux-mtd@lists.infradead.org;
	Thu, 29 Jan 2026 14:17:44 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TACnRS2060076
	for <linux-mtd@lists.infradead.org>; Thu, 29 Jan 2026 14:17:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sPxS5c0pRe16fDouaE61U8nM92dYddyMAnv3v5fItBU=; b=lJoRJwY/N5LLdmaz
	yP8ORpj6R15zgxFrSasCs3DZqbVnj6B09H1/2FTb+qCBPO4UkeYzaIfRSrLhhA3J
	S7FLdbv2Ow73wUSOeqd+AOYyiOD6MpNOVAVjH0JXAHuMzXBYprqkkGZtQ9FlheHe
	jcFwq0ph8mGDaTXtOtgUYDIeTGoFP8vBhONEZRQFLcehjK1KfF/X/OBvd1CCc5Lg
	5GMl6pcTlzuqbKBK1yCiA1tA+6n62GZvucwd/Prj4vJQAN6M9sbraLtA9frGO3YW
	rO6HCj3LcbiFI1aeOQLcUq0HXhDB3agMITSEjDrZW8wlGM3QBo5EXPBu3yJWEV0e
	irvtfg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bypgrkpg0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Thu, 29 Jan 2026 14:17:39 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5ed0aad05deso15408137.2
        for <linux-mtd@lists.infradead.org>; Thu, 29 Jan 2026 06:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769696259; x=1770301059; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sPxS5c0pRe16fDouaE61U8nM92dYddyMAnv3v5fItBU=;
        b=glCUWtvYrODYOL4v9dyfVuEvQQl6VmKdfGYvdgK1P9fYuGpsHzvtFgfN/DjLg5DJ6K
         srrXdh6OVrlBBIAnPJocKrJ3Y2R47Ph/XZLFzV309cYllSrU3xU0ieiwHNiqp90ei/tJ
         x7JtSKSmyP3XMp4/qXWUDgQl4yfk3i0T3qrcFlWYJP3coBwFsI10PD72AuE8rrOEEluB
         2lbaFdEK+Rj2DrBFo5THdCHK4pMEuOl4Vo7s0L1MPDKqvu7HaL92vw7b9rtxk5oc88Sk
         aaw2q+qSyZbpjMPSwzbRJb8c5D9fJGe7ZzEE+9g0spMCwQ7Wdd853tWa+sco62nBxehJ
         vg/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769696259; x=1770301059;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sPxS5c0pRe16fDouaE61U8nM92dYddyMAnv3v5fItBU=;
        b=ethJERTefE84Iwml6Uimpzf9ltRPZOJUmAQhe4AMSamyJ4VbdOBlT5tD6UoBVaBaj2
         81dvO1hZ9FpY97PdIRmWxDJ1fbEzKsRvDlJ8SnLu3E2SXF8b/jYL1wClzr5xOG70XEy1
         pM4ZaEKioaJlqeW9HojxDHwEjVQvWeqdCcPA3ZUxRvhN+FSr7ZE9PvN1IYR1UNZ40KaH
         tiBO3bUqwQNw2B4IHHuQLwFF0warSshoN8Zvvr5BbHGRd3e1/GwStGA8qBR5fwz0KCqU
         HHMGKiyEqcsGJFUUCsevbdusFe0A6S8l/9G4dgBm74H4sirN+ZyK5tzvanYfkAqJo/hn
         J3Jg==
X-Forwarded-Encrypted: i=1; AJvYcCWeNqWaj4PZY3vsmj1dxZ5Je/XNIiMpNeYUH/r3NQlJ2rxogSzb1zQn65LmD+BfVteQrdA7BC9Ef+I=@lists.infradead.org
X-Gm-Message-State: AOJu0YwlGcfB3zNGurqGY+QfFL54xq/czsUQWu4Kk2a96JeRrqx3QDmM
	uzVOUao2EH4/8rhrCg8H5Y9IR5Nh+EF/NO6kUxD1Kw5V8CRGVQGWCdmrVlGY057QxRD4KHJS3av
	/gkoQnv4w6FjHrY6iZc1oqaH7PjVJLQnvO/vqVswIo9dmLTBFYveETFnnwhDXLQFi8fXB
X-Gm-Gg: AZuq6aJodvpFAfS4wLebUW6mfbA9AQm9dmBdIi4KXxk1j7a4P5YFBI5gbd6F7PP/Obr
	dxLkcgwQPT4PDFYX/Xc3owNTswmcaLuK1qi5m4HzNyLqFou2MYzflniJBwsGfZYkKTniscBWieE
	4Sez58dDHP5YxHL1ex3/2BFC/xptL7uaZguwSyKiKi9aZOaApOth0iyJIL7k0fqRexQZh6JOKQ6
	2obLtVuL5T3QlK1Dc54TJpaRS1BrQW6SjSfiF1pJ5mo87rLgpSb6xSdHRef2ClKHGQvjCMEPKXP
	RZ9Q1f3FWAdvowI5GecS6Lg3Q25eK9P/RA6cXOSKbU1AFkBjwSrSE6Cn8/mRMDJVEszRwp2qnhP
	rspt87aXGQM+Nq7NADlETxRfEU/X9T+3WgZpG9e19i1LLzapYT1pooqYtgh+6PtIIpjs=
X-Received: by 2002:a05:6102:4186:b0:5ec:95a0:6aac with SMTP id ada2fe7eead31-5f87e834e64mr1047586137.4.1769696258921;
        Thu, 29 Jan 2026 06:17:38 -0800 (PST)
X-Received: by 2002:a05:6102:4186:b0:5ec:95a0:6aac with SMTP id ada2fe7eead31-5f87e834e64mr1047572137.4.1769696258373;
        Thu, 29 Jan 2026 06:17:38 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074b2d89sm1145142e87.49.2026.01.29.06.17.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 06:17:37 -0800 (PST)
Message-ID: <42c1c820-f235-4d7b-af58-c0b9a4d331cb@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 15:17:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] mtd: devices: Qualcomm SCM storage support
To: Junhao Xie <bigfoot@radxa.com>,
        Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mtd@lists.infradead.org, Xilin Wu <sophon@radxa.com>
References: <20260126-scm-storage-v2-v2-0-fa045c7e7699@radxa.com>
 <dd89949a-11da-4c57-9b1a-2fba181988cc@oss.qualcomm.com>
 <2397C90D8A633438+88e8956b-5753-4842-a1c7-b0f6a78580c1@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2397C90D8A633438+88e8956b-5753-4842-a1c7-b0f6a78580c1@radxa.com>
X-Authority-Analysis: v=2.4 cv=d7T4CBjE c=1 sm=1 tr=0 ts=697b6c03 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KV2aPqcVs2_3Sbi7RCIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: UsZdlKjGa_Ow5gOhtAh-kow-zUoYJGoN
X-Proofpoint-ORIG-GUID: UsZdlKjGa_Ow5gOhtAh-kow-zUoYJGoN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA5NyBTYWx0ZWRfX66eVzgUXbSZo
 6PgYXWnWvAnc6gN8bFsYFwW9kagtpp9oW6R34ahVMwoMSZUstSIWaBYhXldoduZceXdDVtWM4h+
 ImVUO/kP06BRNx1YgTWbV7lRG3ZCERBGLGCrkHjagxTTAfRD16cAD0C7Amk/UKWcHQs1b3aVCby
 n4abjycrcx0ogci9UjJbkhHWT/1mSENX5fUAA1IM6Vo6XtPZojkBowgzlseGWEHFmX4d3w+4cT9
 0UbESJ7S42fAGznBjzPDLr/lm+VgF0unCXaqkEZbtEsMmC9dqbYKnKRRyMWVFiuVPYR5ck4k19n
 eg4lYJ94DEmgNheEPIHbhvMkb6uSycE3DdRIqk59kFjLNA94lxigk2+Nqn6TfDZHSoPRydahTFM
 4MoYB3s0UyqBONtAPzQIUol30FYvmeb4IWJV00PTAX4W9OVYWSy5r5iRy0S1/bSWFcjoOJgM+YB
 GqHGNT8VTkOJHYQ9FMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 adultscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601290097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_061743_109785_0781FF5F 
X-CRM114-Status: GOOD (  26.11  )
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

T24gMS8yOS8yNiAxOjQ3IFBNLCBKdW5oYW8gWGllIHdyb3RlOgo+IE9uIDIwMjYvMS8yOSA1OjQz
LCBUcmlsb2sgU29uaSB3cm90ZToKPiAKPj4gT24gMS8yNi8yMDI2IDM6NDQgQU0sIEp1bmhhbyBY
aWUgd3JvdGU6Cj4+PiBUaGlzIHBhdGNoIHNlcmllcyBhZGRzIHN1cHBvcnQgZm9yIGFjY2Vzc2lu
ZyBzdG9yYWdlIGRldmljZXMgbWFuYWdlZCBieQo+Pj4gUXVhbGNvbW0gVHJ1c3Rab25lIGZpcm13
YXJlIHZpYSBTQ00gKFNlY3VyZSBDaGFubmVsIE1hbmFnZXIpIGJ5Cj4+PiBpbnRyb2R1Y2luZyBh
IG5ldyBNVEQgZHJpdmVyLgo+Pj4KPj4+IE9uIHNvbWUgUXVhbGNvbW0gcGxhdGZvcm1zLCBmaXJt
d2FyZSBvciBCSU9TLXJlbGF0ZWQgc3RvcmFnZSAodHlwaWNhbGx5Cj4+PiBTUEkgTk9SIGZsYXNo
KSBpcyBub3QgZGlyZWN0bHkgYWNjZXNzaWJsZSBmcm9tIHRoZSBub24tc2VjdXJlIHdvcmxkLgo+
Pj4gQWxsIHJlYWQsIHdyaXRlLCBhbmQgZXJhc2Ugb3BlcmF0aW9ucyBtdXN0IGJlIHBlcmZvcm1l
ZCB0aHJvdWdoIFNDTQo+Pj4gaW50ZXJmYWNlcyBwcm92aWRlZCBieSB0aGUgc2VjdXJlIGZpcm13
YXJlLiBBcyBhIHJlc3VsdCwgZXhpc3RpbmcgTVRECj4+PiBTUEkgTk9SIGRyaXZlcnMgY2Fubm90
IGJlIHVzZWQgZGlyZWN0bHkgb24gdGhlc2Ugc3lzdGVtcy4KPj4+Cj4+PiBUaGlzIHNlcmllcyBp
bnRyb2R1Y2VzIGEgbmV3IE1URCBkZXZpY2UgZHJpdmVyIHRoYXQgZXhwb3NlcyBzdWNoCj4+PiBm
aXJtd2FyZS1tYW5hZ2VkIHN0b3JhZ2UgYXMgYSBzdGFuZGFyZCBNVEQgZGV2aWNlIGluIHRoZSBM
aW51eCBrZXJuZWwuCj4+PiBUaGUgZHJpdmVyIGlzIGJ1aWx0IG9uIHRvcCBvZiB0aGUgZXhpc3Rp
bmcgUXVhbGNvbW0gU0NNIGluZnJhc3RydWN0dXJlCj4+PiBhbmQgaW50ZWdyYXRlcyB3aXRoIHRo
ZSBNVEQgc3Vic3lzdGVtIHRvIHByb3ZpZGUgYSB1bmlmb3JtIGludGVyZmFjZSB0bwo+Pj4gdXNl
cnNwYWNlLgo+Pj4KPj4+IFRoaXMgZHJpdmVyIGhhcyBiZWVuIHRlc3RlZCBvbiBSYWR4YSBEcmFn
b24gUTZBLCBiYXNlZCBvbiB0aGUgUXVhbGNvbW0KPj4+IFFDUzY0OTAgU29DLCB3aXRoIGEgV2lu
Ym9uZCBXMjVRMjU2SldQSVEgU1BJIE5PUiBmbGFzaCBkZXZpY2UuCj4+Pgo+Pj4gTm90ZSB0aGF0
IHRoaXMgcGxhdGZvcm0gcHJldmlvdXNseSB1c2VkIHRoZSBzdGFuZGFyZCBRdWFsY29tbSBMaW51
eAo+Pj4gZmlybXdhcmUsIHdoaWNoIGFsbG93ZWQgZGlyZWN0IGFjY2VzcyB0byB0aGUgUVNQSSBj
b250cm9sbGVyIHdpdGhvdXQKPj4+IG5lZWRpbmcgdGhpcyBkcml2ZXIuIEhvd2V2ZXIsIHdlIHBs
YW4gdG8gbWlncmF0ZSB0byBhIFdpbmRvd3MtY29tcGF0aWJsZQo+Pj4gZmlybXdhcmUgd2hpY2gg
aXMgbW9yZSBmZWF0dXJlLWNvbXBsZXRlIGJ1dCByZXN0cmljdHMgZGlyZWN0IGFjY2Vzcy4KPj4+
IERldmljZSB0cmVlIGNoYW5nZXMgZm9yIHRoaXMgdHJhbnNpdGlvbiB3aWxsIGJlIHNlbnQgc2Vw
YXJhdGVseS4KPj4+Cj4+PiBJZiBrZXJuZWwgYm9vdHMgd2l0aCBFTDIsIGFjY2VzcyB0byB0aGUg
U0NNIHN0b3JhZ2Ugd2lsbCBiZSBkZW5pZWQuIFRoaXMKPj4+IG5lZWRzIG1vcmUgaW52ZXN0aWdh
dGlvbi4KPj4gU28geW91IHBsYW4gdG8gZW5hYmxlIHRoaXMgZHJpdmVyIG9ubHkgdy8gdGhlIEd1
bnlhaCBiYXNlZCBjb25maWd1cmF0aW9uCj4+IGFuZCBkaXNhYmxlIGZvciB0aGUgS1ZNIG9uZSB0
aHJvdWdoIHRoZSBkZXZpY2V0cmVlIG92ZXJsYXkgPyBJIGp1c3QKPj4gZG9uJ3Qgd2FudCB0byBi
cmVhayB0aGUgS1ZNIGJvb3QgZmxvdyBvbiBvdGhlciBwbGF0Zm9ybXMgc3VwcG9ydGluZwo+PiBx
Y3M2NDkwLgo+IAo+IE9uIHN5c3RlbXMgYm9vdGVkIHdpdGggRUwyL0tWTSwgdGhlIFNDTSBzdG9y
YWdlIEdFVF9JTkZPIGNhbGwgY3VycmVudGx5Cj4gcmV0dXJucyAtRUlOVkFMLiBJZiBhIHBsYXRm
b3JtIGRvZXMgbm90IHN1cHBvcnQgU1BJLU5PUiBvciBTQ00gc3RvcmFnZSwKPiBfX3Fjb21fc2Nt
X2lzX2NhbGxfYXZhaWxhYmxlKCkgd2lsbCBjYXVzZSB0aGUgaW5pdGlhbGl6YXRpb24gdG8gYmFp
bCBvdXQgZWFybHkuCj4gCj4gVGhlcmUgaXMgbm8gRFQtYmFzZWQgZW5hYmxlL2Rpc2FibGUgbWVj
aGFuaXNtLCBhbmQgdGhpcyBzaG91bGQgbm90IGFmZmVjdAo+IEtWTSBib290IGZsb3cgb24gb3Ro
ZXIgcGxhdGZvcm1zLgo+IAo+IE90aGVyIFFDUzY0OTAgTEUgcGxhdGZvcm1zIGRvIG5vdCBzdXBw
b3J0IFNDTSBzdG9yYWdlLCBhcyB0aGUgTEUgZmlybXdhcmUKPiBkb2VzIG5vdCBzdXBwb3J0IFNQ
SS1OT1IgYm9vdC4gUmFkeGEgRHJhZ29uIFE2QSB1c2VzIFdQIGZpcm13YXJlIGFuZCBib290cwo+
IGZyb20gU1BJLU5PUi4KPiAKPiBUaGUgcm9vdCBjYXVzZSBvZiBTQ00gc3RvcmFnZSBiZWluZyB1
bmF2YWlsYWJsZSB1bmRlciBFTDIvS1ZNIGlzIHN0aWxsIHVuZGVyCj4gaW52ZXN0aWdhdGlvbi4K
PiAKPiBbwqAgwqAgMC43NzAxMjRdIHFjb21fc2NtOiBjb252ZW50aW9uOiBzbWMgYXJtIDY0Cj4g
W8KgIMKgIDAuNzc1MDA1XSBxY29tX3NjbSBmaXJtd2FyZTpzY206IHFzZWVjb206IGZvdW5kIHFz
ZWVjb20gd2l0aCB2ZXJzaW9uIDB4MTQwMjAwMAo+IFvCoCDCoCAwLjc4Mjk5MF0gcWNvbV9zY20g
ZmlybXdhcmU6c2NtOiBzY20gc3RvcmFnZSBnZXQgaW5mbyBmYWlsZWQ6IC0yMgo+IFvCoCDCoCAw
Ljk5OTA5NV0gcWNvbV9xc2VlY29tIHFjb21fcXNlZWNvbTogc2V0dGluZyB1cCBjbGllbnQgZm9y
IHFjb20udHoudWVmaXNlY2FwcAoKSSB0aGluayB5b3UgbmVlZCB0byBjcmVhdGUgYSBzaG1icmlk
Z2Ugd2hlbiBydW5uaW5nIHdpdGhvdXQgZ3VueWFoLCBzZWUKZS5nLgoKNGE3ZDZhNzhmYmM2ICgi
ZmlybXdhcmU6IHFjb21fc2NtOiBBZGQgYSBwcmVwIHZlcnNpb24gb2YgYXV0aF9hbmRfcmVzZXQg
ZnVuY3Rpb24iKQoKd2hlcmUgdGhlIG1lbW9yeSBpcyBicmlkZ2VkIHJpZ2h0IGJlZm9yZSB0aGUg
Y2FsbC4gV2l0aG91dCBrbm93aW5nIGFueQpiZXR0ZXIgSSB3b3VsZCBndWVzc3RpbWF0ZSB5b3Ug
bWF5IG5lZWQgdG8gcWNvbV90emFsbG9jICh3aGljaCBkb2VzIHRoYXQKdW5kZXIgdGhlIGhvb2Qp
IHRoZSAnc3RydWN0IHFjb21fc2NtX3N0b3JhZ2VfaW5mbyBpbmZvJyB3aGljaCB5b3UgcGFzcwp0
byB0aGF0IGZ1bmMgaW4gcWNvbV9zY21fc3RvcmFnZV9pbml0KCkKCktvbnJhZAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
