Return-Path: <SRS0=H28k=XK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE833C2BA1D
	for <linux-mtd@archiver.kernel.org>; Sun, 15 Sep 2019 21:48:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AD3E2077C
	for <linux-mtd@archiver.kernel.org>; Sun, 15 Sep 2019 21:48:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Rvsj54dT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E4MfMBoQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8AD3E2077C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U0pSnbUa9bnZJpb/hJj5tTGwzfEaDQjcecKtFGcp+I4=; b=Rvsj54dT7dRwKK
	6qwOHDsXj+A+MvDpPbaTmsUtjPBg5vhU5rTod9FBrujN0XUhHR1NoFhp5FiHnjT+ukDVnUjilAWOK
	eHRWpC5uQKtMbXTluNOMr/JMv8FjaPtR7ldbDaojH8Ca+riAFMwdu6TzbMPqibezM4D2YzWguXkY3
	uN996g58BfYN+lZN7y2v0iTpdcVMl/XEgTUIQWWClKTUmySiwkZZtMLyjR0MWhRFpcHRAH3itIifJ
	88j7uwk2PSwDgTL3ZXhBOo9O/Q6IohfWf6OVAJsmLm7Kk4IWtYmT+a70LlhIavwe+IoIHcBy+G9tf
	7EhrBtaURtgiavFCgshA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1i9cNv-0005N0-IK; Sun, 15 Sep 2019 21:48:43 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i9cNt-0005MT-HP
 for linux-mtd@lists.infradead.org; Sun, 15 Sep 2019 21:48:42 +0000
Received: by mail-wm1-x341.google.com with SMTP id g207so7903219wmg.5
 for <linux-mtd@lists.infradead.org>; Sun, 15 Sep 2019 14:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7YPlMyof8WqPF8ZmJB0HBvRCNYO8+zALYU1pj43TpWQ=;
 b=E4MfMBoQFMHUMWPodSzHAUEKrMxeWkyH6wsw3ge1Ne6IlZylQjEcJMPv/jdqViAmJT
 Ib/fWnOYpDRTPfRJR03CQRV5srH9f0JImRYrk22zBAWaN8zLy+1yM4x+LS4Rku46B1ym
 XtObLe+nN8b7BLdOZ55Snx5HCPKHueh6G8C4T+sRJKOeQdrTMheTsV6pxKRTS1TZ2hc6
 sPI+fT0NqH0ptVOGagIP8dJNBiJZ374l/oGC1o9kakubXmhELyKKyH6jXl+Z0OAM2jak
 JxSL4YgA2wcqQ/fxviMKgvd5tXGacqhCvrpyD0l4uWrOsVYXmJbwsMvo3ywG9QVxy7/g
 oMCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7YPlMyof8WqPF8ZmJB0HBvRCNYO8+zALYU1pj43TpWQ=;
 b=lrcUtl+EMC9ilmEivse3TEV5/L3J63c0DRERdnITF+yCGq5OOZEEk4chQRnnS+t+r1
 wKnDCuuowr69bPz4VG35guOgqa3ukv2atfnbqOWOQdOfM2k4QH/LedcKj2LCxKDFRm90
 ciCTxHVt7aypR5tw30t4bGXRwi4CwaDkl3VCnNGb5KF2tyVcrDkwdQhkLWvKW/TjD56J
 6LMIfDmIkoePnMMRIf2ipno0fJoFdcMStAP5tTGtMhOdsUcKKVn71znU5d4bLkUyefWw
 03GrpAGY+WofAVjYAVFd+6jbZYhbMxD3XS3KXJiruuXmYU4x6PLebGMru8QQRJ703Oi5
 n/CA==
X-Gm-Message-State: APjAAAW8mUMmqLAZF77kR+4qPbd9jWVihJvcUtqC6hPMdzcRavqmBRdi
 5DnpWb+MUsQd3WC+Htr3/jcNfCpq5QsrEc8GmeM=
X-Google-Smtp-Source: APXvYqzqHlZDoxlC/Ud5Qmw4DL3M/ozdtFQnQSuZrpxddCnLxZ33Zss/Dl8dkxsihGu8kUuC+5+0IOiTdXEYtpWEV5M=
X-Received: by 2002:a1c:1d4:: with SMTP id 203mr11413186wmb.104.1568584119274; 
 Sun, 15 Sep 2019 14:48:39 -0700 (PDT)
MIME-Version: 1.0
References: <1566221892-16744-1-git-send-email-yihuaijie@huawei.com>
In-Reply-To: <1566221892-16744-1-git-send-email-yihuaijie@huawei.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sun, 15 Sep 2019 23:48:27 +0200
Message-ID: <CAFLxGvx_adbxyfA5iUZaHHw4aM1gbdOTMQdirx0FH1LamihdKg@mail.gmail.com>
Subject: Re: [PATCH] mtd: fix oops when writing to phram device on arm64
To: Huaijie Yi <yihuaijie@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190915_144841_581803_C5A2EEBA 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
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
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Joern Engel <joern@lazybastard.org>, linux-mtd@lists.infradead.org,
 Marek Vasut <marek.vasut@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Aug 19, 2019 at 3:39 PM Huaijie Yi <yihuaijie@huawei.com> wrote:
>
> From: yihuaijie <yihuaijie@huawei.com>
>
> memcpy() to memory remaped by ioremap() at an address not aligned
> to 8-bytes will cause oops on arm64 platform, fixing this by using
> ioremap_wc().

This might be the right thing on arm64, but I fear not for all other
archs and configurations.

We had a similar chain of problems already with our sram driver.
See:
eb43e023130b ("misc: sram: add optional ioremap without write combining")
0ab163ad1ea0 ("misc: sram: switch to ioremap_wc from ioremap")

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
