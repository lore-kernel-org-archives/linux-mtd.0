Received: from orion.he.net ([216.218.179.2])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19SaRQ-0000Od-L7
	for <linux-mtd@lists.infradead.org>; Wed, 18 Jun 2003 11:45:24 +0100
Received: from kenlap (81-31-97-214.adsl.entanet.co.uk [81.31.97.214]) by
	orion.he.net (8.8.6p2003-03-31/8.8.2) with SMTP id DAA06641 for
	<linux-mtd@lists.infradead.org>; Wed, 18 Jun 2003 03:45:52 -0700
Message-ID: <004101c33586$cb802a90$1207a8c0@kenlap>
From: "Ken Gordon" <kengordon@magneticscrolls.com>
To: <linux-mtd@lists.infradead.org>
Date: Wed, 18 Jun 2003 11:45:54 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: Getting a mtd_info with a valid map.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm trying to read the serial number from my Intel Strataflash (J3) suing
mtd->read_user_prot_reg and mtd->read_fact_prot_reg. This code below looks
to me like it should do the job but explodes because the mtd_info returned
by get_mtd_device has a NULL priv field.

Adding printk's into drivers/mtd/chips/cfi_probe.c I see an mtd_info being
created (not the one I get) and filled in with a valid priv pointing at a
map.

I'm a bit confused since mtd_info seem to refer to named partitions but I'm
after a per set of flash chips physical sort of thing. Am I am on the wrong
planet?

It looks like I could keep hold of the mtd_info that is returned to the
original probe in my file in drivers/mtd/maps but SURELY that isn't the way.

    Ken

PS This is using linux 2.4.19-rmk6-pxa1




static int handle_proc_flashid(char *page,
                            char **start, off_t requested_offset,
                            int requested_len, int *eof, void *data)
{
    int len = 0;       /* which means that the bottom 4 bits are inverted */
    char buf[1024];      /* wrt what is written on the bits !!*/
    char *p = buf;

    int f[4], s[4];

    struct mtd_info *mtd = get_mtd_device(NULL, 0);

    if (!mtd) {
       sprintf(buf, "unable to get mtd device!\n");
    } else {
// int (*read_user_prot_reg) (struct mtd_info *mtd, loff_t from, size_t len,
size_t *retlen, u_char
*buf);
        size_t slen=0, flen=0;
        int sret = -1, fret = -1;

        struct map_info *map;
        struct cfi_private *cfi;
        struct cfi_pri_intelext *extp;

        printk("about to get mtd->priv & is %x mtd is %x\n", &mtd->priv,
mtd);
        map = mtd->priv;

        printk("map %x\n", map);            // map is ALWAYS 0 here - boo
hoo!
        if (map) {
            cfi = map->fldrv_priv;
            printk("cfi %x\n", cfi);
            if (cfi) {
                extp=cfi->cmdset_priv;
                printk("extp %x\n", extp);
            }
        }

        printk("fn ptrs %x %x\n", mtd->read_user_prot_reg,
mtd->read_fact_prot_reg);
        printk("name: %s\n", mtd->name);
        if (mtd->read_user_prot_reg)
            sret = mtd->read_user_prot_reg(mtd, 0, sizeof(s), &slen,
(unsigned char *)s);
        printk("done user\n");
        if (mtd->read_user_prot_reg)
            fret = mtd->read_fact_prot_reg(mtd, 0, sizeof(f), &flen,
(unsigned char *)f);
        printk("done fact\n");
        sprintf(buf, "flen %d slen %d factory id =
%08x:%08x:%08x:%08x\nsystem id = %08x:%08x:%08x:%
08x\n",
                 flen, slen, f[0], f[1], f[2], f[3], s[0], s[1], s[2],
s[3]);
    }
    if (strlen(buf) < requested_len) {
        strcpy(page, buf);
        *start = page + requested_offset;
        len = strlen(*start);
    } else
        *page = 0;

    if (mtd)
        put_mtd_device(mtd);

    return len;
}
