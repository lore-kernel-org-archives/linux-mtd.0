Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PpK7a-0002Mu-Cv
	for linux-mtd@lists.infradead.org; Tue, 15 Feb 2011 12:35:10 +0000
Received: by iwn38 with SMTP id 38so99263iwn.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 15 Feb 2011 04:35:07 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 15 Feb 2011 12:35:07 +0000
Message-ID: <AANLkTikWMGSCzGdPUBgtZKY2F6=pZ=6X+p7LUUmuKhp+@mail.gmail.com>
Subject: CONFIG_MTD_NAND_VERIFY_WRITE with Software ECC
From: David Peverley <pev@sketchymonkey.com>
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

Hi all,

I've noticed that some of the problems we see are exacerbated further
by us having CONFIG_MTD_NAND_VERIFY_WRITE enabled. In the case where
blocks have occasional 1-bit ECC failures (i.e. normally correctable
and not enough to warrant marking as bad) the generic verify routine
will cause nand_write_page() to return failure. I've prototyped a
verify routine that uses an ECC corrected read in our driver and it
seems to do the job correctly.

I think that there's a good argument to address this by changing the
generic verify routine(s) by doing something along the lines of the
following :

static uint8_t readbackbuf[NAND_MAX_PAGESIZE];

static int nand_verify_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
{
    int err;
    struct nand_chip *chip = mtd->priv;

    /* Read back page using ECC read */
    err = chip->ecc.read_page(mtd, this, readbackbuf_ecc);
    if (err < 0) {
        printk(KERN_NOTICE "nand_verify_buf: ERROR: ecc.read_page() failed.\n");
        return -EFAULT;
    }

    if (memcmp(readbackbuf, buf, len) != 0)
        return -EFAULT;

    return 0;
}

which would use the appropriate page read mechanism based on what was
configured as a result of ecc.mode. Does this make sense to you guys?
If so I'll put together a patch to submit. This would also
nand_verify_buf16() becomes obsolete as the bus width differences are
taken care of within the call to read_page().

Of course it adds a little more overhead but will avoid writes failing
and possibly causing some blocks to be marked as bad before their
time...

Cheers,

~Pev
