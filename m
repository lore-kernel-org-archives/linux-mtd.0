Return-Path: <SRS0=hs7p=63=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9880C2D0F8
	for <linux-mtd@archiver.kernel.org>; Wed, 13 May 2020 05:08:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5EBC205ED
	for <linux-mtd@archiver.kernel.org>; Wed, 13 May 2020 05:08:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P/l2KAF4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sQGCPXd4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5EBC205ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nSGW1XB/tPUumFGQvGkW8bTTeFIqDbx1oEgBlCLR1IE=; b=P/l2KAF40aOavu
	DExyRrf69wpZjFqRP+N+cIUi/7dUxsQojCQ3756IYSk1YTerIplvaeRMRNw5MBPntC6xeO2jrl5w8
	pRAptHGUg5+TEzVkgsETs3fAbM1P1MZVzQ/FwfkJcJUaejMXttCMHDDh2tQ+cCeRXRAL+wlyF07S4
	pXxjR5/q5OrcrvDmamjY1PzBvY1GriQzW6OSEEFITKnUBPzhd2i3SyQTor9JUYsMUIT1x3dtkE17x
	jTJDLPRZfUq/YUbpLQxGJV9f5nWbckE2LIIFuR7YG/RcuN7WRbYcvNycuVjH1AvC1j9CvRljrW/+o
	fttKkFGj2JrA9skpxELQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYjcz-0006Lo-8W; Wed, 13 May 2020 05:08:21 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYjcu-0006Kz-Cz
 for linux-mtd@lists.infradead.org; Wed, 13 May 2020 05:08:17 +0000
Received: by mail-pg1-x541.google.com with SMTP id a4so7262531pgc.0
 for <linux-mtd@lists.infradead.org>; Tue, 12 May 2020 22:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=gD48qUgTpY5H3y7E/mQ9fNLXyKbI1TMIzyH0EZQrjYY=;
 b=sQGCPXd4N3EjbMUbGnma6DqfPv0qGLNzCrmuPLoJvPHOQktCBX5jb8CJ4pAAz4KVX8
 b8E6XYY6AcJldhyadQuzByieYDB9IdoZGx2Yck8FQo23N7vfP0a8auUC/7h16tYqe6Rg
 sz/Qvk8hV9EhXtBD60xvcLg8DL86wPqLYlY80xoZavrLtfFaTF8jPMfYiocMwh7f2Psr
 Z9WpHrOo/eVNLJ8jg4QnkEO+gqCZchLtx7/Nnj36dLJViqTZvZCqgSxY+J4Gb2QnbZkO
 kt2ZWxmNghdiJbOsR41Mbm0NYMcnrWgi1o0zhZ2O9QNp1Y59XKpxU/nsQjqQnApagr99
 uhIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gD48qUgTpY5H3y7E/mQ9fNLXyKbI1TMIzyH0EZQrjYY=;
 b=S0IoTNBaRFnz4aMb9jXR3LzvoEjTFCjBdXz6LqoKzdk+QfgvGQNe85ibojsOMH+q2i
 N6k/4b+TGVgU3Ys625sCoBQDe4BHZZFFMzpvfUfvsGv/BA9fFhWL27HOFES9mE4bGU6z
 2bxtUj+3/bIMHnIQTbVFfVRVeycHfYjhpr07P5L2C00+Z3blaFx79NNtxok8A9lOyWsP
 TRr6VdGTGFeD4K83fCVKkBM80WPE8oUkRvXGpTntC/VvsW1BDC+nl2GjOVLdE4El6hPS
 fIVM6bKduAMbokrtX31Gg15WQnE8Ka0/LiXY5RQpialkKmKKwTQUR1JqcOPVoT/zTzSK
 fLPQ==
X-Gm-Message-State: AOAM530UL+MPmCgSmPznSRfTojieoGEwkEECoiD/W1SJhvEO/0d6Kben
 4hCvxba/mFbuXfG3cz7r22A=
X-Google-Smtp-Source: ABdhPJzzP9klR6bWe3ODCdQtf+NWu5xzVOFpNL1jg2fE1q08uaY9K0pcZkmzTtuVxVp2glcG/Xq8BQ==
X-Received: by 2002:a62:e117:: with SMTP id q23mr3213182pfh.188.1589346493760; 
 Tue, 12 May 2020 22:08:13 -0700 (PDT)
Received: from localhost ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
 by smtp.gmail.com with ESMTPSA id x66sm13642770pfb.173.2020.05.12.22.08.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 22:08:12 -0700 (PDT)
From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
X-Google-Original-From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Date: Wed, 13 May 2020 14:08:12 +0900
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH v7 07/18] printk: Introduce kmsg_dump_reason_str()
Message-ID: <20200513050812.GK413@jagdpanzerIV.localdomain>
References: <20200510202436.63222-1-keescook@chromium.org>
 <20200510202436.63222-8-keescook@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200510202436.63222-8-keescook@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_220816_491869_5AD2BEA4 
X-CRM114-Status: UNSURE (   7.73  )
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
Cc: Petr Mladek <pmladek@suse.com>, Tony Luck <tony.luck@intel.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Jonathan Corbet <corbet@lwn.net>,
 Richard Weinberger <richard@nod.at>, Anton Vorontsov <anton@enomsg.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 WeiXiong Liao <liaoweixiong@allwinnertech.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Colin Cross <ccross@android.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Rob Herring <robh@kernel.org>,
 Pavel Tatashin <pasha.tatashin@soleen.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On (20/05/10 13:24), Kees Cook wrote:
> The pstore subsystem already had a private version of this function.
> With the coming addition of the pstore/zone driver, this needs to be
> shared. As it really should live with printk, move it there instead.

Acked-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>

	-ss

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
