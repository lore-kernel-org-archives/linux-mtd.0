Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E89AC30653
	for <linux-mtd@archiver.kernel.org>; Sat, 29 Jun 2024 03:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:Cc:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LCnUxPAQJAfMetL8yc5/XzH4m1sTj8VKQR3hNRXdKHo=; b=S/VhgDl3Gf9PJ0m8ceqAGVDBPR
	doOGVw43hH6fPCbffcysgcOxUeQa0sWoWEdBee9nJ2G1AVqwu18T84LXJW0PNZVqDOtV5EWeltDdo
	JaZjbvKoVY3RVZz8sdJjG7o5xgxOhpamrUuIR4LCiL3XPwb3XV38sYFi1nyeKUo+LojKE70fA7qjh
	A86EMjII98BBvT95RSuvpUCE5qu9pBwJ3S2kx1bN+74n2ChyzhXgorXZOL7Sg7S6bTo7KvpBNmzog
	Gl5wx1J6s8RGPlpoj2aCn9xhu9wCU4425YjHV6EdRvQeSAdypAa+UK4Io0Tv/BjgmWM8A9A+WElT9
	KbFeMUdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNOyT-0000000Fm2o-3mqH;
	Sat, 29 Jun 2024 03:42:05 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNOyP-0000000Fm1c-3et0
	for linux-mtd@lists.infradead.org;
	Sat, 29 Jun 2024 03:42:03 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-25d584e9fe6so699886fac.1
        for <linux-mtd@lists.infradead.org>; Fri, 28 Jun 2024 20:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719632519; x=1720237319; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YBLSANnlMJVSSdpHwO7eKO9moXDMiFwLdQyag1HDNp4=;
        b=lPTxiVDv0Q3Pz006TlGjwcQ8WiIAP6/Q3i76+esi/1tuEasYCOVBnUHn3zP2ZtJSQZ
         yt6p600Fg0pxviekK0LeLbrIC1Fk2jcbs5n6SqxQdVQ2ub0LqGBbo6J+9EldBi84B5xS
         Xk4jJ0gz7qPcs8ilmNNFujf8AVBTLJWdLPOzMsqBfsow8kIgkR2wKTtv43/VgiAzqArX
         CdUc5sPAMGQDnKfqu92sP5RfgjIhj4DaL0FdALqSHtOV0FgqY888L5HaX+NluH0YejQd
         JMiDrJB2OAqAS5jBfFD3LF7Yi85eiKuO59+8GXGr3CptsF9wRm1fpcajgCjOkUBvtNt3
         /gUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719632519; x=1720237319;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YBLSANnlMJVSSdpHwO7eKO9moXDMiFwLdQyag1HDNp4=;
        b=rY1SCMm5e/X4yQdC2dg4RZLepSQoh6eD+frx1zDMHMlC5wQs5xQAomp7PL3on0efOU
         1elcPhTL3IzpUoGZyFuPwoyqWatzuOfViUzLgF4fc4QlCtWFdzS1e3z7cYZdmyQxH9Yf
         XaXrlLwb3uFwbMGXXlAYzZcMChIYHOEKsUnKj0eQ6739XYnvjc2u9SRavBtfcZ2LTEY1
         Xr0ZKMmyUHH8tsL6ts6MJTJlEdmk/dIbJTKvf4PZe90d6XOJLpmUFYAD0l9AujSvRsZf
         f6mfw5XQ53MuhsuKlCCjpaqTZ57Vc/VWHLruXiP5Jn0wpteRSmDepu3Ej2R+QFOqRLL/
         xitQ==
X-Forwarded-Encrypted: i=1; AJvYcCV93eUYpAYpPJsdg/xEQ6JKgXD0XDTFZSVyYtn5pc5NoaWnw54jV277Nc/IdIrsiL2WCuboRf7e8WFAcR0jIbgkDYVy0SWPWzaJwV5+xw==
X-Gm-Message-State: AOJu0YyJFs6hm8IZirEUmv91QiRRIQGHCDJy0QRQXtrjkaoiQjWO86Jy
	nG8EmOqQhauS3Cj4+0ehcbuWsrcZ3+jpOfg0IMYxpGTzkEx8Hqek
X-Google-Smtp-Source: AGHT+IHopYJuR1eIbvKyZyMp4Pcz7PLjz7OJmzdAbGSrM508Owph07yiysxV1DgPe+KdYHvAIxsoaA==
X-Received: by 2002:a05:6358:7254:b0:1a2:dfc3:4200 with SMTP id e5c5f4694b2df-1a6acf79842mr13830855d.24.1719632519293;
        Fri, 28 Jun 2024 20:41:59 -0700 (PDT)
Received: from [10.1.1.24] (222-152-175-63-fibre.sparkbb.co.nz. [222.152.175.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c91d3e776esm2401923a91.50.2024.06.28.20.41.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 28 Jun 2024 20:41:58 -0700 (PDT)
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
 <d66e2daa-8b31-727f-bd66-6976b0bc0130@gmail.com>
 <ce18844d-9a93-40c7-9ac6-b49b8f823c47@yoseli.org>
 <64c30829-499d-fb48-16ee-891f8d8c443a@gmail.com>
 <04ffd421-28e8-4bde-b44b-e3685bed99fc@yoseli.org>
Cc: Greg Ungerer <gerg@linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Christoph Hellwig <hch@infradead.org>, wbx@openadk.org
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <8ba7fa44-876e-5f7b-70c8-e8a5499db2a4@gmail.com>
Date: Sat, 29 Jun 2024 15:41:50 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <04ffd421-28e8-4bde-b44b-e3685bed99fc@yoseli.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_204201_960590_336936F9 
X-CRM114-Status: GOOD (  21.40  )
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

Am 28.06.2024 um 23:25 schrieb Jean-Michel Hautbois:
>>
>> No heap in this second call. Can you print mm->start_brk and mm->brk
>> please?
>>
>> The process memory layout is a little unusual (I would have expected
>> the binary to be mapped before the dynamic libraries, not after). Is
>> that expected on Coldfire, Greg?
>>
>
> I did the test, and called ls twice to see what differs:
> bash-5.2# ls -l > /dev/null
> load_elf_binary: Dump memory for ls (31):
> mmap: start_brk: 700ca000, brk: 700ca000
> mmap: 60000000-6001e000 r-xp 00000000 00:00 178 /lib/ld.so.1
> mmap: 6001e000-60022000 rw-p 0001c000 00:00 178 /lib/ld.so.1
> mmap: 70000000-700c2000 r-xp 00000000 00:00 28 /bin/busybox
> mmap: 700c2000-700ca000 rw-p 000c0000 00:00 28 /bin/busybox
> mmap: bfa48000-bfa6a000 rw-p bffde000 00:00 0 [stack]
> do_exit: Dump memory for ls (31):
> mmap: start_brk: 700ca000, brk: 700ec000

ls managed to allocate heap space OK ...

> mmap: 60000000-6001e000 r-xp 00000000 00:00 178 /lib/ld.so.1
> mmap: 6001e000-60020000 r--p 0001c000 00:00 178 /lib/ld.so.1
> mmap: 60020000-60022000 rw-p 0001e000 00:00 178 /lib/ld.so.1
> mmap: 60022000-6002c000 r-xp 00000000 00:00 193 /lib/libresolv.so.2
> mmap: 6002c000-6002e000 r--p 00008000 00:00 193 /lib/libresolv.so.2
> mmap: 6002e000-60030000 rw-p 0000a000 00:00 193 /lib/libresolv.so.2
> mmap: 60030000-60032000 rw-p 60030000 00:00 0
> mmap: 60032000-6015a000 r-xp 00000000 00:00 185 /lib/libc.so.6
> mmap: 6015a000-6015c000 r--p 00126000 00:00 185 /lib/libc.so.6
> mmap: 6015c000-60160000 rw-p 00128000 00:00 185 /lib/libc.so.6
> mmap: 60160000-6016e000 rw-p 60160000 00:00 0
> mmap: 70000000-700c2000 r-xp 00000000 00:00 28 /bin/busybox
> mmap: 700c2000-700c4000 r--p 000c0000 00:00 28 /bin/busybox
> mmap: 700c4000-700ca000 rw-p 000c2000 00:00 28 /bin/busybox
> mmap: 700ca000-700ec000 rwxp 700ca000 00:00 0 [heap]
> mmap: bfa48000-bfa6a000 rw-p bffde000 00:00 0 [stack]
> bash-5.2# ls -l > /dev/null
> load_elf_binary: Dump memory for ls (33):
> mmap: start_brk: 700ca000, brk: 700ca000
> mmap: 60000000-6001e000 r-xp 00000000 00:00 178 /lib/ld.so.1
> mmap: 6001e000-60022000 rw-p 0001c000 00:00 178 /lib/ld.so.1
> mmap: 70000000-700c2000 r-xp 00000000 00:00 28 /bin/busybox
> mmap: 700c2000-700ca000 rw-p 000c0000 00:00 28 /bin/busybox
> mmap: bf894000-bf8b6000 rw-p bffde000 00:00 0 [stack]
> do_exit: Dump memory for ls (33):
> mmap: start_brk: 700ca000, brk: 700ca000

No heap space allocated here. I would have expected that to cause an 
error message from libc ...

Can you print a brief meminfo summary such as found in fs/proc/meminfo.c 
(total, free, available, buffer and cached for starters)?

Cheers,

	Michael


> mmap: 60000000-6001e000 r-xp 00000000 00:00 178 /lib/ld.so.1
> mmap: 6001e000-60020000 r--p 0001c000 00:00 178 /lib/ld.so.1
> mmap: 60020000-60022000 rw-p 0001e000 00:00 178 /lib/ld.so.1
> mmap: 60022000-6002c000 r-xp 00000000 00:00 193 /lib/libresolv.so.2
> mmap: 6002c000-6002e000 r--p 00008000 00:00 193 /lib/libresolv.so.2
> mmap: 6002e000-60030000 rw-p 0000a000 00:00 193 /lib/libresolv.so.2
> mmap: 60030000-60032000 rw-p 60030000 00:00 0
> mmap: 60032000-6015a000 r-xp 00000000 00:00 185 /lib/libc.so.6
> mmap: 6015a000-6015c000 r--p 00126000 00:00 185 /lib/libc.so.6
> mmap: 6015c000-60160000 rw-p 00128000 00:00 185 /lib/libc.so.6
> mmap: 60160000-6016e000 rw-p 60160000 00:00 0
> mmap: 70000000-700c2000 r-xp 00000000 00:00 28 /bin/busybox
> mmap: 700c2000-700c4000 r--p 000c0000 00:00 28 /bin/busybox
> mmap: 700c4000-700ca000 rw-p 000c2000 00:00 28 /bin/busybox
> mmap: bf894000-bf8b6000 rw-p bffde000 00:00 0 [stack]
>
> The second time, there seems to be no heap...
>
> JM
>
>> Cheers,
>>
>>      Michael
>>
>>
>>> mmap: bfb5a000-bfb7c000 rw-p bffde000 00:00 0 [stack]
>>>
>>> The first call generates the "ls" output, not the second one.
>>> The helper looks like:
>>> diff --git a/mm/mmap.c b/mm/mmap.c
>>> index 83b4682ec85c..14d861e9cba2 100644
>>> --- a/mm/mmap.c
>>> +++ b/mm/mmap.c
>>> @@ -76,6 +76,87 @@ int mmap_rnd_compat_bits __read_mostly =
>>> CONFIG_ARCH_MMAP_RND_COMPAT_BITS;
>>>  static bool ignore_rlimit_data;
>>>  core_param(ignore_rlimit_data, ignore_rlimit_data, bool, 0644);
>>>
>>> +int dump_memory_map(struct task_struct *task)
>>> +{
>>> +    struct mm_struct *mm = task->mm;
>>> +    struct vm_area_struct *vma;
>>> +    struct file *file;
>>> +    struct path *path;
>>> +    char *buf;
>>> +    char *pathname;
>>> +
>>> +       if (!mm) {
>>> +               return -ENOMEM;
>>> +       }
>>> +
>>> +       MA_STATE(mas, &mm->mm_mt, 0, -1);
>>> +    // Acquire the read lock for mmap_lock
>>> +    down_read(&mm->mmap_lock);
>>> +       mas_lock(&mas);
>>> +       for (vma = mas_find(&mas, ULONG_MAX); vma; vma = mas_find(&mas,
>>> ULONG_MAX)) {
>>> +               char perms[5] = "---p"; // Default permissions
>>> +               // Set permissions based on vm_flags
>>> +               if (vma->vm_flags & VM_READ) perms[0] = 'r';
>>> +               if (vma->vm_flags & VM_WRITE) perms[1] = 'w';
>>> +               if (vma->vm_flags & VM_EXEC) perms[2] = 'x';
>>> +               if (vma->vm_flags & VM_MAYSHARE) perms[3] = 's';
>>> +
>>> +               if (vma->vm_file) { // If there's an associated file
>>> +                       buf = (char *)__get_free_page(GFP_KERNEL);
>>> +                       if (!buf) {
>>> +                               continue; // Handle memory allocation
>>> failure
>>> +                       }
>>> +
>>> +                       file = vma->vm_file;
>>> +                       path = &file->f_path;
>>> +                       pathname = d_path(path, buf, PAGE_SIZE);
>>> +                       if (IS_ERR(pathname)) {
>>> +                               pathname = NULL;
>>> +                       }
>>> +
>>> +                       // Print memory area information with file path
>>> +                       pr_info("%08lx-%08lx %s %08lx %02x:%02x %lu
>>> %s\n",
>>> +                               vma->vm_start, vma->vm_end,
>>> +                               perms,
>>> +                               vma->vm_pgoff << PAGE_SHIFT,
>>> +                               MAJOR(file_inode(file)->i_rdev),
>>> +                               MINOR(file_inode(file)->i_rdev),
>>> +                               file_inode(file)->i_ino,
>>> +                               pathname ? pathname : "");
>>> +
>>> +                       free_page((unsigned long)buf);
>>> +               } else {
>>> +                       char *special_area_name = NULL;
>>> +
>>> +                       // Check for heap
>>> +                       if (vma->vm_end > mm->start_brk && vma->vm_start
>>> < mm->brk) {
>>> +                               special_area_name = "[heap]";
>>> +                       }
>>> +                       // Check for stack
>>> +                       else if (vma->vm_start <= mm->start_stack &&
>>> vma->vm_end >= mm->start_stack) {
>>> +                               special_area_name = "[stack]";
>>> +                       }
>>> +                       // Check for vdso
>>> +                       else if (vma->vm_flags & VM_EXEC &&
>>> vma->vm_flags & VM_READ && !vma->vm_file) {
>>> +                               special_area_name = "[vdso]";
>>> +                       }
>>> +
>>> +                       // Print memory area information without file
>>> path
>>> +                       pr_info("%08lx-%08lx %s %08lx 00:00 0 %s\n",
>>> +                               vma->vm_start, vma->vm_end,
>>> +                               perms,
>>> +                               vma->vm_pgoff << PAGE_SHIFT,
>>> +                               special_area_name ? special_area_name :
>>> "    ");
>>> +               }
>>> +       }
>>> +       mas_unlock(&mas);
>>> +    // Release the read lock for mmap_lock
>>> +    up_read(&mm->mmap_lock);
>>> +
>>> +    return 0;
>>> +}
>>> +EXPORT_SYMBOL(dump_memory_map);
>>>
>>>
>>> Thanks,
>>> JM

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
