Return-Path: <SRS0=1krx=SB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3A1AC43381
	for <linux-mtd@archiver.kernel.org>; Sat, 30 Mar 2019 18:32:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 858D32082C
	for <linux-mtd@archiver.kernel.org>; Sat, 30 Mar 2019 18:32:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TXYIrwv9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SbrbM0GL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 858D32082C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=anirhjX26JHgy9eGlClT1QJ9yrPoEd2SN1Eq5r0qoFA=; b=TXYIrwv9t27C4O
	w0o8vzHqVtOLhXBl6khAQfj09VgtZZIayetJIUekxua1tRSwhR8XB7M+rSe/9rjcOlWEbmd6q+BWV
	5p6dM+wh7nnrE7Qf6V4ki1enk15DQ0u9/tb7rISP+jTWAwR7boV0Bzf/aofnyOzfqEzWOg5qVEcn+
	JT9ZDYjBJZeAc8T9JvlntwFRfDOwlEEsmI6sbzxgr7N2E5OEfB6401HBHBX2xaan8P2O3Nf/Ej0kI
	/KXKEA1ueBuqudQGrLhOMG6IrGaU0Fj85zvoryod44o81uL9GD8AnF2IEzXlfel+lMgqN1xdcuA3o
	TaUVTcE+FMF77lSZMYoA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAImP-0005zA-1G; Sat, 30 Mar 2019 18:32:33 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAImL-0005yU-4u; Sat, 30 Mar 2019 18:32:30 +0000
Received: by mail-pg1-x542.google.com with SMTP id v12so2744291pgq.1;
 Sat, 30 Mar 2019 11:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=skRULYaGnsGuwSHl3Pkf/Hf5xkfTXbuPlqJJkGetkNc=;
 b=SbrbM0GLYp/F+ZBvfWoyKbOsXHYwHFbj5+D8dSX5WiPjaqvJbrWMdWGOtVC0nZ0cCM
 34XAm1WHSf8vUiMr1ZtZgEQO7SvwWCwfk1MeVUxq1TrXvKk7fe8FzsWKzhpPHp/+0Z2g
 uc28baaOEOjkJMcbAAXKG1LFXfoKNj92/UpRq43JCg5sgBjdM6KoR8I/g4wkrS3rms4v
 7I/A+HWrp3o2RebOzudNA1LsZSOq6joZmjfCHeSlqCAOgA9TUkdboSrT/re8SPqjToYP
 1vwA4ioGG4YElOCU79wV3RW7wUOs63Df36uho5xpVlksBayuz9wGNPIgOrZXID3U8ep+
 9+kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=skRULYaGnsGuwSHl3Pkf/Hf5xkfTXbuPlqJJkGetkNc=;
 b=Uq/C3xIuZLo3h6mr5OLxsqD443ApyyDec7GbawF/KPZCAV8a52p6fCJaPUUgQMrV4c
 maHE2qZCBqWuu0WDYDMUeVa0bNQK8V7GaJmvrzaf//eUhJzMiq/FOkBhqMbBC1wnlzzH
 mliTSUfAP88fo9GVu21RR08PSodR4mX6xtxezrdsbMoKwrc9cQDjSCmeLGGREjOqtU53
 8GjAnJ+9kZW2rRbI2Yyb9IWfwE3QJLCyGSCPkIZ6leTo4dRx9az0JVK16sVAMIwP6tCI
 xsI8or5oPTHY/mKPvMxbp75yiG8TNd7kbdYxSwZg6/isu18mfJq7CWF/do+oXSRX0KEE
 JK4w==
X-Gm-Message-State: APjAAAXrXS/PBpD4IvJkniSE/t3NsX9CJ5EwoH10vwoQ+ue6/9AcbpBT
 MiQq9UfED25eRypz1WVavLNmRzcbScvV/CXqzDc=
X-Google-Smtp-Source: APXvYqyTKQEWb+KljeDpmX6txVxxjSyvRqHNpFatGgpulkMBtEc+jB8NBCEvU4P4BABz9MuYIQuLQ33fU0m/OswGmNM=
X-Received: by 2002:a65:5acc:: with SMTP id d12mr52875695pgt.337.1553970748130; 
 Sat, 30 Mar 2019 11:32:28 -0700 (PDT)
MIME-Version: 1.0
References: <18626931553963861@sas1-b3ec53dbc12b.qloud-c.yandex.net>
In-Reply-To: <18626931553963861@sas1-b3ec53dbc12b.qloud-c.yandex.net>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 30 Mar 2019 20:32:16 +0200
Message-ID: <CAHp75Ve-VUkMA4NUfN3QxR=whfoatOuPMKddz2Gb1e9acF3vMw@mail.gmail.com>
Subject: Re: [PATCH 0/5] simple sort swap function usage improvements
To: Andrey Abramov <st5pub@yandex.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190330_113229_195976_380E2896 
X-CRM114-Status: GOOD (  13.11  )
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
Cc: Michal Hocko <mhocko@suse.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Chinner <dchinner@redhat.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, piaojun@huawei.com,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 "H. Peter Anvin" <hpa@zytor.com>, jiang.biao2@zte.com.cn,
 Jiri Slaby <jslaby@suse.cz>, Stephen Rothwell <sfr@canb.auug.org.au>,
 darrick.wong@oracle.com, Richard Weinberger <richard@nod.at>, mark@fasheh.com,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 YueHaibing <yuehaibing@huawei.com>, lchen@suse.com, rppt@linux.ibm.com,
 ge.changwei@h3c.com, Ingo Molnar <mingo@redhat.com>,
 naveen.n.rao@linux.vnet.ibm.com, linux-snps-arc@lists.infradead.org,
 kamalesh@linux.vnet.ibm.com, amir73il@gmail.com,
 Kees Cook <keescook@chromium.org>, Jann Horn <jannh@google.com>,
 ashish.samant@oracle.com, Nicholas Piggin <npiggin@gmail.com>,
 jiangyiwen@huawei.com, Borislav Petkov <bp@alien8.de>,
 Joel Becker <jlbec@evilplan.org>, Josh Poimboeuf <jpoimboe@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 George Spelvin <lkml@sdf.org>, Artem Bityutskiy <dedekind1@gmail.com>,
 Mathieu Malaterre <malat@debian.org>, Vineet Gupta <vgupta@synopsys.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Morton Andrew <akpm@linux-foundation.org>,
 "open list:LINUX FOR POWERPC PA SEMI PWRFICIENT"
 <linuxppc-dev@lists.ozlabs.org>, ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, Mar 30, 2019 at 6:39 PM Andrey Abramov <st5pub@yandex.ru> wrote:
>
> This is the logical continuation of sort improvements by George Spelvin
> "lib/sort & lib/list_sort: faster and smaller" series
> (added to the linux-next really recently).
>
> Patches from 1 to 4 replace simple swap functions with the built-in
> (which is now much faster) and grouped by subsystem (after that only
> 3 files implement custom swap - arch/x86/kernel/unwind_orc.c,
> kernel/jump_label.c and lib/extable.c).
>
> Patch #5 replaces the int type with the size_t type of the size argument
> in the swap function.

> Andrey Abramov (5):
>   arch/arc: unwind.c: replace swap function with built-in one
>   powerpc: module_[32|64].c: replace swap function with built-in one
>   ocfs2: dir,refcounttree,xattr: replace swap functions with built-in
>     one
>   ubifs: find.c: replace swap function with built-in one
>   Lib: sort.h: replace int size with size_t size in the swap function

You have to do something about Cc list.
50 people is complete overkill. Seems as your series is a set of
independent fixes. Why not to split and Cc based on individual case?

-- 
With Best Regards,
Andy Shevchenko

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
