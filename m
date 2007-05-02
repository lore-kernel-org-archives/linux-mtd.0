Received: from an-out-0708.google.com ([209.85.132.240])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HjGCo-0005IS-NA
	for linux-mtd@lists.infradead.org; Wed, 02 May 2007 10:53:25 -0400
Received: by an-out-0708.google.com with SMTP id d40so330515and
	for <linux-mtd@lists.infradead.org>;
	Wed, 02 May 2007 07:53:22 -0700 (PDT)
Message-ID: <fe810cf0705020753k22193b4eqa8a177aaae10f040@mail.gmail.com>
Date: Wed, 2 May 2007 18:53:21 +0400
From: "Alexander Belyakov" <abelyako@googlemail.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Subject: Re: [PATCH] [JFFS2] Non-contiguous write bug fix (Sibley)
In-Reply-To: <1178114314.11120.12.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <fe810cf0704170414r59900903rc8ed2e52d22eb833@mail.gmail.com>
	<1176908804.21611.37.camel@shinybook.infradead.org>
	<fe810cf0705020649t730abfb6t6da54e1b0701785c@mail.gmail.com>
	<1178114314.11120.12.camel@pmac.infradead.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 5/2/07, David Woodhouse <dwmw2@infradead.org> wrote:
>
> Can you add something like a WARN_ON(!(c->wbuf_ofs % c->sector_size))
> whereever we set c->wbuf_ofs, and see where it's happening?
>

Done. It seems __jffs2_flush_wbuf() sets 'wbuf_ofs' to the first page in block.

BUG: at fs/jffs2/wbuf.c:639 __jffs2_flush_wbuf()
jffs2_flash_writev(): Non-contiguous write to 008c0400
kernel BUG at fs/jffs2/wbuf.c:790!

'wbuf_ofs' is set to the first page in block quite often in
__jffs2_flush_wbuf(), but this doesn't always lead to
jffs2_flash_writev() failure. If 'to' is pointing to the different
block, condition (SECTOR_ADDR(to) != SECTOR_ADDR(wbuf_ofs)) works fine
and we don't hit BUG() despite 'wbuf_ofs' points to the first page in
block.

Probably we should put additional 'wbuf_ofs' adjustment to the
__jffs2_flush_wbuf() checking if we're moving to the new erseblock.

Thanks,
Alexander
