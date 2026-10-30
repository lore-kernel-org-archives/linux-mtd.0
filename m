Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EFF606A31D
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2026 04:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aK+DFe9i;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YdrtPxvh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+vGhnvdgm4w83NfkR6ulua/KOIkkzHnWrCuJ9qeHcuc=; b=aK+DFe9isGX1csTvk0lZCWRhML
	enfMbQ0Pg/PCXDefYH56bWOIV7gSlRhcaBgR7NVee0+athpeIh/vigJQAudV2Z5E2SKRB+9I5XSkZ
	+VBvVBbxRm+g6pziz05od1pCDMUbjWUhqTBSCZb5f6xKeG5MgOf5vn7JqQzJeEiXf4OFuDuZSyLvw
	oSrRohfou13KFcjB+pYcbcUHXAUdptRNWOUlcNTgbkyRkF7yddRxPlpS2GlQ7875HfVFbvVYG+Azv
	MLgBdkzSDQjaptFWglei6dFUTRmPOrlXAiowqDNfBvrlThce4LpnaQWcpnYMbNCbeDUK9qu/Zlejc
	lzfX+jxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMdsO-0000000AnLR-0tGi;
	Fri, 30 Oct 2026 04:06:00 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMdsJ-0000000AnL4-2yb8
	for linux-mtd@lists.infradead.org;
	Fri, 30 Oct 2026 04:05:57 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-3514b90bb89so632145eec.1
        for <linux-mtd@lists.infradead.org>; Thu, 29 Oct 2026 21:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793333154; x=1793937954; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9CvywPHpjrCT0zo2JhnH11M0JaZbySgNZTi9n8+NQFc=;
        b=YdrtPxvhM6x+zVcVLfMqQLBLHY7lRxkvliAbWd+BbqKrt2sHKocgHFqzpi/XMJyMs8
         EkYXTB/KMxOdop83tWDMrcZ8nx4dnibQWtia7UnIttULb84Na66ikNfSakLnsR1b8HwR
         NHEPXQlqkN0JE5TkthfuLlXdtjf01SJKOU5JOLRZF40hR2TldxeGkCwZBJmqstNbxX8Y
         FyKlzFP+qog3aLIU+usNEkFDLcLoqzA+4bsnG0buQYH9awRkDTCChfK44/jh4mXzrKWn
         t7yla86Wca9wArx5KkUZN1icNA9GpCw84VFLNsni1mNtARnRYzPjimbFbXXV3ABLBsU9
         sBgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793333154; x=1793937954;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9CvywPHpjrCT0zo2JhnH11M0JaZbySgNZTi9n8+NQFc=;
        b=ISC6KQAVi5Lkx1uZsWw3rawFg/zzfg+Mq+ldIooQotdJSTaxuai1kF+dQacONR7Oxw
         OsFspZJ/I0bb9mY65ZiqOyUuIKCGkQiNqk8jaGnPyxgoclB9VPk+mcMN/Rc5SvUSXu+6
         k6+kEuVZJwehMYsm9C/mHCoh4nm4EYd8M9eLftoxoYXuDHNv/kMC/qCaeObZ90Oh7Xkg
         P56yuPsn8jwMd6V/Eo9S9vazN1oem7qYu8dPpCt1Vq3zw+yNF4pARb3AQBLTBaJvQUz4
         rFlgRsUsiHeo/PD9AF0yjBH/htCLuhdBDQgljeFRPfo/pqN6zoIBkp9+OOViSKPpjqYQ
         LFWw==
X-Forwarded-Encrypted: i=1; AKwUvBwdnc7dT+FCnkzeuBT6b6h9ZYXt9JaCTMITvFyb2Ncu0E0pWnrQqdSq1kzh1K3bs0E5Itdy1kfVKe8=@lists.infradead.org
X-Gm-Message-State: AFq9FYLTAkEUORi5fzr/WGfzs7GNutrrJ2hu3ktD+0CjgNlEdCS/inP0
	AQ4c5rnvoSukiTHrfULDlN1CIevSAF9PUwHD/CbJahxR/uyjQXaEtwvCH5Gev8jDgGk=
X-Gm-Gg: AYBFou2IaXhlrzYFMJIyNub3NLOZ+MrNBaz0fi7VIORMMJXDB4/qjNFsE8Mx7zTk3FF
	leZBDg2KO5/OfXKycSh9ie2uOb3o54Y1T3wnU7j3KY1PnuOiPUSG9F1WsQx7E5jC+4jlM+BArw3
	SacylUZo5kWKNgups0Kcvn1JtZOISDEnef0yN6ZMbScNXCz3nzH18Ibw5RXFTtiYsBcrPmF0xB1
	Dk0xk8fk8dNtxu6lnxI2UnKe6N87cN3DaNhmQBDqUAkoN+FV/rLuEda9mYfekxotAEGs5dmlnCK
	VDYrPmmQX0wj0ZuIw/UXZiv7NHNfuF/4hOkQQyTceRdrXgRvhbZ0GmztRmyZ+SnE44nmeSlCuTM
	MTX5izCx5FHGPtJqRDjZFNgjv86Z9AkYRlLOrp/b/bp0aD3l4n/PxK+hO0Y7arlmxrzRgcKY2QS
	zKSStf3RM3HKZtI5N5RVKaIQ33EMbpiaa/Frz2ZRliw0R4QY5iuZRRtnAB2sAwW+hcSrIQTbkRa
	ofWqwnfjiXtyV32KXM0YESWalmDe5pNLcI1OMnSqdOoVmgh/hxNTJt/fs0eLkU6Zdl4lt1+Bp6S
	I5Oe7b+13FH8ASclZy5BlDQAxw6ZhHc=
X-Received: by 2002:a05:7301:53cb:b0:35c:e696:2d4a with SMTP id 5a478bee46e88-36a423ea99dmr1772736eec.24.1793333153319;
        Thu, 29 Oct 2026 21:05:53 -0700 (PDT)
Received: from localhost ([122.172.82.240])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4291e38fsm3512579eec.15.2026.10.29.21.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 21:05:52 -0700 (PDT)
Date: Fri, 30 Oct 2026 09:35:49 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: Ian Rogers <irogers@google.com>, Kees Cook <kees@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>,
	Sumanth Korikkar <sumanthk@linux.ibm.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, driver-core@lists.linux.dev,
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
	linux-s390@vger.kernel.org, gfs2@lists.linux.dev,
	xen-devel@lists.xenproject.org, linux-mtd@lists.infradead.org,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/9] cpufreq: governor: Initialize kobj_type release
 callback statically
Message-ID: <auQXnep2xKpuNJOF@vireshk-B250M-D3H>
References: <20261027223847.652884-1-irogers@google.com>
 <20261027223847.652884-5-irogers@google.com>
 <CAJZ5v0juvZ2ZVRBkY6FxBM=NhPt9vMA3+yRugXc5u=U1jO9AXg@mail.gmail.com>
 <CAP-5=fWVZ=7-qDRODiEQzRzhpQqribv9Morj=OoAXW_6uaW2dA@mail.gmail.com>
 <CAJZ5v0i0YoOW+ueh_aZJdYVS0etuCqfrf_S0NTKzCE9_6oKxPQ@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJZ5v0i0YoOW+ueh_aZJdYVS0etuCqfrf_S0NTKzCE9_6oKxPQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_210555_927977_FB184ED4 
X-CRM114-Status: UNSURE (   7.05  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 28-10-26, 16:39, Rafael J. Wysocki (Intel) wrote:
> I'd expect the driver core to pick up the series as a whole then, so
> please feel free to add
> 
> Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org> # cpufreq

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
