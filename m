Return-Path: <SRS0=BOQa=Z4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA3E5C43603
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Dec 2019 02:43:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABD572077B
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Dec 2019 02:43:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CPVO/x1H";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gCLNHz0q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABD572077B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OS1JI/lSlfZ/m2sMY5EYNGhiv7pebG32sDXqRyFYqkk=; b=CPVO/x1Hs0TumI
	zEvMwdyX1DI9PH+9+LLcB+gTnromQ+xtNY4xUuNs54qh6sPkKtR/Ky6UKmJg/UZ8QU6wCg1ML2SDy
	Hba6AF2KnvSrqLgpxHwAI0CAbnrrON5kgGef+cchusxLo7v97igyzF1VLjPHp+CrzHZPzLuhTpNhS
	6LuJKA5bmpt7zXfuYgdUkrlj+7bdCra/eF64PIexLS9NoFFYC+MPR0YqKtLApZg9zs22XNNLk9hCD
	TobvvWmfSsd2WoUr8hCMy3razNV93Y/eIgJL1J/FQwJ6E9N3aU0BzNVv1OkU6QGNttdrEBOgVgmnX
	G/1d58E4QAgC9nhN5Dgw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1id3ao-0004CU-Dd; Fri, 06 Dec 2019 02:43:42 +0000
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1id3al-0004Bc-AL
 for linux-mtd@lists.infradead.org; Fri, 06 Dec 2019 02:43:40 +0000
Received: by mail-il1-x142.google.com with SMTP id t17so4885779ilm.13
 for <linux-mtd@lists.infradead.org>; Thu, 05 Dec 2019 18:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TwnBRTdDP35mDXJCuQNvxNiSYSSqXwSGYAdihSOqw+M=;
 b=gCLNHz0qL4ivBuWruGSb8Xtxv2Z1379625iOP5mM4vBOY4sCCvuXZ+vvF2UJDRi+yn
 QxHqtTvfoxkT5y8pzoTHiaWJiRIYMXDvjiGbgLBglM11TaQUOZZqHr0wmr2iUNkiNwk4
 tJJ0BexyBfvQ3IWJl7duudecacL2B0mi2xk1VyYCJkv2SplICq+a5qha8bXgkE8ysj6u
 xWP4t6uuzlfTJRrHemZx3MJpRhfgbal9n9D8BQylY9kElVBfPwxTLsbZYmpNvcAzGUsT
 W4+96ljzNYUyPztXTqM6/v/gBgXt9tBYfiSIZcg69cxet1DimIaX4LTs/h7kGaKmf/V1
 F/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TwnBRTdDP35mDXJCuQNvxNiSYSSqXwSGYAdihSOqw+M=;
 b=XLdXn++qQJp5UjHrnznt83n8Uoew/NVmJTaKku01LLMLsMJerhJJooMib6GF0+SW9K
 /DqLCPDn627DsMAOAAyh1wz+mUiAAH/hhB4stME+Ytipm0TwCJPpXdoGBBa9iVItCsMc
 nPfG2j+nXhMeeutUwdRPlQj3BDA31zPZeSZVb2QZeF9QSKMyARJQ9la8KmpUUmXuG+vs
 T/9KoRfK+XY77LyXLNogrZ4Evq4pW3I26L2eSuEnERLxoAbLGTXPbUAXHHZNoBHXFcM0
 ZMoOgtJnG6pVFYrjHGYudXHONUwdkpPwfswtz5ZZVbI6MrRK11eYX/Ru/ZGBEwur/2kO
 7o9w==
X-Gm-Message-State: APjAAAWojFAfw2HKoJhM9tFJhu08phg5VxLC2hta8RFxqesXo4ZTXJMJ
 ZSe5s0za9OG7H/59RXjsTUm9ky4IE9etsaTaqu8=
X-Google-Smtp-Source: APXvYqzRyd3cAihQ+Rt6RtZIFeU6QgRGdFGDxYndwn7fjlACobL26vsFf06MfqJiSaF7mTavf4q0Snt02U+m1Zo1HH4=
X-Received: by 2002:a92:7f0a:: with SMTP id a10mr12071154ild.110.1575600217860; 
 Thu, 05 Dec 2019 18:43:37 -0800 (PST)
MIME-Version: 1.0
References: <20191203051945.9440-1-deepa.kernel@gmail.com>
In-Reply-To: <20191203051945.9440-1-deepa.kernel@gmail.com>
From: Deepa Dinamani <deepa.kernel@gmail.com>
Date: Thu, 5 Dec 2019 18:43:26 -0800
Message-ID: <CABeXuvpkYQbsvGTuktEAR8ptr478peet3EH=RD0v+nK5o2Wmjg@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] Delete timespec64_trunc()
To: Alexander Viro <viro@zeniv.linux.org.uk>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191205_184339_382922_D6ED4DE4 
X-CRM114-Status: UNSURE (   8.07  )
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
Cc: CIFS <linux-cifs@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Richard Weinberger <richard@nod.at>, Jeff Layton <jlayton@kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Steve French <stfrench@microsoft.com>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 ceph-devel <ceph-devel@vger.kernel.org>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Dec 2, 2019 at 9:20 PM Deepa Dinamani <deepa.kernel@gmail.com> wrote:
> This series aims at deleting timespec64_trunc().
> There is a new api: timestamp_truncate() that is the
> replacement api. The api additionally does a limits
> check on the filesystem timestamps.

Al/Andrew, can one of you help merge these patches?

Thanks,
-Deepa

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
