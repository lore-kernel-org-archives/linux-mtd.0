Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E16E8CA1009
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Sep 2025 19:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L+i6/FhYX5sjxKKCa43G2NMOB7/7eDF1KbE9dedn+8Y=; b=K1BCdThNRNyc3L
	PTaY2BWkKbz8Vo2GVIvhIkwYacnUGA1Cu10DwLLA7pi11FYTVfO+NEu6PSiJ5Q92DSuVt8/omYqwG
	ihSJkjt+M7ygWE8LBHMrc9UVGyecyk+HwL1dGKvMi9F+3dZ0qf1HMl+U4MJnkIMunKMkAXemAeU1G
	zvp/PRpo0/xUHGQomoTdlVJ6wowWOO+5JeQfTy/m7oz4OU+G5Mg+npqdCJtHXC/suFCuLLdqcv39/
	z49l1kTMpVHk8lBx9kiH0xhtNGllcQSm7QcxLi7dkAlxdJg9FfWaEHV8xgwPZC2xO/YzUxnzZ4FIg
	xQTpGbXyvmjhXsSWwIFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utt0P-00000007QuJ-2bJg;
	Wed, 03 Sep 2025 19:18:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utoTs-00000006jjl-0dRy
	for linux-mtd@lists.infradead.org;
	Wed, 03 Sep 2025 14:29:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CA3FE437ED;
	Wed,  3 Sep 2025 14:28:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52280C4CEE7;
	Wed,  3 Sep 2025 14:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756909739;
	bh=+xPOd4f45WPDr95sOTBzfgNj/2vz11TzolSQbfG5XQ0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=bZ2rW4ICLruJv+JGuSoMKakoBEXTp7Jk+d8cZZE6AWS2vP8Q0+SjNxja7oaHFuFIS
	 T4NunFW3lyX3Vw0OPRQ34DkUuxlG7taH4iJY8GP4lud5Ef60YjBZpWlpDCqk2qiqZx
	 V2nUA3TbmADKujnSXGvXtqpz3FRPotHUjPE+pU5HsGmU+8fxMakCUL2oK5AxBg1q5i
	 Trh+5mkmVhTE6pudGS9IEzm4BDkrpHDBQ/JLPQqx95gQkn/gIRnJRLoK3lN9jKW/jc
	 z6jbh2EXREThbt2DeG85nafhlKBC+dHvhda9xfxa3wj/DkwhjVtT6LLJzKi1GAlbjr
	 vhIjwBjO7jpzg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Rahul Kumar <rk0006818@gmail.com>
Cc: miquel.raynal@bootlin.com,  richard@nod.at,  vigneshr@ti.com,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linux-kernel-mentees@lists.linux.dev,  skhan@linuxfoundation.org
Subject: Re: [PATCH] mtd: sm_ftl: replace strncpy with memcpy
In-Reply-To: <20250903121746.2527046-1-rk0006818@gmail.com>
References: <20250903121746.2527046-1-rk0006818@gmail.com>
Date: Wed, 03 Sep 2025 16:28:57 +0200
Message-ID: <mafs0ms7bvcd2.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_072900_206966_21FB65AB 
X-CRM114-Status: GOOD (  17.23  )
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

On Wed, Sep 03 2025, Rahul Kumar wrote:

> Replace strncpy with memcpy in sm_attr_show and explicitly add a NUL
> terminator after the copy. This aligns with current kernel best practices
> as strncpy is deprecated for such use, as explained in
> Documentation/process/deprecated.rst. This change does not alter the
> functionality or introduce any behavioral changes.
>
> Signed-off-by: Rahul Kumar <rk0006818@gmail.com>
> ---
>  drivers/mtd/sm_ftl.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/sm_ftl.c b/drivers/mtd/sm_ftl.c
> index abc7b186353f..575e137ce8f3 100644
> --- a/drivers/mtd/sm_ftl.c
> +++ b/drivers/mtd/sm_ftl.c
> @@ -44,7 +44,8 @@ static ssize_t sm_attr_show(struct device *dev, struct device_attribute *attr,
>  	struct sm_sysfs_attribute *sm_attr =
>  		container_of(attr, struct sm_sysfs_attribute, dev_attr);
>  
> -	strncpy(buf, sm_attr->data, sm_attr->len);
> +	memcpy(buf, sm_attr->data, sm_attr->len);
> +	buf[sm_attr->len] = '\0';

This writes one more byte than strncpy() (which would stop at
buf[sm_attr->len - 1]). Is this safe?

>  	return sm_attr->len;

Since you write sm_attr->len + 1 bytes now, I think this should also be
updated.

>  }

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
