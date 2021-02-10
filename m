Return-Path: <SRS0=JPnc=HM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50256C433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Feb 2021 11:17:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C193C64E26
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Feb 2021 11:17:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C193C64E26
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=szeredi.hu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=r5J6e2nAY7AgGlrrdt+ilmjNu5ypdsbJcK3YDpYQoHA=; b=u0YkxKXNtggTCna22dc6un6b3
	3X5u1G66Jf++MX1e4ct3OSF5dTIzaM9kBVPuMYT69+kHJ8oKfGbbSBYJgyd2Xj8LZKHHb39VIycTN
	J26mD8TLzsqsmXoU1s/ZbDt5jg1VqJTs1xpgO/1hQpVQ+E8EBkbnYiZsshskzIJ4Gb207AtY2aVbi
	Iqh5eIKOfsLc46LW6jtECSAC9poFvm7VtNdiz53X+vBD6vUFew+qyAqDzJL0sO6u2k+tOJrGvlNPL
	H8+YTuBBya/4a8t5wwi+rd1CXnKc3pJrtMyQdHm9c8hqlI8uW78BYryEGd2KsAy1IWlIGU9J6XfXT
	kZGl3ntYg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9nU5-0004kd-Ht; Wed, 10 Feb 2021 11:16:37 +0000
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9nU1-0004h0-H7
 for linux-mtd@lists.infradead.org; Wed, 10 Feb 2021 11:16:34 +0000
Received: by mail-ua1-x92f.google.com with SMTP id t15so447379ual.6
 for <linux-mtd@lists.infradead.org>; Wed, 10 Feb 2021 03:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szeredi.hu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KesY18AcWLGUy1+xAu93YHQU7oPPXOAxrMzYm03zej0=;
 b=MKsFyk7FCs5EVbtBRB4+bpYnfoOa7GQDvT62yJUnSuDW1Y3ay929Yc/0yEAnGtRnOP
 tbfBvt2jXZEMHBFGaQICQVpcJ3ahkVX1GlDnykXyOKd5M9CYD9sXJQvjPyQy6fpFS9gj
 DHcEvppD4kEh36ucyTSaIZ4QR5Gyjt1ENqkg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KesY18AcWLGUy1+xAu93YHQU7oPPXOAxrMzYm03zej0=;
 b=BERmuZ0iHqLAygY52aRSnxdMj9kRq3N868/c8M1P5P/PSGpVWqas/rfu5J3T9KQQqs
 8WSqigBBN7XV1x3DSu8IIfdJmttBJVlEXLO88wYu6dJku1ge3i8pu1KMYDk+XIktpsJk
 npl2sktspCSVhqMkvkBujJ/0u9oht6ESK5Y0LMHyXaRnYX18SnyQu9ojAb91sRjuI/Xv
 RvZYXAbZfLV+E70ojd1/AF/gTr2ykxDO5F48GOTdxAo/wK4VS60S1RJbJmH5GjcZEqWh
 rBVBHCPW6A9Yjj4QvMECWBjJ3QRSl3fuStUdqye8E70IA7+ErkXJ4ExgghQR5oYOiVyZ
 NAHw==
X-Gm-Message-State: AOAM533KQF1csJiwUYk25oTmvUEZVTG1NW2JtIzMriyaz0YWhhE0sYA8
 0vTUm6hFjMg7QOzmWQQs6kUAA2tDG78P5W0Tc1RynQ==
X-Google-Smtp-Source: ABdhPJw+znjMus7CT/o2Zjx7x1TnmdaxLQKXbNQeO9qunOH9MES6E+RLMHCPQV7J1YVHg6pzJwwqikVGSpgZk+baFkw=
X-Received: by 2002:ab0:3c91:: with SMTP id a17mr1253415uax.9.1612955791144;
 Wed, 10 Feb 2021 03:16:31 -0800 (PST)
MIME-Version: 1.0
References: <20210124232007.21639-1-richard@nod.at>
 <CAJfpegvN2KdMj_7T-OF1PAs8xZiU3f4233AvigaXwwRAsgQEjw@mail.gmail.com>
 <563952295.378372.1612881357746.JavaMail.zimbra@nod.at>
 <1923896038.379134.1612901174023.JavaMail.zimbra@nod.at>
 <CAJfpegufojx4q_CfR6L-fzSyQw9QXJZKy5xKVZZWaepADkL=Kw@mail.gmail.com>
In-Reply-To: <CAJfpegufojx4q_CfR6L-fzSyQw9QXJZKy5xKVZZWaepADkL=Kw@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 10 Feb 2021 12:16:20 +0100
Message-ID: <CAJfpegv-UDcgzkFiZXdoif2qjws5_xXh2bQSNbNdviQHhxzZHA@mail.gmail.com>
Subject: Re: [PATCH 0/8] MUSE: Userspace backed MTD v3
To: Richard Weinberger <richard@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_061633_648997_D1C30926 
X-CRM114-Status: GOOD (  12.29  )
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
 fuse-devel <fuse-devel@lists.sourceforge.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, Ron Minnich <rminnich@google.com>,
 sven <sven@narfation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Feb 10, 2021 at 11:12 AM Miklos Szeredi <miklos@szeredi.hu> wrote:

> But this is just a start.  From the big structures still left in
> <net/fuse.h> CUSE only uses the following fields:
>
> fc: .minor, max_read, max_write, rcu, release, initialized, num_waiting
> fm: .fc
> ff: .fm
> fud: .fc
>
> Dealing with the last 3 is trivial:  create and alloc function for the
> fm, and create accessor functions for the accessed fields.
>
> Dealing with fc properly is probably a bit more involved, but does not
> seem to be too compex at first glance.
>
> Do you want to take a stab at cleaning this up further?

On second thought, I'll finish this off, since I know the internal API better.

Thanks,
Miklos

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
