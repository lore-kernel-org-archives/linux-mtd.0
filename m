Return-Path: <SRS0=0bx7=GS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D347C433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Jan 2021 20:45:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50850222B3
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Jan 2021 20:45:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50850222B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iBszUpBBzOM52Fq3aPzzB2sGNy3GRp/lhTztuy0lG40=; b=gP+n5uuS/wjD9fLDsXc4coCW5
	tQg9RUNHAxcz5BDHkg+/CACQ3L0/uGZYuL6d/ORvsP64RSYqe2uzlNLMSVS+HoUipQ9ZrsaTxGWrO
	SkFqRJGra5X7AILUxK726kxVYXersERDj7JEZmomwnvIzm173fXeJ94Yd0EyCrwHaLx2lWv3LddZg
	a8byYk6Y7hotf3ivhA6mM02voGePZ9VLwXJHwCtlfAqcIdzBTXvG9yQ3PqwDB9SZwPZRMcwWQJZgE
	3mXXI6z3MlKY2fF/C2FIk7UEEeVytAlOxvWlQ9HLPwIRD/yJG/lyvLT6U8v+/WT8XqgtgGRLYiIxv
	ZBej4a3Rg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0VxI-0000QE-5z; Fri, 15 Jan 2021 20:44:24 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0VxF-0000PO-IO
 for linux-mtd@lists.infradead.org; Fri, 15 Jan 2021 20:44:22 +0000
Received: by mail-yb1-xb34.google.com with SMTP id z1so6251511ybr.4
 for <linux-mtd@lists.infradead.org>; Fri, 15 Jan 2021 12:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y7C90DjWgUV7XgKSXqKIispBhNGlgIgzofLCZKm+wL4=;
 b=B+Pxtu9LMBr5FDcHZbu9iPulmsuLN8wXAZJKj+izKMOlNy22GDeq9TF78IlGy4Buc0
 QN1ovMiABtBCJ5H18TgTJo54mn1ecenRbreQmCqccpzV79ZLB4ndbdwWYR1omEIYB0lK
 KxJedbeGLWMAx1se5qKNAW8aoiwLqXrqk4aplB1YeOii2KtKLc1h4ts72+TvisUKZyBF
 rPMvIlnKILWhzXSoYJud4YZ8zpYyCZnJHePDKP6FQeI/YOwkOrZoZgAe0hxVDAASQbl+
 aicNq79Knip6QtmQJ1TZ0up/SdXxqFTVbHvDo70wHqQUQT8G/HuGPYG+zpI19Y6LmquV
 Es4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y7C90DjWgUV7XgKSXqKIispBhNGlgIgzofLCZKm+wL4=;
 b=fcmtTH1BSjJwBLA734RpUCKhTG68Bn3CoapiM2m96bza4Gyy5YA9Lp27z8n513qScp
 VRZhatck4yjarEl6i0idnIW1Z796aclYe4XXvpGvfzF0SG0uci4VN2I7Ie58t1OticSB
 NfTPvlFByZ7HyM0q8DHLKY1Z0AWxk64THwOWzh/50hOOFOWyAIq9vxepzHkGRHzwwgvt
 xZ9VKZgZozPRKEUeRTrEnU1jJ/atKcsCgDitx+QJSCqIwcOi2lVMCjP51WX2gmKVO8nM
 HRU1wtmKWyJj+c0gokTJHbju09paIATcBa+wr1hD47FBUjfQkAXHQYj7epKgx9QF1/pu
 rhXQ==
X-Gm-Message-State: AOAM531gru73f9rGtQ/a/LeaKxXsgs5SRrwm5z3tSDMvi78GCwrXEKEX
 Mawd8SDLdHZYwWjRA1C/CaXc4yYXtcITs0qqieQ=
X-Google-Smtp-Source: ABdhPJxSIW4o/cMEtrjCt+tC9HRfMLUQIrhLs/IxwWXt0tnAAmzTuDS+CKOP6Fv1kcBJ188fw3tcS9NvM2sZpddf+iI=
X-Received: by 2002:a25:c615:: with SMTP id k21mr4128615ybf.330.1610743457077; 
 Fri, 15 Jan 2021 12:44:17 -0800 (PST)
MIME-Version: 1.0
References: <CAA=hcWR+nsKAEH+Y9+U+3j21QtpdnBTenLdd65-yt0zpYPzX0g@mail.gmail.com>
 <CAA=hcWRXRDe6vu38PcFTc6oS+vU2DPqLRik_D3zTKiex99bX5g@mail.gmail.com>
 <CAHtQpK4OgZ5Qm6sFUiQavg6gd0taVUB2XiLHv8RG3q7O59B_TA@mail.gmail.com>
In-Reply-To: <CAHtQpK4OgZ5Qm6sFUiQavg6gd0taVUB2XiLHv8RG3q7O59B_TA@mail.gmail.com>
From: Jupiter <jupiter.hce@gmail.com>
Date: Sat, 16 Jan 2021 07:43:40 +1100
Message-ID: <CAA=hcWR9mYsUbeCRB0eU1X56M7iM+=Twx77hQDdSbiOpOWsTXg@mail.gmail.com>
Subject: Re: [meta-freescale] MTD UBI undefined reference failed to build OE
 gatesgarth branch
To: Andrey Zhizhikin <andrey.z@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_154421_698369_74E1B100 
X-CRM114-Status: UNSURE (   5.51  )
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
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
 meta-freescale@lists.yoctoproject.org,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Thanks for your response.

I am sorry, I thought that is what meta-freescale for, right? NXP
might involve the coding, but is it integrated and released by Yocto /
OE https://git.yoctoproject.org/cgit/cgit.cgi/meta-freescale/, right?
I cloned meta-freescale from Yocto project:
git://git.yoctoproject.org/meta-freescale, I am sorry, I really lost.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
