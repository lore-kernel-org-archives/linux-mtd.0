Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 288D1D767EE
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Dec 2025 11:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qxWo5J2yBmR3zDoNBxp353/f9fh6TMseSYv3j65vygk=; b=BCIKhqPYI/bc0+
	roftybHB7jfmAAqbMBpRfT6CIjuFHUDFDOGbP4JQejyE8xX6dY/5Nx2z6A3LO5jSwh7lxRKMJLjUc
	LiFzlUZHPt+25z9kdodNE5SDcpW4/ByNMkyxz2YEFn/9BXvtwzKLxwZDsHwz0Pg3BWb/7Lt0zCgFp
	vjNBCigM5bqfMyoaVVDvY0LUh6mR9es06QJed6JVvAKmRlb2k0kcBDhvplpCKS8RqzUB1PZO5W0av
	C1BhdCVUTX23USvrJ3xKla6yUfSCA9A7k6ywRJQxfHcCwb+fvDicP768xczuGS5VSdSlIhI6YJ9GQ
	I/mS/Pb+Kf5JEP76CPAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWYvZ-0000000AEGw-0Vqd;
	Fri, 19 Dec 2025 11:45:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWYvN-0000000AEGH-3uyK
	for linux-mtd@lists.infradead.org;
	Fri, 19 Dec 2025 11:45:42 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJB960O4101371
	for <linux-mtd@lists.infradead.org>; Fri, 19 Dec 2025 11:45:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jhUx/wL8Scv3qSsZrRmKOrRlXmJZdg37tIib1c09xSI=; b=dDyte6oIHG8BpbbF
	T0W8qAkyiUu8A+ZS2sIcNQ6zPihDFbpBf0GDrKu2CZP2fM4Dgw+OoX0LI5vLZ5lk
	NykT98vz5GbURLhTUed+EZfDAriQh7+5NLyPwPCVPSQt5EamiwG/hYNNU08RER9w
	oFqBIEYAikps3GZqhy5BWS/TcauWwqXgwwZumyzYqMR0Vg/FIi/1dOPCysMyl/nj
	T4ZTFUKZ2jSw9MX7ffzffOmz9kre/hcYCpYN/cGvFPSiM+bgI7NGJk+90ep5hOjS
	6dqY64g3Y9i5FP5CCuXRqpiNX2MY+f98h1JebM0MSE0yybzcatYnQ/JoxUzNKjSv
	JEXIKg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2c2gwj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Fri, 19 Dec 2025 11:45:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b1be0fdfe1so62319885a.2
        for <linux-mtd@lists.infradead.org>; Fri, 19 Dec 2025 03:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766144732; x=1766749532; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jhUx/wL8Scv3qSsZrRmKOrRlXmJZdg37tIib1c09xSI=;
        b=Z+CJ6jt00t7W5Ccs20Fkidf6Cd2+s7IAhOu2mqK6kiHQBSZPjHhKKReKDh+ph7tcpc
         P1o+8aaTqPLvX4ESDk9DDfKqJp0jz/NEgCscgtmyMwsRJ4kjg6VS43MKoLyvBByyqct1
         eHxIHhV+8o4cZG8MK7zSRNuYLli8qtlE3BW6FeNxzMCs2EhbgLWTyVfRgpfaOnDMQWJx
         lgq0GO1+PbHABs4GnWXP85nRJOQUA5TGntL7DeWPWD1ZZdnSq/VwO/4r6NbGqVS6BWGh
         STxDyyW9enyendqsePF7cz5EQZZSBk5KWrSPJjw6EeRjp7UDBdvNYXxJ3yc4BDbmKQxN
         1qdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766144732; x=1766749532;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jhUx/wL8Scv3qSsZrRmKOrRlXmJZdg37tIib1c09xSI=;
        b=DHus3yYcC5CL2n1rDKSQ+1S8g9kGqI+7fbY04zEgjTboyyfEh/nPSVSWvvEleTvdD+
         Z+6yYgVn+3rVUTZdT3+01G/+u0O8lNs0uWW2K1vqv8g6ybjK8HHGbmRMvfwRSdgHZwWn
         nFcv7q0Q8FB0iRCGu0pe73kpMCf3JGT67nD1+3vXlCgtc5Go7vodJ4kyCJldWigUWr1b
         HlbxoxfUqB7lMwf/2driO8cRpRxbeaoxQ6HHm0SnZUUk9zKBI8ePNUCftmjGXnzPjZGn
         pU7p44tDlBTkU1wTNsko8f3sk1enUkK1nuLBemFIE16Ih+KoKKKa2ZEkkl9reoA83x+M
         Mm1w==
X-Forwarded-Encrypted: i=1; AJvYcCW132DKN910JSPMHfPn1ocaAAQeQveiQwo/qc0fyM8TmmFeJC8CDHCIAgwE6IHQ21x72jKLmkplAhU=@lists.infradead.org
X-Gm-Message-State: AOJu0YyLURYNb43u/BsHURrfQcHDrWQLJSeq2MsZXRHGpJutvN5EerIX
	tOxJB8lYBVXBS9ro6OrMs+b3tsuRH5+7owfXsqkChhxk+H5d4b86jLJOLGAqOjjQdgFbkZv4I8Q
	CUKrYy/JrIThGYUm8W5LjqyOPio6LF0qPpxUVzjcZLNFmVR1sxvNlb2b/yNkmAkQPWL0B
X-Gm-Gg: AY/fxX5tN4ztIugH8mTRq6RtX0qG20feNsDSIum/G5ASTRTMEyhZbbhWzxZCia5KTNs
	j7FxjibSdUJHR0yLTOZHy2AokYktWMyOOeh/QTWwzGkIyqv3jqhH35WThxSd97CkMjPvbmRoBVQ
	VTC70DtpxmgmLENrhMqRc2zDGIY+a3CzZfoUAIqrI/wEIf91iM25sBf46tlJhrBr7Q0Sp4jC57H
	A7A8fi9ZO0pPzfPbl+IBVkXQdz/R2G3RKVnMXtpfVlbIs41ib0cXhVa+IPKm1l+HQmfyscgTpIB
	63sKDKBA/ZUYxC/SGX9ecgh2pnt55WZZCosxV2i0K1NekYHyTpWjQSzn0u660lIIP9Rf9Jt6ooZ
	bsf2xuOu87l/gKCoXTJ6jGQKUPgeUEYGokp1q6VtZzM5mEA9ZHyHXbtUMihUCAZu/FA==
X-Received: by 2002:ac8:5744:0:b0:4ed:b7f0:c76e with SMTP id d75a77b69052e-4f4abdcbf88mr25731681cf.8.1766144731943;
        Fri, 19 Dec 2025 03:45:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHNtZi1B46d8MS0ItsM14wtH+pq/5YJaUTAUUgWUaWzQOR49pfP65rKPIpGesKt9Onif6HzRA==
X-Received: by 2002:ac8:5744:0:b0:4ed:b7f0:c76e with SMTP id d75a77b69052e-4f4abdcbf88mr25731391cf.8.1766144731487;
        Fri, 19 Dec 2025 03:45:31 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f512e3sm210284666b.67.2025.12.19.03.45.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 03:45:30 -0800 (PST)
Message-ID: <84be5656-b22e-4fa7-8732-b355ba0c86ed@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 12:45:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] firmware: qcom: scm: Add SCM storage interface
 support
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
 <155C9F219E5A9219+20251218180205.930961-2-bigfoot@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <155C9F219E5A9219+20251218180205.930961-2-bigfoot@radxa.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA5NiBTYWx0ZWRfX6OIeW8MRtYVW
 pWQDF+TgM4SVReBbHc9bQ8s6peCmrL0ptaN7casMa1DO9lU4pgtXW8QI9eZQhCJcy1FQj5qhCgD
 kGjyz7PMHij+cSIgzqARG74pg+/FFrE+6+htr6+g4Vt37z23yiJzzO2obj11Zxo8sYxI+hwEzp3
 mac5l85b/Pscrq9+gcN6xB1SsMYMn+8FcKNVxxFdCaTiyOkw9ZC+3AsyuWbMEQih87FmAyxWLp5
 edpW4vJmFVWyJQZOLagQRo8zkwt8imdMY/sIHU6YGyJKR8MrajhlL+Q3qDD7ekP4ZOvIP5vAlBf
 eE+mKs7EKUxnJ8CNbzQDVsyv66e5h6TdkU0jUQ64ra2lzbSyDD4DS5vV/S1fS5V8Vpp0EG2zKwM
 OGFKPMtz3JgOu3PnahUY/bRXqSQLV9xmwAGMrMU7fExTGWgFNrvQR+vZLDgbjkFah/F87yipvHS
 VFyh+BiPILuYRQm+QVA==
X-Authority-Analysis: v=2.4 cv=dOmrWeZb c=1 sm=1 tr=0 ts=69453add cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=ksxQWNrZAAAA:8 a=HWOIYEKOvZwOJwrNAaQA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-ORIG-GUID: wym_wUmmyTzS5LqsBQDX1ouuIRVoZBoF
X-Proofpoint-GUID: wym_wUmmyTzS5LqsBQDX1ouuIRVoZBoF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_034541_170183_BC6C4A68 
X-CRM114-Status: GOOD (  30.90  )
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
> Add infrastructure to support accessing TrustZone-protected storage
> devices through SCM (Secure Channel Manager) calls. Some Qualcomm
> platforms protect their firmware storage (typically SPI NOR flash)
> via TrustZone, making it inaccessible from the non-secure world.
> 
> Currently allowlisted for Radxa Dragon Q6A (QCS6490) where it has been
> validated. Additional platforms can be added as they are tested.
> 
> Signed-off-by: Junhao Xie <bigfoot@radxa.com>
> Tested-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c       | 183 +++++++++++++++++++++++++
>  drivers/firmware/qcom/qcom_scm.h       |   3 +
>  include/linux/firmware/qcom/qcom_scm.h |  47 +++++++
>  3 files changed, 233 insertions(+)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 731074ca1ebbe..b117e1b58e363 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -66,6 +66,21 @@ struct qcom_scm_mem_map_info {
>  	__le64 mem_size;
>  };
>  
> +struct qcom_scm_storage_cmd {
> +	__le64 storage_type;
> +	__le64 slot_num;
> +	__le64 lun;
> +	__le64 guid_ptr;
> +	__le64 storage_cmd;
> +};
> +
> +struct qcom_scm_storage_cmd_details {
> +	__le64 lba;
> +	__le64 length;
> +	__le64 data_ptr;
> +	__le64 data_size;
> +};

Let's make them __packed if only to denote that they're shared structures
(no change to the compiler output because it's n*u64)

[...]

> +#if IS_ENABLED(CONFIG_MTD_QCOM_SCM_STORAGE)

I would vouch for this to be always compiled-in

> +int qcom_scm_storage_send_cmd(enum qcom_scm_storage_type storage_type,
> +			      enum qcom_scm_storage_cmd_id cmd_id,
> +			      u64 lba, void *payload, size_t size)

Please align the parameter whitespace (checkpatch, maybe w/ --strict
should point that out)

> +{
> +	struct qcom_scm_res scm_res = {};
> +	struct qcom_scm_desc desc = {};
> +	struct qcom_scm_storage_cmd *cmd;
> +	struct qcom_scm_storage_cmd_details *details;
> +	size_t buf_size;
> +	void *payload_buf;
> +	int ret;

Reverse-Christmas-tree would be neat (it's in a week!)

> +
> +	buf_size = sizeof(*cmd) + sizeof(*details);
> +	if (payload)
> +		buf_size += size;
> +	void *data __free(qcom_tzmem) = qcom_tzmem_alloc(__scm->mempool,
> +							 buf_size,
> +							 GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +	memset(data, 0, buf_size);
> +	if (payload) {
> +		payload_buf = data + sizeof(*cmd) + sizeof(*details);
> +		memcpy(payload_buf, payload, size);
> +	}
> +
> +	cmd = data;
> +	cmd->storage_type = storage_type;
> +	cmd->storage_cmd = cmd_id;
> +
> +	details = data + sizeof(*cmd);
> +	details->lba = lba;

I'm debating whether adding something like:

struct qcom_scm_storage_payload {
	struct qcom_scm_storage_cmd *cmd;
	struct qcom_scm_storage_cmd_details *details;
	void *data[];
};

would improve readability, but perhaps for just 3 items it's simply not
worth the boilerplate

[...]


> +static int qcom_scm_storage_init(struct qcom_scm *scm)
> +{
> +	struct qcom_scm_storage_info info;
> +	struct platform_device *storage_dev;
> +	int ret;
> +
> +	ret = qcom_scm_storage_send_cmd(QCOM_SCM_STORAGE_SPINOR,
> +					QCOM_SCM_STORAGE_GET_INFO,
> +					0, &info, sizeof(info));
> +	if (ret < 0) {
> +		dev_info(scm->dev, "scm storage not available: %d\n", ret);
> +		return 0;
> +	}

You can first call __qcom_scm_is_call_available for even more robustness

> +
> +	if (!qcom_scm_storage_machine_is_allowed()) {
> +		dev_info(scm->dev, "scm storage untested, skipping\n");
> +		return 0;
> +	}

FWIW UEFI uses these APIs, so if the implementation is correct, I see no
reason to worry

> +
> +	dev_info(scm->dev, "scm storage size %llu bytes\n",
> +		 info.total_blocks * info.block_size);

dev_dbg?

> +
> +	storage_dev = platform_device_alloc("qcom_scm_storage", -1);
> +	if (!storage_dev)
> +		return -ENOMEM;
> +
> +	storage_dev->dev.parent = scm->dev;
> +
> +	ret = platform_device_add(storage_dev);
> +	if (ret) {
> +		platform_device_put(storage_dev);
> +		return ret;
> +	}
> +
> +	return devm_add_action_or_reset(scm->dev, qcom_scm_storage_free,
> +					storage_dev);

fauxbus?

> +}
> +
> +#else /* CONFIG_MTD_QCOM_SCM_STORAGE */
> +
> +static int qcom_scm_storage_init(struct qcom_scm *scm)
> +{
> +	return 0;
> +}
> +
> +#endif /* CONFIG_MTD_QCOM_SCM_STORAGE */
> +
>  /**
>   * qcom_scm_is_available() - Checks if SCM is available
>   */
> @@ -2449,6 +2626,12 @@ static int qcom_scm_probe(struct platform_device *pdev)
>  	/* Initialize the QTEE object interface. */
>  	qcom_scm_qtee_init(scm);
>  
> +	/*
> +	 * Initialize the SCM storage interface.
> +	 */

/* This fits in a single-line comment */


> +	ret = qcom_scm_storage_init(scm);
> +	WARN(ret < 0, "failed to initialize scm storage: %d\n", ret);
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
> index a56c8212cc0c4..3b68b33c5ccc3 100644
> --- a/drivers/firmware/qcom/qcom_scm.h
> +++ b/drivers/firmware/qcom/qcom_scm.h
> @@ -149,6 +149,9 @@ int qcom_scm_shm_bridge_enable(struct device *scm_dev);
>  #define QCOM_SCM_SMMU_CONFIG_ERRATA1		0x03
>  #define QCOM_SCM_SMMU_CONFIG_ERRATA1_CLIENT_ALL	0x02
>  
> +#define QCOM_SCM_SVC_STORAGE			0x1a
> +#define QCOM_SCM_STORAGE_CMD			0x01
> +
>  #define QCOM_SCM_SVC_WAITQ			0x24
>  #define QCOM_SCM_WAITQ_RESUME			0x02
>  #define QCOM_SCM_WAITQ_GET_WQ_CTX		0x03
> diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
> index a55ca771286bf..41f799d8de54f 100644
> --- a/include/linux/firmware/qcom/qcom_scm.h
> +++ b/include/linux/firmware/qcom/qcom_scm.h
> @@ -53,6 +53,36 @@ enum qcom_scm_ice_cipher {
>  	QCOM_SCM_ICE_CIPHER_AES_256_CBC = 4,
>  };
>  
> +enum qcom_scm_storage_cmd_id {
> +	QCOM_SCM_STORAGE_INIT      = 0,
> +	QCOM_SCM_STORAGE_READ      = 1,
> +	QCOM_SCM_STORAGE_WRITE     = 2,
> +	QCOM_SCM_STORAGE_ERASE     = 3,
> +	QCOM_SCM_STORAGE_GET_INFO  = 4,
> +	QCOM_SCM_STORAGE_DEINIT    = 5,

6 -> _MAC_MISMATCH -> EBADMSG? (invalid data hash)
7 -> _ALREADY_RUNNING -> -EALREADY
8 -> _PARTITION_NOT_FOUND -> -ENOENT?
9 -> _READONLY -> -EROFS

> +};
> +
> +enum qcom_scm_storage_type {
> +	QCOM_SCM_STORAGE_NULL    = 0,
> +	QCOM_SCM_STORAGE_SPINOR  = 1,
> +};
> +
> +#define QCOM_SCM_STORAGE_FW_VER_LEN	32
> +#define QCOM_SCM_STORAGE_MEM_TYPE_LEN	5
> +#define QCOM_SCM_STORAGE_PROD_NAME_LEN	32
> +
> +struct qcom_scm_storage_info {
> +	u64 total_blocks;
> +	u32 block_size;
> +	u32 page_size;
> +	u32 num_physical;
> +	u64 manufacturer_id;
> +	u64 serial_num;
> +	char fw_version[QCOM_SCM_STORAGE_FW_VER_LEN];
> +	char memory_type[QCOM_SCM_STORAGE_MEM_TYPE_LEN];
> +	char product_name[QCOM_SCM_STORAGE_PROD_NAME_LEN];

I would strongly assume all variables here are little-endian as well

Konrad


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
