Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y61vt-0007zf-EO
 for linux-mtd@lists.infradead.org; Tue, 30 Dec 2014 18:54:18 +0000
Date: Tue, 30 Dec 2014 19:53:49 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Oleksij Rempel <linux@rempel-privat.de>
Subject: Re: [PATCH] nand: add Types of controllers from ECC point of view
Message-ID: <20141230195349.12cafd01@bbrezillon>
In-Reply-To: <1419677195-4900-1-git-send-email-linux@rempel-privat.de>
References: <1419677195-4900-1-git-send-email-linux@rempel-privat.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

Hi Oleksij,

On Sat, 27 Dec 2014 11:46:35 +0100
Oleksij Rempel <linux@rempel-privat.de> wrote:

> it is mostly copy&paste of Boris Brezillons answer on linux-mtd list.

Please describe what your patch does, not where it comes from.
If I wanted I'd ask you to add my SoB...

> 
> Signed-off-by: Oleksij Rempel <linux@rempel-privat.de>
> ---
>  doc/nand.xml | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/doc/nand.xml b/doc/nand.xml
> index 281e0e0..197241c 100644
> --- a/doc/nand.xml
> +++ b/doc/nand.xml
> @@ -113,6 +113,21 @@ protection or connected to VCC to enable writes unconditionally. As NAND flash u
>  a command driven programming and erasing, an  accidental write or erase is not 
>  likely to happen. The Ready / Busy output is not necessary for operation, 
>   but it can be tied to a GPIO or an interrupt line. </p>
> +
> +<h3>Types of controllers from ECC point of view</h3>

This paragraph has nothing to do with NAND Filesystems and thus should
be placed in its own section.
Moreover, I'm not sure the title is clear enough. How about

<h2>ECC controllers</h3>

<!--description of what ECC controllers are-->

<!--other stuff related to ECC-->

<h3>BCH Algorithm</h3>

<!--description of BCH algorithm -->

<h4>ECC bytes for empty pages (filled with 0xff)</h4>

<!-- put some context here -->

<!-- then the description below (not sure you should directly reuse
my words though) -->

> +<p>1) Wiser controllers are generating 0xff ECC bytes for a data chunk
> +(chunk == ECC step size) filled with 0xff. With BCH algorithms this is
> +easily done by XORing the ECC bytes with the appropriate pattern (see
> +soft BCH implementation)</p>
> +<p>2) Some controller just verify if the data chunk + ECC bytes are all
> +0xff before passing it to the ECC engine. If they are filled with 0xff
> +the ECC correction is bypassed.</p>
> +<p>This method has one drawback: it does not properly handle bitflips
> +occurring in erased pages (if one bitflip occurs the NAND controller
> +consider the chunk as not empty, and pass it to the BCH engine).</p>
> +<p>3) The controller does not handle erased pages at all, and in this case
> +you'll have to manually test it (see is_buf_blank in drivers/mtd/nand/pxa3xx_nand.c) when you
> +encounter an ECC error.</p>

Please use:

<ol>
<li>Wiser controllers are generating 0xff ECC bytes for a data
chunk...</li>
<li>...</li>
</ol>


Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
