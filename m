Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6348CD6E79
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Jun 2026 08:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ksqimvAjuxPy78lwm0LqvT4kc60uHbAglgGWG1j4XMM=; b=P6VBTpO1lRS5oL
	tiqS/eif1lZUC3fte9enxjdtyxtwE0VoEumGA0KWLOCzZxVVFgOd1NvhI9CzSDGZIh8zhtasi6Yxj
	aiPA6ydlFaeJw1BN2rl9iFDSO1QB/zZd1swfmA11im6yEy3ZGa1tiocdJaCznqtRjBt48EEbKwGfY
	kyMrC5DhtrVa/Diew9VrBfUC3GbJzH7/PntRuLtbs6Qr19syJ3FxeCpw5nl1SPm9NU548euAUYO3e
	7VeIiO+tESEKdBvzBWEyia+u9h+KQ9ZeLETunkMtA8nGrB3RwxqXEH3JFRn5QRcMl8+mcU/c7hcMK
	SZUkXMnqsCKH1/89ejBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsFX-000000057Lm-2jhE;
	Tue, 09 Jun 2026 08:55:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsFU-000000057Kh-3Ek2
	for linux-mtd@lists.infradead.org;
	Tue, 09 Jun 2026 08:55:53 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65985VXN006918
	for <linux-mtd@lists.infradead.org>; Tue, 9 Jun 2026 08:55:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OqhRNzlXQzrgamoipiClCQMj6Wo+WVMbjmsBPJ43o80=; b=KPcuKoipBodtdguf
	CX2hoa08zgX8vWNmwsyejdGx/JV+I2HBFfpOHdqEliTCpKFWVkGHQFMoqWWTc7+Q
	xaKeRKM5jn8K6ddYb5YBioAEUlEA/wlYCfxlKdguWW9OX5sYRVZjtMKL/UQjOSPP
	Mc54ITn9nwu7Q4Ce7GpBolUJEWdQCNUpBewA5Oox/YLL/tZVT0H2OuBoaPB/t8uE
	HewA0F6/ToLs5q4yhNTsRXHF6FuCnrISW5N3+DnrwNSyRpGPW7xmwKxMPv1wwrUW
	R2wusIKtwGDPRUcOKWHyhN5/qRby89Jg1+sg4+ggTfHc58vDtBKZIfQ7LoqqZBuG
	cL0ZTA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epf0sr6g6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Tue, 09 Jun 2026 08:55:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51780e3ca44so10496331cf.3
        for <linux-mtd@lists.infradead.org>; Tue, 09 Jun 2026 01:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780995351; x=1781600151; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OqhRNzlXQzrgamoipiClCQMj6Wo+WVMbjmsBPJ43o80=;
        b=hcygMLjkjb2BBwrEqDjw1E0M9bw1Z/RXklQGg5nWBxfsu8qDXLMj0QC0ECG5O2dA1a
         iwjcJ18iuiFL36zePpVCuP+oFb+/bBbXUBh/ZxhgfZxYnRQw0xeNFiFuZnFyq/BtHGi2
         OpD5xj1ryjbtUZFrp4r+GMaBFuK5O12/R5ccasQUwyz/7/vwgsauJ8dw/QPwjVvT/flV
         mcE/4uV+zHNoVEsia4eDDoZ92sJgC50o8fl0Elk+zVvQ83LscTeo56EjHx9A9wzz4hby
         1P03W51Kae3+o0pLItcBtjpFdvv9BPgoo+xZwO0X/yRLJRkk6zZMDljGAROsWj5POSWu
         ZzeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780995351; x=1781600151;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OqhRNzlXQzrgamoipiClCQMj6Wo+WVMbjmsBPJ43o80=;
        b=ZE1BpZlT4Cv1jlBJNX9DbLS/4hx7EVJc4nVu/HdRxCEiDIJko6unUjV0TgnDl+IQgA
         9Pj7d5s6bvzzhGeCL39M7C/xcddZal2HzNxlY8hFIPINSiUkrznxNOd5ezqBbwNwhgw8
         zQX0lJIDBVWm4CjacEm3g5fD7A3sKrYWpHEyrUPVjf5eLd4Ix46gZQVUO8N0vYFPReOq
         45Z/l17FyZ7/b65zIJR+K0PL5/Pt9Kf9Tznx2muLWhtA3ahM6lKQCBnWhCIQDec3auQ+
         FRPwff5DQFej5Eapg6nwV83xafdU141kFDDL4CWd0uOavVvQg0r9IMzA11FYJmy6Mudt
         +DFg==
X-Forwarded-Encrypted: i=1; AFNElJ8WB31yD0FLoQsB09ci51GM77SRYddyYVa+YXFdg5k2LixL16V2ob5lsSjEyIP3DJt8qddlqj48zUA=@lists.infradead.org
X-Gm-Message-State: AOJu0YyU36JTC65EcG0qqF2R2yyxSue0CJna1E/j1OPm0G+ErkQvIDPV
	RtTWQpmtDAzmaYK8oYOfVW0V+vZK9J/wozzSaDa+5dmJcNG0mnXDkX3dwWj2MKZVRo1bG8x53Oe
	GIQAdGEEtemmJQlHdCC7a6pqK6DISiVzpzdvl3OE9h8ZzVXrGdnfJS7OnwqHrUeB2cY+T
X-Gm-Gg: Acq92OFubaz6wwccifmSRlZOAb5v/MN/stjiNo4OJsnVWC6h+pKqlJ7F75b6wSQRxeP
	AfUTBPuL97IiZjYdQ1FnKjsr7NHBlsJB+pA/K6L06v+rxfeXCyhZKO317HM4VfIaOsHmmVBTx6q
	QqQSTbtUDVZVEnf9eg8KidvYaAzqxe9n9PpMLUhL0r84taGs0HTyk0mJkW4DCC1Lv4MAbOgzANA
	3cgfSV9ptbXgPH1QKG6zSjOc4DmU9uxAGJ2XQsbOY6QFpZ/aPVQzFvCUuH8KKZBZYFsToF1QW6q
	P3NovBtZpzKt/EMx2HpvdP674JRery6h/94AYuGCl4WyAl1ZTX/o+Oxk5iL5mQ1Antx07bSEIcj
	AZ0u5RXSf46hhB6CnEAmqprRsmIVrBrxeWIhc5lcOn3SEe8ECWWHyY1/P
X-Received: by 2002:a05:622a:1b1a:b0:517:6b29:348b with SMTP id d75a77b69052e-51795c59f49mr163385691cf.8.1780995351309;
        Tue, 09 Jun 2026 01:55:51 -0700 (PDT)
X-Received: by 2002:a05:622a:1b1a:b0:517:6b29:348b with SMTP id d75a77b69052e-51795c59f49mr163385501cf.8.1780995350725;
        Tue, 09 Jun 2026 01:55:50 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e6585154dsm8180974a12.15.2026.06.09.01.55.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 01:55:49 -0700 (PDT)
Message-ID: <a6b17b9a-f639-4a7f-adb6-d0c9dbd31e68@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 10:55:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: mtd: qcom,nandc: Add MDM9607 QPIC NAND
 controller
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aifKejyF7n6QsI9h@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA4MiBTYWx0ZWRfX4F4Gu55ecW/e
 SeJ3tEJgXncjHheE8cLEw3n767VrMohnEZznuS1s2fOHDAsjH0Rg/VTmrtzyYBi0NjhkBmRdPCe
 XUUbLTWcfljxaSDnM37lJK/QbWGizse61x/XnHKELibgByfXvXfityecw9VzLAe2Kj96QNX0hAk
 J5cAG12ZtYjSVCclV+Y9tYIQF1xGCm7JPfQN2IXoTMJ2ywEVeaFoayg6NCqrqTrTfzUIofxWrvd
 wSvTiSICI9qEKGfPd1mV6OKEi1GQEBOepIFTYRAAIyAG9Q1y1qFgvGUgOLcOXDcc25JEay9qAcB
 +20hDqubosz42ypFR0HF5bN2gxOBaXSKpZVcmnQPLf0wWpLq4HFDJINW3+9PNfz5n6imXfXg9Yx
 BTW7dV9C/+B2FjWjnmBUDISsbFhydOinR8qPpxfjs41YaHb4TfcUzQF4DiXxvJDaXx/iUm4I79W
 6CBwuxuu2Ja8SAvI7wg==
X-Proofpoint-ORIG-GUID: 3aEgy_GDEvOwAT1juKTSTEldqaRRd4DU
X-Proofpoint-GUID: 3aEgy_GDEvOwAT1juKTSTEldqaRRd4DU
X-Authority-Analysis: v=2.4 cv=GeonWwXL c=1 sm=1 tr=0 ts=6a27d518 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=dZUDpN5UoYg7q-ifSsMA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1011 spamscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_015552_819842_4281EF96 
X-CRM114-Status: GOOD (  21.14  )
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

On 6/9/26 10:10 AM, Stephan Gerhold wrote:
> On Tue, Jun 09, 2026 at 09:52:51AM +0200, Miquel Raynal wrote:
>>>> On MDM9607, there is only a single controllable clock for the NAND
>>>> controller (RPM_SMD_QPIC_CLK). The same situation also applies e.g. for
>>>> qcom,sdx55-nand, but the corresponding device tree (qcom-sdx55.dtsi) works
>>>> around that by assigning a dummy clock (&nand_clk_dummy) to the second
>>>> clock ("aon") that is required by the dt-bindings. This is not really
>>>> useful, so avoid doing that for new platforms by excluding the second "aon"
>>>> clock entry in the dt-bindings.
>>>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>
>> What is the problem in giving twice the same clock? If this is what is
>> done in the hardware routing, I do not see the reason for more
>> complexity in the binding?
>>
> 
> I had that in my first draft for this series, but this would be wrong
> IMO. I suspect there is no QPIC/NAND related "aon" (always-on) clock on
> this platform at all. I'm not sure about MDM9607 in particular (maybe
> someone from Qualcomm can confirm), but a similar platform I was looking
> into at some point actually had *3* separate clocks for QPIC in the
> hardware and none of them were called "aon" ...

gcc_qpic_ahb_clk (50/100/133.(3) MHz sourced from PCNoC_bfdcd_clk_src)
gcc_qpic_clk (likewise, sourced from qpic_clk_src which is sourced
from GPLLs)
gcc_qpic_system_clk (32 KHz)

No clock containing the substring 'aon' in its name on this platform

Konrad

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
