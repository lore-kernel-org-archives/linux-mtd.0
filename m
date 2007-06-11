Subject: Re: JFFS2 deadlock with alloc_sem
From: David Woodhouse <dwmw2@infradead.org>
To: Dave Kleikamp <shaggy@linux.vnet.ibm.com>
In-Reply-To: <1181330764.10571.34.camel@kleikamp.austin.ibm.com>
References: <1181330764.10571.34.camel@kleikamp.austin.ibm.com>
Content-Type: text/plain
Date: Mon, 11 Jun 2007 13:14:19 +0100
Message-Id: <1181564059.2801.93.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Nathan.Roberts@motorola.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2007-06-08 at 14:26 -0500, Dave Kleikamp wrote:
> Forgive me for not following up properly, but I'm not on the mailing
> list, and I'm following up from the archives. 

Hm, sorry about that. The archives should be fixed (again) now -- if you
use the mailto: link at the top of an archived mail such as the one at
http://lists.infradead.org/pipermail/linux-mtd/2007-June/018477.html
your response should have a correct In-Reply-To: header and be part of
the thread.

> What do you think of this patch, and does it have any affect on
> Nathan's deadlock?

It looks sensible. Nathan?

> Note: If this works out, jffs2_readpage and jffs2_do_readpage_unlock
> can probably be collapsed into one function.

Yeah. And the ordering of f->sem vs. page locking should be documented
in README.Locking, now that we actually have rules for it :)

-- 
dwmw2
