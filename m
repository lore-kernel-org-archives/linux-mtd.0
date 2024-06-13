Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C840EC27C4F
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jun 2024 12:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FuiZyTTjeXD7PMbeM+fsEQVheNkivDrm51va9XSJTks=; b=xfdoQ0mIeYrE5F
	F3tQPDmLRv1Ra15barFvD3xvTQlkVOx+lbuhlSuXuHqgnwmD7KTMw43SjbbJM5RhWgJBfcWitnRjr
	R02FPicJ1PSdq8mtf5s/JxVZa1gCraOYb1CB99fQFxRlWpyzpN6aOts3jJEDao7YjdYevGSGcmbTZ
	VwMoVJ5XOJVsFLvkbgPaSHkE+cbqIN/NXO86wA/wNukc71COmXHiZeEAbpRS3kL0/zBM21WSCDsTC
	gxsrP4NL08ClxOk9AdGVR5BACS6HMdrAXahVjs1iD7HKwshN+e/MfCKpO9C/G+GhrgU0nmeaOjlvM
	fnoXDfk36zIpm+DuXENg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHk1e-0000000Gb09-1Z7z;
	Thu, 13 Jun 2024 12:57:58 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHk1b-0000000Gaye-0g2C
	for linux-mtd@lists.infradead.org;
	Thu, 13 Jun 2024 12:57:57 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id AF49EE000F;
	Thu, 13 Jun 2024 12:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1718283471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ln17ZxRL+upVh68wnbTdi1KTA2jYfvXcMhNeLfk448s=;
	b=HS2TOvkZeG68w8F8vNWzKEgAX22dLWuSPHlDvOdcAPBycdM7mjvCte+RRtlAbl3VFoiZj/
	qPcNES9ddnnPHYkw/e8p/WKEf/zkC4Zxr4c8IVlFQx0SiX76phFUUJOW9DSAh1TTJsqPhx
	I2pKDrlruxBKZn2mTt15ASOW9pmAOVatGGVjIjboWTEiG6ebFdHH5p0J5lU89Exyg05WkH
	lbazXqjFMXfxCLx/I9Mj2kfhC0BPiYk4viK2Cqr5rzIx22blshbo71cjUkgxCfj2XlPhEq
	gLjvufC8BxaTKgwzy0DCeiIQsmaw3NWiV8L2srBMZ/90k578XQY2eQ21MsSyxQ==
Message-ID: <ba441a7c-28f8-49c0-95b9-71a586007e44@yoseli.org>
Date: Thu, 13 Jun 2024 14:57:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Issue with JFFS2 and a_ops->dirty_folio
To: Christoph Hellwig <hch@infradead.org>
Cc: linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-mtd@lists.infradead.org, willy@infradead.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-m68k@lists.linux-m68k.org
References: <0b657056-3a7f-46ba-8e99-a8fe2203901f@yoseli.org>
 <ZmrV9vLwj0uFj5Dn@infradead.org>
Content-Language: en-US
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
In-Reply-To: <ZmrV9vLwj0uFj5Dn@infradead.org>
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_055755_910765_A6FCB4A7 
X-CRM114-Status: GOOD (  17.89  )
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

Hello Christoph,

On 13/06/2024 13:20, Christoph Hellwig wrote:
> On Thu, Jun 13, 2024 at 09:05:17AM +0200, Jean-Michel Hautbois wrote:
>> Hi everyone !
>>
>> I am currently working on a Coldfire (MPC54418) and quite everything goes
>> well, except that I can only execute one command from user space before
>> getting a segmentation fault on the do_exit() syscall.
> 
> Looks like jffs2 is simply missing a dirty_folio implementation.  The
> simple filemap_dirty_folio should do the job, please try the patch
> below:
> 
> 
> diff --git a/fs/jffs2/file.c b/fs/jffs2/file.c
> index 62ea76da7fdf23..7124cbad6c35ae 100644
> --- a/fs/jffs2/file.c
> +++ b/fs/jffs2/file.c
> @@ -19,6 +19,7 @@
>   #include <linux/highmem.h>
>   #include <linux/crc32.h>
>   #include <linux/jffs2.h>
> +#include <linux/writeback.h>
>   #include "nodelist.h"
>   
>   static int jffs2_write_end(struct file *filp, struct address_space *mapping,
> @@ -75,6 +76,7 @@ const struct address_space_operations jffs2_file_address_operations =
>   	.read_folio =	jffs2_read_folio,
>   	.write_begin =	jffs2_write_begin,
>   	.write_end =	jffs2_write_end,
> +	.dirty_folio =	filemap_dirty_folio,
>   };
>   
>   static int jffs2_do_readpage_nolock (struct inode *inode, struct page *pg)


Thanks, I did implement this one, but now I have another weird issue, I 
don't know if this can be related...

When the bash command is launched (my init command is init=/bin/bash) I 
can launch a first command (say, ls for instance) and it works fine. But 
a second call to this same command or any other one juste returns as if 
nothing was done... And I can't even debug, strace fails too:

execve("/bin/ls", ["/bin/ls"], 0xbfb31ef0 /* 5 vars */) = 0
brk(NULL)                               = 0x2ab7c000
atomic_barrier()                        = 0
access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (No such file or 
directory)
atomic_barrier()                        = 0
atomic_barrier()                        = 0
atomic_barrier()                        = 0
openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 
-1 ENOENT (No such file or directory)
openat(AT_FDCWD, "/lib/libresolv.so.2", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 3
read(3, 
"\177ELF\1\2\1\0\0\0\0\0\0\0\0\0\0\3\0\4\0\0\0\1\0\0\0\0\0\0\0004"..., 
512) = 512
statx(3, "", AT_STATX_SYNC_AS_STAT|AT_NO_AUTOMOUNT|AT_EMPTY_PATH, 
STATX_BASIC_STATS, 
{stx_mask=STATX_TYPE|STATX_MODE|STATX_NLINK|STATX_UID|STATX_GID|STATX_MTIME|STATX_CTIME|STATX_INO|STATX_SIZE|STATX_BLOCKS|STATX_
MNT_ID, stx_attributes=0, stx_mode=S_IFREG|0755, stx_size=43120, ...}) = 0
mmap2(NULL, 59888, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) 
=[   15.830000] random: crng init done
  0x60022000
mmap2(0x6002c000, 16384, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x8000) = 0x6002c000
mmap2(0x60030000, 2544, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x60030000
close(3)                                = 0
atomic_barrier()                        = 0
atomic_barrier()                        = 0
atomic_barrier()                        = 0
atomic_barrier()                        = 0
openat(AT_FDCWD, "/lib/libc.so.6", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 3
read(3, 
"\177ELF\1\2\1\0\0\0\0\0\0\0\0\0\0\3\0\4\0\0\0\1\0\2\324\n\0\0\0004"..., 
512) = 512
statx(3, "", AT_STATX_SYNC_AS_STAT|AT_NO_AUTOMOUNT|AT_EMPTY_PATH, 
STATX_BASIC_STATS, 
{stx_mask=STATX_TYPE|STATX_MODE|STATX_NLINK|STATX_UID|STATX_GID|STATX_MTIME|STATX_CTIME|STATX_INO|STATX_SIZE|STATX_BLOCKS|STATX_
MNT_ID, stx_attributes=0, stx_mode=S_IFREG|0755, stx_size=1257660, ...}) = 0
mmap2(NULL, 1290920, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 
0) = 0x60032000
mmap2(0x6015e000, 24576, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x12c000) = 0x6015e000
mmap2(0x60164000, 37544, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x60164000
close(3)                                = 0
atomic_barrier()                        = 0
atomic_barrier()                        = 0
atomic_barrier()                        = 0
atomic_barrier()                        = 0
atomic_barrier()                        = 0
atomic_barrier()                        = 0
atomic_barrier()                        = 0
atomic_barrier()                        = 0
atomic_barrier()                        = 0
atomic_barrier()                        = 0
atomic_barrier()                        = 0
atomic_barrier()                        = 0
atomic_barrier()                        = 0
atomic_barrier()                        = 0
atomic_barrier()                        = 0
atomic_barrier()                        = 0
atomic_barrier()                        = 0
atomic_barrier()                        = 0
atomic_barrier()                        = 0
atomic_barrier()                        = 0
atomic_barrier()                        = 0
atomic_barrier()                        = 0
atomic_barrier()                        = 0
atomic_barrier()                        = 0
mmap2(NULL, 16384, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 
0) = 0x6016e000
set_thread_area(0x601759c0)             = 0
get_thread_area()                       = 0x601759c0
atomic_barrier()                        = 0
set_tid_address(0x6016e548)             = 28
set_robust_list(0x6016e54c, 12)         = 0
mprotect(0x6015e000, 8192, PROT_READ)   = 0
mprotect(0x6002c000, 8192, PROT_READ)   = 0
mprotect(0x2ab72000, 8192, PROT_READ)   = 0
mprotect(0x6001e000, 8192, PROT_READ)   = 0
--- SIGSEGV {si_signo=SIGSEGV, si_code=SEGV_MAPERR, si_addr=0xc00815f4} ---
+++ killed by SIGSEGV +++

I suppose this can be related to the ELF_DT_DYN_BASE address, but I 
can't see what is going on yet.

Thanks,
JM

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
