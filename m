Return-Path: <SRS0=O+md=4Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1399DC10DCE
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Mar 2020 22:22:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D577420684
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Mar 2020 22:22:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HBkLGcli";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GH8rXg/R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D577420684
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CqSX2zOor1PMjRegEaNP5XgNE3ZgoNtlMKJOVT+LGmQ=; b=HBkLGcliRHtDXJ
	yxxX9w48CW+t4hKe6e2E+ph7rDAeYvf32c++M/2zFF777+VGDDGRuZT34KK+9m7sCwZ7j4rYnfZTG
	Oyqot427jzumwmqISVLlB9JoJLmHBWdxz/DtPYSKqS1aNdnm8KqjDc+h5iuWhLXYL9oa6o/NWpBvK
	/5i+2KlruLKUf2Yug6e8WSMCFpme1ifxRJYqdQOOXDA3EsLkZMSpOcmIeGBkHpLyCONDOloAiOWEp
	xtx+o3Kx92huShE3cBPfLGQHxlf+0djZiiaiG5QCbnMqWPCAzmsfWNewOTyom0pn6KxY1lNrqTqHU
	aJPmpiC9Wn/0aE7+wjkg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jB4JX-0003SG-D6; Sun, 08 Mar 2020 22:22:27 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jB4JS-0003La-6O
 for linux-mtd@lists.infradead.org; Sun, 08 Mar 2020 22:22:23 +0000
Received: by mail-wm1-x342.google.com with SMTP id m3so7780230wmi.0
 for <linux-mtd@lists.infradead.org>; Sun, 08 Mar 2020 15:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=URASEgXLCXmYqmGOZmBnXuA4vIEVErfWf/qZrIyg958=;
 b=GH8rXg/RBoeVCHRmXU7UaG368GOcyNH1caDPqDVVF6GbTSgYso6W3DLUf7SrTbO6sA
 bkwMeYCDv+XETt8/tzyMDVtZj5OZfWcoCNNHKpWIDyLFe3tbQVNgVqkPz22BD/em0q3f
 hacqUYidd7GIJWHIe2nXG1VB2emWOM+LtvhnNXGEiq6ReuAVIAuo0wM6kwUA6AZHr7VX
 9JWOxz4FT2imO1mc7qnLiZuBNrLI5agTs1E8VH3TPvUfO+Y6ep3uQytJzfYOG3xsD8Rr
 tK1I2UcRyS5bprFNdWETLDrJmhSOu9pwrmnfplky0VTsnLFUGg/bqUjYNFCdzUopV2/T
 4YPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=URASEgXLCXmYqmGOZmBnXuA4vIEVErfWf/qZrIyg958=;
 b=GulDNdwNFPaB+VQaQLNGWny5Qy9hUGyFUINI2ntOZ/4li3/4rx5pJU51koRfAaDfGm
 BJc0BGqjJD38y5zPBgSQy8sTe4XLY5yIyl0jenZsxgJNa3VEDk+bzvqLpr3NCmzIkqgY
 U4YWyYg0DfV95nzUXTHrggIrE2oxLEohH7/SBbrVZBgPH0QuCutGjgxie9y+bygeuh94
 z7IJNn5Y/votnZA/RbP4yn1Hl/GDgmNLbjEEHFjHMiy6KSd3kXwLVA9zJysDEodeJIGi
 Snv7dUVxTGjctX2dkTlZOy8oLUx/w+sNNE8sqSknpuMQwOD+gb0SCQ0E1v309NTIWIo8
 MPSA==
X-Gm-Message-State: ANhLgQ1haeilZ+51ahVCkZ3vtX6vqTcKQ58BlZJ2Qmbs5gsrKLt4X6cR
 cF6CRO21ACEj5Yr340ZwAaWO5uVIucjG4pD/5DI=
X-Google-Smtp-Source: ADFU+vvmDxhucOTTMIf2dZU/EvIWNTT6rVpb/WkHwSfEH980ZDe/pVqVUBboccsignoRfBDUB2/VxyGnIFC2zjAwXiY=
X-Received: by 2002:a1c:2d88:: with SMTP id t130mr17785876wmt.68.1583706140146; 
 Sun, 08 Mar 2020 15:22:20 -0700 (PDT)
MIME-Version: 1.0
References: <1583228423-60816-1-git-send-email-chengzhihao1@huawei.com>
In-Reply-To: <1583228423-60816-1-git-send-email-chengzhihao1@huawei.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sun, 8 Mar 2020 23:22:08 +0100
Message-ID: <CAFLxGvxgzPx=8VxqiamDxjdKwH6rhxJaXnqiJ+3w--p+i32vJA@mail.gmail.com>
Subject: Re: [PATCH 0/2] Fix two mem leak bugs
To: Zhihao Cheng <chengzhihao1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200308_152222_280057_F43ED03A 
X-CRM114-Status: UNSURE (   8.40  )
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
Cc: Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mtd@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
 "zhangyi \(F\)" <yi.zhang@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Mar 3, 2020 at 10:33 AM Zhihao Cheng <chengzhihao1@huawei.com> wrote:
>
> Zhihao Cheng (2):
>   ubifs: ubifs_jnl_write_inode: Fix a memory leak bug
>   ubifs: ubifs_add_orphan: Fix a memory leak bug
>
>  fs/ubifs/journal.c | 1 +
>  fs/ubifs/orphan.c  | 9 +++++++--
>  2 files changed, 8 insertions(+), 2 deletions(-)

Thanks for fixing, applied!

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
