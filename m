Return-Path: <SRS0=dr6A=FL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79D06C433FE
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Dec 2020 15:26:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38FA32371F
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Dec 2020 15:26:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38FA32371F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uQ2K99BUKdIrFw504IKumqv2bV5/3EiPuatJNMp6rp4=; b=dPZV1WYOndFjtpRosX9rpMml8
	auyTc4kJBKy4gcrl+A0IaCIwMobDGFMHe338ReQwE1pZFVGJmYnKRpKaLq1LJDtcl3eqqNheyaL6K
	2mfMl4JDW7SE89KtD1rOM/vyexncx2c6N+fHcumSn1NLzSo7z+apxnhobZkytLoMlGfzJpxgZzhE7
	5q0SS4P8muUy2irNe/zRXwCKdoMvMJxbbTRhVE41OZuLD2pRjgsHPmDsbCWUmsf386Jr7wrVCnnZA
	uQuhck2Y5ukmSL52uOuwk3TiI1tyxwuuem5QlgAc2EPX9kj+wMKTVdS+G3ngJMshfPBrWu2dkQG3W
	aoLdoau9A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmINR-0007mA-Rl; Mon, 07 Dec 2020 15:24:37 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmINL-0007ld-58
 for linux-mtd@lists.infradead.org; Mon, 07 Dec 2020 15:24:31 +0000
Received: by mail-ot1-x336.google.com with SMTP id h19so12792637otr.1
 for <linux-mtd@lists.infradead.org>; Mon, 07 Dec 2020 07:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ePZ6odnGRSIS18NlRzl4CISfk4V5dznqUnLHErxLtDg=;
 b=TWIMTcRamXlWkOYwMtcuIRzEiBXJETLPYIaGzWBFS6suPAEOACnOqrLBcNLhiDfiqe
 LASrxZEZeI+luhgqmCA7KfeBqbnbq7dNc4foKDXcG1P5Ido5OCsGfY4to6qszZNRDyUS
 xHbKHyt80xrrDHGkQ7034QLNYHOWiySq9EOOc0MtMXO8g8U78o0gRjAcye6gVFA1DntB
 pF0tYRkju0GkS0S6T1XUIb4FASAObsp9QbeBwWd2qNT/+13WOmQaMYh2pzBmZh9xBMHr
 0R6X5FcDsCN+LFzy6U3lVrhIfkN1mmaBr8/VEvzkbDiQlr7hYyJBcu2LhVMXcyz676+B
 nVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ePZ6odnGRSIS18NlRzl4CISfk4V5dznqUnLHErxLtDg=;
 b=p980qolIWlpNUb//4e5izhVWgytxwQrTLCXj4bcUMyVO0tLmz3LhF3B/hiGzffq6no
 5eheirSSujVeUpH6FJjsymykxtqwkzljoXhpPoioCtJwh2DUfnjwvo3zqq/3DstaguZC
 M+pxSUDB2yjUEnti4kHrvz1qLROim/MjnLGZ2OXUc9hBXe8CtKSSSn6sWidojcHs7fZ6
 VkF2SSsdw5FOkdMiD/FZ5qgDWW7dFayzaq00y7XgM0/Psg9vSqILuEqgEZvsCR7SV2tR
 LRvn0YvpARfDWlmHJttSgPYDmnkufSWemIHGx5g7L/cr0FQ4/z2f6H+k6R5PBOzgAR5v
 pUtA==
X-Gm-Message-State: AOAM530wwatlzkTbEz/G9Ch6GoV4e+i0O+/mrKNGiLKrTMA83UtZbbPm
 cQO55OIt6C9NZDSOikjXljtpX3etO9joCb7FZQY=
X-Google-Smtp-Source: ABdhPJyNVjZ4VuT3LH/Munmg27VQUTdViaFTKTLAmWZ80U+7lq/lrBDDlLf80f7MS2V9eWrh7pkaST+yNtpI1z2lcQ4=
X-Received: by 2002:a9d:889:: with SMTP id 9mr13436548otf.6.1607354666928;
 Mon, 07 Dec 2020 07:24:26 -0800 (PST)
MIME-Version: 1.0
References: <20200429165347.48909-1-rminnich@google.com>
 <2124367.HovnAMPojK@sven-edge>
 <CAP6exYJ7QR+Y7Vsumecx_3rUC4cNY4xJj4e6759S8US6FX7ADg@mail.gmail.com>
 <2560223.mvXUDI8C0e@ripper>
In-Reply-To: <2560223.mvXUDI8C0e@ripper>
From: ron minnich <rminnich@gmail.com>
Date: Mon, 7 Dec 2020 07:24:15 -0800
Message-ID: <CAP6exYK75zwqhtrMykMqPepPfq=S95UEByy61D136aPKCBBSRQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: parser: cmdline: Support MTD names containing one or
 more colons
To: Sven Eckelmann <sven@narfation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_102431_231397_154B3BA1 
X-CRM114-Status: GOOD (  10.21  )
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
Cc: Sasha Levin <sashal@kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Ron Minnich <rminnich@google.com>,
 lkml - Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Adrian Schmutzler <freifunk@adrianschmutzler.de>, jstefek@datto.com,
 Boris Brezillon <boris.brezillon@collabora.com>,
 John Audia <graysky@archlinux.us>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

I pinged the person again. Hope to hear today. Sorry for delay.

On Sun, Dec 6, 2020 at 11:52 PM Sven Eckelmann <sven@narfation.org> wrote:
>
> On Friday, 27 November 2020 19:54:30 CET ron minnich wrote:
> > Thanks, Sven, for your patience, I will indeed try to test this next week.
>
> Any test results?
>
> Kind regards,
>         Sven

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
