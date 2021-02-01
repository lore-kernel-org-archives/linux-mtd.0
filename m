Return-Path: <SRS0=Ud6c=HD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01953C433DB
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Feb 2021 13:56:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE36964DD6
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Feb 2021 13:56:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE36964DD6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=szeredi.hu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EOFc/l7jLoE2di0RJ9JLFfASTa7XoIJD+d/jLH0Ju54=; b=ywM7fkWtokXdDSRItsTY7wOxL
	VK4sYe3Wa9yg8DoTvj3BRhbjA7Q4o7z7vZBPul4WESw8evfHbkanvWg6OvCaJ2nDo++ijibqXXS3/
	YetdvTU8wQGLkYGEQDRlmIdOB1YAeJQaYaNAXviUvh+eC/s2oP/9Zl8+ueNPlAQlfAwF7P2qZALcT
	GreGZPR1ES2kBPm6+wYuhvznt79XDshJhdMbspInb9qw6VYQznpL44gpnnvilE5tJwgR5v6KZAukL
	gCWUnOz+uapjFpXrMw9PF2bloSnP94XtyPOjBFQ7wUSkwk8ilZcfL9g+lgVaZDbyi7LgblXGMefPj
	S2nTJ4hPg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6Zg5-0003D2-8A; Mon, 01 Feb 2021 13:55:41 +0000
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6Zg1-0003Cd-0O
 for linux-mtd@lists.infradead.org; Mon, 01 Feb 2021 13:55:38 +0000
Received: by mail-ua1-x92c.google.com with SMTP id g13so5923533uaw.5
 for <linux-mtd@lists.infradead.org>; Mon, 01 Feb 2021 05:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szeredi.hu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0kjg+aFHtPg9b2IaXzsxcXOA46NHNDEJ2LJRqUY4/wM=;
 b=GOhfWFvQDrYbl87/i5qZXR+6cCLQRL8KHfdFpWB5my0OdLD617ZeVt+IY39BMyZp41
 Yw9XMmWVKirI6Wj7Ab7L50dokhUnBl0ceSDti1qkEzarSLXwAnvMsJnkv/O9vuOn4osk
 oAVqi+4123NYb9b9pY4BLQx5sQaIr8AtCkIV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0kjg+aFHtPg9b2IaXzsxcXOA46NHNDEJ2LJRqUY4/wM=;
 b=K1eGD0jreSHi6wFcm8d/etOY8AM1QU9zIkZD1htwvbNghLIedLBC9t8etMW2Ds1FEX
 ta7fT6Rq9y23+PHjhv3W8ljkGucG0A4qDA+J99VKnNXpz4xYdIb/Yogbg9ZzDF64EzaT
 4b1p66LTxxHNiDPwP+441+LpN4kGyopvSjRZ2JVoUSV3wDj4TjR/5TJg6vx6I2X+ijB5
 otsyyCP10ftrmSOkGOoRbuj/Dx62SXcw+hvbJQuzC1OIlZcS0fnPUspIbzzIOZzZajEh
 zImg7dOG8oZQmqbh2GoUHpeNw0r7/GKltT4JC21zY3+yKrMwtFFr96Nhbk9KXV2ZxOou
 KDHQ==
X-Gm-Message-State: AOAM530lg0b/C5ZLuXztRadkH2noMV3p/QJ6XeKcIHP3lIj13I0NsUzY
 NgSW+uRvYJawVktNecOBIKReCjh7BpZLzynmtEmraQ==
X-Google-Smtp-Source: ABdhPJwBEwVr1nZfMHqUT7xd1pje3v/uC+693A9qDAsepAr9Q4/Z9Vl+wIZl+m082os1jVkjDur/QXHkif/B1Hsf0sE=
X-Received: by 2002:ab0:6f0d:: with SMTP id r13mr9322077uah.8.1612187733120;
 Mon, 01 Feb 2021 05:55:33 -0800 (PST)
MIME-Version: 1.0
References: <20210124232007.21639-1-richard@nod.at>
 <CAFLxGvzQo9H8h5XpLuVDYC8uaRrPmkH444yFv3jX0LNCs_nTmg@mail.gmail.com>
In-Reply-To: <CAFLxGvzQo9H8h5XpLuVDYC8uaRrPmkH444yFv3jX0LNCs_nTmg@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Mon, 1 Feb 2021 14:55:22 +0100
Message-ID: <CAJfpegsV6SoUM_30MNWhCQVa=+qE4_j5ZSsV_Y_kBJdY_MKuwQ@mail.gmail.com>
Subject: Re: [PATCH 0/8] MUSE: Userspace backed MTD v3
To: Richard Weinberger <richard.weinberger@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_085537_172416_6F164FF9 
X-CRM114-Status: UNSURE (   7.69  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 "open list:FUSE: FILESYSTEM..." <fuse-devel@lists.sourceforge.net>,
 Richard Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 rminnich@google.com, sven@narfation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Feb 1, 2021 at 2:14 PM Richard Weinberger
<richard.weinberger@gmail.com> wrote:
>
> *friendly FUSE maintainer ping* :-)

Seems like MTD folks are happy, so I'll review and merge when I get the time.

Thanks,
Miklos

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
