Received: from mail-qe0-f54.google.com ([209.85.128.54])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UgDqv-0000JE-2q
 for linux-mtd@lists.infradead.org; Sat, 25 May 2013 12:45:41 +0000
Received: by mail-qe0-f54.google.com with SMTP id i11so3121572qej.27
 for <linux-mtd@lists.infradead.org>; Sat, 25 May 2013 05:45:19 -0700 (PDT)
MIME-Version: 1.0
Date: Sat, 25 May 2013 08:45:18 -0400
Message-ID: <CAP+RiCBTguOPuXOL8FU9e5ihvHN6OUhuNbixvBRQgQxdAV4B6g@mail.gmail.com>
Subject: UBI Resize with second volume table copy corrupted
From: Brent Taylor <motobud@gmail.com>
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

I've created an ubifs filesystem image using ubinize.  The image is
flashed to a NAND chip using U-Boot.  The image is successfully
mounted on several hardware boards but one board contains a bad block
within the MTD partition the image is written to.  U-Boot skips the
bad block and continues writing.  When Linux starts to initialize the
UBI subsystem, UBI reports:

UBI warning: process_lvol: volume table copy #2 is corrupted
UBI: create volume table (copy #2)
UBI: volume table restored

UBI continues to attach to the MTD partition, but the volume is never
resized to expand to use the entire 128MB of the MTD partition and the
volume is immeditaly "full" because there are no more free LEB's.

On the other boards that successfully mount the UBIFS root partition,
the UBI volume is resized correctly.

I'm wondering if by re-creating the second volume table if the
"resize" flag is being copied?

Thanks for your time,
Brent Taylor
