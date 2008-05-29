Date: Thu, 29 May 2008 12:38:57 +0100 (BST)
From: Alexey Korolev <akorolev@infradead.org>
To: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Subject: [BUG] JFFS2 power loss recovery issues in 2.6.25, 2.6.26-rc
Message-ID: <alpine.LFD.1.10.0805291205480.22130@pentafluge.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, 

One of recent patches broke JFFS2 power loss recoverability.
We faced the issue in Linux 2.6.25 and 2.6.26-rc but not in 2.6.24,
2.6.23.

If to reboot platform during file write. And try to read it again rest
of file will contain trash. 
Issue is well reproducible on NAND, especially if to delete large file
before write and reboot.

We made some investigations for this issue and found commit number which
breaks JFFS2 power loss recoverability.
It is:  [JFFS2] Improve getdents vs. f_pos handling on NOR flash.
        http://git.infradead.org/mtd-2.6.git?a=commitdiff;h=15953580e79b58caefb107e77f218e009b9992e6

Currently we don't know why it breaks JFFS2 and how it could be fixed
except roll back. 
So I would much appreciate any ideas on how it could be fixed. 


Thanks
