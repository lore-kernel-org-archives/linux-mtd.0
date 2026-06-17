Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E13DCD98E4
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Jun 2026 11:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hg/FVQo6vDKf3pI7pdKjrAz9Kr8hsk23x+GhXKjjIlg=; b=SaYv2ZYF08nhRp
	CWz7PWgiMcHPfPNB9fqCHhTN18bva4GjeHSZAMop884zjiYfd46jAttWv8CNMbaxJTF6R/op0QGBI
	cpnmr4H/gqmEJDIs36hv/XhbSN1Y0wPcBuLos8SGE/KI1rdTw7re9yqOit15/IrN+xjLPCr2gPU2/
	VdGmARIP+TyJRVAKOqb9JvVJZA8FchKU6+wgLAQKU1G9jPM2R09EaJUmpul+89U5c+GoH7vDQgGOX
	EvZhtsEnYfBvfyRv4TRyv99iB07FL/V2fWT6AXXaCnziBnyRdPFRchkEXiJHGfa2+5QjBkG1tp/mP
	SUcaaUMmu6XF81l+08gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZofW-0000000HFaC-1t1F;
	Wed, 17 Jun 2026 11:42:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZofS-0000000HFZr-1J24
	for linux-mtd@lists.infradead.org;
	Wed, 17 Jun 2026 11:42:51 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8UTvH3273500
	for <linux-mtd@lists.infradead.org>; Wed, 17 Jun 2026 11:42:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9liUbtKWEsHldUBAj2nodEC3byvwB9jG5nH8hNs5Qtg=; b=HXB4EA3SLJ91OwFt
	uyM0i9cJVZUdHNP0qEw/sglDmBR3qmXpBt28pz4CQ1gp+VFyaS8qyHv6o8KfM4yF
	+nGOByU3XWjrGeOuzlqAmGtBkBn9ez6/WwO70zYrLmzZsUu8PDIHykghAd2gCAV7
	hzTaNEL6CSrq8RdG2WjNW/Q2QuDBB9rkfUxp5b96f3zvOEmJ1HPUPXtoqgzP8SdM
	EnTk1lkVqNM2FXEOBKRFLrobyXJu+d8fMnH/etRHn7pYgp2F4YnIQmcOfDXgvanw
	zsoVyzY3gXgM966DCx1fJxGtWWWqwJYg3JuXmKMhEStB+8kwcF2fPmhl3untcpgp
	z4dC+w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euefbtwy2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Wed, 17 Jun 2026 11:42:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915732517cdso26269485a.2
        for <linux-mtd@lists.infradead.org>; Wed, 17 Jun 2026 04:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781696569; x=1782301369; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9liUbtKWEsHldUBAj2nodEC3byvwB9jG5nH8hNs5Qtg=;
        b=USKpCgMcI/HCQ6JvoF7kQV0aQAM92e3P2S+0PXkCfPi98abhCSjvhscuxh3S+dfBwd
         dCG5Cd2rqhfTa8QkMwqfmD/3NAFjuH+riJPA0uQMMBN91eSrzb4oas8JkTigS3kLgvyT
         ONjEAQpWMvmmfr3HaiXXSeIjoGWejXIm6UkvV9po8HPRcoSbEDmYC3KinGpy7Tr596xB
         mLCWOf/tisyjQFktzBubgz0cxAFJ9I2C4Cp3ORY8A2tL1irscJfmljEQ9+M8/A3IgF7w
         L76cVHT3VuKffnll2ckOBcyKm1AI3Adj8Xo+9098Joy5EwLLkuvIbRSuSUjuvBaEDyon
         88Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781696569; x=1782301369;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9liUbtKWEsHldUBAj2nodEC3byvwB9jG5nH8hNs5Qtg=;
        b=ohw/9ZMLqd3J0nUvh/PqMs6OIFl5QtDkz8Jt9rUWhxaZ0RvVYzbpxXIWiejnAgGTtB
         wv1vyi1ogRcuetoPhXkPWbGO9ddw0sQkyJyEtX/AouzKrRPSqK2coer2ksm9/ZuDkj7W
         hNF8IbBU2iqSb6QEO946u1EcmdbUBPzjcDnCXDiFJo8t8jAtcj9PAxQW1Nxz1B0awZuM
         ZnhT6MI+cgq5X3ZBMh7IYljC9qf8O8gPTLhSV6E2taPm27oyRUHD4rv4j+e7Y4HXrqEF
         IbBux65mwS2ontQ/c6HZiZ09Cp5x8EXV2pTf7jnqx2GzT8VD5Zvovo2kz7sVgtvIGbP2
         icRw==
X-Forwarded-Encrypted: i=1; AFNElJ9IpGPJaay3glLJ8aArGLOaV7WR86l52nJAPMPOJ93+bbgfq8Q53WY4jAQRHWZg0psskfFSdOuF8+4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5w5lJseMCQPu9LszTOJ/p+LZKKWZCVbpQcSJ6Nrin9EgyGVFw
	TRCdBekSVaqtd9uhhKqcpGr/Qu/KLkMIsAxsi8aJ5GeOYMtG74zn6/pNMfxHwjnSYKri8GwVM+Z
	/cc2wcPlt6DwJGt/5XcJpORSDiBx8NiWY8wneBAmjuUHf+hI48qTz16H57SEnKQj1NLqm
X-Gm-Gg: Acq92OF2NVNzNeywlExmRZuJsKpg+oIYxwU/jYJW+o2U08LcIuSTfyBASGKhEr/hVEh
	ZxfOOoipG2bk3j9sEVJgbb6p7RdVOrRTjqJ1TXHORbhcF0C3zKwc68yukPJnfosKAsKxv4huujw
	jzDfglmLSDZ3G1gYdHRif0J4tFr3ajyXYYajtT0407Nl3On9diwwqcOBKfrN4Xkn0FtfcV+r8l1
	sn2iD4UYipHazcWodC90SSsmMt/MF/nvej19WgRpkix9kZWi6yJ+7bvGTtI9W87I2fobK4JdAmG
	h2tYRb9z+mYkbgGQKpD2gzxYs7IwYb7uozFSgEhZ8udPQGEWyeJgcx1LYLlAJaAm6VqNC0SHdpE
	qnnsnCd6krYlZknxXb0FKUNwepNTvzunf1Rg=
X-Received: by 2002:a05:620a:d8b:b0:90f:7ce2:3019 with SMTP id af79cd13be357-91dbd008667mr273173685a.7.1781696568645;
        Wed, 17 Jun 2026 04:42:48 -0700 (PDT)
X-Received: by 2002:a05:620a:d8b:b0:90f:7ce2:3019 with SMTP id af79cd13be357-91dbd008667mr273170685a.7.1781696568174;
        Wed, 17 Jun 2026 04:42:48 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb44209f0sm788394666b.6.2026.06.17.04.42.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 04:42:47 -0700 (PDT)
Message-ID: <3ab3ccfc-1fdc-4176-b073-1f31e2c88c6a@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 13:42:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: mtd: qcom,nandc: Add MDM9607 QPIC NAND
 controller
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
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
 <35c7513b-6aea-48cf-aea8-da8604616601@oss.qualcomm.com>
 <aifX80IHM8TLQiV7@linaro.org> <87o6hk9i29.fsf@bootlin.com>
 <aifktn_s2qmg7MzI@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aifktn_s2qmg7MzI@linaro.org>
X-Proofpoint-GUID: NPHuEUZbR0VC_7j7gh5OCRjsZXsWdtYD
X-Authority-Analysis: v=2.4 cv=IeC3n2qa c=1 sm=1 tr=0 ts=6a328839 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=FDdbgDo1gx5wMt_MktwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDExMCBTYWx0ZWRfX4OQudTZqyAej
 WCDusGUPqkIVgLZEM48/r1ufZpr9/rWLrqGT7reVz/WwQyYr9ZsSqFnBoncTbIHv3WdBudvi0Em
 d1l0x8zkGw7E9I4OlvSZth94HfR2BcQ=
X-Proofpoint-ORIG-GUID: NPHuEUZbR0VC_7j7gh5OCRjsZXsWdtYD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDExMCBTYWx0ZWRfXzU82lqvJCF5+
 yk8xlD60s85EIhlxF7O5Ei2UJbBJIOBBY8ZZSqyPuEQG4ZY8W1Plw1XJz9wES2U100oUQ+oKvl2
 yS5yC3rsqZhW4kB5he4nsh1LyYQS/2fmMML2oSeL1/u2plUPQ9LE+m5OA/2+rvdTkoUfIzOikln
 M+DVJoHWKoNqOtFN7R/7Yoxp40UDtdZJOlCbaHFRoTshUHZqrV9N3gqGhL/xNHyntqY13UaHhR4
 q68rk8owRbUSX4nwvQDW4MFbtCT/vbLeJEvO0psiPb6DCCIM56L5/TUZnQfznbKgrW9pj6PT/ve
 4XeqhiudH7TWtOc/iTm9cvmqwM9QWQJOue6BjFNuIdXfmcnbqSP0YCCMZ1Dn4mR1ec/Gs0qldKW
 eqJTtnkCiHbXoTbIIWh3HEB+ZSZ6gzgluG/yoxxUu4U9JEjL5xQSJ6XCrWtW4zMOrlEDSEsEjLq
 oP9Q1Rp6aq6RQ8j2lZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_044250_366185_E37E15AF 
X-CRM114-Status: GOOD (  33.59  )
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

On 6/9/26 12:02 PM, Stephan Gerhold wrote:
> On Tue, Jun 09, 2026 at 11:30:54AM +0200, Miquel Raynal wrote:
>> On 09/06/2026 at 11:08:03 +02, Stephan Gerhold <stephan.gerhold@linaro.org> wrote:
>>
>>> On Tue, Jun 09, 2026 at 11:01:18AM +0200, Konrad Dybcio wrote:
>>>> On 6/9/26 10:55 AM, Konrad Dybcio wrote:
>>>>> On 6/9/26 10:10 AM, Stephan Gerhold wrote:
>>>>>> On Tue, Jun 09, 2026 at 09:52:51AM +0200, Miquel Raynal wrote:
>>>>>>>>> On MDM9607, there is only a single controllable clock for the NAND
>>>>>>>>> controller (RPM_SMD_QPIC_CLK). The same situation also applies e.g. for
>>>>>>>>> qcom,sdx55-nand, but the corresponding device tree (qcom-sdx55.dtsi) works
>>>>>>>>> around that by assigning a dummy clock (&nand_clk_dummy) to the second
>>>>>>>>> clock ("aon") that is required by the dt-bindings. This is not really
>>>>>>>>> useful, so avoid doing that for new platforms by excluding the second "aon"
>>>>>>>>> clock entry in the dt-bindings.
>>>>>>>>
>>>>>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>>>>>
>>>>>>> What is the problem in giving twice the same clock? If this is what is
>>>>>>> done in the hardware routing, I do not see the reason for more
>>>>>>> complexity in the binding?
>>>>>>>
>>>>>>
>>>>>> I had that in my first draft for this series, but this would be wrong
>>>>>> IMO. I suspect there is no QPIC/NAND related "aon" (always-on) clock on
>>>>>> this platform at all. I'm not sure about MDM9607 in particular (maybe
>>>>>> someone from Qualcomm can confirm), but a similar platform I was looking
>>>>>> into at some point actually had *3* separate clocks for QPIC in the
>>>>>> hardware and none of them were called "aon" ...
>>>>>
>>>>> gcc_qpic_ahb_clk (50/100/133.(3) MHz sourced from PCNoC_bfdcd_clk_src)
>>>>> gcc_qpic_clk (likewise, sourced from qpic_clk_src which is sourced
>>>>> from GPLLs)
>>>>> gcc_qpic_system_clk (32 KHz)
>>>>>
>>>>> No clock containing the substring 'aon' in its name on this platform
>>>>
>>>> Looking at SDX65, perhaps the 32 Khz clock is the "aon" one after all..
>>>> The NAND documentation says
>>>>
>>>> CC_QPIC_SYSTEM_CLK - Always-on timeout clock (32 KHz)
>>>>
>>>
>>> Thanks for looking this up.
>>>
>>> IMO, if we want to describe the actual hardware routing, we should
>>> describe all 3 clocks and assign all of them to RPM_SMD_QPIC_CLK for
>>> MDM9607).
>>
>> Sounds more accurate to me.
>>
>>> The resulting diff would be basically the same as this patch just
>>> inversed (3 clocks for MDM9607+SDX(?) and 2 clocks for the IPQ* SoCs.
>>
>> Diff would not be simpler but more accurate. So if we go for a
>> modification of the bindings, I would prefer that path.
>>
> 
> IMO the result wouldn't be much more accurate from the perspective of
> the kernel. If we assign RPM_SMD_QPIC_CLK to all 3 clocks we would be
> effectively saying "there is a single clock with a single rate that is
> sourcing 'core', 'ahb' and 'system'(/'aon')". But in reality, these are
> 3 separate clock domains with separate rates, as shown by Konrad above.
> 
> We could try defining dummy clocks like the &nand_clk_dummy in
> qcom-sdx55.dtsi, but this isn't very accurate either. Presumably, all of
> these clocks are toggled by RPM_SMD_QPIC_CLK. So if we define a dummy
> clock for 'ahb', then enabling that clock without also enabling the
> non-dummy 'core' (RPM_SMD_QPIC_CLK) will do nothing.

I can't find a good answer for what RPM_SMD_QPIC_CLK controls, maybe
+Mani or +Kathiravan know where to look

Konrad

> 
> At the end, the truth for the OS/kernel running on this hardware is that
> it can only see the 'core' clock (with the option to change its rate).
> All others are invisible, with no way to influence or check the status,
> so pretending that we have separate resources for them doesn't really
> make things more accurate in my opinion.
> 
> But yeah, let's leave the decision up to Krzysztof. I'm happy to change
> this patch as needed as long it works at the end. :-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
