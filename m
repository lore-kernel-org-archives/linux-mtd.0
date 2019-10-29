Return-Path: <SRS0=MTZd=YW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7FA4CA9EAE
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2019 10:25:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C05B2087E
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2019 10:25:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GH/8Zc0g";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rvhypy4F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C05B2087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W1u3/9IQ+qLDH8dqTdpt6JUlQiAdKkLDWRQ9c5ictdU=; b=GH/8Zc0gKjPlsW
	1Cop0Cb4YTPOApVCjJ2ZhW9qCmEBS3i+BJ5yk9p6poYolQsOpCu23pOld24NNHO9AB0arjcUU8/JJ
	ViEx/nuQlxsWbbUruG70UaoCM1Ll9O3VEiZcaZRLnPRVbBlgaRxopWbFYtxeFZ+s4b4wcHnmPvmjN
	BWA9CApx03niIpXEZTjxsqR7tYx9OEu6NLNV51yvbWeg2lDLSfJkFrtddFBp5Ssfuw+qkQK2SSbfQ
	eSpmDQZ4zM6/WWgDUCUQMpKiJNqDv/T2bI+3Ix4Fi4vsmT0xZst857aNs3A6DacuwJoz66ktjaYMh
	vaX8KwA+1bShbRYjzQQw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iPOgf-0005iP-Ca; Tue, 29 Oct 2019 10:25:17 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPOgd-0005ht-AS
 for linux-mtd@lists.infradead.org; Tue, 29 Oct 2019 10:25:16 +0000
Received: by mail-wr1-x444.google.com with SMTP id e11so12998839wrv.4
 for <linux-mtd@lists.infradead.org>; Tue, 29 Oct 2019 03:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/Tn/VVMmRjmEpU72/PP+0DOD99ZkAIL+sJmfdc1SevY=;
 b=rvhypy4FIQfjiYeZ4plidaSIM4JrY4orvXUW6HjHg6kevotVv9VGQd4BgsRA7F11+R
 +8a+WkS1dWV8QQqPpCt2OjlK+kWDuoNnmgZAms8s/8q1qYY1jeJ3Qt4Z537cp4+rusfQ
 FSCMQ9/McSCpYXjFNnAbguHqwyZh16rPv3N4oWNEJdNHmJMvQ+acHezUpMSCDP4c1gX4
 ZCj9HeWg5SLFeph3IsZvumFAbxxoy7JOVIHrb+rqcav5TAlW+e/s/jEkduiy/6mAkNYt
 ReOJLrbIg0jaNMt5hwgB1PU1Ty404vy9KJ5Wkpgito8kUatOIAOxNm3YevOrrrDmRUUS
 M8mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/Tn/VVMmRjmEpU72/PP+0DOD99ZkAIL+sJmfdc1SevY=;
 b=TFz2dH3JcbMvOONRFxFL3v+/mxCa+WJFAOtqvJQ3G7rCkvEEercC4mGaYI2taOAHUk
 2e+d2EXExupvhrOg2WO2NMzRErwV2M9lKCGwAk7yCcFoXcknfeUcCyvWWkIZM6ffOi6A
 NhjZzmlfd8yNlrtRi9J8KLKvt6tGLJjVAvzA45zqcFDwIJY8mZJ45BEzRRPdjM01BBQJ
 j7jeDNo/D5b2fvSD9VTiw30kJ+RgbedRrNLJr/i4NglbzyA2dVmmUj5JivRs5Wg2xgPs
 bUFi88DyUZCZtVvPLWxn0H2RY2584iCdoZRG4TvcvXehovDP63UrESKIcxGwxp2mkXCy
 vBwA==
X-Gm-Message-State: APjAAAVk9+K1IOdjGoPAxvWt0ZKMpiXKzrgEJfV3+BocYa3TGjtjYyZo
 sn4ES+K6vVPSPPwZeKvxuKNFzy5DZMML604YGIw=
X-Google-Smtp-Source: APXvYqyTfX+zvg5GKT7khe/58ghBg7R+IUnRQc+w+xUJytYgX47l/lQXueYYGK52tfE+KkQhPHHq510Fm6DAb3m3UXk=
X-Received: by 2002:a5d:4dd2:: with SMTP id f18mr18366035wru.4.1572344713587; 
 Tue, 29 Oct 2019 03:25:13 -0700 (PDT)
MIME-Version: 1.0
References: <1572339670-68694-1-git-send-email-chengzhihao1@huawei.com>
 <20191029092057.fsklsibqrmbmacar@pengutronix.de>
In-Reply-To: <20191029092057.fsklsibqrmbmacar@pengutronix.de>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 29 Oct 2019 11:25:01 +0100
Message-ID: <CAFLxGvw2UAXjz4uZ49gpxavBVjm7f8rT1agtmESsBkH70M-DaQ@mail.gmail.com>
Subject: Re: [PATCH] ubifs: do_kill_orphans: Fix a memory leak bug
To: Sascha Hauer <s.hauer@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191029_032515_362157_B17D39F2 
X-CRM114-Status: GOOD (  18.86  )
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
Cc: Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>,
 "zhangyi \(F\)" <yi.zhang@huawei.com>, LKML <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org, Zhihao Cheng <chengzhihao1@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Oct 29, 2019 at 10:21 AM Sascha Hauer <s.hauer@pengutronix.de> wrote:
>
> On Tue, Oct 29, 2019 at 05:01:10PM +0800, Zhihao Cheng wrote:
> > If there are more than one valid snod on the sleb->nodes list,
> > do_kill_orphans will malloc ino more than once without releasing
> > previous ino's memory. Finally, it will trigger memory leak.
> >
> > Fixes: ee1438ce5dc4 ("ubifs: Check link count of inodes when...")
> > Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
> > Signed-off-by: zhangyi (F) <yi.zhang@huawei.com>
> > ---
> >  fs/ubifs/orphan.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/fs/ubifs/orphan.c b/fs/ubifs/orphan.c
> > index 3b4b411..f211ed3 100644
> > --- a/fs/ubifs/orphan.c
> > +++ b/fs/ubifs/orphan.c
> > @@ -673,9 +673,11 @@ static int do_kill_orphans(struct ubifs_info *c, struct ubifs_scan_leb *sleb,
> >               if (first)
> >                       first = 0;
> >
> > -             ino = kmalloc(UBIFS_MAX_INO_NODE_SZ, GFP_NOFS);
> > -             if (!ino)
> > -                     return -ENOMEM;
> > +             if (!ino) {
> > +                     ino = kmalloc(UBIFS_MAX_INO_NODE_SZ, GFP_NOFS);
> > +                     if (!ino)
> > +                             return -ENOMEM;
> > +             }
>
> This solves only part of the problem. There are several places in the
> loop that just return instead of jumping to out_free. These need to be
> fixed as well.
> I am not sure if it's worth it to allocate ino on demand. It would be
> more straight forward to allocate it once initially before the loop.
> Not sure though what Richard prefers.

Yeah, allocating it outside the loop once would be the best solution.
I don't know why I did it in the loop. ;-\

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
