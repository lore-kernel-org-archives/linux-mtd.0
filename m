Received: from sonolo.xs4all.nl ([80.126.206.91] helo=sendmail.metro.cx)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CZzrv-0003I8-Vo
	for linux-mtd@lists.infradead.org; Thu, 02 Dec 2004 17:56:13 -0500
Received: from dave.dh.sono (dave.dh.sono [10.1.2.5])
	by sendmail.metro.cx (8.13.1/8.13.1) with ESMTP id iB2Mu7Zc096351
	for <linux-mtd@lists.infradead.org>; Thu, 2 Dec 2004 22:56:07 GMT
Received: from dave.dh.sono (localhost [127.0.0.1])
	by dave.dh.sono (8.12.9-20030917/8.12.9) with ESMTP id iB2Mu7GT003674
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>; Thu, 2 Dec 2004 23:56:07 +0100
Received: (from gmc@localhost)
	by dave.dh.sono (8.12.9-20030917/8.12.9/Submit) id iB2Mu7R0003673
	for linux-mtd@lists.infradead.org; Thu, 2 Dec 2004 23:56:07 +0100
Date: Thu, 2 Dec 2004 23:56:07 +0100
From: "K.F.J. Martens" <gmc@metro.cx>
To: linux-mtd@lists.infradead.org
Message-ID: <20041202225607.GH3233@metro.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Horrible Bug? AMD29LV400BB with mtd in 2.6.10rc2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

I'm currently developing a flash file system for the TomTom GO, a car
navigation system that employs an ARM processor.

In it is an EON29LV400BB flash chip, which is entirely compatible with
AMD's AM29LV400BB.

Now, what I did was copy the AM29LV400BB definition in
mtd/chips/jedec_probe.c to a new definition in the struct amd_flash_info
array jedec_table like so:


        },{
                .mfr_id         = MANUFACTURER_EON, 
                .dev_id         = EON29LV400BB,
                .name           = "EON AM29LV400BB",
                .uaddr          = {
                        [0] = MTD_UADDR_0x0AAA_0x0555,  /* x8 */
                        [1] = MTD_UADDR_0x0555_0x02AA,  /* x16 */
                },
                .DevSize        = SIZE_512KiB,
                .CmdSet         = P_ID_AMD_STD,
                .NumEraseRegions= 4,
                .regions        = {
                        ERASEINFO(0x04000,1),
                        ERASEINFO(0x02000,2),
                        ERASEINFO(0x08000,1),
                        ERASEINFO(0x10000,7),
                }
        }, {



Now, here comes. This does not work, and the reason is that the x8 and
x16 addresses are swapped. It's a bit late now to hook up one of those
devices and paste the exact error message, but it was something along
the line of 'MTD jedec_match(): 0x0555 0x0aaa did not match'

If I reverse them like so:


                        [0] = MTD_UADDR_0x0555_0x02AA,  /* x8 */
                        [1] = MTD_UADDR_0x0AAA_0x0555,  /* x16 */



It works fine. So, am I crazy, or is there something wrong indeed with
the 2.6 code. A quick check against 2.4 (where I had the chip working
first) revealed that indeed the 2.4 code has the addresses the right
way. So unless someone can show me that i am indeed crazy, I suggest i
will come up with a patch one of these days that fixes these definitions
(and at the same time perhaps adds all the EON chips i know about).

If this is indeed wrong, I guess it is wrong for all the amd chips too,
as well as the compatible chips from fujitsu.

Am I the first to run this code?? Can't imagine this... 

Kind regards,

Koen Martens


-- 
K.F.J. Martens, Sonologic, http://www.sonologic.nl/
Networking, embedded systems, unix expertise, artificial intelligence.
Public PGP key: http://www.metro.cx/pubkey-gmc.asc
Wondering about the funny attachment your mail program
can't read? Visit http://www.openpgp.org/
