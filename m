Received: from web40506.mail.yahoo.com ([66.218.78.123])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17yYxT-0005px-00
	for <linux-mtd@lists.infradead.org>; Mon, 07 Oct 2002 15:34:08 +0100
Message-ID: <20021007143335.5602.qmail@web40506.mail.yahoo.com>
Date: Mon, 7 Oct 2002 07:33:35 -0700 (PDT)
From: Sanjay Kumar <sankumar73@yahoo.com>
Subject: MTD access from user space problem
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

Hi,

On our Linux 2.4.2 board, we are using a 3.8 MB JFFS2 and 0.2 MB raw partition on flash.
For accessing the raw partition we are opening the MTD device and issuing write() and
ioctls() for erasing from user space. The problem is under stress i.e when lots of 
writes are hapenning in both the JFFS2 and raw partition; we get the following problem:

Last[2] is ffff, datum is 1962
Error writing new dnode : -5

Are there any restrictions in using MTD from the user space simultanesouly while JFFS2
is using it from the kernel space? We understand that this Linux kernel has the preliminary
JFFS2; if this is JFFS2 problem will it be resolved if we move to newer kernel?(we
have in mind 2.4.18)

Thanks
Sanjay

__________________________________________________
Do you Yahoo!?
Faith Hill - Exclusive Performances, Videos & More
http://faith.yahoo.com
