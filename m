Received: from ug-out-1314.google.com ([66.249.92.169])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JxyAN-00054d-Oc
	for linux-mtd@lists.infradead.org; Mon, 19 May 2008 05:44:12 +0000
Received: by ug-out-1314.google.com with SMTP id m2so347069ugc.45
	for <linux-mtd@lists.infradead.org>;
	Sun, 18 May 2008 22:44:09 -0700 (PDT)
Message-ID: <90d987c0805182244s2d7f0976l4f82386aa5e1b32d@mail.gmail.com>
Date: Mon, 19 May 2008 11:14:09 +0530
From: "rohit h" <hrohit85@gmail.com>
To: "Adrian Hunter" <ext-adrian.hunter@nokia.com>
Subject: Re: [JFFS2] Running fsstress causes panic
In-Reply-To: <482D7810.7000804@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <90d987c0805160411r436dec1es61fb820e8238be4@mail.gmail.com>
	<482D7810.7000804@nokia.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, May 16, 2008 at 5:33 PM, Adrian Hunter
<ext-adrian.hunter@nokia.com> wrote:
> rohit h wrote:
>>
>> Hello all,
>>  I am running a filesystem testing utility 'fsstress' on JFFS2 running
>> over a 80MB OneNAND partition.
>>  The fsstress command line used is 'fsstress -p 3 -n 1000000 -d /tmp -l 0
>> &'
>>  This creates 3 processes with each process executing 1000000 operations.
>>  The testing board has 64MB of RAM.
>>  After around 5 hours, I get panic message pasted below.
>>  I have done the same test with the command line 'fsstress -p3 -n
>> 10000 -d /tmp -l 0 &'
>>  This test goes through for 5 days without failing, after which I
>> ended the test.
>>  Can somebody throw some light as to why this is happening.
>> Thanks a lot
>>  Rohit
>>
>>
>> fsstress invoked oom-killer: gfp_mask=0x201d2, order=0, oomkilladj=0
>> [<c0026b98>] <4>init invoked oom-killer: gfp_mask=0x201d2, order=0,
>> oomkilladj=0
>> [<c0026b98>] (dump_stack+0x0/0x14) from [<c006b31c>]
>> (out_of_memory+0x7c/0x224)
>> [<c006b2a0>] (out_of_memory+0x0/0x224) from [<c006c944>]
>> (__alloc_pages+0x24c/0x2d8)
>> r8:c0566820 r7:c0285f80 r6:000201d2 r5:00000000 r4:00000000
>> [<c006c6f8>] (__alloc_pages+0x0/0x2d8) from [<c00687a0>]
>> (page_cache_read+0x44/0xb4)
>> [<c006875c>] (page_cache_read+0x0/0xb4) from [<c0068a48>]
>> (filemap_nopage+0x238/0x3bc)
>> r8:000000cc r7:00000000 r6:00127edc r5:c056a000 r4:00000000
>> [<c0068810>] (filemap_nopage+0x0/0x3bc) from [<c00765cc>]
>> (__handle_mm_fault+0x17c/0xb24)
>> [<c0076450>] (__handle_mm_fault+0x0/0xb24) from [<c002836c>]
>> (do_page_fault+0xe8/0x218)
>> [<c0028284>] (do_page_fault+0x0/0x218) from [<c00284bc>]
>> (do_translation_fault+0x20/0x7c)
>> [<c002849c>] (do_translation_fault+0x0/0x7c) from [<c002227c>]
>> (do_PrefetchAbort+0x18/0x1c)
>> r5:000169c0 r4:ffffffff
>> [<c0022264>] (do_PrefetchAbort+0x0/0x1c) from [<c0022e40>]
>> (ret_from_exception+0x0/0x10)
>> Exception stack(0xc056bfb0 to 0xc056bff8)
>> bfa0:                                     00000003 0000e118 beafa8c8
>> 00000000
>> bfc0: beafa8c8 000169c0 10000000 beafaba8 beafabac 0000a1a0 000167ec
>> 000167d8
>> bfe0: 000166e0 beafa8bc 0000c440 400ec344 60000010 ffffffff
>
> Are you using tmpfs?  It uses virtual memory.  Maybe it is sized too big, or
> maybe /tmp has too much in it to start with.
>
>
tmpfs is not mounted. Also I erase the partition before mounting JFFS2 on it.
How can I know who is consuming memory which causes oom-killer - is it
fsstress, it is JFFS2?
Could there be a way to find memory usage of JFFS2?
Thanks
 Rohit
