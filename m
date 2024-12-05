Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A8CCE7716E
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Dec 2024 17:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ofg17P/cpYWjVrZX1pQO9BP6dj6OnJqpy79/gGLkZFo=; b=GyUIB9ODhhHtpg
	nHk3JRB9oKNXmz/V+pS2Ggx30Nyzc9iyCEEX/iwsYAMCvXlljKc94RT2DBG1L1Qkf5ydFJ3g5719Z
	N2TxKHFV1Q81om/L8MHI/Jc2w9MrDv4jvKy/+EuS3osi4e4KcDNVmP/nr+1fVTdHfKG4t1BYg2o/T
	ZEH9WG3tuSSHdi5dWMH0AD1OiQMCymuVLI7FanwgsLXMWgLET0edTcEo+GPOKRM1hAIPdNNG/bYyn
	smR5Wuqlr5bYawsasf8wuvxpHeWqxaWg4c+7g6hhLSw4C65OWqjdCjYotrElkVGdDlaT06PUv6+Ro
	o9xXz96e0wR73NH9ebiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJFd7-0000000Gwlq-07Et;
	Thu, 05 Dec 2024 17:27:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJFVx-0000000GvE6-1gAv
	for linux-mtd@lists.infradead.org;
	Thu, 05 Dec 2024 17:19:46 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5GP8D1006572
	for <linux-mtd@lists.infradead.org>; Thu, 5 Dec 2024 17:19:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lm5ndeOU9990FRIjr0qyFHytkSEpGFifKLWwIXMxeEE=; b=AolqaUjOIngK9iOV
	pWktVOg09Db03+kC4HTTv7tj36rXe+nTAdZHethGlEQZEPYleAaszL9/dmvjq0sg
	Gf1CP9QNu2izii7tf4K2e3ggJxwQ8UJwjw36r1JEqgFFKtUQLt/WYwIjLO39sYKJ
	3cULLaqhGFtoE7OYfLSlggiOOmijVpBvbkwekn2cudLwJDxBa/3s5EiUOlAuVbMR
	ZAsDbrZy8o3+JBDPJiJS3LzrW08s2+PwtkLsA10HTLpYSHpFvKD07aQnu1YrP2hw
	5yVs48nom/boGOT1zTEeCWhS7AnPxBpUt8pagPe0K2+4xx1rpu7ajaHs22ObAW1F
	B2q/JA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439w3ercb4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Thu, 05 Dec 2024 17:19:44 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4668c9aa8c7so2992241cf.0
        for <linux-mtd@lists.infradead.org>; Thu, 05 Dec 2024 09:19:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733419183; x=1734023983;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lm5ndeOU9990FRIjr0qyFHytkSEpGFifKLWwIXMxeEE=;
        b=joWGgwbR3OX51Dof35DQAnccgSo+z/q9dyPsbxBBsD52dq9PisbKhaRMYDw3h+vOqr
         TCTdCx3wzdXf8Yu386yezb6ec9U3K3liJivJr29nxKIfUJm5V3pvzMuT6DrBxQgxsMT3
         +CZeKpF3b6/djuPlVJ9Pgtjjnhb07MFmjhpJswMTPB3uymgTnCMYR5cR8UiGn97/OA9a
         4S4RIMAyXIg2ctQqhKmjR5phVym9NQlJYDbGXxkiW5ktOubjoO20LMbwSnXiHIgcKKKO
         L95aqx+chECcn7JOkFD1rgO35HhZjnTHMoadQv74NJhxO59wc/7pgFClsyLyE6ja8HPr
         Igvw==
X-Forwarded-Encrypted: i=1; AJvYcCVHAy5imsr8tSk+V3FWJENt83WyPYCZdzRHR9TbyCKiZJ9FYR+Si+zwxWo+GrN6NOX4V01tZWwYV8A=@lists.infradead.org
X-Gm-Message-State: AOJu0YyTDbU6usshmwNNC/A5rkCedjp8o11SK19LjeybvXjQs65wffYP
	FCnkPC3UiZZ0P5xoKGMVHbdTjy5h7Hf1l3VgqstUtJ1z8oRtY50NjLXsD7jDJcDSMWQ7F0/o9b9
	ThRk5udNPlQvXN7zQ4iEPFfHnLzG6JyV1T0j164XUWYYY/cjaqhGVCI2LK01p5iLi
X-Gm-Gg: ASbGnctG7vfT8xoATcn09kgOrVv4eG3MhCOmZIlcWt+2GoagiLsLxqLzScboY8eE2Eh
	FyCJPfRQiXlx4WR+qlyy/R32twTGIarjp2ffoQGwTqDVxpDPl6WNveR071QvqFlFjZwnD3ofx6k
	d3tmz4PUWsVQjQuf1SlnJvOvajzUuKemZt8fhaBl3pS1FUsY8igVOfGdDAYmtLEbGmQu8LU/uPT
	L54jgViE7y74mdh5vTAv6vtjtcGqkNJP1mu+9brxLeeQ2vz63PM7s96y02YpwQOB5wiFO9U+gwJ
	E0ju9DRFH5VFSumbdWQnpsQjLHQ+WtY=
X-Received: by 2002:a05:622a:1811:b0:466:8e17:cd1f with SMTP id d75a77b69052e-4670c071462mr65629461cf.3.1733419183513;
        Thu, 05 Dec 2024 09:19:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFaJmOBmk5E91zDvi4GqqziQOrLODRZopwm1Xkdm3u7K10bviytIQBZzrpav1hnIkMXbYrY2A==
X-Received: by 2002:a05:622a:1811:b0:466:8e17:cd1f with SMTP id d75a77b69052e-4670c071462mr65629191cf.3.1733419183166;
        Thu, 05 Dec 2024 09:19:43 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6260e048asm118968866b.175.2024.12.05.09.19.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 09:19:42 -0800 (PST)
Message-ID: <02e2640a-22ce-4586-bff1-7f4eaa20cd7e@oss.qualcomm.com>
Date: Thu, 5 Dec 2024 18:19:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 8/8] arm64: dts: qcom: ipq9574: Remove eMMC node
To: Md Sadre Alam <quic_mdalam@quicinc.com>, broonie@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        manivannan.sadhasivam@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com
References: <20241120091507.1404368-1-quic_mdalam@quicinc.com>
 <20241120091507.1404368-9-quic_mdalam@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241120091507.1404368-9-quic_mdalam@quicinc.com>
X-Proofpoint-GUID: SCI9Ed4nSkIeJrbuVWlHUMUfI8wzHjGz
X-Proofpoint-ORIG-GUID: SCI9Ed4nSkIeJrbuVWlHUMUfI8wzHjGz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 bulkscore=0 mlxscore=0 adultscore=0 priorityscore=1501 mlxlogscore=765
 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412050126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_091945_445121_64E7E5F9 
X-CRM114-Status: UNSURE (   8.42  )
X-CRM114-Notice: Please train this message.
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

On 20.11.2024 10:15 AM, Md Sadre Alam wrote:
> Remove eMMC node for rdp433, since rdp433
> default boot mode is norplusnand
> 
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
