Received: from mail-wi0-x22b.google.com ([2a00:1450:400c:c05::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zjubi-0005PJ-M1
 for linux-mtd@lists.infradead.org; Wed, 07 Oct 2015 19:42:35 +0000
Received: by wiclk2 with SMTP id lk2so43687441wic.1
 for <linux-mtd@lists.infradead.org>; Wed, 07 Oct 2015 12:42:12 -0700 (PDT)
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Error handling in spi-nor and dealing with short reads/writes
To: linux-mtd@lists.infradead.org
Cc: Brian Norris <computersforpeace@gmail.com>
Message-ID: <56157571.4090007@gmail.com>
Date: Wed, 7 Oct 2015 21:41:37 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I stumbled across some missing error handling in spi-nor and when having a look at the
list archive I found some proposed patches and related discussions.
However it seems like there was no result, at least I didn't find accepted patches
dealing with this issue.

To summarize few issues:

1. I didn't find any clear definition how the read / write callbacks in spi_nor and mtd_info
   are supposed to handle the retlen argument (returning the actual length of the current
   transfer or adding it to the current value of *retlen).
   Maybe due to this missing specification there are different implementations of the read
   callback in spi_nor:
   m25p80_read: sets *retlen to the actual length of the current transfer
   nxp_spifi_read: adds it to *retlen
   fsl_qspi_read: adds it to *retlen
   Luckily this has no impact so far as mtd_read initializes *retlen to 0 before calling
   the _read callback (once).

2. The write callback in spi_nor is defined with a void return type and doesn't allow to
   handle the case of a failing transfer.

3. It's unclear at which layer incomplete reads/writes are acceptable (and therefore which
   layer can / should loop to assemble chunks).

My 2ct:

1. They should return the actual length of the current transfer in *retlen.
   In case of a partial transfer they should return an error (e.g. -EIO or -EMSGSIZE).
   This allows the caller to identify a partial transfer and the amount of
   bytes successfully transferred. Then the caller can decide whether he wants
   to retry for the failed part of the transfer and later assemble the chunks.

2. Make it return int (like _write in mtd_info).

3. I prefer to handle read chunks in spi_nor_read (submitted a related patch already).
   Not sure whether it would make sense to add chunk handling also for writes.
   I'm not aware of any controller which is not able to transfer at least a single page
   at once.

This is meant as a RfC. Also I may have missed important parts of the discussion.
Appreciate any hint or comment.
