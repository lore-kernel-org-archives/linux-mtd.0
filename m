Received: from mail.free-electrons.com ([88.190.12.23])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QmNFv-0000aG-6A
	for linux-mtd@lists.infradead.org; Thu, 28 Jul 2011 09:51:52 +0000
Message-ID: <4E3131AE.7010408@free-electrons.com>
Date: Thu, 28 Jul 2011 11:53:50 +0200
From: David Wagner <david.wagner@free-electrons.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Linux Embedded <linux-embedded@vger.kernel.org>
Subject: Flash filesystems benchmarks
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

	Hello,

As a contract with the CELF, we (Free Electrons) developed a flash
filesystem benchmarking suite ; it tests ubifs, jffs2, yaffs2 and
squashfs(over UBI+two different block transition layers). It has been
run on a Calao USB-9263 board and a IGEPv2 board and on 2.6.38, .39 and
3.0 kernels.

The results are shown as histograms and two different reportings exists:
 * filesystem comparison for a given board/kernel couple
 * kernel comparison for a given board/filesystem couple

All the details are to be found at:
	http://elinux.org/Flash_Filesystem_Benchmarks
Direct link to the test protocol:
	http://elinux.org/Flash_Filesystem_Benchmarks_Protocol
Link to the gitorious page:
	https://gitorious.org/ffs-benchmarks/ffs-benchmarks

Reviews of the test protocol, pointers to incoherent results or any
other comment is welcome.
We will keep posting more results.


	David Wagner

-- 
David Wagner, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
