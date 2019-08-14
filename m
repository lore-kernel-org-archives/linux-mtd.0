Return-Path: <SRS0=SIcx=WK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C962C433FF
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Aug 2019 12:35:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 303BF208C2
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Aug 2019 12:35:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Sdeg0S6L";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gb+zHMFD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 303BF208C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/0DQ6kCpLfCM/e5i37mSroiA9lWz7tax0egWI6d3pBA=; b=Sdeg0S6LhudXUe
	kXBm340+AJBHqgnCmcWWqd7vEyZgaOhdFtRdnSlBaj0eHMq0Ia0zj0dy0M8eNTVi8WbK+xIuONySb
	oG/DeN9EEga++c/z2WE+DtmGFNJNycPHjZgB9PZ5FhuGqQvtHP9ewfjJlPhNIWpXexdM+pmPLYFui
	p5gR3eH80zoZfz7vMp1oePlPBzAud3yubmcmUYqjYeTQXLZXO0XCuaKUe5NOiFyiRhOPflT3mbVHf
	0VSrCK5GvhHrIiZZOEpPFSqpUTDSNqUv9zk4P37wrDnkWkaw5b7rvAu/S8glVnr6l/XQKvrqUBuCS
	pLZcyWvasToLrk+Ht6lw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxsUL-0008FU-Ae; Wed, 14 Aug 2019 12:34:49 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxsUJ-0008F7-1e
 for linux-mtd@lists.infradead.org; Wed, 14 Aug 2019 12:34:48 +0000
Received: by mail-pl1-x642.google.com with SMTP id y1so284384plp.9
 for <linux-mtd@lists.infradead.org>; Wed, 14 Aug 2019 05:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DQzNNLU0jD9X94+D3s8jK0WcSWuvqqIju3nMXa0GSbg=;
 b=Gb+zHMFDf3Vqh1sO55eA7EvPUM1CFIOeJyJ/a8ahiGUAKdTh/QniMMpWuql7hk0+5b
 pZuhMzGRX1J7IDdFDP9sRN3dMby5UW3TS7zGUhb74EOP/HXAhrYCz4TRMaraAA1+L4PY
 hi2GnXXeumDxFudGFa9rCztf4ydLKWXpf//Xmg6yxWfFCF32p6HLvuQBX7zgNtp8SYSI
 Hvwx2Fje4CEp8VtZpuwjPZefdNF4/znY039U2l48WaDwoHwklXqd1MBSHgW+E5ANTUXp
 p/xD3dgLQk3fx2h3aVu3ERhTfoQs18IFW0KrlVbZWTn7f0mMgsqf87W2WAGcoJKL9wSi
 L82Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DQzNNLU0jD9X94+D3s8jK0WcSWuvqqIju3nMXa0GSbg=;
 b=ZJ9IzDhyOkyiltpH2qU6LStw36vBzMeYSQ+nFD8CJ3sijGn+Mu091CeGKFT+KUt2Jr
 N7LwcaN/5KgTDzYCNm8mTEsqSgu1+BkBIStlFglmouxz4+vAY+WCtOmV5xZU1IkTeDFk
 SD0SmSBkeSoL1ZmbUD0VMh3fzgPyQ7IyemO8E0QGZO6Go53NGvuHefHYWpQjDNK8MT2X
 cZrJuDiljoISkUoATcYCCcKy1Ek36wEVf7/SipOfNdhJlTiBGmuXBWFYT1BQzMvY4u4t
 pCBaPOC7DNwGQ/NGdUXHhLZhXiWE1CCvd0joKkp4uEh9TGdW6cVaGF37H+sLRWVEOMw7
 tNUA==
X-Gm-Message-State: APjAAAV0vb5MlzR5dsrmhdBLGIP8qDg5+AEbhdQhn0c35GpXbuMZE6SN
 3+cJpx85XfUmh9wU4xMbe8rDxZoQrEq5mvhMF/qWSg==
X-Google-Smtp-Source: APXvYqyn4nb5Fw8P4qOPlUlDXjAb3g+oSlB/mf+IqUhdVhMnF01l/Y2FezxMUIQdYzLRycLf1x7EAdNFHm7gSUHsXr0=
X-Received: by 2002:a17:902:6b07:: with SMTP id
 o7mr41227918plk.180.1565786085077; 
 Wed, 14 Aug 2019 05:34:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAF_dkJA2DFr3Vgk5ie=V5YitZr8HaiXWuQ+SKsHzzmLBFnhyeg@mail.gmail.com>
 <23922253.ayd0uQntjt@blindfold>
In-Reply-To: <23922253.ayd0uQntjt@blindfold>
From: Emil Lenngren <emil.lenngren@gmail.com>
Date: Wed, 14 Aug 2019 14:34:33 +0200
Message-ID: <CAO1O6se0aPh2FScDStqrK50PPipBbsgEnEPbMHvOdXt2cbxtvA@mail.gmail.com>
Subject: Re: [PATCH 1/1] ubi: Allow ubiblock devices nodes to be created by
 volume name instead of volume ID.
To: Richard Weinberger <richard@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190814_053447_089818_76EB5442 
X-CRM114-Status: GOOD (  11.85  )
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
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Patrick Doyle <wpdster@gmail.com>, Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

Den tors 4 apr. 2019 kl 21:43 skrev Richard Weinberger <richard@nod.at>:
>
> Am Donnerstag, 4. April 2019, 17:29:16 CEST schrieb Patrick Doyle:
> > Add support for CONFIG_MTD_UBI_BLOCK_BY_NAME, which enables ubi block
> > devices to be named by their volume name: /dev/ubiblock%d_%s rather than
> > their volume ID /dev/ubiblock%d_%d, so that one can mount e.g. a root
> > filesystem by UBI name instead of volume ID.  UBI volumes can be renamed
> > on-the-fly in user space. This allows the root file system to be swapped
> > from an "A" volume to a "B" volume without having to change the mount
> > options.
>
> Isn't this why we have udev, to create fancy by-id/by-path/... naming conventions?
>
> Thanks,
> //richard

I actually implemented the same change some time ago, for the exact
same reason (swapping two volumes and then reboot). Referring to an
ubi volume by name is more convenient than volume numbers, since names
can be changed and numbers can't.
Is it maybe possible to define both /dev/ubiblock%d_%d and
/dev/ubiblock%d_%s at the same time?
How would this be done with udev instead to get "fancy by-id"?

/Emil

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
