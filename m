Received: from an-out-0708.google.com ([209.85.132.240])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HjFCa-0003yJ-3z
	for linux-mtd@lists.infradead.org; Wed, 02 May 2007 09:49:05 -0400
Received: by an-out-0708.google.com with SMTP id d40so271350and
	for <linux-mtd@lists.infradead.org>;
	Wed, 02 May 2007 06:49:02 -0700 (PDT)
Message-ID: <fe810cf0705020649t730abfb6t6da54e1b0701785c@mail.gmail.com>
Date: Wed, 2 May 2007 17:49:02 +0400
From: "Alexander Belyakov" <abelyako@googlemail.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Subject: Re: [PATCH] [JFFS2] Non-contiguous write bug fix (Sibley)
In-Reply-To: <1176908804.21611.37.camel@shinybook.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <fe810cf0704170414r59900903rc8ed2e52d22eb833@mail.gmail.com>
	<1176908804.21611.37.camel@shinybook.infradead.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 4/18/07, David Woodhouse <dwmw2@infradead.org> wrote:
>
> Sorry, I missed (or have forgotten) this. Can you explain in a little
> more detail?
>
> The following condition (SECTOR_ADDR(to) != SECTOR_ADDR(wbuf_ofs)) is
> supposed to handle this, surely? In what circumstances is it
> insufficient?
>

David,

I just perform random length writes to JFFS2 and bug _always_ appears
at some point.

Currently it is possible to get 'wbuf_ofs' pointing to the beginning
of the eraseblock, meanwhile 'to' points one page ahead (cleanmarker
on Sibley) and 'wbuf_len' equals to zero. Both 'wbuf_ofs' and 'to'
belong to the same eraseblock and condition (SECTOR_ADDR(to) !=
SECTOR_ADDR(wbuf_ofs)) fails. So we hit BUG() in jffs2_flash_writev()
with non-contiguous write error.

>
> Hm, is this because the cleanmarker size in Sibley is also the wbuf
> size? So you were hitting the BUG() after writing the cleanmarker to a
> newly-erased block (hence setting wbuf_ofs to point there), but then
> moving on to actually _write_ elsewhere?
>
> If that's the case, perhaps the code which writes the cleanmarker
> shouldn't be using jffs2_flash_writev() to write it -- perhaps it should
> be bypassing the wbuf handling altogether?
>

Cleanmarker is written with jffs2_flash_direct_writev() and thus
doesn't affect wbuf.

David, do you have something in mind about fixing the bug without
applying the patch suggested?

Thanks,
Alexander
