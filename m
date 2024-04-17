Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6660C4345F
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2024 12:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8JdwjqWCNCke6VjgBTib3KqiJJtZwrppUJ3u51D5Ue4=; b=2/QACl0dDEkhCO
	3L7+N6Mu1LKn0Zksyttq48DiHR98UrQUoLWQliA19SaOWE+uYxcxshqFUDg+5E8cKgZAIVfTCxYQR
	XIkavrz+kni7hY6UQJ0ZY7NS+XusKCvPKgVkKaqjxmjE6j0D06YLJemQXfNwIgi4Oft8V8YKxQ35n
	2GMx5d5faLqoWeQNCXv+XhOlVNWc8U9AE5vmjvnDrmfsQPzpzh4B6VVyOUc2Sr5gSD3lYyW79Ucft
	uZAK+rkuhoMqahuyyLH5hQk2v84A8aHRa/6RP0sAB3uFO7vKP2PpaIqX9VBKpSVntub54DaGKTzrZ
	+UuZLMX4VIZBXuCPv+7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx4cp-0000000Fy1u-0v0n;
	Wed, 17 Apr 2024 12:42:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx4cm-0000000Fy12-0UL8
	for linux-mtd@lists.infradead.org;
	Wed, 17 Apr 2024 12:42:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8873960DBC;
	Wed, 17 Apr 2024 12:42:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E90CC072AA;
	Wed, 17 Apr 2024 12:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713357771;
	bh=LjuVga1jgUFUjOIoruBi95CjF+0mFnOrzPb9k1RDeqA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=RUalc6auZQob9SLwLUM1Of8+vvxEIAwlGzVeN23YegB8xOURV181uDymSGfI79FJM
	 zthNGhluV6/KG6EwjNa8QeScSmPuiEI4OkwFoF5uEwRw4dAwVO8shYFd/85YwDhfOb
	 jA69ZXp5XQAlq3VKgZusnhCnC/J1lePtUJ1UvqliLMOfca9fwGgXk362hu1gXFvwHw
	 pQGWZR27yKVClziyFxF3rGUbm/U9SVEiI/oGuHL3aVxm80jCrKEnV2iX61RjDy8Mp2
	 hdEvKL8EFMB9OJX+2fyZPKeAOzHM7ToHL1fjCQtV6zhdJPJdPnrsgBUX9ky2jZR9Tt
	 kD4NECvgItePg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: "pratyush@kernel.org" <pratyush@kernel.org>,
  "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: spi-nor: excessive locking in spi_nor_erase()
In-Reply-To: <8366e6def86b792f3e8b0077dd9aaa5cbecf27ff.camel@infinera.com>
	(Joakim Tjernlund's message of "Tue, 16 Apr 2024 18:03:39 +0000")
References: <069251d381826e9bc8a59c49c39c393c2860a028.camel@infinera.com>
	<mafs01q758g7z.fsf@kernel.org>
	<8366e6def86b792f3e8b0077dd9aaa5cbecf27ff.camel@infinera.com>
Date: Wed, 17 Apr 2024 14:42:49 +0200
Message-ID: <mafs0wmow6tyu.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_054252_260497_9999B58D 
X-CRM114-Status: GOOD (  38.02  )
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

On Tue, Apr 16 2024, Joakim Tjernlund wrote:

> On Tue, 2024-04-16 at 17:44 +0200, Pratyush Yadav wrote:
>> Hi,
>
> Hi Pratyush, thanks for replying. Se below
>
>> 
[...]
>> > 
>> > So erase locks the flash for the whole erase op which can include many sectors and I don't see
>> > any Erase Suspend handling in spi-nor like the cfi_cmdset_0001/cfi_cmdset_0002 has.
>> > 
>> > Locking can be a challenge but this seems over the top, anyone working/looking into improving this?
>> 
>> I think you should lead with what the problem you see with this and what
>> you think can be improved. Why do you think the locking is "over the
>> top"? What should be improved?
>
> Sure, we have been using NOR flash as RFS(JFFS2) for many years now and it
> is important that RFS is responsive at all times. Up til recently we used parallel NOR
> using cfi_cmdset_0001/cfi_cmdset_0002 which has worked great.
>
> QSPI is different beast and its driver not mature for RFS use. Consider when our
> sw update starts to erase Image B partition, then the flash becomes completely locked for other
> processes to use, one cannot even connect with ssh while sw update is ongoing or do an ls.

I see. I assume the rootfs is on the NOR flash. While a big erase
(spanning multiple sectors) is running, other tasks do still get to run
(since spi_nor_wait_till_ready() calls cond_resched()) but any task that
tries to access the rootfs would have to freeze since the lock is held.

Dropping and re-acquiring the lock after erasing each sector or
programming each page would let readers make progress in between. This
shouldn't be too difficult to implement I reckon. You already mostly do
it in your patch below.

Doing erase or program suspend would only make sense for flashes with
larger sectors since even one sector erase would take a long time. For
those, I suppose we could give reads priority over program or erase
operations. When a read comes in, it suspends the erase, does the read,
and then resumes it. This would be a little bit more complex to
implement.

I would suggest you try the former first and see if it already gives you
the results you need. From your patch below, it seems it does. So
perhaps just cleaning it up and turning it onto a proper patch would do
the job for you.

>
> ATM I am testing this(which makes the system much more responsive:
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index bcaae9c71d90..62fe9cb97139 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -1635,6 +1635,13 @@ static int spi_nor_erase_multi_sectors(struct spi_nor *nor, u64 addr, u32 len)
>                         dev_vdbg(nor->dev, "erase_cmd->size = 0x%08x, erase_cmd->opcode = 0x%02x, erase_cmd->count = %u\n",
>                                  cmd->size, cmd->opcode, cmd->count);
>  
> +                       spi_nor_unlock_and_unprep(nor);
> +                       //cond_resched();
> +                       schedule();
> +                       ret = spi_nor_lock_and_prep(nor);
> +                       if (ret)
> +                               goto destroy_erase_cmd_list;
> +
>                         ret = spi_nor_write_enable(nor);
>                         if (ret)
>                                 goto destroy_erase_cmd_list;
> @@ -1721,6 +1728,13 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
>         /* "sector"-at-a-time erase */
>         } else if (spi_nor_has_uniform_erase(nor)) {
>                 while (len) {
> +                       spi_nor_unlock_and_unprep(nor);
> +                       //cond_resched();
> +                       schedule();
> +                       ret = spi_nor_lock_and_prep(nor);
> +                       if (ret)
> +                               return ret;
> +
>                         ret = spi_nor_write_enable(nor);
>                         if (ret)
>                                 goto erase_err;
> @@ -1987,6 +2001,9 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
>                 ssize_t written;
>                 loff_t addr = to + i;
>  
> +               spi_nor_unlock_and_unprep(nor);
> +               //cond_resched();
> +               schedule();
>                 /*
>                  * If page_size is a power of two, the offset can be quickly
>                  * calculated with an AND operation. On the other cases we
> @@ -2005,6 +2022,10 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
>  
>                 addr = spi_nor_convert_addr(nor, addr);
>  
> +               ret = spi_nor_lock_and_prep(nor);
> +               if (ret)
> +                       return ret;
> +
>                 ret = spi_nor_write_enable(nor);
>                 if (ret)
>                         goto write_err;
>
> This is s good first step but not enough, one need to support Erase Suspend(which the vast majority of flash support)
> to get full responsiveness(see cfi_cmdset_0001/cfi_cmdset_0002)
>
>> 
>> Most flashes can't do any operations (except poll status register) when
>
> Not quite, see above comment on Erase Suspend

Yes, I meant in the absence of a suspend operation, which SPI NOR does
not currently do.

>
>> a program or erase operation is in progress. So the locking here makes
>> sense to me. We do not want to let other tasks attempt any other
>> operations until the erase is done. The only exception is some
>> multi-bank flashes that can do erase on one bank and reads on other
>> banks. Miquel's series [1] takes care of those (though I do not see any
>> flashes using that feature yet).
>> 
>> [0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/mtd/spi-nor/core.c#n1789
>> [1] https://lore.kernel.org/linux-mtd/20230328154105.448540-1-miquel.raynal@bootlin.com/
>> 
>

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
