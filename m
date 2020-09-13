Return-Path: <SRS0=DhJx=CW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AA53C2D0A7
	for <linux-mtd@archiver.kernel.org>; Sun, 13 Sep 2020 19:08:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0AF321655
	for <linux-mtd@archiver.kernel.org>; Sun, 13 Sep 2020 19:08:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q6OBaTtY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pf+0f9sD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0AF321655
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IAsCnxM+IJmLLIA9gW4XPYJOwUdJxd71XoEalQOvXKA=; b=Q6OBaTtYKri5cwAKxJPIYb3hx
	TJWkdZC49reImXxy0VWa7FM9yuSyUCSMxWeFfQTHQK1FSA7q+0MAWIhTKCc76/MbhTDoGt9/nNsKV
	LYLwLq55Q11K81z9BYdR7sfwJLBOMWS+ppTXRyZMSqVn2FRmH6jXTgN4nUmPUaYMxrirLklcqNI9R
	2mgNFUYciDwotkMEIVyBBqbHH42U65WZV4OY5pgsuSlWzOCQmbqkenagFN6QveTUIH0Kb2eC9FLun
	9T3plNSAVJBaayiGsev3N4FiEUUw6tSU76iT/24E18BVRGZLElSvFJSQnp1lemcCxfV8SD9/5sLWR
	JH04AoqyA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHXMM-0003mI-70; Sun, 13 Sep 2020 19:08:22 +0000
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHXMK-0003lx-1o
 for linux-mtd@lists.infradead.org; Sun, 13 Sep 2020 19:08:20 +0000
Received: by mail-qt1-x843.google.com with SMTP id v54so11885243qtj.7
 for <linux-mtd@lists.infradead.org>; Sun, 13 Sep 2020 12:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/5h/UqJjCjlFG6zN+mmpXGeRd6XKS0E7CMl79QNY5+I=;
 b=Pf+0f9sD5zuwy2f/CbR8WRLXfQuOC7MkQsYuQ9EVjJp4tImhhFyMsxPKLO2N/hjmF4
 dLd4p0Dx6/TcsEN0C9gaeWFKbkvEdv8yIILBCM8e9AFAuF3ALtG1c2PpQnJtH4zAq1Vk
 XZabcjTYtDcbs8r8wu8YU80WJS2EYAgFS2tUWAIrhK+RZU0r5gXKC+5w30LCWCWnKpG8
 F82m7uISYK6Tk6K/DLGXCWGb0gI08oSjujFBbXBIdGFZc/lV0Lmwz7qutVcaS2aJVkBJ
 W/lTzD3qfyOjCTh+LW88zF58awXHeeW22EAvKUmI6jDZd6c+2GF+4x9dDf/rjGPhCIww
 0VOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/5h/UqJjCjlFG6zN+mmpXGeRd6XKS0E7CMl79QNY5+I=;
 b=Q/bIYAsQ8fxmYsmuup+UNFFc+nmsQnpzwU41e4OD+KV1EcWyp/om5nGP7AW43VBx66
 Ruqcy4AV1LNYa14CQyyaugJttzahCzeW9C6GHqbHa+QsHznpZhQGL+L5HspU2k96jSjG
 y1B9msIy//XRaDvxPZecL9uQAJl50ByrolEgZyQGH+8Fid8rgrKHvneU5ov7nDs4a1sD
 rD9T+n+Q4Xxoqn1DIHjHFsnNL5435yDTn8Fk2kGXS3gACEOq6x98BoKNzZaLMdBFXuHZ
 zpjVAz7XP+SU2jcCf88EuiJGInx/1YQ7Qzo6KlqfyxZrJCGhXiyXk4VM1xgTqlzL3KwQ
 b7Yg==
X-Gm-Message-State: AOAM532xaBiI1wj2kXHlBjFsfDE1phRmsfq7g2e8wFHMTMEF4ymP2czO
 LNe/h6qXnpK13oNHMiQHY/V3V9o07+dgam2mAz4=
X-Google-Smtp-Source: ABdhPJzMTauxCQUYokReYXoy/ykjdVeZEniEuEt1D5WE6euJ3kdIyTE80ICdIX4DKl2m7peR5X21kjm6iy6go1/qzsA=
X-Received: by 2002:aed:3b7a:: with SMTP id q55mr10320667qte.78.1600024093865; 
 Sun, 13 Sep 2020 12:08:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200601091037.3794172-1-chengzhihao1@huawei.com>
In-Reply-To: <20200601091037.3794172-1-chengzhihao1@huawei.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sun, 13 Sep 2020 21:08:02 +0200
Message-ID: <CAFLxGvxA9pw8D6Q8GbBD0SUP+EHhOsZmRMSPxrW4sq0gYi9N9Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] ubifs: xattr: Fix some potential memory leaks while
 iterating entries
To: Zhihao Cheng <chengzhihao1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200913_150820_108376_81128B89 
X-CRM114-Status: GOOD (  10.71  )
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
 LKML <linux-kernel@vger.kernel.org>, "zhangyi \(F\)" <yi.zhang@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Jun 1, 2020 at 11:11 AM Zhihao Cheng <chengzhihao1@huawei.com> wrote:
>
> Fix some potential memory leaks in error handling branches while
> iterating xattr entries. For example, function ubifs_tnc_remove_ino()
> forgets to free pxent if it exists. Similar problems also exist in
> ubifs_purge_xattrs(), ubifs_add_orphan() and ubifs_jnl_write_inode().
>
> Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
> Cc: <Stable@vger.kernel.org>
> Fixes: 1e51764a3c2ac05a2 ("UBIFS: add new flash file system")

I agree that this needs fixing. Did you also look into getting rid of pxent?
UBIFS uses the pxent pattern over and over and the same error got copy pasted
a lot. :-(

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
