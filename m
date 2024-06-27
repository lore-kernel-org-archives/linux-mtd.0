Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD991C2BD09
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jun 2024 23:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:Cc:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CfQnEVajBWKvsuMPjCWW7jzwp0G4EqhCm8LKiMvTme8=; b=wLq/xcDjjCHkyOap58nqI+vvL0
	RD4wP5dSINT5ddlEJgvbhCnFxOmg49/HTtfEc2zvL0UFPCgOomLr09Npln4yDN+NmH6X10x3BPzoJ
	5BUQtEdf/4rhj/SJ9ZCo3UpXXkgC2vTRNnWKpWNGG0elj6QgKWx1vFMSuPQ465KnrWqJLhR17CSOY
	SWr9VSNiRHst9YcmYqKYGbdywA8kR8sTATot7bDO1LLCy2FFKzJcLDPgxf1VQkcHsoztpP1d+p/VD
	ptfsaSEirri5pc6lOk/Xm+93+RAK3IBQ3H59RK5CHnLgN1zt0iuix/BBH7cr0TlmDJ+tjYDzh3tA/
	KeOHyRqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMz1D-0000000C1ln-18cz;
	Thu, 27 Jun 2024 23:59:11 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMz19-0000000C1jj-0nit
	for linux-mtd@lists.infradead.org;
	Thu, 27 Jun 2024 23:59:09 +0000
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-3c9b94951cfso42551b6e.3
        for <linux-mtd@lists.infradead.org>; Thu, 27 Jun 2024 16:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719532746; x=1720137546; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=edLNciVlxYjHtWHoJORPMhS5tPMU3FFmjofkfpAjt4w=;
        b=kXT2GMBwVyYDZ6iY6EIdHLDOLlMzOzABvRQ3zoHtLydkCyh+OHHrCPqyN3ixk3+8VT
         gEbSFFYiWK25Acr0HLbeijUGA91X3yWiB7kRip4yHHj+Fqi7wOl4cTPStAOuXcUkB8cJ
         cKYTvV1iBORgd7ySZYx8pbvuKtMlLWtAqy5327qT16zM1EOwSRlpnBkL5qkXnWHfJxQy
         TyizXo0NfH17oorqeECtAIingqSC9so7fTuO27lI1wL+xOi8nEPz51AZicKzGTfUkpBa
         JNyXfkp6Q3WbAwRiTW46eCOhnWDf2/qi23fiRJz3ZgXgHuLcHC515WOCu/j2Z0qlpjNp
         /Y9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719532746; x=1720137546;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=edLNciVlxYjHtWHoJORPMhS5tPMU3FFmjofkfpAjt4w=;
        b=QBXyY/lOlacSgQ4NfF4+5o459ACYcd9woTqvDUPfyWYSJ5ha2hOC+wTIuU2JpdTIGq
         V5E7TrUJ0Ml4dqWeKy20b6PpgVcbe0YZKG1EASlZj9B88DzbuQrrobmN2H32KxKKcsJ+
         Ap3bc2gCqax++YjPmFQkxrpO2spP28whfLHnGo9rxTy2Xs14eIDoaYwacX1uN+LQBcuM
         75M+Zg32GmDRWBIStrRG4uSd3WBcM3QlM2rcHdkdTycSQZNlPMdJC5aLcib359tOSiOH
         yJYxLBTs6DH7n3L3hgbxhIUUhXeuZ4pK6F5Heexyrl6e1Q6OqdnXnm96kBZ5IOzrstoI
         33ew==
X-Forwarded-Encrypted: i=1; AJvYcCVXMTkvhQt+sAaVg3WgzcT3g8TT2bz4482AqLKCWL0dELvY1TVgouV9C9Q7+2u6K9S72mtkn7vXlk32B/P2dEmJ5/fRPRsVSQxrkVSkOw==
X-Gm-Message-State: AOJu0YwnKDqvtLsDx2sYo/rYPbBWOo/uHvjbKgVvFd8AsE88l0XMwc4y
	UR38bf88nLiHfq1ymr7dZ8wUu0lil/09TOJ7UbuzTeYaem91rEGT
X-Google-Smtp-Source: AGHT+IGNfpNipMHjmIc+pFIj+CRSoFrKLO8Cb8pKNRWVtjc4Z6kyX5GQAo+Gzgy471LNtik2S78wqg==
X-Received: by 2002:a05:6808:1824:b0:3d5:2bb7:850 with SMTP id 5614622812f47-3d54594d8a6mr16698022b6e.5.1719532745552;
        Thu, 27 Jun 2024 16:59:05 -0700 (PDT)
Received: from [10.1.1.24] (222-152-175-63-fibre.sparkbb.co.nz. [222.152.175.63])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-708043b70a6sm291327b3a.150.2024.06.27.16.59.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2024 16:59:05 -0700 (PDT)
Subject: Re: m68k 54418 fails to execute user space
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 linux-m68k@lists.linux-m68k.org, linux-mm@kvack.org,
 linux-mtd@lists.infradead.org
References: <c252ab82-dc4a-4267-84c3-4a20471524c5@yoseli.org>
 <735e19b6-3747-417f-ba5b-1a7da137a3a3@yoseli.org>
 <7fb2988d-ab89-405f-8cf1-edcdd2196376@gmail.com>
 <a7084eac-b92a-4ddb-a079-f4a600b93f8e@yoseli.org>
 <c7235957-1f00-40dd-a78a-925b0b943ec7@gmail.com>
 <57879ac8-eaf5-48f1-b4ef-6619d9108440@yoseli.org>
Cc: Greg Ungerer <gerg@linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Christoph Hellwig <hch@infradead.org>, wbx@openadk.org
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <d66e2daa-8b31-727f-bd66-6976b0bc0130@gmail.com>
Date: Fri, 28 Jun 2024 11:58:58 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <57879ac8-eaf5-48f1-b4ef-6619d9108440@yoseli.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_165907_286737_F93269A9 
X-CRM114-Status: GOOD (  30.98  )
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

Jean-Michel,

Am 28.06.2024 um 00:36 schrieb Jean-Michel Hautbois:
>>>  ./scripts/decode_stacktrace.sh vmlinux < /tmp/trace.log
>>> [    3.857000] Run /bin/bash as init process
>>> [    3.858000]   with arguments:
>>> [    3.861000]     /bin/bash
>>> [    3.862000]   with environment:
>>> [    3.863000]     HOME=/
>>> [    3.864000]     TERM=linux
>>> [    4.242000] do page fault:
>>> [    4.242000] regs->sr=0x2000, regs->pc=0x41366924,
>>> address=0x700b3364, 2, 41fb0000
>>> [    4.242000] Kernel panic - not syncing: page fault error
>>> [    4.242000] CPU: 0 PID: 1 Comm: bash Not tainted
>>> 6.10.0-rc5-g927da6cf01fe-dirty #25
>>> [    4.242000] Stack from 4186dda8:
>>> [    4.242000]         4186dda8 41423aa4 41423aa4 700b3300 00000001
>>> 00000000 4136ee10 41423aa4
>>> [    4.242000]         41366d7a 700b3364 700b3364 00000000 0000000d
>>> 4186de60 41fb0000 41d51a60
>>> [    4.242000]         41005696 41416a90 41416a4d 00002000 41366924
>>> 700b3364 00000002 41fb0000
>>> [    4.242000]         0000000a 700b3364 00000000 0000000d 00000012
>>> 41d51a00 4186de60 41d51a60
>>> [    4.242000]         41fb81c0 41d51a60 410052fe 4100529a 4186de60
>>> 700b3364 00000002 00000000
>>> [    4.242000]         700bc414 00000003 00008000 700ac000 41003660
>>> 4186de60 00000000 00000000
>>> [    4.242000] Call Trace: dump_stack (lib/dump_stack.c:124)
>>> [    4.242000] panic (kernel/panic.c:266 kernel/panic.c:368)
>>> [    4.242000] do_page_fault (arch/m68k/mm/fault.c:88 (discriminator 1))
>>> [    4.242000] __clear_user (arch/m68k/lib/uaccess.c:108)
>>> [    4.242000] buserr_c (arch/m68k/kernel/traps.c:725
>>> arch/m68k/kernel/traps.c:775)
>>> [    4.242000] buserr_c (arch/m68k/kernel/traps.c:748
>>> arch/m68k/kernel/traps.c:775)
>>> [    4.242000] buserr (arch/m68k/kernel/entry.S:116)
>>> [    4.242000] ma_slots (lib/maple_tree.c:759)
>>> [    4.242000] __clear_user (arch/m68k/lib/uaccess.c:108)
>>> [    4.242000] elf_load (fs/binfmt_elf.c:125 (discriminator 1)
>>> fs/binfmt_elf.c:421 (discriminator 1))
>>> [    4.242000] load_elf_binary (fs/binfmt_elf.c:1132)
>>> [    4.242000] memset (arch/m68k/lib/memset.c:11)
>>> [    4.242000] load_misc_binary (fs/binfmt_misc.c:97
>>> fs/binfmt_misc.c:146 fs/binfmt_misc.c:213)
>>> [    4.242000] memset (arch/m68k/lib/memset.c:11)
>>> [    4.242000] bprm_execve (fs/exec.c:1797 fs/exec.c:1839
>>> fs/exec.c:1891 fs/exec.c:1867)
>>> [    4.242000] copy_strings_kernel (fs/exec.c:669)
>>> [    4.242000] count_strings_kernel (fs/exec.c:473)
>>> [    4.242000] kernel_execve (fs/exec.c:2058)
>>> [    4.242000] __dynamic_pr_debug (lib/dynamic_debug.c:865)
>>> [    4.242000] run_init_process (init/main.c:1389)
>>> [    4.242000] _printk (kernel/printk/printk.c:2365)
>>> [    4.242000] kernel_init (init/main.c:1508)
>>> [    4.242000] kernel_init (init/main.c:1459)
>>> [    4.242000] ret_from_kernel_thread (arch/m68k/kernel/entry.S:142)
>>> [    4.242000]
>>> [    4.242000] ---[ end Kernel panic - not syncing: page fault error
>>> ]---
>>>
>>> Looks like a memory mapping failure, but why ?
>>> My JTAG at this point dumps a list of 0s at 0x41fb0000 and my SDRAM
>>> starts at 0x40000000 and ends at 0x50000000 (256MB).
>> 0x41fb0000 seems to be init's page directory. The fault address is in
>> the range where I'd expect dynamic libraries to reside.
>>>
>>> It looks like a TLB write miss which is obscure to me :-).
>>>
>>> I tried to use the /proc but as expected it is not alive after
>>> mounting it.
>>
>> The memory map ought to be accessible through sysrq - an alternative
>> would be to modify the ELF binfmt handler and dump the map once ld.so
>> has finished with relocations.
>
> I added a dump in the binfmt_elf file:
> diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
> index a43897b03ce9..395f556f3a90 100644
> --- a/fs/binfmt_elf.c
> +++ b/fs/binfmt_elf.c
> @@ -816,6 +816,63 @@ static int parse_elf_properties(struct file *f,
> const struct elf_phdr *phdr,
>         return ret == -ENOENT ? 0 : ret;
>  }
>
> +static int dump_memory_map(struct task_struct *task)
> +{
> +    struct mm_struct *mm = task->mm;
> +    struct vm_area_struct *vma;
> +       MA_STATE(mas, &mm->mm_mt, 0, -1);
> +    struct file *file;
> +    struct path *path;
> +    char *buf;
> +    char *pathname;
> +
> +    // Acquire the read lock for mmap_lock
> +    down_read(&mm->mmap_lock);
> +       mas_lock(&mas);
> +    for (vma = mas_find(&mas, ULONG_MAX); vma; vma = mas_find(&mas,
> ULONG_MAX)) {
> +        if (vma->vm_file) {
> +            buf = (char *)__get_free_page(GFP_KERNEL);
> +            if (!buf) {
> +                continue; // Handle memory allocation failure
> +            }
> +
> +            file = vma->vm_file;
> +            path = &file->f_path;
> +            pathname = d_path(path, buf, PAGE_SIZE);
> +            if (IS_ERR(pathname)) {
> +                pathname = NULL;
> +            }
> +
> +            pr_info("%lx-%lx %c%c%c%c %08lx %02x:%02x %lu %s\n",
> +                vma->vm_start, vma->vm_end,
> +                vma->vm_flags & VM_READ ? 'r' : '-',
> +                vma->vm_flags & VM_WRITE ? 'w' : '-',
> +                vma->vm_flags & VM_EXEC ? 'x' : '-',
> +                vma->vm_flags & VM_MAYSHARE ? 's' : 'p',
> +                vma->vm_pgoff << PAGE_SHIFT,
> +                MAJOR(file->f_inode->i_rdev),
> +                MINOR(file->f_inode->i_rdev),
> +                file->f_inode->i_ino,
> +                pathname ? pathname : "");
> +
> +            free_page((unsigned long)buf);
> +        } else {
> +            pr_info("%lx-%lx %c%c%c%c %08lx 00:00 0\n",
> +                vma->vm_start, vma->vm_end,
> +                vma->vm_flags & VM_READ ? 'r' : '-',
> +                vma->vm_flags & VM_WRITE ? 'w' : '-',
> +                vma->vm_flags & VM_EXEC ? 'x' : '-',
> +                vma->vm_flags & VM_MAYSHARE ? 's' : 'p',
> +                vma->vm_pgoff << PAGE_SHIFT);
> +        }
> +    }
> +       mas_unlock(&mas);
> +    // Release the read lock for mmap_lock
> +    up_read(&mm->mmap_lock);
> +
> +    return 0;
> +}
> +
>  static int load_elf_binary(struct linux_binprm *bprm)
>  {
>         struct file *interpreter = NULL; /* to shut gcc up */
> @@ -1299,6 +1356,9 @@ static int load_elf_binary(struct linux_binprm *bprm)
>
>         finalize_exec(bprm);
>         START_THREAD(elf_ex, regs, elf_entry, bprm->p);
> +       if (current->pid == 1) {  // Check if this is the init process
> +            dump_memory_map(current);
> +    }
>         retval = 0;
>  out:
>         return retval;
>
> I think it is quick and dirty, but seems to do the trick.
> I then get in my console:
> [    4.265000] 60000000-6001e000 r-xp 00000000 00:00 178 /lib/ld.so.1
> [    4.266000] 6001e000-60022000 rw-p 0001c000 00:00 178 /lib/ld.so.1
> [    4.267000] 70000000-700ac000 r-xp 00000000 00:00 27 /bin/bash
> [    4.268000] 700ac000-700b4000 rw-p 000ac000 00:00 27 /bin/bash
> [    4.269000] 700b4000-700be000 rwxp 700b4000 00:00 0
> [    4.270000] bfe7a000-bfe9c000 rw-p bffde000 00:00 0
>
> But nothing rings a bell at this level for me...

You are again using bash as init process, so the process of interest 
(/bin/ls) is a child of init and does not get logged here.

But we are getting some mapping information at last. No shared libraries 
mapped as yet, but that's the same in Greg's dump.

Comparing with what I get from cat /proc/1/maps on a 030 system., the 
rwxp section at 0x700b4000 is the process heap, and the rwp section at 
0xbfe7a000 is the process stack.

I forgot to take into account that libraries are loaded only the binary 
starts executing. Can you print the same map dump in the exit syscall 
code path? That ought to show all loaded libraries at that point.

Cheers,

	Michael


> Thanks !

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
