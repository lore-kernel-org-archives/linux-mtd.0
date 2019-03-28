Return-Path: <SRS0=odZH=R7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D62DC43381
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Mar 2019 11:54:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D23D720700
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Mar 2019 11:54:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D4T3exiq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bofh-nu.20150623.gappssmtp.com header.i=@bofh-nu.20150623.gappssmtp.com header.b="iu1+p/G/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D23D720700
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bofh.nu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/i+hmKU0dvWOkIUqE6HRZmXIyO0z7HDgnBn05bF+zhk=; b=D4T3exiqdEbGmf/Tcb4fSc++yM
	ok27Mph6bq06LO1T3gJsF04TVrlaOQMaQX0Nk/ku1E8WVmG7rpjGI35W5gu5Nwf7ZmVAW3hUQfr5J
	zPwg/G8xwils2V7crYCbFapRAFko+YsKBQYB6Gukt3n4a1X7luY2g4v0XmIdz9Spo+hQuN3m6CesH
	szMe4lN+TZFWzxdFO8WYqpArVLPUqg15yBhRUVgAjv2LYG4Y20afdx6mHz71PqzY3W7k0rYVLqXDy
	Fo27A3IM23CZvTd6Vpf4opuUr65YSPV6j/m48y1t3VFYv5Qt9ZFa9qL7DZ40ERnIIzHkVeQWoibck
	93hTmBpg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9TcK-0008AW-I4; Thu, 28 Mar 2019 11:54:44 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9TcH-00089Y-Bg
 for linux-mtd@lists.infradead.org; Thu, 28 Mar 2019 11:54:43 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 64so17991414otb.8
 for <linux-mtd@lists.infradead.org>; Thu, 28 Mar 2019 04:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bofh-nu.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=NQ2ows4CIjzTGSHm4+IIKozZNGaSI2ut8dPHL24ufMg=;
 b=iu1+p/G/39lmRsxdHX4dlmAEuCP4I922nWwN1tjqH6pcuVNBQ9yT2pJMe25p0ZVko7
 0oBdeik7hbwtgusYV9uEm3dXv28e+T5twJdplJJKI2FGqC0MocARF+NF05Sjn75Qg+9M
 U7D+z1O3UAfDCsue4IhjJPKnuZL8UP9zNwQOZUZbC5nklNdOhjmD8NR3egjTNjyXd9Mx
 iVWcQXkgpTcKQoIFIkWsd2bf504YQGwy4vEwFvaYYexXfs1hWdtPyyUOwN/ykiCjxKMq
 8vd2mBYJUcG4eRWla59htJ7YTT1cE80i3SROkd7YZDvETrA58aLx/H9O73+7EKEbvBHJ
 sTuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=NQ2ows4CIjzTGSHm4+IIKozZNGaSI2ut8dPHL24ufMg=;
 b=mEBpKD5Fh/I3GbFIOhECU4oLDiDZiU59CZj1tlKCuqj9cIbmE5M2jcKWUFa3Vp5y/P
 yWR7H4OnlTxNGfemnmt0cO1zCtSp3OWnCXyT3Ym02dNCJkNWHVM4zNSLP11lGasJIrBn
 Ow3aiSlTJtZv1snvuGY6Nw3OePK+6ET25bPePGJj75gG0X8CJzaFNG/c+/KYa7eiNFlC
 ZlLjTjain58JgLSHFiYKSlnlD5wuiT6o5BrhM7iznqPMM+ju5D8WbHre96Xvji0jN5IS
 zP7aZV0ZGM2ay2MI6B1OeDT3oLrWn0gQmlcft3fjNNqYhHeeK3uEwd+OjpvcaFIP2IeU
 wVTw==
X-Gm-Message-State: APjAAAXzmzgBAGeM+Hiz1MGTVSQ6MNjDXUvnbZv/mZ5hEZG53lxnfNz0
 dNh1m9kxm1t6nngBFeye6srRryuAAtJ69tdunoIDI1/Bja4=
X-Google-Smtp-Source: APXvYqw9pr6nXEsf4nbcw0ADF+IQt/GRqkN4gXnj3OYHr3Y9tPS1Ybrs+PVqm5/ELFpLvQ0rtL6d0XkwmRbNXL4V10Y=
X-Received: by 2002:a9d:6185:: with SMTP id g5mr32293162otk.346.1553774076821; 
 Thu, 28 Mar 2019 04:54:36 -0700 (PDT)
MIME-Version: 1.0
References: <CADnJP=vQURY9u7Fb=Bt=udf89A6VX_TccBXfk8q2kdkqMnqj4A@mail.gmail.com>
 <CADnJP=shWk7qcK1V9v0JiDGqmOD4-B3zyXzbj7ZbTf2H3BLnRg@mail.gmail.com>
In-Reply-To: <CADnJP=shWk7qcK1V9v0JiDGqmOD4-B3zyXzbj7ZbTf2H3BLnRg@mail.gmail.com>
From: Lars Persson <lists@bofh.nu>
Date: Thu, 28 Mar 2019 12:54:25 +0100
Message-ID: <CADnJP=svNQ_LRq1OWbCMNNeTHs_-fAe1kmU1+G4GZ2BV0Jvo2w@mail.gmail.com>
Subject: Re: UBIFS file-system corruption (missing inode) after power-cut on
 4.14.96
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190328_045441_484955_5D5D7187 
X-CRM114-Status: GOOD (  12.64  )
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

On Tue, Mar 26, 2019 at 10:21 AM Lars Persson <lists@bofh.nu> wrote:
>
> On Thu, Mar 21, 2019 at 11:02 AM Lars Persson <lists@bofh.nu> wrote:
> >
> > The missing inode is always triggered on those two particular files
> > emotiond.conf and tampering.conf that share the same write pattern at startup:
> >
> >  cp file file.tmp
> >  echo some data > file.tmp
> >  mv file.tmp file
> >  fsync file
> >
>
> A closer look at that script shows that the atomic file update part
> was bypassed. It only performs a chown operation on that file.
> That simple chown will trigger an overlayfs copyup operation.
>
> With a proper unmount after the system has finished writing to /etc I
> cannot reproduce any corruption. An unclean shutdown triggers
> corruption in about 1/3 of the attempts, also when I cut power tens of
> seconds after the problematic script has executed.

OK I think I have found the bug.

Commit 32fe905c17f0 ("Fix O_TMPFILE corner case in ubifs_link()")
tried to fix the use of O_TMPFILE by removing an inode from the orphan
list when it is relinked.

Unfortunately the removal never gets committed to flash because the
removal of an orphan does not trigger a commit. The condition for
committing is that new_orphans > 0, but in our case it is zero after
the call to ubifs_delete_orphan().

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
