Received: from mail.free-electrons.com ([88.190.12.23])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QOsxV-0000eh-Cq
	for linux-mtd@lists.infradead.org; Tue, 24 May 2011 14:51:46 +0000
Message-ID: <4DDBC64F.5070409@free-electrons.com>
Date: Tue, 24 May 2011 16:53:03 +0200
From: David Wagner <david.wagner@free-electrons.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Linux Embedded <linux-embedded@vger.kernel.org>
Subject: usefullness of a read-only block UBI interface ?
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

	Hello linux-mtd, -embedded and -fsdevel,

There are a lot of actively developed block filesystems out there, more
than flash filesystems. Read-only block FS can run with great perfs on
flash supports with the mtdblock interface (eg. SquashFS) but since it
doesn't handle bad blocks, read will fail when you hit one.

That's why we are considering the pros and cons of having a block
interface on top of UBI: UBI takes care of bad blocks and filesystems
above it don't have to worry about them.

An option could be to implement bad block handling in mtdblock but
then, there wouldn't be any wear-leveling.

In case of read-only filesystems, wear-leveling is not so important but
when read-only and read-write filesystems coexist, static wear-leveling
is important. And I understand that UBI implements static
wear-leveling. So it would make sense to have a block read-only
filesystem on top of UBI along with a ubifs read-write filesystem.


So, what do you think about that possibility ? Do you see alternative
approaches or other ways to address the problem of using read-only
oriented filesystems on flash (w/o reinventing the wheel) ?


Regards,
David.

--
David Wagner, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
