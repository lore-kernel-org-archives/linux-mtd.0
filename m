Return-Path: <SRS0=FWsg=HL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09878C433E9
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Feb 2021 10:52:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 932D560232
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Feb 2021 10:52:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 932D560232
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KNL59lVyLAaZ8AdlJRDS9xKcEri6x6+Y0Nv5NjOT5aI=; b=StN/+w2JHvALnbEc+jqUpWz9r
	7UUcrbg2ggIW8yzJTlo16qcMN2Ml2izZCrI/vEKk9dAOBOK5+i7UvfkvJaemzbwID0Cb59WF4ysnK
	552jg8mUz2HviEIaueKrLgLR3la3809nMOMOI2UPskIdQ2jzRihT7oidTgYlNtBPdIgdRS9uvqG/P
	d9KlWbeC7V0S08dZRtUbvd1xKTtV1IOUCCLegLTJMGpNuQyqmCjJPDZb4ZBYC9aJcMgzxYeLMUkWF
	84wOxd6D162jQYh/2HTA5AObPJ7SIRhRX2r5rrOKeqi6IdI2GKpJyU9XL3zM4DEpM23qoBSo+eOae
	RVYufkt+A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9Qco-0003lJ-U0; Tue, 09 Feb 2021 10:52:06 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9Qci-0003iq-GR
 for linux-mtd@lists.infradead.org; Tue, 09 Feb 2021 10:52:01 +0000
Received: by mail-qt1-x834.google.com with SMTP id c1so12615306qtc.1
 for <linux-mtd@lists.infradead.org>; Tue, 09 Feb 2021 02:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f0Zy9zy1mqYJNW3MaYOV2YR579JFXDa4r1wK7boolLw=;
 b=R2bqc2P9d3MCrDxyDqTkXkuLtWzGFBcALgvlccAlLKyU8fqvW7pYeH86O0im3TCfwP
 j/Q2qeZNh/ZZ8sIpfs852lIm/RTVEE8aAQ5mUSy4V3fHSt5NV+oaXsuSBYuip/yvThLk
 OGrl0z4ecVHbXe8fjvv2reuEQ1ipwYus81pwRqbSPEl3hb6RPui6pCViTWscBGHQoGwK
 yQTIyFglK0wjV7r0qC3K+RIsKbqy7zdmVyHPj1zwjZ+3dqJFz8lUl7wVjCSMmQG/CgMb
 yOfYBR2hnYXDSpypmVOosn0F6UabM2dVB73udXmFiKOwAqFJSZJva0/CoeaW17P04KyH
 P1Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f0Zy9zy1mqYJNW3MaYOV2YR579JFXDa4r1wK7boolLw=;
 b=FnTRWSo+XIG3h2TMR+LeEeAjuOUjQsLjASmN7zLu/IffmSSs/xlKegbYeTkkCuH65Z
 NgvS0aiW3UTT36rBYSeJorn9CenHKgqx4i+FkFtCOj8LP4kM4PgNiblMUXIwBCfwm9NQ
 khz5VR4STVHb43HywNTrcgEBNdxA8O1o5vZ/rLdG2XyuBsYRWmnREKJSpONQ+SnA3l31
 jdGiQ/Im3J0n0s67zR7NLJkYoGX8DB8uQ4oVLyOi4QeNq1CcqHB4BLusrIw9cNrn4iWr
 xQq9XVHAdGhmL2eLB4fR6JHZ9mzp9IU063oALcYw5pfTkkWaJ3xTBduZQlt7X/+jo5eu
 buIg==
X-Gm-Message-State: AOAM532Cel84s1YWTsFiLmJ3csIGvkz0BJ790uG4Cv2MJsMl8X1y1t/f
 hMtLNE6wIRhOYuHMSfD5noilTTkRfCzNuduxE+M=
X-Google-Smtp-Source: ABdhPJyUpq1zwAu4OmW7EOmc2O3ggiF/nHROY3YjMvhAPWBBhkP4NTWKYuK28z+UNE6AyptUwYTNcu/fbhDebecbiDM=
X-Received: by 2002:ac8:2231:: with SMTP id o46mr16394793qto.245.1612867916978; 
 Tue, 09 Feb 2021 02:51:56 -0800 (PST)
MIME-Version: 1.0
References: <1612684327-115106-1-git-send-email-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <1612684327-115106-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 9 Feb 2021 11:51:45 +0100
Message-ID: <CAFLxGvxC4KtvtU2rza_aGx2RPONxr7XygUwXCDriYiCr8qN3qg@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: convert sysfs sprintf/snprintf family to
 sysfs_emit
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_055200_574865_0FDB1B96 
X-CRM114-Status: UNSURE (   9.79  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>, LKML <linux-kernel@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, Feb 7, 2021 at 8:54 AM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> Fix the following coccicheck warning:
>
> convert sysfs snprintf family to sysfs_emit in 'mtdcore.c'.

The patch still does not explain why this is needed and what it fixes. :-(
"A bot told me to change that line of code" is not a valid patch description.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
