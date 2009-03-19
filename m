Received: from mail-fx0-f166.google.com ([209.85.220.166])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LkKkj-00024F-Jy
	for linux-mtd@lists.infradead.org; Thu, 19 Mar 2009 16:06:00 +0000
Received: by fxm10 with SMTP id 10so579622fxm.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 19 Mar 2009 09:05:48 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 19 Mar 2009 17:05:48 +0100
Message-ID: <ba4215e10903190905u7a1e3647lef16a762078a6d8d@mail.gmail.com>
Subject: write timeouts with spansion S29-WS128J
From: Martin Fuzzey <mfuzzey@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
I have an arm (i.MX21) based board with S29-WS128J flash running
something close linus's tree.

When writing to the flash I frequently see :
 MTD do_write_buffer(): software timeout

This hack stops the problem:
diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c
b/drivers/mtd/chips/cfi_cmdset_0002.c

index 94bb61e..fb3cc0c 100644

--- a/drivers/mtd/chips/cfi_cmdset_0002.c

+++ b/drivers/mtd/chips/cfi_cmdset_0002.c

@@ -1312,7 +1312,7 @@ static int __xipram do_write_buffer(struct
map_info *map, struct flchip *chip,

        struct cfi_private *cfi =3D map->fldrv_priv;

        unsigned long timeo =3D jiffies + HZ;

        /* see comments in do_write_oneword() regarding uWriteTimeo. */

-       unsigned long uWriteTimeout =3D ( HZ / 1000 ) + 1;

+       unsigned long uWriteTimeout =3D ( HZ / 1000 ) + 3; /*MF avoid timeo=
ut*/

        int ret =3D -EIO;

        unsigned long cmd_adr;

        int z, words;



HZ is 200 on this platform.

The comments in do_write_oneword() mentionned above say that the
maximum timeout information is not available.
However if I activate DEBUG_CFI in cfi_probe.c I get:

[42949377.550000] physmap platform flash device: 04000000 at c8000000

[42949377.570000] Number of erase regions: 3

[42949377.590000] Primary Vendor Command Set: 0002 (AMD/Fujitsu Standard)

[42949377.610000] Primary Algorithm Table at 0040

[42949377.610000] Alternative Vendor Command Set: 0000 (None)

[42949377.640000] No Alternate Algorithm Table

[42949377.640000] Vcc Minimum:  1.7 V

[42949377.670000] Vcc Maximum:  1.9 V

[42949377.670000] No Vpp line

[42949377.670000] Typical byte/word write timeout: 64 =B5s

[42949377.710000] Maximum byte/word write timeout: 1024 =B5s

[42949377.710000] Typical full buffer write timeout: 512 =B5s

[42949377.740000] Maximum full buffer write timeout: 8192 =B5s
     <********************
[42949377.740000] Typical block erase timeout: 1024 ms

[42949377.770000] Maximum block erase timeout: 8192 ms

[42949377.770000] Chip erase not supported

[42949377.770000] Device size: 0x1000000 bytes (16 MiB)

[42949377.810000] Flash Device Interface description: 0x0001

[42949377.810000]   - x16-only asynchronous interface

[42949377.810000] Max. bytes in buffer write: 0x40

[42949377.850000] Number of Erase Block Regions: 3

[42949377.850000]   Erase Region #0: BlockSize 0x8000 bytes, 4 blocks

[42949377.850000]   Erase Region #1: BlockSize 0x20000 bytes, 126 blocks

[42949377.890000]   Erase Region #2: BlockSize 0x8000 bytes, 4 blocks

[42949377.890000] physmap-flash.0: Found 2 x16 devices at 0x0 in 32-bit ban=
k

[42949377.890000] physmap-flash.0: Found 2 x16 devices at 0x2000000 in
32-bit bank

[42949377.940000]  Amd/Fujitsu Extended Query Table at 0x0040

[42949377.940000] physmap-flash.0: CFI does not contain boot bank
location. Assuming top.

[42949377.940000] number of CFI chips: 2

[42949377.980000] cfi_cmdset_0002: Disabling erase-suspend-program due
to code brokenness.



IE the max buffer write timeout is available (8192 microseconds) which
is < 1 jiffy (5ms) which probably explains the problem.
However I tried using 2 jiffies instead of 3 and it still failed sometimes.

Is this a bug or am I doing something wrong?

Regards,

Martin Fuzzey
