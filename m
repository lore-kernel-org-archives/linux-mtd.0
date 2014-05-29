Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WpuzQ-0006nc-Dv
 for linux-mtd@lists.infradead.org; Thu, 29 May 2014 07:43:04 +0000
Message-ID: <1401349355.11182.40.camel@sauron.fi.intel.com>
Subject: Re: ubifs: assertion fails
From: Artem Bityutskiy <dedekind1@gmail.com>
To: hujianyang <hujianyang@huawei.com>
Date: Thu, 29 May 2014 10:42:35 +0300
In-Reply-To: <538693AD.5070606@huawei.com>
References: <f08bbebef039d5bb28c2fcd3022165b0.squirrel@www.codeaurora.org>
 <1396260879.9016.70.camel@sauron.fi.intel.com>
 <533A5407.4060900@codeaurora.org>
 <1396871016.17040.33.camel@sauron.fi.intel.com>
 <789ed0034a7f4aa993addb2bc8c7e914.squirrel@www.codeaurora.org>
 <538693AD.5070606@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Dolev Raviv <draviv@codeaurora.org>,
 linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2014-05-29 at 09:55 +0800, hujianyang wrote:
> Hi Dolev and Artem,
> 
> I hit the same assert failed in Kernel v3.10 shows like this:
> 
> [ 9641.164028] UBIFS assert failed in shrink_tnc at 131 (pid 13297)
> [ 9641.234078] CPU: 1 PID: 13297 Comm: mmap.test Tainted: G           O 3.10.40 #1
> [ 9641.234116] [<c0011a6c>] (unwind_backtrace+0x0/0x12c) from [<c000d0b0>] (show_stack+0x20/0x24)
> [ 9641.234137] [<c000d0b0>] (show_stack+0x20/0x24) from [<c0311134>] (dump_stack+0x20/0x28)
> [ 9641.234188] [<c0311134>] (dump_stack+0x20/0x28) from [<bf22425c>] (shrink_tnc_trees+0x25c/0x350 [ubifs])
> [ 9641.234265] [<bf22425c>] (shrink_tnc_trees+0x25c/0x350 [ubifs]) from [<bf2245ac>] (ubifs_shrinker+0x25c/0x310 [ubifs])
> [ 9641.234307] [<bf2245ac>] (ubifs_shrinker+0x25c/0x310 [ubifs]) from [<c00cdad8>] (shrink_slab+0x1d4/0x2f8)
> [ 9641.234327] [<c00cdad8>] (shrink_slab+0x1d4/0x2f8) from [<c00d03d0>] (do_try_to_free_pages+0x300/0x544)
> [ 9641.234344] [<c00d03d0>] (do_try_to_free_pages+0x300/0x544) from [<c00d0a44>] (try_to_free_pages+0x2d0/0x398)
> [ 9641.234363] [<c00d0a44>] (try_to_free_pages+0x2d0/0x398) from [<c00c6a60>] (__alloc_pages_nodemask+0x494/0x7e8)
> [ 9641.234382] [<c00c6a60>] (__alloc_pages_nodemask+0x494/0x7e8) from [<c00f62d8>] (new_slab+0x78/0x238)
> [ 9641.234400] [<c00f62d8>] (new_slab+0x78/0x238) from [<c031081c>] (__slab_alloc.constprop.42+0x1a4/0x50c)
> [ 9641.234419] [<c031081c>] (__slab_alloc.constprop.42+0x1a4/0x50c) from [<c00f80e8>] (kmem_cache_alloc_trace+0x54/0x188)
> [ 9641.234459] [<c00f80e8>] (kmem_cache_alloc_trace+0x54/0x188) from [<bf227908>] (do_readpage+0x168/0x468 [ubifs])
> [ 9641.234553] [<bf227908>] (do_readpage+0x168/0x468 [ubifs]) from [<bf2296a0>] (ubifs_readpage+0x424/0x464 [ubifs])
> [ 9641.234606] [<bf2296a0>] (ubifs_readpage+0x424/0x464 [ubifs]) from [<c00c17c0>] (filemap_fault+0x304/0x418)
> [ 9641.234638] [<c00c17c0>] (filemap_fault+0x304/0x418) from [<c00de694>] (__do_fault+0xd4/0x530)
> [ 9641.234665] [<c00de694>] (__do_fault+0xd4/0x530) from [<c00e10c0>] (handle_pte_fault+0x480/0xf54)
> [ 9641.234690] [<c00e10c0>] (handle_pte_fault+0x480/0xf54) from [<c00e2bf8>] (handle_mm_fault+0x140/0x184)
> [ 9641.234716] [<c00e2bf8>] (handle_mm_fault+0x140/0x184) from [<c0316688>] (do_page_fault+0x150/0x3ac)
> [ 9641.234737] [<c0316688>] (do_page_fault+0x150/0x3ac) from [<c000842c>] (do_DataAbort+0x3c/0xa0)
> [ 9641.234759] [<c000842c>] (do_DataAbort+0x3c/0xa0) from [<c0314e38>] (__dabt_usr+0x38/0x40)
> 
> Did you fix it in recent patches? If not, I will take some times
> on it.

I did not. I know there are issues in shrinker, but I never have time to
investigate them. 

For example, I remember I tried to emulate memory pressure by limiting
the amount of memory available to Linux using 'mem=' boot parameter, and
writing a fake module which just keeps allocating and then freeing a lot
of memory using kmalloc in a loop with a small delay. And I was running
UBIFS stress test.

This way I made sure UBIFS shrinker is called often.

And I saw some oopes, but did not have time to investigate. And this was
3 years ago, so may be this is not longer the case.

-- 
Best Regards,
Artem Bityutskiy
