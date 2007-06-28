Subject: Re: sync() takes minutes while erasing
From: David Woodhouse <dwmw2@infradead.org>
To: joakim.tjernlund@transmode.se
In-Reply-To: <1182350992.2969.128.camel@gentoo-jocke.transmode.se>
References: <1182349303.2969.122.camel@gentoo-jocke.transmode.se>
	<1182350992.2969.128.camel@gentoo-jocke.transmode.se>
Content-Type: text/plain
Date: Thu, 28 Jun 2007 19:54:21 +0100
Message-Id: <1183056861.1170.191.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2007-06-20 at 16:49 +0200, Joakim Tjernlund wrote:
> Ok, found the cause:
>  jffs2_erase_pending_blocks(c, 0) is called from
>  jffs2_write_super() and it hangs until all
>  pending erases are complete.
> 
> Why do jffs2_write_super() need to call 
> jffs2_erase_pending_blocks(c, 0)? Seems like a bad idea to me. 

It's because pdflush is the best context I could find for actually doing
the erases we need. But now I think we can use pdflush_operation()
instead of having to do it from write_super(), so maybe we can fix the
thing that offends you.

-- 
dwmw2
