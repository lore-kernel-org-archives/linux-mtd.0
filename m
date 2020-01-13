Return-Path: <SRS0=hwCG=3C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A496AC33CA9
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 20:52:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70D2C2187F
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 20:52:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NW+ErtZb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="P+UkFriY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70D2C2187F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bk0q5nsFtls+Uwq/wgT35cDikQmvTDNRv+XS0g1etwI=; b=NW+ErtZbPzB2PL
	vB66dwEOkewu+Ef3BE4tCUUGQwNBjo36AF3NgucUQv7WAcv9o6xJ6m7p5G43hMM88MtMRiaBGWuyg
	wspg2Q8031RolrFfnKGdpeB82//r6rN8YN1udOTQwLiU9alzGTPNt1wYrKhGMinft+xvX4ampz/e4
	QINE6kZfEMk5ElCBYFBUWx7y8AVS+lB0S1vLdrvYufj40MYo/mhC4/Ha17BAgtQKOcniDDhM04V2w
	akj/ONbg8LVyVqX74BLfb3eXmt89lpgdwV9zqD7GXgIrOMknjI5iw7zHYdokUv1i7ILQe+rrrzTZM
	OjqQZTQ0/1l1yNBhOjLA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ir6hQ-0001ET-BH; Mon, 13 Jan 2020 20:52:36 +0000
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ir6hN-0001E3-EG
 for linux-mtd@lists.infradead.org; Mon, 13 Jan 2020 20:52:34 +0000
Received: by mail-qt1-x841.google.com with SMTP id k40so10373351qtk.8
 for <linux-mtd@lists.infradead.org>; Mon, 13 Jan 2020 12:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=lsWiL3UnmG1D5Zt8iTnfdynsV+4fybuDrOYr1/WPZ2U=;
 b=P+UkFriYZumuinWVUg3IK8rta0OfS1X3Hw57A/u5ZIV+AWApAv2nBYU9uWRJ/LjaJ6
 0PBxZBHdWIBCCESdPsmx3CJu5+WXZvntMP+ioTo453ZJtGZgYSPuT5DH3R/5P3TY7d1Q
 nPYGILYJnQpgvu1Mx3zY0UMYlSkl46H51PZVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lsWiL3UnmG1D5Zt8iTnfdynsV+4fybuDrOYr1/WPZ2U=;
 b=EZyxv5CuTZMjNXL09fNvW8wYyTRu6t36kEQN18duZDg6R9qz/UvFovNTrWPM4C0xCX
 wQjz5omvsb/ljE+PWHiXcB0w00EI7aRNpUnO88nSzPUyREM2yZs5JABkicnEKJfAjCzS
 9CYjli2HhWZktvkttyVH/9upnv8VPt6xae3d6f9L2LY/8GU2EsfrmCcIymWDBu4iqxTG
 8Ot06e1cQ9KTpbhPwkgYfDBwM5ifLfapP2un+9pL6ZOvZuM79mw0eegpqW2fzptv4gdW
 54muJc5f1ROtJgxEKim7iroc/PlXnyee3o7bcHwBDsJ1TFhn+i0psOTOsrgCteZn8C3G
 uUXg==
X-Gm-Message-State: APjAAAXwJ0mlabnVB1O4p4NEXPM9PIlBDUg2m+ISBuvEmJUhteqtIMEr
 glgiaTOYibkjnCXlFWErQSKm1Q==
X-Google-Smtp-Source: APXvYqwPFOS5t92sYuJVXrtCnYFX7G+y/A7AY5AqTqa2h5nzVyoVk4ENjGQm3E7H3mIV5p8MvmVQqg==
X-Received: by 2002:aed:2906:: with SMTP id s6mr491409qtd.12.1578948751464;
 Mon, 13 Jan 2020 12:52:31 -0800 (PST)
Received: from chatter.i7.local (107-179-243-71.cpe.teksavvy.com.
 [107.179.243.71])
 by smtp.gmail.com with ESMTPSA id r80sm5591176qke.134.2020.01.13.12.52.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2020 12:52:30 -0800 (PST)
Date: Mon, 13 Jan 2020 15:52:29 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [GIT PULL] mtd: Fixes for v5.5-rc6
Message-ID: <20200113205229.v5xjcsljmivcaei4@chatter.i7.local>
References: <20200110154218.0b28309f@xps13>
 <CAHk-=wg=8=nTeOYGoAbJ=VjS47Nh4-_OFK9zKsK3mK4nAi2dNA@mail.gmail.com>
 <CAHk-=whdsFSX0gTOiNkTANONgHHVY+8jUd1DmY2SJpdNOq5xJw@mail.gmail.com>
 <20200111145004.htnpdf6oaiksryxz@chatter.i7.local>
 <CAMuHMdUtk9m+BNrH1BuqGxWXR5h1DZmUasHMVKNYFxsd5wa5YA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdUtk9m+BNrH1BuqGxWXR5h1DZmUasHMVKNYFxsd5wa5YA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200113_125233_500475_CCEE4BFE 
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Jan 13, 2020 at 09:02:44AM +0100, Geert Uytterhoeven wrote:
> > Things should be unstuck now, and at least this particular bug is 
> > fixed
> > -- hopefully it'll be smooth and automatic the next time the epoch rolls
> > over to 9.git.
> 
> Are you prepared for multi-digit epochs? ;-)
> They not only contain more than one digit, but compare incorrectly
> when using lexical sorting...

I had to check, but yes -- we start from 0 and count up until we get a 
"no such dir":
https://git.kernel.org/pub/scm/linux/kernel/git/mricon/korg-helpers.git/tree/pr-tracker-bot.py#n376

Best,
-K

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
