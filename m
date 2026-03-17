Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F891FED9EB
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Mar 2026 16:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eyXtsEHUfpUTOnZlFhqnBGFffhSdfcjd7tSmiher1AA=; b=dZgZDnFVGlYEEF
	nBFyWOL2jpGxYz0a3/8gftA9u1aXweKIij4geL9r8JM9ZUnSTn9P+mgVSH72liFN98kvebG/Q7kPF
	Lob4aQaQSuUjvysdRbk0Wvnnsqa/kUOvJDbN+brA3Qq9AWfPrjyAtR5LGEJjSjk1gaB8S+QjAhpdE
	4BLnrCoFB3KGfKt+vIy61gN0gt1sQwk0mGbvOtz3wH5XCA7SsS8CYDZBnW4+sO97tNtJRrP3asKiY
	6mG+kOmvIP3GJRerydaXvxbnAPLh5AVyBY2iRI7jk/1JD+x+qBSJ1Ub5xeMebNfB4d8FxPMJB4g58
	cu7lTsWEnTV2Yvcz8M/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Wyb-00000006mxm-35Rd;
	Tue, 17 Mar 2026 16:09:01 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2WyY-00000006mxO-360K
	for linux-mtd@lists.infradead.org;
	Tue, 17 Mar 2026 16:09:00 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3591cc98871so2701905a91.3
        for <linux-mtd@lists.infradead.org>; Tue, 17 Mar 2026 09:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773763738; x=1774368538; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vxf57r1UeJKFweq4YuvXs8fnnM5fNPu1ka99ggm3XME=;
        b=A3TeM5mq2iBDI+ASkvtlYN8V+rG0eh9o5KaPHOKryMvZud8hwk52kEc54mxywPxctP
         3K3gQhOKDGR89XmWP8f5Xesh/iQChb6cRLx1iUWB86KkwaTh1yNkU9SDQHNxXYHA/W33
         9beRyK24FnEEwP3LvbuST59vo52N0MsbvCIuL6bBKuHaMwpFHk0rRv3RynZeYSMKL09S
         YPfNPboH789rxL3fs6ouOUj0kiaatSickjVPtUE7Oh9VXS/OFlLz+9o/4WDzYrVCMTve
         +QbS2JlHqPUoc2r1smbgnKj1ufb1oloAVs8MWvw6u5dT0jUj9AAjWj5gcS3TZ/1QfgC1
         vrZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773763738; x=1774368538;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vxf57r1UeJKFweq4YuvXs8fnnM5fNPu1ka99ggm3XME=;
        b=Ug+I4U4ZgEeB+llHuSDLNpVqMtFWbYQqjmWg9z3X7RBNBdorjpXdn1ghjp5Rpehypk
         hkMWu7g6flJl9D0r2myQb+t5c0gVhFnN30QAjlKiyNpANX3/obmfACDYpU/y6uRuo5SX
         ir4zIeOmDnl0G/rRweljq6LA+iS8f+VcF9oiwsW2WZ/LI0zXv19TFe7quQ223joFdi4O
         OrB9L1zYdgurB60/fRFhGCMGZVzNXAg4g7xzrt4PJgXT52AUH7wDl5d5QLALxPnd33jY
         eO1u9Y7jlmHUPyW8ZmJdhF5vrGc+kcaJNKgpeyNwURvRWgBeN7q1jfZYV8BxAVMPh3CU
         Or6Q==
X-Forwarded-Encrypted: i=1; AJvYcCU6n0bQE8E1mzP2V7+V//+vc33LYfrZ5Gs3BtiAhhn0NFnnhZc0acJw+p4NRO92BpWiUsEKWnPYwa0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyYPZ79a0VPo0Y89kRT8G2ayZm/ltSDmpfUJ3i0cptiU7e42IyL
	YisXxAC+focCrOvZ91qVws+pBgXGANMvW24Q6CruXP2N41T90H3YgLCH
X-Gm-Gg: ATEYQzw1exFREK8ExldZ0aoroeaTL7Tx38AOU8kswRQdIDw34DkdqoamzQu6lrLWjKh
	ENqwfV8ba7OKNiFPHzbhsmefvFwsVkXY7mlxlLFscpIP6oQu4kxRgIWqpPg1IFLCF2F8dFUQzjA
	Uaw7CybXMWXheJ5WUwejwaNdTWQUB3MjvXJgD5cIszJpu+itxty3FzjTs09ijT5pwg38sVO8Hpu
	mgDx18xv7MwMNonFg6kiXkNgjMuFNP/3M/nZbmkxgD2hHmYE63kX7CZOUHwzSL0052RznmTY2hX
	xQlzKsZ2YWA6rgtE6y60cyWcFyQyjfitemCPaI7f5PylOXwpno0A9e8+Wy3mmaphiDF85ilHRh7
	eM21P8yxUhToYPvaaffvT690LKbOEolyYPRc7z/RCFzTNx4VSxUevPDF3psch14sb7MMsLJWh4y
	gtWFzgapVuJneYpovW28JwmvOIu4ZD15qSga9VMP/YgrV+Jg==
X-Received: by 2002:a17:90b:5590:b0:35b:9cd5:232e with SMTP id 98e67ed59e1d1-35b9cd52712mr8111263a91.29.1773763737645;
        Tue, 17 Mar 2026 09:08:57 -0700 (PDT)
Received: from google.com ([2402:7500:a44:85b:1dcb:ad2e:a580:8965])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bada2bd54sm4714160a91.2.2026.03.17.09.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 09:08:57 -0700 (PDT)
Date: Wed, 18 Mar 2026 00:08:52 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Christoph Hellwig <hch@infradead.org>
Cc: Richard Weinberger <richard@nod.at>,
	Andrew Morton <akpm@linux-foundation.org>,
	chengzhihao1 <chengzhihao1@huawei.com>,
	jserv <jserv@ccns.ncku.edu.tw>, eleanor15x <eleanor15x@gmail.com>,
	marscheng <marscheng@google.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] lib/list_sort: introduce list_sort_nonatomic() and
 remove dummy cmp() calls
Message-ID: <abl8lJ5_hFSRHu6-@google.com>
References: <20260315193900.218737-1-visitorckw@gmail.com>
 <1295583760.42468.1773645957126.JavaMail.zimbra@nod.at>
 <abhGF65wCbI7CsTm@google.com>
 <abljlKim3-hPngCG@infradead.org>
 <218787364.49542.1773758321128.JavaMail.zimbra@nod.at>
 <abln0mfbHdueNgtD@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <abln0mfbHdueNgtD@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_090858_803124_EE4E135D 
X-CRM114-Status: GOOD (  19.56  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Mar 17, 2026 at 07:40:18AM -0700, Christoph Hellwig wrote:
> On Tue, Mar 17, 2026 at 03:38:41PM +0100, Richard Weinberger wrote:
> > ----- Urspr=FCngliche Mail -----
> > >> For UBIFS, this patch doesn't alter the frequency, timing, or behavi=
or
> > >> of the cond_resched() calls at all, so I am confident that this won't
> > >> introduce any regressions.
> > > =

> > > I'd be tempted to drop the workaround and remove the cond_resched
> > > from ubifs given that entirely non-preemptible scheduling models are
> > > on their way out.
> > =

> > arm32 still has no preempt-lazy.
> > This is one of the biggest platforms where UBIFS is still used.
> =

> Time to fix that if it wants to stay alive.
> =

It seems that dropping cond_resched() right now would cause issues for
UBIFS.

Given that, let's stick with current plan for now. If we reach a point
in the future where it's safe to drop these scheduling points, we can
always revisit this and remove then.

Regards,
Kuan-Wei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
