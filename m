Return-Path: <SRS0=PI1R=FA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A620C56202
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 06:22:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53F2520B80
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 06:22:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A1fHI3HJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="ezaCvQHN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53F2520B80
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4ju8Fsbt1Fg+T+Kzg1yXFx8O2oUz4XHxJG0aLBP6OT0=; b=A1fHI3HJ16dwUAjaHYFL7Ns1w
	4lDp0aO8fs8gGRtE+AvtQdVg49yHkpkQAc4aFmaJLi6s/RBl7TKYAWczMqJtW/x2LNWtjVsszSUZ1
	Jxh7sC9O7ceXSerE9hZo8NEojz3Hxhl75gfB2zHSA6omVTC8ZBYhoySD0+i41xrMQDbB3YCcRptu9
	Jtt50SBx/9f4pXVoAMY6WMsfGzz0v/0L20gbuXwsKbNpd+KiT5HFEbMUmAe6+7qXNnDio+3P51q8/
	uWSsqDvHtG1+Tg12XTg9h2TNZc6PegZRe8nlTp4W4qNy5zYmJuh5syAw0p+bA57Lr9sq1gZSqJs8W
	jf39FTbcw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiAeF-00080R-7j; Thu, 26 Nov 2020 06:20:55 +0000
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiAeB-0007zi-Jy
 for linux-mtd@lists.infradead.org; Thu, 26 Nov 2020 06:20:52 +0000
Received: by mail-oi1-x242.google.com with SMTP id w15so1108992oie.13
 for <linux-mtd@lists.infradead.org>; Wed, 25 Nov 2020 22:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q2R4BbQCpkO9YBouwmBRKUyTxHnROMBCPNNTzvr+bTs=;
 b=ezaCvQHNP4rXVlX6xgXScBgYsPbPPYeNewlmWmduFOZEwCAQiePxmYmVXxRNWIAKBj
 npE5+8DtXXxl5lIDZZS0EJDFMin+cuNhqnF9GVWXdwt95ToczUH17XgI/N/f5RDdgVTk
 K20LAvN4Q8KwIAWKWxz7lhuudgoUDjDQNgOQ9wCJS5pv4UlJ8k6N+hip7il4Tw3qlp8b
 FAv350pYhHk1L7GaNKcFbR2Ti54nHn0eqb/zzb9ABRY2bdSGl5MHh8QN5HMKW/YmAQsN
 F/W7hV8uygULP8RYNfy2hBUXjRLteBmuEIR1j5uixtkiJBAM3lzJbujbvujPp0OydxG5
 21dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q2R4BbQCpkO9YBouwmBRKUyTxHnROMBCPNNTzvr+bTs=;
 b=lMVJjfyA2sLg9Ehzx/pQrX3Ccrs/cWYRgBhS9O218USxTLe/ANCoqKcsPKTWC6PCSk
 jP6DpzaTi8/PQcNJxvlMxxlTW5mpB5Wycir2yC1lJtro9CySNI4/UKljXWEJMWtlZp6V
 2jTrrIbUwJX0CF7A9znmqrlG6Gf4MUU59yPS3QQEcAoCyAdSmE8mzJpDcoRKmhO0ioLM
 cmy2nU/+LLcXhtnhzkJEQ+v5DsLJPcNLZk1KH5T00icJ+nj0duTo73dGStKUM4N5WY4j
 +/3AIrp0Gg8iIioAq6vGyiItxi+31hFHfqFdewOI6DfwVEedT0x7Eumh9u11oChZTBPj
 ILCA==
X-Gm-Message-State: AOAM531VknTGmc/8fr2oyONEf171GlizAHr72A6fWOGKQ7fzPP18NbPw
 VoalVe50sa731TJ5ylRkG+9dgaxKEHntSnonLJGMdg==
X-Google-Smtp-Source: ABdhPJyKkUGNp5ptVTQH/y3fdaO8WHD96bnV/Avp1SQ7JFU5f6ksIk+NGtCwlONjNfoJPAp1skv4dkqV7brJ0Qje4qs=
X-Received: by 2002:a05:6808:8c8:: with SMTP id
 k8mr1163796oij.84.1606371648249; 
 Wed, 25 Nov 2020 22:20:48 -0800 (PST)
MIME-Version: 1.0
References: <20201119060904.463807-1-drosen@google.com>
 <20201119060904.463807-3-drosen@google.com>
 <20201122051218.GA2717478@xiangao.remote.csb>
 <X7w9AO0x8vG85JQU@sol.localdomain> <877dqbpdye.fsf@collabora.com>
In-Reply-To: <877dqbpdye.fsf@collabora.com>
From: Daniel Rosenberg <drosen@google.com>
Date: Wed, 25 Nov 2020 22:20:37 -0800
Message-ID: <CA+PiJmQ8-Qxu7yNWBvRLAeGa31PT5=hsYCcoW9QKsKnJQXqnMQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] fscrypt: Have filesystems handle their d_ops
To: Gabriel Krisman Bertazi <krisman@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_012051_845397_7E2DD00C 
X-CRM114-Status: GOOD (  15.91  )
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
Cc: "Theodore Y . Ts'o" <tytso@mit.edu>, Richard Weinberger <richard@nod.at>,
 Chao Yu <chao@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-fscrypt@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-mtd@lists.infradead.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-fsdevel@vger.kernel.org,
 Gao Xiang <hsiangkao@redhat.com>, linux-ext4@vger.kernel.org,
 kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

>
> This change has the side-effect of removing the capability of the root
> directory from being case-insensitive.  It is not a backward
> incompatible change because there is no way to make the root directory
> CI at the moment (it is never empty). But this restriction seems
> artificial. Is there a real reason to prevent the root inode from being
> case-insensitive?

> I don't have a use case where I need a root directory to be CI.  In
> fact, when I first implemented CI, I did want to block the root directory
> from being made CI, just to prevent people from doing "chattr +F /" and
> complaining afterwards when /usr/lib breaks.
>
> My concern with the curent patch was whether this side-effect was
> considered, but I'm happy with either semantics.
>
> --
> Gabriel Krisman Bertazi

That's just from the lost+found directory right? If you remove it you
can still change it, and then add the lost+found directory back. Isn't
that how it works currently? I definitely didn't intend to change any
behavior around non-encrypted casefolding there.

I should look at what fsck does if you do that and have a LoSt+fOuNd folder...


-Daniel Rosenberg

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
