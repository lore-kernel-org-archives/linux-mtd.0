Subject: Re: [PATCH] [JFFS2] Sibley non-contiguous write bug fix
From: David Woodhouse <dwmw2@infradead.org>
To: Alexander Belyakov <abelyako@googlemail.com>
In-Reply-To: <fe810cf0709050235r47986ba4u2683917550169083@mail.gmail.com>
References: <fe810cf0709050235r47986ba4u2683917550169083@mail.gmail.com>
Content-Type: text/plain
Date: Wed, 05 Sep 2007 11:39:58 +0100
Message-Id: <1188988798.2745.8.camel@shinybook.infradead.org>
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

On Wed, 2007-09-05 at 13:35 +0400, Alexander Belyakov wrote:
> Hi David,
> 
> some time ago we have fixed one Sibley non-contiguous write bug:
> http://git.infradead.org/?p=mtd-2.6.git;a=commit;h=3fddb6c985e3823c991399840d2d5ef5940e1b60
> 
> But it seems there is the same bug in another place.
> jffs2_flash_writev() sets 'wbuf_ofs' to the first page in block
> causing a BUG(). Please look at this patch.
> 
> 
> 
> Don't leave the wbuf 'offset' field pointing at the start of the next
> physical eraseblock. This is causing a BUG() on NOR-ECC (Sibley)
> flash.

That looks sane enough, I suppose. But I wonder if instead we should
just be setting c->wbuf_ofs = 0xffffffff in jffs2_find_nextblock()?

-- 
dwmw2
