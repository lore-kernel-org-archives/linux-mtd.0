Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1e83Q1-0005jN-1l
 for linux-mtd@lists.infradead.org; Fri, 27 Oct 2017 12:07:23 +0000
Date: Fri, 27 Oct 2017 14:06:51 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Richard Weinberger <richard@nod.at>, Chris Brandt
 <chris.brandt@renesas.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 0/5] unconfuse get_unmapped_area and point/unpoint
 driver methods
Message-ID: <20171027140651.4032744b@bbrezillon>
In-Reply-To: <20171017152826.11658-1-nicolas.pitre@linaro.org>
References: <20171017152826.11658-1-nicolas.pitre@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Nicolas,

Some of your commits do not have commit messages (just a subject and
that's all). I know you're an experimented kernel developer and you
might find this superfluous, but we try to push all MTD contributors to
write a commit message, even if it's just a one line description that
basically repeats what the subject line says. Would you mind adding a
short description to patch 2 and 3.

Other than that, the changes look good to me, so

Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

On Tue, 17 Oct 2017 11:28:21 -0400
Nicolas Pitre <nicolas.pitre@linaro.org> wrote:

> This series improves or implements the point and unpoint driver methods
> and reimplements mtd_get_unmapped_area() in terms of those. Because
> mtd->_point() provides a superset of what mtd->_get_unmapped_area() does
> then there is no reason for having both. Or worse: having one but not
> the other.
> 
> This is motivated by my work on XIP cramfs for both MMU and !MMU systems
> where I do need the more complete point functionality. And it just looks
> like the right thing to do.
> 
> This is also available on top of Linux v4.14-rc3 via git here:
> 
>   http://git.linaro.org/people/nicolas.pitre/linux mtd_point
> 
> 
> Changes from v1:
> 
> - Fix retlen computation in mtdram.c:ram_point().
> 
> - Added Richard Weinberger's REviewd-by tags.
> 
> 
> diffstat:
> 
>  drivers/mtd/chips/map_ram.c  | 34 ++++++++++++++++++++--------------
>  drivers/mtd/chips/map_rom.c  | 34 +++++++++++++++++++++-------------
>  drivers/mtd/devices/mtdram.c | 36 ++++++++++++++++++++++--------------
>  drivers/mtd/mtdconcat.c      | 27 ---------------------------
>  drivers/mtd/mtdcore.c        | 17 ++++++++++++-----
>  drivers/mtd/mtdpart.c        | 14 --------------
>  include/linux/mtd/mtd.h      |  4 ----
>  7 files changed, 75 insertions(+), 91 deletions(-)
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
