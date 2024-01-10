Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E4EFC4707B
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Jan 2024 19:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6NYvYY/HxOU9N70D5W6Isvs9d6Hexts/hmfH9GQjuoI=; b=bE5hJaNEBer5Wy
	7TVzd90jmiDoVjlZdaTxhkSFfKak1GTlKRIezN3yt2lwBWL6I16yaOisfZWw8Y7R0ZSc9ihcBJwsV
	zRqpZssyhcYzChjblYLvFWPTLZc7OJdPT5ZWsIPJPEfbPyoY3o9twQ9djGFacgNszC5TK40O/BqfC
	9S+p7oKwSsvmTtr0kBynfZm6N4+nMysGE0x2YHP6y5SQLBHvdZDa08TWRIHkxzhLm+BRGCj+i+s7B
	baJV//SL9xw4ITLQRvGWd0qducWj/xcFTMVu/umXvVT3GxWqrifW1TIlpzZWX2BaCBjTU7QrJ83q1
	adVJjLVh2GlN5m8HJzFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNeW0-00Dlmv-0L;
	Wed, 10 Jan 2024 19:45:28 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNeVw-00Dli6-2l
	for linux-mtd@lists.infradead.org;
	Wed, 10 Jan 2024 19:45:26 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-dbe69afb431so3774410276.1
        for <linux-mtd@lists.infradead.org>; Wed, 10 Jan 2024 11:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704915919; x=1705520719; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8zRr9k3M5lt1NLGiBm4LGGbEU76LPHiRlYHf6Ykn1Ys=;
        b=EZQnvBipZu/SkwxKncbSy/TPv9fRMn5TT1/+b5UT0CkxKO08EKL3sF/1jIJpwoKX30
         KHj/y8RSLLSGARiiRZMZxNdnv1rmf1crIfw+lRLUcdk8U7V9olahOjEFje7P9hf3Q+U5
         78mYIqDfBaEnuXecf5vRYtcyeboHJ0x7eVpv/BDicFmR2gbCeoKAbroQd1PLUvJVUET9
         xPvs6q3HtWX0S3wGDmiyWVBmMdJTfdNkjkUc28bv4ehTdSJ9vm6mxCGlKoPXklsbvnnB
         IgknWEgFReNMvP/35ymq4+RvcpbgGzcDEkbjLHE7QffGZTfheEvQgFxlXUPrvXQ80yYY
         G2ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704915919; x=1705520719;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8zRr9k3M5lt1NLGiBm4LGGbEU76LPHiRlYHf6Ykn1Ys=;
        b=KrH9G7j20t9IOYy23VO6OtRrIMYO53eWVj4+AC7DHA4nanOOjhPAIjpcH0WGSEC71b
         20jGz701WOfmIPOyJQrDstvck9bsBTaL2NJCmvSr2GHE6ERPFTJSxwXGxE2EUcYQegqW
         6nqfZeV7T7BySPdJKTtOGcAUg0CdwrjHN4dDc+610erUuoVTgBNcN6rSUE7UXghqBEH6
         42xC5soqiNy1PwB8+fVnbKiPulLVEbBZUlvmtcmH+kivHk8VsNmJT0Vqs+hPy9LYaGim
         m3bAl5G5zlylQM/I4vYfk5hcAsm2ufoItKnNp28xfY+3NR88mZIXK6BMdnS/KknTOukt
         PP0g==
X-Gm-Message-State: AOJu0Yyyb3r42mA174yZ4kCFhBQ0CaJZ6jtxCzpvHTwzgqwv+WB+ZSqn
	FcTV20fXBogYZjjwSqEI4hc=
X-Google-Smtp-Source: AGHT+IHIC4STcmIVvHNojmmb+kWLZtF32D5cncsDs8Rdjedin7IsN3qjxeZAoMn26pYsOd81Vi25VQ==
X-Received: by 2002:a25:9f85:0:b0:dbd:5be1:1768 with SMTP id u5-20020a259f85000000b00dbd5be11768mr133994ybq.73.1704915919301;
        Wed, 10 Jan 2024 11:45:19 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i29-20020a25b21d000000b00dbccc57e9c8sm1615656ybj.56.2024.01.10.11.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 11:45:18 -0800 (PST)
Date: Wed, 10 Jan 2024 11:45:16 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	"David S. Miller" <davem@davemloft.net>,
	David Woodhouse <dwmw2@infradead.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Matt Turner <mattst88@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Peter Zijlstra <peterz@infradead.org>,
	Rich Felker <dalias@libc.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Richard Weinberger <richard@nod.at>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	linux-arch@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-sh@vger.kernel.org, linux-usb@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org,
	Kees Cook <keescook@chromium.org>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH v3 6/6] Makefile.extrawarn: turn on missing-prototypes
 globally
Message-ID: <ab94f844-a4ec-4b4f-b67b-2b67347596d9@roeck-us.net>
References: <20231123110506.707903-1-arnd@kernel.org>
 <20231123110506.707903-7-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231123110506.707903-7-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_114524_895931_25BEB068 
X-CRM114-Status: GOOD (  22.75  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Nov 23, 2023 at 12:05:06PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Over the years we went from > 1000 of warnings to under 100 earlier
> this year, and I sent patches to address all the ones that I saw with
> compile testing randcom configs on arm64, arm and x86 kernels. This is a
> really useful warning, as it catches real bugs when there are mismatched
> prototypes. In particular with kernel control flow integrity enabled,
> those are no longer allowed.
> 
> I have done extensive testing to ensure that there are no new build
> errors or warnings on any configuration of x86, arm and arm64 builds.
> I also made sure that at least the both the normal defconfig and an
> allmodconfig build is clean for arc, csky, loongarch, m68k, microblaze,
> openrisc, parisc, powerpc, riscv, s390, and xtensa, with the respective
> maintainers doing most of the patches.
> 
> At this point, there are five architectures with a number of known
> regressions: alpha, nios2, mips, sh and sparc. In the previous version
> of this patch, I had turned off the missing prototype warnings for the 15
> architectures that still had issues, but since there are only five left,
> I think we can leave the rest to the maintainers (Cc'd here) as well.
> 

Not sure I understand why this was so important that it warrants the
resulting buildtest failures.

FWIW, I'll disable WERROR in my build tests for the affected architectures.
That is kind of counter-productive, but the only real alternative would be
to stop build (and sometimes, such as for ppc, runtime) tests entirely,
which would be even worse.

Guenter

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
