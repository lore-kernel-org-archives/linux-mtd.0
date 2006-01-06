Received: from zproxy.gmail.com ([64.233.162.201])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EulDn-0003rb-Ow
	for linux-mtd@lists.infradead.org; Fri, 06 Jan 2006 01:37:12 -0500
Received: by zproxy.gmail.com with SMTP id i11so2852100nzi
	for <linux-mtd@lists.infradead.org>;
	Thu, 05 Jan 2006 22:37:06 -0800 (PST)
Message-ID: <417f1b740601052237w84b78dbqf2cb44d4f8ffdeee@mail.gmail.com>
Date: Fri, 6 Jan 2006 12:07:05 +0530
From: Pramod P K <pra.engr@gmail.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: "Bad eraseblock" and "Failed ECC read"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is the MTD NAND with JFFS2 and after I flash I get:


My U-Boot v0.1

.......


NAND device: Manufacturer ID: 0xec, Chip ID: 0xa1 (Samsung NAND 128MiB
1,8V 8-bit)
Scanning device for bad blocks
....
....

check_short_pattern: p[td->offs + i]: ff td->pattern[i]: ff

...

check_short_pattern: p[td->offs + i]: 84 td->pattern[i]: ff
Bad eraseblock 96 at 0x00c00000

td->len:2
check_short_pattern: p[td->offs + i]: 23 td->pattern[i]: ff
Bad eraseblock 97 at 0x00c20000

.....

NAND flash probing at 0x20020000 Finished
In:    console
Out:   console
Err:   console
Hit any key to stop autoboot:  2 =08=08=08 1 =08=08=08 0

Loading from device 0: NAND 128MiB 1,8V 8-bit at 0x200b8000 (offset 0xd0000=
0)

.....

: do_nandboot(): ecc_status=3D-1
nand_read_ecc: Failed ECC read, page 0x00001a00

.....

: do_nandboot(): ecc_status=3D-1
nand_read_ecc: Failed ECC read, page 0x00001a00

...

** Read error on 0
Boot reached stage -1



Please come with the possibilities.
Thanks.

--
----------------------------------------------------------------
   <pra.engr@gmail.com>

  ----------------------------------------------------------------
