Received: from mail-yw0-f49.google.com ([209.85.213.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RJixl-0003ES-0V
	for linux-mtd@lists.infradead.org; Fri, 28 Oct 2011 09:42:57 +0000
Received: by ywm19 with SMTP id 19so3967137ywm.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 28 Oct 2011 02:42:55 -0700 (PDT)
MIME-Version: 1.0
From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Fri, 28 Oct 2011 11:42:33 +0200
Message-ID: <CAAwP0s059H3BGhYbYLux2gR6ZNb+sFDue676OM2Evz5cA2q6DA@mail.gmail.com>
Subject: [RFC] Change ECC algorithm from userspace
To: linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Enric Balletbo i Serra <eballetbo@iseebcn.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

We've a custom board using an ARM OMAP DM3730 whose ROM boot loader
only supports 1-bit ECC correction using Hamming algorithm.

So, in order to be able to boot from the NAND, we have to configure
the GPMC (OMAP's memory controller that interfaces with NAND devices)
to use 1-bit HW ECC and write the loader binary to the first NAND
sector. That way the ROM boot will take this sector as valid and load
the loader binary to RAM.

The problem is that the SLC NAND device that we are using has a
minimum required ECC of 4-bit correction per each 512 bytes.

I want to be able to use 1-bit ECC for the first partition where I
save the loader binary and has to be accessed by the ROM boot but use
a 4-bit ECC for my rootfs partition.

Does anyone have this same issue?

What is the best approach to store data in a NAND device using
different ECC techniques?

I've think of two approaches:

1- Adding an ioctl to mtdchar (something like ECCSETBITS) to change
the ECC technique used.
2- Use a platform data field to notify the omap2 nand driver that the
ROM boot only supports 1-bit ECC. So it can use a 1-bit ECC to write
and read the first 4 sectors but a 4-bit ECC for the rest.

Of course both approaches can only be used if the none of the nand
memory partitions are mounted.

Thank you and best regards,

--=20
Javier Mart=C3=ADnez Canillas
(+34) 682 39 81 69
Barcelona, Spain
