Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63276D149E8
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Oct 2024 18:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AhzeCKBcEl7exGDZlG8mrSQMGjLGNnGnKHsJGmAvtAk=; b=ZpBGSwQjOqo9r+
	AVF+5BwEQPl+JaNBKMuo5Y0mybhszaZIo4I8qCCpdhlpT4TSmMldkqfib+HT2Tdqn/1lyRt/Ie4jd
	5kAcDSAq5N9ooGa7YyIFpKPkBQpTR041qhe0xt3hg9Y5EFIyJUMaN+TgkyC0tupaz9f2JGv2hFK8q
	2MHl4xe422rmVtaZb19xsFkG02rN9ZATgRLejBbl/piwCcj8/PWfqlftrBdLpI413dxV8y0wv1xY2
	lzXQiMahZx4E4K33uVQpfmsdK+VXHKbpCMbgVV3S0akzLVIk1NwKv7T8iWyC0qWjO4d9kNXP4H7GG
	IeQ6y1lgCYJaMVKfJRvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4PGy-00000004qIy-3m6F;
	Fri, 25 Oct 2024 18:42:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4OoG-00000004l7O-1EsI
	for linux-mtd@lists.infradead.org;
	Fri, 25 Oct 2024 18:13:56 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PDLCjv028796
	for <linux-mtd@lists.infradead.org>; Fri, 25 Oct 2024 18:13:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S6J/Qh2/LbR/I7UXVqELD64wgFXzyzqALoQ0edTkwr0=; b=SwPLDvLTVS/mgKUQ
	UeA5oIB9p3422rMg16g/82HFQNxc+9oAJhncxImi/WK/bFtnKOrdW5oUhjisbTZF
	SgTY7vH/7nC1udG5H8t5x9Fzmo4LQwGcqQ+UPaON3doWElfNS1OiCyHAaikbmtS5
	Q6bg8+7uhm9XggVIGZPxHhAWFd1Rs4woXGk7aRn4D4Fv+F/EZPptxSsRMuNL6+Ul
	MWqooxDK5dWQJVb0FD/kpkabGoxmiWNj8zY8CCMBXNu+1BTq3cSYT2WU6npZnu9p
	hjmjgNVqVTZaZk+yA99JLze5MoVs83sxgs1Z2ZjQhlr9A/kECVSJAYVrY3Va8ryb
	NIewoQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42fdtxnvjs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Fri, 25 Oct 2024 18:13:14 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6cc290898adso4614856d6.0
        for <linux-mtd@lists.infradead.org>; Fri, 25 Oct 2024 11:13:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729879993; x=1730484793;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S6J/Qh2/LbR/I7UXVqELD64wgFXzyzqALoQ0edTkwr0=;
        b=NNysaCHsVgIaZ5kKB3enBRapq2XLMwvj3x53nYepDAbSO9eMHiY3U8i/VpZcE3h7kx
         Rw6eKlvVRcg5h+8okpeApvpsWq/3IeOdHrwJWovE4jduw+PlGCxhSLOkZnJt0SDRSQqg
         Y0Q9r47WZj8rDIVC98PA/0oMLBLIqRGqzEe8Odghx11qzaWZt3AykxLZhxPezIqAY5eW
         gQShd6EB90PfR5QjE8R7j+HBkDr+RJg6DAP58gJ0lWZ1mZTpP9RWzFbURWao+Ha9FGXE
         w5WhnK6Tq5/E8nix/zAzynMnGMNAfqKhsoNvSnkhDBWQZZxaz0zGYh7eWLhzCg2iPtUK
         rd/g==
X-Forwarded-Encrypted: i=1; AJvYcCVqR3q3mSAUYTq9EHoas0cEE1Q5VUGKMVumgViVSQgQYTn8c4kPHgmX9s+pnz+XPVEthKynY8FK8Ik=@lists.infradead.org
X-Gm-Message-State: AOJu0YxIZpsVYL6eVYT586I1uySNfb2dG6sypxUCGKZdbIt1MMPEKE5G
	yROyf2RraIEDYkyUoK5xrdOqJMsQHqOrURl4DiKDXmbuNUIiijUD2DeNkqRF1FWdTrEB5k/GvFI
	kWtpzmoR5XP1ctfgYU7pl4625tztrViC9qVGe4V11BoXl65A+UFZUL0xonAf6/qOx
X-Received: by 2002:a05:6214:da9:b0:6cb:e981:d7d0 with SMTP id 6a1803df08f44-6d18581d7d4mr2307886d6.7.1729879993238;
        Fri, 25 Oct 2024 11:13:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFetU8WERXTxmTfnz8BSCC6cA2/u+vTk5Tzq/OIHDVK0c/Vs/rj3bS2lkScfXLw1sM4zfAQAw==
X-Received: by 2002:a05:6214:da9:b0:6cb:e981:d7d0 with SMTP id 6a1803df08f44-6d18581d7d4mr2307666d6.7.1729879992907;
        Fri, 25 Oct 2024 11:13:12 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1f0298dcsm95063866b.77.2024.10.25.11.13.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 11:13:12 -0700 (PDT)
Message-ID: <a4c85bfc-9e76-4dcd-ab09-699d50fc73a4@oss.qualcomm.com>
Date: Fri, 25 Oct 2024 20:13:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 5/8] mtd: rawnand: qcom: use FIELD_PREP and GENMASK
To: Md Sadre Alam <quic_mdalam@quicinc.com>, broonie@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        manivannan.sadhasivam@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com
References: <20241021115620.1616617-1-quic_mdalam@quicinc.com>
 <20241021115620.1616617-6-quic_mdalam@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241021115620.1616617-6-quic_mdalam@quicinc.com>
X-Proofpoint-GUID: 0R_F297CAX4CRCogAECTYe8gEsWogIFD
X-Proofpoint-ORIG-GUID: 0R_F297CAX4CRCogAECTYe8gEsWogIFD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 mlxlogscore=857
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_111316_376275_A5467C2B 
X-CRM114-Status: GOOD (  10.73  )
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

On 21.10.2024 1:56 PM, Md Sadre Alam wrote:
> Use the bitfield macro FIELD_PREP, and GENMASK to
> do the shift and mask in one go. This makes the code
> more readable.
> 
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> ---

[...]

> +	host->cfg1 = FIELD_PREP(NAND_RECOVERY_CYCLES_MASK, 7) |
> +		     FIELD_PREP(BAD_BLOCK_BYTE_NUM_MASK, bad_block_byte) |
> +		     FIELD_PREP(BAD_BLOCK_IN_SPARE_AREA, 0) |
> +		     FIELD_PREP(WR_RD_BSY_GAP_MASK, 2) |
> +		     FIELD_PREP(WIDE_FLASH, wide_bus) |
> +		     FIELD_PREP(ENABLE_BCH_ECC, host->bch_enabled);

CS_ACTIVE_BSY is no longer set (not a functional change, but it looks
omitted on accident)

The rest looks good, thank you!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
