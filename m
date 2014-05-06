Received: from mail-qc0-x230.google.com ([2607:f8b0:400d:c01::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WhUg1-0007Pu-3b
 for linux-mtd@lists.infradead.org; Tue, 06 May 2014 02:00:14 +0000
Received: by mail-qc0-f176.google.com with SMTP id r5so1993474qcx.35
 for <linux-mtd@lists.infradead.org>; Mon, 05 May 2014 18:59:50 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 6 May 2014 09:59:50 +0800
Message-ID: <CAE94FHEYeaAPG8WPEwA10KGopY3UJUjcOPZucpgaB8Vp51RbWw@mail.gmail.com>
Subject: [UBI] is ubi_self_check_all_ff() with mtd_read() return value not
 match?
From: Ted Juan <ted.juan@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

int ubi_self_check_all_ff(struct ubi_device *ubi, int pnum, int offset, int len)
{

         ............................  // skip

        err = mtd_read(ubi->mtd, addr, len, &read, buf);
        if (err && !mtd_is_bitflip(err)) {
                ubi_err("error %d while reading %d bytes from PEB
%d:%d, read %zd bytes",
                        err, len, pnum, offset, read);
                goto error;
        }

        err = ubi_check_pattern(buf, 0xFF, len);
        ........................... // skip
}

In the low level nand flash driver (nand_base.c), the nand_read_page()
always return "max_bitflips".
That will cause the above code something wrong, err = mtd_read(), err
is max_bitflips.
It will "goto error" but not got to check pattern 0xff.

Is it something wrong, or I am misunderstanding?

Thanks much.

regards,

Ted
