Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F601D767F5
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Dec 2025 12:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=79Q68C7WX60av5t4Ry6dDFtBvWM5GoMXZRHZMk1SRy8=; b=2idOTRH/IpdGg/
	6HlIqMvbbvQDfXzrpGNFTUYF4l9oQLeI4yklqtpAHr+eyIcboUqxTWfnE8snrBis652wTSgdE2uy4
	H0gHnIqnfX/5Trq5YBdqK6qQd+IDV8hgWR1ncMOkLt+DXwSK5XwSQqKf3eheyNVxrNP8DcBDDqqvW
	pIMXXe7TZ7dmXdGnMJnc1yCjQPSTDN2IQWLi0wKX72i/RXr++6M/n4Ofyam6dghEa0UTcGEBBfYqB
	urSgzmllbVwFOmJV13+Nh1LiwfAQaA0usHYN0H6JF9iA72o8NxuVT51qfIDcia7U3PsNOOB3tuaH9
	qaA5m9PP3CfsFTOcjC2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWZF2-0000000AFp1-0yNl;
	Fri, 19 Dec 2025 12:05:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWZEw-0000000AFoc-2KKN
	for linux-mtd@lists.infradead.org;
	Fri, 19 Dec 2025 12:05:50 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBg3Io3975628
	for <linux-mtd@lists.infradead.org>; Fri, 19 Dec 2025 12:05:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ye/VHs9xlBhvGfu8YVFrAtTe4Mu9EMO/b02keiixSbg=; b=U/iMW0MWM6SSHR17
	LOmih3pFkPl1VYx1iFwynrUp3mnYLHcxjZQ/3AskgbVoE929h4cdHwLEp1tvTDe0
	+THuqS04RedMZ7pihjDp8gelNymR5PWhVupYOo5vmgiFIOsSeCeAKpIeqb6o5Ep2
	6pwV/aoYdTia0xjKKmq/EEnCArNJvNv6JUrFp13HlcW0RWyPoicb6mS8Nrv4VcsF
	f0F0R30QIv7akaKxHEKl3/X1JswGqT6gIkNOTYjFyxu7FcDZ27FEPNTHSENAQ6c0
	VfF+DsS7mq+WpnqC1/nnlB7TwetB6+hqBZhhCvteg+JNrZsjzRf4WJ9X62cq0bsx
	HrTx6Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2fjg9d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Fri, 19 Dec 2025 12:05:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f34c24e2cbso4844581cf.3
        for <linux-mtd@lists.infradead.org>; Fri, 19 Dec 2025 04:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766145944; x=1766750744; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ye/VHs9xlBhvGfu8YVFrAtTe4Mu9EMO/b02keiixSbg=;
        b=amZwZbtq791qpdeimQmZ4yVbd4fR0ssvHeXqFPnW+9Fs2GstwBtFJVW01mxqdMDgDA
         9+TiabQbvWASHd0yf+m68dY5BHKXbPjj5ASo9/eTX9of0KrgtFSkIuWHYMLRZLq0oLKj
         fq49/JcbY/SO03+Po7Xov7lS5I4TWsIbV85DPoKkM/l+s/TIxBupzNpYdVmvvDNrSd+J
         6+NH47CTPLQVZEv1gU9vTwG92TJa8bRCJMNaqs0ghASUXbbOf6TT0l0wERzM5o8MKLvR
         zPEdpjXx8rXjt5hEVU5dv2SsbngT0tF61/o+DNw6B/p+yJ9IGxJVgCubcoJHqi3PpP08
         Sgvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766145944; x=1766750744;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ye/VHs9xlBhvGfu8YVFrAtTe4Mu9EMO/b02keiixSbg=;
        b=ozIJv8VswDm10e5zTSGfi1dF/8cPgjJfCRqiN6QUQeZ29zHl+Lpfdip6MA4ppbb4oq
         OvbkUsu11V+HGf6644zJs9Q/bSGVBico+KGk9JZhthkH5/uvyslhUj9W2LRTghJoAFFB
         sQCZtNj+deqb/+xkAfUFwl6vy5Vxe5dkMwX8gYgvaS9Lp6IId2VV6TuNbxDgjZVjAnKr
         liptxW1dceVHEC1siUIk97vIamWwoygZiHbxa3d1nyTXrj54mEVooPbfo/0Ii3h0CTzr
         Sro0Ht3kuGnUg6TCRZuUGy7ruvZsKJ3I6lnyWigRyRIYU1kMTZwU5/69UjvBX4euRf2O
         GGkw==
X-Forwarded-Encrypted: i=1; AJvYcCUTtc5RTPRwiLsuG05GTuRAJIzQ6DllmTOdBttTgxB7ZjPjTpi+nTsQeFgJlLZnT5hRskkKJSexWgo=@lists.infradead.org
X-Gm-Message-State: AOJu0YyGHFTRxOLEm2ltID7rrrGZlylEEzK3eyGZoipjBECgRYTonXG3
	n5V31hAtZn8UH29rmseXWFJtoDFEo6rccdo3vVIRvgdOxL72ugH+N7UIBm25f5asHnyCFoOj3WD
	CSQErlvVOFzwW1/3kONr0B1er5rStgDela6Vr2AMZJUXAKsawF0AeTlo80cSDGF1n576T
X-Gm-Gg: AY/fxX6sZSWPo5f+iEACoHAk4NTbjulIJheIejxvPLC1NuDY4VEe9+lRgKup2bTeEdO
	/I56P3I2c0Nx+YSo/Hg1PKTMTZCTbWmkjv4IQRPZDoqNvbWJyTiKKu3nMNzP4mtiHrZtpCbR+8p
	x/rj+Dvmq4VXdYh/Dy6FjtvS+kCLIi+xWYVUstSFd9+JHPf9UAP8l35BNCuvBHwkTLyjR92VHzj
	efNSVNxBe3yqd1HV3O9k/w0yzU8Pq91ApEiq2nK4IZTumLoAVhAFqOUd+u+nbs2vVsOUL7BBFyI
	PvcTTnGGCV5lUTYhvAvlF7qSSqUqfhBl48d33xVCiiNuhY4Eo4QpKLWBVA+qayshtGzQr95eZV8
	TG8s19W2PGz0cGdWiimuM8AgFRPu6KGCEC2AZDd0SjSIVwW3mSs73+SWOOhKbmCVlHw==
X-Received: by 2002:a05:622a:1982:b0:4ee:1718:dec8 with SMTP id d75a77b69052e-4f4abcee273mr26138601cf.3.1766145944357;
        Fri, 19 Dec 2025 04:05:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEzfMOuSFJ/OJ64vZEqDhf9U59LZhw8Cjqpg04L/6xahb/kAkvh1Fyc0HDbUNbC180mQH0aaQ==
X-Received: by 2002:a05:622a:1982:b0:4ee:1718:dec8 with SMTP id d75a77b69052e-4f4abcee273mr26138161cf.3.1766145943850;
        Fri, 19 Dec 2025 04:05:43 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f4ef2bsm212467466b.68.2025.12.19.04.05.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 04:05:43 -0800 (PST)
Message-ID: <b14c51a0-7e87-4eb2-ae52-caf90f1bf545@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 13:05:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] mtd: devices: Add Qualcomm SCM storage driver
To: Junhao Xie <bigfoot@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Xilin Wu <sophon@radxa.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tomas Winkler <tomasw@gmail.com>, Raag Jadav <raag.jadav@intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Alexander Usyskin <alexander.usyskin@intel.com>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mtd@lists.infradead.org
References: <20251218180205.930961-1-bigfoot@radxa.com>
 <A41171D3EA8B583B+20251218180205.930961-3-bigfoot@radxa.com>
Content-Language: en-US
In-Reply-To: <A41171D3EA8B583B+20251218180205.930961-3-bigfoot@radxa.com>
X-Authority-Analysis: v=2.4 cv=NODYOk6g c=1 sm=1 tr=0 ts=69453f99 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=ksxQWNrZAAAA:8 a=5rMr7QXivSIVLOAxuCIA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-ORIG-GUID: 8TDc1iDmIlYTNQTsl8Dh7o-a7ewv0iTE
X-Proofpoint-GUID: 8TDc1iDmIlYTNQTsl8Dh7o-a7ewv0iTE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEwMCBTYWx0ZWRfX99E+Ou8NR8EL
 2g54alzSCdQPCuLcCv0UmdY3Q/bFIZg3Fng/BGaiQZ+RYq544z7h62YJIFdSxenLcLboNyk1US3
 fPnVbzggeAXjyl6eClOWVW8TZF+YVbs7LSz6985pzHRhu08W9YMlhGshvmWKa5dV3JU4BWec39Y
 Do/qNwxcziX++t+HIPd6Cn2Ozr36Jr0FFp845XSurAzPz4L78zs8Pd5W2JRHQui01KEzEnGyIpd
 Fd5gziduMGZFIHQJNpABoVf7hg4rQYIrapyG7wDCWoqzMl8B1aZUgmOifggBffwZW6xHiCjWxUe
 nZhm+uWKmdGuFymDbGCbhxnqBB9qptJtE0H+X+uefICGLK4gDaViM4NJaWK+ASikSopzF32+aug
 +ekuBP4g6EKuGIawhG8pYsawngJ0IxqbNLrcB0d4jpbjkubj4uAsxZWPUFbw2+691nGsfkHQGnu
 0Q05plKeqZO15l3SX5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_040549_788221_00365242 
X-CRM114-Status: GOOD (  16.68  )
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

On 12/18/25 7:02 PM, Junhao Xie wrote:
> Add MTD driver for accessing storage devices managed by Qualcomm's
> TrustZone firmware. On some platforms, BIOS/firmware storage (typically
> SPI NOR flash) is not directly accessible from the non-secure world and
> all operations must go through SCM (Secure Channel Manager) calls.
> 
> Signed-off-by: Junhao Xie <bigfoot@radxa.com>
> Tested-by: Xilin Wu <sophon@radxa.com>
> ---

[...]

> +struct qcom_scm_storage {
> +	struct device *dev;
> +	struct mutex lock;	/* Protects SCM storage operations */
> +	struct mtd_info mtd;
> +	struct qcom_scm_storage_info info;
> +	size_t buffer_size;
> +	u8 *buffer;
> +};
> +
> +static int qcom_scm_storage_erase(struct mtd_info *mtd,
> +				  struct erase_info *instr)
> +{
> +	struct qcom_scm_storage *host =
> +		container_of(mtd, struct qcom_scm_storage, mtd);
> +
> +	if (instr->addr % host->info.block_size ||
> +	    instr->len % host->info.block_size)

While it's the same value, it seems like mtd->erasesize would be
"idiomatic" here

> +		return -EINVAL;
> +
> +	guard(mutex)(&host->lock);
> +
> +	return qcom_scm_storage_send_cmd(QCOM_SCM_STORAGE_SPINOR,
> +					 QCOM_SCM_STORAGE_ERASE,
> +					 instr->addr / host->info.block_size,
> +					 0, instr->len);
> +}
> +
> +static int qcom_scm_storage_read(struct mtd_info *mtd,
> +				 loff_t from, size_t len,
> +				 size_t *retlen, u_char *buf)
> +{
> +	struct qcom_scm_storage *host =
> +		container_of(mtd, struct qcom_scm_storage, mtd);

Feel free to unwrap this line

> +	size_t block_size = host->info.block_size;
> +	loff_t block_start, block_off, lba;
> +	size_t chunk, to_read;
> +	int ret = 0;

This initialization seems unnecessary

[...]

> +static int qcom_scm_storage_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct qcom_scm_storage *host;
> +	int ret;
> +
> +	host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
> +	if (!host)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, host);
> +	host->dev = dev;
> +
> +	ret = devm_mutex_init(dev, &host->lock);
> +	if (ret)
> +		return ret;
> +
> +	host->buffer_size = SZ_256K;

Should this just be = host->info->page_size?

[...]

> +	dev_info(dev, "scm storage 0x%llx registered with size %llu bytes\n",
> +		 host->info.serial_num, host->mtd.size);

dev_dbg()?

Konrad

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
