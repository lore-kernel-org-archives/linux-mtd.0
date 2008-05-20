Received: from rn-out-0910.google.com ([64.233.170.190])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JyGyk-00011R-9U
	for linux-mtd@lists.infradead.org; Tue, 20 May 2008 01:49:26 +0000
Received: by rn-out-0910.google.com with SMTP id s46so627001rnb.3
	for <linux-mtd@lists.infradead.org>;
	Mon, 19 May 2008 18:49:24 -0700 (PDT)
Message-ID: <9c9fda240805191849m6bdfd99fi7509c37128f5d989@mail.gmail.com>
Date: Tue, 20 May 2008 10:49:24 +0900
From: "Kyungmin Park" <kmpark@infradead.org>
Sender: kyungmin78@gmail.com
To: "Artem Bityutskiy" <Artem.Bityutskiy@nokia.com>,
	"Adrian Hunter" <ext-adrian.hunter@nokia.com>
Subject: Question about the 2-bit EDC scrubbing at UBI
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

In internal layout handling in UBI, it plans to scrub the LEB if the
2-bit EDC is found.
As you know, if the EDC is detected it can't trust which bit is wrong.
So it needs another handling.
But the code does as 1-bit ECC.

How do you think? Is that make a problem in use?

static struct ubi_vtbl_record *process_lvol(struct ubi_device *ubi,
                                            struct ubi_scan_info *si,
                                            struct ubi_scan_volume *sv)
{
        ...snip...
        dbg_msg("check layout volume");

        /* Read both LEB 0 and LEB 1 into memory */
        ubi_rb_for_each_entry(rb, seb, &sv->root, u.rb) {
                leb[seb->lnum] = vmalloc(ubi->vtbl_size);
                if (!leb[seb->lnum]) {
                        err = -ENOMEM;
                        goto out_free;
                }
                memset(leb[seb->lnum], 0, ubi->vtbl_size);

                err = ubi_io_read_data(ubi, leb[seb->lnum], seb->pnum, 0,
                                       ubi->vtbl_size);
                /* It has to check only 1-bit ECC not 2-bit EDC */
                if (err == UBI_IO_BITFLIPS || err == -EBADMSG) =>
should be 'if (err == UBI_IO_BITFLIPS)'
                        /* Scrub the PEB later */
                        seb->scrub = 1;
                else if (err)
                        goto out_free;
        }
        ...snip...
}

Thank you,
Kyungmin Park
