Return-Path: <SRS0=eAl4=C2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19177C43461
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 13:24:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80E0D206D4
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 13:24:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YIcKnFuq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fxf/wT9D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80E0D206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pxKi0oDPZom2hcJd7+j60YiG2gZUgOD2/5w8XYYvjMQ=; b=YIcKnFuqfnqk7pV1uT+yKf0tD
	T2/lgt/EhPxuOYma4wY+tI1rrubkzK4ymBmA+sGo1VVufMcKwEr+1wZFU0yllyf8t22XxXO/isyGA
	trGc/JX4pGtlf/C/rQu3wp2wSmoTRdW3i6ojG9z1DBsTO2CBzhQBHOYFuk2lfpv9jUUGV4DqOCdli
	VKcn4CVokL03onbEce0azfoH+GZ717lq1Mgby3kiJM9sgKEcNVkclNXsbpQBDMa41FhhWL1A30t9c
	BW/VmWd38fnFhTn7QaPx8ErWRr1t2f+bidYBWYW9fwz+6HDi+aQTq+jFdoZ+sRI9MFlu+RHEdCzWK
	7gRZtr0YQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIttN-0002VR-Jo; Thu, 17 Sep 2020 13:24:05 +0000
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIttL-0002Uq-EX
 for linux-mtd@lists.infradead.org; Thu, 17 Sep 2020 13:24:04 +0000
Received: by mail-qt1-x842.google.com with SMTP id n18so1825653qtw.0
 for <linux-mtd@lists.infradead.org>; Thu, 17 Sep 2020 06:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h0//NU8ijaLondcHNndZAvzak++uQ5aA/lx+tCGr5EQ=;
 b=Fxf/wT9DxDU7LlcARMkw/2HXNzs9QZMVeHPUSIOAAlnzisuIRkIeaVLK5HMj0Lcs/z
 ffLi2c7Hx/wf/l/eh9lBe/ythif7X+6zoguBVss5ZjzIZ0MtIUJQVmhLrB6UfsRnzNrc
 MCaUI+Em8TdZtadaWRrGINORJN+yrkuETrZoz96Vkx1+R+VANpkeiHWiPvEKOcVSOFkF
 L7J6YmpeciZANfGEUmJACuSzJtBVrjvWntQmhUOuByFYexZxvLlc/upOR6k/dssuTCAC
 JE7p9mO1t02ndok97WdWUvmqa5mOrGFkPGF6Yi5wI0D3kSKUlVBtAh9TVYZpIBMriV3x
 7EIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h0//NU8ijaLondcHNndZAvzak++uQ5aA/lx+tCGr5EQ=;
 b=qrGK9imGEVx89z5cMqTLvcs3G0cqDjdr4v1yHdDC3ZkgjezFXt1s9ZxCfHbTVm6SD9
 njrcsPDmQMIWYa/gI98hEdkZE8RpCZsHELim+BUtqohqsEoebkzhXTctljrcIBDOe8OQ
 YW6HTlDWn/J1sxCATpD8qBjHwyPzhBSUNDnQ056g/r3iBMYlKQ3wV85mNdNg+/VxW9kH
 npu6vXCvqWDHuz0Mg/WKI/50ol2ck+35BriCq9e3rI1xSZe66irjv4hgvs+pkfOzk0gx
 ZhGHTGQMTlVbaL21REY+9tfrOYQVBNW32soK7N4AXZo778N4iFBqa8F6lrOzT5ui64pY
 eOAw==
X-Gm-Message-State: AOAM532VpVwPmZvD+Op/8AbE/eYngPPJY/GjSISYZ1PA8lAL9rBAvE9s
 CxNekbcNGfsv40m5t4t3MUMp7zy8kyBqx8Dl5wI=
X-Google-Smtp-Source: ABdhPJzJOIMGlsWTdb4LBSXhOYXx2nWOJbTC615+V0pbtQL4//rfsRbOhEGsLoXEQQEYtCzfeyF7VZTRELiXm+MDTVc=
X-Received: by 2002:ac8:76d0:: with SMTP id q16mr15789720qtr.164.1600349040224; 
 Thu, 17 Sep 2020 06:24:00 -0700 (PDT)
MIME-Version: 1.0
References: <CADBnMviQd-9TbkJFUCWE8THCYF9oq-iZfu6Cjxcy9GvTfe=KUg@mail.gmail.com>
In-Reply-To: <CADBnMviQd-9TbkJFUCWE8THCYF9oq-iZfu6Cjxcy9GvTfe=KUg@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 17 Sep 2020 15:23:48 +0200
Message-ID: <CAFLxGvw9TMHz5Mf=RYytB3N6uMuK5md+WxF=atzvaXcuibmNsg@mail.gmail.com>
Subject: Re: UBIFS-AUTH panic after reboot
To: Kristof Havasi <havasiefr@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_092403_521192_8110221B 
X-CRM114-Status: GOOD (  15.09  )
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
Cc: Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Sep 15, 2020 at 4:51 PM Kristof Havasi <havasiefr@gmail.com> wrote:
> What I have tried:
> =================
> Based on the panic log [1], I can see that the panic happens here:
>     ubifs_lpt_calc_hash
>         `->ubifs_get_pnode
> inside the iteration over the LPT pnodes with hashing

Hmm.

> Questions:
> =========
> Q1: Are the chk_* knobs authentication aware? Or do they report so loudly
>     because I enabled the authentication and they cannot handle it yet?

They should. If not they need fixing. :-)

> Q2: Could I use `integr_chk` with authentication and so that the UBI volume is
>     my root filesystem?

What is "integr_chk"? Do you mean the integ test from mtd-utils?

> Q3: Could anyone help which tools I could use to narrow down the on the trigger?
>     E.g. Maybe with some formats combined with dynamic debugging [3]?

Let's try first with logs.

> Q4: If I stumbled upon a mainline bug, what could I do to help analysis and fix?

We will ask for what we need. No worries.
In most cases logs are fine. Sometimes a dump of a filesystem is helpful too.
Depends on the bug.

> Q5: Is there any UBIFS-Auth specific instrumentation for mkfs.ubifs apart from
>     passing in the secrets and hash-algo? IDK something like, the journal size
>     needs to be increased or other smaller detail?

Not really. It should as-is work. Otherwise mkfs.ubkfs needs fixing.

> UBIFS (ubi0:4): Mounting in authenticated mode
> UBIFS (ubi0:4): background thread "ubifs_bgt0_4" started, PID 632
> UBIFS error (ubi0:4 pid 1): ubifs_get_pnode.part.6: error -22 reading

So, it returns -EINVAL. Is this with chk_* enabled?

> pnode at 7:37186
> (pid 1) dumping pnode:
>         address c7138c80 parent c7138e80 cnext 0
>         flags 0 iip 3 level 0 num 0
>         0: free 0 dirty 255408 flags 1 lnum 0
>         1: free 0 dirty 190192 flags 1 lnum 0
>         2: free 0 dirty 255360 flags 1 lnum 0
>         3: free 0 dirty 248896 flags 1 lnum 0

Sascha, does this ring a bell?

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
