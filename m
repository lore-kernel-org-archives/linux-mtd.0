Received: from ug-out-1314.google.com ([66.249.92.170])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KkNb2-0005BR-6Y
	for linux-mtd@lists.infradead.org; Mon, 29 Sep 2008 18:35:48 +0000
Received: by ug-out-1314.google.com with SMTP id k3so547089ugf.5
	for <linux-mtd@lists.infradead.org>;
	Mon, 29 Sep 2008 11:35:42 -0700 (PDT)
Message-ID: <1fc50b580809291135s3dbf8269ga12917d1b0b65e9e@mail.gmail.com>
Date: Mon, 29 Sep 2008 13:35:42 -0500
From: "Monte Copeland" <catboatmonte@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: just wondering about write_leb() in ubi/upd.c
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I just fixed a bug in our older UBI version and decided to check the
upstream.  Looking at the latest from kernel.org,
I see in the write_leb() function in ubi/upd.c:

        if (vol->vol_type == UBI_DYNAMIC_VOLUME) {
                len = ALIGN(len, ubi->min_io_size);
                memset(buf + len, 0xFF, len - len);   <---- memset zero bytes?

                len = ubi_calc_data_len(ubi, buf, len);
                if (len == 0) {
                        dbg_msg("all %d bytes contain 0xFF - skip", len);
                        return 0;
                }

                err = ubi_eba_write_leb(ubi, vol, lnum, buf, 0, len,
UBI_UNKNOWN);
        } else {


Monte
