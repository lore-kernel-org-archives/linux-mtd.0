Return-Path: <SRS0=3IXU=IX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71F4EC433C1
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Mar 2021 14:48:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BB27619F9
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Mar 2021 14:48:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BB27619F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7xfZ5S39QCerGARsOcEWR42W3/fbfSv891ptzYK5QgE=; b=UmAhARjVP3PvI1DLPCD94cCvV
	dxaskh4cUgCbYf6jC3c2uoE1+edo2aeAtJzk1mQXx2G0KXIWooZM9a8UmTr9wN+jqC1Oszhurk8R8
	OAVSMT4zknrHyagxQWEsWYiIzkIohf6vk1HaxwCCZSbS3o8uYN22FBcU6ciPr1xyrcumDWj+hKCyQ
	23OI4/gn4Z0DsZ0SfyfBN/YYgclfjr0XRZQDeSU3+ebvffXnKgEtnygToEq8Bacdxy8ZapfQwJrsg
	t7Qm9l0y4PU2xHJlJiDiUUxT0x5ehPVgduzky+odIGkeetxOHW+/wpU4bqQk/1pTQXnmCC9HJRYJz
	UGOp6GlzA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPRGg-001ei0-1b; Thu, 25 Mar 2021 14:47:26 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPRGb-001ehA-N4
 for linux-mtd@lists.infradead.org; Thu, 25 Mar 2021 14:47:23 +0000
Received: by mail-ed1-x52d.google.com with SMTP id j3so2673049edp.11
 for <linux-mtd@lists.infradead.org>; Thu, 25 Mar 2021 07:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3m9zvm/uNXQp4Nhn3WtheY2obop3zeU7t0enahEMFMY=;
 b=D/yF501s1/e/qxWHddNUFGHsQkb/eUOCko7GrSZ4vz8udmBvAXZ0yfxgrkg0mgdtAD
 O26PtrbHEl0qxoy7/ZuOUmMgYUyPMsYuvJ3DPoqDvyeIY1kApo1iGSXwdqtIpX9pYg10
 mYgRWNd6n1uXm/k+H+UQY+4myVZ6V7DaHnr7N4Ur1JPZIRcDZHqDzCIrbofomN90AbwB
 fQ/i0W3UTSZjnPjdGNfdHBZ5zdGTDO/BKjgAcTkPdKzZrhutzVco1OxxSjREuIvosw2Q
 tcIvv/h5560nwWeKoUSuHVqxtmML6FsNXObeXs7+r3n/+ycMqtpnr/VBbZxD4K7RKijO
 d3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3m9zvm/uNXQp4Nhn3WtheY2obop3zeU7t0enahEMFMY=;
 b=RbrX+9DFMPeZ1vlJ4XisTsZP1j+cKmWb7aUABGRb5SC0fJFpuvenqqow5WLovBhb8+
 01g1gDJBciQf35QOTKI6cyqSrZ0/Ho8flXgPLPLlKXh/dnLRK6EheXfVc00BrcI626aI
 9ay27pbsOeSbuQCBZ0p3GQZRlmHi/a7uHzblRWRIui6KL2gL1YVT+kn2QHPlGT74s5p6
 CEE8e5B/JOcQXqXnZIw/dYG++jJUxXw9eSalBzXEaE828SfhBzcGmA3WzE3L+S9PT42M
 rmf1sHYS2oKgrnKzx2E1SgTrjmYxZoGIx4uR+r9FAsPiJw14WzgtKF+x01KXn3DBut7e
 2kIg==
X-Gm-Message-State: AOAM532fICzS/Fbn9QQB8vMRJFZzbGVJarrQT+xPZgEx/3Ks4xEufEh0
 qj4Bq72FHWo9jVGs9As1JpPnncL2cwVXhwNfU5D6028=
X-Google-Smtp-Source: ABdhPJyI4mmVPIK/XpB8N8Xr76HppNjUJrjQoiu3Tt92psheShuoJUX/a7DoAV66TZJAIutDHyvwZOx7eU34c8HF8DY=
X-Received: by 2002:aa7:c98f:: with SMTP id c15mr9719993edt.231.1616683639014; 
 Thu, 25 Mar 2021 07:47:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210316141916.447493-1-rsalvaterra@gmail.com>
In-Reply-To: <20210316141916.447493-1-rsalvaterra@gmail.com>
From: Rui Salvaterra <rsalvaterra@gmail.com>
Date: Thu, 25 Mar 2021 14:47:07 +0000
Message-ID: <CALjTZvaX8miSycr4oGmF_rGN4KWWBzfyBj1-7jefT=Uz3w9Oww@mail.gmail.com>
Subject: Re: [RFC PATCH v2] jffs2: add support for zstd compression
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: lizhe67@huawei.com, christian.brauner@ubuntu.com, gustavoars@kernel.org, 
 trix@redhat.com, keescook@chromium.org, dwmw2@infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_144721_890149_3B952279 
X-CRM114-Status: UNSURE (   8.00  )
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

Friendly ping (and also cc'ing dwmw2).

On Tue, 16 Mar 2021 at 14:19, Rui Salvaterra <rsalvaterra@gmail.com> wrote:
>
> Implement support for zstd compression in jffs2 at the default compression
> level (3).
>
> Lightly tested in OpenWrt, on a single CPU embedded MIPS32 system (AirGrid M2).

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
