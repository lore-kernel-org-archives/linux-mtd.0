Received: from inbox2.nyi.net ([64.147.100.114])
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I8vxY-0000J8-Qj
	for linux-mtd@lists.infradead.org; Thu, 12 Jul 2007 06:31:46 -0400
Received: from webmail.calsoftinc.com (mail.calsofthq.com [172.16.0.7])
	by mail.calsofthq.com (8.13.6/8.13.6) with ESMTP id l6CAVboq019693
	for <linux-mtd@lists.infradead.org>; Thu, 12 Jul 2007 16:01:37 +0530
Message-ID: <33922.172.16.0.34.1184236297.squirrel@webmail.calsoftinc.com>
Date: Thu, 12 Jul 2007 16:01:37 +0530 (IST)
Subject: UBI: io_write_path
From: brijesh.singh@calsoftinc.com
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
   I walked through eba_write path.I found that,if EBUSY or EAGAIN is
returned as err code from ubi_io_write_vid_hdr or ubi_io_write_data
,still the PEB is put back to wear-levelling.This is
unnecessary.Shouldn't it retry on same PEB again?
Code Snip:
----------------------------------------------------------------------------
retry:
	pnum = ubi_wl_get_peb(ubi, dtype);
	if (pnum < 0) {
		ubi_free_vid_hdr(ubi, vid_hdr);
		leb_write_unlock(ubi, vol_id, lnum);
		return pnum;
	}

	err = ubi_io_write_vid_hdr(ubi, pnum, vid_hdr);
	if (err) {
		ubi_warn("failed to write VID header to LEB %d:%d, PEB %d",
			 vol_id, lnum, pnum);
		goto write_error;
	}

	err = ubi_io_write_data(ubi, buf, pnum, offset, len);
	if (err) {
		ubi_warn("failed to write %d bytes at offset %d of LEB %d:%d, " "PEB
%d", len, offset, vol_id, lnum, pnum);
		goto write_error;
	}
...

write_error:
	if (err != -EIO || !ubi->bad_allowed) {
		ubi_ro_mode(ubi);
		leb_write_unlock(ubi, vol_id, lnum);
		ubi_free_vid_hdr(ubi, vid_hdr);
		return err;
	}

	/*
	 * Fortunately, this is the first write operation to this physical
	 * eraseblock, so just put it and request a new one. We assume that if
	 * this physical eraseblock went bad, the erase code will handle that.
	 */
	err = ubi_wl_put_peb(ubi, pnum, 1);
	if (err || ++tries > UBI_IO_RETRIES) {
		ubi_ro_mode(ubi);
		leb_write_unlock(ubi, vol_id, lnum);
		ubi_free_vid_hdr(ubi, vid_hdr);
		return err;
	}

	vid_hdr->sqnum = cpu_to_be64(next_sqnum(ubi));
	ubi_msg("try another PEB");
	goto retry;

-------------------------------------------------------------------------
Regards,
Brijesh
