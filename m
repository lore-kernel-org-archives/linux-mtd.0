Return-Path: <SRS0=MJr3=C4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 529B9C43464
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Sep 2020 20:03:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5FF121D42
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Sep 2020 20:03:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Rew/VNo8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fhLy2sCj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5FF121D42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kGmBgCZlSyIxGqaWTGSp3iG+BEDScQwonBnOGGVtQ1c=; b=Rew/VNo8PMzhDM/9VuSqwa7iJ
	oDD3cqe3YgmahS7XxLHx7gYNbAXERqhpi78YR3KWfxhExixF6uLdYY1S3+ictV4F3AhCgttK2wSvS
	uDXuUn6QIb+FSOEdNDuu22zb3L0R3FSkfOi/eJURxgy+HnwwsDQ1arMlO0HTQ+/9NMWQjIGLQD6ty
	kEvv0VGrPnQ7b/yMPWOc7faf9nDhSToW1aCQEZrSIKkT0gyg29xrhkgHdsS38djdm+ZieGW34C7gv
	byFA1/JY27k+GYyGnzdGAgZUsZ/OFWjm+KdPEFsNELY58C5PTRM8pZy1FXBjp1wgzCfQ2SpFLNDC+
	ArZWIL01g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJj3q-0005Pd-Ts; Sat, 19 Sep 2020 20:02:18 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJj3n-0005PC-80
 for linux-mtd@lists.infradead.org; Sat, 19 Sep 2020 20:02:16 +0000
Received: by mail-qt1-x82e.google.com with SMTP id e7so8576988qtj.11
 for <linux-mtd@lists.infradead.org>; Sat, 19 Sep 2020 13:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6CTcgrG12lC0uXUFT8BoQ2rTd30M+foRTM7p+tlUU8M=;
 b=fhLy2sCj0a+4C2PQJlVwzVFSfJfi71tpgZSBpGlEsmo+3jvtH7wtTjqdZw9uJjAFaO
 ddKI9u/i3zr/GCQ39sWDjuaHxI3a1nPY6gy7h2YY/fvJYllX+KfEPuyF8jhPz/hYjuN3
 96wIK1rf2uxScCdA2suJlrnMuvhCnSsFjjD0DJwby/jT/daNlpHA2gTGUY/dmhUd3BBM
 DD1vimv5fak5tp3PZiVM+2zZLFJ+pM43t+GDtPSOuMr/d0wBT61sPIW1FZbGwiX/vATi
 BZPqzZaHUp2hWmNzF+Hf30Qww1zL8irvnKe+4gNeC7pUYc+2u6IyzgKc6ySJg6KNbBM3
 lCfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6CTcgrG12lC0uXUFT8BoQ2rTd30M+foRTM7p+tlUU8M=;
 b=KnRTHkxtnGc4s2YjD1Ilan/rIJQTk9pjt4gxqM+9r6tcb02ggbmE45QJvuQ7xJyVX/
 Vxc44V/2Fg8hiOfqh4OLjuu5WLIa0yA5d6cuEJRfYw6OQKcKaYslA0Go4HgxhpZTYE/G
 m90EbS/3gRErtPofUmo5IqQKOiQyFrgOOapJ0PHLzzEC7afQqOZpNJz7aZX3oQ1FZ6VO
 3melHy0Wb9q8f4L1dGt2zcQadZbsfAj7KxyulYluLIA0qH9Tx+/27j7dKAb3JLAsxyzc
 FW2WXejYUNs7hujjpqTadpT/n+dSbFp8q5+EfDUeLqgE+wo1wOgbt8+jNoezCPP6Br0m
 FlKw==
X-Gm-Message-State: AOAM531IK9Zptf27Eux1s7/Vz0dnPBGE3D0fAv2yFm86qqLT3Wd7IcTf
 QOP4AaSfQYDSNuzDF1xfWZgGugIOn6f+Y50yJAg=
X-Google-Smtp-Source: ABdhPJyQRKh/UswMRBbdpsMgzlO1Nv31jZaB7Kr0v5ExS/gSIhp83l4rr+FLF5GVBVt4OS+MOXccjHgmgeGm32RjB4o=
X-Received: by 2002:ac8:76d0:: with SMTP id q16mr27125362qtr.164.1600545732292; 
 Sat, 19 Sep 2020 13:02:12 -0700 (PDT)
MIME-Version: 1.0
References: <CADBnMviQd-9TbkJFUCWE8THCYF9oq-iZfu6Cjxcy9GvTfe=KUg@mail.gmail.com>
 <CAFLxGvw9TMHz5Mf=RYytB3N6uMuK5md+WxF=atzvaXcuibmNsg@mail.gmail.com>
 <CADBnMvjuS4F8CLwbGRTAt3bVyA7DAwEFwMmNqRdNJyZCRpXCXw@mail.gmail.com>
In-Reply-To: <CADBnMvjuS4F8CLwbGRTAt3bVyA7DAwEFwMmNqRdNJyZCRpXCXw@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sat, 19 Sep 2020 22:02:01 +0200
Message-ID: <CAFLxGvxF_mK573Xhc0w2njjf4qRPSTiMf9B_GRBnJo1kj1MbkQ@mail.gmail.com>
Subject: Re: UBIFS-AUTH panic after reboot
To: Kristof Havasi <havasiefr@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200919_160215_383375_98FB5577 
X-CRM114-Status: GOOD (  11.11  )
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
Cc: Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Sep 17, 2020 at 4:48 PM Kristof Havasi <havasiefr@gmail.com> wrote:
> Without "chk_lprops" the panic is only visible after the restart, but if it was
> enabled the following assertion was triggering an immediate panic:
> (Should I "reformat" long log lines in the future or leave them verbatim?)
>
> UBIFS error (ubi0:4 pid 649): ubifs_assert_failed: UBIFS assert
> failed: (val >> nrbits) == 0 || nrbits == 32, in fs/ubifs/lpt.c:231
> UBIFS warning (ubi0:4 pid 649): ubifs_ro_mode.part.1: switched to

Hm, the number of bits we ask to pack is smaller than val.
Maybe we have some subtle bug where a node length is not correctly
calculated.

From your other mail:
> >         0: free 0 dirty 255408 flags 1 lnum 0

Dirty is larger than LEB size (253952). Must not happen.

> >         1: free 0 dirty 190192 flags 1 lnum 0
> >         2: free 0 dirty 255360 flags 1 lnum 0

Same.

> >         3: free 0 dirty 248896 flags 1 lnum 0

Does the problem also trigger with encryption disabled? So just with
authentication?

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
