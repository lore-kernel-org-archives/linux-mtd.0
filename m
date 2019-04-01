Return-Path: <SRS0=Y0kv=SD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AED20C43381
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 09:36:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A71920830
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 09:36:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SBZ0moaj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A71920830
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cDRj8wHjY2maQj3LdF5ujypzlTeOgvryPschcWe4UDo=; b=SBZ0moajHR4Vdi
	Pv4DwQFZe0DEjCFepARGpBzXa/EQh2erJVQ4L1ll4j0T6RBpkIlqD00bhHunvq6iVcGWXwjuWIoJU
	U6HesGLeP63A2BwK4x574xfx8oKtOS0BhOwvTw1NfLinH5ywoKWWHdbgdlUxf0Bt6dk7jlNKgEGM6
	oQkG+rgwwWCWXx+TohM5kB1NzMsAq7Y7Vgu6EFgurNjxw83pQoIcutJF2M2YPTVj/O9ERqYHdLDOi
	KLDj16JLS9y8AwkrFTJrutGNfDLQms+PSU5ctzqLWLyGCyKMsTJ+mWpgeMjyYGUie6tTyvwcx/VoO
	pEbIvrnllOEP5zuCjSuA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAtMR-0004z5-Rm; Mon, 01 Apr 2019 09:36:11 +0000
Received: from mga06.intel.com ([134.134.136.31])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAtMN-0004y9-Ki; Mon, 01 Apr 2019 09:36:09 +0000
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Apr 2019 02:36:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,296,1549958400"; d="scan'208";a="138963625"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.86])
 by orsmga003.jf.intel.com with ESMTP; 01 Apr 2019 02:35:56 -0700
Received: from andy by smile with local (Exim 4.92)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1hAtMB-0003Wz-1k; Mon, 01 Apr 2019 12:35:55 +0300
Date: Mon, 1 Apr 2019 12:35:55 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andrey Abramov <st5pub@yandex.ru>
Subject: Re: [PATCH v2 5/5] Lib: sort.h: replace int size with size_t size in
 the swap function
Message-ID: <20190401093555.GD9224@smile.fi.intel.com>
References: <19606671554056883@myt3-1179f584969c.qloud-c.yandex.net>
 <23051461554058370@iva6-3ac3de5fcc31.qloud-c.yandex.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23051461554058370@iva6-3ac3de5fcc31.qloud-c.yandex.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_023607_732267_AFD43280 
X-CRM114-Status: GOOD (  18.24  )
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
Cc: peterz <peterz@infradead.org>, benh <benh@kernel.crashing.org>,
 Dave Chinner <dchinner@redhat.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "yamada.masahiro" <yamada.masahiro@socionext.com>, paulus <paulus@samba.org>,
 mpe <mpe@ellerman.id.au>, hpa <hpa@zytor.com>, jslaby <jslaby@suse.cz>,
 sfr <sfr@canb.auug.org.au>, "darrick.wong" <darrick.wong@oracle.com>,
 richard <richard@nod.at>, mark <mark@fasheh.com>, x86 <x86@kernel.org>,
 mingo <mingo@redhat.com>, "naveen.n.rao" <naveen.n.rao@linux.vnet.ibm.com>,
 linux-snps-arc <linux-snps-arc@lists.infradead.org>, jannh <jannh@google.com>,
 bp <bp@alien8.de>, jlbec <jlbec@evilplan.org>, jpoimboe <jpoimboe@redhat.com>,
 tglx <tglx@linutronix.de>, George Spelvin <lkml@sdf.org>,
 dedekind1 <dedekind1@gmail.com>, vgupta <vgupta@synopsys.com>,
 "ard.biesheuvel" <ard.biesheuvel@linaro.org>,
 "adrian.hunter" <adrian.hunter@intel.com>, gregkh <gregkh@linuxfoundation.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Morton Andrew <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 ocfs2-devel <ocfs2-devel@oss.oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, Mar 31, 2019 at 09:52:50PM +0300, Andrey Abramov wrote:
> Replace int type with size_t type of the size argument
> in the swap function, also affect all its dependencies.
> 
> It's always been weird that sort() takes a size_t element size,
> but passes an int size to (*swap)(). Not a bug because we don't
> sort objects >2GB large, but it's ugly.

Hmm... If (*swap)() is called recursively it means the change might increase
stack usage on 64-bit platforms.

Am I missing something?

> 
> Signed-off-by: Andrey Abramov <st5pub@yandex.ru>
> Reviewed by: George Spelvin <lkml@sdf.org>
> ---
>  arch/x86/kernel/unwind_orc.c | 2 +-
>  include/linux/sort.h         | 2 +-
>  kernel/jump_label.c          | 2 +-
>  lib/extable.c                | 2 +-
>  lib/sort.c                   | 6 +++---
>  5 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/x86/kernel/unwind_orc.c b/arch/x86/kernel/unwind_orc.c
> index 89be1be1790c..1078c287198c 100644
> --- a/arch/x86/kernel/unwind_orc.c
> +++ b/arch/x86/kernel/unwind_orc.c
> @@ -176,7 +176,7 @@ static struct orc_entry *orc_find(unsigned long ip)
>  	return orc_ftrace_find(ip);
>  }
>  
> -static void orc_sort_swap(void *_a, void *_b, int size)
> +static void orc_sort_swap(void *_a, void *_b, size_t size)
>  {
>  	struct orc_entry *orc_a, *orc_b;
>  	struct orc_entry orc_tmp;
> diff --git a/include/linux/sort.h b/include/linux/sort.h
> index 2b99a5dd073d..aea39d552ff7 100644
> --- a/include/linux/sort.h
> +++ b/include/linux/sort.h
> @@ -6,6 +6,6 @@
>  
>  void sort(void *base, size_t num, size_t size,
>  	  int (*cmp)(const void *, const void *),
> -	  void (*swap)(void *, void *, int));
> +	  void (*swap)(void *, void *, size_t));
>  
>  #endif
> diff --git a/kernel/jump_label.c b/kernel/jump_label.c
> index bad96b476eb6..340b788571fb 100644
> --- a/kernel/jump_label.c
> +++ b/kernel/jump_label.c
> @@ -45,7 +45,7 @@ static int jump_label_cmp(const void *a, const void *b)
>  	return 0;
>  }
>  
> -static void jump_label_swap(void *a, void *b, int size)
> +static void jump_label_swap(void *a, void *b, size_t size)
>  {
>  	long delta = (unsigned long)a - (unsigned long)b;
>  	struct jump_entry *jea = a;
> diff --git a/lib/extable.c b/lib/extable.c
> index f54996fdd0b8..db2888342cd7 100644
> --- a/lib/extable.c
> +++ b/lib/extable.c
> @@ -28,7 +28,7 @@ static inline unsigned long ex_to_insn(const struct exception_table_entry *x)
>  #ifndef ARCH_HAS_RELATIVE_EXTABLE
>  #define swap_ex		NULL
>  #else
> -static void swap_ex(void *a, void *b, int size)
> +static void swap_ex(void *a, void *b, size_t size)
>  {
>  	struct exception_table_entry *x = a, *y = b, tmp;
>  	int delta = b - a;
> diff --git a/lib/sort.c b/lib/sort.c
> index 50855ea8c262..60fbbc29104a 100644
> --- a/lib/sort.c
> +++ b/lib/sort.c
> @@ -114,7 +114,7 @@ static void swap_bytes(void *a, void *b, size_t n)
>  	} while (n);
>  }
>  
> -typedef void (*swap_func_t)(void *a, void *b, int size);
> +typedef void (*swap_func_t)(void *a, void *b, size_t size);
>  
>  /*
>   * The values are arbitrary as long as they can't be confused with
> @@ -138,7 +138,7 @@ static void do_swap(void *a, void *b, size_t size, swap_func_t swap_func)
>  	else if (swap_func == SWAP_BYTES)
>  		swap_bytes(a, b, size);
>  	else
> -		swap_func(a, b, (int)size);
> +		swap_func(a, b, size);
>  }
>  
>  /**
> @@ -187,7 +187,7 @@ static size_t parent(size_t i, unsigned int lsbit, size_t size)
>   */
>  void sort(void *base, size_t num, size_t size,
>  	  int (*cmp_func)(const void *, const void *),
> -	  void (*swap_func)(void *, void *, int size))
> +	  void (*swap_func)(void *, void *, size_t size))
>  {
>  	/* pre-scale counters for performance */
>  	size_t n = num * size, a = (num/2) * size;
> -- 
> 2.21.0
> 
> 

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
