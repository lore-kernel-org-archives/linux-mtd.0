Return-Path: <SRS0=iZys=BM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AB67C433DF
	for <linux-mtd@archiver.kernel.org>; Sun,  2 Aug 2020 19:30:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48A522076B
	for <linux-mtd@archiver.kernel.org>; Sun,  2 Aug 2020 19:30:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nGyKj1tn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R6mKq3AJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48A522076B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oafQX/322cmGWgp+oBRmiGtUJVh7ns62KE0RIZixKSA=; b=nGyKj1tnAo1V4qCQHhx7x/trA
	tKJH75tQ7b1okih43aBD/+ALsFJHxNQgW7gb1oZz8K5AyHNS6LyHaR+3/mirrUyRRxalDZ7a1sjm2
	gGMirzljKCDmBzZ3+Inj7NK1P+HRTkCOzlkTsjF/WQ70RzrOjsPLnZupsYgZ/vGB0PTB5FEin2hrm
	+1qNXO1kl0bv/o3VdGvWfRwd2nSVURR58L55nbGAUe+tshQYSYa93aY/yYoTMPrYWzjhNVmpk3FQ+
	QxjpdYBjd2cPjyng7zI0W9W4RDMpAdzM7Gio4RbA1pryf9Ua4U2cgOW94i96/j0QvANIjSSzkY82Y
	lFlRaZ4rQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2JfI-0005VF-MQ; Sun, 02 Aug 2020 19:29:00 +0000
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2JfF-0005UW-Mi
 for linux-mtd@lists.infradead.org; Sun, 02 Aug 2020 19:28:58 +0000
Received: by mail-qt1-x844.google.com with SMTP id t23so23682280qto.3
 for <linux-mtd@lists.infradead.org>; Sun, 02 Aug 2020 12:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fPa7hFAhkKE2mcOiyzIqwzTEcp79hExjjqZgwWg4e9I=;
 b=R6mKq3AJCgjsIzhNlUSNiSNHJmrkLrmqzvC0wmFSnlz0Rmvt5++z48M/AD8L5DCPbz
 ZZOLMBwTF2QAuz9z/M66PZk+twoX37CtVeFeWy1S8/7ob/GNusXHLRniE0cCo+NeDhYX
 I+2FMwpJT6I693jkU0zeOSTme5KQoSKFGzDJRkhQwo2QNsrTF16GarggJbF1gai5/40s
 9yW2mJpqh/hzPxYyjmK3n0m4UkzlLs6WE8GI0G7aDxnL0Ms107R7GCtN706UsHTvK5gT
 wj2hXO4UFACzOeAvc3tQoQOk8OE/7urKf2oWLShzZemTScuiDs44HE/YiQiu/M4eOH8I
 YsHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fPa7hFAhkKE2mcOiyzIqwzTEcp79hExjjqZgwWg4e9I=;
 b=DfXbLtUVgVJN4j+bCvHWkSbK9CdVZXpXB5oUcXtZ5zyt5SES/iEGgxhVhen3wLTp2Y
 nHRlih58Ch4Jmr60N6gZpt9RGe7qo9eMgW8W+Pfm1GL2fCdIOxDZAOgY0kYosLaYpP+Q
 FMDnDQj3LRt0bpULKGCCJWjlKRJrEDZ2NsX1nmzRmDd1ZcfRqdSsbJuyQx2SuE30B/aM
 Yry4InZOsIxK5vT91+a8y/QC7PCvBgQAamQOEhOUG4j80WoZp1vy1pArud8w+6ydmWLv
 NgsSA3/Ev/vFmGaSczZn0es+ophhRrMvfP3t7KuesVS4HZ1yuCqja7FDE/83Hf87jAXb
 s1Lw==
X-Gm-Message-State: AOAM531IyY1mQhv3mio5xKHNW8BPEOC7mefM3ql3klwOiKYSuwanUu48
 yKLBcKP0sewUD5yDTkwHjkP8hOkw3GNBPmQkW90=
X-Google-Smtp-Source: ABdhPJw6E9An2KD+RL9ST/wrhfOWAy5ueB//Ifqgb2407bw7HPWb59jw92gc1GvCwNLmO+OI15FvZi4inufUavYpY/E=
X-Received: by 2002:ac8:d82:: with SMTP id s2mr13735742qti.164.1596396534654; 
 Sun, 02 Aug 2020 12:28:54 -0700 (PDT)
MIME-Version: 1.0
References: <18367873-6ebe-3f41-7307-0f0933becda3@microchip.com>
In-Reply-To: <18367873-6ebe-3f41-7307-0f0933becda3@microchip.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sun, 2 Aug 2020 21:28:43 +0200
Message-ID: <CAFLxGvzxSTGpVgedgR_5WOOROvxeV4=O-KWd11vfDDhE8Ja42w@mail.gmail.com>
Subject: Re: [GIT PULL] mtd: spi-nor: Changes for 5.9
To: Tudor Ambarus <Tudor.Ambarus@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200802_152857_790527_4F589B4B 
X-CRM114-Status: GOOD (  12.11  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Jul 28, 2020 at 12:48 PM <Tudor.Ambarus@microchip.com> wrote:
>
> Hi, Richard,
>
> Please pull. Cheers,
> ta
>
> The following changes since commit 48778464bb7d346b47157d21ffde2af6b2d39110:
>
>   Linux 5.8-rc2 (2020-06-21 15:45:29 -0700)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/spi-nor/for-5.9
>
> for you to fetch changes up to e93a977367b2aefff3c1fb426bbdfc6e2980815f:
>
>   mtd: revert "spi-nor: intel: provide a range for poll_timout" (2020-07-28 11:35:27 +0300)

Pulled! Thanks a lot!

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
