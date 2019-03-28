Return-Path: <SRS0=odZH=R7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6245CC43381
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Mar 2019 17:31:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FD532173C
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Mar 2019 17:31:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G+ORBJRt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rlLE0uQL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FD532173C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3vKyrzSU/E47obrTuOg39QaKvC49ByTPHWmH5lswKp8=; b=G+ORBJRtAoee+7
	itwRPPortC9ON2SHixhy3hpAcDAs+mmZNkMe5XEagJ2DwsAIn2SybpDtGHUBXFjxcEqjjG891ddiM
	19sTl5Mb+25wVe0AAw2NufWZ6E2hHOz3ppYEGzJZ++nwy8DZ58Vi8R8+UsWhifoetTHa1rDEf0EKU
	FaRGFMqo4IJ2fzmdoJl/nbB8RyxMol6QXPxXcIHqr0pwovJpW4c+7vYYiQsqz6aBzWyPC5Ga9J9dR
	RR6f9StD4etC23znFk5qiljf79wCMTz2ZRRLZCNasEqqhUyymLuY1eEiGbhAZxLaYDGznXNJjFZNR
	H+ep5R6HQb7guKWYNoOA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9YsO-00089X-Tr; Thu, 28 Mar 2019 17:31:40 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9YsM-000895-BQ
 for linux-mtd@lists.infradead.org; Thu, 28 Mar 2019 17:31:39 +0000
Received: by mail-wm1-x344.google.com with SMTP id y197so2316664wmd.0
 for <linux-mtd@lists.infradead.org>; Thu, 28 Mar 2019 10:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a78M556ISSOZsZKhkUczf+kjzSL2oEqbctXBBgPthlQ=;
 b=rlLE0uQLI38AO29Ab5svlRqc/jo9v2twHlFOrBlKT97lSNAwY30xRafxbC3ihrAdFt
 pzhFXH05h6j7IHYxKdWkDY0RcnXzhnvqJtd0ovtmRENJ6eu8fM72OWR5/RvjZOi5S0Xo
 cItVwhOd0GraNkNpwv4lhzrJz3heNciiz2pXmAp4dAfzFNbV1AVxdmjAn77uFrJkmyeE
 rpnob4LqvihPeBATbBTlyMKZigFZH1QpvTlXhbD/9LRBco70Ln8fdI9Zz/Qi+Stw+wur
 uxSC58JfRsLYODRCqBesUCO+QFf4dTAuNyj7UUQsEaSb85TQWFGvSS5GyyYRHT7UFZyv
 wkSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a78M556ISSOZsZKhkUczf+kjzSL2oEqbctXBBgPthlQ=;
 b=j89G8PmEEAPsA8MVgOdCcMgExDxoADfaj5tYMnOlcY0+4P/OsBv0VV2ePpCZicH5Kz
 rZb4uV+A6qPxaGXxSOfdjvmnX/C+n5whjVb7AxmaHyIbRh1gjXUwXR18RM7vcr8D3qSI
 UhF7GyQMnoeY/3fEU+4nR4E7GH0JvJD0pbc8c9lSPNc8+gm8VrnMD0fksUSkT19sHN4v
 nIh8KwENCSbgxMLs2HZYsrg3xAXS5ZzGPii3sTgs5uxEPu4j8WJkGJrdpgOFBH+1mTVh
 E5574Fmh8OnDGJhq5Cf58gB+RcJFjInPOnF8KoDIpFJQLvvrICB8FjDlS/ToqP0YuVr7
 aykg==
X-Gm-Message-State: APjAAAXfM9B2agxRT4kHVt1EiOlMGTovV3jKWEwHknmVAqMg4L1teYAW
 hSQcWU+paJEgzW2VCgXR2mlp1y39cubcOHOCa5f+0g==
X-Google-Smtp-Source: APXvYqx7SVCyDt6BtquS0bIyllGSiWiJIXLWeWvPHlxSRhJUFaBGG4w1srs8aPjA2eVr08w0r6Sn21bIxKPRtLsWIqk=
X-Received: by 2002:a7b:c00e:: with SMTP id c14mr744299wmb.110.1553794294008; 
 Thu, 28 Mar 2019 10:31:34 -0700 (PDT)
MIME-Version: 1.0
References: <CADnJP=vQURY9u7Fb=Bt=udf89A6VX_TccBXfk8q2kdkqMnqj4A@mail.gmail.com>
 <CADnJP=shWk7qcK1V9v0JiDGqmOD4-B3zyXzbj7ZbTf2H3BLnRg@mail.gmail.com>
 <CADnJP=svNQ_LRq1OWbCMNNeTHs_-fAe1kmU1+G4GZ2BV0Jvo2w@mail.gmail.com>
In-Reply-To: <CADnJP=svNQ_LRq1OWbCMNNeTHs_-fAe1kmU1+G4GZ2BV0Jvo2w@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 28 Mar 2019 18:31:22 +0100
Message-ID: <CAFLxGvye+F5hB+1DUUhDzjaHB5ajC_M+W3fyt5x840sO68RgUQ@mail.gmail.com>
Subject: Re: UBIFS file-system corruption (missing inode) after power-cut on
 4.14.96
To: Lars Persson <lists@bofh.nu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190328_103138_452797_90C12C4F 
X-CRM114-Status: GOOD (  18.62  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Mar 28, 2019 at 12:54 PM Lars Persson <lists@bofh.nu> wrote:
>
> On Tue, Mar 26, 2019 at 10:21 AM Lars Persson <lists@bofh.nu> wrote:
> >
> > On Thu, Mar 21, 2019 at 11:02 AM Lars Persson <lists@bofh.nu> wrote:
> > >
> > > The missing inode is always triggered on those two particular files
> > > emotiond.conf and tampering.conf that share the same write pattern at startup:
> > >
> > >  cp file file.tmp
> > >  echo some data > file.tmp
> > >  mv file.tmp file
> > >  fsync file
> > >
> >
> > A closer look at that script shows that the atomic file update part
> > was bypassed. It only performs a chown operation on that file.
> > That simple chown will trigger an overlayfs copyup operation.
> >
> > With a proper unmount after the system has finished writing to /etc I
> > cannot reproduce any corruption. An unclean shutdown triggers
> > corruption in about 1/3 of the attempts, also when I cut power tens of
> > seconds after the problematic script has executed.
>
> OK I think I have found the bug.

Thanks for hunting this down!

> Commit 32fe905c17f0 ("Fix O_TMPFILE corner case in ubifs_link()")
> tried to fix the use of O_TMPFILE by removing an inode from the orphan
> list when it is relinked.
>
> Unfortunately the removal never gets committed to flash because the
> removal of an orphan does not trigger a commit. The condition for
> committing is that new_orphans > 0, but in our case it is zero after
> the call to ubifs_delete_orphan().

Can you please share me your corrupted fs?
I'm not so sure what is really the root cause.
The thing is, ubifs_delete_orphan() does not need to tigger a commit.
Ff something depends on a commit, we have another problem, I fear.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
