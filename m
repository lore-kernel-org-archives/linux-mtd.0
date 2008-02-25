Received: from py-out-1112.google.com ([64.233.166.179])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JTaad-0007Zb-8G
	for linux-mtd@lists.infradead.org; Mon, 25 Feb 2008 10:29:43 +0000
Received: by py-out-1112.google.com with SMTP id p76so2216354pyb.2
	for <linux-mtd@lists.infradead.org>;
	Mon, 25 Feb 2008 02:29:35 -0800 (PST)
Message-ID: <386072610802250229k18b4354dpb6b9d525df0cfd27@mail.gmail.com>
Date: Mon, 25 Feb 2008 18:29:34 +0800
From: "Bryan Wu" <cooloney@kernel.org>
Sender: cooloney.lkml@gmail.com
To: "David Woodhouse" <dwmw2@infradead.org>
Subject: Re: [MTD/NAND] Blackfin NFC driver DMA bug ?
In-Reply-To: <1203663909.5771.26.camel@shinybook.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <loom.20080221T171743-57@post.gmane.org>
	<386072610802211852r466ba76m427d8705b3d86ad9@mail.gmail.com>
	<1203663909.5771.26.camel@shinybook.infradead.org>
Cc: Ivan Djelic <ivan.djelic@parrot.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Feb 22, 2008 at 3:05 PM, David Woodhouse <dwmw2@infradead.org> wrot=
e:
>
>  On Fri, 2008-02-22 at 10:52 +0800, Bryan Wu wrote:
>  > Oh, I am not fully understand your concern.  The code is invalidating
>  > or flushing buf before DMA operation.
>  > And invalidate and flush operation is OK for buf which is not
>  > cache-aligned on Blackfin arch. it also should be
>  > OK for other arch.
>
>  The problem occurs when your buffer is not aligned at the beginning of a
>  cache line. If there is other data on the _same_ cache line as your
>  buffer, and you invalidate the cache, then you may cause data loss
>  outside the buffer.
>

Yes, I understand that. I prefer to make sure this buffer issue in the
MTD core API.

>  Also, in some systems you must make sure that allocations to be used for
>  DMA are from a certain memory pool.
>
>  As for the original question... I'm not sure. At the moment I don't
>  believe it's true that all such buffers are suitable for DMA. Perhaps it
>  would be sensible for us to redefine the MTD API so that it is required
>  (and fix the users).
>

Exactly, maybe xxx_nand_dma_read() and xxx_nand_dma_write().
The buffer for this DMA functions should be cache-aligned.

>  For a long time, flash I/O was always done by the CPU instead of DMA, so
>  it wasn't an interesting question. I did start wondering when I
>  implemented support for the CAF=C9 controller on OLPC, but then that
>  turned out to need bounce buffers anyway so it escaped my attention
>  again.
>

We might need to add DMA support in the MTD NAND interface, because
more and more SoC support on-chip NAND controller with DMA support.

Thanks a lot
-Bryan Wu
