Return-Path: <SRS0=DhJx=CW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD0C2C43461
	for <linux-mtd@archiver.kernel.org>; Sun, 13 Sep 2020 18:43:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DCBD22206
	for <linux-mtd@archiver.kernel.org>; Sun, 13 Sep 2020 18:43:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="115f+7YX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XtjAXeDb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DCBD22206
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EGOrvjNtSvhNaEcLWf0VuG77hBr370GRZW1uWc1kYO4=; b=115f+7YXx1AvrPk3qnIhCFeze
	3N+atlovJ9DIDsPkzGTtLPrNKBQAj8VQai6ze9qa1cJRrT527+3mwDBereSHcaeMLtbb1VxHZxym7
	jzaCZtRRN1DIWjdZ7nVwoSWIArrVHwHwZ08U4Dw0V572kyv99E2NiL/NUyKT3dCyqNoVbD+CATq0/
	xqmARZ2EMs9i8rmFNNVvoGWrDHuo8e25h1PmD2UKL0y+B3aqdP8jyT87ituIf8UXvqIZG3mJSyzq9
	LyZOkW8woy2uGS0feeZDwkMuMIEhEgcbNcXGjZkc2uvcogzL6ReJpT89Akwoj6ruorwIzsh45rfxP
	tz9/PUjYg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHWxc-0002YW-Qi; Sun, 13 Sep 2020 18:42:48 +0000
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHWxb-0002YA-Hv
 for linux-mtd@lists.infradead.org; Sun, 13 Sep 2020 18:42:48 +0000
Received: by mail-qk1-x742.google.com with SMTP id q63so14106783qkf.3
 for <linux-mtd@lists.infradead.org>; Sun, 13 Sep 2020 11:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0jHT31ssRcmY7ESE4GVbo7WflQpjnUMgGP99rhdZqTo=;
 b=XtjAXeDbAzYnt5xUw1wrTDDaTX7HrUGx7xGdWDkl+h31ILt+RsWuoCkdHDAxu7gyoa
 WEMo7wCOAdsaINHXzt0zddMEndq36m6vytOl9mrFiGGF8abruG73b1v2n9mz0jhALg7h
 QuRUk5Xx+4CvQpoTrH00gd/1eFBOmJhCNdJpvHc7tEO7xRmJ1P1pv1dBiDFqj3aXZgHK
 OwwDUfAk/XWhUU86EdZd1EVNxzgMB9TC56N1s9pMWKvjFbESAQgdzLiOtWjYlIBgihf1
 EokXQIj8pKBBFKw36BoS3Ht2bYh6DU7WLO4t0Kalcm+D+pU0B/RAGnDeDDeZUsUOGfoi
 0SPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0jHT31ssRcmY7ESE4GVbo7WflQpjnUMgGP99rhdZqTo=;
 b=tJ1C2LF8f+D1IHwuQ5g7H0sCFnhs+htQBvc6+Cmd+twze/xTi+piM3Mao1PhEYZuRI
 d6t2t8iFc0Qb8dajcqfKL7YTpsNpDjfu19O5dNpnkS6+3ehZJ1yW9JIs1TUIra7Oissk
 /Ilwv46OtC2sLBivPMK3D/PBo+1y1f3hbltuKUGPQjE68xWfu6OJx4atC8YPREX/GJBd
 hZytFydJiy1SpqXoKY4WKKRs22xEW13dtXYkXaO7V4jDQGoERVP3XRQIAYOmy7S3WccF
 9iz0Y0yrOlLhOSa+EYy/6xVhVSlMNg1wFubQ7oAPF6BPQWTovWzhAE/SLxXqZNW4kZlg
 Jfog==
X-Gm-Message-State: AOAM531gxEge0p6P2zN+h8lMT2lbYuTYtWlkFIhasaEu6CV4sT3BU77A
 WgD/XqDo/7fs0W1VnywGlbsIuPcMrRrhyrmvLZwD6r4w0pQ=
X-Google-Smtp-Source: ABdhPJw/m0CM9zylJN/yWgP2jPSsGqo8GaGn2BHaGVIsRN5Vhjx+jhYGgtS7zLNLJzl9RFJNqmSPKokcBsp4ol4mn1o=
X-Received: by 2002:a37:a189:: with SMTP id k131mr9496229qke.34.1600022565905; 
 Sun, 13 Sep 2020 11:42:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200817142909.1972897-1-chengzhihao1@huawei.com>
In-Reply-To: <20200817142909.1972897-1-chengzhihao1@huawei.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sun, 13 Sep 2020 20:42:34 +0200
Message-ID: <CAFLxGvxOw1ZY9PoeuJNGaweFBTjoW3jAj2=TtF5wMkBm-dgh9A@mail.gmail.com>
Subject: Re: [PATCH] ubifs: ubifs_jnl_change_xattr: Remove assertion 'nlink >
 0' for host inode
To: Zhihao Cheng <chengzhihao1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200913_144247_627015_B30C86D6 
X-CRM114-Status: GOOD (  10.60  )
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
Cc: linux-mtd@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
 "zhangyi \(F\)" <yi.zhang@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Aug 17, 2020 at 4:29 PM Zhihao Cheng <chengzhihao1@huawei.com> wrote:
>
> Changing xattr of a temp file will trigger following assertion failed
> and make ubifs turn into readonly filesystem:
>   ubifs_assert_failed [ubifs]: UBIFS assert failed: host->i_nlink > 0,
>   in fs/ubifs/journal.c:1801
>
> Reproducer:
>   1. fd = open(__O_TMPFILE)
>   2. fsetxattr(fd, key, value2, XATTR_CREATE)
>   3. fsetxattr(fd, key, value2, XATTR_REPLACE)
>
> Fix this by removing assertion 'nlink > 0' for host inode.
>
> Reported-by: Chengsong Ke <kechengsong@huawei.com>
> Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>

Applied to fixes, thanks!

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
