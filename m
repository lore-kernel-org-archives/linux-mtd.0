Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QXgAM-0001VT-Ik
	for linux-mtd@lists.infradead.org; Fri, 17 Jun 2011 21:01:23 +0000
Date: Fri, 17 Jun 2011 23:00:14 +0200
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Peter Barada <peter.barada@gmail.com>
Subject: Re: Problem with clean markers/partial writes on Micron 4-bit ECC NAND
Message-ID: <20110617210014.GA28332@parrot.com>
References: <4DFB9458.1030304@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4DFB9458.1030304@gmail.com>
Cc: Eric Nelson <eric.nelson@logicpd.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Peter Barada <peter.barada@logicpd.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 17, 2011 at 06:52:24PM +0100, Peter Barada wrote:
(...)
> The problem I'm running into with JFFS2 is that empty flash is first 
> marked with a clean marker into the OOB, and then a 2nd write to the 
> main data area is done (w/o an intervening erase) to that page with data 
> which corrupts the ECCs that were first modified by writing the cleanmarker.
> 
(...)
> 
> I believe I've figured out a workaround:
> 
> 1) Modify the ecclayout to add the other 8 bytes of the OOB that are NOT 
> ECCd *after* the 16 bytes that are ECCd (so the ecc layout looks like):
> 
(...)
> 2) Then set ops.ooboffs to 16 in jffs2_write_nand_cleanmarker and 
> jffs2_check_nand_cleanmarker.
> 
> This "offsets" the read/writes by 16 bytes to move the cleanmarker into 
> OOB bytes that do not perturb the ECCs, and so far it looks to work.
> 

OK, so now the cleanmarker is in an unprotected area; did you also patch
jffs2_check_nand_cleanmarker() so that it does its pattern comparison in a
bitflip-robust way (instead of just doing a memcmp) ?
I think you may also need to modify jffs2_check_oob_empty() to take into
account the new offset of your cleanmarker.

> However I feel this is a hack as our product will use two different NAND 
> chips, the other being a more traditional SLC that can use 1-bit hamming 
> for ECC (which does not ECC any bytes in the OOB).
> 
> How can I best code this into the MTD layer such that JFFS2 (and other 
> NAND FSs that does partial writes including OOB bytes) can understand 
> that some OOB bytes perturb the data area ECC?
> 
> I think adding a "non_ecc_oob_offset" variable to the ecclayout could 
> capture this nuance of the OOB/ECC interaction for this chip and JFFS2 
> could set ops.ooboffs to non_ecc_oob_offset in 
> jffs2_write_nand_cleanmarker and jffs2_check_nand_cleanmarker.

I believe JFFS2 only uses oob for its cleanmarker; then, maybe you could just
omit the ecc-protected bytes from the .oobfree list, like this:

  ecclayout = {
         eccbytes = 32,
         eccpos = { 8, 9, 10, 11, 12, 13, 14, 15,
                 24, 25, 26, 27, 28, 19, 30, 31,
                 40, 41, 42, 43, 44, 45, 46, 47,
                 56, 57, 58, 59, 60, 61, 62, 63},
         .oobfree = {
                 { .offset = 2,
                   .length = 2},
                 { .offset = 18,
                   .length = 2},
                 { .offset = 24,
                   .length = 2},
                 { .offset = 42,
                   .length = 2},
         },
};

and only modify jffs2_check_nand_cleanmarker() and jffs2_check_oob_empty()
so that they are robust to bitflips in unprotected oob bytes ?
Or are you also using on the same mtd device another filesystem requiring
protected oob bytes, like YAFFS2 ?
Regards,

Ivan
