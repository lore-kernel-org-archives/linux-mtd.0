Received: from 71-19-161-253.dedicated.allstream.net ([71.19.161.253]
 helo=nsa.nbspaymentsolutions.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VJ3FY-0000kp-KI
 for linux-mtd@lists.infradead.org; Mon, 09 Sep 2013 15:19:44 +0000
Received: from DeadDuck (unknown [172.20.177.82])
 by nsa.nbspaymentsolutions.com (Postfix) with ESMTP id 5D7F23FC4BF
 for <linux-mtd@lists.infradead.org>; Mon,  9 Sep 2013 11:21:18 -0400 (EDT)
From: Bill Pringlemeir <bpringlemeir@nbsps.com>
To: linux-mtd@lists.infradead.org
Subject: UBI io.c self_check_peb_vid_hdr().
Date: Mon, 09 Sep 2013 11:16:27 -0400
Message-ID: <871u4yowj8.fsf@nbsps.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


This routine has,

static int self_check_peb_vid_hdr(const struct ubi_device *ubi, int pnum)
{
	int err;
	uint32_t crc, hdr_crc;
	struct ubi_vid_hdr *vid_hdr;
	void *p;
...
	crc = crc32(UBI_CRC32_INIT, vid_hdr, UBI_EC_HDR_SIZE_CRC);
                                                ^^^^

Shouldn't it be,

	crc = crc32(UBI_CRC32_INIT, vid_hdr, UBI_VID_HDR_SIZE_CRC);
                                                ^^^^^

Or are the structures assumed to be the same size?

Tia,
Bill Pringlemeir.
