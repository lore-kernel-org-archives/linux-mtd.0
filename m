Received: from [69.28.251.93] (helo=b32.net)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O1mvu-0004jW-Mh
	for linux-mtd@lists.infradead.org; Tue, 13 Apr 2010 20:42:07 +0000
From: Kevin Cernekee <cernekee@gmail.com>
Date: Tue, 13 Apr 2010 13:30:08 -0700
Subject: [PATCH 0/2] MTD: Move reboot notifier from UBI to cfi_cmdset_0002
Message-Id: <4ccec90e21edfa387822b2cb71c886217c48b4e3@localhost.localdomain>
To: <dwmw2@infradead.org>, <dedekind1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org, saeed.bishara@gmail.com,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

During the last filesystem sync prior to rebooting, UBI/UBIFS typically
schedules a flash erase operation.  It is important to ensure that this
operation completes before restarting the system, for the following
reasons:

1) Some systems do not toggle the flash reset pin upon rebooting, so if
the flash is stuck in erase/program mode the bootloader will not come
back up.  This is especially likely on NOR flash devices since the erase
time can be 1-2 seconds.

2) While UBI is able to recover gracefully from partial erasures, that
doesn't mean it is a good idea to intentionally allow them to happen on
a regular basis.  At the minimum it will cause another unnecessary
erasure when the system comes back up.

3) It's not very polite to leave the hardware in an unclean state.

A reboot notifier was previously added to UBI to handle this condition,
but it caused problems with hibernation and does not handle the general
case of "flash operation in progress during reboot."  Some background
information can be found here:

http://lists.infradead.org/pipermail/linux-mtd/2010-March/029477.html

http://lkml.org/lkml/2009/6/9/16

http://lkml.org/lkml/2010/2/12/114

http://lkml.org/lkml/2010/2/12/144

Note that the bootloader cannot even begin execution if the NOR flash is
not in read array mode.  There is only one NOR flash chip on this system
and it contains both the bootloader and the Linux filesystems.  This is
not a bug in the bootloader.  Similar problems have been seen on other
boards:

http://www.mail-archive.com/davinci-linux-open-source@linux.davincidsp.com/msg14071.html

http://www.mail-archive.com/bk-commits-head@vger.kernel.org/msg06294.html

This set of patches adds a new reboot notifier to the AMD flash driver,
then removes the UBI reboot notifier.  I have verified that the new
scheme is equally effective in solving the original problem.
