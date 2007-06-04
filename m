Received: from ug-out-1314.google.com ([66.249.92.170])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hv63g-0005AM-JX
	for linux-mtd@lists.infradead.org; Mon, 04 Jun 2007 02:29:00 -0400
Received: by ug-out-1314.google.com with SMTP id z36so658820uge
	for <linux-mtd@lists.infradead.org>;
	Sun, 03 Jun 2007 23:28:50 -0700 (PDT)
Message-ID: <646b5e90706032328i78c258f1ga27cd5ba92330b23@mail.gmail.com>
Date: Mon, 4 Jun 2007 08:28:50 +0200
From: "Hans Jorgensen" <hans.jorgensen.news@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: JFFS2, AT45DB642D dataflash and power failure
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Can JFFS2 handle that an entire flash page gets corrupted if a power
failure occurs while calling at91_dataflash_write/dataflash_write? If
not then there might be a problem with
at91_dataflash.c/mtd_dataflash.c

The story is as following:
I am using Linux kernel 2.6.12 + patch 2.6.12 (20/06-2005) from
maxim.org.za and trying to implement transaction based file access
with rollback functionality in a user-space application.

To prove that it would work during power failure I used a watchdog to
activate reset of the CPU and flashes.  It did not work.

As an attempt to make it work I modified at91_dataflash_write to use
the flash commands.
Buffer 1 Write + Buffer 1 to Main Memory Page Program without Built-in Erase
instead of
Main Memory Page Program Through Buffer 1 (which implicit includes an
erase page functionality)

Now it is working and that naturally leads to the question above.
A nice side effect of this change is that writing speed is increased.

Note: this change may not be a valid solution, as this is not the
recommended way of using the dataflash. It would require further
investigation before implementation.

Hans
