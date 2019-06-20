Return-Path: <SRS0=7m8F=UT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72B60C43613
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jun 2019 20:16:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48A1A2083B
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jun 2019 20:16:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j2AVuO8c";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FSYg5gUd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48A1A2083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X3g4seawj3IhXZpwKx0OpRM/xlBVwNSH5WxokF5P12Q=; b=j2AVuO8c2pw0Wn
	bVKNC2Ii23aUjBN8e5ppmyHNUcE6Wa8xhV3KWOgKdppSepf6nnCW9p47Iqz4FxMctmxE4bnGkfrHa
	eHKc/o48AYMJoheS7RdJrefjR5MC+OhnvFjtBvIzf6CpLhptKgZI7x/8m/qywNlwgJT2XTrFcqmFL
	hkSnQDXBuwK4K/4B+TA34AXS+/c6yUmQp1/i8HLfnWJFXJCbeztY8QOaZUyW7vaGgbN7AS4E3keMS
	ziMYARwIcOFYYCVmdv/XsqkPNXTJcUZUwYyd33eIMGYNndI7QRHYGdPjdiM8pR/FtDLYbTw/cdJ7q
	EZJ8b9KuBGNPsy0toDZA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1he3TS-0006nu-Kp; Thu, 20 Jun 2019 20:15:58 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1he3TP-0006nF-4B
 for linux-mtd@lists.infradead.org; Thu, 20 Jun 2019 20:15:56 +0000
Received: by mail-ed1-x541.google.com with SMTP id a14so6409249edv.12
 for <linux-mtd@lists.infradead.org>; Thu, 20 Jun 2019 13:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=JUOkJu07O+IW6MoPhdQt/JKgqUkCkkDq6yx/iX7wBQA=;
 b=FSYg5gUde8DWZ1DWTpWdFjbN4iYG7u1oXTRfGBNADJVVK7LrxSIXQd+pd5SxyynS9N
 Cenl7pvCXijdvmXYC7Rh/KJr0TP8bAxtOfZR3hnKagpp39rV52jD4jElwlZyi2pn7eiK
 AfWbP0Hef/Gk7lEF4TOTa0I2VLZ1ffLa8e16w+BQ5rz1fT6+wgzahe8YI31zNSVleeEk
 9DEuuU5zXmDRtI5HHAr8T7C9y10XwbFu2RIq+6A2cVPZfy41lLpyFxV1oLHzoel+Cldi
 GAGJFBxZouCUeXlj/ROBRDcLqoAcjk0efSkezKM3ogNeuTyiydKQYaVfC01+X8u+0unI
 xFAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JUOkJu07O+IW6MoPhdQt/JKgqUkCkkDq6yx/iX7wBQA=;
 b=sr7tV+f5sLPg/UfdZxG2oFTjjkyC15VJfTiDZJJN/cL/6Z9uzvpJXUJmTqkVmODKp0
 6R/8bXRIJnbdaA3lpp6yNUxB4V2k0z5JWAuSXK93vbaOm4aCPGkacB460/w6ikQk7qVm
 WOkn360tO2MRHH3vp9jXJmWu2E3xEqkR+S0bVR9sAeG9eAj3v0bIzOaeEhPd6Cwd8/qa
 ABZd3v/vP3a36gnrn2B7mWTCjAWclqqKg+Xe8rCHKbyL2wd5xZKQPbtmljRRob0KhTDi
 u9f22hD/rRksvrxsBUgG08B01xosY1C4FaeqdmtIsjiZp3oSkCTLsJfWG6t3nDll03nt
 MVhg==
X-Gm-Message-State: APjAAAUrGLsDq782NMTG76tMJgjzzGrLxIE4dOLd1zWWZb6qY89vG/3T
 souiayhcovHR5pMEv8QWGw4=
X-Google-Smtp-Source: APXvYqz2GpvLDQC36pwSn4cJtgNpRxNa/to4az7JZm/Hz5FpyteYwsXMluOlEW70lP/Jc5u2/h2bLw==
X-Received: by 2002:a17:906:4f8f:: with SMTP id
 o15mr13238011eju.129.1561061752157; 
 Thu, 20 Jun 2019 13:15:52 -0700 (PDT)
Received: from archlinux-epyc ([2a01:4f9:2b:2b15::2])
 by smtp.gmail.com with ESMTPSA id m32sm148321edc.89.2019.06.20.13.15.50
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 20 Jun 2019 13:15:51 -0700 (PDT)
Date: Thu, 20 Jun 2019 13:15:49 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH] mtd: mtd-abi: Don't use C++ comments
Message-ID: <20190620201549.GA65397@archlinux-epyc>
References: <20190620155505.27036-1-natechancellor@gmail.com>
 <CAKwvOdk7ZTcWEXPTBASPzk1SjOdnONawtQJkR-jU=REFSo1hVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKwvOdk7ZTcWEXPTBASPzk1SjOdnONawtQJkR-jU=REFSo1hVQ@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190620_131555_216570_01B58771 
X-CRM114-Status: GOOD (  14.29  )
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
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Richard Weinberger <richard@nod.at>, LKML <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Jun 20, 2019 at 12:56:58PM -0700, Nick Desaulniers wrote:
> On Thu, Jun 20, 2019 at 8:55 AM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> >
> > When compiled standalone after commit b91976b7c0e3 ("kbuild:
> > compile-test UAPI headers to ensure they are self-contained"),
> > a warning about the C++ comments appears:
> >
> >   In file included from usr/include/mtd/mtd-user.hdrtest.c:1:
> >   In file included from ./usr/include/mtd/mtd-user.h:25:
> >   ./usr/include/mtd/mtd-abi.h:116:28: warning: // comments are not
> >   allowed in this language [-Wcomment]
> >   #define MTD_NANDECC_OFF         0       // Switch off ECC (Not recommended)
> >                                           ^
> >   1 warning generated.
> >
> > Replace them with standard C comments so this warning no longer occurs.
> 
> Should there be a fixes by tag?
> -- 
> Thanks,
> ~Nick Desaulniers

Normally, I would have added one but this issue has been present since
the beginning of git history. According to Thomas Gleixner's pre-git
history tree, it would be:

Fixes: 7df80b4c8964 ("MTD core include and device code cleanup")

but since that hash doesn't exist in the normal git history, I don't
think it is worth adding. Of course, if the maintainers want to add it,
I won't object.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git

Cheers,
NAthan

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
