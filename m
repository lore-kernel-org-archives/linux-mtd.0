Return-Path: <SRS0=zMDb=SA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBF25C43381
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Mar 2019 09:43:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7ABB620693
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Mar 2019 09:43:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dapvSaY3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bofh-nu.20150623.gappssmtp.com header.i=@bofh-nu.20150623.gappssmtp.com header.b="an3DeRSr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7ABB620693
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bofh.nu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jRb5H7VYaXJKw9rCP1MsL4ozhplr5iVyeOOjOLnBWGM=; b=dapvSaY3yJ63W5
	3EjIkYQp5mkHGXz4IMFEDv/qd+RLqiZPmPV/yPELtD1Clm0Xp+t928XRQvrOQ8R4gnsjbpcdfGKJ+
	zmAr5NKl3vruzqOOnF67ak4wrUguyvV8qaPlmfMmXRiQ9Lqt/aOr+QShg9AaAbZHUtMGv6M58kiIf
	bURuWYtwefoQuT2EQFYMhA7xfSwBr4HcdgFqqBAcdPv7Q17Xu7A3JHurUWY7R8MSN+6NwJUh49fdf
	SOU8/lTSJlSXnMRYpq7Gcvf4WdLngpBQjEuH/qBV34rCcIIpTCf8KxP0x78ynzGfGV6Sak6HKs7r1
	iZHHygyRjTk9O+EnJDzQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9o3A-0006wz-A8; Fri, 29 Mar 2019 09:43:48 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9o37-0006wY-KT
 for linux-mtd@lists.infradead.org; Fri, 29 Mar 2019 09:43:47 +0000
Received: by mail-ot1-x32e.google.com with SMTP id s24so1401715otk.13
 for <linux-mtd@lists.infradead.org>; Fri, 29 Mar 2019 02:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bofh-nu.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TaKEA/uHmyJxBMA2CYtkJ4VG1nflHL3+IwosA3Xa+c4=;
 b=an3DeRSrJR8f6lh3T82X8jsP+cnaA+cYVRwd0c/HznIAjB7Bvk/x8L5hyFrYaRHFAX
 JJ4QsfoBxDwH0UP/rye6+vths19Vh069RjeCdx2Gc9I9dFHFoqJs/DZP9AKPupYN/9kn
 lDKFfVdLP0yfMviF1P3Qv8Rl3UW3YTG2941u7kPQaRcMjttj9D1WNOAPZnkPp7ycwrDW
 l2fVQIq0q3W5/fougqkUGJ5YkkO9YwiKOooy9w3Zif0YJYSsn9vpn3FV9Uw+m4LGOy8O
 ZiVy2uPkgHosncoeXJECBBqv4q6pdN3ppX2OoOc4NVqf99Dve5BFCGc9Vi8Z06vdEAsD
 Jpng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TaKEA/uHmyJxBMA2CYtkJ4VG1nflHL3+IwosA3Xa+c4=;
 b=cfuqVjXUUndUNgwms4lw1oo/wAuC9jUfZD1qMCPnx6YVkXJ6foplUYFFOWkYo6Tz+5
 pWbB6dOGeQ+KSlRrgZUJpniUaEleB2q9EuOVY7XtyzzJ53h96u7x271mQCaANobBpA7k
 v+dVyQSrG0Z/H1HKsw4PnzA1mhVM+wNRSWUeqDfnd2Cfm5+w2+0kgNlkw/t/IRnusQYq
 b0Epd47qeX1e4/s/gWDCrtXOSt5UOITuO3sjG/0iY17SUGQSN7ECOgkRtG2COdH8cBEB
 m66Aug0uDyTZ3+AYO/LaVZGyTpFBxt/0F+rBe57Jx2gCpvotM6YF7GH87MuN8oHNdOnb
 O5BA==
X-Gm-Message-State: APjAAAVKWIYh81XJ2qsCUzp5CiGgsOe6AwZj1E2FokBrL2aBBclEFLrE
 vhhRSsZsNGY2gq7Bu38AWZyoOievnQSW3n9v6xFInkCo
X-Google-Smtp-Source: APXvYqzv76xSPBhmTu3XtpU2brIqxgUAMZKDZiiupPPfPNb+1CemjvmVWAFoGM/oNgqGYdIJod+o0GT930s1OTWq6HM=
X-Received: by 2002:a05:6830:144e:: with SMTP id
 w14mr35280225otp.170.1553852624702; 
 Fri, 29 Mar 2019 02:43:44 -0700 (PDT)
MIME-Version: 1.0
References: <CADnJP=vQURY9u7Fb=Bt=udf89A6VX_TccBXfk8q2kdkqMnqj4A@mail.gmail.com>
 <CADnJP=shWk7qcK1V9v0JiDGqmOD4-B3zyXzbj7ZbTf2H3BLnRg@mail.gmail.com>
 <CADnJP=svNQ_LRq1OWbCMNNeTHs_-fAe1kmU1+G4GZ2BV0Jvo2w@mail.gmail.com>
 <CAFLxGvye+F5hB+1DUUhDzjaHB5ajC_M+W3fyt5x840sO68RgUQ@mail.gmail.com>
In-Reply-To: <CAFLxGvye+F5hB+1DUUhDzjaHB5ajC_M+W3fyt5x840sO68RgUQ@mail.gmail.com>
From: Lars Persson <lists@bofh.nu>
Date: Fri, 29 Mar 2019 10:43:33 +0100
Message-ID: <CADnJP=so8PSqJ4NgqSyqSk5UEtO2wzSC_LG0Seo0+Yuf45oefA@mail.gmail.com>
Subject: Re: UBIFS file-system corruption (missing inode) after power-cut on
 4.14.96
To: Richard Weinberger <richard.weinberger@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190329_024345_808485_93B5A8A8 
X-CRM114-Status: UNSURE (   7.63  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Mar 28, 2019 at 6:31 PM Richard Weinberger
<richard.weinberger@gmail.com> wrote:
>
> Can you please share me your corrupted fs?
> I'm not so sure what is really the root cause.
> The thing is, ubifs_delete_orphan() does not need to tigger a commit.
> Ff something depends on a commit, we have another problem, I fear.
>

Thanks. The download link for the file-system was shared to your gmail address.

BR,
 Lars

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
