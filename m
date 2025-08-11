Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70381CA0EC0
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Aug 2025 09:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KP8nFNW8/dmS3b9VwviqsNpT1kA846mnaZydExJUKKc=; b=cmHNMGCBgUZosH
	oCrs0LwfjaMdBpK5VFhPmu9+HeRD/gQm3SxLSYw5rVOCR6q1fCpg9mmV1qSxKZt5bk+sxjgaUjsjR
	LANb1Rhh1Zt6Z89FHejeK4cNaaufByZjCyglBdcw56ozFdLCITpKRdv3Wps8Me+8RyaBmn1O+OxKu
	ofVDdlPj0vqsh8aoRBvVMqrEA8sksQAFurKEqVermqBPqjMpfIKW4ukY+Ph3dOhthXntsoozE3dsz
	DxAzI8EURRgc7hz1jX+vRD0S3Rmuu1lW7B+cRllV/gslD+8cUWZseum96D0nayRr666USM0TIzalZ
	VQOuADq18KiQyb/ilD0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulOWw-00000006zsz-1Xft;
	Mon, 11 Aug 2025 09:09:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulOEg-00000006uEy-2dbH
	for linux-mtd@lists.infradead.org;
	Mon, 11 Aug 2025 08:50:32 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57ANv0SC026509
	for <linux-mtd@lists.infradead.org>; Mon, 11 Aug 2025 08:50:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CORAd2r8QfE5VI6wSh8ExS3y5u32gjUiHVIBXtOTHh0=; b=QTcq147/b9gOi54Z
	MsLQigOnChXxV4MT8/Vp7U3F/gzGF0mARNbqo4TOEvFFpWzEFX/x9tA6Zig0Ah3a
	nZ4q+4G6/5DNTBG2qYY615/5wAQ/2LAKl4+BESCUTzgOEE+QvH6ZgPDKaaUYVUyS
	5GH4s8krsaGl8NdmNIrXbpDNaQCxHvb5mzjWlEwX2SDyBVanR+Pua80YD04ivzlw
	jSllyohKLQmoiF8DOAIXF18iKiMEwU6m3oNcGUvcPqatsrv0GHO32ajVIJMm2epy
	J/QxiHIV8OjJmV25BjxZuaE3UG3CPMjN5jdvM1msmPepTagC7EOQafQnm/vDvLTQ
	mepANw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxj43pr8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Mon, 11 Aug 2025 08:50:29 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b07b805068so8944791cf.3
        for <linux-mtd@lists.infradead.org>; Mon, 11 Aug 2025 01:50:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754902228; x=1755507028;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CORAd2r8QfE5VI6wSh8ExS3y5u32gjUiHVIBXtOTHh0=;
        b=R0N2pk/GVSuQ5RIXU8ARtD3SmE9zM1w7uCLwWuoJGWRNF1QV55Kc0eBstBvnnUrd6c
         iuMem0wMYz39UA7OBUDC8u4IhjEaX2a/Z2avo1hG/kwXdAhowTb84uSJTrxRz/MoOQA3
         pIdeHfMnzrUzg8o14kxd8hQ8kUgp0FDbH1g9yk6RYRI9M4gNd1y1YM3fSCA6lUZplIC6
         Cnkyl77DE35al+JO4/pXazAluarl62UKJJ9Z5/kXtEcvzIUqmeVykFBsS3chnuQ0qrR7
         MPmVLbbbgRnTHdRaHti91doLLW4193uR1TvqqCbQtYWj2C3BMCqGBFREyfEcuq3jRfnx
         KmEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOjGb6RRVjMe+R92/sg6BU23FtAtYCpm/2tdYCZ8LqFUOhQkY3H8MT8EjtcWCjQI8B1wynORbJSxY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyds+TanBLnfp/91THsk9kfkYLsAt7IxgL/r7Udpd1Uy2CxMvN3
	FH7LtyAQIUefN5Os2nNSkspqoTay674UUjfOCYG+L3x0NwlYDrvbSXCMNcyMbD5vSDKw4CMJF4Q
	f5c8flJSX/a85DKp+RkY4zd68JkyTzCkttlZwL+X30c0wej1nn0U1UxcOCM3/U09WbJcd
X-Gm-Gg: ASbGncu6ZS1oda6v209+/RKEhakB6DSQdSX0uqeicWa5nqwNSh3lq2V8n8JNg3axof4
	eEDvrewOW8KM5YUkGxwrYfJmOvo/4j6degYRa6T/4gsLl3dSXDLmF1YNyaSwRHGC9JHGS2Y3hZ4
	fnyPZv4cRJvzGEH/BX1WyG79R4WjTHwsSvOPXkN0xit6PXeZQJuV4te2eati1aqbZaBfdXr4Nqo
	j4XbtHdrIUZmhTOeLUHGK16jCmVNpNVdZroSlJgFXenRJgQBMoqiRTDd/oy6Q1zAAIRAVr7eUof
	gsST7qZvpg47ydH75NveeMGJB2vLRGNT1dTFPrs1zlPYeDNtObTtutoEaBTFtZC5DuZbxXmZfSg
	xYHaj76tL2KDnGIg1mw==
X-Received: by 2002:a05:622a:1ba1:b0:4ae:dc5b:5fee with SMTP id d75a77b69052e-4b0beb027a8mr52894031cf.0.1754902228394;
        Mon, 11 Aug 2025 01:50:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2gL+G3g1eE6R8szJqv85HPPf+VErr9fLPtt2IIDrlbNUHP7zeIYNUyGibJo//rQDUPs1VWw==
X-Received: by 2002:a05:622a:1ba1:b0:4ae:dc5b:5fee with SMTP id d75a77b69052e-4b0beb027a8mr52893851cf.0.1754902227923;
        Mon, 11 Aug 2025 01:50:27 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a1e820asm1977227066b.90.2025.08.11.01.50.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 01:50:27 -0700 (PDT)
Message-ID: <cc24ea01-549d-43df-a3d0-62f60c79d5f6@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 10:50:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] spi: spi-qpic-snand: remove unused 'dev' member of
 struct 'qpic_ecc'
To: Gabor Juhos <j4g8y7@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Md Sadre Alam <quic_mdalam@quicinc.com>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250810-qpic-snand-qpic_ecc-cleanup-v1-0-33a6b2bcbc67@gmail.com>
 <20250810-qpic-snand-qpic_ecc-cleanup-v1-1-33a6b2bcbc67@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250810-qpic-snand-qpic_ecc-cleanup-v1-1-33a6b2bcbc67@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNyBTYWx0ZWRfX9m1oLDwZ8i1h
 I3KpVzWqewQBA4+wQiuyemukcV13bBoF1e2H6i6WydablWAf8nWEdfvrJi/gbglRgb/TcNT1oX5
 qJqUbXmcuTV79ha/c8qGuwUR/UtMyOR2XLYtJMZQuf6K4F4lIbzecJOjU3aKoNBNoYMOcRIKvbG
 kMENpLMLnOEKqAkR8XdM+ZVWZ84k9Mk2ZES4Ez46BAPU4q1nbPKco6jnTdKXsJnwJN7n/CPIGJq
 c7lfNdh44XKav7H9WBFQbI46eNkzgLUkJDgv8/jxLb/pNdwDXWFNBK/7QAy+9lUCaoNYQsi4T4d
 Q2QYG+jv95QSUcIPwkYs1ySnYUVUzNKvel0IV0uTfqjqZ8fjgNytd4AAsF6hiv2gSzThycbvUpU
 RzJbfsvT
X-Authority-Analysis: v=2.4 cv=fvDcZE4f c=1 sm=1 tr=0 ts=6899aed5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=rbI749AxHwL34t2NiqoA:9 a=QEXdDO2ut3YA:10 a=bDEiuqbIbRIA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: aBJ1mWRs5WLb6UHPPDHHM17v7qDrkr9p
X-Proofpoint-GUID: aBJ1mWRs5WLb6UHPPDHHM17v7qDrkr9p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_015030_678212_BB37F547 
X-CRM114-Status: GOOD (  10.78  )
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

On 8/10/25 4:38 PM, Gabor Juhos wrote:
> The 'dev' member of the 'qpic_ecc' structure is never used in the
> code so remove that.
> 
> No functional changes.
> 
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
