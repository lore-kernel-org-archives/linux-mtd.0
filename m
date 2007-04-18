Subject: Re: [PATCH] [JFFS2] Non-contiguous write bug fix (Sibley)
From: David Woodhouse <dwmw2@infradead.org>
To: Alexander Belyakov <abelyako@googlemail.com>
In-Reply-To: <fe810cf0704170414r59900903rc8ed2e52d22eb833@mail.gmail.com>
References: <fe810cf0704170414r59900903rc8ed2e52d22eb833@mail.gmail.com>
Content-Type: text/plain
Date: Wed, 18 Apr 2007 10:06:44 -0500
Message-Id: <1176908804.21611.37.camel@shinybook.infradead.org>
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

On Tue, 2007-04-17 at 15:14 +0400, Alexander Belyakov wrote:
> Yes, the bug still exists. The patch fixes JFFS2 non-contiguous write
> error on Sibley.

Sorry, I missed (or have forgotten) this. Can you explain in a little
more detail?

The following condition (SECTOR_ADDR(to) != SECTOR_ADDR(wbuf_ofs)) is
supposed to handle this, surely? In what circumstances is it
insufficient?

As far as I can tell, your new check allows us to write anywhere _after_
writing the first wbuf-load in a new eraseblock.

Hm, is this because the cleanmarker size in Sibley is also the wbuf
size? So you were hitting the BUG() after writing the cleanmarker to a
newly-erased block (hence setting wbuf_ofs to point there), but then
moving on to actually _write_ elsewhere?

If that's the case, perhaps the code which writes the cleanmarker
shouldn't be using jffs2_flash_writev() to write it -- perhaps it should
be bypassing the wbuf handling altogether?

-- 
dwmw2
