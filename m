Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F2DAFA3750
	for <linux-mtd@archiver.kernel.org>; Sat,  3 Jan 2026 12:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bv/+lDyNa2j3exuaNk+jA6pP9ZShp9RvTFPo7G0GOnQ=; b=y+fd3eeZpQf7j+
	69d65Eb2FrL12SUJzxcwwnu446cVHBIDJnegxi7D9yHXMEhSAKK9mrrJm2/KT7x04hKbxMa1P1iC3
	pWKC3AcrHo6xdRerF73UOnOUrixoysmrx4z8aAAD7rEuOYH/ZwT1ERmNAGBjvSbwlnJfyiDWjZXdQ
	gbZOgbPj7arc8W40ozJWdDMUOPfgw7dqEIc4LrCtMu0BdYLxZukCBYz1f/06zaE9FBGYakvMMJaSx
	Uf3kOggZESaxO5BKWAqC3/J1YwO59Qe6KdfYrpTQU1QhEEFADIpn1fJ5Z72Acc9glQD2+sRY6TxqG
	AVRaFDaoPFiz6SmWVBKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc0u3-00000009M7i-0Zxc;
	Sat, 03 Jan 2026 12:38:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc0u0-00000009M6n-18vd
	for linux-mtd@lists.infradead.org;
	Sat, 03 Jan 2026 12:38:41 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6033JRo32929075
	for <linux-mtd@lists.infradead.org>; Sat, 3 Jan 2026 12:38:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l+JdtHXgUK5tKB6FrzQLQS8THzcimqUqNRaIrJsb3AE=; b=Yz0s4NPV57i1ZihS
	WOCh9vS4i7/YfLg4vzngSjQQ1FyRqWGUBiQKZyIGWY10ynGkAEJaykPWezSCvNGB
	U6tJdCNZ33wJDwNo94DYojZkqfLa9AbRJHjPDnPkFGO3fB3g5uldqXrrvIsG5ifR
	MKaHAJOmuSDZdlPQ2MjHbq2iOJeGudLZ1+uisV8O2isuXBh1Mz3vs8wl7MiJqV2x
	br5BOz0igBwnRYismktwJ6yAgbe1+mLs9F59cffpP3ZlMfoquHg5WmhTueAtiaup
	QorhF0lqH07OxZF6YuFEgRZKocVX2oFtnPBJ/8DaetIeMprqNHYpcUX9zqNuQ5ED
	eQd1aQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4betpxgkkt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Sat, 03 Jan 2026 12:38:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c1cffa1f2dso161199085a.1
        for <linux-mtd@lists.infradead.org>; Sat, 03 Jan 2026 04:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767443918; x=1768048718; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=l+JdtHXgUK5tKB6FrzQLQS8THzcimqUqNRaIrJsb3AE=;
        b=GVjo5QNubSYI9H6Zx54cG/kRqj1kRnqKIrFsbPVUEq9GtWkyQUDqeGglOjOOD63Upr
         0/yMOvocBAoYwbgsRcPDJZdv0WUE/CP47dXfdgwJYUGldSDkZWDrlFBGD7AFFhUjr1Jn
         Vn9if/QpjwG4SS1r3n3hi5Axsl0yjhZbVjvyJNnruUqJIDrBLvd1vd5NwyV8V4rFifmi
         G4AO81eaqd8vAZRQ916bttwN4t2PHdnZcXvzvYoUb6e/eRRNxu4F9XklbQ4F/WT5C4hQ
         tXvKHd1rWcRsi56MLBQSmbb37a7kRudf97Rp8OiDFd07cDnDEcZoP6XaHbCBB5ldcXfJ
         m/AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767443918; x=1768048718;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+JdtHXgUK5tKB6FrzQLQS8THzcimqUqNRaIrJsb3AE=;
        b=oFcDGt5AGPNsTZ0yywfyBJKs74/Ue9wN223FhViMP24gW3ZJpspjEKsCYYtX0rln6s
         QWV6R3KfWvFih1EXLLsyc0JUptqemNx3DuUIz/o3IvkTxBiRBI1z7jJZ/ePduecrhbpK
         QyDiT4jSJcZl6eQZTYxDpmBRrxSUz2nHSkNf6v5SM3UHTYNB5PZivp0xM8HzPjUz1/dO
         FUvAUYzXQRN9Hs2W7gGQRu8ieuG3HRauBAyC+DpuRRNiUztj8gX2wEq39lyliYhv8I6w
         gB98GrYobkp1JMTpA3O8e4KTcoMK5XM+DAzMEIc3p1gbOYppMaLRrtQDvwYAmeJtlseK
         53nA==
X-Forwarded-Encrypted: i=1; AJvYcCXDuraqb03G2rggQ8CHheGkvO+Pk3PRmtJNI/9j8I8q7ot52wEIAlPsMAYPJ2OWr5Tp74nfcpUvnxQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YyICMQVZQkTe5d/RLLVTE1ZcyfLpPRSuRxs0YKfrjpNKZMWr+to
	hfUCYta8jiRU7bp3mQs3BacI6t7xZsRVVradzU+pxyqqQKaxVvZH5Qv+Mv1Q1AhtmBOsVs3wOc+
	J24h4HJcjyFTbgkeYV+YZs0gJr+2W76lx3bNkiwSqabhekIZlj3589hc7IsoWnmw5baVH
X-Gm-Gg: AY/fxX6kck+t1w2u0uj3I3IwVVqDAy+sx2/0hbJMaBOk6QN0DIihUzKAftlTtHDepiv
	xsS3iCUeg7PHpxEy9HTIDT33szxnaeyDGE6BzYrhaOdQyEjFIhaVKKn9BdN8f7gpeiKp4xikc0d
	LVYLwpusSketSLc9WcKq3pzGO7cYE+ZWw5T2rgvyBKBNKClOqrL3K7w3m27SPlzHCoUrU6aro/6
	dQcDU+45sOWdDzjISZdzA6ryWjDBxRjPvHtvAvPqnNIIFtFmtHJnvncpbXq9VFoway6UJYUpljQ
	sczDA/PwMpoceLDM/ZEGSrQfHHxQ7d3UOA1MNSxFDGen3YcaWL4S1Yjm5npm86WLOBMUJMr2SqH
	OFIiWYNM0Kc8uCfuB1eVmHrHHo7Q4JDwDn0rIvw==
X-Received: by 2002:a05:622a:4d2:b0:4ee:1ec6:aeda with SMTP id d75a77b69052e-4ff472d336amr38212111cf.34.1767443918461;
        Sat, 03 Jan 2026 04:38:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+IkaHveGttYEdIkr4gj7LQeV3maNqbEyN4ReCR0MZJgN47NujIPEtRPhCrd9cYtAzFyFfbw==
X-Received: by 2002:a05:622a:4d2:b0:4ee:1ec6:aeda with SMTP id d75a77b69052e-4ff472d336amr38211751cf.34.1767443918005;
        Sat, 03 Jan 2026 04:38:38 -0800 (PST)
Received: from [192.168.1.29] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037a60551sm5054037966b.5.2026.01.03.04.38.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Jan 2026 04:38:37 -0800 (PST)
Message-ID: <e2e72720-5541-44cc-a000-c469d7873c06@oss.qualcomm.com>
Date: Sat, 3 Jan 2026 13:38:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] mtd: spi-nor: hisi-sfc: Simplify with scoped for each
 OF child loop
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
        Kamal Dasu <kamal.dasu@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Harvey Hunt <harveyhuntnexus@gmail.com>,
        Paul Cercueil
 <paul@crapouillou.net>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Michael Walle <mwalle@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-mtd@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev
References: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
 <20260102124927.64703-14-krzysztof.kozlowski@oss.qualcomm.com>
 <86a4yw87g8.fsf@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <86a4yw87g8.fsf@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAzMDExNCBTYWx0ZWRfX71dl6QHkfVO4
 Fcu1nDMOeoiZEmXeg68ev4N1goOBCwvx5ULcBYm/SJ2yQrnCafr9uQyZp9fOwmZskEW0af+zezn
 LPorhC1pkVjvbmFJLOX2kThjN/RvDwBt9Jl11TuIzS2db15pq6QwrVFS0K25xBfdwluUpz+tKfP
 5u8Hz7p3JvJ9rt7lO2i0yf2yCbrS+Cuz7eySlild7w/Utjq0c1sCHGmaaMAiLtb6CI++yMuOGJd
 8BbEg6V0vUgahGcw9E2SpXtQWd/SkLq3hWuHvjkrTdbN4G1mx3MAxdf5QklXDvlsH3Vzyr936c0
 ycwfiORYw6QCEyAEmsvucdqVx6tNUQz5z58LjX+5OT/ixUjsYWzNhlYHF3nY9KZqVasdHetM6X0
 RWIuLfDriIjYHBbbLYRZWGzlJ/X5IgEL/3tNmb8iQNFaEHAbc3SuxcxHjtes2YpB1z+7bwq6hf0
 ucF0dhv+4DKwXkIPNwg==
X-Proofpoint-GUID: cDjSmHyAL-1mTnNbUV6KGQdp3ElI2rI1
X-Authority-Analysis: v=2.4 cv=YuQChoYX c=1 sm=1 tr=0 ts=69590dcf cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=BVFu3abGlNSLOwFpleUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: cDjSmHyAL-1mTnNbUV6KGQdp3ElI2rI1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-03_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601030114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_043840_452026_CCD1B66C 
X-CRM114-Status: GOOD (  16.48  )
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

On 02/01/2026 14:33, Pratyush Yadav wrote:
> Hi Kyzystof,
> 
> Thanks for the cleanup.
> 
> On Fri, Jan 02 2026, Krzysztof Kozlowski wrote:
> 
>> Use scoped for-each loop when iterating over device nodes to make code a
>> bit simpler.
> 
> Nit: the commit message is a bit too dry. I had to go and look what the
> difference between the two variants was. I could make an educated guess
> by looking at the patch, but still.

Really? That's old and widely used syntax, replaced so many times and
sorry, but really obvious.

We should not explain core kernel API in commit msgs, except maybe first
months of usage.

> 
> If you end up doing a v2, a one-liner explanation of the difference
> between the two loop variants would be nice to have.



Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
