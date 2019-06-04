Return-Path: <SRS0=Hh3Q=UD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FAB8C282CE
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jun 2019 15:15:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 535B2208C3
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jun 2019 15:15:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Im4BmsFy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W7m/3S1T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 535B2208C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=tVXprrnKLTTZGeHO62/xN2LcGGN4+o64/hyBx1wK0HU=; b=Im4BmsFypaeAD8dYpi0ADDMCBk
	uU8NsmNKh4pCeFy7MmShAd5EDE30YyTsi6za8J2Cbhx+G6569g9UYah9mNzAocGOw1ti2zcTMHwi6
	UOj6He0C8n83NSJx/nN1n99bEp/8yb8Grq2Z9KtUPG4DxPScw68iKERK68C57IkIa+TfAo+0KmXM0
	mNojaEtB7+NQx09vl/0pf3Y7jeTTIGtGBg0Rlv9d4vEgj9yTV2fBWv3nGgrAWWyS5klI4DO7vmo1I
	K59oV2tvQO3DDwuGqL0+OQT3lTiA9EN2GGzw1qqwlPQ4Pme/gS2IjidKcCynS6VNN2OLwluiw419q
	MBZAgtwQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hYB9Y-0001ES-4H; Tue, 04 Jun 2019 15:15:08 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYB9U-0000U0-QQ
 for linux-mtd@lists.infradead.org; Tue, 04 Jun 2019 15:15:06 +0000
Received: by mail-lf1-x143.google.com with SMTP id a25so16763006lfg.2
 for <linux-mtd@lists.infradead.org>; Tue, 04 Jun 2019 08:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=FH1RyZ9GcfP8H0/x5psz0luT/tSRH6/G62A7+Ip2ANs=;
 b=W7m/3S1Ti8rRuP1SRKMcTGCM+hX2jtSeut0RapObMkkLGLJygn8XOpeC62quJZZO7D
 bPc6nVpYxnII+mlc8NlTpC7Rc6ipbSSXDBl5+tvHZTJc6n5ltcjJg4c6ZWu4tNq9YqJJ
 6nHbyFSgLC8/gAC2cCRE7G8sjA+QVkEk2QKmnuN7dg4u/0yxmyV0ySPZilUkQBTkEltV
 uG4PXVHLHg/CW9emPo3Puk1HyxG1vDzlQTNABb2MENxwREHD0lCUyZZFfkapd3XWu0Xy
 iQYSETQTQqhHjhri0nw127419aGA7RNmLSSERaD4Cdx2Fi6SFHJc9APKUrS883AlTaJS
 ycTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=FH1RyZ9GcfP8H0/x5psz0luT/tSRH6/G62A7+Ip2ANs=;
 b=XRC2zwVh3XCBDN+QVrB1M7tN1Rn+77u32dIUiJQGJe0nU1Qs7uhXwJLqEJY9xn0aCc
 OwyhaU33zMI9hNi0fNHqZj7f54ikKlOWVuBBGEZFQ3OIRg/jHVNTFzmQ61UWCLGOknif
 OarvmqxERJYYvOJkMtkhSDsxVhpTmC6Q5P1jXaM4zb+56lTF7XpOSFwA/NKuFV/TOFRS
 GzJhsvRJ1MaPBdXOGX6B7zWOTzm180VZlfx3/y2Rvg/axvEqw+f7cHMSHmUYFLJ0t2Pt
 LNI/wep53dbp7hMco+JE+K8cnOTZBlCzwmKKWyoVgOMR/6TFARz/LHZDcD46Fka0qeC8
 9WTQ==
X-Gm-Message-State: APjAAAX+jBrR0Byem7Wvvgl89bzgAkcHer0QNOx2/OvQnuf3pcja6XRo
 Hilz5dWfbPRKNQ3Oz4RjTRLBx52sJy9rTayZZvG7eBuU
X-Google-Smtp-Source: APXvYqw9g1IFl+1T+pfuauhpGtwliNTWkWvFGRW2UR+eJTKkljhZS0wG42kKHucNoBMuTPEGztuI1zO0FRfS3iHvRIE=
X-Received: by 2002:ac2:50cd:: with SMTP id h13mr15034325lfm.36.1559661301558; 
 Tue, 04 Jun 2019 08:15:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAGu8XfRM6MtAP7v2F2jp9CGYERj5niAvhHYtXQmpzOS0uHoUrg@mail.gmail.com>
In-Reply-To: <CAGu8XfRM6MtAP7v2F2jp9CGYERj5niAvhHYtXQmpzOS0uHoUrg@mail.gmail.com>
From: Shibin George <george.shibin1993@gmail.com>
Date: Tue, 4 Jun 2019 20:44:49 +0530
Message-ID: <CAGu8XfS1P_6MWT3Oxos2Viav=2fPVwx9UWwUQUL+xkMiPOKmGA@mail.gmail.com>
Subject: Re: File-compression on ubifs
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190604_081504_855888_93605ADB 
X-CRM114-Status: GOOD (  12.84  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
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

Any pointers would be appreciated, Thanks again!

Regards,
Shibin George

On Fri, May 17, 2019 at 5:06 PM Shibin George
<george.shibin1993@gmail.com> wrote:
>
> Hi everyone,
>
> Had a query regarding mkfs.ubifs tool. I created an empty ubifs
> filesystem using:
>
> mkfs.ubifs -y /dev/ubiX_Y
>
> I was wondering that if I now create a new file on this filesystem
> (after mount()), would compression be enabled or disabled for that
> file by-default? I am sorry but I could quite grasp this from the
> mkfs.ubifs code.
>
> Another query that I have is this:
> Would ubifs do a better job at compression if it knows the root-dir
> contents ahead of time? In other words, is on-the-fly compression of a
> file (i.e. compression at the time of creating/writing to a file)
> generally worse than when the same file is known to ubifs at the time
> of image creation?
>
> Thanks for your time!
>
> Regards,
> Shibin George

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
