Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PHFwq-00027M-BN
	for linux-mtd@lists.infradead.org; Sat, 13 Nov 2010 13:15:21 +0000
Received: by bwz5 with SMTP id 5so4012542bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 13 Nov 2010 05:15:14 -0800 (PST)
Subject: Re: ubi deadlock on .36+
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Grazvydas Ignotas <notasas@gmail.com>
In-Reply-To: <1289651831.2218.48.camel@localhost>
References: <AANLkTimKc_EtT6NEwbga8g7AKoGnDSt7UMQwgou_jCXD@mail.gmail.com>
	<1288855749.2075.7.camel@localhost>
	<AANLkTim-+_98Ezcn3dG5g0mzNLNVrkDKC2f_34A_n2pE@mail.gmail.com>
	<1289651831.2218.48.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 13 Nov 2010 15:15:01 +0200
Message-ID: <1289654101.2218.51.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2010-11-13 at 14:37 +0200, Artem Bityutskiy wrote:
> On Thu, 2010-11-04 at 15:07 +0200, Grazvydas Ignotas wrote:
> > On Thu, Nov 4, 2010 at 9:29 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > > On Wed, 2010-11-03 at 23:30 +0200, Grazvydas Ignotas wrote:
> > >> Hi,
> > >>
> > >> there seems to be some issue with NAND on my OMAP3 board that causes
> > >> CRC errors on 2.6.36 and 2.6.37-rc1. Those seem to be triggering a bug
> > >> in UBI that makes it loop forever (or very long) printing this:
> > >>
> > >> uncorrectable error :
> > >> UBI error: ubi_io_read: error -74 (ECC error) while reading 512 bytes
> > >> from PEB 0:512, read 512 bytes
> > >> uncorrectable error :
> > >> UBI error: ubi_io_read: error -74 (ECC error) while reading 512 bytes
> > >> from PEB 68:512, read 512 bytes
> > >> UBI: run torture test for PEB 68
> > >> UBI: PEB 68 passed torture test, do not mark it a bad
> > >>
> > >>
> > >> here is full log of one minute session, after which I killed power:
> > >> http://notaz.gp2x.de/misc/pnd/logs/linux_20101103_ubi_lockup
> > >
> > > Hmm, could you please enable UBI debugging and provide me the logs? See
> > > here for some hints:
> > > http://www.linux-mtd.infradead.org/doc/ubi.html#L_how_send_bugreport
> > 
> > done:
> > http://notaz.gp2x.de/misc/pnd/logs/linux_20101103_ubi_lockup2
> 
> But would it be possible to enable all UBI debugging messages?

While trying to figure out what is happening in your system, I realized
one possible scenario which may confuse UBI. I've added a patch below.
This probably won't fix your issue (but you could try), I need more time
to think about what was happening. But a log with all messages (not only
I/O) would help. Thanks.

>From 703ba5f120644fefef3cfed46c0d8ccf6a15b4ee Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Sat, 13 Nov 2010 15:08:29 +0200
Subject: [PATCH] UBI: improve UBI robustness

When reading data from the flash, corrupt the buffer we are about to
read to before reading. The idea is to fix the following possible
situation:

1. The buffer contains data from previous operation, e.g., read from
   another PEB previously. The data looks like expected, e.g., if we
   just do not read anything and return - the caller would not
   notice this. E.g., if we are reading a VID header, the buffer may
   contain a valid VID header from another PEB.
2. The driver is buggy and returns use success or -EBADMSG or
   -EUCLEAN, but it does not actually put any data to the buffer.

This may confuse UBI or upper layers - they may think the buffer
contains valid data while in fact it is just old data. This is
especially possible because UBI (and UBIFS) relies on CRC, and
treats data as correct even in case of ECC errors if the CRC is
correct.

Try to prevent this situation by changing the first byte of the
buffer.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/io.c |   22 ++++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index c2960ac..9ab1a33 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -146,6 +146,28 @@ int ubi_io_read(const struct ubi_device *ubi, void *buf, int pnum, int offset,
 	if (err)
 		return err;
 
+	/*
+	 * Deliberately corrupt the buffer to improve robustness. Indeed, if we
+	 * do not do this, the following may happen:
+	 * 1. The buffer contains data from previous operation, e.g., read from
+	 *    another PEB previously. The data looks like expected, e.g., if we
+	 *    just do not read anything and return - the caller would not
+	 *    notice this. E.g., if we are reading a VID header, the buffer may
+	 *    contain a valid VID header from another PEB.
+	 * 2. The driver is buggy and returns us success or -EBADMSG or
+	 *    -EUCLEAN, but it does not actually put any data to the buffer.
+	 *
+	 * This may confuse UBI or upper layers - they may think the buffer
+	 * contains valid data while in fact it is just old data. This is
+	 * especially possible because UBI (and UBIFS) relies on CRC, and
+	 * treats data as correct even in case of ECC errors if the CRC is
+	 * correct.
+	 *
+	 * Try to prevent this situation by changing the first byte of the
+	 * buffer.
+	 */
+	*((uint8_t *)buf) ^= 0xFF;
+
 	addr = (loff_t)pnum * ubi->peb_size + offset;
 retry:
 	err = ubi->mtd->read(ubi->mtd, addr, len, &read, buf);
-- 
1.7.2.3

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
