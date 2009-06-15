Received: from qw-out-1920.google.com ([74.125.92.149])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MG71m-0004ES-Dt
	for linux-mtd@lists.infradead.org; Mon, 15 Jun 2009 07:54:57 +0000
Received: by qw-out-1920.google.com with SMTP id 9so1884645qwj.24
	for <linux-mtd@lists.infradead.org>;
	Mon, 15 Jun 2009 00:54:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <7948530906150003g365c8af3g9a9aaf8c8b985aa7@mail.gmail.com>
References: <7948530906150003g365c8af3g9a9aaf8c8b985aa7@mail.gmail.com>
Date: Mon, 15 Jun 2009 16:54:48 +0900
Message-ID: <9c9fda240906150054w31ece2abs6194e11165522dd7@mail.gmail.com>
Subject: Re: RFC: [PATCH] MTD OneNAND: multiblock erase support
From: Kyungmin Park <kyungmin78@gmail.com>
To: Mika Korhonen <mika.j.korhonen@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd Mailing List <linux-mtd@lists.infradead.org>
Reply-To: kyungmin78@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jun 15, 2009 at 4:03 PM, Mika Korhonen<mika.j.korhonen@gmail.com> w=
rote:
> Hi,
>
> I wrote an initial support for OneNAND multiblock erase feature. =A0When
> done in maximum 64 eraseblock batches multiblock erase is up to 30x
> faster than block-by-block erase (not including erase verify, though).
>
> However, I only had possibility to test this with an OMAP board, so I
> don't know if e.g. the default onenand_wait needs adjustment. Also for
> Flex-OneNAND the support goes off. Does Flex even have mb erase?
>
> What do you think?
>

Hi,

I think you should also modify onenand_wait. and Flex-OneNAND supports
the multi-block erase.

Do you consider the exception case if the multi-block erase failed?

I think you don't consider the bad block handling in case of multi-block er=
ase

You first check the there's no bad block in multi-block erase. the
following code only exit. it means we never erase if we have bad
block.

+	while (do_mb_erase && len > block_size) {
+		/* Check if we have a bad block, we do not erase bad blocks */
+		if (onenand_block_isbad_nolock(mtd, addr, 0)) {
+			printk(KERN_WARNING "onenand_erase: attempt to erase "
+			       "a bad block at addr 0x%08x\n", (unsigned int) addr);
+			instr->state =3D MTD_ERASE_FAILED;
+			goto erase_exit;
+		}
+
+		this->command(mtd, ONENAND_CMD_MULTIBLOCK_ERASE, addr, block_size);
+
+		onenand_invalidate_bufferram(mtd, addr, block_size);
+
+		ret =3D this->wait(mtd, FL_PREPARING_ERASE);
+		/* Check, if it is write protected */
+		if (ret) {
+			printk(KERN_ERR "onenand_erase: Failed multiblock erase, "
+                               "block %d\n", (unsigned) (addr >>
this->erase_shift));
+			instr->state =3D MTD_ERASE_FAILED;
+			instr->fail_addr =3D addr;
+			goto erase_exit;
+		}
+		len -=3D block_size;
+		addr +=3D block_size;
+	}

Thank you,
Kyungmin Park
