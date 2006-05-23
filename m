Received: from tyo201.gate.nec.co.jp ([202.32.8.193])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FiO9J-0000yb-OT
	for linux-mtd@lists.infradead.org; Tue, 23 May 2006 00:05:43 -0400
Message-ID: <447289EC.5060808@ak.jp.nec.com>
Date: Tue, 23 May 2006 13:05:00 +0900
From: KaiGai Kohei <kaigai@ak.jp.nec.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <1148312215.12285.79.camel@pmac.infradead.org>	
	<44726D13.3000905@ak.jp.nec.com>
	<1148351162.10288.58.camel@shinybook.infradead.org>
In-Reply-To: <1148351162.10288.58.camel@shinybook.infradead.org>
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: struct jffs2_xattr_datum/jffs2_xattr_ref/jffs2_inode_cache
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>> By the way, I have a question about an usage for jffs2_reserve_space().
>>
>> Is it permitted to allocate a space for multi nodes by a single
>> calling of jffs2_reserve_space()?
>> I tried to allocate a space for xattr_datum and xattr_ref by a single
>> calling of jffs2_reserve_space(), and it seems to work without any
>> troubles.
> 
> Yes, it works. But if you have space for just the xattr_datum at the end
> of the eraseblock, it's better to write that in the available space and
> then write the xattr_ref to the next eraseblock.

OK, I agreed an increasion of wasted size should be avoided if possible.

> By the way, we should implement support for retrying writes in
> save_xattr_datum() and save_xattr_ref(). See how jffs2_write_dnode() and
> jffs2_write_dirent() do it, for example.

When we implement support for retrying write in those functions,
xattr_sem must be released once at least. If there is no problem
related to exclusion, I'll adopt retrying approach.

Currently, I'm checking whether it's safe or not.

Thanks,
-- 
Open Source Software Promotion Center, NEC
KaiGai Kohei <kaigai@ak.jp.nec.com>
