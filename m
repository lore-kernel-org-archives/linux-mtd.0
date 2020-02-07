Return-Path: <SRS0=Kp4F=33=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDFA3C352A2
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2020 11:05:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA02D20720
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2020 11:05:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hxZE38vk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c9gxH8cd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA02D20720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bQPLgPPdY9HiSk5t603eLUvMD+5fHSUuGRtS/3gQJ20=; b=hxZE38vkQpk85v
	ggc0T6+FuCmXy7zTgrjx8pTQeyXQCcJdjbsc8fX2aG/OEMYhv6qh2cAzaLqr10ZFnMGOP441qiZK+
	kz2FSl/jO0Hj/6dEfUEnopnjzscO5qmGpbnSDKOFVM7xpOSiMjuw2snKhwLVsr9jeIy2P18xwp0tm
	tK+pTdFKlYZm+BJ7X6dkhdz120Fl1L6CKzdeXndk0k88Ht0Sgl2r+D6nD/waRC+rF/0INB94VPjJk
	cSb+KuhJe37iO1+sRxyZoCB2gye/k9H5Ms18MHYAwVJREdAvJPGCpHPGF4Aqmn1NPu7D8Dk7BkeK6
	RJCio9waxY2vCd4PFNLg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j01RN-0004To-H1; Fri, 07 Feb 2020 11:04:53 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j01RK-0004TE-Fv
 for linux-mtd@lists.infradead.org; Fri, 07 Feb 2020 11:04:51 +0000
Received: by mail-wr1-x441.google.com with SMTP id c9so2136245wrw.8
 for <linux-mtd@lists.infradead.org>; Fri, 07 Feb 2020 03:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p00Q1vyDmfsN/f3VVhOnQ4VwaHZlAhPdkKh7jGpbCEA=;
 b=c9gxH8cdlo1ECKxd6lydOsPGi/haaLbHLzzLcxtnFmzneF6BK/hmAkqFZgl9x8GNRV
 OJD0VNdJZLNoY6SM9R0IxoKsw2ey5addQISNxVDkOzrH7iffRFbnwrkTlPzywrHfwYWm
 lOXzpJ124/QuvBQP5HwfRyZPVK3DtDPYs9NlE0UENGtTeVh6TZSUm2achdzwEsC5cdr3
 yGqWe4VT7DM0wD+iculn3n4UwsmaBWomugWUeFcHl/rt5NRVr9uqVuVn0pQOtFtrEEk0
 BQXQco3Jo9NZC5MMhx96RGitr9lkXSUdokJyWqXqgAWkTjLfaDFePQQOF1cLd3k6Sg2v
 ezhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p00Q1vyDmfsN/f3VVhOnQ4VwaHZlAhPdkKh7jGpbCEA=;
 b=FGXLYYBDsVFPqFabhhsTGEDjhwMKONkOGxrdOdFYZMbcnqDxU8cYFnge0k9mQhP1Po
 ofVOLULPVk2AFvj/nnLkwaLUcr25aBz3dXtQbQ54aWxu93dtSVx1mkddAZ+FJggQsAFU
 96Zn5UhcN+TQ/1qzLM11hCHiyyi0gvPIk6a2BzJcJfKfWiqhdQO1imvu5GRCX/M5jRYl
 W3pOHVo/PF1XrgqZcnyRfJFZHI1tkTmrfmsdHZ59H3hhGXGsVtTEimRgdRQh2bObWEks
 vEgPnNo3KSclO4RMoL5DlLiVuS8K6KGeUZVQ8zfz/VqgYYGkgcHDcmWX8NOtYnJlb8I7
 5IBQ==
X-Gm-Message-State: APjAAAVnXAUGOCm7yHi9RVSb1hAkIoNkND7JGv5s2ooCN+JQ7WiFkwGh
 VAtHwy+45pG0Rz1hMU9bYD+GTrnxWP5at93TCNy8S2nn
X-Google-Smtp-Source: APXvYqx80ePGpKN1DT8b26wGzvLAP6L1ryRYR2EzDKREgYeZE3icNTLD5wQmqlLsT9YC2hx5ddcL7BF2PdgLIRQboiE=
X-Received: by 2002:adf:fdc7:: with SMTP id i7mr3971871wrs.270.1581073488709; 
 Fri, 07 Feb 2020 03:04:48 -0800 (PST)
MIME-Version: 1.0
References: <0d3a2ed9-8ff0-7030-a8c6-c5a204eb6b5b@niko.eu>
 <20200205092202.5f0929c3@xps13>
 <21a266b9-ff3f-7a94-4562-11d6f59d4327@niko.eu>
 <CALLGbRKotskAgZpxNFHF+RdrA0HB7U2qw6bzvZ9WDJEAiWYwgQ@mail.gmail.com>
 <d86c95cc-3393-0f6e-73ab-56a5bbbbedd8@niko.eu>
In-Reply-To: <d86c95cc-3393-0f6e-73ab-56a5bbbbedd8@niko.eu>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Fri, 7 Feb 2020 12:04:37 +0100
Message-ID: <CAFLxGvwKfcw=Com5U7uGsA-iJ9SuQyqHdEeaWPUmnoxqwma0Gw@mail.gmail.com>
Subject: Re: ubifs: mounting fails due to error in orphan file handling
To: Jef Driesen <jef.driesen@niko.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200207_030450_534255_E06D0A01 
X-CRM114-Status: GOOD (  13.73  )
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
Cc: Steve deRosier <derosier@gmail.com>, Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Feb 7, 2020 at 11:18 AM Jef Driesen <jef.driesen@niko.eu> wrote:
>
> On 2/5/20 5:17 PM, Steve deRosier wrote:
> > Looking at the comment in the mentioned commit: "This corner case
> > needs to get addressed in the orphans subsystem too."
> >
> > Was it addressed?  Was there a second commit for that?  If so, is it
> > in your tree?
>
> I don't see anything relevant showing up with a quick:
>
> git log ee1438ce5dc4d67dd8dd1ff51583122a61f5bd9e..master -- fs/ubifs/
>
> The only fix that refers to that particular commit is this one:
>
> commit 10256f000932f12596dc043cf880ecf488a32510
> Author: Zhihao Cheng <chengzhihao1@huawei.com>
> Date:   2019-10-29 20:58:23 +0800
>
>      ubifs: do_kill_orphans: Fix a memory leak bug
>
>      If there are more than one valid snod on the sleb->nodes list,
>      do_kill_orphans will malloc ino more than once without releasing
>      previous ino's memory. Finally, it will trigger memory leak.
>
>      Fixes: ee1438ce5dc4 ("ubifs: Check link count of inodes when...")
>      Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
>      Signed-off-by: zhangyi (F) <yi.zhang@huawei.com>
>      Signed-off-by: Richard Weinberger <richard@nod.at>
>
> But that's about fixing a memory leak, and not the on-disk data.
>
> > Beyond that, no ideas, it's not a chunk of code I am familiar with.

I send a fix for this before I started traveling:
[PATCH] ubifs: Fix ubifs_tnc_lookup() usage in do_kill_orphans()

Digging currently thought all my mails....

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
