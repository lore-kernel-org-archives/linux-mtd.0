Received: from tyo202.gate.nec.co.jp ([202.32.8.206])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fv3YS-0008K6-6G
	for linux-mtd@lists.infradead.org; Mon, 26 Jun 2006 22:44:05 -0400
Message-ID: <44A09B53.80908@ak.jp.nec.com>
Date: Tue, 27 Jun 2006 11:43:31 +0900
From: KaiGai Kohei <kaigai@ak.jp.nec.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS2/xattr problems.
References: <1148150486.3875.251.camel@pmac.infradead.org>	<44704CA9.8010604@ak.jp.nec.com>	<448CCEC8.2080903@ak.jp.nec.com>	<1150099418.11159.44.camel@shinybook.infradead.org>	<448D3752.3090605@ak.jp.nec.com>	<1150105995.8184.17.camel@pmac.infradead.org>	<448EBDE2.7090408@kaigai.gr.jp>
	<449CD47E.6010002@ak.jp.nec.com>
	<1151336716.6394.169.camel@pmac.infradead.org>
In-Reply-To: <1151336716.6394.169.camel@pmac.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: KaiGai Kohei <kaigai@kaigai.gr.jp>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse wrote:
> On Sat, 2006-06-24 at 14:58 +0900, KaiGai Kohei wrote:
>> [3/5] jffs2-xattr-v6.1-03-redefine-refcnt-as-atomic_t.patch
>>    In jffs2_release_xattr_datum(), it refers xd->refcnt to ensure
>>    whether releasing xd is allowed or not.
>>    But we can't hold xattr_sem since this function is called under
>>    spin_lock(&c->erase_completion_lock). Thus we have to refer it
>>    without any locking.
> 
> Surely c->alloc_sem is sufficient for this purpose? We can never change
> the refcount of anything without writing to the medium, so the alloc_sem
> ought to be enough.

In some cases without holding c->alloc_sem, we have a possibility to change
xd->refcnt. For example, it's changed when delete_xattr_ref() is called
from jffs2_xattr_delete_inode().
This processing pass does not write anything (includes a delete marker),
because orphan xattr_refs are certainly ignored in next mounting.


But I noticed this patch has another problem last night.
In delete_xattr_ref(), we don't hold c->erase_completion_lock before
atomic_dec_and_test(), so there is a possibility to release
a xattr_datum twice.
I think atomic_dec_and_lock() should be used in delete_xattr_datum().
If so, we can release it safely with minimum locking pain.
This behavior may be correct. Please wait a fix.

Thanks,
-- 
Open Source Software Promotion Center, NEC
KaiGai Kohei <kaigai@ak.jp.nec.com>
