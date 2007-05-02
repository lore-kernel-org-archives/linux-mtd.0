Subject: Re: [PATCH] [JFFS2] Non-contiguous write bug fix (Sibley)
From: David Woodhouse <dwmw2@infradead.org>
To: Alexander Belyakov <abelyako@googlemail.com>
In-Reply-To: <fe810cf0705020649t730abfb6t6da54e1b0701785c@mail.gmail.com>
References: <fe810cf0704170414r59900903rc8ed2e52d22eb833@mail.gmail.com>
	<1176908804.21611.37.camel@shinybook.infradead.org>
	<fe810cf0705020649t730abfb6t6da54e1b0701785c@mail.gmail.com>
Content-Type: text/plain
Date: Wed, 02 May 2007 14:58:34 +0100
Message-Id: <1178114314.11120.12.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2007-05-02 at 17:49 +0400, Alexander Belyakov wrote:
> Currently it is possible to get 'wbuf_ofs' pointing to the beginning
> of the eraseblock, meanwhile 'to' points one page ahead (cleanmarker
> on Sibley) and 'wbuf_len' equals to zero. Both 'wbuf_ofs' and 'to'
> belong to the same eraseblock and condition (SECTOR_ADDR(to) !=
> SECTOR_ADDR(wbuf_ofs)) fails. So we hit BUG() in jffs2_flash_writev()
> with non-contiguous write error.

Hm. But _how_ do we get into that state? If it isn't through writing the
cleanmarker (and it looks like you're right; it isn't), then _how_ is
c->wbuf_ofs ever setting set to point to the first page in the block?

> David, do you have something in mind about fixing the bug without
> applying the patch suggested?

I'm concerned by the patch, because I think it's "protecting" against a
situation which should never happen. I want to understand _why_ we get
into this state, not just apply the symptomatic fix.

Can you add something like a WARN_ON(!(c->wbuf_ofs % c->sector_size))
whereever we set c->wbuf_ofs, and see where it's happening?

-- 
dwmw2                       09 F9 11 02 9D 74 E3 5B D8 41 56 C5 63 56 88 C0
