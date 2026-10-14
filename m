Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79646CC6B1A
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2026 04:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ejmZ4f+/oOepSi0pJXG03iSWislDOW2/puu3tMdqzvg=; b=hzykTghgvNXTUN
	BOtAGCjB5hb6IirH9kGB+rqJeJa7T5u/cyH5b1kiY7z6cMuCzX2ipwOthFwBuk906VXV+20CLqOxS
	bWYCk7Wpaj1C5lvsDYrCVkJL2DSLM1H7fUUgKoTgp4KbRmHx3K/rdMMZOdynf6lMlA1ECSXaxkamv
	459vvio2zamKZ3IITH3oIvy1znAlGVM+o68RHt4tIcRV5YcMu2/oSiuNfVdF1eM3JyU9GCHcZZrxZ
	u9nxViy9Gk4HY6Ovws4QFvjrlpamtxnu7EPjab77emne1AG0qJWq8x6IaTxocDn/pyvBM907Etmbr
	gTwbd2JZ9O+SDL3/WwXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGqXw-0000000EUpV-3Nse;
	Wed, 14 Oct 2026 04:24:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGqXt-0000000EUp1-43OR
	for linux-mtd@lists.infradead.org;
	Wed, 14 Oct 2026 04:24:55 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DK5iQA442751
	for <linux-mtd@lists.infradead.org>; Wed, 14 Oct 2026 04:24:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R/YWOWusTmnn9Tx8/iLnPWjpANYDhhlrDY+RymDC9lQ=; b=mfBIXI1uLAOYHNpx
	M+pskrgQQbpJj/+60jNFLzZFxHw2r6RDPCnEYQak0C68FqNpjyua8eynX8SGcd1Y
	2J1k4+K/t/BHMHnNSVt94VWd+zjp21ADu/+gT5GHSxkze+TVoAJ8ZcEJUegyUcj3
	l02tjV+K80HtT6WpkHCz8hJA1pNAkGFI0embeDgtOOxCvfUQQ4c9lcW5zqnNjbim
	+IIDJbRdlgftjP27N4Ac7M+zpCtJs+D/UR8kPP45vYPVDrD5gR3xqxJhNmnwyIgi
	K4kI1TWbCLNx+Vt70sIiD4gGFEtC25wsPGiQD9gMthErtmViPMA3SxZL1fMU3msx
	O1ZOMA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9n71kh5e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Wed, 14 Oct 2026 04:24:52 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39deda201bcso6038201a91.2
        for <linux-mtd@lists.infradead.org>; Tue, 13 Oct 2026 21:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791951891; x=1792556691; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R/YWOWusTmnn9Tx8/iLnPWjpANYDhhlrDY+RymDC9lQ=;
        b=E06+MBW/FvCjPZX1m2m59kzaROtU57+zaSaEhdAgTUDr3FQ25N8PXb27nWas84sm25
         ecdnvFf5aaNUoMTvwzYSV3GC0Ul+DMCRQm7lIvJM7RJc8P/SroHWZVa1A451lHkbZlbP
         6LcL92pLQLoz9+yeGAfvgDKlJpRXwY4+2WMti8B1OPXgX0q4FkY7ef2hpiy+ohWcP9ss
         Swep2bQ8fJ4yC8nizoq6QUE/RaGkorH9EGJxAXzy+qLdPWofhJnhmy1nRGtq8YdYa3Cr
         YJ7NZwISidLJsH5xwjwvOnsjg49q+564Ao2iuCnmEpWYJYkm8RBkvt7PfXYDe9kNJ+Iq
         12/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791951891; x=1792556691;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R/YWOWusTmnn9Tx8/iLnPWjpANYDhhlrDY+RymDC9lQ=;
        b=eFbxvudW9pcp3se38FMJRj1jz/vSTOpbCDh29ZtOI/qPsTdKObIQ5YGrvk7nWk9V/d
         WW0mTZ8NRZVgWa7LV8FWxIWcY7wnY+ODlyJ+pTdtyLQS3SrBHSCSXVFosoh5ByNWIZkD
         4MTrTeEN0x6xOeLN4OZ/L5rfPItb0m6rFcK7Vm3QNcoHHmu5frq2ul+2+z2KLGZhTBjl
         bVsdDJs+HjmO+qkaz9Rmd5ONeb633i5aAoDoVGZ70fwFQdZBxB1TFMJ/U3BFLj0NwbDX
         Cc4q0vuaNN5CQPnHPjXNR6nKOS9mrXI5cEe6nTTrqoHIXbUhmaFoL4LTBw/vQEHZcVpz
         TFYw==
X-Forwarded-Encrypted: i=1; AKwUvBxzqT+9F1Hkdi/0KkDvAuBI7iwWBn+hwYPHsK7irUHCs9M6jubfAkOQlGDYGd96eD3a0zfEexrWHzk=@lists.infradead.org
X-Gm-Message-State: AFq9FYIcN8Pf1u1NiZVxZVJV7fXYaAQUp110vz0nwi1FQRhdGLFMvAV6
	+icBeHPHJQ2SxwGNOYLDJyfrlJriJFYrsU7Z/T+aGp6Jn69jHWPG+ML4fjFufak4e3eRrK7NhhV
	CZOuDO3bQaFi0uBVUJnkotUm4KUiJCPUwuYINwgQxePCFLBUKTK63ZUwL8vhptYekeMEe
X-Gm-Gg: AYBFou0hyAxEvH3zUVt2bNwcu5k/uabm7hWQIvhyYUm2b9daDOl1MEyIjeg7jMvsnZQ
	OnQc19OwCiM4AFfmOLJvanbkaP8YOduO2cKd4JHf0iXrgfrY1LqGpLdP+amB3hXF13IuAAW5x+V
	f44VpHIkGe2wEI84POzL/wBXU79tw1N6FL29jgLsISeplJjkNQoQU7nSsmMM6A9XBd9BCaqEjjm
	ZsCDdgRkILUKz40l8uG7aBmjzF9qRF9jRORL3zbJJHnrDnsktEgq7lIrmIMlByU+Y+YN3qxUedB
	zheeNLpLB1pZPpovVuVanUdX2bcKUKZiMtZ0FijSl/WuBqQEkyna5Fw+1vkGtoY5PQWJ0Mzi+OB
	hd5Ny6+EHHzWxkOORk6U4PKOiWjcH5AaLk2tuoazRR2l8DG0s+JFrwOpzwBev5h9agcHPZfZ1
X-Received: by 2002:a17:90b:35cc:b0:3a5:147a:3b63 with SMTP id 98e67ed59e1d1-3ab3a33db36mr12329644a91.8.1791951891070;
        Tue, 13 Oct 2026 21:24:51 -0700 (PDT)
X-Received: by 2002:a17:90b:35cc:b0:3a5:147a:3b63 with SMTP id 98e67ed59e1d1-3ab3a33db36mr12329579a91.8.1791951890405;
        Tue, 13 Oct 2026 21:24:50 -0700 (PDT)
Received: from [10.133.33.242] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac63279277sm860530a91.1.2026.10.13.21.24.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 21:24:49 -0700 (PDT)
Message-ID: <252e86f2-9663-4ac7-a19e-6056b44e769b@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 12:24:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/11] cpufreq: Initialize kobj_type release callback in
 ondemand and conservative governors
To: Ian Rogers <irogers@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Danilo Krummrich
 <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
        Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <chleroy@kernel.org>,
        Nayna Jain <nayna@linux.ibm.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        David Teigland
 <teigland@redhat.com>,
        Alexander Aring <aahringo@redhat.com>, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini
 <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Richard Weinberger <richard@nod.at>,
        Zhihao Cheng <chengzhihao1@huawei.com>,
        Felix Kuehling <Felix.Kuehling@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        driver-core@lists.linux.dev, llvm@lists.linux.dev,
        linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org,
        gfs2@lists.linux.dev, xen-devel@lists.xenproject.org,
        linux-s390@vger.kernel.org, linux-mtd@lists.infradead.org,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, zhongqiu.han@oss.qualcomm.com
References: <20261013223946.1836757-1-irogers@google.com>
 <20261013223946.1836757-5-irogers@google.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20261013223946.1836757-5-irogers@google.com>
X-Authority-Analysis: v=2.4 cv=FuqQbGrq c=1 sm=1 tr=0 ts=6acf0414 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=1XWaLZrsAAAA:8 a=Stt4M9KXtKJ5ZbChFzoA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 8fekANBB_j1nxmQFElLMClty5q0yCE46
X-Proofpoint-ORIG-GUID: 8fekANBB_j1nxmQFElLMClty5q0yCE46
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAxNyBTYWx0ZWRfX3aNZARMSok4p
 dT+dlqVZEd3qY9laF0hXK8J+Was/qR5ZJmjqFyJ/+W1lau7z8cz1tsVXwP+dRrVz/2iedW+1UmO
 hZJIcT0c+xQnEI+1DhQKwSKx7qBZUcyslaPIr9U8RMdR/xxgj6JgBf6891R6sGNdLkb2YL04yRC
 43eNCId2B9s0gs8APYiyU7BE0XsUY+9XeRM1QdRi7NUPGxRLotVJwR9hXBAJzl7U09gcE2UXfJ/
 ALUhteUWpU44h6g/0F+A8zTjBMVmdpw3wt4JaSqK1b8x8fLxoDsunbtnRZl5FEvSL0az9S/HIiE
 vaOLUyDHOchuUpF6CIVQv0ZuikveReNiNbtyPuvf8WJEs5v0W7BirZvD+lRMZTSuq8iyYXV/OoA
 EUBANtZorBEKDfCfQbOkWAZAWLVVR/gpIr1PJG4KpB7rrtmhI2vqDgSSvut4HjD+8sAzff8sE9y
 bMK+OX4PCSGEryVpAng==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAxNyBTYWx0ZWRfX4FoLTieG9YtU
 5Wlv8i20IfBsmZD6fSHHuJ+8MXifoGVnhLdtK1rMwVegfTMiZIRRQuGBlUkqwVjRvvC4L9P/Ljt
 U69fkWMQ9RdQgtZelQ1QVQKVvCNSo6Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_212454_132303_A9D42918 
X-CRM114-Status: GOOD (  28.43  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Ian,

Thanks a lot for the patch.

On 10/14/2026 6:39 AM, Ian Rogers wrote:
> Export cpufreq_dbs_data_release() and set .kobj_type.release in the
> ondemand and conservative governors so their gov_attr_set kobjects have
> a valid release callback, matching cpufreq_ governor_dbs.

Commit a85ee6401a47 ("cpufreq: governor: Use kobject release() method to
free dbs_data") has already addressed the missing release callback
issue(it adds the missing cpufreq_dbs_data_release() function.), with 
its Fixes tag pointing to c4435630361d.

Besides, "matching cpufreq_ governor_dbs." seems to be a typo?

> 
> This prepares for annotating struct kobj_type::release with
> __require_explicit_initialization.

It would be better to use "cpufreq: governor:" as the subject prefix.

> 
> Fixes: c4435630361d ("cpufreq: governor: New sysfs show/store callbacks for governor tunables")

Since a85ee6401a47 ("cpufreq: governor: Use kobject release() method to
free dbs_data") has already fixed the missing release callback issue,
current cpufreq patch 4/11 seems to only move the release callback
initialization to the static initializer in preparation for 11/11. The
same callback is already set at runtime in cpufreq_dbs_governor_init(),
so there is no functional change or bug fix here. Should we drop the
Fixes tag?

So, at least for cpufreq, the issue described in the cover letter
doesn't seem to exist, right?

"Patches 2-10 fix 10 struct kobj_type definitions where dynamically
allocated kobjects, ksets, or enclosing structures were either leaked on
kobject_put() or freed prematurely before kobject release"


> Assisted-by: Antigravity:gemini-3.1-pro
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>   drivers/cpufreq/cpufreq_conservative.c | 5 ++++-
>   drivers/cpufreq/cpufreq_governor.c     | 3 ++-
>   drivers/cpufreq/cpufreq_governor.h     | 1 +
>   drivers/cpufreq/cpufreq_ondemand.c     | 5 ++++-
>   4 files changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/cpufreq/cpufreq_conservative.c b/drivers/cpufreq/cpufreq_conservative.c
> index 0b32ae28ec85..38c3bd5bf75a 100644
> --- a/drivers/cpufreq/cpufreq_conservative.c
> +++ b/drivers/cpufreq/cpufreq_conservative.c
> @@ -316,7 +316,10 @@ static void cs_limits(struct cpufreq_policy *policy)
>   
>   static struct dbs_governor cs_governor = {
>   	.gov = CPUFREQ_DBS_GOVERNOR_INITIALIZER("conservative"),
> -	.kobj_type = { .default_groups = cs_groups },
> +	.kobj_type = {
> +		.release = cpufreq_dbs_data_release,
> +		.default_groups = cs_groups,
> +	},

Nit: In that case, may I know can we also remove the following runtime
assignment from cpufreq_dbs_governor_init() as below:

gov->kobj_type.release = cpufreq_dbs_data_release;


>   	.gov_dbs_update = cs_dbs_update,
>   	.alloc = cs_alloc,
>   	.free = cs_free,
> diff --git a/drivers/cpufreq/cpufreq_governor.c b/drivers/cpufreq/cpufreq_governor.c
> index 710d93ec89b5..97b64985927d 100644
> --- a/drivers/cpufreq/cpufreq_governor.c
> +++ b/drivers/cpufreq/cpufreq_governor.c
> @@ -404,7 +404,7 @@ static void free_policy_dbs_info(struct policy_dbs_info *policy_dbs,
>   	gov->free(policy_dbs);
>   }
>   
> -static void cpufreq_dbs_data_release(struct kobject *kobj)
> +void cpufreq_dbs_data_release(struct kobject *kobj)
>   {
>   	struct dbs_data *dbs_data = to_dbs_data(to_gov_attr_set(kobj));
>   	struct dbs_governor *gov = dbs_data->gov;
> @@ -412,6 +412,7 @@ static void cpufreq_dbs_data_release(struct kobject *kobj)
>   	gov->exit(dbs_data);
>   	kfree(dbs_data);
>   }
> +EXPORT_SYMBOL_GPL(cpufreq_dbs_data_release);
>   
>   int cpufreq_dbs_governor_init(struct cpufreq_policy *policy)
>   {
> diff --git a/drivers/cpufreq/cpufreq_governor.h b/drivers/cpufreq/cpufreq_governor.h
> index 73b8ed7cfaae..c03d067f42eb 100644
> --- a/drivers/cpufreq/cpufreq_governor.h
> +++ b/drivers/cpufreq/cpufreq_governor.h
> @@ -148,6 +148,7 @@ static inline struct dbs_governor *dbs_governor_of(struct cpufreq_policy *policy
>   }
>   
>   /* Governor callback routines */
> +void cpufreq_dbs_data_release(struct kobject *kobj);
>   int cpufreq_dbs_governor_init(struct cpufreq_policy *policy);
>   void cpufreq_dbs_governor_exit(struct cpufreq_policy *policy);
>   int cpufreq_dbs_governor_start(struct cpufreq_policy *policy);
> diff --git a/drivers/cpufreq/cpufreq_ondemand.c b/drivers/cpufreq/cpufreq_ondemand.c
> index 9942dbb38dae..7386d043c665 100644
> --- a/drivers/cpufreq/cpufreq_ondemand.c
> +++ b/drivers/cpufreq/cpufreq_ondemand.c
> @@ -374,7 +374,10 @@ static struct od_ops od_ops = {
>   
>   static struct dbs_governor od_dbs_gov = {
>   	.gov = CPUFREQ_DBS_GOVERNOR_INITIALIZER("ondemand"),
> -	.kobj_type = { .default_groups = od_groups },
> +	.kobj_type = {
> +		.release = cpufreq_dbs_data_release,
> +		.default_groups = od_groups,
> +	},
>   	.gov_dbs_update = od_dbs_update,
>   	.alloc = od_alloc,
>   	.free = od_free,


-- 
Thx and BRs,
Zhongqiu Han

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
