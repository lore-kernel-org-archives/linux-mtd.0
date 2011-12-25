Received: from smtp3.newsguy.com ([74.209.136.66] helo=smtp.newsguy.com)
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RepPl-000873-D5
 for linux-mtd@lists.infradead.org; Sun, 25 Dec 2011 14:51:05 +0000
Message-ID: <4EF7383C.6010003@newsguy.com>
Date: Sun, 25 Dec 2011 06:50:36 -0800
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 00/28] introduce wrappers for mtd interfaces
References: <1324663880-22477-1-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1324663880-22477-1-git-send-email-dedekind1@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/23/2011 10:10 AM, Artem Bityutskiy wrote:
> Hi,
>
> this patch-series introduce a bunch of wrappers for mtd interfaces, e.g.:
> * mtd_read() for mtd->read()
> * mtd_write() for mtd->write()
> * mtd_is_locked() form mtd->is_locked()
>
> and so forth for all interfaces found in 'struct mtd_info'.
>
> The motivation is to help Mike Dunn to improve MTD bit-flips handling.


And a merry Christmas to you too, Artem :)

Thanks much.  I'll follow up with my patches as soon as my head clears from the
egg nog.


> This patch-set only substitutes 'mtd->func()' with 'mtd_func()', I used spatch
> to do this. But we'd need to do some more work:
>  1 Find places like
> 	if (mtd->block_isbad)
> 		mtd_block_isbad(...)
>    and nicify them (possibly move the "if" check to the wrapper)
>  2 Rename all the function pointers in 'struct mtd_info' in order to
>    make sure every driver has switched to the wrappers.
>  3 Move the common input parameters checking to the wrappers


I guess the plan is to eventually move the wrappers out of the header file and
no longer declare them inline?

Thanks again,
Mike
