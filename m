Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A214C2BBCA
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jun 2024 07:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ouPCSe1isUUar0NC/pgiiE+JZG7LHZ15OL6zBBA257U=; b=hTXnLONVOFhM3h
	vYinGSYZp2OGYSnazpL++rhO5ZBex2mTMZ5PolOjlmOSvaZyxTkXJzIhs4HbZhpYibTaGKptd/SFO
	rGMtb3kneI59D07e+s6Sxs81/wk2gs9JBhr4h9TJgDsXA9oanKWHWgybePWnqEFt86DoMqxpCDvkG
	4YW1gueTXaAuT/WMqCl3eyHtQV1HWgeRtufta5b2NQa0abeWc/MrMNf10cDgprxaq763Eu0gv8zet
	97to2QRyKhCxtsVuPdYqpBOMPVt+/4OQrmuvM4AHjWMP2tay7eVaPAFzmEYZuI3TcvRE3ZpO6YqeW
	t5bknkVxf3+DhFKNiZWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN5nP-0000000CrRV-1Sbh;
	Fri, 28 Jun 2024 07:13:23 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN5nL-0000000CrQu-1Cvx
	for linux-mtd@lists.infradead.org;
	Fri, 28 Jun 2024 07:13:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719558797;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uBCG6Aq7g5s4IKz6cGy3Qa4TvJeSerIQI/YPWTkVSgw=;
	b=G1BZhPGj/8qN5SKsEVi7e/Jm+KGYZSJNRAoVmN20uX8fXJBklm3ddTsPsMsl75RnZx9G0v
	afKmC6LEmIKh+1W0ozlhypsvV8ePyVtsBxRUGWm+A1CL4mqy746KH2qA/xidmJGVGscw6Q
	1irbj3/EvYV8Cplzq4dds5wN1HstA/g=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-169-kHRB8egrNw2w3mBIXssHPg-1; Fri, 28 Jun 2024 03:13:15 -0400
X-MC-Unique: kHRB8egrNw2w3mBIXssHPg-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-52e76856405so253308e87.1
        for <linux-mtd@lists.infradead.org>; Fri, 28 Jun 2024 00:13:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719558794; x=1720163594;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uBCG6Aq7g5s4IKz6cGy3Qa4TvJeSerIQI/YPWTkVSgw=;
        b=LJ2C4B2V0qnuwTgJSfNuqWrsGS3eKMVz6C4NZYhRx+uBi7gFcAGP86ueYL5qPPhPkE
         Ai1xILmRJTPXkoctg4xVqOsqIku7tv4kNZ51Zxc80HAKiFByJnSbSXZrE+EBNPPjm128
         GM7QN/obk7z8PH1UkItB8BhvLKKTlhGIMPpeTgoltiZ9RCUjn0O6QyM4aQTTuR8O7MAC
         AyaIA45s+fw1LDK77onbPjSBq9g/MsloCzUiPUL/EhLSc/ZOn2GJpwMFcL5kjhO1+XPS
         tDgFFlqB389OxqbkfKhRT8PGFrFD9CLG774U5YbeSiTZP1tEU/hcz5FK2hL/MCNAqmld
         mzxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXczI9ZAYM9E8c664Ocz2v8eALhOftsdSCPpLzbuSGFgPSCYymlQKupWWeNKtpE/F43ueJAv7ZcV6EOmqUlKIXx5L+5CZMmyxaZ0FzaZg==
X-Gm-Message-State: AOJu0Yz9leTGn+Obs2kWJymj0Otr3qpeFw3NRvIx8K58En0pCetwyGOW
	xZLZhbkfzm0dz4tpJfOxUes3QdcZBBLJAsonOI1baQRqpyV7LGPmVb/N3M/LMoBPERhBtYDC3J/
	E8CtWp87AFwJT8pMUX8Lyh+6YP63Mkj9H8eG6Kjy2DGVyldThVBm1Psl9a6Rnr/g=
X-Received: by 2002:a05:6512:398f:b0:52e:6d6e:5770 with SMTP id 2adb3069b0e04-52e6d6e580emr4883302e87.14.1719558794368;
        Fri, 28 Jun 2024 00:13:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRNgxsh6SyinhqzjcyCteF/29SBwjZ8FpGkU83w6uoSo0McICUu/E5sqzerM5X1kwtLLuEIw==
X-Received: by 2002:a05:6512:398f:b0:52e:6d6e:5770 with SMTP id 2adb3069b0e04-52e6d6e580emr4883265e87.14.1719558793916;
        Fri, 28 Jun 2024 00:13:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e? ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256b0642acsm22012305e9.25.2024.06.28.00.13.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jun 2024 00:13:13 -0700 (PDT)
Message-ID: <06899fda-de75-4d44-bda5-dcbb3e35d037@redhat.com>
Date: Fri, 28 Jun 2024 09:13:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] printk: Add a short description string to kmsg_dump()
To: Kees Cook <kees@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, Petr Mladek <pmladek@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>, John Ogness
 <john.ogness@linutronix.de>, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jani Nikula <jani.nikula@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>, Uros Bizjak <ubizjak@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-hardening@vger.kernel.org
References: <20240625123954.211184-1-jfalempe@redhat.com>
 <202406260906.533095B1@keescook>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <202406260906.533095B1@keescook>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_001319_449151_824F3608 
X-CRM114-Status: GOOD (  35.08  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 26/06/2024 18:26, Kees Cook wrote:
> On Tue, Jun 25, 2024 at 02:39:29PM +0200, Jocelyn Falempe wrote:
>> kmsg_dump doesn't forward the panic reason string to the kmsg_dumper
>> callback.
>> This patch adds a new parameter "const char *desc" to the kmsg_dumper
>> dump() callback, and update all drivers that are using it.
>>
>> To avoid updating all kmsg_dump() call, it adds a kmsg_dump_desc()
>> function and a macro for backward compatibility.
>>
>> I've written this for drm_panic, but it can be useful for other
>> kmsg_dumper.
>> It allows to see the panic reason, like "sysrq triggered crash"
>> or "VFS: Unable to mount root fs on xxxx" on the drm panic screen.
> 
> Seems reasonable. Given the prototype before/after:
> 
> dump(struct kmsg_dumper *dumper, enum kmsg_dump_reason reason)
> 
> dump(struct kmsg_dumper *dumper, enum kmsg_dump_reason reason,
>       const char *desc)
> 
> Perhaps this should instead be a struct that the panic fills in? Then
> it'll be easy to adjust the struct in the future:

yes that's a good idea, so it's a bit more flexible.

> 
> struct kmsg_dump_detail {
> 	enum kmsg_dump_reason reason;
> 	const char *description;
> };
> 
> dump(struct kmsg_dumper *dumper, struct kmsg_dump *detail)
> 
> This .cocci could do the conversion:
> 
> 
> @ dump_func @
> identifier DUMPER, CALLBACK;
> @@
> 
>    struct kmsg_dumper DUMPER = {
>      .dump = CALLBACK,
>    };
> 
> @ detail @
> identifier dump_func.CALLBACK;
> identifier DUMPER, REASON;
> @@
> 
> 	CALLBACK(struct kmsg_dumper *DUMPER,
> -		 enum kmsg_dump_reason REASON
> +		 struct kmsg_dump_detail *detail
> 		)
> 	{
> 		<...
> -		REASON
> +		detail->reason
> 		...>
> 	}
> 
> 
> Also, just to double-check, doesn't the panic reason show up in the
> kmsg_dump log itself (at the end?) I ask since for pstore, "desc" is
> likely redundant since it's capturing the entire console log.

It is present in the kdump log, but before all the register dumps.
So to retrieve it you need to parse the last 30~40 lines of logs, and 
search for a line starting with "Kernel panic - not syncing".
https://elixir.bootlin.com/linux/v6.10-rc5/source/kernel/panic.c#L341
But I think that's a bit messy, and I prefer having a kmsg_dump parameter.

-- 

Jocelyn
> 
> -Kees
> 
> Here's the patch from the above cocci:
> 
> 
> diff -u -p a/drivers/hv/hv_common.c b/drivers/hv/hv_common.c
> --- a/drivers/hv/hv_common.c
> +++ b/drivers/hv/hv_common.c
> @@ -207,13 +207,13 @@ static int hv_die_panic_notify_crash(str
>    * buffer and call into Hyper-V to transfer the data.
>    */
>   static void hv_kmsg_dump(struct kmsg_dumper *dumper,
> -			 enum kmsg_dump_reason reason)
> +			 struct kmsg_dump_detail *detail)
>   {
>   	struct kmsg_dump_iter iter;
>   	size_t bytes_written;
>   
>   	/* We are only interested in panics. */
> -	if (reason != KMSG_DUMP_PANIC || !sysctl_record_panic_msg)
> +	if (detail->reason != KMSG_DUMP_PANIC || !sysctl_record_panic_msg)
>   		return;
>   
>   	/*
> diff -u -p a/arch/powerpc/platforms/powernv/opal-kmsg.c b/arch/powerpc/platforms/powernv/opal-kmsg.c
> --- a/arch/powerpc/platforms/powernv/opal-kmsg.c
> +++ b/arch/powerpc/platforms/powernv/opal-kmsg.c
> @@ -20,13 +20,13 @@
>    * message, it just ensures that OPAL completely flushes the console buffer.
>    */
>   static void kmsg_dump_opal_console_flush(struct kmsg_dumper *dumper,
> -				     enum kmsg_dump_reason reason)
> +				     struct kmsg_dump_detail *detail)
>   {
>   	/*
>   	 * Outside of a panic context the pollers will continue to run,
>   	 * so we don't need to do any special flushing.
>   	 */
> -	if (reason != KMSG_DUMP_PANIC)
> +	if (detail->reason != KMSG_DUMP_PANIC)
>   		return;
>   
>   	opal_flush_console(0);
> diff -u -p a/arch/powerpc/kernel/nvram_64.c b/arch/powerpc/kernel/nvram_64.c
> --- a/arch/powerpc/kernel/nvram_64.c
> +++ b/arch/powerpc/kernel/nvram_64.c
> @@ -73,7 +73,7 @@ static const char *nvram_os_partitions[]
>   };
>   
>   static void oops_to_nvram(struct kmsg_dumper *dumper,
> -			  enum kmsg_dump_reason reason);
> +			  struct kmsg_dump_detail *detail);
>   
>   static struct kmsg_dumper nvram_kmsg_dumper = {
>   	.dump = oops_to_nvram
> @@ -643,7 +643,7 @@ void __init nvram_init_oops_partition(in
>    * partition.  If that's too much, go back and capture uncompressed text.
>    */
>   static void oops_to_nvram(struct kmsg_dumper *dumper,
> -			  enum kmsg_dump_reason reason)
> +			  struct kmsg_dump_detail *detail)
>   {
>   	struct oops_log_info *oops_hdr = (struct oops_log_info *)oops_buf;
>   	static unsigned int oops_count = 0;
> @@ -655,7 +655,7 @@ static void oops_to_nvram(struct kmsg_du
>   	unsigned int err_type = ERR_TYPE_KERNEL_PANIC_GZ;
>   	int rc = -1;
>   
> -	switch (reason) {
> +	switch (detail->reason) {
>   	case KMSG_DUMP_SHUTDOWN:
>   		/* These are almost always orderly shutdowns. */
>   		return;
> @@ -671,7 +671,7 @@ static void oops_to_nvram(struct kmsg_du
>   		break;
>   	default:
>   		pr_err("%s: ignoring unrecognized KMSG_DUMP_* reason %d\n",
> -		       __func__, (int) reason);
> +		       __func__, (int) detail->reason);
>   		return;
>   	}
>   
> warning: detail, node 59: record.reason = ... ;[1,2,21,22,32] in pstore_dump may be inconsistently modified
> warning: detail, node 105: if[1,2,21,22,54] in pstore_dump may be inconsistently modified
> diff -u -p a/fs/pstore/platform.c b/fs/pstore/platform.c
> --- a/fs/pstore/platform.c
> +++ b/fs/pstore/platform.c
> @@ -275,7 +275,7 @@ void pstore_record_init(struct pstore_re
>    * end of the buffer.
>    */
>   static void pstore_dump(struct kmsg_dumper *dumper,
> -			enum kmsg_dump_reason reason)
> +			struct kmsg_dump_detail *detail)
>   {
>   	struct kmsg_dump_iter iter;
>   	unsigned long	total = 0;
> @@ -285,9 +285,9 @@ static void pstore_dump(struct kmsg_dump
>   	int		saved_ret = 0;
>   	int		ret;
>   
> -	why = kmsg_dump_reason_str(reason);
> +	why = kmsg_dump_reason_str(detail->reason);
>   
> -	if (pstore_cannot_block_path(reason)) {
> +	if (pstore_cannot_block_path(detail->reason)) {
>   		if (!spin_trylock_irqsave(&psinfo->buf_lock, flags)) {
>   			pr_err("dump skipped in %s path because of concurrent dump\n",
>   					in_nmi() ? "NMI" : why);
> @@ -311,7 +311,7 @@ static void pstore_dump(struct kmsg_dump
>   		pstore_record_init(&record, psinfo);
>   		record.type = PSTORE_TYPE_DMESG;
>   		record.count = oopscount;
> -		record.reason = reason;
> +		record.reason = detail->reason;
>   		record.part = part;
>   		record.buf = psinfo->buf;
>   
> @@ -352,7 +352,7 @@ static void pstore_dump(struct kmsg_dump
>   		}
>   
>   		ret = psinfo->write(&record);
> -		if (ret == 0 && reason == KMSG_DUMP_OOPS) {
> +		if (ret == 0 && detail->reason == KMSG_DUMP_OOPS) {
>   			pstore_new_entry = 1;
>   			pstore_timer_kick();
>   		} else {
> diff -u -p a/arch/um/kernel/kmsg_dump.c b/arch/um/kernel/kmsg_dump.c
> --- a/arch/um/kernel/kmsg_dump.c
> +++ b/arch/um/kernel/kmsg_dump.c
> @@ -8,7 +8,7 @@
>   #include <os.h>
>   
>   static void kmsg_dumper_stdout(struct kmsg_dumper *dumper,
> -				enum kmsg_dump_reason reason)
> +				struct kmsg_dump_detail *detail)
>   {
>   	static struct kmsg_dump_iter iter;
>   	static DEFINE_SPINLOCK(lock);
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
