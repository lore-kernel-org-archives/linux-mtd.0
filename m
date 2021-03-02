Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4FEEC433DB
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 19:12:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD0AA64E90
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 19:12:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD0AA64E90
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Fk+KWqaEJR7hLLVp8kZDOceUJwRfT6KScHvMEJFAezI=; b=A5euoSFJ6rTXEOlMLK3daS2tp
	k7x3JvwZeldggUw/By2l04aGX6BFikmmFJzsJVahSY7cBg1XwcDsUf0NEAiOuVlBtcBRE5maaTaU9
	OkAIuPG0Lr818x4+hElw3t90mgSi/UM64bsWQQsLERI5XpnUFtsCu6msWp2OoRBGh/4CYtv6PZxQU
	9J2y3DWixdHvv0Ot8YOSL4xoCPXYDXzc9j5g73mALIuS5lebEzMRkhPCCBlEDVwkdVKnHa+s6PKn7
	e+Vg89TW3zW72MWA0VO8H8OCNw9yQ/2EX8Tdu90Ucm4N5gmfZCQzP3pcJrYPty7G0lhzG0mZnpBgv
	MH/UJfYJA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHWu2-0069kS-WB; Wed, 03 Mar 2021 19:11:24 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHT2a-005HmA-OO; Wed, 03 Mar 2021 15:03:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
 Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=wODTS94r7rT1g5V5X1sVfi31G7C1dx6AeI3koBrFuog=; b=gw8Ef+zlpU3fqd6bjmFWBd7OaY
 fPaaxtstRhDc3lIVr6MUNhK+KtThPh6pEsp1nzNJaoXBPwASbJ/u5kEVRc3eFtN54y4AlRQ+OcLJP
 U/gmY0PydWJ1qY+W8WMQbXrL+IWIWfU6JzTZ9GNVcjzrvHgl/Z9kMLysA/HtlqGQqmzEcvSQ+cD7N
 T5e8NQ3rR7GQJ7qwcbewcEsWsfgyRuZ1RAEa0R4jz8s5+6XZeebKPYH93loJDT8jBLmcn0X0terLA
 7o8HHtrvC1gtsb52D9/nw20fCNj1tYs8jn3lgdtBB1mAGQKOaDPVItOr0b9XzYnZ4w6uBHAEGUUGG
 QW+ArtWA==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH4xU-00HAbD-Q2; Tue, 02 Mar 2021 13:21:16 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1614691254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wODTS94r7rT1g5V5X1sVfi31G7C1dx6AeI3koBrFuog=;
 b=pdbP0RvjlLwhT6MGt3O7gZlZ1Q1Vzt4kvyP2jb11vAJTSkByIgWXRKROCs34fG3dE0AwTY
 opU3gtVisKtnKDi9H9VaqI9P0bhcuxW+ktoNqViJTmLm/vR+nRGAu3kprbB/6g5+VBDeOZ
 ISR5jMmEubi9pF4n2AWS1K7EJF6nQqOZ7mmnpB1SEorJMS5eXC6YUniwsW+o9YMWNEx/Xj
 xPN5r8bZzOsf6A9vVjHdFrwNDVoQDh1yYdiMi7tbkNI3fa/NGcpZ+fYwM9XNXow6mIJwhV
 c6N2wQQqBhJ0Qe4yqQIr91zIX6QAKM27rCmbJHH1uo6HBm2Z4utmX+gBS6ubiw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1614691254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wODTS94r7rT1g5V5X1sVfi31G7C1dx6AeI3koBrFuog=;
 b=PvCf8UGzPtfD1uoD5xPlqfOPLQKMHyVSQbbcSZy98K9oXrA3licqYHQYy8osgfMblhBHAa
 hvqSY9FaOO6n64Aw==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, Sergey
 Senozhatsky <sergey.senozhatsky@gmail.com>, Steven Rostedt
 <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Jeff Dike <jdike@addtoit.com>, Richard Weinberger
 <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, "K. Y.
 Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, Kees Cook <keescook@chromium.org>, Anton Vorontsov
 <anton@enomsg.org>, Colin Cross <ccross@android.com>, Tony Luck
 <tony.luck@intel.com>, Jason Wessel <jason.wessel@windriver.com>, Daniel
 Thompson <daniel.thompson@linaro.org>, Douglas Anderson
 <dianders@chromium.org>, Pavel Tatashin <pasha.tatashin@soleen.com>, Joel
 Stanley <joel@jms.id.au>, Christophe Leroy <christophe.leroy@c-s.fr>,
 Jordan Niethe <jniethe5@gmail.com>, Alistair Popple
 <alistair@popple.id.au>, Ravi Bangoria <ravi.bangoria@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Mike Rapoport <rppt@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Thomas Meyer <thomas@m3y3r.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Davidlohr Bueso
 <dave@stgolabs.net>, Oleg Nesterov <oleg@redhat.com>, Wei Li
 <liwei391@huawei.com>, Michael Kelley <mikelley@microsoft.com>,
 linuxppc-dev@lists.ozlabs.org, linux-um@lists.infradead.org,
 linux-hyperv@vger.kernel.org, linux-mtd@lists.infradead.org,
 kgdb-bugreport@lists.sourceforge.net
Subject: Re: [PATCH next v3 12/15] printk: introduce a kmsg_dump iterator
In-Reply-To: <YD0tbVV+hZOFvWyB@alley>
References: <20210225202438.28985-1-john.ogness@linutronix.de>
 <20210225202438.28985-13-john.ogness@linutronix.de> <YD0tbVV+hZOFvWyB@alley>
Date: Tue, 02 Mar 2021 14:20:51 +0100
Message-ID: <87lfb5pu8c.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_132116_065616_487766FA 
X-CRM114-Status: GOOD (  24.55  )
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

On 2021-03-01, Petr Mladek <pmladek@suse.com> wrote:
>> diff --git a/arch/powerpc/kernel/nvram_64.c b/arch/powerpc/kernel/nvram_64.c
>> index 532f22637783..5a64b24a91c2 100644
>> --- a/arch/powerpc/kernel/nvram_64.c
>> +++ b/arch/powerpc/kernel/nvram_64.c
>> @@ -72,8 +72,7 @@ static const char *nvram_os_partitions[] = {
>>  	NULL
>>  };
>>  
>> -static void oops_to_nvram(struct kmsg_dumper *dumper,
>> -			  enum kmsg_dump_reason reason);
>> +static void oops_to_nvram(enum kmsg_dump_reason reason);
>>  
>>  static struct kmsg_dumper nvram_kmsg_dumper = {
>>  	.dump = oops_to_nvram
>> @@ -642,11 +641,11 @@ void __init nvram_init_oops_partition(int rtas_partition_exists)
>>   * that we think will compress sufficiently to fit in the lnx,oops-log
>>   * partition.  If that's too much, go back and capture uncompressed text.
>>   */
>> -static void oops_to_nvram(struct kmsg_dumper *dumper,
>> -			  enum kmsg_dump_reason reason)
>> +static void oops_to_nvram(enum kmsg_dump_reason reason)
>>  {
>>  	struct oops_log_info *oops_hdr = (struct oops_log_info *)oops_buf;
>>  	static unsigned int oops_count = 0;
>> +	static struct kmsg_dump_iter iter;
>>  	static bool panicking = false;
>>  	static DEFINE_SPINLOCK(lock);
>>  	unsigned long flags;
>> @@ -681,13 +680,14 @@ static void oops_to_nvram(struct kmsg_dumper *dumper,
>>  		return;
>>  
>>  	if (big_oops_buf) {
>> -		kmsg_dump_get_buffer(dumper, false,
>> +		kmsg_dump_rewind(&iter);
>
> It would be nice to get rid of the kmsg_dump_rewind(&iter) calls
> in all callers.
>
> A solution might be to create the following in include/linux/kmsg_dump.h
>
> #define KMSG_DUMP_ITER_INIT(iter) {	\
> 	.cur_seq = 0,			\
> 	.next_seq = U64_MAX,		\
> 	}
>
> #define DEFINE_KMSG_DUMP_ITER(iter)	\
> 	struct kmsg_dump_iter iter = KMSG_DUMP_ITER_INIT(iter)

For this caller (arch/powerpc/kernel/nvram_64.c) and for
(kernel/debug/kdb/kdb_main.c), kmsg_dump_rewind() is called twice within
the dumper. So rewind will still be used there.

> Then we could do the following at the beginning of both
> kmsg_dump_get_buffer() and kmsg_dump_get_line():
>
> 	u64 clear_seq = latched_seq_read_nolock(&clear_seq);
>
> 	if (iter->cur_seq < clear_seq)
> 		cur_seq = clear_seq;

I suppose we need to add this part anyway, if we want to enforce that
records before @clear_seq are not to be available for dumpers.

> I am not completely sure about next_seq:
>
>    + kmsg_dump_get_buffer() will set it for the next call anyway.
>      It reads the blocks of messages from the newest.
>
>    + kmsg_dump_get_line() wants to read the entire buffer anyway.
>      But there is a small risk of an infinite loop when new messages
>      are printed when dumping each line.
>
> It might be better to avoid the infinite loop. We could do the following:
>
> static void check_and_set_iter(struct kmsg_dump_iter)
> {
> 	if (iter->cur_seq == 0 && iter->next_seq == U64_MAX) {
> 		kmsg_dump_rewind(iter);
> }
>
> and call this at the beginning of both kmsg_dump_get_buffer()
> and kmsg_dump_get_line()
>
> What do you think?

On a technical level, it does not make any difference. It is pure
cosmetic.

Personally, I prefer the rewind directly before the kmsg_dump_get calls
because it puts the initializer directly next to the user.

As an example to illustrate my view, I prefer:

    for (i = 0; i < n; i++)
        ...;

instead of:

    int i = 0;

    ...

    for (; i < n; i++)
        ...;

Also, I do not really like the special use of 0/U64_MAX to identify
special actions of the kmsg_dump_get functions.

> Note that I do not resist on it. But it might make the API easier to
> use from my POV.

Since you do not resist, I will keep the API the same for v4. But I will
add the @clear_seq check to the kmsg_dump_get functions.

John Ogness

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
