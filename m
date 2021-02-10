Return-Path: <SRS0=JPnc=HM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82E9BC433E6
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Feb 2021 11:01:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 193E264E37
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Feb 2021 11:01:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 193E264E37
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2T3R72qvGwXIkyFBytN6bd7qa9rLv6UuOnhbECOt4N4=; b=Qq0K2FsnqsufhWEiSiGAcZPUm
	8N9al7X3+aJ+BuFl+HyvsJZ/6jK8GslLeI/0rInsinEec1LHxyxscObalVHtQzD4sJ66Om+2X8qiK
	eGWv1tnaBJps2dC/R6c0Ptt5JEFwVDi//+NQJDFjtwpQtgQQujGVXLZDiFvtUpa3ciH5oJ9AK6XgY
	17l00RM9JSZyrzNoDaKsgjZ9/uwefNgokxQsL200Y3Sp5SIg4ft0KvO1ItFsgUxAiW83mBXlguc0m
	o9qfk8fphOym+qEzPnycn7TfXETT7PWzOwDgIOaTCdBAiv0O7lyqs8uy0gVyTydPtKUgYHzFYLQaj
	6xJvnzHIQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9nET-0008AK-0b; Wed, 10 Feb 2021 11:00:29 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9nEM-00089l-RW
 for linux-mtd@lists.infradead.org; Wed, 10 Feb 2021 11:00:23 +0000
Received: by mail-qt1-x830.google.com with SMTP id e11so1160681qtg.6
 for <linux-mtd@lists.infradead.org>; Wed, 10 Feb 2021 03:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=04D7WiqCI7NQHqfoZHV7XOGofyTBt4zdFBB44Awvjnk=;
 b=IG0QkIZkXZBjKkv0lndbbKwa6qb49vZlpLlQYYEC6rcrm+bbZJ0eLAJ6fykd4gZR/S
 wxZ/m+KKUdUGCpBJmyhC2/jkax6yDV5lVYoJHw+Rk1oFUog9OFGY4JebESWsHgKWdQvT
 inWZcRJJhvyjr5v0feqPls+KpXtM62j2nGxavZpuL+OSnjW+0ZtvAIeBavx2Y80Hskdu
 wIJKl0EYjhto4vMpy5y7P7vLryfuVBOoLRNwjrCwg6O1t9T4VcnkOZ9t85stlS6b0mYj
 QBCUZ5NHMujcZB8AFEb3H+nFoGqstihuyfYR05SLUsphsbEKIIkFiV4C7Kk/8uqydq3n
 N58A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=04D7WiqCI7NQHqfoZHV7XOGofyTBt4zdFBB44Awvjnk=;
 b=aCO8UyheutxzGBolxfQWZVzjuHDuL+H0ypIwcg4B2GRmzFfKTmeYFFqH+qWspId1Sl
 A5U1vpix+aD9UUfRRjIAWEJywkIn+xxaWl4o6xQ5f5t/dvWwViX1peDiphEz4GUhxA77
 A+om6Ho4nUMa8fVQ4YdNqWbqMzVXiKa19raZTh+gqrof3RbWPl/7KUY7QuLOT28eZH94
 k712FATzSZj4q9LBdYzI8eqVntRbK3btPmyGUrlBfXPub7/7VXS3GKtn1cSEZjGfeNHh
 XoJQU/qwsz94Vfk2HmTsSDB3btn4E/YwHRxxsmM9M3G/oiHECedvrj3KbQzvzsqwZIhA
 vxaQ==
X-Gm-Message-State: AOAM531PRGkHmvqOT5bhp5cw3VDc9WRJm7t1ySQ1njPNa9I6aPgMZgip
 YDrbrfpyqMZeBCBEPWowyNGK3tUDf6qkiUFnJo4J0nZC
X-Google-Smtp-Source: ABdhPJwRr7mUzNOAOmedbVFQ/Xg83qXUrqSrgg5dnbPM+Tw0UB426Rh12Fp9qp+LKpm6JkkJmK1UY7CzoSPfMBIy5dI=
X-Received: by 2002:ac8:7210:: with SMTP id a16mr118272qtp.82.1612954819564;
 Wed, 10 Feb 2021 03:00:19 -0800 (PST)
MIME-Version: 1.0
References: <20210124232007.21639-1-richard@nod.at>
 <CAJfpegvN2KdMj_7T-OF1PAs8xZiU3f4233AvigaXwwRAsgQEjw@mail.gmail.com>
 <1507208626.379155.1612906761549.JavaMail.zimbra@nod.at>
 <CAJfpegugbvppOKhJ8KjSVGgZOGVuj6NSiy4n18mbD7Ui3wme6g@mail.gmail.com>
In-Reply-To: <CAJfpegugbvppOKhJ8KjSVGgZOGVuj6NSiy4n18mbD7Ui3wme6g@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Wed, 10 Feb 2021 12:00:08 +0100
Message-ID: <CAFLxGvwhdHeUDR8Mk8kyMvMCcRc4S4pcjs29ttPTHL2XWW93fg@mail.gmail.com>
Subject: Re: [PATCH 0/8] MUSE: Userspace backed MTD v3
To: Miklos Szeredi <miklos@szeredi.hu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_060022_951085_48EDA1F2 
X-CRM114-Status: GOOD (  13.78  )
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
 Richard Weinberger <richard@nod.at>, Ron Minnich <rminnich@google.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, sven <sven@narfation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Feb 10, 2021 at 11:22 AM Miklos Szeredi <miklos@szeredi.hu> wrote:
> > In MUSE one use case would be attaching two distinct (variable length) buffers to a
> > single FUSE request, in both directions.
> > If I read fuse_do_ioctl() correctly, it attaches always a single buffer per request
> > but does multiple requests.
>
> Right.
>
> > In MUSE we cold go the same path and issue up to two requests.
> > One for in-band and optionally a second one for the out-of-band data.
> > Hmmm?
>
> Does in-band and OOB data need to be handled together?  If so, then
> two requests is not a good option.

They can be handled separately. All I need to figure who to abstract this nicely
in libfuse.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
