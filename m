Received: from e33.co.us.ibm.com ([32.97.110.131])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BgRpx-0002PT-Fi
	for linux-mtd@lists.infradead.org; Fri, 02 Jul 2004 13:28:34 -0400
From: Josh Boyer <jdub@us.ibm.com>
To: Brian T <btuch@usa.net>
In-Reply-To: <040801c46055$cbfae280$fd0ba8c0@briantpc>
References: <03c201c46041$57b3fa10$fd0ba8c0@briantpc>
	<040801c46055$cbfae280$fd0ba8c0@briantpc>
Content-Type: text/plain
Message-Id: <1088789302.3916.12.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Date: Fri, 02 Jul 2004 12:28:22 -0500
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: 2.6.x nettel.c compile problems
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2004-07-02 at 11:58, Brian T wrote:
> Now, I have JFFS2 support compiled into the kernel.  Any ideas on why it is
> only trying to mount the root fs as ext2 or minix?  I use ext2 for a ram
> disk, and minix is used for 128k BRAM.

No idea why yet, but I have the same problem.  I fixed it by specifying
rootfstype=jffs2 on the kernel command line.

In 2.4 it looped through all possible filesystems, not sure why it
doesn't do that now.  If I get around to figuring it out, I'll be sure
to let people know.

josh
