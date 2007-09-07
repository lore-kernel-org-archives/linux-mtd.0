Received: from mail.ku-gbr.de ([81.3.11.18] helo=ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1ITYWs-0000gr-CZ
	for linux-mtd@lists.infradead.org; Fri, 07 Sep 2007 03:45:31 -0400
Date: Fri, 7 Sep 2007 09:44:51 +0200
From: Konstantin Kletschke <lists@ku-gbr.de>
To: linux-mtd@lists.infradead.org
Subject: Re: General performance of NAND operations i.e mount and ls
Message-ID: <20070907074450.GB2143@z1.synertronixx>
References: <20070906081215.GA5693@anita.doom>
	<1189067241.14370.23.camel@sauron>
	<20070906084418.GC2164@z1.synertronixx>
	<1189069864.14370.34.camel@sauron>
	<1189077119.14370.52.camel@sauron>
	<20070906160357.GG2164@z1.synertronixx>
	<1189144034.14370.73.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1189144034.14370.73.camel@sauron>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 2007-09-07 08:47 +0300 schrieb Artem Bityutskiy:

> It is long because you enabled paranoid checks. One of them scans whole

Ah okay, "Extra self checks"...

> media and makes sure it is really empty and contains only 0xFFs. You may
> disable paranoid checks to make it faster.

I disabled these.

> Yeah, your flash driver is not OK. It reports 2 in mtd->subpage_sft, but
> it is unable to write in sub-page chunks (512 bytes) - it returns -EIO. 

Hm okay, this may be since this is my first NAND driver and its only a
couple of hours old, so its possible the case I messed up something.

> You should either teach it to write sub-pages (preferable) or report 0

I don't know how to implement these sub pages since I found no example
on how to do this yet, so I tried to disable them. I put a 0 into the
variable, but it is set to 2 in nand base:

        printk("mtd->subpage_sft is now %i\n", mtd->subpage_sft);
        if (!(chip->options & NAND_NO_SUBPAGE_WRITE) &&
            !(chip->cellinfo & NAND_CI_CELLTYPE_MSK)) {
                switch(chip->ecc.steps) {
                case 2:
                        mtd->subpage_sft = 1;
                        break;
                case 4:
                case 8:
                        mtd->subpage_sft = 2;
                        break;
                }
        }
        chip->subpagesize = mtd->writesize >> mtd->subpage_sft;
        printk("mtd->subpage_sft is now %i\n", mtd->subpage_sft);


gives:

NAND device: Manufacturer ID: 0x2c, Chip ID: 0xd3 (Micron NAND 1GiB 3,3V 8-bit)
2 NAND chips detected
mtd->subpage_sft is now 0
mtd->subpage_sft is now 2
Scanning device for bad blocks
Creating 1 MTD partitions on "NAND 1GiB 3,3V 8-bit":
0x00000000-0x80000000 : "NAND Flash"

Hm, I investigate where this comes from ATM.

Regards Konsti

PS.: Your examples of NAND performance are astonishing, but I don't see
where I even could waste performance on my setup :-)



-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
