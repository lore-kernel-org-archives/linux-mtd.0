Return-Path: <SRS0=oK52=XY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00B9BC4360C
	for <linux-mtd@archiver.kernel.org>; Sun, 29 Sep 2019 13:39:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C363220863
	for <linux-mtd@archiver.kernel.org>; Sun, 29 Sep 2019 13:39:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Lrzbf00f";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=telliq.com header.i=@telliq.com header.b="LaK+e4DO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C363220863
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=telliq.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7Fna1NyqbsKVIpGZMuB29VkVxw6YzWc/uWuY2Qxj/M8=; b=Lrzbf00fZh9XjgEwxsIHxkqE7
	dp3RtjA82/gm6M6a/+VeRcdU34XfYDFUSuqDj712fm/d/He27uPms10pHNZ4mxq6KV1TGGDU7gxLD
	Co5HyyL+VE0e9ng5C6ybZkQLtiRqs+u71xB79Vq43nJ/BaTpJEVkSVH4hxAl0JXho7j/WphvKUhVC
	s0Yty/JER2sjTNb61Z3GhHAbhfXx6H4lfZ1JJk4EcFn7smA4gyvo3TlBCVpFDlok9ByyKsqRtXh2F
	U9W6efqZfmsJEUnapyNxDNGjW1az63ZAybeigEIB2Zwju7zo7x7fKXdDLGHoT3kgUZ4t7gGh1qND7
	xfZ5ryHCw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iEZQ9-0007ID-VQ; Sun, 29 Sep 2019 13:39:29 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iEZQ7-0007H3-7W
 for linux-mtd@lists.infradead.org; Sun, 29 Sep 2019 13:39:28 +0000
Received: by mail-lj1-x242.google.com with SMTP id b20so6754264ljj.5
 for <linux-mtd@lists.infradead.org>; Sun, 29 Sep 2019 06:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telliq.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=U8UJML/sffip+VH96gq9qAmHyF4YWT6eKzk3GrhnOGY=;
 b=LaK+e4DOgSabZAf86/NFjIH5uatNkl9+tpPjIUUUUCog4msx5CbEpND/wncp/87G1l
 rYSdWMgIH7ek77eNNURlTwUN/J2haz5UqpO31Zlu9Z9EqADFmu1gJp+BrJIuzJBw39Sk
 ELHew8xVrzzOVkk2Gm5PEO/I2P5nzMaiBaUC0UA1qfKtwWpVD2NjUc3P2+XtcyNTjw7I
 QWGWqX+gdxlOxCsyZ5872J1Ws7rXJ/q4/7a0Jlh0/KLbSvHgo68odDjhzONRdHdWNrGY
 X1q3GJn6XEjkuaFC7wwXXZmSUXz7OiMveGpcBuBYaA1Pr+l7zWQ5+Ouaz/j+xMCbfjqG
 96sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=U8UJML/sffip+VH96gq9qAmHyF4YWT6eKzk3GrhnOGY=;
 b=hq8rYlZfEERD+mZDIX14p5d8Twp9BkMTY4lgWxJYCQWDtVG7ZFxrggnHL5ns1pODRZ
 XZgYtlgIKKy9N0yGbdx7Fl92+78RMrqHdQRShxQ9GFB1yfVM5QdJe+DSdej3YU3VUniV
 VJD2OwKlKUkHZuWZ+2arh5CMqkHPWkneHJDgeFHfeSkPGM3ETtoxtKvLG75iDYCMZJip
 apAXZjwl5eRNsa76MO5tYYLkfeQBIOiliad2z9frZqMFC6QF6894cpn0SmPAEm+al6QA
 MiG+mLk5aTm4G2VJBzZptTzTZgbcmow0O323tOyI6CVmobKM4ODx/0425HzeAhTyTckl
 IOJw==
X-Gm-Message-State: APjAAAWTvMf9JIoZKu39DhHm++wwkk3uv3ujV7mdJIqR3c3x83OIm6iH
 PcsG5xb+lIGTWB6+p828q3tV7w==
X-Google-Smtp-Source: APXvYqz3o4blsL5Rv8f38x9viFm97fMv8wI31+uzOBjuqnOAg75Cvym88vvL3JP6lWzp7QEBPrBmxA==
X-Received: by 2002:a2e:96cd:: with SMTP id d13mr8854039ljj.89.1569764365953; 
 Sun, 29 Sep 2019 06:39:25 -0700 (PDT)
Received: from [192.168.53.116] (h77-53-209-86.cust.a3fiber.se. [77.53.209.86])
 by smtp.gmail.com with ESMTPSA id q19sm2664840lfj.9.2019.09.29.06.39.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 29 Sep 2019 06:39:25 -0700 (PDT)
Subject: Re: [PATCH 1/1] ubi: Allow ubiblock devices nodes to be created by
 volume name instead of volume ID.
To: Richard Weinberger <richard.weinberger@gmail.com>,
 Emil Lenngren <emil.lenngren@gmail.com>
References: <CAF_dkJA2DFr3Vgk5ie=V5YitZr8HaiXWuQ+SKsHzzmLBFnhyeg@mail.gmail.com>
 <23922253.ayd0uQntjt@blindfold>
 <CAO1O6se0aPh2FScDStqrK50PPipBbsgEnEPbMHvOdXt2cbxtvA@mail.gmail.com>
 <CAFLxGvxoR2kWoEz38QfO2sZDh4=4KXHBm9OrzXAQJWAR8Shmew@mail.gmail.com>
 <CAO1O6sdEw2xjmKQFEA6YXE5vLAtd90ew4t_zynRUvK_ZztDp0w@mail.gmail.com>
 <CAFLxGvxT3qDJT+7T4DQOq2j45OPV1AuvErEaYfpLP6SH7LX0OQ@mail.gmail.com>
From: Jan Kardell <jan.kardell@telliq.com>
Message-ID: <f07e281f-a8e1-b4f8-de4a-264501f565f5@telliq.com>
Date: Sun, 29 Sep 2019 15:39:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Firefox/52.0 SeaMonkey/2.49.4
MIME-Version: 1.0
In-Reply-To: <CAFLxGvxT3qDJT+7T4DQOq2j45OPV1AuvErEaYfpLP6SH7LX0OQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190929_063927_266224_C162B77F 
X-CRM114-Status: GOOD (  15.93  )
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
Cc: Richard Weinberger <richard@nod.at>,
 linux-mtd <linux-mtd@lists.infradead.org>, Patrick Doyle <wpdster@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Richard Weinberger skrev:
> On Wed, Aug 28, 2019 at 3:39 PM Emil Lenngren <emil.lenngren@gmail.com> wrote:
>> Will this really work when passing the rootfs to the kernel command
>> line like "root=/dev/ubiblock0_rootfs"? If the udev rules that set up
>> the symbolic link /dev/ubiblock0_rootfs are stored in a file on the
>> rootfs itself, I guess that symlink can't be made available before the
>> rootfs is mounted...
> No, this will not work directly from the kernel command line.
> For any kind non-trivial root you need an initramfs,
> that's the whole point of initramfs. :-)
>

I have this on my cmdline:

root=ubi0:rootfs rw ubi.mtd=rootfs,2048 rootfstype=ubifs

Maybe a bit confusing that both the MTD partition and the UBI volume are 
named rootfs:-) The board uses a very old 3.14 kernel from OpenWrt, I 
believe the MTD parts is vanilla. Doesn't this work on a more recent kernel?

//Jan

-- 

"I have always wished for my computer to be as easy to use as my telephone; my wish has come true because I can no longer figure out how to use my telephone."
- Bjarne Stroustrup


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
