Return-Path: <SRS0=QAK/=LV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 667DEC48BC2
	for <linux-mtd@archiver.kernel.org>; Sun, 27 Jun 2021 18:30:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24E746144E
	for <linux-mtd@archiver.kernel.org>; Sun, 27 Jun 2021 18:30:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24E746144E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s9XcIHcOQR93mweeDEIz0S9rfw5l4ERPa5PWPMPJ4/4=; b=izz7Ay8hGIUvQR
	b2/HufWroewvoKayxEcAHOmfeRJ5B9k3wtE9Q8OJcEb9BJKrFKAxTg2T7JdNpwSN3fHBFGYrynZBo
	GIuZzg++89LltqtYpNlL6wL3552TeY9/dpdS1o+D48n3UUPGvUNT/Stjly8c61cfK1soKogNuRmip
	Pu8dm0nskKpVwizNtbtGv8N3SNTOOsDaaKvH99BXqAiL/GTf/aqLeAS7edcP/V7J0bvPuoMHWQ+Rj
	8B6GUWbL9Bbxuj19yxe8ls2+o8H/ct1y1YJFdM0f/YdL8n3fwuR9SBsjfrm8fCDvO0BQ3r63QR8wv
	c8ukVxN0D6CzNSdJ3V5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxZX4-005yVk-LK; Sun, 27 Jun 2021 18:29:26 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxZX2-005yVQ-OO
 for linux-mtd@lists.infradead.org; Sun, 27 Jun 2021 18:29:26 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id
 l26-20020a4ac61a0000b029024c94215d77so256066ooq.11
 for <linux-mtd@lists.infradead.org>; Sun, 27 Jun 2021 11:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I+z4qkVkifTb0Z2Fw0OduCD9k1E+MgQUYF/WWXgsuTw=;
 b=uL7OKanIVKL7ppTZGqcwmPDmBXQ+Nxi+L132xY2K7ThGyNV39mFY8n7rekVwU4uA0B
 TWWijxnmvB0euSuw32huegRqkIBHBfLPPuy3HdxuUJOZSBerKuhihbM1UN+48zQ7Sodb
 5ciWhWmTgNdRa5ZMDVF+w7h/K8l/NCZR/iSwFbfnq/wyc0niJnMAGXiAzAlNUjnW1tDz
 FKFpuJlPriSvCC04LnSG+OWuDlVshf0tTtAJwZps4NFYUvD8FLqYB+0HZevwy/tuJQa1
 itzZ3+Td+yQ3f/1QFFhGOCYIh7FAwOvJum7V+izkmz2vvJHR2Wz9LSQEXy4cvl8pNpVu
 ThMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I+z4qkVkifTb0Z2Fw0OduCD9k1E+MgQUYF/WWXgsuTw=;
 b=ncaIRXiWm4aPKaW6M9HMQX8Q+U0OlHy+mjc66wGQ3oZ0/k+xA7chqY4NzwlwhZ2/km
 VO/Zmw+iQkiRJtK2zl6JMknEs9i845Sk0LtTuIM02r4M8dqyp9GRquUoa06pL2i8J27+
 5/IthFnH9mzDYToylIgVOr29J8ayi5WLc1dvyAiKXC6Gn8ep7wuxenFNhoLRZ1Iv8r8Q
 RKnbmnZYOZVMNP9jx6sbGQmno/pWvcgJahy/BlvSuPfMNvxkMgpx3lp3q6e52TQmh+rn
 96gTJqnw4v9Rn01G8gDT/JTZuM1YELhBVdM1BUEJEy8KT2gY7PkgyHmuXi44hKTkusz3
 QHsw==
X-Gm-Message-State: AOAM533UWVF9daR5W1EXBRe2zkYEr29smUTMvZWXjk2KVFymsyDrFbJm
 9CSYka7/nTtyZ4lF/tAcRdA/qI8sn5EXUythwys=
X-Google-Smtp-Source: ABdhPJzazxCs92rqGAer6fdtZqhbLUP05TPMWhrAmtWQstXFQdy0ixcwi5fvjdhLAyNrQ8N7bXapWEqOPO8mVcpvrT0=
X-Received: by 2002:a4a:ae4b:: with SMTP id a11mr16609024oon.48.1624818563070; 
 Sun, 27 Jun 2021 11:29:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAOuPNLiZL4wXc__+Zx+m7TMjUjNq10tykHow3R9AvCknSNR6bQ@mail.gmail.com>
 <CAOuPNLhoLBwksNt+tJ2=hZr-TGHZgEiu7dgk66BUsraGA16Juw@mail.gmail.com>
 <CAFLxGvw1UoC3whDoQ5w6zfDNe=cLYi278y6vvSadQhOV9MGvTA@mail.gmail.com>
 <CAOuPNLj4ktYYieOqxd1EGUWt0DZamwQik_jg6cj2ZyqRaL9Amw@mail.gmail.com>
In-Reply-To: <CAOuPNLj4ktYYieOqxd1EGUWt0DZamwQik_jg6cj2ZyqRaL9Amw@mail.gmail.com>
From: Steve deRosier <derosier@gmail.com>
Date: Sun, 27 Jun 2021 11:28:47 -0700
Message-ID: <CALLGbRKs0hRLpRFz1mUJyKZan7Lf0eGAArJbBpXwFu2TQzcmWQ@mail.gmail.com>
Subject: Re: Query: UBIFS: How to detect empty volumes
To: Pintu Agarwal <pintu.ping@gmail.com>
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, 
 linux-mtd <linux-mtd@lists.infradead.org>, Richard Weinberger <richard@nod.at>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Phillip Lougher <phillip@squashfs.org.uk>, 
 Sean Nyekjaer <sean@geanix.com>,
 Kernelnewbies <kernelnewbies@kernelnewbies.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210627_112924_850934_1D9FB5A6 
X-CRM114-Status: GOOD (  10.60  )
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

On Sun, Jun 27, 2021 at 6:52 AM Pintu Agarwal <pintu.ping@gmail.com> wrote:
> But, it might be possible that some developer may miss/skip this
> firmware copying part, thus

This is your root problem.

If your build system requires any "magic incantations" such that it is
even possible that a developer can miss a step and result in this
situation, you *must* solve this problem.  I don't know what you're
doing, but honestly, this shouldn't be much more than adding a line or
two into a Makefile or build.sh script.  Fix this first.

I'm not saying it's a bad thing for your on-target flashing system to
sanity check the images, but that will never fix a broken process. Fix
the broken process.

- Steve

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
