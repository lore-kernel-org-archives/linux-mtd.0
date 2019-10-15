Return-Path: <SRS0=fWin=YI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27FA9C10F14
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Oct 2019 20:17:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6F8A2083B
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Oct 2019 20:17:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OBcJ3wk6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OMGJIkGy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6F8A2083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PgD0xdwuK59I0U8WQQkoVXNLFA1Zb9BU0RNoUYiF6cw=; b=OBcJ3wk66lLRuM
	3KfpIPGVA7V6Vb+SHbdcYQEVFEi11+7d174+04AlohmcZ1RTJDvYmK/PPRiQ3ZLjsnBTYEym/qsYe
	5EPSmemM1cgtaG+DsDa8se4FZuh1JZKAnjRMUGkgm2wqwj1+07Y4/ZN9LIeH/miYVKCuaEwl4PYzI
	VlOGXuFwxNBsPTVLRTFFg2FwaI+dXUIg1y+qRlL1ynoIlOFURhMoaVQECD/Hk9NwtOwlp4wefJC18
	fPoqO1Wt2PJ3qX2+YrS87Xzbszxlg60Q+3egU8rb8a21isOLCLCz7tvL40E7V3xJzicrXxyzU0M7O
	RIfUx+AE+mhMbzRuW0Rg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKTGP-0001WM-Qs; Tue, 15 Oct 2019 20:17:49 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKTGM-0001Vo-Co
 for linux-mtd@lists.infradead.org; Tue, 15 Oct 2019 20:17:47 +0000
Received: by mail-wr1-x42c.google.com with SMTP id o18so25326475wrv.13
 for <linux-mtd@lists.infradead.org>; Tue, 15 Oct 2019 13:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kJwmNvIvzA/ttzF7oxFgqB8/Al8OjokWnIPDIyyF97U=;
 b=OMGJIkGyYeyKnUQkWU2uO/0njN7s6AouZeL36ZYMI2/gJlwyrVls6d+HL+q3IWYNKg
 ZILqeCErB5iKvtUUfPrIEf1e1XpOkkDE4bqFMZajW/BWY/7Sa91/xxdRmpG6TdUmc1wx
 Y41Z0NCFnycFsTi7q7pW3ZHI4ehPAlzauvkpNtLva7GzK/evHFj6YR/JMPME2q5z2AgS
 oK9xN7NIXjsxKGYpOA3zn0Q7T4W1wihtkkQi0530TpVjsQFCtLV057/cs7D5DOYTgO51
 eYiNzcJr1ADJxIirUrKv2M7YA5NdmKta7OainKIYColQqtjs0zNCMK8fz58yqsyXNQk8
 gkZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kJwmNvIvzA/ttzF7oxFgqB8/Al8OjokWnIPDIyyF97U=;
 b=PQlPz13mF/O2WGCreXSu97MxSTP+Cq+RkjA8Fuv9iXdXqmwH40cjKjkE8+0o1nzR42
 hmSqKgNIZl4JZFOdoHk/V+TvAUJRUSSAfQ7NF8Go9n4EdNM7pEaEx+wo3jA1m7dGIdNd
 QJD+piWLcRp7gTE7H7x0eaxO6nDsGP0QE4nlnz+6aNPU3aLvrEcu3rn6fl6zS1U9YssN
 ydC0uYdEt3UghSdwrcy/461nxb53/JDIvua/xdcO8JcgDKyX8CFqe9/roWa4CsCuV5xY
 s3v17B60z5UhPDIeJzoFcbFQj6lFjPB58UQCbgk80PaayjeGjWRyH4BumCZlBOU+vu9y
 D38Q==
X-Gm-Message-State: APjAAAWOwHDeQwEyruiWdSf/YQcm3mVIPmBPtOe45IOmEB1Fkh9fS7Vh
 HaY5v2/ADTApmmBTNvXusF/hWCoRmYJZkZzajzSuaLv9
X-Google-Smtp-Source: APXvYqxAug2IHQZSE/SZ5WAkodyj3jODRCfgJtF52Ygn1aGQd6CVQ1LebtpXxF8yRN+5AJG1Orr8kX4Y7zfQApt92Ck=
X-Received: by 2002:adf:f145:: with SMTP id y5mr20835705wro.330.1571170662613; 
 Tue, 15 Oct 2019 13:17:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAO1O6seC1UFVrDM1FxP09uPrQhAUxp3pU=YUy09Vj98mpcU=Cw@mail.gmail.com>
 <CAFLxGvz8t-oyzkZE-9X=b+f10-no=E8mqhxmct9eJ2PK54bTfw@mail.gmail.com>
 <CAO1O6sfd3YOnR_7Zm1fcX-Mz-m2pzxA1uLppb78fGxsAdfjFKw@mail.gmail.com>
In-Reply-To: <CAO1O6sfd3YOnR_7Zm1fcX-Mz-m2pzxA1uLppb78fGxsAdfjFKw@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 15 Oct 2019 22:17:30 +0200
Message-ID: <CAFLxGvzKqx9eReObd4uuo4v=G+cFepssXL36GgT17+-E6mEGRg@mail.gmail.com>
Subject: Re: mtdswap + ubi results in deadlock
To: Emil Lenngren <emil.lenngren@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191015_131746_458558_C9E51034 
X-CRM114-Status: GOOD (  11.23  )
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
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Oct 15, 2019 at 10:10 PM Emil Lenngren <emil.lenngren@gmail.com> wrote:
> Thanks for the tip, I'll try that. But just trying to find some
> information about GFP_NOFS, I found this article from 2003
> https://lwn.net/Articles/22909/. It says "The GFP_NOIO flag allows
> sleeping, but no I/O operations will be started to help satisfy the
> request. GFP_NOFS is a bit less restrictive; some I/O operations can
> be started (writing to a swap area, for example), but no filesystem
> operations will be performed.". I'm not sure how much has changed
> since 2003 but if I interpret it correctly then GFP_NOFS wouldn't work
> since that can still trigger a swap, which would result in the same
> recursive deadlock?

You are right, GFP_NOIO seems to be a better fit.
At least the block layer uses it too.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
