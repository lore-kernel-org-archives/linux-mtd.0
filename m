Return-Path: <SRS0=JPnc=HM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BC11C433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Feb 2021 11:13:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1176A64D99
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Feb 2021 11:13:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1176A64D99
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=R355pCgvbndm8sCRblnZDsLxWx4jPMvGkrqIOm9rkVg=; b=pMD60Ye8oqaAZlBfZomZJpwuO
	aAIf32hHUf8wivPFdAdcR5xeiWNap98GdQLmrMVyjMiajKqjijcj95OoBjRNqKKp4RPx9+cYDrF1S
	jL0s71xIpPpoCQBMg31EJWz53Vl1lmbhXTjeqCfhE5v+kcU4TygggRLWWJlX76n/yYwi0SkXwFRIq
	eotz5KWF5BshWHrpLbRn7nVtwc9xjf3OuE8gDlTKcMhoUhpRe7EBNdykUfgU8c1tzlgp+tmmNApQf
	R3ULUnS0tDCjLsjsesKO7tH8TOFeVBOFL8TiGRqeuYlP5DjpLrlfAZuBGMHEbBZgO2wFP4wsPOa3p
	JVZZohQjg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9nQO-0002cp-7N; Wed, 10 Feb 2021 11:12:48 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9nPu-0002K9-4C
 for linux-mtd@lists.infradead.org; Wed, 10 Feb 2021 11:12:21 +0000
Received: by mail-qk1-x734.google.com with SMTP id v206so1210010qkb.3
 for <linux-mtd@lists.infradead.org>; Wed, 10 Feb 2021 03:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l6Aa5lO3nX8StZdHni5HLbVJmff/S5b/H+w9der7I6w=;
 b=cH20E2hoIgdhIv7ZUGg4Kji8fgP8I30rf969LiyzfgKSxFOVljcaILS+YDx1Arwknx
 NceojQ07JRuMuscoqMNGTcoOSE0ca9QeIpAoockv+iRRDufhxNTrOx9NrnJrLFOH3CUb
 I4BT4EZY69waZThVs0Y8J7Kl4IYq4Tv96JYCPcICcqkvxrSX9ypNEYanl25M50qa2lvg
 JPJ4jCBd2/pVVVR3XP5NX/FfnayqWe50rMBw0DV7nlvxOz1BypO2JSQN/+Ae2VfB4DXd
 dnDqL5A9kUsz1OvkU6/L4JO/499Cz6+z/3M7bWB2e5FNhd2NhDZd+YCZK5doStLcqZef
 uNKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l6Aa5lO3nX8StZdHni5HLbVJmff/S5b/H+w9der7I6w=;
 b=ijSU3hfW/TzvyYRjqjLTy/O/nQy+/eWjpZ/vlj6QF/oY/+cVh7dJuOtsv/scqn6Uzo
 RSPXoXeP4nmdj6Y5Ayaks1QTHpa/HG2/qsSn9i3PTSf+wTmuLp5vzV6stcwExCMyxH5H
 CrJ+UN0utx844X1ymss8H+J3BMA69vAa8OGyWwyuVu4Yyvu9Kts4ApgizMOSO3ZxY7ZF
 LVmrAq6XqlI1lcXEH25Vap2DtNriFZGlEdWYaR28qABpUZaeYK7//i5tJAqv4/S3LQvG
 B5WtK0ZW40JtrzhaV9KhbJ1jp3hkzMNWf+KO1HPSPha8mHucKQluEvAbmW0xHlOFuZ8a
 /Cug==
X-Gm-Message-State: AOAM533xuJdjDjUDfruIoXmNWH4yq+t0kMiqOvrQwjILIkzInBjquxRW
 oHwPpHtJCLSOPu83WVUYYZR4Ap9K68i0B5uvd6A=
X-Google-Smtp-Source: ABdhPJwsDcMa+DYZsa8ZrxJYIhlNsLdkVt1FpNlaoYv1QSqXBAhIM+dt/pKZRTwrf49Vu75DpaqqwcLJpz8kmVkv2bY=
X-Received: by 2002:a37:678b:: with SMTP id b133mr2707612qkc.237.1612955535243; 
 Wed, 10 Feb 2021 03:12:15 -0800 (PST)
MIME-Version: 1.0
References: <20210124232007.21639-1-richard@nod.at>
 <CAJfpegvN2KdMj_7T-OF1PAs8xZiU3f4233AvigaXwwRAsgQEjw@mail.gmail.com>
 <563952295.378372.1612881357746.JavaMail.zimbra@nod.at>
 <1923896038.379134.1612901174023.JavaMail.zimbra@nod.at>
 <CAJfpegufojx4q_CfR6L-fzSyQw9QXJZKy5xKVZZWaepADkL=Kw@mail.gmail.com>
In-Reply-To: <CAJfpegufojx4q_CfR6L-fzSyQw9QXJZKy5xKVZZWaepADkL=Kw@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Wed, 10 Feb 2021 12:12:03 +0100
Message-ID: <CAFLxGvxhxxfT_ugmeFuqZ099Z+v-ENg9C6zq78sV45YzA5_Y_w@mail.gmail.com>
Subject: Re: [PATCH 0/8] MUSE: Userspace backed MTD v3
To: Miklos Szeredi <miklos@szeredi.hu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_061218_261925_6FCB778D 
X-CRM114-Status: GOOD (  16.91  )
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

On Wed, Feb 10, 2021 at 11:18 AM Miklos Szeredi <miklos@szeredi.hu> wrote:
> > Does this more or less what you had in mind?
>
> Just moving the whole internal header file is not nice.  I did a
> mechanical public/private separation of the interface based on what
> CUSE uses.   Incremental patch attached.
>
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

Ah, ok. So the goal is that <net/fuse.h> provides the bare minimum such that
CUSE and MUSE can reside outside of fs/fuse?

> Dealing with fc properly is probably a bit more involved, but does not
> seem to be too compex at first glance.
>
> Do you want to take a stab at cleaning this up further?

Yes. I guess for MUSE the interface needs little adaptations as well.
But I won't be able to do this for the 5.12 merge window.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
