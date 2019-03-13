Return-Path: <SRS0=ZvR1=RQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8DFBC43381
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Mar 2019 10:13:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8A992087C
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Mar 2019 10:13:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I9OGjihJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="fho1zDQD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8A992087C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0pCbCNuuD8noa2YzWtceyUA9vj2ZlBPLH3xWUiC1+pc=; b=I9OGjihJZstO9x
	BgFxSQMpy0Drmkuy0sDbVEBrRWkmtky7v2eX3j5XSzzZNvYCNyiIvSo5OZABsYncwY8h24kvg8OWT
	iaSYZpLeawfTDy6HKFXgbM5vQxE13yjnnuONRc/iD4mMJCcfaxYF90wnQsPK0G7rWHdKD/3yniKhn
	qUKCuOerZIGMRs1kwBSYoCW2lZ2fJWxyc+XYdwjYFJQaQKX9MuNvvdiI9ramoQjIwI1ox/S/Nx2T3
	G9i7Q1dOFQBIaQ1UY9x5L5Ix7hCUzxBDB9ywnv9G68nKIozpD79P85bPmM7+VjP4Zi0sHmWE5H561
	rKMMD4EL6vFruDskJICw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h40sk-00065R-Gk; Wed, 13 Mar 2019 10:13:06 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h40oy-00084R-7a
 for linux-mtd@bombadil.infradead.org; Wed, 13 Mar 2019 10:09:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bai5/UApUbLdwPqVO2hVf3/ucvzzG++YouhMo2VgspE=; b=fho1zDQDEXNpUm03F3H/fbMgAE
 zLHoQE3xo76N35hEQM1kIwYs4F9CEXGizMIosIeC5mlgSSBDmXdvCvmRGnjwSnstdEc5Fi79jLhV8
 J8FRqZ3dPQbGBLlESaA4hHWjlvht2gofNO0DXVOMUgM6Rmebj5zrjY8ianTveEQPfenTSMEotQfsu
 LyOY3YFv8fOXvIzQzlpblmebfK55y72wy3BFR3/ODc28gFLPsRg4zTj4JKNnj2xyMMVZiozpjhqYS
 gChPrl/eDO/hqlrzzbHqqkW9ooQ8EjG5LlVY+5qSi8HqknaIBSWbC5xbtq+dvPzyXFxAYO3UTk2Mv
 8GpM6Q3Q==;
Received: from lithops.sigma-star.at ([195.201.40.130])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3zS5-0003NA-Qc
 for linux-mtd@lists.infradead.org; Wed, 13 Mar 2019 08:41:31 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 047BD608A380;
 Wed, 13 Mar 2019 09:29:44 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id AygfTiTM_92y; Wed, 13 Mar 2019 09:29:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 769BB608A3A1;
 Wed, 13 Mar 2019 09:29:43 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id X01h783-jNPS; Wed, 13 Mar 2019 09:29:43 +0100 (CET)
Received: from blindfold.localnet (unknown [82.150.214.1])
 by lithops.sigma-star.at (Postfix) with ESMTPSA id 2F68D608A380;
 Wed, 13 Mar 2019 09:29:43 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [GIT PULL] UBI/UBIFS updates for 5.1-rc1
Date: Wed, 13 Mar 2019 09:29:42 +0100
Message-ID: <1772218.nkLIIC4SQU@blindfold>
In-Reply-To: <CAHk-=wiR64B3MY852L64auE8ZGBhfFoTNXG=F=h5TVEM5gxRtg@mail.gmail.com>
References: <6283638.XALati16HY@blindfold>
 <CAHk-=wixZBzR5nbPZ3Y1=VahyVDsqVZhRfRhewJybx2-yA_FEQ@mail.gmail.com>
 <CAHk-=wiR64B3MY852L64auE8ZGBhfFoTNXG=F=h5TVEM5gxRtg@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190313_084129_956743_5C97B746 
X-CRM114-Status: UNSURE (   8.27  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-mtd@lists.infradead.org,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am Mittwoch, 13. M=E4rz 2019, 00:40:33 CET schrieb Linus Torvalds:
> On Tue, Mar 12, 2019 at 3:18 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > On Tue, Mar 12, 2019 at 8:13 AM Richard Weinberger <richard@nod.at> wro=
te:
> > >
> > >   git://git.infradead.org/linux-ubifs.git tags/upstream-5.1-rc1
> >
> > Pulling this thing is taking forever for me. I can _ping_ the site,
> > but the "git pull" has been hanging for a while.
> =

> Ok, after leaving it for an hour and a half I just gave up. It's not wort=
h it.
> =

> Put your repos on some other host, and re-send the pull requests,

Will do. UML is on kernel.org since ever.
UBIFS is on infradead.org because it was already there when I took over
maintainership. So I will move UBIFS to kernel.org too.

Thanks,
//richard =




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
