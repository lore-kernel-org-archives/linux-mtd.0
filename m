Received: from mailhost.rdmcorp.com ([204.225.180.10])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17sQ1D-0007sb-00
	for <linux-mtd@lists.infradead.org>; Fri, 20 Sep 2002 16:48:36 +0100
Received: from PARKER (10.1.2.1) by mailhost.rdmcorp.com (Worldmail 1.3.167) for linux-mtd@lists.infradead.org; 20 Sep 2002 11:53:14 -0400
From: "Jack Lu" <jlu@rdmcorp.com>
To: <linux-mtd@lists.infradead.org>
Subject: about jffs2's compression and cfi->fast_prog being turn off
Date: Mon, 20 May 2002 11:47:52 -0400
Message-ID: <DFEAJMIABOLKNEBOPGDHOEDLCBAA.jlu@rdmcorp.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi
	I read the paper posted on May5th 2001 by Vinip Malik, it says:

One down side to this is that if you are writing compressed data to the
system, the CPU will spend time trying to compress it further. At this time
of writing, compression cannot be turned off. There are some plans to
implement this feature however (even turn it off on a directory by directory
basis!).

Now I have set up the jffs2 file system using the latest source code
downloadded from website.

1. With this latest jffs2, can we turn  off the compression? If can , how
can we turn it?


By the way, our compression algorithm is the CCITT Group 4 compression of
bi-level image, the image written to a file with TIFF6.0 file format.

2. If we still use the jffs2 compression after we compress the image using
CCITT4 Group algorithm, could it help us to reduce  the size to store the
compressed image into the flash memory?

3. With the latest jffs2, the erase suspend is implemented for AMD CFI
chips, such as Am29Lv320MB?

4. The cfi_cmdset_0002.c file includes:

	if (cfi->fast_prog) {
		/* In cfi_amdstd_write() we frob the protection stuff
		   without paying any attention to the state machine.
		   This upsets in-progress erases. So we turn this flag
		   off for now till the code gets fixed. */
		printk(KERN_NOTICE "cfi_cmdset_0002: Disabling fast programming due to
code brokenness.\n");
		cfi->fast_prog = 0;
	}
Turnning off the cfi->fast_prog will affect the the time needed to program
the flahsh?


Thanks.
