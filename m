Return-Path: <SRS0=6BKG=HN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 525ECC433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Feb 2021 18:10:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACEAC64DDA
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Feb 2021 18:10:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACEAC64DDA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=szeredi.hu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=H1lwzemm5yL10McbcKmntGr/rYJHNalK1R7BAX4vWOE=; b=mYYFfFy9jAprOEzm+6GfGd+Yt
	bQhvzfrIlstTn5Lr3fgxBdELVfwN7JA2mqRFIP2ye6SxBKzyxuHFOslsY8xBl9pOyyO7bxwYxe8+p
	X4yWXS1zO8Lb4WsRKlyg59fULsXu5SDXGZCf/O1a+eB6wlJitTDA90QocGcrN8Z9nzUYGkC1B8QKE
	UQMAbVh6+gEjSRYUnXA1df++wWjf/uox4wxFZJD8X2ngvIPoGmNHDPXodzeh2hoEaAfA7c+gsRxVR
	AH7j/2LZjnx4ElaUZTKn8db+6HPARjXnc1iMGG9RaksFODEtSXNRTA/+WqVXooMG3y3GCKEl2Pvzh
	HiPHAZ+cA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lAGPr-0000MT-N1; Thu, 11 Feb 2021 18:10:11 +0000
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lAGPo-0000Lb-QG
 for linux-mtd@lists.infradead.org; Thu, 11 Feb 2021 18:10:09 +0000
Received: by mail-vs1-xe2c.google.com with SMTP id x13so3475482vsl.8
 for <linux-mtd@lists.infradead.org>; Thu, 11 Feb 2021 10:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szeredi.hu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PiqXp2PbyEiLqS8FHKk3htkQdFQdzlKYkDOHu8k3JOY=;
 b=Xwo0pQ/f5+8iKK+3IOQfRxyVQJDRmzL9FuHu6PLz2yP8e7qMghKrHEILpI0ueSUELL
 qLQP+k/taSHnOl+aCP9FAcKdaHaqNuM2Y0MbiH3ftlR6xwt3ShjVfB6Me0mOBmbrbzmh
 w7R8HlwGXbKheEgD49bYLpZlV1T1S/3FQy2YQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PiqXp2PbyEiLqS8FHKk3htkQdFQdzlKYkDOHu8k3JOY=;
 b=kuj8GpAxuq5d6GCRDAiby3GEUKQE3lgE5awRywd7HYVmR+1Nr0VGlcjWNrp4Fupujh
 e56aVw2XLA66bXsDowl9cvFG2oRczyo/l/RqfikAeSCDTLm7eXY8mlvLWYblzW7WoIg0
 l8k1Nf4ddMCGFVl0YWOcFZT+gL6K+I6ZLJfU7Evs2ti3MFcfo2TXv60hsyOPm4FHhnA1
 6IZ8oKIlEks0JqcyNTb4lJ950iEV0P17Okd8WvniN8d7GcQLV3wKHr6OnsWw+c7bNv2g
 2mqiiM1pjHWShOfM+sWipJYxbV14p7jB3Cf8JT0CrUiAEdJcbwA22TtOOAtP8Qs69Ym6
 fSJw==
X-Gm-Message-State: AOAM530fYtUWIBv08phBd6V1XYDnfqgg3y1VF3f2Ah1TuoO5wUO9svh3
 dvWrduHz8XeFiIN/5u8FuxgoXPmevqWdgKJvZQsOcA==
X-Google-Smtp-Source: ABdhPJyHOEeRdFv75UmPbMUvtaY9AXLINWJbxpsMnuvldfZD44vuzuAkibShiFvDwpEnT685yjb/SXeJuQxYZ5RvPZw=
X-Received: by 2002:a67:c992:: with SMTP id y18mr6591996vsk.7.1613067004890;
 Thu, 11 Feb 2021 10:10:04 -0800 (PST)
MIME-Version: 1.0
References: <20210124232007.21639-1-richard@nod.at>
 <CAJfpegvN2KdMj_7T-OF1PAs8xZiU3f4233AvigaXwwRAsgQEjw@mail.gmail.com>
 <563952295.378372.1612881357746.JavaMail.zimbra@nod.at>
 <1923896038.379134.1612901174023.JavaMail.zimbra@nod.at>
 <CAJfpegufojx4q_CfR6L-fzSyQw9QXJZKy5xKVZZWaepADkL=Kw@mail.gmail.com>
 <CAJfpegv-UDcgzkFiZXdoif2qjws5_xXh2bQSNbNdviQHhxzZHA@mail.gmail.com>
In-Reply-To: <CAJfpegv-UDcgzkFiZXdoif2qjws5_xXh2bQSNbNdviQHhxzZHA@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 11 Feb 2021 19:09:53 +0100
Message-ID: <CAJfpegsbVWPGKe-bLvM=00EHe-PC_QgJ9umxCf1gFtUQge6_cg@mail.gmail.com>
Subject: Re: [PATCH 0/8] MUSE: Userspace backed MTD v3
To: Richard Weinberger <richard@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210211_131009_002778_336A87E8 
X-CRM114-Status: GOOD (  15.34  )
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

On Wed, Feb 10, 2021 at 12:16 PM Miklos Szeredi <miklos@szeredi.hu> wrote:
>
> On Wed, Feb 10, 2021 at 11:12 AM Miklos Szeredi <miklos@szeredi.hu> wrote:
>
> > But this is just a start.  From the big structures still left in
> > <net/fuse.h> CUSE only uses the following fields:
> >
> > fc: .minor, max_read, max_write, rcu, release, initialized, num_waiting
> > fm: .fc
> > ff: .fm
> > fud: .fc
> >
> > Dealing with the last 3 is trivial:  create and alloc function for the
> > fm, and create accessor functions for the accessed fields.
> >
> > Dealing with fc properly is probably a bit more involved, but does not
> > seem to be too compex at first glance.
> >
> > Do you want to take a stab at cleaning this up further?
>
> On second thought, I'll finish this off, since I know the internal API better.
>

Pushed to

git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git#fs_fuse_split

There's still room for improvement, but I guess this can wait after
MUSE integration.

Thanks,
Miklos

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
