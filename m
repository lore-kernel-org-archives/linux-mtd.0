Return-Path: <SRS0=4b6q=SG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E74FC4360F
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Apr 2019 21:31:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29A352171F
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Apr 2019 21:31:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g+L9w3TE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29A352171F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C/TODJOVL1Bws7yWqXv6aBp6N6nztDwMR+kMUx7Il54=; b=g+L9w3TEKOhe1z
	sv8r9TTFyux1NSQHJNG2xG0WKiaZgVrzaAI1YWzAKSKDHGwTcKoss7VV8sfl93kXlK+KVhEpHJTtP
	W10d80oiILmeH9UNMoF0TD4JgpB7EbsqedOxeUFDIr1ioVpZb5oQD3nBPYAro+2QpSAAdxFGxl3aS
	dU0IImwFdtE99Y4YhRtjLXjfSiCQICVgKYwIdh3DAk5P/26WK1wVz59Rh6LJiGhxm58wJSqqJl8gq
	g3LHA61wuJtklkBLuVMhovT7axcXV+bFww5tC0xBq9+2j4cvwTpa49+DoG6JVh9fLT7F3oNIeqwhe
	NY4qmYuk4Voy+8dM7QaA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hC9x4-0004IC-JB; Thu, 04 Apr 2019 21:31:14 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hC9x1-0004Hr-BN
 for linux-mtd@lists.infradead.org; Thu, 04 Apr 2019 21:31:13 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 4BAED6091849;
 Thu,  4 Apr 2019 23:31:09 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 79ReQ4G1bG9G; Thu,  4 Apr 2019 23:31:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id F41FB6091851;
 Thu,  4 Apr 2019 23:31:08 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id EmzStmp3404O; Thu,  4 Apr 2019 23:31:08 +0200 (CEST)
Received: from blindfold.localnet (213-47-184-186.cable.dynamic.surfer.at
 [213.47.184.186])
 by lithops.sigma-star.at (Postfix) with ESMTPSA id C88F96091849;
 Thu,  4 Apr 2019 23:31:08 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Lars Persson <lists@bofh.nu>, linux-mtd@lists.infradead.org
Subject: Re: UBIFS file-system corruption (missing inode) after power-cut on
 4.14.96
Date: Thu, 04 Apr 2019 23:31:08 +0200
Message-ID: <4350242.ygWD4Jmofl@blindfold>
In-Reply-To: <CADnJP=so8PSqJ4NgqSyqSk5UEtO2wzSC_LG0Seo0+Yuf45oefA@mail.gmail.com>
References: <CADnJP=vQURY9u7Fb=Bt=udf89A6VX_TccBXfk8q2kdkqMnqj4A@mail.gmail.com>
 <CAFLxGvye+F5hB+1DUUhDzjaHB5ajC_M+W3fyt5x840sO68RgUQ@mail.gmail.com>
 <CADnJP=so8PSqJ4NgqSyqSk5UEtO2wzSC_LG0Seo0+Yuf45oefA@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190404_143111_544074_7E2F6645 
X-CRM114-Status: UNSURE (   9.60  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am Freitag, 29. M=E4rz 2019, 10:43:33 CEST schrieb Lars Persson:
> On Thu, Mar 28, 2019 at 6:31 PM Richard Weinberger
> <richard.weinberger@gmail.com> wrote:
> >
> > Can you please share me your corrupted fs?
> > I'm not so sure what is really the root cause.
> > The thing is, ubifs_delete_orphan() does not need to tigger a commit.
> > Ff something depends on a commit, we have another problem, I fear.
> >
> =

> Thanks. The download link for the file-system was shared to your gmail ad=
dress.

Okay, I see the problem. :-\
But so far I don't see a good solution. /me thinks harder.

O_TMPFILE turns out more and more to be a nightmare for UBIFS,
it all boils down to the fact that UBIFS does not have transactions,
just many small journal updates which interfere with each other.
In this case the orphan list has an old entry
although the journal did the right thing.

Thanks,
//richard



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
