Received: from rv-out-0910.google.com ([209.85.198.189])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IVjej-0006il-SA
	for linux-mtd@lists.infradead.org; Thu, 13 Sep 2007 04:02:36 -0400
Received: by rv-out-0910.google.com with SMTP id c24so324466rvf
	for <linux-mtd@lists.infradead.org>;
	Thu, 13 Sep 2007 01:02:31 -0700 (PDT)
Message-ID: <6b5362aa0709130102o5042412fgab0e0558edc895c0@mail.gmail.com>
Date: Thu, 13 Sep 2007 13:32:31 +0530
From: "Brijesh Singh" <brijesh.s.singh@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: UBI : Atomic change LEB
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

I think there is a problem in atomic change LEB.
I was trying to think how ubi will behave when device is full.
Suppose device is full.And
LEBn maps to pebn
           i.e. Ln->pn
If we used automic_change_leb, wear-levelling has no free blocks as
all lebs are mapped to pebs.And no change in LEB is possible to any
LEB.
I think  we will need atleast one extra block at any instance of time
to avoid this situation.
This is similar to block movement situation where we need extra block
for block movement.

Code Snip:
    pnum = ubi_wl_get_peb(ubi, dtype);
>>Asking a new block before unmapping.
>>Wear-levelling has got no block.Logically we should get the block as
far as people are writing to Logical space provided by UBI

    if (pnum < 0) {
        ubi_free_vid_hdr(ubi, vid_hdr);
        leb_write_unlock(ubi, vol_id, lnum);
        return pnum;
    }

    dbg_eba("change LEB %d:%d, PEB %d, write VID hdr to PEB %d",
        vol_id, lnum, vol->eba_tbl[lnum], pnum);

    err = ubi_io_write_vid_hdr(ubi, pnum, vid_hdr);
    if (err) {
        ubi_warn("failed to write VID header to LEB %d:%d, PEB %d",
             vol_id, lnum, pnum);
        goto write_error;
    }

    err = ubi_io_write_data(ubi, buf, pnum, 0, len);
    if (err) {
        ubi_warn("failed to write %d bytes of data to PEB %d",
             len, pnum);
        goto write_error;
    }
>>>> Freeing the block after new is written to provide automicity..

    if (vol->eba_tbl[lnum] >= 0) {
        err = ubi_wl_put_peb(ubi, vol->eba_tbl[lnum], 1);
        if (err) {
            ubi_free_vid_hdr(ubi, vid_hdr);
            leb_write_unlock(ubi, vol_id, lnum);
            return err;
        }
    }

    vol->eba_tbl[lnum] = pnum;
    leb_write_unlock(ubi, vol_id, lnum);
    ubi_free_vid_hdr(ubi, vid_hdr);
    return 0;
