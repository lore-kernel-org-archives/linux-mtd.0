Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06134CD8CA4
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Jun 2026 09:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6HO2wS8gz6TOQup1Lk5110XjKhopDu39vVbBi10INgU=; b=uUYZJlyD7mml5M
	kjUqO/hSGG76qPFhDYRdS3lo/t45U+FGHUQYhdhvN1HdXXuCrf9RmMJSzTeTYzrCROz6bMWShDbgF
	LgvCEIOGj123uQpPr5D4N5BrvyFrml2QB7B+es5UhVRfcmuPdAemDXB1rq+V5p0PdcshImAZtUKrF
	FxoXjbWsu298BrOx8i08WsWhvJ4o8Fc4O/7f3wy9oak8j4D7zzzpvMP3MFmASpuAKswc/YF3VVZfx
	W1UEyB6Teu9mommNHXnkpiPE1TPgrtps8mjzt5QppsAUv62L0dHyg5utSRGMuDZimVNrDJvStO72Q
	T55ks9it6wt+qYK3+EWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsKu-000000058O9-08vF;
	Tue, 09 Jun 2026 09:01:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsKo-000000058NA-3wBd
	for linux-mtd@lists.infradead.org;
	Tue, 09 Jun 2026 09:01:27 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65985R9T006852
	for <linux-mtd@lists.infradead.org>; Tue, 9 Jun 2026 09:01:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fhdJx7tJt2646CGv9afkB55pu+a1qaCKdEr9oqg6cXM=; b=eDhxZMh4nvqtE5ZR
	2dhGU3psVi2PrdczaAozi5upPCNeF5tl5KGWASfUYD1MaBFnP75IBv3yQsbtlU8w
	bjTJDcP11C3R7lce0XzyGKTtqjF45UgWT74XOgZxak6tj58Fo7wBr3wVJFyjKl0w
	JIulpIFh69whmz5l6DBbeKeH3i2uCM+6x/SpQFSoe1ZRXZnLBTq0tyoenFpWl2t/
	hqmP+pNf14ZBoP5Zt4TrdIX864vOY5kIcBczgdOvVx682WTUlar9pfwdM3Exyclv
	eHPIJbi2udR1/XDsIaxA4vs8/k0RbYgD51nK2HscDIuDyx9si1Y2WOv1Q+dIAsHK
	EmuzmQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epf0sr7ax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Tue, 09 Jun 2026 09:01:22 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9639706a3f5so147290241.1
        for <linux-mtd@lists.infradead.org>; Tue, 09 Jun 2026 02:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780995681; x=1781600481; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fhdJx7tJt2646CGv9afkB55pu+a1qaCKdEr9oqg6cXM=;
        b=SQPfEZUhT6UyTbBH3mSonULglI+x1h6JYGYWXuYP+MMKNGyqp90OAW5fXfo9GhlKJ4
         0Fojv8xY54Fwb0lRhgu8lDElHHOiVmxv7oYVbNvQAh7glr7uB5fvPNYtlRoxlgWUEKt1
         sNBs1v3HeaVIF4CdZCB0lCdMfdDoVGgiQy+Z/e6djE0vnJdQ3QQaOQEP4Zivc9QzrjfL
         2XzOs7gPYIB6EhfCi7UZJcOMS6RT2hAK/Nocnvr6TfMKDejUAQI06bHUxRAsbIMHTDDn
         WQTFjJMpMO9BKj6bvjMjBgbZ5Qx0wmSzzBTyiJZYC451mOZHQUqXJDfP2flKyCCrlT5/
         kFhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780995681; x=1781600481;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fhdJx7tJt2646CGv9afkB55pu+a1qaCKdEr9oqg6cXM=;
        b=qQvOhts+RvRo7wA0kLU49Jjemlr8y6yovcH63a0aI+2Cu92ccNqW6Uy38VTn1g2ZyZ
         2zyq7WGRj1zA23RhFsMGDU/ujVNk3Gq3Tx+hjZuslWZvluswYJbE0kiUQx/UnlOlrvmx
         EXGoCna+09CmNU5F6tmevjSqlTyv/PCcGa0+s3DnAW+4QmCEgndGP7jbf4bzyE7y56Wu
         Q1+62qnACPSzNQTEPXqYVcYCVSxkprDH4aJZ8axD117k2/eDE2IZs/AKmqjUd2/lL4VL
         ZYuxa9BWU7G+0GYgXcn8m0aVKEFDXxVumh4O0lpWg97F0AMCXLAYmIiyabRnegENljjU
         zSkQ==
X-Forwarded-Encrypted: i=1; AFNElJ+7tRq0z6kqXhBpmB+FNs3s+6d9fPjSltF5MlyJZDWq4tcqyztmzKX30tFB3vONxTn2Q4xzExFRkoA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8HXce7X/meK78erB0Eb/A3ZrIbYs645hZcSOqeovEEEXk1hCV
	ByI/P7Rl9IfPQ7sCgvUnXUJwkUvu4M87unIuxewjlmotJMjHhzeU0+GGwu+Tjl50zpw1tqXP7Sz
	dcRbbbHFH1g5HCddGiDHvghO1dDUrMukqX+a0syc6Gz5df3Mfjgiyl+ZbLoJKnR+cx8vu
X-Gm-Gg: Acq92OHfS4bsDBIHEYSHItUDmRTbCSGyuYZfzz1Rd7HWk6T6WeaRme1qfj2DhDI2U3O
	xT+/KaFFjbDz7toKhJ6H7u4vv5JIqLxsTdd3Q+E5CsHN5soaWp7W5kOmsAarUj0qVjLg2gzf+fK
	lcIcs9zaC5RZAqWTUYD0H9995qVXD72HYYyeXeZ9JJTesJ0Cy9atDo7MzHIr5o+mIHQE3vKR7bO
	+e1p2BR97jrlQZmd/5zUrGlB/q51i4HFQ/MqMrYGt8G+7AD9bWQ8zrNZe1NgChdso3DzvOiHtTf
	TXGJ+MxQ0xT/VddZefogJmEevJB3x+Zz8hVntr7jMElqI03CgbjjZauadGavjTqfu/eluhwu9mA
	X9aQKsP3or/vkFlqXMnTN5dcdqolZRxodTY63eCFfYbrAK7OP8LyqoItK
X-Received: by 2002:a05:6102:441a:b0:634:b9a9:c082 with SMTP id ada2fe7eead31-6fefa60bb05mr3021108137.3.1780995681273;
        Tue, 09 Jun 2026 02:01:21 -0700 (PDT)
X-Received: by 2002:a05:6102:441a:b0:634:b9a9:c082 with SMTP id ada2fe7eead31-6fefa60bb05mr3021075137.3.1780995680842;
        Tue, 09 Jun 2026 02:01:20 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65b55d81sm8352120a12.27.2026.06.09.02.01.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 02:01:20 -0700 (PDT)
Message-ID: <35c7513b-6aea-48cf-aea8-da8604616601@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 11:01:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: mtd: qcom,nandc: Add MDM9607 QPIC NAND
 controller
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Richard Weinberger
 <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
 <20260608-qcom-nandc-mdm9607-v1-1-4639a0492274@linaro.org>
 <20260609-quirky-rat-of-criticism-aea1fe@quoll> <87mrx4b164.fsf@bootlin.com>
 <aifKejyF7n6QsI9h@linaro.org>
 <a6b17b9a-f639-4a7f-adb6-d0c9dbd31e68@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <a6b17b9a-f639-4a7f-adb6-d0c9dbd31e68@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA4MyBTYWx0ZWRfXyNnVQDZjDSzn
 heMoxehXQpeSEPYeeRqw0QY/f6GfHu6w7P/vLgPKmbBcVa7om3QpbgGzb9mKik9Ym7179ehnZOv
 1jGJfwcBiDbLqUz9NAwID0V+AWZKGgSwpo5K2gAOeYCx1523FjjeDiAy29qSiYoRjeMbYKm2Cif
 xKMtITJgNsjFzFOM6CCssnmwYkc1PWJhthEROnUeiwo8z39vLEyO8hzAFQkQ7jo6prjeuEdnmcr
 TE7OOpSA2Ao7BueIZLwZKBPlixw+pI4BvIpCjnl7knxxeSme65rdfO78+UfDgn8+rjUXS+hfsHi
 lk1D1chJloVitRBPxDM2UGLsB05CYnI+SeZepZ8v+LzdsJJ27gb5vfrTWAJlV1p0kOrEI6SZFbu
 LrJ7KfQ+v8Lx+Xklyyhkt1YvfibWEV10ER01kjRWZYt12/26WFCtoikASZV7lc3/zvMDdEltwnq
 sT/cl1JLzcWRZx3pPPA==
X-Proofpoint-ORIG-GUID: nK1AzMj5i2kze4Ca7tEtV0pHFNTcL7ET
X-Proofpoint-GUID: nK1AzMj5i2kze4Ca7tEtV0pHFNTcL7ET
X-Authority-Analysis: v=2.4 cv=GeonWwXL c=1 sm=1 tr=0 ts=6a27d662 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=f2xlcQsDh-InlZPZBw4A:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1011 spamscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_020125_386359_87C0102D 
X-CRM114-Status: GOOD (  19.57  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 6/9/26 10:55 AM, Konrad Dybcio wrote:
> On 6/9/26 10:10 AM, Stephan Gerhold wrote:
>> On Tue, Jun 09, 2026 at 09:52:51AM +0200, Miquel Raynal wrote:
>>>>> On MDM9607, there is only a single controllable clock for the NAND
>>>>> controller (RPM_SMD_QPIC_CLK). The same situation also applies e.g. for
>>>>> qcom,sdx55-nand, but the corresponding device tree (qcom-sdx55.dtsi) works
>>>>> around that by assigning a dummy clock (&nand_clk_dummy) to the second
>>>>> clock ("aon") that is required by the dt-bindings. This is not really
>>>>> useful, so avoid doing that for new platforms by excluding the second "aon"
>>>>> clock entry in the dt-bindings.
>>>>
>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>
>>> What is the problem in giving twice the same clock? If this is what is
>>> done in the hardware routing, I do not see the reason for more
>>> complexity in the binding?
>>>
>>
>> I had that in my first draft for this series, but this would be wrong
>> IMO. I suspect there is no QPIC/NAND related "aon" (always-on) clock on
>> this platform at all. I'm not sure about MDM9607 in particular (maybe
>> someone from Qualcomm can confirm), but a similar platform I was looking
>> into at some point actually had *3* separate clocks for QPIC in the
>> hardware and none of them were called "aon" ...
> 
> gcc_qpic_ahb_clk (50/100/133.(3) MHz sourced from PCNoC_bfdcd_clk_src)
> gcc_qpic_clk (likewise, sourced from qpic_clk_src which is sourced
> from GPLLs)
> gcc_qpic_system_clk (32 KHz)
> 
> No clock containing the substring 'aon' in its name on this platform

Looking at SDX65, perhaps the 32 Khz clock is the "aon" one after all..
The NAND documentation says

CC_QPIC_SYSTEM_CLK - Always-on timeout clock (32 KHz)

Konrad

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
