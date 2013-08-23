In-Reply-To: <000a01ce8ccc$8ae14840$1c214a0a@ztedengchao>
References: <000a01ce8ccc$8ae14840$1c214a0a@ztedengchao>
To: deng.chao1@zte.com.cn
MIME-Version: 1.0
Subject: Re: [JFFS2]The patch "jffs2: Fix lock acquisition order bug in
 jffs2_write_begin" introduces another dead lock bug.
From: Thomas.Betker@rohde-schwarz.com
Message-ID: <OF039421E5.05D3267C-ONC1257BD0.0071BBE2-C1257BD0.007746F1@rohde-schwarz.com>
Date: Fri, 23 Aug 2013 23:42:49 +0200
Content-Type: text/plain; charset="ISO-2022-JP"
Cc: "\"linux-mtd\"" <linux-mtd-bounces@lists.infradead.org>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, wang.bo116@zte.com.cn,
 linux-mtd@lists.infradead.org, Thomas Betker <thomas.betker@freenet.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Chao:

> Yes，my kernel actually had hit this dead lock.
> 
> My kernel's version is 2.6.32. After i merged the patch into my 
> kernel, i run my own filesystem test suite "fstess" on the kernel. 
> About 9 hours later, i found that the kernel didn't reponse any file
> operation at all. So i used magic SysRq key to show state of all 
> tasks. Finally i found this two threads' stacktraces in the SysRq 
> output as below which could prove the dead lock:

When creating the patch, I was assuming that jffs2_write_begin() and 
jffs2_write_end() could not be called at the same time (for the same 
page). Obviously, I was wrong.

Taking also into account the report by Ming Liu, I have come to the 
conclusion that page_lock() must be called _before_ c->alloc_sem or f->sem 
is acquired. In other words, my patch was a mistake; it's not 
jffs2_write_begin() that should be fixed, but 
jffs2_garbage_collect_live().

The short way out is to revert my patch, which is fine by me. However, 
this still leaves us with the original issue, i.e., the deadlock between 
jffs2_garbage_collect_live() and jffs2_write_begin(). Unfortunately, 
jffs2_garbage_collect_live() grabs f->sem right at the beginning, while 
page_lock() or __set_page_locked() is called several layers deep within 
the code. So I don't think this is an easy job.

Unfortunately, I won't be at the office in the next three weeks, so there 
isn't much I can do at the moment. If you are going to provide a fix, I 
will gladly test it when I am back.

Best regards,
Thomas
