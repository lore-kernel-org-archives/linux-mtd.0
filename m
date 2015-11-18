Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zyqt6-0005m1-Hp
 for linux-mtd@lists.infradead.org; Wed, 18 Nov 2015 00:46:17 +0000
Received: by padhx2 with SMTP id hx2so25273571pad.1
 for <linux-mtd@lists.infradead.org>; Tue, 17 Nov 2015 16:45:55 -0800 (PST)
Date: Tue, 17 Nov 2015 16:45:53 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Error handling in spi-nor and dealing with short reads/writes
Message-ID: <20151118004553.GI8456@google.com>
References: <56157571.4090007@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56157571.4090007@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Heiner,

I see you've sent followup patches for this already. Haven't had a
chance to look at them fully yet, but I can answer a bit.

On Wed, Oct 07, 2015 at 09:41:37PM +0200, Heiner Kallweit wrote:
> I stumbled across some missing error handling in spi-nor and when having a look at the
> list archive I found some proposed patches and related discussions.

Looking at this?

http://lists.infradead.org/pipermail/linux-mtd/2015-August/061058.html

(Unfortunately, this series got dropped by patchwork:
http://patchwork.ozlabs.org/project/linux-mtd/list/)

> However it seems like there was no result, at least I didn't find accepted patches
> dealing with this issue.

Yes, they haven't been accepted yet. IIRC, they partly had to do with
buggy SPI drivers, and so it was hard to get things straight when the
submitter just wanted to paper over driver bugs. I haven't had the
incentive or time to properly revisit the later versions of those
patches. But I may review/merge them soon, and it looks like that may
conflict with your patches.

It'd be great if you could review those patches.

> To summarize few issues:
> 
> 1. I didn't find any clear definition how the read / write callbacks in spi_nor and mtd_info
>    are supposed to handle the retlen argument (returning the actual length of the current
>    transfer or adding it to the current value of *retlen).

Yeah...they're not extremely well specified. mtd_info, at least, has a
fairly well established de facto specification, but spi-nor might be a
bit more inconsistent.

>    Maybe due to this missing specification there are different implementations of the read
>    callback in spi_nor:
>    m25p80_read: sets *retlen to the actual length of the current transfer
>    nxp_spifi_read: adds it to *retlen
>    fsl_qspi_read: adds it to *retlen
>    Luckily this has no impact so far as mtd_read initializes *retlen to 0 before calling
>    the _read callback (once).

Right, all MTD users assume that the core MTD code initializes *retlen.
That was done because otherwise, the initialization was done
inconsistently across all drivers.

> 2. The write callback in spi_nor is defined with a void return type and doesn't allow to
>    handle the case of a failing transfer.

That one has been odd to me.

> 3. It's unclear at which layer incomplete reads/writes are acceptable (and therefore which
>    layer can / should loop to assemble chunks).

Yep.

> My 2ct:
> 
> 1. They should return the actual length of the current transfer in *retlen.

Seems reasonable.

>    In case of a partial transfer they should return an error (e.g. -EIO or -EMSGSIZE).
>    This allows the caller to identify a partial transfer and the amount of
>    bytes successfully transferred. Then the caller can decide whether he wants
>    to retry for the failed part of the transfer and later assemble the chunks.

I don't think we want to handle both errors and *retlen; those are
mutually exclusive. If we have to negotiate a max message size for some
reason, that's a different story.

> 2. Make it return int (like _write in mtd_info).

I assume 'it' is spi_nor->_write() callback. Then yes.

> 3. I prefer to handle read chunks in spi_nor_read (submitted a related patch already).

Sounds OK.

>    Not sure whether it would make sense to add chunk handling also for writes.
>    I'm not aware of any controller which is not able to transfer at least a single page
>    at once.

At most, we should just make sure the error reporting and *retlen
handling is correct, and if drivers run into problems, then we can talk.
For one, you sometimes get less wear reliability from NOR flash when
writing in smaller-than-page-size chunks, so we shouldn't encourage it.

> This is meant as a RfC. Also I may have missed important parts of the discussion.
> Appreciate any hint or comment.

Brian
