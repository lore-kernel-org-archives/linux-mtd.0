Received: from mail-qy0-f177.google.com ([209.85.216.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Ro2A2-0006Yd-9J
 for linux-mtd@lists.infradead.org; Fri, 20 Jan 2012 00:16:54 +0000
Received: by qcso7 with SMTP id o7so10265qcs.36
 for <linux-mtd@lists.infradead.org>; Thu, 19 Jan 2012 16:16:52 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAGiDA6LO-PWL6OeGwwPJzdx8TVEXMA84ceOvQZ3UECKkG54YAw@mail.gmail.com>
References: <CAGiDA6LO-PWL6OeGwwPJzdx8TVEXMA84ceOvQZ3UECKkG54YAw@mail.gmail.com>
Date: Thu, 19 Jan 2012 19:16:52 -0500
Message-ID: <CAGiDA6KjJKQcho9aiqA2KSe30tvU0JZnMgv86zSE_Pt2=JRdDA@mail.gmail.com>
Subject: Re: Kernel panic when reading mtd device
From: "Shawn J. Goff" <shawn7400@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I believe the problem is in drivers/spi/atmel_spi.c. It looks like it
needs to break the transfer down into chunks that can fit in the
buffer. It seems that this driver as it exists in the Linux4SAM tree (
https://github.com/linux4sam/linux-at91/tree/linus2639_5series_1.x )
is unfinished(?) As a quick workaround, I did the following, which
allows me to function for now.

diff --git a/drivers/spi/atmel_spi.c b/drivers/spi/atmel_spi.c
index ca9dab5..825371f 100644
--- a/drivers/spi/atmel_spi.c
+++ b/drivers/spi/atmel_spi.c
@@ -463,7 +463,7 @@ static void atmel_spi_next_xfer(struct spi_master *master,

        as->current_transfer = xfer;

-       if (atmel_spi_use_dma(xfer)) {
+       if (atmel_spi_use_dma(xfer) && xfer->len <= BUFFER_SIZE) {
                if (!atmel_spi_next_xfer_dma(master, xfer))
                        return;
                else
