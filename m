From: "Kyungmin Park" <kyungmin.park@samsung.com>
To: "'Pete MacKay'" <linux@architechnical.net>, <linux-mtd@lists.infradead.org>
References: <30183.69.30.123.186.1184801323.squirrel@architechnical.net>
Subject: RE: flash_eraseall -j / jffs2 oobfree / OneNAND
Date: Thu, 19 Jul 2007 09:05:49 +0900
Message-ID: <002201c7c998$98339dc0$e1ac580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-reply-to: <30183.69.30.123.186.1184801323.squirrel@architechnical.net>
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> 
> Looking at the latest mtd-utils.git pull I see that flash_eraseall -j
> truncates the cleanmarker to the length in the first oobfree structure,
> which is a bug for a segmented OOB like the OneNAND.  (It has a 3 free
> bytes at offset 2 and another 2 at offset 14 so it has to truncate to 5
> anyway).  This causes unnecessary erase cycles on the scan when I mount a
> jffs2 file system.

I will check it soon.

> 
> Also in onenand_base.c:onenand_fill_auto_oob there may be a bug (overrun)
> in checking free->length for the onenand_oob_32 structure, which only has
> 4 (< MTD_MAX_OOBFREE_ENTRIES) oobfree entries.

No, it also checks free->length with MTX_MAX_OOBFREE_ENTRIES together. So it doesn't overrun. 
E.g., The 'i' has 4, 4 < MTD_MAX_OOBFREE_ENTRIES is true, but free->length is false. So it exits the loop.

I checked it with onenand_sim. 

Thank you,
Kyungmin Park
